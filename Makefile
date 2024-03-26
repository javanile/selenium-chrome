
build:
	@docker compose build selenium

start: build
	@docker compose up -d selenium apache
