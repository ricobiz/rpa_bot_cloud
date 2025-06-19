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

echo "✅ Все компоненты готовы"
echo "🤖 Запуск RPA Bot..."

# Запуск приложения с Gunicorn для лучшей производительности
gunicorn --bind 0.0.0.0:$PORT --workers 1 --timeout 300 rpa_bot_cloud:app