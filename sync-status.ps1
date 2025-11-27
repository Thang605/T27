# sync-status.ps1
Write-Host "=== T27-WEB Sync Status ===" -ForegroundColor Cyan
Write-Host ""

$branch = git rev-parse --abbrev-ref HEAD
Write-Host "Branch: $branch" -ForegroundColor Yellow
Write-Host ""

$status = git status --porcelain
if ($status) {
    Write-Host "Thay doi chua commit:" -ForegroundColor Yellow
    git status --short
} else {
    Write-Host "Khong co thay doi" -ForegroundColor Green
}
Write-Host ""

git fetch --quiet
$unpushed = git log origin/$branch..$branch --oneline 2>$null
if ($unpushed) {
    Write-Host "Commits chua push:" -ForegroundColor Yellow
    git log origin/$branch..$branch --oneline
} else {
    Write-Host "Khong co commits chua push" -ForegroundColor Green
}
Write-Host ""

$unpulled = git log $branch..origin/$branch --oneline 2>$null
if ($unpulled) {
    Write-Host "Commits chua pull:" -ForegroundColor Yellow
    git log $branch..origin/$branch --oneline
} else {
    Write-Host "Khong co commits chua pull" -ForegroundColor Green
}
Write-Host ""

Write-Host "Commit gan nhat:" -ForegroundColor Cyan
git log -1 --oneline
Write-Host ""
