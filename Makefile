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

clean:
	docker compose -f ./srcs/docker-compose.yml down

fclean: 
	docker compose -f ./srcs/docker-compose.yml down -v
	sudo rm -rf /home/emagueri/data/database ~/data/wordpress
	sudo rm -rf /home/emagueri/data/database ~/data/database

re: fclean up
