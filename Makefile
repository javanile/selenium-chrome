
build:
	@chmod +x socat.sh
	@docker compose build selenium

start: build
	@docker compose up -d selenium apache

test-socat: build
	@docker compose up selenium --force-recreate
