---
description: Đồng bộ code giữa 2 máy tính
---

# Workflow đồng bộ T27-WEB

Dự án T27-WEB sử dụng **Dropbox + Git** để đồng bộ giữa máy công ty và máy nhà.

## Khi BẮT ĐẦU làm việc

```powershell
# 1. Kiểm tra trạng thái
.\sync-status.ps1

# 2. Pull code mới nhất
// turbo
.\sync-pull.ps1
```

## Khi KẾT THÚC làm việc

```powershell
# Commit và push tất cả thay đổi
.\sync-push.ps1
```

Hoặc với custom message:

```powershell
.\sync-push.ps1 -Message "Hoàn thành tính năng X"
```

## Kiểm tra trạng thái

```powershell
// turbo
.\sync-status.ps1
```

## Xử lý conflict

Nếu có conflict khi pull hoặc push:

```powershell
# 1. Xem file bị conflict
git status

# 2. Mở file và resolve (tìm <<<<<<, ======, >>>>>>)

# 3. Add và commit
git add .
git commit -m "Resolved conflicts"

# 4. Push
git push
```

## Chi tiết

Xem file `SYNC_GUIDE.md` để biết thêm chi tiết và troubleshooting.
