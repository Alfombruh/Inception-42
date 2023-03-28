FROM debian:buster

RUN apt-get update; apt-get install -y mariadb-server

COPY tools/setup.sh .
COPY tools/start.sh .
RUN chmod +x setup.sh && chmod +x start.sh && ./start.sh

CMD [ "./setup.sh" ]
