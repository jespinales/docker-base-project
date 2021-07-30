FROM php:8.0.9-fpm

# Set working directory
WORKDIR /var/www

# Install dependencies
RUN apt-get update \
    && apt-get install -y \
    locales \
    nano \
    vim \
    unzip \
    git \
    curl \
    wget

# Install php extensions
RUN docker-php-ext-install pdo_mysql

# Install Postgre PDO pgsql
RUN apt-get update \
    && apt-get install -y \
    libpq-dev \
    && docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
    && docker-php-ext-install pdo pdo_pgsql pgsql

# Install xdebug
RUN pecl install xdebug && docker-php-ext-enable xdebug

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Timezone
RUN apt-get install -y tzdata
ENV TZ America/Lima
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN cp /usr/local/etc/php/php.ini-development /usr/local/etc/php/php.ini
COPY conf.d /usr/local/etc/php/conf.d

# Set Locale
RUN echo es_ES.UTF-8 UTF-8 >> /etc/locale.gen
RUN locale-gen
ENV LANG es_ES.UTF-8
ENV LANGUAGE es_ES:es
ENV LC_ALL es_ES.UTF-8

# Expose port 9000 and start php-fpm server
EXPOSE 9000
CMD ["php-fpm"]
