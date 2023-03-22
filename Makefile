all:
	docker compose --project-directory ./srcs/ build  && docker compose --project-directory ./srcs/ up -d

down:
	docker compose -f srcs/docker-compose.yml down

rmc:
	-docker rm -f $$(docker ps -aq)
rmi:
	-docker rmi -f $$(docker images -q)

rmv: #remove volumes

rmn: #remove networks

clean: rmc rmi

re: clean down all

.PHONY: all down rmc rmi rmv rmn clean
