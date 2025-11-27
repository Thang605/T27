# 🔄 Hướng dẫn đồng bộ dự án T27-WEB giữa 2 máy tính

## 📋 Tổng quan

Dự án T27-WEB được đồng bộ giữa máy công ty và máy nhà thông qua **2 cơ chế**:

1. **Dropbox** - Tự động đồng bộ file
2. **Git** - Quản lý version và backup

## ⚠️ Quan trọng

**Luôn chạy scripts từ thư mục dự án:**

```powershell
cd "c:\Users\thang\Dropbox\DATA\T27\19. Google antigravity\T27-WEB"
```

## 🎯 Workflow khuyến nghị

### Khi BẮT ĐẦU làm việc (trên máy mới)

```powershell
# Kiểm tra trạng thái
.\sync-status.ps1

# Pull code mới nhất từ Git
.\sync-pull.ps1
```

### Khi KẾT THÚC làm việc (trước khi tắt máy)

```powershell
# Commit và push code
.\sync-push.ps1

# Hoặc với custom message
.\sync-push.ps1 -Message "Hoàn thành tính năng X"
```

### Kiểm tra trạng thái bất kỳ lúc nào

```powershell
.\sync-status.ps1
```

## 📝 Scripts có sẵn

### `sync-pull.ps1`
- Pull code mới nhất từ Git
- Tự động stash thay đổi chưa commit (nếu có)
- Hỏi có muốn apply stash sau khi pull

### `sync-push.ps1`
- Add tất cả thay đổi
- Commit với message tự động hoặc custom
- Pull trước khi push (tránh conflict)
- Push lên remote

### `sync-status.ps1`
- Hiển thị branch hiện tại
- Thay đổi chưa commit
- Commits chưa push
- Commits chưa pull
- Commit gần nhất

## ⚙️ Cấu hình đã thực hiện

### `.gitignore` đã được cập nhật để ignore:
- ✅ `bin/`, `obj/`, `publish/` - Build artifacts
- ✅ `.firebase/` - Firebase cache
- ✅ `.vs/`, `.vscode/settings.json` - IDE settings
- ✅ `*.log` - Log files
- ✅ `node_modules/` - Dependencies
- ✅ Các file tạm khác

### Dropbox sẽ tự động đồng bộ:
- ✅ Source code (`.cs`, `.html`, `.css`, `.js`)
- ✅ Configuration files
- ✅ Documentation
- ✅ Scripts

## 🚨 Xử lý Conflicts

### Nếu có conflict khi pull:

```powershell
# 1. Xem file bị conflict
git status

# 2. Mở file và resolve conflict (tìm <<<<<<, ======, >>>>>>)

# 3. Sau khi resolve, add và commit
git add .
git commit -m "Resolved conflicts"

# 4. Push
git push
```

### Nếu có conflict khi push:

```powershell
# Script sync-push.ps1 sẽ tự động pull trước khi push
# Nếu vẫn có conflict, làm theo hướng dẫn trên
```

## 💡 Tips

### 1. Luôn pull trước khi bắt đầu làm việc
```powershell
.\sync-pull.ps1
```

### 2. Commit thường xuyên
```powershell
# Sau mỗi tính năng nhỏ hoặc fix bug
.\sync-push.ps1 -Message "Fix bug X"
```

### 3. Kiểm tra trạng thái trước khi tắt máy
```powershell
.\sync-status.ps1
```

### 4. Sử dụng message có ý nghĩa
```powershell
# ❌ Tránh
.\sync-push.ps1 -Message "update"

# ✅ Nên
.\sync-push.ps1 -Message "Thêm trang đội ngũ chuyên gia"
```

## 🔧 Troubleshooting

### Dropbox chưa sync xong
- Đợi Dropbox sync xong (icon màu xanh)
- Sau đó mới chạy `sync-pull.ps1`

### Git báo lỗi authentication
```powershell
# Cấu hình Git credentials
git config --global credential.helper store
git pull  # Nhập username/password một lần
```

### Muốn xem lịch sử commits
```powershell
git log --oneline --graph --all -10
```

### Muốn undo commit gần nhất (chưa push)
```powershell
git reset --soft HEAD~1
```

## 📞 Quy trình khuyến nghị hàng ngày

### Buổi sáng (bắt đầu làm việc):
1. Mở Dropbox, đợi sync xong
2. Chạy `.\sync-status.ps1` để kiểm tra
3. Chạy `.\sync-pull.ps1` để lấy code mới nhất
4. Bắt đầu code

### Buổi tối (kết thúc làm việc):
1. Chạy `.\sync-push.ps1` để commit & push
2. Đợi Dropbox sync xong
3. Tắt máy

### Khi chuyển máy (từ công ty về nhà hoặc ngược lại):
1. Trên máy cũ: Chạy `.\sync-push.ps1`
2. Đợi Dropbox sync
3. Trên máy mới: Chạy `.\sync-pull.ps1`
4. Tiếp tục làm việc

## ✅ Lợi ích của hệ thống này

- 🔄 **Tự động**: Dropbox tự động sync file
- 📚 **Lịch sử**: Git lưu toàn bộ lịch sử thay đổi
- 🔒 **An toàn**: Backup trên cả Dropbox và Git
- 🚀 **Đơn giản**: Chỉ cần chạy 2-3 lệnh
- ⚡ **Nhanh**: Không cần setup phức tạp

---

**Lưu ý**: Hệ thống này kết hợp tốt nhất của cả 2 phương án:
- Dropbox cho sự tiện lợi
- Git cho quản lý version và collaboration
