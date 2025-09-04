@echo off
title Building Game Launcher EXE
echo.
echo ========================================
echo    🔨 بناء لانشر الألعاب EXE
echo ========================================
echo.

REM Check if Python is installed
python --version >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo ❌ Python غير مثبت. يرجى تثبيت Python أولاً.
    pause
    exit /b 1
)

echo ✅ تم العثور على Python
echo.

REM Install requirements
echo 📦 تثبيت المتطلبات...
python -m pip install --upgrade pip
python -m pip install -r requirements.txt

if %ERRORLEVEL% NEQ 0 (
    echo ❌ فشل في تثبيت المتطلبات
    pause
    exit /b 1
)

echo ✅ تم تثبيت المتطلبات بنجاح
echo.

REM Build EXE
echo 🔨 بناء ملف EXE...
python build_exe.py

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ========================================
    echo    🎉 تم بناء اللانشر بنجاح!
    echo ========================================
    echo.
    echo 📁 ستجد ملف GameLauncher.exe في مجلد dist
    echo.
    
    REM Check if EXE exists and show its location
    if exist "dist\GameLauncher.exe" (
        echo 📍 مسار الملف: %CD%\dist\GameLauncher.exe
        echo.
        echo هل تريد تشغيل اللانشر الآن؟ (y/n)
        set /p run_launcher=
        if /i "%run_launcher%"=="y" (
            start "" "dist\GameLauncher.exe"
        )
    )
) else (
    echo.
    echo ❌ فشل في بناء اللانشر
)

echo.
pause
