build-avail-docker:
	docker build -t marcusjy/lic-stat-tool ./check_avail

push-avail-docker: build-avail-docker
	docker push marcusjy/lic-stat-tool:latest

build-nebula-docker:
	docker build -t nebula ./nebula

#push-nebula-docker: build-nebula-docker #don't run this without first building without the certs
#docker push marcusjy/nebula:latest

compose-up:
	docker compose up

run-docker:
	docker run -t -i --rm -p 5001:5001 --name lictool marcusjy/lic-stat-tool

venv-install:
	python3 -m venv venv
	. venv/bin/activate; pip install -r app/requirements.txt

test-install: venv-install
	. venv/bin/activate; pip install -r tests/requirements.txt

run-local:
	. venv/bin/activate; python3 app/main.py

test: run-local test-install
	pytest

