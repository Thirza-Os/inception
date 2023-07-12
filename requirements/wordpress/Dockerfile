# Base image: Build on debian distribution
FROM        debian:buster

RUN         mkdir -p /var/www/wordpress

WORKDIR     /var/www/wordpress/

# Install php-fpm(FastCGI Process Manager) and php-mysql (PHP extension that allows PHP to communicate with MySQL) packages
RUN         apt-get -y update && apt-get -y upgrade && apt update -y && apt upgrade -y

# Install curl package: command line tool fo transferring data with network protocols (http/https/ftp)
RUN         apt install php-fpm php-mysql -y && apt install curl -y mariadb-client

# Download and install WP-CLI & move to bin
RUN curl -o /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x /usr/local/bin/wp

# Use sed command to modify configuration file, substitute value so that PHP-FPM listens from unix to TCP port
RUN         sed 's|listen = /run/php/php7.3-fpm.sock|listen = 0.0.0.0:9000|g' -i /etc/php/7.3/fpm/pool.d/www.conf
RUN         mkdir /run/php

#Move the configaration file to current dir and add rights
COPY        tools/wordpress.sh .
RUN         chmod +x ./wordpress.sh

ENTRYPOINT "/var/www/wordpress/wordpress.sh"

# Expose  9000 for PHP-FPM
EXPOSE 9000