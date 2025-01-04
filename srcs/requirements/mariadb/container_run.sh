#!/bin/bash

docker rm -f  $(docker ps -qa);
docker build -t maria .;
docker run -d --env-file ../../.env --name maria -p 3306:3306 maria;
# docker run -it --env-file ../../.env --name maria -p 3306:3306 maria bash;