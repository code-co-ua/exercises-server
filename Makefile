install:
	curl -fsSL https://get.docker.com -o get-docker.sh
	sh get-docker.sh
	make start-server
	make update
	cd theia && docker build -f Dockerfile -t theia-instance .
update:
	bash update.bash
start-server:
	docker run -d -p 80:80 -v /var/run/docker.sock:/tmp/docker.sock:ro jwilder/nginx-proxy
run-test-instance:
	docker run -it --rm -p 8080:8000 -e VIRTUAL_HOST=test-ide.ost.pp.ua theia-instance
