# sync-pull.ps1
Write-Host "=== T27-WEB Sync Pull ===" -ForegroundColor Cyan
Write-Host ""

$status = git status --porcelain
if ($status) {
    Write-Host "Co thay doi chua commit!" -ForegroundColor Yellow
    git status --short
    Write-Host ""
    $response = Read-Host "Stash thay doi? (y/n)"
    if ($response -eq 'y') {
        git stash push -m "Auto-stash $(Get-Date -Format 'yyyy-MM-dd HH:mm')"
        Write-Host "Da stash" -ForegroundColor Green
    } else {
        Write-Host "Huy pull" -ForegroundColor Red
        exit 1
    }
}

Write-Host "Dang pull..." -ForegroundColor Cyan
git pull --rebase

if ($LASTEXITCODE -eq 0) {
    Write-Host "Pull thanh cong!" -ForegroundColor Green
    $stashList = git stash list
    if ($stashList) {
        Write-Host ""
        git stash list
        $apply = Read-Host "Apply stash? (y/n)"
        if ($apply -eq 'y') {
            git stash pop
        }
    }
} else {
    Write-Host "Pull that bai!" -ForegroundColor Red
}
