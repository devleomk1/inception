# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jisokang <jisokang@student.42seoul.kr>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/07/31 13:21:56 by jisokang          #+#    #+#              #
#    Updated: 2022/08/28 16:09:13 by jisokang         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	debian:buster

LABEL	maintainer="jisokang <jisokang@student.42seoul.kr>"

RUN		apt-get update -y && \
		apt-get upgrade -y && \
		apt-get -y install \
		wget \
		curl \
		php7.3 \
		php-fpm \
		php-cli \
		php-mysql \
		php-mbstring \
		vim
		#[필요 없어 보여서 뺀 친구들]
		#php-xml \
		#sendmail \

#COPY

# Wordpress + php container
