.PHONY: help dev clean
help:
	@echo "make dev          # запустить приложение + БД"
	@echo "make clean        # остановить и удалить контейнеры"
dev:
	docker compose --env-file .env up -d --build
clean:
	docker compose down -v
