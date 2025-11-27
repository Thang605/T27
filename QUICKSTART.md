# ?? T27 Website - GitHub Pages Deployment Guide

## ? Files ?ã t?o

### 1. GitHub Actions Workflow
- **File**: `.github/workflows/deploy.yml`
- **M?c ?ích**: T? ??ng deploy lên GitHub Pages khi push code

### 2. .nojekyll
- **File**: `wwwroot/.nojekyll`
- **M?c ?ích**: Cho phép GitHub Pages x? lý ?úng các file CSS/JS

### 3. Documentation
- **README.md**: Tài li?u d? án chính
- **DEPLOY.md**: H??ng d?n deploy chi ti?t
- **QUICKSTART.md**: File này - H??ng d?n nhanh

### 4. Scripts
- **deploy.ps1**: PowerShell script ?? t? ??ng deploy

### 5. Git Configuration
- **.gitignore**: Lo?i tr? các file không c?n thi?t

## ?? Cách Deploy (3 cách)

### Cách 1: S? d?ng PowerShell Script (??n gi?n nh?t) ?

```powershell
# Ch?y trong PowerShell
.\deploy.ps1
```

Script s? t? ??ng:
1. ? Ki?m tra Git
2. ? Add files
3. ? Commit changes
4. ? Push lên GitHub
5. ? M? trình duy?t ?? xem ti?n trình

### Cách 2: S? d?ng Git Commands

```bash
# 1. Add t?t c? files
git add .

# 2. Commit v?i message
git commit -m "Deploy website to GitHub Pages"

# 3. Push lên GitHub
git push origin main
```

### Cách 3: S? d?ng Visual Studio

1. M? **Team Explorer**
2. Ch?n **Changes**
3. Nh?p commit message
4. Click **Commit All**
5. Click **Push**

## ?? URLs quan tr?ng

| M?c ?ích | URL |
|----------|-----|
| **Website** | https://ntp224.github.io/T27-WEB/ |
| **Repository** | https://github.com/ntp224/T27-WEB |
| **Actions** | https://github.com/ntp224/T27-WEB/actions |
| **Settings** | https://github.com/ntp224/T27-WEB/settings/pages |

## ?? C?u hình GitHub Pages

### B??c 1: Enable GitHub Pages
1. Vào: https://github.com/ntp224/T27-WEB/settings/pages
2. **Source**: Ch?n "GitHub Actions"
3. Save

### B??c 2: Push Code
S? d?ng m?t trong 3 cách ? trên ?? push code

### B??c 3: ??i Deploy
1. Vào: https://github.com/ntp224/T27-WEB/actions
2. Xem workflow "Deploy to GitHub Pages"
3. ??i ~1-2 phút cho ??n khi có ? màu xanh

### B??c 4: Truy c?p Website
M?: https://ntp224.github.io/T27-WEB/

## ?? Quy trình c?p nh?t

```
S?a code ? Save ? Run deploy.ps1 ? ??i 1-2 phút ? Website c?p nh?t
```

## ?? Workflow Diagram

```
???????????????
?  Edit Code  ?
???????????????
       ?
       ?
???????????????
?  Git Commit ?
???????????????
       ?
       ?
???????????????
?  Git Push   ?
???????????????
       ?
       ?
???????????????????
? GitHub Actions  ?
? Auto Deploy     ?
???????????????????
       ?
       ?
???????????????????
?  GitHub Pages   ?
?  Website Live   ?
???????????????????
```

## ?? Checklist Deploy l?n ??u

- [ ] Ki?m tra Git ?ã cài ??t
- [ ] Ki?m tra ?ã push lên GitHub
- [ ] Vào Settings ? Pages
- [ ] Ch?n Source: GitHub Actions
- [ ] Ch?y `.\deploy.ps1` ho?c git push
- [ ] Vào Actions xem ti?n trình
- [ ] Truy c?p website sau 1-2 phút
- [ ] Ki?m tra các trang ho?t ??ng
- [ ] Ki?m tra responsive trên mobile

## ?? Troubleshooting

### V?n ?? 1: 404 Not Found
**Gi?i pháp:**
1. Ki?m tra Settings ? Pages ? Source ph?i là "GitHub Actions"
2. Ki?m tra workflow ?ã ch?y thành công
3. ??i 5-10 phút r?i th? l?i

### V?n ?? 2: CSS/JS không load
**Gi?i pháp:**
1. Ki?m tra file `.nojekyll` có trong wwwroot
2. Clear browser cache (Ctrl + F5)
3. Ki?m tra ???ng d?n trong HTML files

### V?n ?? 3: Images không hi?n th?
**Gi?i pháp:**
1. Ki?m tra file ?nh có trong `wwwroot/images/`
2. Ki?m tra ???ng d?n ?nh trong HTML
3. Ki?m tra tên file (case-sensitive)

### V?n ?? 4: Git push failed
**Gi?i pháp:**
```bash
# Set remote URL n?u ch?a có
git remote set-url origin https://github.com/ntp224/T27-WEB.git

# Pull tr??c khi push
git pull origin main --rebase

# Push l?i
git push origin main
```

## ?? Ki?m tra sau khi Deploy

### Desktop
- [ ] Trang ch? (index.html)
- [ ] Gi?i thi?u (gioi-thieu.html)
- [ ] D? án (du-an.html)
- [ ] Chi ti?t d? án (project-ngoc-hoi.html)
- [ ] ??i ng? chuyên gia
- [ ] Công ngh? s?
- [ ] Tin t?c
- [ ] Chính sách
- [ ] Liên h?

### Mobile
- [ ] Responsive design
- [ ] Menu hamburger
- [ ] Images load ?úng
- [ ] Forms ho?t ??ng

### Performance
- [ ] T?c ?? t?i trang
- [ ] Images optimized
- [ ] CSS/JS minified (optional)

## ?? Tips & Best Practices

1. **Commit th??ng xuyên**: Commit sau m?i tính n?ng nh?
2. **Message rõ ràng**: Vi?t commit message có ý ngh?a
3. **Test local**: Test k? trên localhost tr??c khi push
4. **Backup**: Gi? backup code ? local
5. **Responsive**: Luôn test trên mobile
6. **Performance**: Optimize images tr??c khi upload

## ?? Support

**Công Ty C? Ph?n T? V?n T27**
- ?? Hotline: 058.2210226 | 0913.431.515
- ?? Email: t27_vn@yahoo.com
- ?? ??a ch?: Nha Trang, Khánh Hòa | Quy Nh?n, Bình ??nh

## ?? K?t lu?n

Bây gi? b?n ?ã có:
- ? Website hoàn ch?nh
- ? GitHub Pages setup
- ? Auto deployment
- ? Documentation ??y ??
- ? Scripts ti?n l?i

**Chúc m?ng! Website c?a b?n ?ã s?n sàng ?i vào ho?t ??ng! ??**

---

*Last updated: 2025-01-14*
