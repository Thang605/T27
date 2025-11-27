# 🔐 Hướng Dẫn Đăng Nhập và Deploy Firebase - Bước Tiếp Theo

## Tình Trạng Hiện Tại

✅ **Đã hoàn thành:**
- Node.js v24.11.1 và npm 11.6.2 đã cài đặt
- Firebase CLI đã cài đặt (753 packages)
- Repository đã copy sang thư mục T27
- Firebase Console đã mở tại: https://console.firebase.google.com/

⏳ **Đang chờ:**
- Đăng nhập Google/Firebase
- Tạo Firebase project
- Deploy website

## Các Bước Thực Hiện Ngay Bây Giờ

### Bước 1: Đăng Nhập Firebase Console (Trên Browser)

Trang Firebase Console đã mở sẵn và đang hiển thị trang đăng nhập Google.

**Hành động:**
1. Nhập email Google của bạn vào ô "Email or phone"
2. Click "Next"
3. Nhập mật khẩu
4. Click "Next"
5. Hoàn tất xác thực 2 bước nếu có

Sau khi đăng nhập thành công, bạn sẽ thấy Firebase Console dashboard.

### Bước 2: Đăng Nhập Firebase CLI (Trên PowerShell)

**Mở PowerShell mới** và chạy các lệnh sau:

```powershell
# Di chuyển đến thư mục T27
cd "c:\Users\thang\Dropbox\DATA\T27\19. Google antigravity\T27"

# Set execution policy
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process -Force

# Đăng nhập Firebase
firebase login
```

**Điều gì sẽ xảy ra:**
1. Một cửa sổ trình duyệt mới sẽ mở ra
2. Bạn sẽ được yêu cầu chọn tài khoản Google (chọn cùng tài khoản đã dùng ở Bước 1)
3. Cho phép Firebase CLI truy cập tài khoản của bạn
4. Sau khi thành công, terminal sẽ hiển thị "Success! Logged in as [your-email]"

### Bước 3: Tạo Firebase Project (Trên Firebase Console)

Quay lại tab Firebase Console đã đăng nhập:

1. Click nút **"Add project"** hoặc **"Create a project"**
2. Nhập tên project: **`T27`**
3. Click **"Continue"**
4. **Google Analytics**: Tắt toggle "Enable Google Analytics for this project" (không cần cho static website)
5. Click **"Create project"**
6. Đợi 30-60 giây để Firebase tạo project
7. Click **"Continue"** khi thấy "Your new project is ready"

**Lưu ý Project ID:**
- Firebase sẽ tự động tạo project ID (có thể là `t27` hoặc `t27-xxxxx` nếu `t27` đã được dùng)
- Ghi nhớ project ID này, bạn sẽ cần nó ở bước tiếp theo

### Bước 4: Khởi Tạo Firebase Hosting (Trên PowerShell)

Trong cùng cửa sổ PowerShell đã đăng nhập Firebase CLI:

```powershell
# Khởi tạo Firebase Hosting
firebase init hosting
```

**Trả lời các câu hỏi:**

1. **"Please select an option"**
   - Chọn: `Use an existing project` (dùng mũi tên ↑↓ để di chuyển, Enter để chọn)

2. **"Select a default Firebase project"**
   - Chọn project `t27` (hoặc project ID bạn vừa tạo ở Bước 3)

3. **"What do you want to use as your public directory?"**
   - Nhập: `wwwroot`
   - Nhấn Enter

4. **"Configure as a single-page app (rewrite all urls to /index.html)?"**
   - Nhập: `N` (No)
   - Nhấn Enter

5. **"Set up automatic builds and deploys with GitHub?"**
   - Nhập: `N` (No)
   - Nhấn Enter

6. **"File wwwroot/index.html already exists. Overwrite?"**
   - Nhập: `N` (No)
   - Nhấn Enter

**Kết quả:**
- File `firebase.json` được tạo
- File `.firebaserc` được tạo
- Terminal hiển thị "Firebase initialization complete!"

### Bước 5: Deploy Website (Trên PowerShell)

```powershell
# Deploy lên Firebase Hosting
firebase deploy --only hosting
```

**Quá trình deploy:**
1. Firebase sẽ upload tất cả files từ thư mục `wwwroot`
2. Hiển thị tiến trình upload
3. Sau 1-2 phút, deploy hoàn tất
4. Terminal sẽ hiển thị:
   ```
   ✔  Deploy complete!
   
   Project Console: https://console.firebase.google.com/project/[project-id]/overview
   Hosting URL: https://[project-id].web.app
   ```

### Bước 6: Truy Cập Website

Mở trình duyệt và truy cập:
- **URL chính**: `https://[project-id].web.app`
- **URL phụ**: `https://[project-id].firebaseapp.com`

(Thay `[project-id]` bằng project ID thực tế của bạn)

## ✅ Checklist Kiểm Tra

Sau khi deploy, kiểm tra:
- [ ] Trang chủ hiển thị đúng
- [ ] Menu điều hướng hoạt động
- [ ] Tất cả hình ảnh hiển thị
- [ ] Các trang con truy cập được:
  - [ ] Giới thiệu
  - [ ] Đội ngũ chuyên gia
  - [ ] Dự án
  - [ ] Tin tức
  - [ ] Liên hệ
  - [ ] Công nghệ số
  - [ ] Chính sách
  - [ ] Chương trình cộng đồng
  - [ ] Khóa đào tạo kỹ thuật

## 🆘 Xử Lý Lỗi Thường Gặp

### Lỗi: "firebase: command not found"
**Giải pháp:** Đóng và mở lại PowerShell mới

### Lỗi: "Cannot run login in non-interactive mode"
**Giải pháp:** Đảm bảo bạn đang chạy trong PowerShell thông thường, không phải trong IDE terminal

### Lỗi: "Project ID already exists"
**Giải pháp:** Chọn project ID khác hoặc để Firebase tự động thêm số vào cuối (ví dụ: t27-1a2b3)

### Lỗi: "Permission denied"
**Giải pháp:** Chạy lại lệnh Set-ExecutionPolicy trước khi chạy firebase commands

## 📞 Sau Khi Hoàn Thành

Khi deploy thành công, hãy gửi cho tôi:
1. Project ID của bạn
2. URL website đã deploy
3. Kết quả kiểm tra các trang

Tôi sẽ giúp bạn kiểm tra và tối ưu hóa nếu cần!
