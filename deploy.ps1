# Deploy T27 Website to GitHub Pages
# Ch?y script này ?? t? ??ng push lên GitHub

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  T27 Website - GitHub Pages Deployer  " -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Check if git is installed
Write-Host "[1/6] Checking Git installation..." -ForegroundColor Yellow
if (!(Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Host "ERROR: Git is not installed!" -ForegroundColor Red
    Write-Host "Please install Git from: https://git-scm.com/download/win" -ForegroundColor Red
    exit 1
}
Write-Host "? Git is installed" -ForegroundColor Green
Write-Host ""

# Check if we're in a git repository
Write-Host "[2/6] Checking Git repository..." -ForegroundColor Yellow
if (!(Test-Path ".git")) {
    Write-Host "ERROR: Not a git repository!" -ForegroundColor Red
    Write-Host "Please run 'git init' first" -ForegroundColor Red
    exit 1
}
Write-Host "? Git repository found" -ForegroundColor Green
Write-Host ""

# Show current status
Write-Host "[3/6] Checking Git status..." -ForegroundColor Yellow
git status
Write-Host ""

# Prompt for commit message
Write-Host "[4/6] Enter commit message:" -ForegroundColor Yellow
$commitMessage = Read-Host "Commit message (press Enter for default)"
if ([string]::IsNullOrWhiteSpace($commitMessage)) {
    $commitMessage = "Update website - $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
}
Write-Host "? Commit message: $commitMessage" -ForegroundColor Green
Write-Host ""

# Add all files
Write-Host "[5/6] Adding files to git..." -ForegroundColor Yellow
git add .
if ($LASTEXITCODE -ne 0) {
    Write-Host "ERROR: Failed to add files!" -ForegroundColor Red
    exit 1
}
Write-Host "? Files added" -ForegroundColor Green
Write-Host ""

# Commit changes
Write-Host "Committing changes..." -ForegroundColor Yellow
git commit -m "$commitMessage"
if ($LASTEXITCODE -ne 0) {
    Write-Host "WARNING: Nothing to commit or commit failed" -ForegroundColor Yellow
    Write-Host "Continuing with push..." -ForegroundColor Yellow
}
Write-Host ""

# Push to GitHub
Write-Host "[6/6] Pushing to GitHub..." -ForegroundColor Yellow
git push origin main
if ($LASTEXITCODE -ne 0) {
    Write-Host "ERROR: Failed to push to GitHub!" -ForegroundColor Red
    Write-Host "Please check your network connection and GitHub credentials" -ForegroundColor Red
    exit 1
}
Write-Host "? Successfully pushed to GitHub" -ForegroundColor Green
Write-Host ""

# Success message
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "         DEPLOYMENT SUCCESSFUL!         " -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Your website will be available at:" -ForegroundColor White
Write-Host "https://ntp224.github.io/T27-WEB/" -ForegroundColor Cyan
Write-Host ""
Write-Host "Check deployment status at:" -ForegroundColor White
Write-Host "https://github.com/ntp224/T27-WEB/actions" -ForegroundColor Cyan
Write-Host ""
Write-Host "Deployment usually takes 1-2 minutes." -ForegroundColor Yellow
Write-Host ""

# Ask to open browser
$openBrowser = Read-Host "Do you want to open the Actions page? (Y/N)"
if ($openBrowser -eq "Y" -or $openBrowser -eq "y") {
    Start-Process "https://github.com/ntp224/T27-WEB/actions"
}

Write-Host ""
Write-Host "Press any key to exit..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
