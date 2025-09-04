Set WshShell = CreateObject("WScript.Shell")
Set oShellLink = WshShell.CreateShortcut(WshShell.SpecialFolders("Desktop") & "\لانشر الألعاب.lnk")
oShellLink.TargetPath = WshShell.CurrentDirectory & "\launcher.bat"
oShellLink.WorkingDirectory = WshShell.CurrentDirectory
oShellLink.IconLocation = "shell32.dll,14"
oShellLink.Description = "لانشر الألعاب - Game Launcher"
oShellLink.Save

WScript.Echo "تم إنشاء اختصار اللانشر على سطح المكتب بنجاح! 🎮"
