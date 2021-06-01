ARG DOCKER_PHP_VERSION=7.2-fpm-alpine
FROM php:${DOCKER_PHP_VERSION}

RUN apk add --update --no-cache  openrc autoconf g++ make git   libxml2-dev yaml-dev curl unzip wget less xmlsec py-pip ca-certificates zlib-dev\
    && pecl install yaml xdebug-2.9.0 \
    && docker-php-ext-enable yaml \
    && docker-php-ext-enable xdebug \
    && docker-php-ext-install soap mbstring json \
    && docker-php-ext-configure zip --with-zlib-dir=/usr \
    && docker-php-ext-install zip \
    && pip install hvac \
    && rm -rf /var/cache/apk/*

WORKDIR /data/behat

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY ./php7.2.ini /usr/local/etc/php/php.ini
COPY ./ioki_recruitment /data/behat

RUN composer install --no-interaction --prefer-source
