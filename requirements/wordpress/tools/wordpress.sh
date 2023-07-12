#!/bin/bash

if [ ! -f /var/www/wordpress/wp-config.php ]
then
        cd /var/www/wordpress
# downloads the latest version of WordPress to the current directory. The --allow-root flag allows the command to be run as the root user, which is necessary if you are logged in as the root user or if you are using WP-CLI with a system-level installation of WordPress.
    wp core download --allow-root
        echo Download completed
    # Create config file
    wp config create --dbname=$SQL_DATABASE --dbuser=$SQL_USERNAME --dbpass=$SQL_PASSWORD --dbhost=$SQL_HOSTNAME --path=/var/www/wordpress --skip-packages --skip-plugins --allow-root 
        echo configuration complete

    # installs WordPress and sets up the basic configuration for the site. The --url option specifies the URL of the site, --title sets the site's title, --admin_user and --admin_password set the username and password for the site's administrator account, and --admin_email sets the email address for the administrator. The --skip-email flag prevents WP-CLI from sending an email to the administrator with the login details.
    echo "this is happening: $WP_USER_ONE and $WP_USER_ONE_PW"
    wp core install --url=$WP_URL --path=/var/www/wordpress --title=thirza --admin_user=$WP_USER_ONE --admin_password=$WP_USER_ONE_PW --admin_email=admin@thirza.com --skip-email --allow-root 
    # Create second user
    wp user create $WP_USER_TWO thirza@thirza.com --path=/var/www/wordpress --user_pass=$WP_USER_TWO_PW --allow-root
        echo second user created
    chown -R www-data:www-data /var/www/wordpress
fi

echo "Going great"
php-fpm7.3 -R -F
# Change ownership of /var/www/wordpress (-R to apply to all folders)
# Command used to start PHP-FasCGI Process Manager (-R run on the foreground -F as root): Run wordpress applicayion using PHP-FPM