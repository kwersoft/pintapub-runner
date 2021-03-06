FROM php:7.4
MAINTAINER Max Zamaliev <zamal@inbox.ru>

RUN set -eux ;                 \
    apt-get update -yqq &&     \
    apt-get install gnupg -yqq
RUN set -eux ; \
    https://deb.nodesource.com/setup_10.x | bash -
RUN set -eux ;                               \
    apt-get install -yqq git                 \
                         nodejs              \
                         postgresql          \
                         postgresql-client   \
                         libcurl4-gnutls-dev \
                         libicu-dev          \
                         libmcrypt-dev       \
                         libvpx-dev          \
                         libjpeg-dev         \
                         libpng-dev          \
                         libxpm-dev          \
                         zlib1g-dev          \
                         libfreetype6-dev    \
                         libxml2-dev         \
                         libexpat1-dev       \
                         libbz2-dev          \
                         libgmp3-dev         \
                         libldap2-dev        \
                         unixodbc-dev        \
                         libpq-dev           \
                         libsqlite3-dev      \
                         libaspell-dev       \
                         libsnmp-dev         \
                         libpcre3-dev        \
                         libtidy-dev         \
                         libzip-dev          \
                         ssh                 \
                         openssh-client      \
                         rsync 
RUN set -eux ; \
    docker-php-ext-install curl json intl gd xml bz2 opcache pdo pdo_pgsql
    
# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- \
        --filename=composer \
        --install-dir=/usr/local/bin && \
        echo "alias composer='composer'" >> /root/.bashrc && \
        composer

