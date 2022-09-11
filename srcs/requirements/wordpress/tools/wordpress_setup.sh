# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    wordpress_setup.sh                                 :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jisokang <jisokang@student.42seoul.kr>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/09/07 17:12:47 by jisokang          #+#    #+#              #
#    Updated: 2022/09/11 15:33:17 by jisokang         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

cat /var/www/html/.setup 2> /dev/null

if [ $? -ne 0 ]; then
	tar -xzvf latest.tar.gz
	mkdir -p /var/www/html/
	mv wordpress/ /var/www/html/
	chown -R www-data:www-data /var/www/html/wordpress
	touch /var/www/html/.setup
fi
#exec php7.3-fpm
service php7.3-fpm start

