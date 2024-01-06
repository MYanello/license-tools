build-avail-docker:
	docker build -t marcusjy/lic-stat-tool ./check_avail

push-avail-docker: build-avail-docker
	docker push marcusjy/lic-stat-tool:latest

build-nebula-docker:
	docker build -t nebula ./nebula

push-nebula-docker: build-nebula-docker 
	docker push marcusjy/nebula-cert:latest

build-nebula-cert-docker:
	docker build -t nebula-cert ./nebula-cert

create-host-cert: build-nebula-cert-docker
	docker run -v ./nebula-cert/certs:/app/ nebula-cert ca -name "Test org"

create-client-cert: build-nebula-cert-docker
	docker run -v ./nebula-cert/certs:/app/ nebula-cert sign -name "test client" -ip "192.168.100.1/24"


push-nebula-cert-docker: build-nebula-cert-docker 
	docker push marcusjy/nebula-cert:latest

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

