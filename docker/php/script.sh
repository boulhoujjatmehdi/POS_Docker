#!/bin/bash

# Navigate to your application's directory
cd /var/www

# Run composer install
composer install

chown www-data:www-data -R storage

# Start php-fpm
exec php-fpm