# 🖥️ دليل نشر لانشر الألعاب على VPS

## ✅ متطلبات VPS

### الحد الأدنى:
- **RAM:** 512 MB (1 GB مُوصى به)
- **Storage:** 1 GB مساحة حرة
- **OS:** Linux (Ubuntu/CentOS) أو Windows Server
- **Web Server:** Apache/Nginx/IIS

## 🚀 طرق النشر على VPS

### 1️⃣ طريقة Apache (Linux)

```bash
# تثبيت Apache
sudo apt update
sudo apt install apache2

# نسخ الملفات
sudo cp -r /path/to/launcher/* /var/www/html/

# تعيين الصلاحيات
sudo chown -R www-data:www-data /var/www/html/
sudo chmod -R 755 /var/www/html/

# إعادة تشغيل Apache
sudo systemctl restart apache2
```

### 2️⃣ طريقة Nginx (Linux)

```bash
# تثبيت Nginx
sudo apt install nginx

# إعداد الموقع
sudo nano /etc/nginx/sites-available/mario-launcher

# إضافة التكوين:
server {
    listen 80;
    server_name your-domain.com;
    root /var/www/mario-launcher;
    index index.html;
    
    location / {
        try_files $uri $uri/ =404;
    }
    
    # تحسين الأداء
    location ~* \.(js|css|png|jpg|jpeg|gif|ico|svg)$ {
        expires 1y;
        add_header Cache-Control "public, immutable";
    }
}

# تفعيل الموقع
sudo ln -s /etc/nginx/sites-available/mario-launcher /etc/nginx/sites-enabled/
sudo systemctl restart nginx
```

### 3️⃣ طريقة Windows Server + IIS

```powershell
# تفعيل IIS
Enable-WindowsOptionalFeature -Online -FeatureName IIS-WebServerRole

# نسخ الملفات إلى
C:\inetpub\wwwroot\mario-launcher\

# إعداد الموقع في IIS Manager
```

## 📁 هيكل الملفات على VPS

```
/var/www/html/ (أو مجلد الويب)
├── index.html                 # الصفحة الرئيسية
├── launcher_advanced.html     # اللانشر المتقدم
├── mario_game.html           # لعبة Mario
├── game_launcher.html        # اللانشر الأساسي
├── .htaccess                 # إعدادات Apache (سيتم إنشاؤه)
└── assets/                   # الملفات الإضافية (إن وجدت)
```

## ⚙️ إعدادات الخادم

### Apache (.htaccess):
```apache
# تفعيل ضغط الملفات
<IfModule mod_deflate.c>
    AddOutputFilterByType DEFLATE text/html text/css text/javascript application/javascript
</IfModule>

# إعدادات Cache
<IfModule mod_expires.c>
    ExpiresActive On
    ExpiresByType text/html "access plus 1 hour"
    ExpiresByType text/css "access plus 1 year"
    ExpiresByType application/javascript "access plus 1 year"
</IfModule>

# إعادة توجيه للصفحة الرئيسية
DirectoryIndex index.html

# إعدادات الأمان
Header always set X-Frame-Options DENY
Header always set X-Content-Type-Options nosniff
Header always set X-XSS-Protection "1; mode=block"
```

### Nginx إضافي:
```nginx
# في ملف التكوين
gzip on;
gzip_types text/html text/css application/javascript;

# إعادة التوجيه
location /launcher { return 301 /launcher_advanced.html; }
location /mario { return 301 /mario_game.html; }
location /game { return 301 /game_launcher.html; }
```

## 🔒 إعدادات SSL (HTTPS)

### Let's Encrypt (مجاني):
```bash
# تثبيت Certbot
sudo apt install certbot python3-certbot-apache

# الحصول على شهادة SSL
sudo certbot --apache -d your-domain.com

# تجديد تلقائي
sudo crontab -e
# إضافة: 0 12 * * * /usr/bin/certbot renew --quiet
```

## 📊 مراقبة الأداء

### أدوات المراقبة:
```bash
# مراقبة استخدام الموارد
htop
df -h
free -m

# مراقبة لوجات الويب
tail -f /var/log/apache2/access.log
tail -f /var/log/nginx/access.log
```

## 🚀 خطوات النشر السريع

### 1. رفع الملفات:
```bash
# باستخدام SCP
scp -r launcher/ user@your-vps-ip:/var/www/html/

# أو باستخدام SFTP/FTP client
```

### 2. تعيين الصلاحيات:
```bash
sudo chown -R www-data:www-data /var/www/html/
sudo chmod -R 755 /var/www/html/
```

### 3. اختبار الموقع:
```bash
# زيارة الموقع
http://your-vps-ip/
http://your-domain.com/
```

## 🔧 استكشاف الأخطاء

### مشاكل شائعة:
```bash
# فحص حالة الخادم
sudo systemctl status apache2
sudo systemctl status nginx

# فحص اللوجات
sudo tail -f /var/log/apache2/error.log
sudo tail -f /var/log/nginx/error.log

# فحص الصلاحيات
ls -la /var/www/html/
```

## 💡 نصائح للأداء

### تحسينات:
- **تفعيل Gzip** لضغط الملفات
- **إعداد Cache Headers** للملفات الثابتة
- **استخدام CDN** للملفات الكبيرة
- **تحسين الصور** إذا أضفت أي صور

### مراقبة الموارد:
- **CPU Usage:** يجب أن يكون أقل من 50%
- **RAM Usage:** يجب أن يكون أقل من 80%
- **Disk Space:** احتفظ بـ 20% مساحة حرة

## 🎯 الخلاصة

التطبيق سيعمل بشكل ممتاز على VPS لأنه:
- **ملفات HTML/CSS/JS** فقط
- **لا يحتاج قاعدة بيانات**
- **لا يحتاج معالجة خادم**
- **استهلاك موارد قليل جداً**

---

**🎉 مبروك! لانشر الألعاب جاهز للعمل على VPS الخاص بك!**
