# PowerShell Script to Generate Expert Team Page with 51 Real Experts
# Created: 2025-11-27

$ErrorActionPreference = "Stop"

Write-Host "=== Generating Expert Team Page ===" -ForegroundColor Cyan
Write-Host ""

# Paths
$csvPath = "Input\Doi ngu chuyen gia\Doi ngu chuyen gia.csv"
$templatePath = "wwwroot\doi-ngu-chuyen-gia.html"
$outputPath = "wwwroot\doi-ngu-chuyen-gia-updated.html"

# Function to convert Vietnamese to slug - Simple version
function ConvertTo-Slug {
    param([string]$text)
    
    $slug = $text.ToLower()
    $slug = $slug -replace 'đ', 'd'
    $slug = $slug -replace '[áàảãạăắằẳẵặâấầẩẫậ]', 'a'
    $slug = $slug -replace '[éèẻẽẹêếềểễệ]', 'e'
    $slug = $slug -replace '[íìỉĩị]', 'i'
    $slug = $slug -replace '[óòỏõọôốồổỗộơớờởỡợ]', 'o'
    $slug = $slug -replace '[úùủũụưứừửữự]', 'u'
    $slug = $slug -replace '[ýỳỷỹỵ]', 'y'
    $slug = $slug -replace '[^a-z0-9\s-]', ''
    $slug = $slug -replace '\s+', '-'
    $slug = $slug -replace '-+', '-'
    $slug = $slug.Trim('-')
    
    return $slug
}

# Function to determine expertise category
function Get-ExpertiseSlug {
    param([string]$category)
    
    if ($category -match 'Kh.o s.t|Thi.t k.') { return 'khao-sat-thiet-ke' }
    if ($category -match 'BIM|C.ng ngh.') { return 'bim' }
    if ($category -match 'Gi.m s.t') { return 'giam-sat' }
    if ($category -match 'Ki.m .nh') { return 'kiem-dinh' }
    if ($category -match 'L.a ch.n|Nh. th.u') { return 'lua-chon-nha-thau' }
    
    return ''
}

# Read CSV
Write-Host "Reading CSV file..." -ForegroundColor Yellow
$csvData = Import-Csv -Path $csvPath -Encoding UTF8

# Process unique experts
$uniqueExperts = @{}
$experts = @()

foreach ($row in $csvData) {
    $name = $row.'Họ tên'.Trim()
    
    if ($name -and $name -ne 'Họ tên' -and -not $uniqueExperts.ContainsKey($name)) {
        $uniqueExperts[$name] = $true
        
        $slug = ConvertTo-Slug -text $name
        $category = $row.'Phân loại chuyên gia'.Trim()
        $position = $row.'Chức vụ'.Trim()
        $expertiseText = $row.'Chuyên môn:'.Trim()
        $experience = $row.'Kinh nghiệm'.Trim()
        
        $expertiseSlug = Get-ExpertiseSlug -category $category
        
        $experts += [PSCustomObject]@{
            Name          = $name
            Slug          = $slug
            Category      = $category
            Position      = $position
            Expertise     = $expertiseText
            Experience    = $experience
            ExpertiseSlug = $expertiseSlug
        }
    }
}

Write-Host "Found $($experts.Count) unique experts" -ForegroundColor Green
Write-Host ""

# Generate expert cards HTML
Write-Host "Generating expert cards HTML..." -ForegroundColor Yellow
$cardsHtml = ""

foreach ($expert in $experts) {
    $imagePath = "images/Hinh anh chuyen gia/$($expert.Name).jpg"
    
    # Create short description
    $description = ""
    if ($expert.Experience) { $description += $expert.Experience }
    if ($expert.Expertise -and $description) { $description += " - " }
    if ($expert.Expertise) { $description += $expert.Expertise }
    
    if (-not $description) {
        $description = $expert.Category
    }
    
    # Escape HTML in description
    $description = $description -replace '<', '&lt;' -replace '>', '&gt;'
    
    $svgFallback = "data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='400' height='280'%3E%3Crect fill='%231e5366' width='400' height='280'/%3E%3Ctext fill='white' font-family='Arial' font-size='20' x='50%25' y='50%25' text-anchor='middle' dy='.3em'%3EChuyên gia%3C/text%3E%3C/svg%3E"
    
    $cardsHtml += @"
            <!-- $($expert.Name) -->
            <div class="expert-card" data-expertise="$($expert.ExpertiseSlug)" data-specialty="giao-thong" data-level="">
                <div class="expert-image-wrapper">
                    <img src="$imagePath" alt="$($expert.Name)" class="expert-image"
                        onerror="this.src='$svgFallback'">
                </div>
                <div class="expert-content">
                    <h3 class="expert-name">$($expert.Name)</h3>
                    <p class="expert-title">$($expert.Position)</p>
                    <p class="expert-specialties">$description</p>
                    <a href="doi-ngu-chuyen-gia/$($expert.Slug).html" class="view-more">Xem chi tiết</a>
                </div>
            </div>

"@
}

# Read template file
Write-Host "Reading template file..." -ForegroundColor Yellow
$templateContent = Get-Content -Path $templatePath -Raw -Encoding UTF8

# Find and replace expert cards section
Write-Host "Replacing expert cards section..." -ForegroundColor Yellow

# Find the start and end markers
$startMarker = '<div class="experts-grid" id="expertsGrid">'
$endMarker = '<!-- No Results Message -->'

$startIndex = $templateContent.IndexOf($startMarker)
$endIndex = $templateContent.IndexOf($endMarker)

if ($startIndex -eq -1 -or $endIndex -eq -1) {
    Write-Host "ERROR: Could not find expert cards section markers" -ForegroundColor Red
    exit 1
}

# Extract parts
$beforeCards = $templateContent.Substring(0, $startIndex + $startMarker.Length)
$afterCards = $templateContent.Substring($endIndex)

# Construct new content
$updatedContent = $beforeCards + "`n" + $cardsHtml + "        </div>`n`n        " + $afterCards

# Update results count
$updatedContent = $updatedContent -replace 'Showing <span class="number" id="resultsCount">\d+</span> experts', "Showing <span class=""number"" id=""resultsCount"">$($experts.Count)</span> experts"

# Write output file
Write-Host "Writing output file..." -ForegroundColor Yellow
[System.IO.File]::WriteAllText($outputPath, $updatedContent, [System.Text.Encoding]::UTF8)

Write-Host ""
Write-Host "=== SUCCESS ===" -ForegroundColor Green
Write-Host "Generated: $outputPath" -ForegroundColor Green
Write-Host "Total experts: $($experts.Count)" -ForegroundColor Green
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Cyan
Write-Host "1. Review: wwwroot\doi-ngu-chuyen-gia-updated.html" -ForegroundColor White
Write-Host "2. Backup original: doi-ngu-chuyen-gia.html -> doi-ngu-chuyen-gia-old.html" -ForegroundColor White
Write-Host "3. Rename updated file to: doi-ngu-chuyen-gia.html" -ForegroundColor White
Write-Host ""
