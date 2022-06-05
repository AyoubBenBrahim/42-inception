#bin/sh
docker kill $(docker ps -q)

docker rm $(docker ps -a -q)

docker rmi -f $(docker image ls -q)

docker volume rm -f $(docker volume ls -q)

docker network rm $(docker network ls -q)

# del image with name 
 # docker image rm -f nginx_test:1.1

/bin/rm -rf ./wordpress_vol/*
/bin/rm -rf ./maria_vol/* 


