# 🔄 Đổi URL Firebase Hosting: t27.web.app → ct27.web.app

## ❓ Câu Hỏi: Có thể đổi URL không?

**Trả lời:** Có thể, nhưng không thể đổi trực tiếp. Bạn cần tạo Firebase project mới với project ID là `ct27`.

---

## 📋 Các Cách Thực Hiện

### ✅ Cách 1: Tạo Firebase Project Mới (Khuyến nghị)

**Ưu điểm:**
- Đơn giản, rõ ràng
- Giữ nguyên project T27 cũ (có thể xóa sau)
- URL mới: `https://ct27.web.app`

**Các bước:**

#### 1. Tạo Firebase Project Mới

**Trên Firebase Console** (https://console.firebase.google.com/):
1. Click "Add project"
2. Nhập tên project: **`CT27`**
3. Project ID sẽ tự động là `ct27` (hoặc `ct27-xxxxx` nếu `ct27` đã được dùng)
4. Tắt Google Analytics
5. Click "Create project"

**Hoặc qua CLI:**
```powershell
firebase projects:create ct27 --display-name "CT27"
```

#### 2. Cấu Hình Lại Firebase Hosting

Trong thư mục T27:

```powershell
cd "c:\Users\thang\Dropbox\DATA\T27\19. Google antigravity\T27"
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process -Force

# Chọn project mới
firebase use ct27

# Hoặc nếu chưa init, chạy lại init
firebase init hosting
```

Khi init, chọn project `ct27` thay vì `t27`.

#### 3. Deploy Lên Project Mới

```powershell
firebase deploy --only hosting
```

#### 4. Kết Quả

Website sẽ có tại:
- ✅ `https://ct27.web.app`
- ✅ `https://ct27.firebaseapp.com`

#### 5. Xóa Project Cũ (Tùy chọn)

Nếu không cần project T27 nữa:
- Vào Firebase Console
- Chọn project T27
- Settings → General → Delete project

---

### ⚠️ Cách 2: Sử dụng Custom Domain

Nếu bạn muốn URL hoàn toàn tùy chỉnh (ví dụ: `ct27.com`):

**Yêu cầu:**
- Bạn phải sở hữu domain `ct27.com`
- Cấu hình DNS records

**Các bước:**
1. Vào Firebase Console → Hosting
2. Click "Add custom domain"
3. Nhập domain của bạn (ví dụ: `ct27.com`)
4. Xác thực quyền sở hữu domain
5. Cấu hình DNS records theo hướng dẫn
6. Đợi SSL certificate được cấp (24-48 giờ)

**Lưu ý:** Cách này yêu cầu bạn phải mua domain trước.

---

### ❌ Cách 3: Đổi Project ID (KHÔNG KHẢ THI)

Firebase **KHÔNG CHO PHÉP** đổi project ID sau khi đã tạo.

Project ID là định danh duy nhất và không thể thay đổi.

---

## 🎯 Khuyến Nghị

**Nên làm:** Tạo Firebase project mới với tên `CT27` (Cách 1)

**Lý do:**
- Đơn giản, nhanh chóng (5 phút)
- Không ảnh hưởng đến project cũ
- URL chính xác như mong muốn: `https://ct27.web.app`

---

## 📝 Các Lệnh Cần Chạy (Tóm Tắt)

```powershell
# 1. Tạo project mới (qua CLI)
firebase projects:create ct27 --display-name "CT27"

# 2. Di chuyển đến thư mục T27
cd "c:\Users\thang\Dropbox\DATA\T27\19. Google antigravity\T27"

# 3. Set execution policy
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process -Force

# 4. Chọn project mới
firebase use ct27

# 5. Deploy
firebase deploy --only hosting

# 6. Kiểm tra
# Mở https://ct27.web.app
```

---

## ❓ Câu Hỏi Thường Gặp

### Q: Project ID `ct27` đã được dùng thì sao?
**A:** Firebase sẽ đề xuất ID khác như `ct27-1a2b3`. URL sẽ là `https://ct27-1a2b3.web.app`

### Q: Có mất phí không?
**A:** Không. Firebase Hosting miễn phí cho:
- 10 GB storage
- 360 MB/day bandwidth
- Đủ cho website tĩnh nhỏ

### Q: Có thể giữ cả 2 project không?
**A:** Có. Bạn có thể giữ cả T27 và CT27, deploy website lên cả 2.

### Q: Làm sao để chuyển đổi giữa các project?
**A:** Dùng lệnh:
```powershell
firebase use t27   # Chuyển sang project T27
firebase use ct27  # Chuyển sang project CT27
```

---

## 🚀 Bạn Muốn Làm Gì Tiếp Theo?

1. **Tạo project CT27 mới** → Tôi sẽ hướng dẫn chi tiết
2. **Giữ nguyên T27** → Tiếp tục deploy với URL `t27.web.app`
3. **Sử dụng custom domain** → Cần mua domain trước

**Hãy cho tôi biết bạn chọn phương án nào!** 😊
