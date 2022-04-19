install:
	poetry install

test:
	poetry run pytest -v .

fix: flakes fmt

flakes:
	poetry run pyflakes .

fmt:
	poetry run black .

lint:
	poetry  run black --check .
