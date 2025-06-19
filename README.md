
# 🤖 Универсальный облачный RPA-бот для Railway

Самый мощный RPA-бот с поддержкой всех популярных платформ и полным антидетект функционалом.

## 🌟 Поддерживаемые платформы

### 📱 Социальные сети
- **Instagram** - лайки, подписки, комментарии, stories
- **TikTok** - лайки, подписки, комментарии, shares
- **X (Twitter)** - лайки, ретвиты, комментарии, подписки
- **Facebook** - лайки, комментарии, репосты, friends
- **LinkedIn** - лайки, подключения, комментарии, posts

### 🎥 Видео платформы
- **YouTube** - лайки, подписки, комментарии, views
- **Twitch** - follows, chat, donations
- **Vimeo** - лайки, комментарии, follows

### 💬 Мессенджеры
- **Telegram** - отправка сообщений, joins, forwards
- **Discord** - отправка сообщений, reactions, joins
- **WhatsApp** - отправка сообщений, groups

### 📰 Контент платформы
- **Reddit** - upvotes, комментарии, posts, subscriptions
- **Medium** - claps, follows, comments
- **Quora** - upvotes, answers, follows

### 🛒 E-commerce
- **Amazon** - reviews, wishlists, purchases
- **eBay** - bids, watches, messages
- **Etsy** - favorites, reviews, messages

## 🚀 Основные возможности

### 🛡️ Продвинутая антидетект система
- **Fingerprint Protection** - Canvas, WebGL, Fonts fingerprinting защита
- **User-Agent Rotation** - Автоматическая ротация реальных user-agent
- **Browser Profiles** - Множественные профили с различными характеристиками
- **IP Management** - Поддержка прокси и VPN
- **Stealth Mode** - Полное скрытие признаков автоматизации

### 👤 Имитация человеческого поведения
- **Natural Typing** - Человеческая скорость печати с опечатками
- **Mouse Movement** - Естественные траектории движения мыши
- **Scroll Patterns** - Реалистичные паттерны прокрутки
- **Timing Variations** - Случайные задержки и паузы
- **Behavioral Analytics** - Адаптация под поведенческие паттерны

### 🔧 Решение капчи и препятствий
- **reCAPTCHA v2/v3** - Автоматическое решение Google reCAPTCHA
- **hCaptcha** - Поддержка hCaptcha решения
- **Image Recognition** - OCR для текстовых капч
- **Audio CAPTCHA** - Решение аудио капч
- **Cloudflare Bypass** - Обход защиты Cloudflare

### 🌐 Универсальные действия
- **Navigation** - Навигация по сайтам с обходом блокировок
- **Data Extraction** - Извлечение структурированных данных
- **Form Filling** - Автозаполнение форм
- **File Operations** - Загрузка и скачивание файлов
- **Session Management** - Управление сессиями и cookies

## 📋 Быстрый деплой на Railway

### 1. Форк репозитория
```bash
git clone https://github.com/your-username/universal-rpa-bot
cd universal-rpa-bot/rpa-bot-cloud
```

### 2. Деплой на Railway
1. Подключите GitHub репозиторий к Railway
2. Выберите папку `rpa-bot-cloud`
3. Railway автоматически определит конфигурацию

### 3. Настройка переменных окружения
```env
# Обязательные
SUPABASE_URL=https://your-project.supabase.co
SUPABASE_SERVICE_KEY=your_service_role_key

# Опциональные для расширенного функционала
ANTICAPTCHA_KEY=your_anticaptcha_key
TWOCAPTCHA_KEY=your_2captcha_key
PROXY_LIST=proxy1:port:user:pass,proxy2:port:user:pass
```

## 🎯 API Endpoints

### Основные
- `GET /health` - Статус системы и поддерживаемые платформы
- `GET /platforms` - Детальная информация о платформах
- `POST /execute` - Выполнение универсальных RPA задач

### Тестирование
- `POST /test/{platform}` - Тестирование конкретной платформы
- `GET /session/data` - Данные текущей сессии

## 📝 Примеры использования

### Универсальная задача для Instagram
```json
{
  "taskId": "instagram_automation_001",
  "platform": "instagram",
  "credentials": {
    "username": "your_username",
    "password": "your_password"
  },
  "actions": [
    {
      "type": "platform_instagram_login"
    },
    {
      "type": "navigate",
      "url": "https://instagram.com/explore/tags/automation/"
    },
    {
      "type": "platform_instagram_like_post",
      "count": 5
    },
    {
      "type": "platform_instagram_follow_users",
      "count": 3
    }
  ],
  "stealth_mode": true,
  "timeout": 300000
}
```

### YouTube автоматизация
```json
{
  "taskId": "youtube_engagement_001",
  "platform": "youtube",
  "credentials": {
    "email": "your_email@gmail.com",
    "password": "your_password"
  },
  "actions": [
    {
      "type": "platform_youtube_login"
    },
    {
      "type": "navigate",
      "url": "https://youtube.com/watch?v=VIDEO_ID"
    },
    {
      "type": "platform_youtube_like_video"
    },
    {
      "type": "platform_youtube_subscribe"
    },
    {
      "type": "platform_youtube_comment",
      "text": "Great video! Thanks for sharing."
    }
  ]
}
```

