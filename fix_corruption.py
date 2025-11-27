import os

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

for filename in files:
    filepath = os.path.join(base_path, filename)
    if not os.path.exists(filepath):
        print(f"File not found: {filename}")
        continue
    
    with open(filepath, 'r', encoding='utf-8') as f:
        lines = f.readlines()
    
    new_lines = []
    modified = False
    for line in lines:
        # Check for the specific garbage line pattern
        if '< !DOCTYPE html>' in line and ':root {' in line:
            print(f"Removing garbage line in {filename}")
            modified = True
            continue
        # Also check for just the doctype if it's on its own line inside style (less likely but possible)
        if line.strip().startswith('< !DOCTYPE html>'):
             print(f"Removing garbage line (doctype) in {filename}")
             modified = True
             continue
             
        new_lines.append(line)
        
    if modified:
        with open(filepath, 'w', encoding='utf-8') as f:
            f.writelines(new_lines)
        print(f"Fixed {filename}")
    else:
        print(f"No corruption found in {filename}")
