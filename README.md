# T27 - Công Ty C? Ph?n T? V?n

![T27 Logo](wwwroot/images/logo-t27.png)

**Cái tâm m?i công trình**

## ?? Gi?i thi?u

Website chính th?c c?a Công ty C? ph?n T? v?n T27 - ??n v? chuyên nghi?p trong l?nh v?c:
- ??? T? v?n thi?t k? công trình
- ?? Kh?o sát ??a hình, ??a ch?t
- ?? Giám sát thi công
- ?? Qu?n lý d? án
- ?? T? v?n BIM & Công ngh? s?

## ?? Công ngh? s? d?ng

- **Frontend**: HTML5, CSS3, JavaScript (Vanilla)
- **Framework**: .NET 8
- **Deployment**: GitHub Pages
- **Version Control**: Git

## ?? C?u trúc d? án

```
T27-WEB2/
??? wwwroot/
?   ??? css/
?   ?   ??? styles.css
?   ??? js/
?   ?   ??? app.js
?   ??? images/
?   ?   ??? leaders/
?   ?   ??? projects/
?   ?   ??? logo-t27.png
?   ??? index.html
?   ??? gioi-thieu.html
?   ??? du-an.html
?   ??? project-detail.html
?   ??? project-ngoc-hoi.html
?   ??? doi-ngu-chuyen-gia.html
?   ??? cong-nghe-so.html
?   ??? tin-tuc.html
?   ??? chinh-sach.html
?   ??? lien-he.html
??? .github/
?   ??? workflows/
?       ??? deploy.yml
??? T27.csproj
```

## ?? Truy c?p Website

Website ???c deploy t? ??ng lên:
- **GitHub Pages**: https://phamminhson88642.github.io/T27-WEB/
- **Firebase Hosting**: https://t27-consultant.web.app/

## ??? Phát tri?n Local

### Yêu c?u
- .NET 8 SDK
- Visual Studio 2022 ho?c VS Code
- Git

### Cài ??t và ch?y

```bash
# Clone repository
git clone https://github.com/phamminhson88642/T27-WEB.git
cd T27-WEB

# Restore packages
dotnet restore

# Run project
dotnet run
```

Truy c?p: `https://localhost:5001` ho?c `http://localhost:5224`

## ?? Tính n?ng chính

### 1. Trang ch? (index.html)
- Hero section v?i thông tin công ty
- Gi?i thi?u d?ch v?
- D? án n?i b?t
- ??i ng? chuyên gia

### 2. Gi?i thi?u (gioi-thieu.html)
- S? ?? t? ch?c công ty
- T?m nhìn & S? m?nh
- L?ch s? phát tri?n
- C? c?u t? ch?c

### 3. D? án (du-an.html)
- Danh sách d? án v?i b? l?c
- Phân lo?i theo:
  - Lo?i d? án
  - D?ch v?
  - ??a ?i?m
- Tìm ki?m d? án

### 4. Chi ti?t d? án (project-detail.html)
- Thông tin t?ng quan
- Tabs chi ti?t:
  - M?c tiêu & L?i ích
  - ?i?m n?i b?t
  - Ti?n ?? & K?t qu?
  - ??i ng? tham gia
  - Th?i gian thi?t k?
- Gallery hình ?nh
- Video gi?i thi?u

### 5. Các trang khác
- ??i ng? chuyên gia
- Công ngh? s?
- Tin t?c
- Chính sách
- Liên h?

## ?? Thi?t k?

- **Màu ch? ??o**: 
  - Primary Blue: `#0088cc`
  - Primary Orange: `#FF6B35`
- **Typography**: System fonts (Arial, sans-serif)
- **Responsive**: Mobile-first design
- **Icons**: Unicode emojis

## ?? Deploy

Website h? tr? 2 n?n t?ng deploy:

### 1. GitHub Pages (T? ??ng)
Website ???c deploy t? ??ng qua GitHub Actions khi có commit m?i vào branch `main`.

**C?u hình GitHub Pages:**
1. Vào repository Settings
2. Ch?n Pages
3. Source: GitHub Actions
4. Branch: main
5. Folder: wwwroot

### 2. Firebase Hosting
D? án ?ã ???c c?u hình v?i Firebase Hosting.

**Deploy lên Firebase:**
```bash
firebase deploy
```

## ?? Liên h?

**Công Ty C? Ph?n T? V?n T27**

- ?? **Hotline**: 058.2210226 | 0913.431.515
- ?? **Email**: t27_vn@yahoo.com
- ?? **V?n phòng**:
  - Nha Trang, Khánh Hòa
  - Quy Nh?n, Bình ??nh

## ?? License

© 2025 Công Ty C? Ph?n T? V?n T27. All rights reserved.

## ?? ?óng góp

D? án n?i b? c?a công ty T27. M?i ?óng góp vui lòng liên h? qua email.

---

**Phát tri?n b?i**: ??i ng? IT - T27 Consulting JSC