### Мультиплатформенная задача
```json
{
  "taskId": "multi_platform_001",
  "actions": [
    {
      "type": "navigate",
      "url": "https://instagram.com/post/123"
    },
    {
      "type": "like"
    },
    {
      "type": "navigate",
      "url": "https://tiktok.com/@user/video/456"
    },
    {
      "type": "like"
    },
    {
      "type": "navigate",
      "url": "https://youtube.com/watch?v=789"
    },
    {
      "type": "subscribe"
    }
  ]
}
```

### Извлечение данных
```json
{
  "taskId": "data_extraction_001",
  "actions": [
    {
      "type": "navigate",
      "url": "https://example.com/products"
    },
    {
      "type": "extract_data",
      "selector": ".product-title",
      "attribute": "text"
    },
    {
      "type": "extract_data",
      "selector": ".product-price",
      "attribute": "text"
    },
    {
      "type": "extract_data",
      "selector": ".product-image",
      "attribute": "src"
    }
  ]
}
```

## 🔧 Доступные действия

### Базовые действия
- `navigate` - Переход на URL
- `click` - Клик по элементу
- `type` - Ввод текста
- `wait` - Ожидание
- `scroll` - Прокрутка
- `screenshot` - Создание скриншота
- `extract_data` - Извлечение данных

### Платформо-специфичные действия
Формат: `platform_{платформа}_{действие}`

**Instagram:**
- `platform_instagram_login` - Вход в аккаунт
- `platform_instagram_like_post` - Лайк поста
- `platform_instagram_follow_user` - Подписка на пользователя
- `platform_instagram_comment` - Комментарий

**YouTube:**
- `platform_youtube_login` - Вход через Google
- `platform_youtube_like_video` - Лайк видео
- `platform_youtube_subscribe` - Подписка на канал
- `platform_youtube_comment` - Комментарий

**TikTok:**
- `platform_tiktok_like_video` - Лайк видео
- `platform_tiktok_follow_user` - Подписка
- `platform_tiktok_share` - Поделиться

### Универсальные социальные действия
- `like` - Лайк (автоматически адаптируется под платформу)
- `follow` - Подписка/Follow
- `subscribe` - Подписка
- `comment` - Комментарий
- `share` - Поделиться
- `repost` - Репост

## 🛠️ Антидетект настройки

Бот автоматически применяет:

### Browser Fingerprinting Protection
- WebGL Renderer спуфинг
- Canvas fingerprint randomization
- Screen resolution variations
- Timezone randomization
- Language preferences spoofing

### Network Level Protection
- User-Agent rotation from real browsers
- Request headers randomization
- Cookie management
- Session persistence
- Proxy rotation support

### Behavioral Protection
- Human-like mouse movements
- Natural typing patterns with mistakes
- Realistic scroll behaviors
- Random pause distributions
- Platform-specific interaction patterns

## 📊 Мониторинг и логирование

### Детальные логи
- Выполнение каждого действия
- Ошибки и их контекст
- Время выполнения операций
- Состояние системных ресурсов

### Скриншоты
- Автоматические скриншоты при ошибках
- Финальные скриншоты задач
- Промежуточные снимки для отладки

### Метрики производительности
- CPU и память использование
- Время выполнения задач
- Успешность операций
- Статистика по платформам

## 🔒 Безопасность и конфиденциальность

- Все пароли и токены через переменные окружения
- Шифрование чувствительных данных
- Безопасное управление сессиями
- Защита от обнаружения ботов
- Соблюдение rate limits платформ

## 🚨 Устранение неполадок

### Частые проблемы

1. **Платформа блокирует бота**
   - Включите stealth_mode: true
   - Используйте прокси
   - Снизьте частоту запросов

2. **Капча не решается**
   - Настройте ANTICAPTCHA_KEY
   - Проверьте баланс сервиса
   - Используйте альтернативные сервисы

3. **Медленная работа**
   - Оптимизируйте селекторы
   - Уменьшите таймауты
   - Используйте headless режим

### Отладка
```bash
# Проверка статуса
curl https://your-app.up.railway.app/health

# Тестирование платформы
curl -X POST https://your-app.up.railway.app/test/instagram

# Просмотр логов в Railway Dashboard
```

## 📈 Производительность

- **Оптимизация для Railway** - Эффективное использование ресурсов
- **Параллельная обработка** - Множественные задачи одновременно
- **Кэширование** - Быстрое переиспользование сессий
- **Memory Management** - Автоматическая очистка ресурсов

## 🆘 Поддержка

При возникновении проблем:
1. Проверьте логи в Railway Dashboard
2. Убедитесь в правильности переменных окружения
3. Проверьте /health endpoint
4. Используйте /test/{platform} для диагностики

---

**🎉 Готов к продакшену! Поддерживает ВСЕ популярные платформы!**

### Статистика поддержки:
- 📱 **10 социальных сетей**
- 🎥 **3 видео платформы** 
- 💬 **3 мессенджера**
- 📰 **3 контент платформы**
- 🛒 **3 e-commerce платформы**

**Всего: 22+ платформы с постоянными обновлениями!**
