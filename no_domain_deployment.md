# 🌐 نشر لانشر الألعاب بدون دومين

## 🎯 لا تحتاج دومين للبدء!

يمكنك تشغيل لانشر الألعاب على VPSWala **بدون دومين** باستخدام IP العام للخادم.

## 🚀 النشر باستخدام IP فقط

### 1️⃣ بعد إعداد VPS:
```bash
# تثبيت Apache
apt install apache2 -y
systemctl start apache2

# رفع الملفات
cp -r launcher/* /var/www/html/
chown -R www-data:www-data /var/www/html/
chmod -R 755 /var/www/html/
```

### 2️⃣ الوصول للموقع:
```
http://YOUR-VPS-IP/
```

**مثال:** إذا كان IP الخادم `203.123.45.67`
- الصفحة الرئيسية: `http://203.123.45.67/`
- لعبة Mario: `http://203.123.45.67/mario`
- اللانشر المتقدم: `http://203.123.45.67/launcher`

## 🆓 دومينات مجانية (اختيارية)

إذا كنت تريد دومين مجاني:

### 1️⃣ Freenom (مجاني):
- اذهب إلى: freenom.com
- اختر دومين مجاني (.tk, .ml, .ga, .cf)
- وجه الدومين لـ IP الخادم

### 2️⃣ No-IP (مجاني):
- اذهب إلى: noip.com
- احصل على subdomain مجاني
- مثال: `mario-launcher.ddns.net`

### 3️⃣ DuckDNS (مجاني):
- اذهب إلى: duckdns.org
- احصل على subdomain مجاني
- مثال: `mario-launcher.duckdns.org`

## ⚙️ إعداد بدون دومين

### تعديل .htaccess للعمل مع IP:
```apache
# إزالة إعادة التوجيه المطلق
RewriteEngine On

# الروابط المختصرة تعمل مع IP
RewriteRule ^launcher/?$ launcher_advanced.html [L]
RewriteRule ^mario/?$ mario_game.html [L]
RewriteRule ^game/?$ game_launcher.html [L]

# باقي الإعدادات تبقى كما هي
DirectoryIndex index.html
```

## 🔒 SSL بدون دومين

### استخدام Self-Signed Certificate:
```bash
# إنشاء شهادة ذاتية التوقيع
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/private/apache-selfsigned.key \
    -out /etc/ssl/certs/apache-selfsigned.crt

# إعداد Apache للـ SSL
a2enmod ssl
systemctl restart apache2
```

**ملاحظة:** المتصفح سيظهر تحذير أمني، لكن الموقع سيعمل.

## 🎮 اختبار الموقع

### فحص الوصول:
```bash
# من داخل VPS
curl http://localhost/

# فحص الروابط المختصرة
curl http://localhost/mario
curl http://localhost/launcher
```

### من جهازك:
```
# افتح المتصفح واذهب إلى:
http://YOUR-VPS-IP/
```

## 📱 مشاركة الموقع

### يمكنك مشاركة الروابط:
- `http://YOUR-VPS-IP/` - الصفحة الرئيسية
- `http://YOUR-VPS-IP/mario` - لعبة Mario مباشرة
- `http://YOUR-VPS-IP/launcher` - اللانشر المتقدم

## 🛠️ استكشاف الأخطاء

### إذا لم يعمل الموقع:
```bash
# فحص حالة Apache
systemctl status apache2

# فحص المنافذ المفتوحة
netstat -tlnp | grep :80

# فحص Firewall
ufw status

# فتح المنفذ 80 إذا كان مغلق
ufw allow 80
```

### إذا كانت الروابط المختصرة لا تعمل:
```bash
# تفعيل mod_rewrite
a2enmod rewrite
systemctl restart apache2

# فحص ملف .htaccess
cat /var/www/html/.htaccess
```

## 💡 نصائح مهمة

### الأمان:
- **غيّر كلمة مرور root** للخادم
- **فعّل Firewall** واتركه يسمح بالمنافذ 22, 80, 443 فقط
- **حدّث النظام** بانتظام

### الأداء:
- **راقب استهلاك الموارد** بـ `htop`
- **فعّل الضغط** في Apache (موجود في .htaccess)
- **استخدم Cache** للملفات الثابتة

## 🎯 الخلاصة

**لا تحتاج دومين للبدء!** يمكنك:

1. ✅ **استخدام IP الخادم مباشرة**
2. ✅ **الحصول على دومين مجاني لاحقاً**
3. ✅ **شراء دومين مدفوع عند الحاجة**

**الموقع سيعمل بشكل ممتاز مع IP الخادم فقط!**

---

**🎉 ابدأ الآن باستخدام IP الخادم، وأضف الدومين لاحقاً عند الحاجة!**
