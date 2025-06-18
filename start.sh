
#!/bin/bash
# Скрипт запуска для Railway

echo "🚀 Запуск Cloud RPA Bot на Railway..."

# Проверка переменных окружения
if [ -z "$SUPABASE_URL" ]; then
    echo "⚠️  Переменная SUPABASE_URL не установлена"
fi

if [ -z "$SUPABASE_SERVICE_KEY" ]; then
    echo "⚠️  Переменная SUPABASE_SERVICE_KEY не установлена"
fi

# Запуск виртуального дисплея
echo "🖥️  Запуск виртуального дисплея..."
Xvfb :99 -screen 0 1920x1080x24 &
export DISPLAY=:99

# Ожидание готовности дисплея
sleep 3

# Проверка Chrome
echo "🌐 Проверка Google Chrome..."
google-chrome --version

# Проверка ChromeDriver
echo "🚗 Проверка ChromeDriver..."
chromedriver --version

echo "✅ Все компоненты готовы"
echo "🤖 Запуск RPA Bot..."

# Запуск приложения
python rpa_bot_cloud.py
