install:
	curl -fsSL https://get.docker.com -o get-docker.sh
	sh get-docker.sh
	make start-server
	make build
	make update-images
start-server:
	docker run -d -p 80:80 -v /var/run/docker.sock:/tmp/docker.sock:ro jwilder/nginx-proxy
update-images:
	bash update-images.bash
build:
	docker build -f Dockerfile -t theia-instance .
run-test-instance:
	docker run -it --rm -p 8080:8000 -e VIRTUAL_HOST=webide.local theia-instance
