# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    wordpress_setup.sh                                 :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jisokang <jisokang@student.42seoul.kr>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/09/07 17:12:47 by jisokang          #+#    #+#              #
#    Updated: 2022/09/12 19:04:49 by jisokang         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

#wp-cli를 쓰면 좋아용
#->

#while ! mariadb -h$WORDPRESS_DB_HOST -u$WORDPRESS_DB_USER -p$WORDPRESS_DB_PASSWORD &>/dev/null; do
	#echo "waiting for $WORDPRESS_DB_HOST ..."
#	sleep 2
#done
sleep 2
#cat /var/www/html/.setup 2> /dev/null
chown -R www-data:www-data /var/www/

#if ! sudo -u www-data sh -c 'wp core is-installed'; then
if [ ! -f "/var/www/html/wordpress/index.php" ]; then
	sudo -u www-data sh -c " \
	wp core download && \
	wp config create --dbname=$WORDPRESS_DB_HOST --dbuser=$WORDPRESS_DB_USER --dbpass=$WORDPRESS_DB_PASSWORD --dbhost=$WORDPRESS_DB_HOST --dbcharset="utf8"
	wp core install --url=$DOMAIN_NAME --title=$WORDPRESS_TITLE --admin_user=$WORDPRESS_DB_ADMIN --admin_password=$WORDPRESS_DB_ADMIN_PASSWORD --admin_email=$WORDPRESS_DB_ADMIN_EMAIL --skip-email && \
	wp user create $WORDPRESS_USER $WORDPRESS_EMAIL --role=author --user_pass=$WORDPRESS_PASSWORD && \
	wp plugin update --all
	"
fi
#if [ $? -ne 0 ]; then
	#tar -xzvf latest.tar.gz
	#mv wordpress/ /var/www/html/
	#chown -R www-data:www-data /var/www/html/wordpress
	#touch /var/www/html/.setup
#fi
#service php7.3-fpm start
#exec php7.3-fpm
#echo "MY PHP7.3 RUN"
exec /usr/sbin/php-fpm7.3 -F
