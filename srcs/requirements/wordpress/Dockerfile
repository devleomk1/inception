# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jisokang <jisokang@student.42seoul.kr>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/07/31 13:21:56 by jisokang          #+#    #+#              #
#    Updated: 2022/09/12 21:32:38 by jisokang         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	debian:buster

LABEL	maintainer="jisokang <jisokang@student.42seoul.kr>"

RUN		apt-get update -y && \
		apt-get upgrade -y && \
		apt-get -y install \
		mariadb-client \
		wget \
		curl \
		tar \
		php7.3-fpm \
		php-cli \
		php-mysql \
		vim \
		sudo

COPY	./tools/wordpress_setup.sh /tmp/wordpress_setup.sh
COPY	./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
RUN		wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/bin/wp

WORKDIR	/var/www/html/wordpress
RUN		mkdir -p /run/php

EXPOSE	9000

ENTRYPOINT ["sh", "/tmp/wordpress_setup.sh"]
