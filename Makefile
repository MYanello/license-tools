update-docker:
	docker build -t marcusjy/lic-stat-tool .
	docker push marcusjy/lic-stat-tool:latest

run-docker:
	docker run -p 5001:5001 marcusjy/lic-stat-tool

venv-install:
	python3 -m venv venv
	. venv/bin/activate; pip install -r app/requirements.txt

test-install: venv-install
	. venv/bin/activate; pip install -r tests/requirements.txt

run-local:
	. venv/bin/activate; python3 app/main.py

test: run-local test-install
