include srcs/.env

# up: build
# 	sudo sh -c "echo 127.0.0.1 ${DOMAIN_NAME} >> /etc/hosts"
# 	cd srcs && docker-compose up

run:
	cd srcs && docker-compose up

detach:
	cd srcs && docker-compose up -d

down:
	cd srcs && docker-compose down

remove:
	cd srcs && docker-compose down -v --rmi all

build:
	cd srcs && docker-compose build
build_up:
	@sed -i "" "s/BUILD_DATE.*/BUILD_DATE: $(shell date)/g" srcs/docker-compose.yaml
#	@sudo sh -c "echo 127.0.0.1 $DOMAIN_NAME >> /etc/hosts"
# @mkdir /Users/aybouras/Desktop/inception_git/wordpress_vol
# @mkdir /Users/aybouras/Desktop/inception_git/maria_vol

	/bin/rm -rf /Users/aybouras/Desktop/inception_git/wordpress_vol/*
	/bin/rm -rf /Users/aybouras/Desktop/inception_git/maria_vol/*
	@cd srcs && docker-compose up --build

#test:
#	@echo $(shell date)

# kill:
# 	docker kill $(docker ps -q)
# rm:
# 	docker rm $(docker ps -a -q)
# rmi:
# 	docker rmi -f $(docker image ls -q)
# rm_volumes:
# 	docker volume rm -f $(docker volume ls -q)
# fclean: 
# 		docker rm $(docker ps -a -q)
# 		docker rmi -f $(docker image ls -q)
# 		docker rmi -f $(docker image ls -q)
# 		docker volume rm -f $(docker volume ls -q)

