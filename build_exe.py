#!/usr/bin/env python3
"""
Build script to build the Game Launcher as an EXE file using PyInstaller
"""
import os
import subprocess
import sys
from pathlib import Path

def build_exe():
    """Build the launcher as an EXE file"""
    print("🔨 Building Game Launcher EXE...")
    
    # Check if PyInstaller is installed
    try:
        import PyInstaller
    except ImportError:
        print("❌ PyInstaller not found. Installing...")
        subprocess.check_call([sys.executable, "-m", "pip", "install", "pyinstaller"])
    
    # Build command
    build_command = [
        "pyinstaller",
        "--onefile",                    # Single EXE file
        "--windowed",                   # No console window
        "--name=GameLauncher",          # EXE name
        "--icon=icon.ico",             # Icon (if exists)
        "--add-data=mario_game.html;.",  # Include game file
        "--add-data=game_launcher.html;.",  # Include web launcher
        "game_launcher.py"              # Main Python file
    ]
    
    # Remove icon parameter if icon file doesn't exist
    if not Path("icon.ico").exists():
        build_command = [cmd for cmd in build_command if not cmd.startswith("--icon")]
    
    try:
        # Run PyInstaller
        result = subprocess.run(build_command, check=True, capture_output=True, text=True)
        print("✅ Build successful!")
        print("📁 EXE file created in 'dist' folder")
        
        # Check if EXE was created
        exe_path = Path("dist/GameLauncher.exe")
        if exe_path.exists():
            print(f"🎉 EXE file size: {exe_path.stat().st_size / 1024 / 1024:.1f} MB")
            print(f"📍 Location: {exe_path.absolute()}")
        
    except subprocess.CalledProcessError as e:
        print(f"❌ Build failed: {e}")
        print(f"Error output: {e.stderr}")
        return False
    
    return True

def clean_build():
    """Clean build files"""
    import shutil
    
    folders_to_clean = ["build", "__pycache__"]
    files_to_clean = ["*.spec"]
    
    for folder in folders_to_clean:
        if Path(folder).exists():
            shutil.rmtree(folder)
            print(f"🧹 Cleaned {folder}")
    
    for pattern in files_to_clean:
        for file in Path(".").glob(pattern):
            file.unlink()
            print(f"🧹 Cleaned {file}")

if __name__ == "__main__":
    print("🎮 Game Launcher EXE Builder")
    print("=" * 40)
    
    if build_exe():
        print("\n✅ Build completed successfully!")
        print("You can now run the EXE file from the 'dist' folder")
        
        # Ask if user wants to clean build files
        clean = input("\n🧹 Clean build files? (y/n): ").lower().strip()
        if clean in ['y', 'yes']:
            clean_build()
    else:
        print("\n❌ Build failed!")
        sys.exit(1)
