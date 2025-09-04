# PowerShell Game Launcher
# لانشر الألعاب بـ PowerShell

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Create main form
$form = New-Object System.Windows.Forms.Form
$form.Text = "🎮 لانشر الألعاب - Game Launcher"
$form.Size = New-Object System.Drawing.Size(800, 600)
$form.StartPosition = "CenterScreen"
$form.BackColor = [System.Drawing.Color]::FromArgb(26, 26, 46)
$form.FormBorderStyle = "FixedDialog"
$form.MaximizeBox = $false

# Title Label
$titleLabel = New-Object System.Windows.Forms.Label
$titleLabel.Text = "🎮 لانشر الألعاب"
$titleLabel.Font = New-Object System.Drawing.Font("Arial", 24, [System.Drawing.FontStyle]::Bold)
$titleLabel.ForeColor = [System.Drawing.Color]::Gold
$titleLabel.BackColor = [System.Drawing.Color]::Transparent
$titleLabel.Size = New-Object System.Drawing.Size(760, 50)
$titleLabel.Location = New-Object System.Drawing.Point(20, 20)
$titleLabel.TextAlign = "MiddleCenter"
$form.Controls.Add($titleLabel)

# Subtitle Label
$subtitleLabel = New-Object System.Windows.Forms.Label
$subtitleLabel.Text = "مجموعة الألعاب المتطورة - استمتع بأفضل الألعاب"
$subtitleLabel.Font = New-Object System.Drawing.Font("Arial", 12)
$subtitleLabel.ForeColor = [System.Drawing.Color]::LightGray
$subtitleLabel.BackColor = [System.Drawing.Color]::Transparent
$subtitleLabel.Size = New-Object System.Drawing.Size(760, 30)
$subtitleLabel.Location = New-Object System.Drawing.Point(20, 70)
$subtitleLabel.TextAlign = "MiddleCenter"
$form.Controls.Add($subtitleLabel)

# Mario Game Panel
$marioPanel = New-Object System.Windows.Forms.Panel
$marioPanel.Size = New-Object System.Drawing.Size(740, 120)
$marioPanel.Location = New-Object System.Drawing.Point(30, 120)
$marioPanel.BackColor = [System.Drawing.Color]::FromArgb(45, 74, 135)
$marioPanel.BorderStyle = "FixedSingle"
$form.Controls.Add($marioPanel)

# Mario Icon Label
$marioIcon = New-Object System.Windows.Forms.Label
$marioIcon.Text = "🍄"
$marioIcon.Font = New-Object System.Drawing.Font("Arial", 48)
$marioIcon.Size = New-Object System.Drawing.Size(80, 80)
$marioIcon.Location = New-Object System.Drawing.Point(20, 20)
$marioIcon.TextAlign = "MiddleCenter"
$marioPanel.Controls.Add($marioIcon)

# Mario Title
$marioTitle = New-Object System.Windows.Forms.Label
$marioTitle.Text = "Super Mario Bros"
$marioTitle.Font = New-Object System.Drawing.Font("Arial", 16, [System.Drawing.FontStyle]::Bold)
$marioTitle.ForeColor = [System.Drawing.Color]::White
$marioTitle.BackColor = [System.Drawing.Color]::Transparent
$marioTitle.Size = New-Object System.Drawing.Size(300, 30)
$marioTitle.Location = New-Object System.Drawing.Point(120, 20)
$marioPanel.Controls.Add($marioTitle)

# Mario Description
$marioDesc = New-Object System.Windows.Forms.Label
$marioDesc.Text = "لعبة المنصات الكلاسيكية مع ماريو! 6 مراحل، متجر، قوى خارقة"
$marioDesc.Font = New-Object System.Drawing.Font("Arial", 10)
$marioDesc.ForeColor = [System.Drawing.Color]::LightGray
$marioDesc.BackColor = [System.Drawing.Color]::Transparent
$marioDesc.Size = New-Object System.Drawing.Size(400, 40)
$marioDesc.Location = New-Object System.Drawing.Point(120, 50)
$marioPanel.Controls.Add($marioDesc)

