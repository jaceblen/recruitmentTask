ARG DOCKER_PHP_VERSION=7.2-fpm-alpine
FROM php:${DOCKER_PHP_VERSION}

RUN apk add --update --no-cache nginx supervisor openrc autoconf g++ make git openssh openssh-client postgresql-dev libxml2-dev yaml-dev curl unzip wget less xmlsec py-pip ca-certificates zlib-dev\
    && pecl install yaml xdebug-2.9.0 \
    && docker-php-ext-enable yaml \
    && docker-php-ext-enable xdebug \
    && docker-php-ext-install mysqli pdo pdo_mysql pdo_pgsql calendar \
    && docker-php-ext-install soap mbstring json \
    && docker-php-ext-configure zip --with-zlib-dir=/usr \
    && docker-php-ext-install zip \
    && pip install hvac

ENV LD_PRELOAD /usr/lib/preloadable_libiconv.so php

WORKDIR /data/behat
RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/v3.12/community/ gnu-libiconv=1.15-r2

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer --version

COPY ./php7.2.ini /usr/local/etc/php/php.ini
COPY ./ioki_recruitment /data/behat

RUN composer install --no-interaction --prefer-source
