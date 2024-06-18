
build:
	@chmod +x socat.sh

	#@docker compose build selenium

start: build
	@docker compose up -d selenium apache

test-socat: build
	@docker compose up --force-recreate selenium
	#@docker compose exec selenium bash -c "cat /opt/bin/socat.sh"


test-file:
	@docker build -t javanile/selenium-test .
	@docker run -v $$(pwd)/tests:/tests -p 7900:7900 javanile/selenium-test python /tests/fixtures/python/test.py
