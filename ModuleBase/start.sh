su-exec www-data:www-data $WWWHOME/install_composer.sh
php-fpm &
nginx -g "daemon off;"