#bin/sh

docker-compose down ; docker volume rm -f $(docker volume ls -q) ; /bin/rm -rf *_vol/* ; docker-compose up --build
