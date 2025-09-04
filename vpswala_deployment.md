# 🌐 دليل نشر لانشر الألعاب على VPSWala

## 📋 معلومات VPSWala

**VPSWala** هو مزود استضافة VPS هندي يوفر خوادم افتراضية بأسعار منافسة.

### مميزات VPSWala:
- ✅ أسعار منخفضة
- ✅ دعم Linux و Windows
- ✅ لوحة تحكم سهلة
- ✅ دعم فني 24/7

## 🚀 خطوات النشر على VPSWala

### 1️⃣ إعداد VPS الجديد

```bash
# بعد الحصول على VPS من VPSWala
# الاتصال عبر SSH
ssh root@your-vps-ip

# تحديث النظام
apt update && apt upgrade -y
```

### 2️⃣ تثبيت Web Server

#### خيار A: Apache (مُوصى به للمبتدئين)
```bash
# تثبيت Apache
apt install apache2 -y

# تفعيل Apache
systemctl enable apache2
systemctl start apache2

# فتح المنافذ في Firewall
ufw allow 80
ufw allow 443
ufw enable
```

#### خيار B: Nginx (أسرع في الأداء)
```bash
# تثبيت Nginx
apt install nginx -y

# تفعيل Nginx
systemctl enable nginx
systemctl start nginx
```

### 3️⃣ رفع ملفات اللانشر

#### الطريقة 1: SCP من جهازك
```bash
# من جهاز Windows (PowerShell)
scp -r "C:\Users\Dark_air05\CascadeProjects\launcher\*" root@your-vps-ip:/var/www/html/
```

#### الطريقة 2: تحميل مباشر على VPS
```bash
# إنشاء مجلد مؤقت
mkdir /tmp/launcher
cd /tmp/launcher

# تحميل الملفات (إذا كانت في GitHub أو رابط)
# أو نسخ الملفات يدوياً

# نسخ إلى مجلد الويب
cp -r * /var/www/html/
```

#### الطريقة 3: استخدام FileZilla/WinSCP
```
Host: your-vps-ip
Username: root
Password: your-password
Port: 22
Protocol: SFTP

# ارفع الملفات إلى: /var/www/html/
```

### 4️⃣ تعيين الصلاحيات

```bash
# تعيين المالك الصحيح
chown -R www-data:www-data /var/www/html/

# تعيين الصلاحيات
chmod -R 755 /var/www/html/

# التأكد من ملف .htaccess
chmod 644 /var/www/html/.htaccess
```

### 5️⃣ إعداد Domain (اختياري)

#### إذا كان لديك دومين:
```bash
# إعداد Virtual Host في Apache
nano /etc/apache2/sites-available/mario-launcher.conf

# إضافة التكوين:
<VirtualHost *:80>
    ServerName your-domain.com
    ServerAlias www.your-domain.com
    DocumentRoot /var/www/html
    
    <Directory /var/www/html>
        AllowOverride All
        Require all granted
    </Directory>
    
    ErrorLog ${APACHE_LOG_DIR}/mario-launcher_error.log
    CustomLog ${APACHE_LOG_DIR}/mario-launcher_access.log combined
</VirtualHost>

# تفعيل الموقع
a2ensite mario-launcher.conf
a2enmod rewrite
systemctl reload apache2
```

### 6️⃣ تثبيت SSL (HTTPS)

```bash
# تثبيت Certbot
apt install certbot python3-certbot-apache -y

# الحصول على شهادة SSL
certbot --apache -d your-domain.com -d www.your-domain.com

# تجديد تلقائي
crontab -e
# إضافة: 0 12 * * * /usr/bin/certbot renew --quiet
```

## 🔧 إعدادات خاصة بـ VPSWala

### تحسين الأداء:
```bash
# تحسين Apache للموارد المحدودة
nano /etc/apache2/apache2.conf

# إضافة في النهاية:
ServerTokens Prod
ServerSignature Off

# تقليل استهلاك الذاكرة
<IfModule mpm_prefork_module>
    StartServers 2
    MinSpareServers 2
    MaxSpareServers 5
    MaxRequestWorkers 50
    MaxConnectionsPerChild 1000
</IfModule>
```

### مراقبة الموارد:
```bash
# فحص استهلاك الذاكرة
free -m

# فحص استهلاك القرص
df -h

# فحص العمليات
htop
```

## 🛠️ استكشاف الأخطاء الشائعة

### مشكلة: الموقع لا يظهر
```bash
# فحص حالة Apache
systemctl status apache2

# فحص اللوجات
tail -f /var/log/apache2/error.log

# فحص الصلاحيات
ls -la /var/www/html/
```

### مشكلة: .htaccess لا يعمل
```bash
# تفعيل mod_rewrite
a2enmod rewrite
systemctl restart apache2

# فحص AllowOverride في التكوين
nano /etc/apache2/apache2.conf
# تأكد من: AllowOverride All
```

### مشكلة: بطء في التحميل
```bash
# تفعيل ضغط gzip
a2enmod deflate
systemctl restart apache2

# تحسين Cache
a2enmod expires
a2enmod headers
systemctl restart apache2
```

## 📊 مراقبة الأداء

### أدوات المراقبة:
```bash
# تثبيت أدوات المراقبة
apt install htop iotop nethogs -y

# مراقبة الشبكة
nethogs

# مراقبة القرص
iotop

# مراقبة النظام
htop
```

### إعداد تنبيهات:
```bash
# إنشاء سكريبت مراقبة بسيط
nano /root/monitor.sh

#!/bin/bash
# فحص استهلاك الذاكرة
MEMORY=$(free | grep Mem | awk '{printf("%.2f", $3/$2 * 100.0)}')
if (( $(echo "$MEMORY > 80" | bc -l) )); then
    echo "تحذير: استهلاك الذاكرة عالي: $MEMORY%"
fi

# جعل السكريبت قابل للتنفيذ
chmod +x /root/monitor.sh

# إضافة للـ cron للتشغيل كل 5 دقائق
crontab -e
# إضافة: */5 * * * * /root/monitor.sh
```

## 💰 تحسين التكلفة

### نصائح لتوفير الموارد:
- **استخدم Apache بدلاً من Nginx** إذا كنت مبتدئ
- **فعّل الضغط** لتوفير Bandwidth
- **استخدم Cache** لتقليل استهلاك CPU
- **راقب الموارد** بانتظام

## 🎯 الخلاصة

### ما ستحصل عليه:
- ✅ موقع سريع ومستقر
- ✅ دعم HTTPS مجاني
- ✅ روابط مختصرة تعمل
- ✅ تحسينات أداء تلقائية
- ✅ حماية أمنية متقدمة

### الروابط النهائية:
- `http://your-vps-ip/` - الصفحة الرئيسية
- `http://your-vps-ip/mario` - لعبة Mario
- `http://your-vps-ip/launcher` - اللانشر المتقدم

---

**🎉 مبروك! لانشر الألعاب جاهز للعمل على VPSWala!**

### 📞 الدعم:
إذا واجهت أي مشاكل، تواصل مع دعم VPSWala أو راجع لوجات الأخطاء في `/var/log/apache2/error.log`
