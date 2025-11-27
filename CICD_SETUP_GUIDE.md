# 🚀 Hướng Dẫn Thiết Lập CI/CD Firebase Hosting

## ✅ Đã Hoàn Thành

Tôi đã tạo các file sau trong repository:

1. ✅ `.github/workflows/firebase-hosting.yml` - GitHub Actions workflow
2. ✅ `firebase.json` - Cấu hình Firebase Hosting
3. ✅ `.firebaserc` - Cấu hình Firebase project

## 🔐 Bước Còn Lại: Tạo Service Account và GitHub Secret

Để CI/CD hoạt động, bạn cần thêm Firebase Service Account vào GitHub Secrets.

---

## 📋 Các Bước Thực Hiện

### Bước 1: Tạo Firebase Service Account

1. **Mở Firebase Console:**
   - Truy cập: https://console.firebase.google.com/project/t27-consultant/settings/serviceaccounts/adminsdk

2. **Generate Private Key:**
   - Click tab **"Service accounts"**
   - Click nút **"Generate new private key"**
   - Một popup sẽ hiện ra cảnh báo về bảo mật
   - Click **"Generate key"**

3. **Download JSON File:**
   - File JSON sẽ tự động download về máy
   - Tên file dạng: `t27-consultant-xxxxx.json`
   - **LƯU Ý:** File này chứa thông tin nhạy cảm, không share công khai!

4. **Copy Nội Dung JSON:**
   - Mở file JSON bằng text editor (Notepad, VS Code, etc.)
   - Copy **TOÀN BỘ** nội dung (từ `{` đầu tiên đến `}` cuối cùng)

---

### Bước 2: Thêm GitHub Secret

1. **Mở GitHub Repository Settings:**
   - Truy cập: https://github.com/phamminhson88642/T27-WEB/settings/secrets/actions

2. **Tạo New Repository Secret:**
   - Click nút **"New repository secret"**

3. **Điền Thông Tin:**
   - **Name**: `FIREBASE_SERVICE_ACCOUNT_T27_CONSULTANT`
   - **Secret**: Paste toàn bộ nội dung JSON đã copy ở Bước 1
   - Click **"Add secret"**

✅ **Hoàn thành!** GitHub Secret đã được tạo.

---

### Bước 3: Commit và Push Code

Bây giờ commit các file mới và push lên GitHub:

```powershell
cd "c:\Users\thang\Dropbox\DATA\T27\19. Google antigravity\T27-WEB"

# Kiểm tra các file đã thay đổi
git status

# Add các file mới
git add .github/workflows/firebase-hosting.yml
git add firebase.json
git add .firebaserc

# Commit
git commit -m "Add Firebase Hosting CI/CD workflow"

# Push lên GitHub
git push origin main
```

---

### Bước 4: Kiểm Tra Workflow

1. **Mở GitHub Actions:**
   - Truy cập: https://github.com/phamminhson88642/T27-WEB/actions

2. **Xem Workflow Đang Chạy:**
   - Bạn sẽ thấy workflow "Deploy to Firebase Hosting" đang chạy
   - Click vào workflow để xem chi tiết

3. **Đợi Deploy Hoàn Thành:**
   - Workflow sẽ mất khoảng 1-2 phút
   - Khi thấy dấu ✅ màu xanh = thành công
   - Khi thấy dấu ❌ màu đỏ = có lỗi (xem logs để debug)

4. **Kiểm Tra Website:**
   - Truy cập: https://t27-consultant.web.app
   - Website đã được deploy tự động!

---

## 🔄 Cách Hoạt Động

Từ giờ trở đi, **MỖI KHI** bạn push code lên nhánh `main`:

1. GitHub Actions tự động trigger
2. Workflow checkout code
3. Deploy `wwwroot` folder lên Firebase Hosting
4. Website tại https://t27-consultant.web.app tự động cập nhật

**Ví dụ:**
```powershell
# Sửa file trong wwwroot
code wwwroot/index.html

# Commit và push
git add .
git commit -m "Update homepage"
git push origin main

# → GitHub Actions tự động deploy!
# → Website cập nhật sau 1-2 phút
```

---

## 📊 Workflow Details

File `.github/workflows/firebase-hosting.yml` có cấu hình:

- **Trigger**: Push to `main` branch
- **Runner**: Ubuntu latest
- **Steps**:
  1. Checkout code
  2. Deploy to Firebase Hosting using service account
- **Target**: Project `t27-consultant`, channel `live`

---

## 🔧 Xử Lý Lỗi

### Lỗi: "Error: HTTP Error: 403, The caller does not have permission"

**Nguyên nhân:** Service account không có quyền deploy

**Giải pháp:**
1. Vào Firebase Console → Settings → Service accounts
2. Đảm bảo service account có role "Firebase Hosting Admin"

### Lỗi: "Error: Failed to get Firebase project"

**Nguyên nhân:** GitHub Secret không đúng hoặc thiếu

**Giải pháp:**
1. Kiểm tra tên secret: `FIREBASE_SERVICE_ACCOUNT_T27_CONSULTANT`
2. Đảm bảo đã paste đúng toàn bộ JSON content
3. Tạo lại secret nếu cần

### Lỗi: "Error: Cannot find module 'firebase.json'"

**Nguyên nhân:** File `firebase.json` không có trong repository

**Giải pháp:**
1. Đảm bảo file `firebase.json` đã được commit
2. Chạy `git add firebase.json` và `git commit`

---

## ✅ Checklist Hoàn Thành

- [ ] Tạo Firebase Service Account
- [ ] Download service account JSON file
- [ ] Thêm GitHub Secret `FIREBASE_SERVICE_ACCOUNT_T27_CONSULTANT`
- [ ] Commit và push các file mới
- [ ] Kiểm tra GitHub Actions workflow chạy thành công
- [ ] Verify website tại https://t27-consultant.web.app

---

## 🎯 Kết Quả Mong Đợi

Sau khi hoàn thành:
- ✅ Mỗi lần push code lên `main` → tự động deploy
- ✅ Không cần chạy `firebase deploy` thủ công nữa
- ✅ Website luôn cập nhật với code mới nhất
- ✅ Có thể xem lịch sử deploy trong GitHub Actions

---

## 📞 Hỗ Trợ

Nếu gặp vấn đề:
1. Kiểm tra logs trong GitHub Actions
2. Xem Firebase Console → Hosting → Release history
3. Đảm bảo service account có đủ quyền
4. Verify `firebase.json` và `.firebaserc` đúng format

---

**Hãy bắt đầu từ Bước 1 và cho tôi biết kết quả!** 🚀
