# PowerShell Script to Generate Expert Profile Pages
$ErrorActionPreference = "Stop"
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

# Read CSV file
$csvPath = "Input\Doi ngu chuyen gia\Doi ngu chuyen gia.csv"
$outputDir = "wwwroot\doi-ngu-chuyen-gia"

# Create output directory if not exists
if (-not (Test-Path $outputDir)) {
    New-Item -ItemType Directory -Path $outputDir -Force | Out-Null
}

# HTML Template
$template = @'
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{NAME} - {TITLE} - T27</title>
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
            <img src="../images/Hinh anh chuyen gia/{IMAGE}" alt="{NAME}" class="profile-image" onerror="this.src='data:image/svg+xml,%3Csvg xmlns=%22http://www.w3.org/2000/svg%22 width=%22350%22 height=%22500%22%3E%3Crect fill=%22%23D0E1F9%22 width=%22350%22 height=%22500%22/%3E%3Ctext fill=%22%23004E89%22 font-family=%22Arial%22 font-size=%2224%22 x=%2250%25%22 y=%2250%25%22 text-anchor=%22middle%22%3EẢnh Chuyên Gia%3C/text%3E%3C/svg%3E'">
        </div>
        <div class="profile-content-section">
            <h2 class="profile-name">{NAME}</h2>
            <span class="profile-title">{TITLE}</span>
            <p class="profile-description">{DESCRIPTION}</p>
            <ul class="profile-details-list">
{DETAILS}
            </ul>
        </div>
    </div>
</body>
</html>
'@

function Slugify($text) {
    $text = $text.ToLower()
    $text = $text -replace '[àáạảãâầấậẩẫăắằặẳẵ]', 'a'
    $text = $text -replace '[èéẹẻẽêềếệểễ]', 'e'
    $text = $text -replace '[ìíịỉĩ]', 'i'
    $text = $text -replace '[òóọỏõôồốộổỗơờớợởỡ]', 'o'
    $text = $text -replace '[ùúụủũưừứựửữ]', 'u'
    $text = $text -replace '[ỳýỵỷỹ]', 'y'
    $text = $text -replace 'đ', 'd'
    $text = $text -replace '[^a-z0-9]+', '-'
    $text = $text.Trim('-')
    return $text
}

# Read and process CSV
$experts = Import-Csv -Path $csvPath -Encoding UTF8
$processed = @{}
$count = 0

foreach ($expert in $experts) {
    $name = $expert.'Họ tên'.Trim()
    
    # Skip if empty or already processed
    if ([string]::IsNullOrWhiteSpace($name) -or $processed.ContainsKey($name)) {
        continue
    }
    
    $processed[$name] = $true
    $count++
    
    # Extract data
    $title = $expert.'Phân loại chuyên gia'
    $position = $expert.'Chức vụ'
    $cert = $expert.'Chứng chỉ'
    $exp = $expert.'Kinh nghiệm'
    $specialty = $expert.'Chuyên môn:'
    $software = $expert.'Kỹ năng phần mềm '
    $projects = $expert.'Dự án tiêu biểu:'
    $achievements = $expert.'Thành tích nổi bật:'
    
    # Determine gender pronoun
    $pronoun = if ($name -match '(Thị|bà)') { "bà" } else { "ông" }
    
    # Generate description
    $description = "Với $exp"
    if ($cert) { $description += ", cùng $cert" }
    if ($position) { $description += ", $pronoun $name đảm nhận vai trò $position" }
    if ($specialty) { $description += " với chuyên môn trong $specialty" }
    $description += "."
    
    # Build details
    $detailsList = @()
    if ($position) {
        $detailsList += '                <li class="profile-detail-item"><span class="detail-bullet">•</span><div class="detail-content"><span class="detail-label">Chức vụ:</span> ' + $position + '</div></li>'
    }
    if ($exp) {
        $detailsList += '                <li class="profile-detail-item"><span class="detail-bullet">•</span><div class="detail-content"><span class="detail-label">Kinh nghiệm:</span> ' + $exp + '</div></li>'
    }
    if ($specialty) {
        $detailsList += '                <li class="profile-detail-item"><span class="detail-bullet">•</span><div class="detail-content"><span class="detail-label">Chuyên môn:</span> ' + $specialty + '</div></li>'
    }
    if ($cert) {
        $certLines = ($cert -split "`n" | Where-Object { $_.Trim() } | ForEach-Object { "- " + $_.Trim() }) -join '<br>'
        $detailsList += '                <li class="profile-detail-item"><span class="detail-bullet">•</span><div class="detail-content"><span class="detail-label">Chứng chỉ:</span><br>' + $certLines + '</div></li>'
    }
    if ($software) {
        $detailsList += '                <li class="profile-detail-item"><span class="detail-bullet">•</span><div class="detail-content"><span class="detail-label">Kỹ năng phần mềm:</span> ' + $software + '</div></li>'
    }
    if ($projects) {
        $projLines = ($projects -split "`n" | Where-Object { $_.Trim() } | ForEach-Object { "- " + $_.Trim() }) -join '<br>'
        $detailsList += '                <li class="profile-detail-item"><span class="detail-bullet">•</span><div class="detail-content"><span class="detail-label">Dự án tiêu biểu:</span><br>' + $projLines + '</div></li>'
    }
    if ($achievements) {
        $achLines = ($achievements -split "`n" | Where-Object { $_.Trim() } | ForEach-Object { "- " + $_.Trim() }) -join '<br>'
        $detailsList += '                <li class="profile-detail-item"><span class="detail-bullet">•</span><div class="detail-content"><span class="detail-label">Thành tích nổi bật:</span><br>' + $achLines + '</div></li>'
    }
    
    $details = $detailsList -join "`n"
    
    # Find image file
    $imageFiles = Get-ChildItem -Path "wwwroot\images\Hinh anh chuyen gia" -Filter "*$name*"
    $imageName = if ($imageFiles.Count -gt 0) { $imageFiles[0].Name } else { "$name.jpg" }
    
    # Generate HTML
    $html = $template -replace '{NAME}', $name
    $html = $html -replace '{TITLE}', $title
    $html = $html -replace '{DESCRIPTION}', $description
    $html = $html -replace '{IMAGE}', $imageName
    $html = $html -replace '{DETAILS}', $details
    
    # Generate filename
    $filename = (Slugify $name) + '.html'
    $outputPath = Join-Path $outputDir $filename
    
    # Write file
    [System.IO.File]::WriteAllText($outputPath, $html, [System.Text.Encoding]::UTF8)
    
    Write-Host "Created: $filename"
}

Write-Host "`nCompleted! Created $count expert profile pages."
