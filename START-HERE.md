# ?? H??NG D?N NHANH - Deploy T27 Website lên GitHub Pages

## ?? TÓM T?T

Tôi ?ã t?o ??y ?? các file c?n thi?t ?? deploy website T27 lên GitHub Pages. D??i ?ây là h??ng d?n t?ng b??c.

---

## ?? B??C 1: M? PowerShell/Terminal

M? **PowerShell** ho?c **Git Bash** trong th? m?c d? án:
```
C:\Users\thang\source\repos\ntp224\T27-WEB2\
```

---

## ?? B??C 2: Ch?y l?nh Git (ch?n 1 trong 2 cách)

### Cách A: T? ??ng (Khuy?n ngh?) ?
```powershell
.\deploy.ps1
```
Script s? t? ??ng làm t?t c?!

### Cách B: Th? công
```bash
# 1. Ki?m tra tr?ng thái
git status

# 2. Thêm t?t c? files
git add .

# 3. Commit
git commit -m "Deploy T27 website to GitHub Pages"

# 4. Push lên GitHub
git push origin main
```

---

## ?? B??C 3: C?u hình GitHub Pages

1. M? trình duy?t và vào: https://github.com/phamminhson88642/T27-WEB/settings/pages

2. Trong ph?n **"Build and deployment"**:
   - **Source**: Ch?n **"GitHub Actions"** (QUAN TR?NG!)
   
3. Click **Save** (n?u có)

---

## ?? B??C 4: Ki?m tra Deploy

1. Vào: https://github.com/phamminhson88642/T27-WEB/actions

2. B?n s? th?y workflow **"Deploy to GitHub Pages"** ?ang ch?y

3. ??i workflow hi?n th? ? màu xanh (kho?ng 1-2 phút)

---

## ?? B??C 5: Truy c?p Website

Sau khi deploy thành công, website s? có t?i:

### ?? https://phamminhson88642.github.io/T27-WEB/

---

## ?? CHECKLIST

?ánh d?u ? khi hoàn thành:

- [ ] ?ã ch?y `git add .`
- [ ] ?ã ch?y `git commit -m "..."`
- [ ] ?ã ch?y `git push origin main`
- [ ] Vào Settings ? Pages
- [ ] Ch?n Source: **GitHub Actions**
- [ ] Vào Actions xem ti?n trình
- [ ] Workflow hi?n th? ?
- [ ] Truy c?p website thành công
- [ ] Ki?m tra các trang ho?t ??ng
- [ ] Ki?m tra trên mobile

---

## ?? CÁC FILE ?Ã T?O

```
T27-WEB2/
??? .github/
?   ??? workflows/
?       ??? deploy.yml          ? GitHub Actions workflow
??? wwwroot/
?   ??? .nojekyll               ? C?u hình GitHub Pages
??? .gitignore                  ? Git ignore rules
??? README.md                   ? Tài li?u chính
??? DEPLOY.md                   ? H??ng d?n chi ti?t
??? QUICKSTART.md              ? H??ng d?n nhanh
??? deploy.ps1                  ? PowerShell script
```

---

## ? L?NH NHANH (Copy & Paste)

```bash
git add .
git commit -m "Deploy T27 website to GitHub Pages"
git push origin main
```

---

## ?? LINKS QUAN TR?NG

| M?c ?ích | URL |
|----------|-----|
| **Website Live** | https://phamminhson88642.github.io/T27-WEB/ |
| **Repository** | https://github.com/phamminhson88642/T27-WEB |
| **GitHub Actions** | https://github.com/phamminhson88642/T27-WEB/actions |
| **Pages Settings** | https://github.com/phamminhson88642/T27-WEB/settings/pages |

---

## ? TROUBLESHOOTING

### ? N?u g?p l?i "404 Not Found"
1. ??i 5-10 phút
2. Ki?m tra Settings ? Pages ? Source = "GitHub Actions"
3. Ki?m tra Actions workflow ?ã ch?y thành công

### ? N?u CSS/JS không load
1. Clear cache trình duy?t (Ctrl + F5)
2. Ki?m tra file `.nojekyll` có trong wwwroot

### ? N?u git push failed
```bash
git remote set-url origin https://github.com/phamminhson88642/T27-WEB.git
git pull origin main --rebase
git push origin main
```

---

## ?? H? TR?

N?u c?n h? tr?:
- ?? Email: t27_vn@yahoo.com
- ?? Phone: 058.2210226 | 0913.431.515

---

## ?? HOÀN T?T!

Sau khi làm theo các b??c trên, website T27 c?a b?n s?:
- ? Ho?t ??ng 24/7
- ? HTTPS b?o m?t
- ? T?c ?? nhanh
- ? Responsive mobile
- ? Auto deploy khi có update

**Chúc m?ng! Website ?ã s?n sàng! ??**

---

*T?o b?i: GitHub Copilot | Ngày: 14/01/2025*
