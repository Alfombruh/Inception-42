all:
	docker-compose -f srcs/docker-compose.yml build  && docker-compose -f srcs/docker-compose.yml up -d

down:
	docker-compose -f srcs/docker-compose.yml down 
rmc:
	-docker rm -f $$(docker ps -aq)
rmi:
	-docker rmi -f $$(docker images -q) && yes | docker system prune -a
rmv:
	-docker volume rm $$(docker volume ls -q)

clean: rmc rmi rmv

re: clean down all

.PHONY: all down rmc rmi clean
