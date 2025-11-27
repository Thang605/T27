# Hướng dẫn Deploy T27 Website lên GitHub Pages

## 📋 Các bước thực hiện

### 1. Kiểm tra Git repository
```bash
git status
```

### 2. Add tất cả files mới
```bash
git add .
```

### 3. Commit changes
```bash
git commit -m "Add GitHub Pages deployment configuration"
```

### 4. Push lên GitHub
```bash
git push origin main
```

### 5. Cấu hình GitHub Pages

1. Truy cập: https://github.com/phamminhson88642/T27-WEB/settings/pages
2. Trong phần **Source**, chọn **GitHub Actions**
3. Workflow đã được tạo sẵn trong `.github/workflows/deploy.yml`
4. Sau khi push, GitHub Actions sẽ tự động build và deploy

### 6. Kiểm tra Deploy Status

1. Vào tab **Actions**: https://github.com/phamminhson88642/T27-WEB/actions
2. Xem workflow "Deploy to GitHub Pages" đang chạy
3. Đợi workflow hoàn thành (thường mất 1-2 phút)

### 7. Truy cập Website

Sau khi deploy thành công, website sẽ có tại:
```
https://phamminhson88642.github.io/T27-WEB/
```

## 🔧 Troubleshooting

### Lỗi: 404 Page Not Found
- Kiểm tra GitHub Pages settings
- Đảm bảo Source là "GitHub Actions"
- Kiểm tra workflow đã chạy thành công

### Lỗi: CSS/JS không load
- Kiểm tra đường dẫn trong HTML files
- Đảm bảo file `.nojekyll` đã được tạo trong thư mục wwwroot

### Lỗi: Images không hiển thị
- Kiểm tra đường dẫn ảnh trong HTML
- Đảm bảo images folder có trong wwwroot

## 📝 Cập nhật Website

Mỗi khi có thay đổi, chỉ cần:

```bash
# 1. Lưu thay đổi
git add .

# 2. Commit
git commit -m "Mô tả thay đổi"

# 3. Push
git push origin main
```

GitHub Actions sẽ tự động deploy lại website!

## ⚙️ Cấu hình nâng cao

### Custom Domain (nếu muốn)
1. Mua tên miền (ví dụ: t27.com.vn)
2. Vào GitHub Pages settings
3. Thêm custom domain
4. Cấu hình DNS tại nhà cung cấp domain

### HTTPS
- GitHub Pages tự động bật HTTPS
- Không cần cấu hình thêm

## 📞 Hỗ trợ

Nếu gặp vấn đề, liên hệ:
- Email: t27_vn@yahoo.com
- Phone: 058.2210226 | 0913.431.515

C:\Users\thang\source\repos\ntp224\T27-WEB2\

.\deploy.ps1

# Tạo commit mới để trigger workflow
git commit --allow-empty -m "Trigger GitHub Pages deployment"
git push origin main
