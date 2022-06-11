include srcs/.env

down:
	cd srcs && docker-compose down

# rm:
# 	cd srcs && docker-compose down -v --rmi all

build_up:
#  @sed -i "s/BUILD_DATE.*/BUILD_DATE: $(date)/g" srcs/docker-compose.yaml
#	@sudo sh -c "echo 127.0.0.1 $DOMAIN_NAME >> /etc/hosts"
	@mkdir /home/aybouras/data/wordpress_vol
	@mkdir /home/aybouras/data/maria_vol
	@mkdir /home/aybouras/data/adminer_vol/
	@mkdir /home/aybouras/data/ftp_vol

	@cd srcs && docker-compose up --build

rebuild:
# for mac : sed -i "" "bla/blabla" 
# @sed -i "s/BUILD_DATE.*/BUILD_DATE: $(shell date)/g" srcs/docker-compose.yaml
	@cd srcs && docker-compose up --build

kill:
	docker kill $(docker ps -q)

rmi:
	docker rmi -f $(docker image ls -q)

rm_volumes:
	docker volume rm -f $(docker volume ls -q)

clean: 
# cd srcs && docker-compose down
# docker rmi -f $(docker image ls -q)
		cd srcs && docker-compose down -v --rmi all
		docker volume rm -f $(docker volume ls -q)
		@rm -rf /home/aybouras/data/adminer_vol/wordpress_vol
		@rm -rf /home/aybouras/data/adminer_vol/maria_vol
		@rm -rf /home/aybouras/data/adminer_vol/adminer_vol
		@rm -rf /home/aybouras/data/adminer_vol/ftp_vol

