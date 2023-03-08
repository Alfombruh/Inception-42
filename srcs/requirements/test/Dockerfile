FROM debian:buster

RUN apt update; apt install -y mariadb-server

COPY tools/setup.sh .
RUN chmod +x setup.sh

CMD [ "./setup.sh" ]
