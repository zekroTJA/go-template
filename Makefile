.PHONY: run dcup test runfe fedeps fe backend

DEV_CONFIG := "$(CURDIR)/config/dev.config.json"

run:
	go run cmd/*/main.go -config $(DEV_CONFIG)

dcup:
	docker-compose -f docker-compose.yml -f docker-compose.dev.yml up -d

test:
	go test -v -race -cover ./...

fedeps:
	cd web && npm ci

runfe:
	cd web && npm start

fe:
	cd web && npm run build
