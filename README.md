# Application Launcher

A modern Windows application launcher with GUI that can be compiled to a standalone EXE file.
## Features

- **Modern GUI**: Clean, dark-themed interface built with tkinter
- **Easy App Management**: Add, remove, and launch applications with simple clicks
- **Persistent Storage**: Saves your application list in a JSON configuration file
- **Standalone EXE**:# لانشر الألعاب - Game Launcher

لانشر سطح مكتب متطور للألعاب مع لعبة Super Mario Bros كاملة ومتقدمة.

## المميزات

### لانشر الألعاب:
- **واجهة عربية جميلة** مع تأثيرات بصرية متقدمة
- **إحصائيات اللعب** المحفوظة تلقائياً
- **نظام إشعارات** تفاعلي
- **اختصارات لوحة المفاتيح** للتشغيل السريع
- **دعم متعدد المتصفحات** (Chrome, Edge, Firefox)

### لعبة Super Mario Bros:
- **6 مراحل متدرجة الصعوبة** مع تحديات متنوعة
- **نظام متجر متقدم** مع 7 عناصر للشراء
- **زهرة النار الجديدة** مع إطلاق الكرات النارية
- **منصات متحركة** في المراحل المتقدمة
- **معركة البوس النهائي** ضد Bowser
- **تأثيرات طقس ديناميكية** (مطر، ثلج، دورة نهار/ليل)
- **نظام إنجازات وإحصائيات** شامل
- **تأثيرات بصرية متقدمة** مع جسيمات وانفجارات

## التثبيت والتشغيل

### الطريقة السريعة:
1. **انقر نقراً مزدوجاً** على `launcher.bat`
2. سيتم تشغيل اللانشر تلقائياً

### إنشاء اختصار سطح المكتب:
1. **انقر نقراً مزدوجاً** على `create_shortcut.vbs`
2. سيتم إنشاء اختصار على سطح المكتب
3. **انقر على الاختصار** لتشغيل اللانشر

### التشغيل اليدوي:
1. افتح `game_launcher.html` في المتصفح
2. انقر على لعبة Super Mario للبدء

## كيفية اللعب

### التحكم الأساسي:
- **الحركة**: الأسهم أو WASD
- **القفز**: مسافة أو سهم لأعلى
- **إطلاق النار**: X (مع زهرة النار)

### اختصارات اللانشر:
- **1**: تشغيل Super Mario مباشرة
- **F1**: فتح الإعدادات
- **Escape**: إغلاق اللانشر

## نظام المتجر

### العناصر المتوفرة:
- **فطر إضافي** (50 عملة) - يجعلك كبيراً في بداية المرحلة
- **زهرة النار** (150 عملة) - القدرة على إطلاق الكرات النارية
- **حياة إضافية** (100 عملة) - يضيف حياة واحدة
- **تسريع** (75 عملة) - يزيد سرعة الحركة
- **قفزة قوية** (80 عملة) - يزيد قوة القفز
- **درع واقي** (120 عملة) - حماية من الأعداء لـ30 ثانية
- **مضاعف العملات** (120 عملة) - يضاعف العملات المجمعة

## نظام الإنجازات

- **جامع العملات**: اجمع 100 عملة
- **قاهر الأعداء**: اهزم 50 عدو
- **المستكشف**: أكمل جميع المراحل
- **السريع**: أكمل مرحلة في أقل من دقيقتين
- **الناجي**: أكمل مرحلة بدون خسارة حياة

## الميزات التقنية

### اللانشر:
- **HTML5/CSS3/JavaScript** مع تأثيرات متقدمة
- **Local Storage** لحفظ الإحصائيات
- **Responsive Design** يتكيف مع جميع الشاشات
- **Cross-browser Support** متوافق مع جميع المتصفحات

### اللعبة:
- **Canvas API** للرسم والتحريك
- **Custom Physics Engine** لفيزياء واقعية
- **Advanced Collision Detection** نظام تصادم متطور
- **Particle System** نظام جسيمات للتأثيرات
- **Dynamic Weather System** نظام طقس ديناميكي

## هيكل الملفات

```
launcher/
├── game_launcher.html      # اللانشر الرئيسي
├── mario_game.html         # لعبة Super Mario
├── launcher.bat           # ملف التشغيل
├── create_shortcut.vbs    # إنشاء اختصار سطح المكتب
└── README.md             # هذا الملف
```

## المتطلبات

- **نظام التشغيل**: Windows 7/8/10/11
- **المتصفح**: Chrome, Edge, Firefox (أحدث إصدار)
- **الذاكرة**: 2GB RAM أو أكثر
- **المساحة**: 50MB مساحة فارغة

## الألعاب القادمة

- **سباق السيارات** - قريباً
- **حرب الفضاء** - قريباً  
- **ألغاز الذكاء** - قريباً

## الدعم

إذا واجهت أي مشاكل:
1. تأكد من تحديث المتصفح
2. تأكد من تمكين JavaScript
3. جرب متصفح مختلف
4. أعد تشغيل اللانشر

---

**تم التطوير بواسطة Cascade AI** 
**الإصدار 1.0 - 2024** 

استمتع باللعب! 

## Files

- `launcher.py` - Main application code
- `build_exe.py` - Script to build the EXE file
- `requirements.txt` - Python dependencies
- `launcher_config.json` - Configuration file (created automatically)

## Requirements

- Python 3.6+
- tkinter (usually included with Python)
- PyInstaller (for building EXE)

## Distribution

The generated EXE file is completely standalone and can be distributed to other Windows computers without requiring Python installation.
