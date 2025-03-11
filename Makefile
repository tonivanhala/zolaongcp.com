build:
	docker run -u "$(id -u):$(id -g)" \
	--platform linux/amd64 \
	-v "${PWD}/site:/app" --workdir /app \
	ghcr.io/getzola/zola:v0.20.0 build

serve:
	docker run -u "$(id -u):$(id -g)" \
	--platform linux/amd64 \
	-v "${PWD}/site:/app" --workdir /app \
	-p 8080:8080 ghcr.io/getzola/zola:v0.20.0 serve \
	--interface 0.0.0.0 --port 8080 --base-url localhost
