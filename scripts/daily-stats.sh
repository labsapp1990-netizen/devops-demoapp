#!/bin/bash
CHAT_ID="6965033982"
BOT_TOKEN="8700646354:AAFOPOMdfa_HVkv5Goy-N15gJNJGNYgU4RM"

# Системная информация
UPTIME=$(uptime -p)
CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2+$4"%"}')
MEM=$(free -m | awk 'NR==2{printf "%.1f%%", $3*100/$2 }')
DISK=$(df -h / | awk 'NR==2{print $5}')
LOAD=$(uptime | awk -F'load average:' '{print $2}')

# Статус контейнеров
cd ~/devops-demoapp
CONTAINERS=$(docker compose ps --format "{{.Service}}: {{.Status}}" | tr '\n' ';')

MESSAGE="📊 Ежедневная статистика сервера
$(date)

⏱ Аптайм: ${UPTIME}
📈 Нагрузка (load avg): ${LOAD}
🖥 CPU: ${CPU}
🧠 Память: ${MEM}
💾 Диск: ${DISK}

🐳 Контейнеры:
${CONTAINERS}"

curl -s -X POST "https://api.telegram.org/bot${BOT_TOKEN}/sendMessage" \
  -d "chat_id=${CHAT_ID}" \
  -d "text=${MESSAGE}" \
  -d "parse_mode=HTML" > /dev/null

echo "Статистика отправлена в Telegram."
