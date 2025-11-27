import os
import re

base_path = r"c:\Users\thang\Dropbox\DATA\T27\19. Google antigravity\T27\wwwroot\doi-ngu-chuyen-gia"
files = [
    "le-thien-vinh.html",
    "le-trong-nhan.html",
    "le-truong-kinh-thy.html",
    "le-vo-quoc-anh.html",
    "luong-tan-an.html",
    "mai-thanh-dat.html",
    "nguyen-chien-thang.html",
    "nguyen-cong-dung.html",
    "nguyen-dinh-chau.html",
    "nguyen-ho-kim-vinh.html"
]

new_css = """
        body {
            font-family: 'Inter', sans-serif;
            background-color: var(--bg-light);
            margin: 0;
            padding: 0;
            min-height: 100vh
        }

        .profile-wrapper {
            padding: 40px 40px 40px;
            display: flex;
            justify-content: center;
            align-items: flex-start;
        }

        /* Back Button Section */
        .back-button-section {
            background: white;
            padding: 30px 40px;
            text-align: center;
            border-top: 1px solid #e0e0e0;
        }

        .back-button {
            display: inline-flex;
            align-items: center;
            gap: 10px;
            padding: 14px 32px;
            background: var(--primary-blue);
            color: white;
            text-decoration: none;
            border-radius: 4px;
            font-weight: 600;
            font-size: 1em;
            transition: all 0.3s ease;
            border: none;
            cursor: pointer;
        }

        .back-button:hover {
            background: #003d6b;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(0, 78, 137, 0.3);
        }

        .back-button::before {
            content: '←';
            font-size: 1.3em;
        }
"""

media_query_addition = """
            .profile-wrapper {
                padding: 20px 20px 20px;
            }
"""

back_button_html = """
    </div>

    <!-- Back Button Section -->
    <div class="back-button-section">
        <a href="../doi-ngu-chuyen-gia.html" class="back-button">Quay lại danh sách chuyên gia</a>
    </div>

    <script src="../js/app.js"></script>
</body>
"""

for filename in files:
    filepath = os.path.join(base_path, filename)
    if not os.path.exists(filepath):
        print(f"File not found: {filename}")
        continue
    
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()

    # Check if already processed
    if 'back-button-section' in content:
        print(f"Skipping {filename} - already has back button")
        continue

    # 1. Replace Body CSS
    # Regex to match body { ... } allowing for variations in whitespace and content
    content = re.sub(r'body\s*\{[^}]+\}', 'BODY_PLACEHOLDER', content)
    content = content.replace('BODY_PLACEHOLDER', new_css.strip())

    # 2. Add Media Query for wrapper
    # Insert at the beginning of the media query block
    content = re.sub(r'@media\s*\(max-width:\s*768px\)\s*\{', '@media (max-width:768px) {\n' + media_query_addition, content)

    # 3. Wrap content in profile-wrapper
    # Find the start of profile-card-horizontal
    if '<div class="profile-card-horizontal">' in content:
        content = content.replace('<div class="profile-card-horizontal">', '<div class="profile-wrapper">\n        <div class="profile-card-horizontal">')
    
    # 4. Close wrapper and add back button
    # Find the last </div> before </body>
    if '</body>' in content:
        parts = content.rsplit('</body>', 1)
        body_content = parts[0]
        post_body = parts[1]
        
        last_div_index = body_content.rfind('</div>')
        if last_div_index != -1:
            pre_div = body_content[:last_div_index]
            # We replace the last </div> and everything after it (up to </body>) with our new html
            # Note: back_button_html includes </body>
            content = pre_div + '    </div>' + back_button_html + post_body
        else:
            print(f"Warning: Could not find closing div in {filename}")
            continue
    else:
        print(f"Warning: Could not find </body> in {filename}")
        continue

    with open(filepath, 'w', encoding='utf-8') as f:
        f.write(content)
    
    print(f"Updated {filename}")
