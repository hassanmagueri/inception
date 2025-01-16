up:
	docker compose -f ./srcs/docker-compose.yml up --build

# build:
# 	docker compose -f ./srcs/docker-compose.yml up --build

down:
	docker compose -f ./srcs/docker-compose.yml down

kill:
	docker compose -f ./srcs/docker-compose.yml down -v

re: kill up
