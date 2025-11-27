# ?? H??ng d?n Deploy T27 Website lên GitHub Pages

## ? Ki?m tra Git

Tr??c tiên, ki?m tra Git ?ã ???c cài ??t ch?a:

1. M? **Command Prompt** ho?c **PowerShell**
2. Ch?y l?nh:
```bash
git --version
```

N?u ch?a có Git, t?i v? t?i: https://git-scm.com/download/win

## ?? Các b??c Deploy

### B??c 1: M? Terminal trong Visual Studio
- Ch?n menu **View** > **Terminal** (ho?c Ctrl + `)

### B??c 2: Ch?y các l?nh sau l?n l??t:

```bash
# Thêm t?t c? files
git add .

# Commit changes
git commit -m "Deploy website to GitHub Pages"

# Push lên GitHub
git push origin main
```

## ?? C?u hình GitHub Pages (ch? c?n làm 1 l?n)

1. Truy c?p: https://github.com/ntp224/T27-WEB/settings/pages
2. Trong ph?n **Source**, ch?n: **GitHub Actions**
3. L?u l?i

## ? Xem k?t qu?

Sau khi push code lên:

1. **Xem quá trình build**: https://github.com/ntp224/T27-WEB/actions
2. **Website c?a b?n**: https://ntp224.github.io/T27-WEB/

?? Th??ng m?t 1-2 phút ?? build và deploy xong.

## ?? C?p nh?t Website sau này

M?i khi có thay ??i, ch? c?n ch?y 3 l?nh:

```bash
git add .
git commit -m "Mô t? thay ??i c?a b?n"
git push origin main
```

GitHub Actions s? t? ??ng build và deploy!

## ? N?u g?p l?i

### L?i: Git ch?a ???c c?u hình

```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

### L?i: Permission denied

??m b?o b?n ?ã ??ng nh?p GitHub trong Visual Studio ho?c cài ??t SSH key.

### L?i: 404 khi truy c?p website

1. Ki?m tra GitHub Pages settings ?ã b?t ch?a
2. ??m b?o Source là "GitHub Actions"
3. Ki?m tra workflow ?ã ch?y thành công

## ?? Liên h? h? tr?

- Email: t27_vn@yahoo.com
- Phone: 058.2210226 | 0913.431.515
