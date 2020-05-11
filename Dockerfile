FROM php:7.3-fpm

LABEL version="0.1" \
  description="An image containing the swool loader"

RUN apt-get update && apt-get install -y \
  libfreetype6-dev \
  libjpeg62-turbo-dev \
  libpng-dev \
  libpq-dev \
  libzip-dev zip unzip \
  tar untar

RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
  && docker-php-ext-install -j$(nproc) gd \
  # Install the curl extension
  && docker-php-ext-install curl \
  # Install the openssl extension
  && docker-php-ext-install openssl \
   # Install the fileinfo extension
   && docker-php-ext-install fileinfo \
  # Install the zip extension
  && docker-php-ext-install zip \
  # BCMath PHP Extension
  && docker-php-ext-install bcmath \
  # Mbstring PHP Extension is already installed
  # PDO PHP Extension
  && docker-php-ext-install pdo pdo_pgsql pdo_mysql
# Tokenizer PHP Extension is already installed
# XML PHP Extension is already installed

RUN pecl install -o -f redis; \
  rm -rf /tmp/pear \
  && docker-php-ext-enable redis

COPY --from=composer /usr/bin/composer /usr/bin/composer

RUN composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/

WORKDIR /etc/php
