#/bin/bash



docker container rm -f ftp

docker build -t ftp .

# docker run --privileged  -it -p 20:20 -p 21:21 -p 990:990 -p 40000:40000 -p 50000:50000 ftp bash

docker run --name ftp -d -p 20:20 -p 21:21 -p 990:990 -p 40000-40100:40000-40100 --env-file /home/emagueri/inception/srcs/.env ftp