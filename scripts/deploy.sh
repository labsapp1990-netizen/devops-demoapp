#!/bin/bash
cd ~/devops-demoapp
# Проверка наличия .env
if [ ! -f .env ]; then
  echo "ОШИБКА: .env файл не найден. Создайте его перед деплоем."
  exit 1
fi
git pull origin main
docker compose --env-file .env up -d --build --remove-orphans
docker system prune -f
echo "Деплой завершён."
