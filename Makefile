
build:
	@chmod +x socat.sh
	@docker compose build selenium

start: build
	@docker compose up -d selenium apache

test-socat: build
	@docker compose up --force-recreate selenium
	#@docker compose exec selenium bash -c "cat /opt/bin/socat.sh"
