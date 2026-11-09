include .env
export

.PHONY: env-up migrate-up migrate-down

env-up:
	docker compose up -d todoapp-postgres

env-down:
	docker compose down

migrate-create:
	docker compose run --rm todoapp-postgres-migrate create -ext sql -dir /migrations -seq $(seq)
	
migrate-up:
	docker compose run --rm todoapp-postgres-migrate -path /migrations -database "postgres://$(POSTGRES_USER):$(POSTGRES_PASSWORD)@todoapp-postgres:5432/$(POSTGRES_DB)?sslmode=disable" up

migrate-down:
	docker compose run --rm todoapp-postgres-migrate -path /migrations -database "postgres://$(POSTGRES_USER):$(POSTGRES_PASSWORD)@todoapp-postgres:5432/$(POSTGRES_DB)?sslmode=disable" down 1
env-port-forward:
	docker compose up -d port-forwarder

env-port-close:
	docker compose stop port-forwarder