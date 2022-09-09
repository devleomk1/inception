# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jisokang <jisokang@student.42seoul.kr>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/07/31 13:21:25 by jisokang          #+#    #+#              #
#    Updated: 2022/09/09 23:13:27 by jisokang         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	debian:buster

LABEL	maintainer="jisokang <jisokang@student.42seoul.kr>"

RUN		apt-get update -y && \
		apt-get upgrade -y && \
		apt-get -y install \
		mariadb-server \
		mariadb-client

COPY	./tools/mariadb_setup.sh /tmp/mariadb_setup.sh

ENTRYPOINT ["sh", "/tmp/mariadb_setup.sh"]

EXPOSE 3306
