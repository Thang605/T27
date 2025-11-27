# sync-push.ps1
param([string]$Message = "")

Write-Host "=== T27-WEB Sync Push ===" -ForegroundColor Cyan
Write-Host ""

$status = git status --porcelain
if (-not $status) {
    Write-Host "Khong co thay doi" -ForegroundColor Green
    exit 0
}

Write-Host "Cac file thay doi:" -ForegroundColor Yellow
git status --short
Write-Host ""

if (-not $Message) {
    $Message = Read-Host "Commit message (Enter = auto)"
    if (-not $Message) {
        $Message = "Auto-sync from $env:COMPUTERNAME at $(Get-Date -Format 'yyyy-MM-dd HH:mm')"
    }
}

Write-Host "Dang commit..." -ForegroundColor Cyan
git add -A
git commit -m $Message

if ($LASTEXITCODE -ne 0) {
    Write-Host "Commit that bai" -ForegroundColor Red
    exit 1
}

Write-Host "Dang pull truoc khi push..." -ForegroundColor Cyan
git pull --rebase

if ($LASTEXITCODE -ne 0) {
    Write-Host "Co conflict!" -ForegroundColor Yellow
    exit 1
}

Write-Host "Dang push..." -ForegroundColor Cyan
git push

if ($LASTEXITCODE -eq 0) {
    Write-Host "Push thanh cong!" -ForegroundColor Green
} else {
    Write-Host "Push that bai!" -ForegroundColor Red
}
