FROM php
MAINTAINER dingdayu <614422099@qq.com>

ENV LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    LC_ALL=en_US.UTF-8 \
    DEBIAN_FRONTEND=noninteractive

# install php and ext
RUN apt-get update -yqq \
    && apt-get install git nodejs rsync zip unzip libcurl4-gnutls-dev openssh-client libicu-dev libzip-dev libmcrypt-dev libvpx-dev libjpeg-dev libpng-dev libxpm-dev zlib1g-dev libfreetype6-dev libxml2-dev libexpat1-dev libbz2-dev libgmp3-dev libldap2-dev unixodbc-dev libpq-dev libsqlite3-dev libaspell-dev libsnmp-dev libpcre3-dev libtidy-dev -yqq --no-install-recommends \
    && docker-php-ext-install mbstring pdo_mysql curl json intl gd xml zip bz2 opcache \
    && pecl install https://pecl.php.net/get/xdebug-2.7.0RC1.tgz \
    && docker-php-ext-enable xdebug \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer
