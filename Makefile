all:
	docker compose -f srcs/docker-compose.yml up -d

down:
	docker compose -f srcs/docker-compose.yml down

rmc:
	-docker rm -f $$(docker ps -aq)
rmi:
	-docker rmi -f $$(docker images -q)

rmv: #remove volumes

rmn: #remove networks

clean: rmc rmi
