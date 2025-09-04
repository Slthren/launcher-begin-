@echo off
title Game Launcher - لانشر الألعاب
echo.
echo ========================================
echo    🎮 مرحباً بك في لانشر الألعاب 🎮
echo ========================================
echo.
echo جاري تشغيل اللانشر...
echo.

REM Check if Chrome is available
where chrome >nul 2>nul
if %ERRORLEVEL% EQU 0 (
    echo تم العثور على Chrome - جاري التشغيل...
    start chrome --app="file:///%~dp0game_launcher.html" --window-size=1200,800 --disable-web-security --allow-file-access-from-files
    goto :end
)

REM Check if Edge is available
where msedge >nul 2>nul
if %ERRORLEVEL% EQU 0 (
    echo تم العثور على Edge - جاري التشغيل...
    start msedge --app="file:///%~dp0game_launcher.html" --window-size=1200,800
    goto :end
)

REM Fallback to default browser
echo جاري التشغيل بالمتصفح الافتراضي...
start "" "file:///%~dp0game_launcher.html"

:end
echo.
echo تم تشغيل اللانشر بنجاح! 🚀
echo يمكنك إغلاق هذه النافذة الآن.
echo.
pause
