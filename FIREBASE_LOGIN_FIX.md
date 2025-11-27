# 🔐 Firebase Login - Chạy Ngay

## ⚠️ Vấn Đề Hiện Tại

Bạn gặp lỗi: **"Failed to authenticate, have you run firebase login?"**

Điều này có nghĩa là Firebase CLI chưa được đăng nhập với tài khoản Google của bạn.

---

## ✅ Giải Pháp: Đăng Nhập Firebase CLI

### Bước 1: Chạy Lệnh Login

Trong PowerShell, chạy:

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process -Force
firebase login
```

### Bước 2: Xác Thực Trên Browser

Sau khi chạy lệnh trên:

1. ✅ Một cửa sổ trình duyệt sẽ **tự động mở ra**
2. ✅ Chọn tài khoản Google của bạn (cùng tài khoản đã tạo Firebase project T27)
3. ✅ Click **"Allow"** để cho phép Firebase CLI truy cập
4. ✅ Bạn sẽ thấy trang "Success! You're logged in"
5. ✅ Quay lại PowerShell, bạn sẽ thấy:
   ```
   ✔  Success! Logged in as [your-email@gmail.com]
   ```

### Bước 3: Kiểm Tra Đăng Nhập

Để chắc chắn đã đăng nhập thành công, chạy:

```powershell
firebase projects:list
```

Bạn sẽ thấy danh sách các Firebase projects, bao gồm project **T27** vừa tạo.

---

## 🚀 Sau Khi Đăng Nhập Thành Công

Tiếp tục với các bước init và deploy:

### 1. Khởi Tạo Firebase Hosting

```powershell
firebase init hosting
```

**Trả lời các câu hỏi:**
- "Please select an option": `Use an existing project`
- "Select a default Firebase project": Chọn `t27`
- "What do you want to use as your public directory?": `wwwroot`
- "Configure as a single-page app?": `N`
- "Set up automatic builds and deploys with GitHub?": `N`
- "File wwwroot/index.html already exists. Overwrite?": `N`

### 2. Deploy Website

```powershell
firebase deploy --only hosting
```

### 3. Truy Cập Website

Sau khi deploy xong, mở:
- https://t27.web.app
- https://t27.firebaseapp.com

---

## 🔧 Xử Lý Lỗi Khác

### Lỗi: "Cannot run login in non-interactive mode"
- Đảm bảo bạn đang chạy trong PowerShell thông thường (không phải terminal trong VS Code)
- Hoặc thử: `firebase login --no-localhost`

### Lỗi: Browser không tự động mở
- Copy URL hiển thị trong terminal
- Paste vào trình duyệt thủ công
- Hoàn tất xác thực
- Copy authorization code từ browser
- Paste vào terminal

### Lỗi: "firebase: command not found"
- Đóng PowerShell
- Mở PowerShell mới
- Chạy lại lệnh

---

## 📋 Tóm Tắt Các Lệnh

```powershell
# 1. Set execution policy
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process -Force

# 2. Login Firebase
firebase login

# 3. Kiểm tra login
firebase projects:list

# 4. Init hosting
firebase init hosting

# 5. Deploy
firebase deploy --only hosting
```

---

**Hãy chạy `firebase login` ngay bây giờ và cho tôi biết kết quả!** 🚀
