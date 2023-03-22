FROM	debian:buster

RUN	apt-get update && apt-get install -y \
		php \
		php-fpm \
		php-mysql \
                php-curl \
		php-gd \
		php-xml \
		wget \
		unzip

RUN wget https://wordpress.org/latest.tar.gz && \
    tar -xzvf latest.tar.gz && \
    rm latest.tar.gz && \
    mv wordpress /var/www/html/

