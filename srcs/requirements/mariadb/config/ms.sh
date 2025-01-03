#!/bin/bash

docker rm -f  $(docker ps -qa);
docker build -t maria .;
docker run -d --name maria -p 3306:3306 maria;