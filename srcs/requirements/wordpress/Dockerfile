# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jisokang <jisokang@student.42seoul.kr>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/07/31 13:21:56 by jisokang          #+#    #+#              #
#    Updated: 2022/09/06 19:21:47 by jisokang         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	debian:buster

LABEL	maintainer="jisokang <jisokang@student.42seoul.kr>"

RUN		apt-get update -y && \
		apt-get upgrade -y && \
		apt-get -y install \
		wget \
		curl \
		tar \
		php7.3-fpm \
		php-cli \
		php-mysql \
		vim
		#[필요 없어 보여서 뺀 친구들]
		#php-xml \
		#sendmail \

RUN		wget https://wordpress.org/latest.tar.gz
RUN		tar -xzvf latest.tar.gz
RUN		mkdir	/var/www
RUN		mkdir	/var/www/html
RUN		mv wordpress/ /var/www/html/
RUN		chown -R www-data:www-data /var/www/html/wordpress
#COPY	./conf/wp-config.php /tmp/

EXPOSE	9000
# Wordpress + php container
