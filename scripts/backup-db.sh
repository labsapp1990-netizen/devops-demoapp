#!/bin/bash
source .env
DATE=$(date +%Y%m%d_%H%M%S)
DUMP_FILE="backup_${DATE}.sql"
docker exec $(docker ps -qf "name=postgres") pg_dump -U ${DB_USER} demo > ${DUMP_FILE}
echo "Бэкап создан: ${DUMP_FILE}"
