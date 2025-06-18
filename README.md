
# 🤖 Облачный RPA-бот для Railway

Пошаговая инструкция для деплоя RPA-бота на Railway и интеграции с SMM платформой.

## 📋 Шаг 1: Подготовка GitHub репозитория

### 1.1 Создание репозитория
1. Зайдите на [GitHub](https://github.com)
2. Нажмите "New repository"
3. Название: `rpa-bot-cloud`
4. Сделайте репозиторий **приватным**
5. Нажмите "Create repository"

### 1.2 Загрузка файлов
1. Скачайте все файлы из папки `rpa-bot-cloud/`
2. В созданном репозитории нажмите "uploading an existing file"
3. Перетащите все файлы в браузер
4. Commit message: "Initial commit - Cloud RPA Bot"
5. Нажмите "Commit changes"

## 🚀 Шаг 2: Деплой на Railway

### 2.1 Подключение к Railway
1. Зайдите на [railway.app](https://railway.app)
2. Авторизуйтесь через GitHub
3. Нажмите "New Project"
4. Выберите "Deploy from GitHub repo"
5. Найдите и выберите `rpa-bot-cloud`
6. Нажмите "Deploy"

### 2.2 Настройка переменных окружения
В Railway Dashboard:
1. Откройте ваш проект
2. Перейдите в "Variables"
3. Добавьте переменные:

```
SUPABASE_URL=https://izmgzstdgoswlozinmyk.supabase.co
SUPABASE_SERVICE_KEY=ваш_service_role_key_из_supabase
PORT=5000
PYTHONUNBUFFERED=1
DISPLAY=:99
```

**Где взять SUPABASE_SERVICE_KEY:**
1. Зайдите в [Supabase Dashboard](https://supabase.com/dashboard)
2. Выберите проект `izmgzstdgoswlozinmyk`
3. Settings → API
4. Скопируйте "service_role" ключ

### 2.3 Получение URL Railway
После успешного деплоя:
1. В Railway Dashboard откройте ваш проект
2. Перейдите в "Deployments" 
3. Скопируйте URL вида: `https://ваш-проект.up.railway.app`

## 🔧 Шаг 3: Настройка Supabase

### 3.1 Обновление RPA_BOT_ENDPOINT
1. Зайдите в [Supabase Dashboard](https://supabase.com/dashboard)
2. Выберите проект `izmgzstdgoswlozinmyk`
3. Settings → Edge Functions → Manage secrets
4. Найдите секрет `RPA_BOT_ENDPOINT`
5. Измените значение на ваш Railway URL (без слеша в конце)
6. Пример: `https://ваш-проект.up.railway.app`

## ✅ Шаг 4: Проверка работы

### 4.1 Проверка health endpoint
Откройте в браузере:
```
https://ваш-проект.up.railway.app/health
```

Должен вернуться JSON:
```json
{
  "status": "ok",
  "timestamp": "2024-...",
  "version": "1.0.0",
  "environment": "railway"
}
```

### 4.2 Тестирование через health-check.py
```bash
python health-check.py https://ваш-проект.up.railway.app
```

### 4.3 Проверка через SMM платформу
1. Зайдите в RPA Dashboard на платформе
2. Создайте тестовую RPA задачу:
   - URL: `https://httpbin.org/get`
   - Действие: Navigate to URL
   - Timeout: 30 секунд
3. Запустите задачу
4. Проверьте статус выполнения в мониторинге

## 🔍 Шаг 5: Отладка

### 5.1 Просмотр логов Railway
1. Railway Dashboard → ваш проект
2. Вкладка "Deployments"
3. Выберите последний деплой
4. Нажмите "View Logs"

### 5.2 Проверка переменных окружения
В логах должно быть:
```
🚀 Запуск Cloud RPA Bot сервера...
Порт: 5000
Supabase URL: https://izmgzstdgoswlozinmyk.supabase.co
```

### 5.3 Типичные проблемы

**Проблема:** `SUPABASE_SERVICE_KEY не установлена`
**Решение:** Проверьте переменные окружения в Railway

**Проблема:** `Health endpoint возвращает 503`
**Решение:** Подождите 2-3 минуты после деплоя

**Проблема:** `Задачи не выполняются`
**Решение:** Проверьте логи Railway на ошибки Chrome/ChromeDriver

## 📊 Endpoints API

- `GET /health` - Проверка здоровья бота
- `GET /status` - Статус и возможности бота  
- `POST /execute` - Выполнение RPA задачи

## 🎯 Результат

После выполнения всех шагов у вас будет:
- ✅ Рабочий облачный RPA-бот на Railway
- ✅ Интеграция с Supabase
- ✅ Возможность выполнения RPA задач через платформу
- ✅ Мониторинг и логирование
- ✅ Автоматическое масштабирование

## 🔄 Обновление кода

Для обновления бота:
1. Измените файлы в GitHub репозитории
2. Railway автоматически пересоберет и задеплоит
3. Проверьте health endpoint после деплоя

**Готово!** Ваш облачный RPA-бот готов к работе.
