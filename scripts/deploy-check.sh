#!/bin/bash
cd ~/devops-demoapp

git fetch origin main
LOCAL=$(git rev-parse HEAD)
REMOTE=$(git rev-parse origin/main)

if [ "$LOCAL" != "$REMOTE" ]; then
  echo "Новые коммиты найдены. Начинаем деплой..."
  git pull origin main
  docker compose --env-file .env up -d --build --remove-orphans
  docker system prune -f
  echo "Деплой завершён."
else
  echo "Новых коммитов нет."
fi
