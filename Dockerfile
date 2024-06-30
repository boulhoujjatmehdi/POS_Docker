# Use the official PHP image as the base image
FROM php:7.4-fpm

# Set working directory
WORKDIR /var/www

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    locales \
    zip \
    jpegoptim optipng pngquant gifsicle \
    vim \
    unzip \
    git \
    curl \
    libonig-dev \
    libxml2-dev \
    libicu-dev 
RUN apt-get install libzip-dev vim -y
RUN docker-php-ext-install mysqli pdo_mysql mbstring exif pcntl bcmath gd intl zip
# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

EXPOSE 9000

# Copy the start script into the container
COPY docker/php/script.sh /usr/local/bin/script.sh

# Make sure the script is executable
RUN chmod +x /usr/local/bin/script.sh

# Use the script as the entry point
ENTRYPOINT ["/usr/local/bin/script.sh"]