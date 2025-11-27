# 🎉 Deploy Ngay - T27 Consultant Project

## ✅ Project Đã Tạo Thành Công!

**Thông tin project:**
- **Project ID**: `t27-consultant`
- **Project Name**: T27 Consultant
- **Console URL**: https://console.firebase.google.com/project/t27-consultant/overview
- **Website URL** (sau khi deploy): https://t27-consultant.web.app

---

## 🚀 Các Lệnh Deploy - Chạy Ngay

### Bước 1: Di Chuyển Đến Thư Mục T27

```powershell
cd "c:\Users\thang\Dropbox\DATA\T27\19. Google antigravity\T27"
```

### Bước 2: Set Execution Policy

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process -Force
```

### Bước 3: Chọn Project T27-Consultant

```powershell
firebase use t27-consultant
```

**Kết quả mong đợi:**
```
Now using project t27-consultant
```

### Bước 4: Init Firebase Hosting (Nếu Chưa Init)

**Nếu bạn chưa chạy `firebase init hosting` cho thư mục T27**, chạy:

```powershell
firebase init hosting
```

**Trả lời các câu hỏi:**
1. "Please select an option": `Use an existing project`
2. "Select a default Firebase project": Chọn `t27-consultant`
3. "What do you want to use as your public directory?": `wwwroot`
4. "Configure as a single-page app?": `N`
5. "Set up automatic builds and deploys with GitHub?": `N`
6. "File wwwroot/index.html already exists. Overwrite?": `N`

**Nếu đã init rồi**, bỏ qua bước này.

### Bước 5: Deploy Website

```powershell
firebase deploy --only hosting
```

**Quá trình deploy:**
```
=== Deploying to 't27-consultant'...

i  deploying hosting
i  hosting[t27-consultant]: beginning deploy...
i  hosting[t27-consultant]: found 188 files in wwwroot
✔  hosting[t27-consultant]: file upload complete
i  hosting[t27-consultant]: finalizing version...
✔  hosting[t27-consultant]: version finalized
i  hosting[t27-consultant]: releasing new version...
✔  hosting[t27-consultant]: release complete

✔  Deploy complete!

Project Console: https://console.firebase.google.com/project/t27-consultant/overview
Hosting URL: https://t27-consultant.web.app
```

### Bước 6: Truy Cập Website

Mở trình duyệt và truy cập:
- ✅ **URL chính**: https://t27-consultant.web.app
- ✅ **URL phụ**: https://t27-consultant.firebaseapp.com

---

## 📋 Tóm Tắt Các Lệnh (Copy Toàn Bộ)

```powershell
# Di chuyển đến thư mục T27
cd "c:\Users\thang\Dropbox\DATA\T27\19. Google antigravity\T27"

# Set execution policy
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process -Force

# Chọn project
firebase use t27-consultant

# Deploy (nếu đã init hosting)
firebase deploy --only hosting
```

**Hoặc nếu chưa init hosting:**

```powershell
# Di chuyển đến thư mục T27
cd "c:\Users\thang\Dropbox\DATA\T27\19. Google antigravity\T27"

# Set execution policy
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process -Force

# Chọn project
firebase use t27-consultant

# Init hosting
firebase init hosting
# Trả lời: Use an existing project → t27-consultant → wwwroot → N → N → N

# Deploy
firebase deploy --only hosting
```

---

## ✅ Checklist Kiểm Tra Sau Deploy

Sau khi deploy xong, kiểm tra:
- [ ] Truy cập https://t27-consultant.web.app
- [ ] Trang chủ hiển thị đúng
- [ ] Logo và hình ảnh hiển thị
- [ ] Menu điều hướng hoạt động
- [ ] Các trang con truy cập được:
  - [ ] /gioi-thieu.html
  - [ ] /doi-ngu-chuyen-gia.html
  - [ ] /du-an.html
  - [ ] /tin-tuc.html
  - [ ] /lien-he.html
  - [ ] /cong-nghe-so.html
  - [ ] /chinh-sach.html
  - [ ] /chuong-trinh-cong-dong.html
  - [ ] /khoa-dao-tao-ky-thuat.html

---

## 🔧 Xử Lý Lỗi

### Lỗi: "No project active"
```powershell
firebase use t27-consultant
```

### Lỗi: "Failed to authenticate"
```powershell
firebase login
```

### Lỗi: "Permission denied"
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process -Force
```

### Lỗi: "No Firebase project directory detected"
```powershell
# Đảm bảo bạn đang ở đúng thư mục
cd "c:\Users\thang\Dropbox\DATA\T27\19. Google antigravity\T27"
```

---

## 📊 Quản Lý Deploy

### Xem Lịch Sử Deploy
```powershell
firebase hosting:channel:list
```

### Deploy Lại (Cập Nhật)
```powershell
firebase deploy --only hosting
```

### Xem Project Đang Active
```powershell
firebase use
```

### Chuyển Đổi Giữa Các Projects
```powershell
firebase use t27              # Chuyển sang project T27
firebase use t27-consultant   # Chuyển sang project T27 Consultant
```

---

## 🎯 Kết Quả Mong Đợi

Sau khi chạy xong các lệnh trên, bạn sẽ có:
- ✅ Website live tại: **https://t27-consultant.web.app**
- ✅ Tất cả 188 files đã được upload
- ✅ Website hoạt động đầy đủ chức năng
- ✅ SSL certificate tự động (HTTPS)

---

**Hãy chạy các lệnh trên và cho tôi biết kết quả!** 🚀

**Lưu ý:** URL cuối cùng sẽ là `https://t27-consultant.web.app` (có dấu gạch ngang), không phải `https://t27consultant.web.app` (không có dấu gạch ngang).
