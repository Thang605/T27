# 🔧 Cập Nhật VS Code Launch Configuration

## 📝 Nội Dung File launch.json Mới

Copy nội dung sau vào file `.vscode/launch.json` của bạn:

```json
{
  "version": "0.2.0",
  "configurations": [
    {
      "type": "chrome",
      "request": "launch",
      "name": "Launch Chrome - Firebase Production",
      "url": "https://t27-consultant.web.app",
      "webRoot": "${workspaceFolder}/wwwroot"
    },
    {
      "type": "chrome",
      "request": "launch",
      "name": "Launch Chrome - Live Server",
      "url": "http://localhost:5500",
      "webRoot": "${workspaceFolder}/wwwroot"
    },
    {
      "type": "chrome",
      "request": "launch",
      "name": "Launch Chrome - http-server",
      "url": "http://localhost:8080",
      "webRoot": "${workspaceFolder}/wwwroot"
    },
    {
      "type": "chrome",
      "request": "launch",
      "name": "Launch Chrome - Firebase Emulator",
      "url": "http://localhost:5000",
      "webRoot": "${workspaceFolder}/wwwroot"
    }
  ]
}
```

## 🎯 Các Cấu Hình Có Sẵn

### 1. **Firebase Production** (Khuyến nghị cho debug production)
- **URL**: `https://t27-consultant.web.app`
- **Khi nào dùng**: Debug website đã deploy trên Firebase
- **Cách dùng**: 
  1. Chọn "Launch Chrome - Firebase Production" trong dropdown debug
  2. Nhấn F5
  3. Chrome mở với debugger attached vào production site

### 2. **Live Server** (Khuyến nghị cho development)
- **URL**: `http://localhost:5500`
- **Khi nào dùng**: Development hàng ngày với auto-reload
- **Cách dùng**:
  1. Chạy Live Server trước (click "Go Live" trong VS Code)
  2. Chọn "Launch Chrome - Live Server"
  3. Nhấn F5

### 3. **http-server**
- **URL**: `http://localhost:8080`
- **Khi nào dùng**: Khi dùng http-server package
- **Cách dùng**:
  1. Chạy `http-server -p 8080` trong terminal
  2. Chọn "Launch Chrome - http-server"
  3. Nhấn F5

### 4. **Firebase Emulator**
- **URL**: `http://localhost:5000`
- **Khi nào dùng**: Test local giống production
- **Cách dùng**:
  1. Chạy `firebase emulators:start --only hosting`
  2. Chọn "Launch Chrome - Firebase Emulator"
  3. Nhấn F5

## 🚀 Cách Sử Dụng

### Bước 1: Cập Nhật File
1. Mở file `.vscode/launch.json` trong VS Code
2. Thay thế toàn bộ nội dung bằng JSON ở trên
3. Lưu file (Ctrl+S)

### Bước 2: Chọn Configuration
1. Vào tab "Run and Debug" (Ctrl+Shift+D)
2. Chọn configuration từ dropdown ở trên
3. Nhấn F5 hoặc click nút ▶️ màu xanh

### Bước 3: Debug
- Set breakpoints trong file JS (click vào số dòng)
- Reload trang để trigger breakpoints
- Sử dụng debug controls: Continue, Step Over, Step Into, etc.

## 📋 Thay Đổi Chính

**Trước:**
```json
"url": "http://localhost:8080"
```

**Sau:**
- Có 4 configurations khác nhau
- Mặc định đầu tiên là Firebase Production
- webRoot đã được cập nhật thành `${workspaceFolder}/wwwroot`

## ✅ Lợi Ích

- ✅ Debug trực tiếp trên Firebase production
- ✅ Debug local development với nhiều server options
- ✅ Dễ dàng chuyển đổi giữa các môi trường
- ✅ webRoot đúng với cấu trúc project

## 🔍 Nếu Muốn Chỉ Dùng Firebase Production

Nếu bạn chỉ muốn debug Firebase production, dùng config đơn giản này:

```json
{
  "version": "0.2.0",
  "configurations": [
    {
      "type": "chrome",
      "request": "launch",
      "name": "Launch Chrome against Firebase",
      "url": "https://t27-consultant.web.app",
      "webRoot": "${workspaceFolder}/wwwroot"
    }
  ]
}
```

## 📝 Lưu Ý

- File `.vscode/launch.json` nằm trong `.gitignore` nên không được commit lên Git
- Mỗi developer có thể có config riêng
- Đảm bảo cài extension "Debugger for Chrome" trong VS Code

---

**Hãy copy JSON ở trên vào file launch.json của bạn!** 🚀
