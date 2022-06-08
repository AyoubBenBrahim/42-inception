#bin/sh

docker-compose down ; docker volume rm -f $(docker volume ls -q) ; docker-compose up --build
