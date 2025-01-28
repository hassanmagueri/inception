up:
	mkdir -p ~/data/database
	mkdir -p ~/data/wordpress
	docker compose -f ./srcs/docker-compose.yml up --build mariadb nginx wordpress

bonus:
	mkdir -p ~/data/database
	mkdir -p ~/data/wordpress
	docker compose -f ./srcs/docker-compose.yml up --build

# build:
# 	docker compose -f ./srcs/docker-compose.yml up --build

down:
	docker compose -f ./srcs/docker-compose.yml down

Rdata:
	sudo rm -rf ~/data/database ~/data/wordpress

clean:
	docker compose -f ./srcs/docker-compose.yml down

kill: Rdata
	docker compose -f ./srcs/docker-compose.yml down -v

re: kill bonus
