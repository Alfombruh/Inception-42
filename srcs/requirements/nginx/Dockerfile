FROM	debian:buster

RUN	apt update && apt install -y nginx

RUN	rm -f /etc/nginx/sites-available/default.conf /etc/nginx/sites-enabled/default

COPY	conf/nginx.conf /etc/nginx/conf.d/
COPY	tools/index.html /var/www/html/
COPY	tools/certificate.crt /etc/nginx/
COPY	tools/certificate.key /etc/nginx/

CMD	[ "nginx","-g","daemon off;" ]
