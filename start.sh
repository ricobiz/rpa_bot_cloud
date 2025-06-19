
#!/bin/bash
# Универсальный скрипт запуска для Railway

echo "🚀 Запуск универсального Cloud RPA Bot на Railway..."

# Проверка переменных окружения
if [ -z "$SUPABASE_URL" ]; then
    echo "❌ Переменная SUPABASE_URL не установлена"
    exit 1
fi

if [ -z "$SUPABASE_SERVICE_KEY" ]; then
    echo "⚠️  Переменная SUPABASE_SERVICE_KEY не установлена"
    echo "Бот будет работать без отправки результатов в Supabase"
fi

# Проверка дополнительных переменных
if [ -n "$ANTICAPTCHA_KEY" ]; then
    echo "✅ AntiCaptcha ключ настроен"
else
    echo "⚠️  AntiCaptcha ключ не настроен - решение капчи недоступно"
fi

# Запуск виртуального дисплея
echo "🖥️  Запуск виртуального дисплея..."
Xvfb :99 -screen 0 1920x1080x24 -ac +extension GLX +render -noreset &
export DISPLAY=:99

# Запуск window manager
echo "🪟 Запуск window manager..."
fluxbox &

# Ожидание готовности дисплея
sleep 5

# Проверка Chrome
echo "🌐 Проверка Google Chrome..."
if google-chrome --version; then
    echo "✅ Chrome установлен успешно"
    CHROME_VERSION=$(google-chrome --version)
    echo "   Версия: $CHROME_VERSION"
else
    echo "❌ Chrome не найден"
    exit 1
fi

# Проверка Python зависимостей
echo "🐍 Проверка Python зависимостей..."
python -c "import selenium, undetected_chromedriver, fake_useragent, numpy, pandas, sklearn" || {
    echo "❌ Не все Python зависимости установлены"
    exit 1
}

# Создание необходимых директорий
echo "📁 Создание директорий..."
mkdir -p screenshots logs profiles extensions

# Настройка прав доступа
chmod +x rpa_bot_cloud.py

# Проверка системных ресурсов
echo "💾 Проверка системных ресурсов..."
echo "   Память: $(free -h | grep '^Mem:' | awk '{print $3 "/" $2}')"
echo "   Диск: $(df -h / | tail -1 | awk '{print $3 "/" $2 " (" $5 " используется)"}')"
echo "   CPU: $(nproc) ядер"

# Список поддерживаемых платформ
echo "🌐 Поддерживаемые платформы:"
echo "   📱 Instagram - лайки, подписки, комментарии"
echo "   🎵 TikTok - лайки, подписки, комментарии"
echo "   🎥 YouTube - лайки, подписки, комментарии"
echo "   🐦 X (Twitter) - лайки, ретвиты, комментарии"
echo "   📘 Facebook - лайки, комментарии, репосты"
echo "   💼 LinkedIn - лайки, подключения, комментарии"
echo "   💬 Telegram - отправка сообщений"
echo "   📖 Reddit - голосование, комментарии"
echo "   💬 Discord - отправка сообщений"
echo "   📱 WhatsApp - отправка сообщений"

echo "✅ Все компоненты готовы для универсального режима"
echo "🤖 Запуск универсального RPA Bot..."
echo "🔧 Возможности:"
echo "   🛡️  Антидетект система"
echo "   👤 Имитация человеческого поведения"
echo "   🔧 Решение капчи"
echo "   🌐 Поддержка всех основных платформ"
echo "   📊 Извлечение и анализ данных"
echo "   🔄 Автоматическая ротация профилей"

# Запуск приложения с расширенным логированием
python rpa_bot_cloud.py 2>&1 | tee logs/bot_output.log
