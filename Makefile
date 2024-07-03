include srcs/.env

down:
	cd srcs && sudo docker-compose down

build: clean
#  @sed -i "s/BUILD_DATE.*/BUILD_DATE: $(date)/g" srcs/docker-compose.yaml
#	@sudo sh -c "echo 127.0.0.1 $DOMAIN_NAME >> /etc/hosts"
	@mkdir $HOME/data/wordpress_vol
	@mkdir $HOME/data/maria_vol
	@mkdir $HOME/data/adminer_vol/
	@mkdir $HOME/data/ftp_vol

	@cd srcs && sudo docker-compose up --build

rebuild:
# for mac : sed -i "" "bla/blabla" 
# 	@sed -i "s/BUILD_DATE.*/BUILD_DATE: $(shell date)/g" srcs/docker-compose.yaml
	@cd srcs && sudo docker-compose up --build

kill:
	sudo docker kill $(docker ps -q)

rmi:
	sudo docker image rmi -f $(docker image ls -q)

rm_volumes:
	docker volume rm -f $(docker volume ls -q)

clean: 
		cd srcs && sudo docker-compose down -v --rmi all
#		docker volume rm -f $(docker volume ls -q)
		@sudo rm -rf $HOME/wordpress_vol
		@sudo rm -rf /$HOME/data/maria_vol
		@sudo rm -rf $HOME/data/adminer_vol
		@sudo rm -rf $HOME/data/ftp_vol
		@echo "yes" | sudo docker image prune

check:
	@echo "-----------\033[0;32mShow running containers------------\033[0m"
		@sudo docker ps
	@echo "\n-----------\033[0;32mShow existing images------------\033[0m"
		@sudo docker images
	@echo "\n-----------\033[0;32mShow Volumes------------\033[0m"
		@sudo docker volume ls
	@echo "\n-----------\033[0;32mShow Networks------------\033[0m"
		@sudo docker network ls



# adduser newuser
# usermod -aG sudo newuser
# vi /etc/hosts ==> newuser  ALL=(ALL) NOPASSWD:ALL
#or newuser ALL=(ALL:ALL) ALL 
