# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jisokang <jisokang@student.42seoul.kr>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/07/31 13:21:56 by jisokang          #+#    #+#              #
#    Updated: 2022/09/07 17:17:33 by jisokang         ###   ########.fr        #
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

COPY	./tools/wordpress_setup.sh /tmp/wordpress_setup.sh

ENTRYPOINT ["sh", "/tmp/wordpress_setup.sh"]

EXPOSE	9000
# Wordpress + php container
