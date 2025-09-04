@echo off
title Game Launcher - لانشر الألعاب
echo.
echo ========================================
echo    🎮 لانشر الألعاب - Game Launcher
echo ========================================
echo.
echo اختر طريقة التشغيل:
echo.
echo 1. لانشر الويب المحسن (HTML)
echo 2. لانشر سطح المكتب (PowerShell)
echo 3. لعبة Mario مباشرة
echo 4. إنشاء اختصار سطح المكتب
echo 5. خروج
echo.
set /p choice=اختر رقم (1-5): 

if "%choice%"=="1" goto web_launcher
if "%choice%"=="2" goto desktop_launcher
if "%choice%"=="3" goto mario_direct
if "%choice%"=="4" goto create_shortcut
if "%choice%"=="5" goto exit
goto invalid_choice

:web_launcher
echo.
echo 🌐 جاري تشغيل لانشر الويب المحسن...
if exist "launcher_advanced.html" (
    start "" "launcher_advanced.html"
) else if exist "game_launcher.html" (
    start "" "game_launcher.html"
) else (
    echo ❌ لم يتم العثور على ملف لانشر الويب
    pause
    goto menu
)
goto end

:desktop_launcher
echo.
echo 🖥️ جاري تشغيل لانشر سطح المكتب...
if exist "launcher_desktop.ps1" (
    powershell -ExecutionPolicy Bypass -File "launcher_desktop.ps1"
) else (
    echo ❌ لم يتم العثور على ملف لانشر سطح المكتب
    pause
    goto menu
)
goto end

:mario_direct
echo.
echo 🍄 جاري تشغيل Super Mario Bros مباشرة...
if exist "mario_game.html" (
    start "" "mario_game.html"
) else (
    echo ❌ لم يتم العثور على ملف اللعبة
    pause
    goto menu
)
goto end

:create_shortcut
echo.
echo 🔗 جاري إنشاء اختصار سطح المكتب...
if exist "create_shortcut.vbs" (
    cscript "create_shortcut.vbs"
) else (
    echo ❌ لم يتم العثور على ملف إنشاء الاختصار
)
pause
goto menu

:invalid_choice
echo.
echo ❌ اختيار غير صحيح. يرجى اختيار رقم من 1 إلى 5.
pause
goto menu

:menu
cls
goto start

:end
echo.
echo ✅ تم تشغيل اللانشر بنجاح!
echo يمكنك إغلاق هذه النافذة الآن.

:exit
echo.
pause
