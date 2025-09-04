@echo off
echo Installing PyInstaller...
pip install pyinstaller

echo Building EXE file...
pyinstaller --onefile --windowed --name=ApplicationLauncher launcher.py

echo.
echo Build completed! Check the dist folder for ApplicationLauncher.exe
pause
