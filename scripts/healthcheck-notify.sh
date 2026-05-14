#!/bin/bash
CHAT_ID="6965033982"
BOT_TOKEN="8700646354:AAFOPOMdfa_HVkv5Goy-N15gJNJGNYgU4RM"

# Проверяем, что все контейнеры запущены
cd ~/devops-demoapp
STATUS=$(docker compose ps --format "table {{.Service}}\t{{.Status}}")

# Формируем сообщение
MESSAGE="✅ Сервер работает
$(date)

Статус контейнеров:
<pre>$STATUS</pre>"

# Отправляем в Telegram
curl -s -X POST "https://api.telegram.org/bot${BOT_TOKEN}/sendMessage" \
  -d "chat_id=${CHAT_ID}" \
  -d "text=${MESSAGE}" \
  -d "parse_mode=HTML" > /dev/null

echo "Сообщение отправлено в Telegram."
