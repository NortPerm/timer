docker-build:
	 docker build -t oputin/timer .
docker-run:
	 docker build -t oputin/timer .
	 docker compose up -d
docker-stop:
	docker compose down