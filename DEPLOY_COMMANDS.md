# 🚀 Lệnh Deploy Firebase - Chạy Ngay

## Bước 1: Khởi Tạo Firebase Hosting

Mở PowerShell và chạy các lệnh sau:

```powershell
# Di chuyển đến thư mục T27
cd "c:\Users\thang\Dropbox\DATA\T27\19. Google antigravity\T27"

# Set execution policy (nếu cần)
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process -Force

# Khởi tạo Firebase Hosting
firebase init hosting
```

### Trả Lời Các Câu Hỏi:

1. **"Please select an option"**
   - Chọn: `Use an existing project`
   - (Dùng mũi tên ↑↓ để di chuyển, Enter để chọn)

2. **"Select a default Firebase project"**
   - Chọn: `t27` (hoặc project ID của bạn)
   - Nhấn Enter

3. **"What do you want to use as your public directory?"**
   - Nhập: `wwwroot`
   - Nhấn Enter

4. **"Configure as a single-page app (rewrite all urls to /index.html)?"**
   - Nhập: `N`
   - Nhấn Enter

5. **"Set up automatic builds and deploys with GitHub?"**
   - Nhập: `N`
   - Nhấn Enter

6. **"File wwwroot/index.html already exists. Overwrite?"**
   - Nhập: `N`
   - Nhấn Enter

✅ **Kết quả:** Bạn sẽ thấy "Firebase initialization complete!"

---

## Bước 2: Deploy Website

Sau khi init xong, chạy lệnh deploy:

```powershell
firebase deploy --only hosting
```

### Quá Trình Deploy:

1. ⏳ Firebase sẽ upload tất cả files từ `wwwroot`
2. 📊 Hiển thị tiến trình: `uploading...`
3. ✅ Sau 1-2 phút, deploy hoàn tất
4. 🎉 Hiển thị URLs:
   ```
   ✔  Deploy complete!
   
   Hosting URL: https://t27.web.app
   ```

---

## Bước 3: Truy Cập Website

Mở trình duyệt và truy cập:
- **URL chính**: https://t27.web.app
- **URL phụ**: https://t27.firebaseapp.com

(Nếu project ID khác `t27`, thay bằng project ID thực tế)

---

## ✅ Checklist Kiểm Tra

Sau khi truy cập website, kiểm tra:
- [ ] Trang chủ hiển thị đúng
- [ ] Logo và hình ảnh hiển thị
- [ ] Menu điều hướng hoạt động
- [ ] Các trang con truy cập được:
  - [ ] /gioi-thieu.html
  - [ ] /doi-ngu-chuyen-gia.html
  - [ ] /du-an.html
  - [ ] /tin-tuc.html
  - [ ] /lien-he.html

---

## 🔧 Xử Lý Lỗi

### Lỗi: "No project active"
```powershell
firebase use t27
```

### Lỗi: "Permission denied"
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process -Force
```

### Lỗi: "firebase: command not found"
- Đóng và mở lại PowerShell mới

---

## 📝 Ghi Chú

Sau khi deploy thành công, bạn có thể:
- Xem logs: `firebase hosting:channel:list`
- Deploy lại: `firebase deploy --only hosting`
- Xóa deploy cũ: `firebase hosting:clone SOURCE_SITE_ID:SOURCE_CHANNEL_ID TARGET_SITE_ID:live`

---

**Chúc bạn deploy thành công! 🎉**
