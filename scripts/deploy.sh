#!/bin/bash
cd ~/devops-demoapp
git pull origin main
docker compose --env-file .env up -d --build --remove-orphans
docker system prune -f
echo "Деплой завершён."
