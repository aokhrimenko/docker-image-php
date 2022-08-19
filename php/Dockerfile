FROM php:8.1-fpm AS base
WORKDIR /app
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
      procps \
      libpq-dev \
      git \
      libfcgi-bin \
      libfcgi0ldbl \
      icu-devtools \
      libicu-dev \
      libfreetype6-dev \
      libjpeg62-turbo-dev \
      libpng-dev \
      libzip-dev \
      zip \
      unzip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-configure zip --with-zip \
    && docker-php-ext-install -j$(nproc) gd pdo pdo_pgsql pgsql bcmath zip intl \
    && echo |pecl install redis \
    && docker-php-ext-enable redis \
    && apt-get clean

RUN cp /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini && \
    sed -i 's~.*post_max_size.*~post_max_size = 20M~' /usr/local/etc/php/php.ini && \
    sed -i 's~.*memory_limit.*~memory_limit = 256M~' /usr/local/etc/php/php.ini

USER "www-data:www-data"

FROM base as dev
USER root
COPY --from=composer:2.2 /usr/bin/composer /usr/bin/composer
RUN pecl install xdebug \
     && docker-php-ext-enable xdebug
USER "www-data:www-data"


