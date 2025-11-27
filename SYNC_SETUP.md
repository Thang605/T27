# ⚙️ Thiết lập ban đầu cho hệ thống đồng bộ

## ⚠️ Quan trọng: Chạy từ thư mục dự án

Scripts chỉ hoạt động khi bạn **đang ở trong thư mục dự án**. Luôn chuyển về thư mục dự án trước:

```powershell
cd "c:\Users\thang\Dropbox\DATA\T27\19. Google antigravity\T27-WEB"
```

## Bước 1: Enable PowerShell Scripts

Scripts đồng bộ cần quyền thực thi PowerShell. Chạy lệnh sau **MỘT LẦN DUY NHẤT** trên mỗi máy:

### Cách 1: Cho phép scripts local (Khuyến nghị)

Mở PowerShell **với quyền Administrator** và chạy:

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

Sau đó bạn có thể chạy scripts trực tiếp:

```powershell
.\sync-status.ps1
.\sync-pull.ps1
.\sync-push.ps1
```

### Cách 2: Bypass mỗi lần chạy (Không cần Administrator)

Nếu không muốn thay đổi execution policy, chạy scripts với bypass:

```powershell
powershell -ExecutionPolicy Bypass -File .\sync-status.ps1
powershell -ExecutionPolicy Bypass -File .\sync-pull.ps1
powershell -ExecutionPolicy Bypass -File .\sync-push.ps1
```

## Bước 2: Kiểm tra Git configuration

Đảm bảo Git đã được cấu hình đúng:

```powershell
# Kiểm tra username và email
git config --global user.name
git config --global user.email

# Nếu chưa có, cấu hình:
git config --global user.name "Tên của bạn"
git config --global user.email "email@example.com"
```

## Bước 3: Kiểm tra remote repository

```powershell
# Xem remote URL
git remote -v

# Nếu cần update remote URL
# git remote set-url origin https://github.com/username/repo.git
```

## Bước 4: Test scripts

Sau khi enable execution policy, test các scripts:

```powershell
# Test kiểm tra trạng thái
.\sync-status.ps1

# Test pull (nếu có thay đổi trên remote)
.\sync-pull.ps1

# Test push (sau khi có thay đổi local)
.\sync-push.ps1
```

## Bước 5: Commit các file mới

Sau khi thiết lập xong, commit các file cấu hình mới:

```powershell
.\sync-push.ps1 -Message "Thiết lập hệ thống đồng bộ"
```

## ✅ Hoàn tất

Sau khi hoàn thành các bước trên trên **CẢ 2 MÁY**, bạn có thể:

1. ✅ Chạy `.\sync-status.ps1` để kiểm tra trạng thái
2. ✅ Chạy `.\sync-pull.ps1` khi bắt đầu làm việc
3. ✅ Chạy `.\sync-push.ps1` khi kết thúc làm việc

## 🔧 Troubleshooting

### Lỗi "running scripts is disabled"

- Chạy lại Bước 1 với quyền Administrator
- Hoặc dùng Cách 2 để bypass

### Lỗi Git authentication

```powershell
# Lưu credentials
git config --global credential.helper store

# Pull một lần để nhập credentials
git pull
```

### Dropbox chưa sync

- Kiểm tra icon Dropbox (phải màu xanh)
- Đợi sync hoàn tất trước khi chạy scripts

---

**Lưu ý**: Chỉ cần thiết lập MỘT LẦN trên mỗi máy. Sau đó sử dụng workflow trong `SYNC_GUIDE.md`.
