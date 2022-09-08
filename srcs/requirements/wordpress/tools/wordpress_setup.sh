# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    wordpress_setup.sh                                 :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jisokang <jisokang@student.42seoul.kr>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/09/07 17:12:47 by jisokang          #+#    #+#              #
#    Updated: 2022/09/08 17:14:37 by jisokang         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

tar -xzvf latest.tar.gz
mkdir -p /var/www/html
mv wordpress/ /var/www/html/
chown -R www-data:www-data /var/www/html/wordpress
exec php-fpm7 -F