# Mario Play Button
$marioButton = New-Object System.Windows.Forms.Button
$marioButton.Text = "▶ العب الآن"
$marioButton.Font = New-Object System.Drawing.Font("Arial", 12, [System.Drawing.FontStyle]::Bold)
$marioButton.Size = New-Object System.Drawing.Size(120, 40)
$marioButton.Location = New-Object System.Drawing.Point(580, 40)
$marioButton.BackColor = [System.Drawing.Color]::FromArgb(76, 175, 80)
$marioButton.ForeColor = [System.Drawing.Color]::White
$marioButton.FlatStyle = "Flat"
$marioButton.Add_Click({
    try {
        $marioPath = Join-Path $PSScriptRoot "mario_game.html"
        if (Test-Path $marioPath) {
            [System.Windows.Forms.MessageBox]::Show("🍄 جاري تشغيل Super Mario Bros...", "لانشر الألعاب", "OK", "Information")
            Start-Process $marioPath
        } else {
            [System.Windows.Forms.MessageBox]::Show("❌ لم يتم العثور على ملف اللعبة mario_game.html", "خطأ", "OK", "Error")
        }
    } catch {
        [System.Windows.Forms.MessageBox]::Show("❌ خطأ في تشغيل اللعبة: $($_.Exception.Message)", "خطأ", "OK", "Error")
    }
})
$marioPanel.Controls.Add($marioButton)

# Coming Soon Games
$comingSoonGames = @(
    @{Icon="🏎️"; Title="سباق السيارات"; Desc="سباقات مثيرة بسيارات سريعة"},
    @{Icon="🚀"; Title="حرب الفضاء"; Desc="معركة ملحمية في الفضاء"},
    @{Icon="🧩"; Title="ألغاز الذكاء"; Desc="تحديات ذهنية متنوعة"}
)

$yPos = 260
foreach ($game in $comingSoonGames) {
    $gamePanel = New-Object System.Windows.Forms.Panel
    $gamePanel.Size = New-Object System.Drawing.Size(740, 60)
    $gamePanel.Location = New-Object System.Drawing.Point(30, $yPos)
    $gamePanel.BackColor = [System.Drawing.Color]::FromArgb(68, 68, 68)
    $gamePanel.BorderStyle = "FixedSingle"
    $form.Controls.Add($gamePanel)
    
    # Game Icon
    $gameIcon = New-Object System.Windows.Forms.Label
    $gameIcon.Text = $game.Icon
    $gameIcon.Font = New-Object System.Drawing.Font("Arial", 24)
    $gameIcon.Size = New-Object System.Drawing.Size(50, 40)
    $gameIcon.Location = New-Object System.Drawing.Point(20, 10)
    $gameIcon.TextAlign = "MiddleCenter"
    $gamePanel.Controls.Add($gameIcon)
    
    # Game Title
    $gameTitle = New-Object System.Windows.Forms.Label
    $gameTitle.Text = $game.Title
    $gameTitle.Font = New-Object System.Drawing.Font("Arial", 12, [System.Drawing.FontStyle]::Bold)
    $gameTitle.ForeColor = [System.Drawing.Color]::Gray
    $gameTitle.BackColor = [System.Drawing.Color]::Transparent
    $gameTitle.Size = New-Object System.Drawing.Size(200, 20)
    $gameTitle.Location = New-Object System.Drawing.Point(80, 10)
    $gamePanel.Controls.Add($gameTitle)
    
    # Game Description
    $gameDesc = New-Object System.Windows.Forms.Label
    $gameDesc.Text = $game.Desc
    $gameDesc.Font = New-Object System.Drawing.Font("Arial", 9)
    $gameDesc.ForeColor = [System.Drawing.Color]::DarkGray
    $gameDesc.BackColor = [System.Drawing.Color]::Transparent
    $gameDesc.Size = New-Object System.Drawing.Size(300, 20)
    $gameDesc.Location = New-Object System.Drawing.Point(80, 30)
    $gamePanel.Controls.Add($gameDesc)
    
    # Coming Soon Label
    $comingSoonLabel = New-Object System.Windows.Forms.Label
    $comingSoonLabel.Text = "قريباً"
    $comingSoonLabel.Font = New-Object System.Drawing.Font("Arial", 10, [System.Drawing.FontStyle]::Bold)
    $comingSoonLabel.ForeColor = [System.Drawing.Color]::White
    $comingSoonLabel.BackColor = [System.Drawing.Color]::FromArgb(255, 87, 34)
    $comingSoonLabel.Size = New-Object System.Drawing.Size(60, 25)
    $comingSoonLabel.Location = New-Object System.Drawing.Point(650, 17)
    $comingSoonLabel.TextAlign = "MiddleCenter"
    $gamePanel.Controls.Add($comingSoonLabel)
    
    $yPos += 70
}

