
#!/bin/bash
# Скрипт запуска для облачной среды Railway

echo "🚀 Запуск облачного RPA-бота на Railway..."

# Проверка переменных окружения
if [ -z "$SUPABASE_URL" ]; then
    echo "❌ Не установлена переменная SUPABASE_URL"
    exit 1
fi

if [ -z "$SUPABASE_SERVICE_KEY" ]; then
    echo "⚠️  Не установлена переменная SUPABASE_SERVICE_KEY"
    echo "Бот будет работать без отправки результатов в Supabase"
fi

# Запуск виртуального дисплея для GUI приложений
echo "🖥️  Запуск виртуального дисплея..."
Xvfb :99 -screen 0 1920x1080x24 &
export DISPLAY=:99

# Ожидание готовности дисплея
sleep 3

# Проверка доступности Chrome
echo "🌐 Проверка Google Chrome..."
google-chrome --version || {
    echo "❌ Google Chrome не найден"
    exit 1
}

# Проверка ChromeDriver
echo "🚗 Проверка ChromeDriver..."
chromedriver --version || {
    echo "❌ ChromeDriver не найден"
    exit 1
}

echo "✅ Все компоненты готовы для Railway"
echo "🤖 Запуск облачного RPA-бота..."

# Запуск основного приложения
python rpa_bot_cloud.py
