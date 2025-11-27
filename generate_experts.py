import os
import re

# Paths
base_dir = r"C:\Users\thang\Dropbox\DATA\T27\19. Google antigravity\T27\wwwroot"
experts_dir = os.path.join(base_dir, "doi-ngu-chuyen-gia")
output_file = r"C:\Users\thang\Dropbox\DATA\T27\19. Google antigravity\T27\experts_grid_content.html"

# Filter mappings (simple keyword matching)
expertise_map = {
    "khảo sát": "khao-sat-thiet-ke",
    "thiết kế": "khao-sat-thiet-ke",
    "bim": "bim",
    "công nghệ số": "bim",
    "giám sát": "giam-sat",
    "kiểm định": "kiem-dinh",
    "đấu thầu": "lua-chon-nha-thau",
    "lựa chọn nhà thầu": "lua-chon-nha-thau"
}

def get_expertise_slug(text):
    text_lower = text.lower()
    for key, value in expertise_map.items():
        if key in text_lower:
            return value
    return "khao-sat-thiet-ke" # Default

def generate_expert_card(filename, content):
    try:
        # Extract details using Regex
        # Name: <h2 class="profile-name">Name</h2>
        name_match = re.search(r'<h2 class="profile-name">(.*?)</h2>', content)
        name = name_match.group(1).strip() if name_match else "Unknown Name"
        
        # Title: <span class="profile-title">Title</span>
        title_match = re.search(r'<span class="profile-title">(.*?)</span>', content)
        title = title_match.group(1).strip() if title_match else ""
        
        # Image: <img ... class="profile-image" ... src="..."> or src="..." ... class="profile-image"
        # This is a bit tricky with regex, but let's try a general pattern for the img tag with that class
        img_match = re.search(r'<img[^>]*class="profile-image"[^>]*src="([^"]*)"', content)
        if not img_match:
             img_match = re.search(r'<img[^>]*src="([^"]*)"[^>]*class="profile-image"', content)
        
        img_src = img_match.group(1) if img_match else ""
        
        # Fix image path: ../images/... -> images/...
        if img_src.startswith("../"):
            img_src = img_src[3:]
            
        # Extract specialties/experience
        # <p class="profile-description">...</p>
        desc_match = re.search(r'<p class="profile-description">(.*?)</p>', content, re.DOTALL)
        specialties = ""
        if desc_match:
            desc_text = desc_match.group(1).strip()
            # Remove HTML tags if any inside description (unlikely based on sample but good practice)
            desc_text = re.sub(r'<[^>]+>', '', desc_text)
            # Take first sentence or first 100 chars
            specialties = desc_text.split('.')[0] + "."
            specialties = specialties.replace('\n', ' ').strip()
        
        # Determine filters
        expertise_slug = get_expertise_slug(title)
        
        # HTML Template for Card
        card_html = f'''
            <!-- Expert Card: {name} -->
            <div class="expert-card" data-expertise="{expertise_slug}" data-specialty="" data-level="">
                <div class="expert-image-wrapper">
                    <img src="{img_src}" alt="{name}" class="expert-image"
                        onerror="this.src=\'images/placeholder-avatar.png\'">
                </div>
                <div class="expert-content">
                    <h3 class="expert-name">{name}</h3>
                    <p class="expert-title">{title}</p>
                    <p class="expert-specialties">{specialties}</p>
                    <a href="doi-ngu-chuyen-gia/{filename}" class="view-more">Xem chi tiết</a>
                </div>
            </div>
        '''
        return card_html
    except Exception as e:
        print(f"Error processing {filename}: {e}")
        return ""

def main():
    html_output = ""
    if not os.path.exists(experts_dir):
        print(f"Directory not found: {experts_dir}")
        return

    files = [f for f in os.listdir(experts_dir) if f.endswith(".html")]
    
    print(f"Found {len(files)} expert files.")
    
    for filename in files:
        file_path = os.path.join(experts_dir, filename)
        try:
            with open(file_path, "r", encoding="utf-8") as f:
                content = f.read()
                html_output += generate_expert_card(filename, content)
        except Exception as e:
            print(f"Failed to read {filename}: {e}")
            
    with open(output_file, "w", encoding="utf-8") as f:
        f.write(html_output)
    
    print(f"Generated HTML for {len(files)} experts to {output_file}")

if __name__ == "__main__":
    main()
