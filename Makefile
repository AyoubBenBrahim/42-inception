include srcs/.env

down:
	cd srcs && docker-compose down

# rm:
# 	cd srcs && docker-compose down -v --rmi all

build_up0:
	@sed -i "" "s/BUILD_DATE.*/BUILD_DATE: $(shell date)/g" srcs/docker-compose.yaml
#	@sudo sh -c "echo 127.0.0.1 $DOMAIN_NAME >> /etc/hosts"
	@mkdir /home/aybouras/data/adminer_vol/wordpress_vol
	@mkdir /home/aybouras/data/adminer_vol/maria_vol
	@mkdir /home/aybouras/data/adminer_vol/adminer_vol
	@mkdir /home/aybouras/data/adminer_vol/ftp_vol

	@cd srcs && docker-compose up --build

build_up1:
	@sed -i "" "s/BUILD_DATE.*/BUILD_DATE: $(shell date)/g" srcs/docker-compose.yaml
	@cd srcs && docker-compose up --build

kill:
	docker kill $(docker ps -q)

rmi:
	docker rmi -f $(docker image ls -q)

rm_volumes:
	docker volume rm -f $(docker volume ls -q)

clean_all: 
		cd srcs && docker-compose down
		docker volume rm -f $(docker volume ls -q)
		docker rmi -f $(docker image ls -q)
		@rm -rf /home/aybouras/data/adminer_vol/wordpress_vol
		@rm -rf /home/aybouras/data/adminer_vol/maria_vol
		@rm -rf /home/aybouras/data/adminer_vol/adminer_vol
		@rm -rf /home/aybouras/data/adminer_vol/ftp_vol

