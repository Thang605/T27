# -*- coding: utf-8 -*-
import csv
import os
import re

# Template HTML
TEMPLATE = '''<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{name} - {title} - T27</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        :root{{--primary-blue:#004E89;--primary-orange:#FF6B35;--text-color:#333;--bg-light:#f8f9fa}}body{{font-family:'Inter',sans-serif;background-color:var(--bg-light);margin:0;padding:40px;display:flex;justify-content:center;align-items:flex-start;min-height:100vh}}.profile-card-horizontal{{background:white;max-width:1000px;width:100%;display:flex;text-align:left;box-shadow:0 5px 15px rgba(0,0,0,0.05);border-radius:8px;overflow:hidden}}.profile-image-section{{flex:0 0 450px;background-color:#ffffff;position:relative;display:flex;align-items:flex-start;justify-content:flex-start}}.profile-image{{width:100%;height:100%;object-fit:contain;object-position:top left;display:block;max-height:500px}}.profile-content-section{{flex:1;padding:40px;text-align:left}}.profile-name{{font-size:2.2em;color:var(--primary-blue);font-weight:700;margin:0 0 5px 0;line-height:1.2}}.profile-title{{font-size:1.1em;color:var(--primary-orange);font-weight:500;margin:0 0 25px 0;display:block}}.profile-description{{color:#555;line-height:1.6;margin-bottom:30px;font-size:0.95em}}.profile-details-list{{list-style:none;padding:0;margin:0}}.profile-detail-item{{display:flex;margin-bottom:15px;line-height:1.5}}.detail-bullet{{color:var(--primary-orange);font-size:1.2em;margin-right:15px;line-height:1;margin-top:2px}}.detail-content{{flex:1;color:#444;font-size:0.95em}}.detail-label{{font-weight:600;color:#666;margin-right:5px}}@media (max-width:768px){{.profile-card-horizontal{{flex-direction:column}}.profile-image-section{{flex:none;height:400px;width:100%;border-right:none;border-bottom:none}}.profile-content-section{{padding:30px 20px}}.profile-name{{font-size:1.8em}}}}
    </style>
</head>
<body>
    <div class="profile-card-horizontal">
        <div class="profile-image-section">
            <img src="../images/Hinh anh chuyen gia/{image}" alt="{name}" class="profile-image" onerror="this.src='data:image/svg+xml,%3Csvg xmlns=%22http://www.w3.org/2000/svg%22 width=%22350%22 height=%22500%22%3E%3Crect fill=%22%23D0E1F9%22 width=%22350%22 height=%22500%22/%3E%3Ctext fill=%22%23004E89%22 font-family=%22Arial%22 font-size=%2224%22 x=%2250%25%22 y=%2250%25%22 text-anchor=%22middle%22%3EẢnh Chuyên Gia%3C/text%3E%3C/svg%3E'">
        </div>
        <div class="profile-content-section">
            <h2 class="profile-name">{name}</h2>
            <span class="profile-title">{title}</span>
            <p class="profile-description">{description}</p>
            <ul class="profile-details-list">
                {details}
            </ul>
        </div>
    </div>
</body>
</html>'''

def slugify(text):
    """Convert Vietnamese text to URL-friendly slug"""
    text = text.lower()
    text = re.sub(r'[àáạảãâầấậẩẫăắằặẳẵ]', 'a', text)
    text = re.sub(r'[èéẹẻẽêềếệểễ]', 'e', text)
    text = re.sub(r'[ìíịỉĩ]', 'i', text)
    text = re.sub(r'[òóọỏõôồốộổỗơờớợởỡ]', 'o', text)
    text = re.sub(r'[ùúụủũưừứựửữ]', 'u', text)
    text = re.sub(r'[ỳýỵỷỹ]', 'y', text)
    text = re.sub(r'đ', 'd', text)
    text = re.sub(r'[^a-z0-9]+', '-', text)
    text = text.strip('-')
    return text

def create_expert_pages():
    csv_path = r'Input\Doi ngu chuyen gia\Doi ngu chuyen gia.csv'
    output_dir = r'wwwroot\doi-ngu-chuyen-gia'
    
    # Create output directory if not exists
    os.makedirs(output_dir, exist_ok=True)
    
    # Track unique experts
    processed = set()
    
    with open(csv_path, 'r', encoding='utf-8') as f:
        reader = csv.DictReader(f)
        
        for row in reader:
            name = row['Họ tên'].strip()
            
            # Skip if already processed or empty
            if not name or name in processed:
                continue
            
            processed.add(name)
            
            # Extract data
            title = row['Phân loại chuyên gia']
            position = row['Chức vụ']
            cert = row['Chứng chỉ']
            exp = row['Kinh nghiệm']
            specialty = row['Chuyên môn:']
            software = row['Kỹ năng phần mềm ']
            projects = row['Dự án tiêu biểu:']
            achievements = row['Thành tích nổi bật:']
            
            # Generate description
            description = f"Với {exp}, cùng {cert}, "
            if position:
                description += f"{('ông' if 'bà' not in name.lower() and 'thị' not in name.lower() else 'bà')} {name} đảm nhận vai trò {position} với chuyên môn trong {specialty}."
            
            # Build details HTML
            details_list = []
            if position:
                details_list.append(f'<li class="profile-detail-item"><span class="detail-bullet">•</span><div class="detail-content"><span class="detail-label">Chức vụ:</span> {position}</div></li>')
            if exp:
                details_list.append(f'<li class="profile-detail-item"><span class="detail-bullet">•</span><div class="detail-content"><span class="detail-label">Kinh nghiệm:</span> {exp}</div></li>')
            if specialty:
                details_list.append(f'<li class="profile-detail-item"><span class="detail-bullet">•</span><div class="detail-content"><span class="detail-label">Chuyên môn:</span> {specialty}</div></li>')
            if cert:
                cert_lines = '<br>'.join([f'- {line.strip()}' for line in cert.split('\\n') if line.strip()])
                details_list.append(f'<li class="profile-detail-item"><span class="detail-bullet">•</span><div class="detail-content"><span class="detail-label">Chứng chỉ:</span><br>{cert_lines}</div></li>')
            if software:
                details_list.append(f'<li class="profile-detail-item"><span class="detail-bullet">•</span><div class="detail-content"><span class="detail-label">Kỹ năng phần mềm:</span> {software}</div></li>')
            if projects:
                proj_lines = '<br>'.join([f'- {line.strip()}' for line in projects.split('\\n') if line.strip()])
                details_list.append(f'<li class="profile-detail-item"><span class="detail-bullet">•</span><div class="detail-content"><span class="detail-label">Dự án tiêu biểu:</span><br>{proj_lines}</div></li>')
            if achievements:
                ach_lines = '<br>'.join([f'- {line.strip()}' for line in achievements.split('\\n') if line.strip()])
                details_list.append(f'<li class="profile-detail-item"><span class="detail-bullet">•</span><div class="detail-content"><span class="detail-label">Thành tích nổi bật:</span><br>{ach_lines}</div></li>')
            
            details_html = '\n                '.join(details_list)
            
            # Generate filename
            filename = slugify(name) + '.html'
            
            # Create HTML
            html = TEMPLATE.format(
                name=name,
                title=title,
                description=description,
                image=name + '.jpg',  # Default image name
                details=details_html
            )
            
            # Write file
            output_path = os.path.join(output_dir, filename)
            with open(output_path, 'w', encoding='utf-8') as out:
                out.write(html)
            
            print(f"Created: {filename}")

if __name__ == '__main__':
    create_expert_pages()
    print("\nDone! All expert pages have been created.")
