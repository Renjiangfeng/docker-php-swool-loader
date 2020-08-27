FROM php:7.2-fpm

LABEL version="0.1" \
  description="An image containing the swool loader"

RUN apt-get update && apt-get install -y \
  libfreetype6-dev \
  libjpeg62-turbo-dev \
  libpng-dev \
  libpq-dev \
  libzip-dev zip unzip \
  vim

COPY ./swoole_loader.so  /home
# copy sh
#COPY ./loader.sh  /home
COPY ./install_swoole_loader.sh  /home
COPY ./encry.sh  /home

RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
   && docker-php-ext-install -j$(nproc) gd

  # Install the openssl extension
RUN    docker-php-ext-install zip \
  # BCMath PHP Extension
  && docker-php-ext-install bcmath \
  # Mbstring PHP Extension is already installed
  # PDO PHP Extension
  && docker-php-ext-install pdo pdo_pgsql pdo_mysql
# Tokenizer PHP Extension is already installed
# XML PHP Extension is already installed

# copy swoole_loader
#
RUN  bash /home/loader.sh
#RUN pecl install -o -f redis; \
#  rm -rf /tmp/pear \
#  && docker-php-ext-enable redis
#
#COPY --from=composer /usr/bin/composer /usr/bin/composer
#
#RUN composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/

WORKDIR /home
