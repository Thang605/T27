# 🚀 Hướng Dẫn Deploy Website T27 lên Firebase Hosting

## ✅ Đã Hoàn Thành

- ✅ Cài đặt Node.js v24.11.1 (LTS)
- ✅ Cài đặt npm 11.6.2
- ✅ Cài đặt Firebase CLI (753 packages)
- ✅ Sao chép repository T27-WEB → T27 (188 files)

## 📋 Các Bước Thực Hiện

### Bước 1: Đăng Nhập Firebase

Mở **PowerShell mới** và chạy:

```powershell
cd "c:\Users\thang\Dropbox\DATA\T27\19. Google antigravity\T27"
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process -Force
firebase login
```

Lệnh này sẽ:
- Mở trình duyệt tự động
- Yêu cầu đăng nhập bằng tài khoản Google
- Xin quyền truy cập Firebase CLI
- Quay lại terminal sau khi xác thực thành công

### Bước 2: Tạo Firebase Project

**Cách 1: Tạo qua Firebase Console (Khuyến nghị)**

1. Truy cập: https://console.firebase.google.com/
2. Click "Add project" hoặc "Create a project"
3. Nhập tên project: **T27**
4. Chấp nhận điều khoản và click "Continue"
5. Tắt Google Analytics (tùy chọn)
6. Click "Create project"
7. Đợi quá trình tạo project hoàn tất

**Cách 2: Tạo qua CLI**

```powershell
firebase projects:create t27 --display-name "T27"
```

### Bước 3: Khởi Tạo Firebase Hosting

Trong thư mục T27, chạy:

```powershell
firebase init hosting
```

**Trả lời các câu hỏi:**
- "Please select an option": Chọn **"Use an existing project"**
- "Select a default Firebase project": Chọn **"t27"** (hoặc project ID của bạn)
- "What do you want to use as your public directory?": Nhập **`wwwroot`**
- "Configure as a single-page app?": Nhập **`N`** (No)
- "Set up automatic builds and deploys with GitHub?": Nhập **`N`** (No)
- "File wwwroot/index.html already exists. Overwrite?": Nhập **`N`** (No)

Lệnh này sẽ tạo:
- `firebase.json` - File cấu hình Firebase
- `.firebaserc` - File cài đặt project

### Bước 4: Deploy Website

Chạy lệnh deploy:

```powershell
firebase deploy --only hosting
```

Quá trình này sẽ:
1. Upload tất cả files từ thư mục `wwwroot`
2. Deploy lên Firebase Hosting
3. Hiển thị URLs truy cập website

### Bước 5: Truy Cập Website

Sau khi deploy thành công, website sẽ có sẵn tại:
- **URL chính**: `https://t27.web.app`
- **URL phụ**: `https://t27.firebaseapp.com`

> **Lưu ý**: Nếu project ID "t27" đã được sử dụng, Firebase sẽ đề xuất ID khác như "t27-xxxxx". URLs sẽ dựa trên project ID thực tế.

## 🔧 Xử Lý Lỗi

### Lỗi PowerShell Execution Policy
Nếu gặp lỗi "running scripts is disabled", chạy lệnh này trước:
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process -Force
```

### Lỗi Firebase Command Not Found
Đóng và mở lại PowerShell/terminal để cập nhật biến môi trường.

### Project ID Đã Tồn Tại
Nếu "t27" đã được sử dụng, thử:
- `t27-website`
- `t27-company`
- Hoặc để Firebase tự động đề xuất ID

## ✔️ Kiểm Tra Sau Deploy

Sau khi deploy, kiểm tra:
- [ ] Trang chủ tải được: `https://[project-id].web.app/`
- [ ] Điều hướng hoạt động giữa các trang
- [ ] Hình ảnh hiển thị đúng
- [ ] Tất cả trang HTML truy cập được:
  - `/gioi-thieu.html`
  - `/doi-ngu-chuyen-gia.html`
  - `/du-an.html`
  - `/tin-tuc.html`
  - `/lien-he.html`
  - `/cong-nghe-so.html`
  - `/chinh-sach.html`
  - `/chuong-trinh-cong-dong.html`
  - `/khoa-dao-tao-ky-thuat.html`

## 📞 Hỗ Trợ

Nếu gặp vấn đề, tham khảo:
- Firebase Documentation: https://firebase.google.com/docs/hosting
- Firebase CLI Reference: https://firebase.google.com/docs/cli
