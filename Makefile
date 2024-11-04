postgres:
	docker run --name postgres -p 5435:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=root -d postgres:latest

createdb:
	docker exec -it postgres createdb --username=root --owner=root simple-bank

dropdb:
	docker exec -it postgres dropdb simple-bank

migrateup:
	migrate -path db/migration -database "postgresql://root:root@localhost:5435/simple-bank?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgresql://root:root@localhost:5435/simple-bank?sslmode=disable" -verbose down

sqlc:
	sqlc generate

.PHONY: postgres createdb dropdb migrateup migratedown sqlc
