# Use official PHP image with Apache
FROM php:8.1-apache

# Install system dependencies and PHP extensions
RUN apt-get update && apt-get install -y \
    libzip-dev unzip git curl zip \
    && docker-php-ext-install pdo pdo_mysql zip \
    && a2enmod rewrite

# Set working directory
WORKDIR /var/www/html

# Copy Yii2 app files to container
COPY . .

# Expose HTTP port
EXPOSE 80

# Healthcheck (optional but useful for Swarm)
HEALTHCHECK CMD curl --fail http://localhost || exit 1
