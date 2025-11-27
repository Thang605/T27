# GitHub Pages Troubleshooting Script
# Ch?y script này ?? ki?m tra và s?a l?i 404

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  GitHub Pages 404 Troubleshooter      " -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Step 1: Check Git status
Write-Host "[1/5] Checking Git repository..." -ForegroundColor Yellow
if (!(Test-Path ".git")) {
    Write-Host "ERROR: Not a git repository!" -ForegroundColor Red
    exit 1
}
Write-Host "? Git repository OK" -ForegroundColor Green
Write-Host ""

# Step 2: Check if .nojekyll exists
Write-Host "[2/5] Checking .nojekyll file..." -ForegroundColor Yellow
if (!(Test-Path "wwwroot\.nojekyll")) {
    Write-Host "WARNING: .nojekyll not found in wwwroot!" -ForegroundColor Yellow
    Write-Host "Creating .nojekyll file..." -ForegroundColor Yellow
    New-Item -Path "wwwroot\.nojekyll" -ItemType File -Force | Out-Null
    Write-Host "? .nojekyll created" -ForegroundColor Green
} else {
    Write-Host "? .nojekyll exists" -ForegroundColor Green
}
Write-Host ""

# Step 3: Check workflow file
Write-Host "[3/5] Checking GitHub Actions workflow..." -ForegroundColor Yellow
if (!(Test-Path ".github\workflows\deploy.yml")) {
    Write-Host "ERROR: deploy.yml not found!" -ForegroundColor Red
    exit 1
}
Write-Host "? Workflow file exists" -ForegroundColor Green
Write-Host ""

# Step 4: Create empty commit to trigger deployment
Write-Host "[4/5] Triggering GitHub Pages deployment..." -ForegroundColor Yellow
Write-Host "Creating empty commit..." -ForegroundColor White
git commit --allow-empty -m "Trigger GitHub Pages deployment - Fix 404"
if ($LASTEXITCODE -ne 0) {
    Write-Host "ERROR: Failed to create commit!" -ForegroundColor Red
    exit 1
}
Write-Host "? Empty commit created" -ForegroundColor Green
Write-Host ""

Write-Host "Pushing to GitHub..." -ForegroundColor White
git push origin main
if ($LASTEXITCODE -ne 0) {
    Write-Host "ERROR: Failed to push!" -ForegroundColor Red
    exit 1
}
Write-Host "? Pushed to GitHub" -ForegroundColor Green
Write-Host ""

# Step 5: Instructions
Write-Host "[5/5] Next steps..." -ForegroundColor Yellow
Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "         IMPORTANT STEPS!               " -ForegroundColor Yellow
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "1. Go to GitHub Pages Settings:" -ForegroundColor White
Write-Host "   https://github.com/ntp224/T27-WEB/settings/pages" -ForegroundColor Cyan
Write-Host ""
Write-Host "2. Make sure 'Source' is set to: GitHub Actions" -ForegroundColor White
Write-Host "   (NOT 'Deploy from a branch')" -ForegroundColor Yellow
Write-Host ""
Write-Host "3. Check deployment status:" -ForegroundColor White
Write-Host "   https://github.com/ntp224/T27-WEB/actions" -ForegroundColor Cyan
Write-Host ""
Write-Host "4. Wait 1-2 minutes for deployment to complete" -ForegroundColor White
Write-Host ""
Write-Host "5. Try accessing your website again:" -ForegroundColor White
Write-Host "   https://ntp224.github.io/T27-WEB/" -ForegroundColor Cyan
Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

$openSettings = Read-Host "Do you want to open GitHub Pages Settings now? (Y/N)"
if ($openSettings -eq "Y" -or $openSettings -eq "y") {
    Start-Process "https://github.com/ntp224/T27-WEB/settings/pages"
}

$openActions = Read-Host "Do you want to open GitHub Actions to check status? (Y/N)"
if ($openActions -eq "Y" -or $openActions -eq "y") {
    Start-Process "https://github.com/ntp224/T27-WEB/actions"
}

Write-Host ""
Write-Host "Press any key to exit..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
