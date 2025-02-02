up:
	mkdir -p /home/emagueri/data/database
	mkdir -p /home/emagueri/data/wordpress
	docker compose -f ./srcs/docker-compose.yml up --build

build:
	mkdir -p /home/emagueri/data/database
	mkdir -p /home/emagueri/data/wordpress
	docker compose -f ./srcs/docker-compose.yml build

down:
	docker compose -f ./srcs/docker-compose.yml down

Rdata:
	sudo rm -rf /home/emagueri/data/database ~/data/wordpress
	sudo rm -rf /home/emagueri/data/database ~/data/database

clean:
	docker compose -f ./srcs/docker-compose.yml down

kill: Rdata
	docker compose -f ./srcs/docker-compose.yml down -v

re: kill up
