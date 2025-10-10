#!/bin/sh -e

# Baikal does not create this folder on its own
mkdir -p /var/www/baikal/Specific/db/

# Nginx needs to store its files here
mkdir -p /tmp/nginx

/usr/sbin/php-fpm${PHP_VERSION} --daemonize
/usr/sbin/nginx -e stderr