# Settings Button
$settingsButton = New-Object System.Windows.Forms.Button
$settingsButton.Text = "⚙️ الإعدادات"
$settingsButton.Font = New-Object System.Drawing.Font("Arial", 10)
$settingsButton.Size = New-Object System.Drawing.Size(100, 35)
$settingsButton.Location = New-Object System.Drawing.Point(30, 520)
$settingsButton.BackColor = [System.Drawing.Color]::FromArgb(96, 125, 139)
$settingsButton.ForeColor = [System.Drawing.Color]::White
$settingsButton.FlatStyle = "Flat"
$settingsButton.Add_Click({
    $settingsText = @"
🎮 لانشر الألعاب - الإصدار 1.0

الألعاب المتوفرة:
✅ Super Mario Bros - متوفر
⏳ سباق السيارات - قريباً
⏳ حرب الفضاء - قريباً
⏳ ألغاز الذكاء - قريباً

تم التطوير بواسطة Cascade AI
© 2024 جميع الحقوق محفوظة
"@
    [System.Windows.Forms.MessageBox]::Show($settingsText, "⚙️ الإعدادات", "OK", "Information")
})
$form.Controls.Add($settingsButton)

# About Button
$aboutButton = New-Object System.Windows.Forms.Button
$aboutButton.Text = "ℹ️ حول"
$aboutButton.Font = New-Object System.Drawing.Font("Arial", 10)
$aboutButton.Size = New-Object System.Drawing.Size(80, 35)
$aboutButton.Location = New-Object System.Drawing.Point(140, 520)
$aboutButton.BackColor = [System.Drawing.Color]::FromArgb(121, 85, 72)
$aboutButton.ForeColor = [System.Drawing.Color]::White
$aboutButton.FlatStyle = "Flat"
$aboutButton.Add_Click({
    $aboutText = @"
🎮 لانشر الألعاب
الإصدار 1.0

تم التطوير بواسطة Cascade AI

الألعاب المتوفرة:
✅ Super Mario Bros - متوفر
⏳ سباق السيارات - قريباً
⏳ حرب الفضاء - قريباً
⏳ ألغاز الذكاء - قريباً

© 2024 جميع الحقوق محفوظة
"@
    [System.Windows.Forms.MessageBox]::Show($aboutText, "حول اللانشر", "OK", "Information")
})
$form.Controls.Add($aboutButton)

# Exit Button
$exitButton = New-Object System.Windows.Forms.Button
$exitButton.Text = "❌ خروج"
$exitButton.Font = New-Object System.Drawing.Font("Arial", 10)
$exitButton.Size = New-Object System.Drawing.Size(80, 35)
$exitButton.Location = New-Object System.Drawing.Point(690, 520)
$exitButton.BackColor = [System.Drawing.Color]::FromArgb(244, 67, 54)
$exitButton.ForeColor = [System.Drawing.Color]::White
$exitButton.FlatStyle = "Flat"
$exitButton.Add_Click({
    $form.Close()
})
$form.Controls.Add($exitButton)

# Web Launcher Button
$webLauncherButton = New-Object System.Windows.Forms.Button
$webLauncherButton.Text = "🌐 لانشر الويب"
$webLauncherButton.Font = New-Object System.Drawing.Font("Arial", 10)
$webLauncherButton.Size = New-Object System.Drawing.Size(120, 35)
$webLauncherButton.Location = New-Object System.Drawing.Point(550, 520)
$webLauncherButton.BackColor = [System.Drawing.Color]::FromArgb(33, 150, 243)
$webLauncherButton.ForeColor = [System.Drawing.Color]::White
$webLauncherButton.FlatStyle = "Flat"
$webLauncherButton.Add_Click({
    try {
        $webLauncherPath = Join-Path $PSScriptRoot "launcher_advanced.html"
        if (Test-Path $webLauncherPath) {
            Start-Process $webLauncherPath
        } else {
            $fallbackPath = Join-Path $PSScriptRoot "game_launcher.html"
            if (Test-Path $fallbackPath) {
                Start-Process $fallbackPath
            } else {
                [System.Windows.Forms.MessageBox]::Show("❌ لم يتم العثور على ملف لانشر الويب", "خطأ", "OK", "Error")
            }
        }
    } catch {
        [System.Windows.Forms.MessageBox]::Show("❌ خطأ في تشغيل لانشر الويب: $($_.Exception.Message)", "خطأ", "OK", "Error")
    }
})
$form.Controls.Add($webLauncherButton)

# Show welcome message
[System.Windows.Forms.MessageBox]::Show("مرحباً بك في لانشر الألعاب! 🎮`n`nاستمتع بلعبة Super Mario Bros المتقدمة!", "لانشر الألعاب", "OK", "Information")

# Show the form
$form.ShowDialog() | Out-Null
