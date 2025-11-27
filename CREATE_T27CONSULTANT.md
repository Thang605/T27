# 🚀 Tạo Firebase Project: T27Consultant

## 🎯 Mục Tiêu

Tạo Firebase project mới với:
- **Tên project**: T27 Consultant
- **Project ID**: t27consultant
- **URL**: https://t27consultant.web.app

---

## 📋 Các Bước Thực Hiện

### Bước 1: Tạo Firebase Project

Bạn có 2 cách:

#### **Cách 1: Tạo qua Firebase Console (Dễ hơn)**

1. Mở Firebase Console: https://console.firebase.google.com/
2. Click **"Add project"** hoặc **"Create a project"**
3. Nhập tên project: **`T27 Consultant`**
4. Click **"Continue"**
5. **Project ID**: 
   - Firebase sẽ tự động đề xuất `t27-consultant` hoặc `t27consultant`
   - Click vào icon ✏️ (edit) để sửa thành **`t27consultant`** (không có dấu gạch ngang)
   - Kiểm tra xem `t27consultant` có available không
6. Click **"Continue"**
7. **Google Analytics**: Tắt toggle "Enable Google Analytics" (không cần cho static website)
8. Click **"Create project"**
9. Đợi 30-60 giây
10. Click **"Continue"** khi thấy "Your new project is ready"

✅ **Ghi nhớ Project ID chính xác** (có thể là `t27consultant` hoặc `t27consultant-xxxxx`)

#### **Cách 2: Tạo qua Firebase CLI**

Mở PowerShell và chạy:

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process -Force
firebase projects:create t27consultant --display-name "T27 Consultant"
```

Nếu `t27consultant` đã được dùng, thử:
```powershell
firebase projects:create t27-consultant --display-name "T27 Consultant"
```

---

### Bước 2: Kiểm Tra Project Đã Tạo

```powershell
firebase projects:list
```

Bạn sẽ thấy project `t27consultant` (hoặc tên tương tự) trong danh sách.

---

### Bước 3: Cấu Hình Firebase Hosting

Di chuyển đến thư mục T27 và chọn project mới:

```powershell
cd "c:\Users\thang\Dropbox\DATA\T27\19. Google antigravity\T27"
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process -Force

# Chọn project t27consultant
firebase use t27consultant
```

**Nếu chưa init hosting**, chạy:

```powershell
firebase init hosting
```

**Trả lời các câu hỏi:**
- "Please select an option": `Use an existing project`
- "Select a default Firebase project": Chọn `t27consultant`
- "What do you want to use as your public directory?": `wwwroot`
- "Configure as a single-page app?": `N`
- "Set up automatic builds and deploys with GitHub?": `N`
- "File wwwroot/index.html already exists. Overwrite?": `N`

**Nếu đã init rồi**, chỉ cần chọn project:

```powershell
firebase use t27consultant
```

---

### Bước 4: Deploy Website

```powershell
firebase deploy --only hosting
```

**Quá trình deploy:**
1. ⏳ Uploading files...
2. 📊 Processing...
3. ✅ Deploy complete!
4. 🎉 Hiển thị URLs:
   ```
   ✔  Deploy complete!
   
   Project Console: https://console.firebase.google.com/project/t27consultant/overview
   Hosting URL: https://t27consultant.web.app
   ```

---

### Bước 5: Truy Cập Website

Mở trình duyệt và truy cập:
- ✅ **URL chính**: https://t27consultant.web.app
- ✅ **URL phụ**: https://t27consultant.firebaseapp.com

---

## 📝 Tóm Tắt Các Lệnh (Copy-Paste)

```powershell
# 1. Di chuyển đến thư mục T27
cd "c:\Users\thang\Dropbox\DATA\T27\19. Google antigravity\T27"

# 2. Set execution policy
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process -Force

# 3. Tạo project (nếu chưa tạo qua Console)
firebase projects:create t27consultant --display-name "T27 Consultant"

# 4. Kiểm tra project
firebase projects:list

# 5. Chọn project
firebase use t27consultant

# 6. Init hosting (nếu cần)
firebase init hosting

# 7. Deploy
firebase deploy --only hosting
```

---

## ⚠️ Xử Lý Lỗi

### Lỗi: "Project ID already exists"

Nếu `t27consultant` đã được dùng, thử các tên sau:
- `t27-consultant`
- `t27consultants`
- `t27consulting`
- Hoặc để Firebase tự động thêm số: `t27consultant-xxxxx`

### Lỗi: "Failed to authenticate"

Chạy lại:
```powershell
firebase login
```

### Lỗi: "No project active"

Chạy:
```powershell
firebase use t27consultant
```

---

## 🔄 Quản Lý Nhiều Projects

Nếu bạn có nhiều projects (T27, T27Consultant, etc.), chuyển đổi giữa chúng:

```powershell
# Xem danh sách projects
firebase projects:list

# Chuyển sang project T27
firebase use t27

# Chuyển sang project T27Consultant
firebase use t27consultant

# Xem project đang active
firebase use
```

---

## ✅ Checklist

- [ ] Tạo Firebase project "T27 Consultant"
- [ ] Xác nhận project ID là `t27consultant` (hoặc tương tự)
- [ ] Chọn project: `firebase use t27consultant`
- [ ] Deploy: `firebase deploy --only hosting`
- [ ] Truy cập: https://t27consultant.web.app
- [ ] Kiểm tra tất cả trang hoạt động
- [ ] Kiểm tra hình ảnh hiển thị đúng

---

## 🎉 Kết Quả Mong Đợi

Sau khi hoàn thành, bạn sẽ có:
- ✅ Website tại: **https://t27consultant.web.app**
- ✅ Tất cả files từ thư mục `wwwroot` đã được deploy
- ✅ Website hoạt động giống như bản local

---

**Hãy bắt đầu từ Bước 1 và cho tôi biết kết quả!** 🚀
