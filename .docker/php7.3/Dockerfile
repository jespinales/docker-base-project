FROM php:7.3-fpm

# Set working directory
WORKDIR /var/www

RUN apt-get update --allow-releaseinfo-change

# Install dependencies
RUN apt-get update \
    && apt-get install -y \
    libzip-dev \
    build-essential \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    locales \
    zip \
    jpegoptim \
    optipng \
    pngquant \
    gifsicle \
    nano \
    vim \
    unzip \
    git \
    curl \
    wget

# Clear cache
RUN apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install extensions
RUN docker-php-ext-install pdo_mysql mbstring zip exif pcntl \
    && docker-php-ext-configure gd --with-gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ --with-png-dir=/usr/include/ \
    && docker-php-ext-install gd

# Install Postgre PDO pgsql
RUN apt-get update \
    && apt-get install -y \
    libpq-dev \
    && docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
    && docker-php-ext-install pdo pdo_pgsql pgsql

# Install imagick
#RUN apt-get update && apt-get install -y \
#    libmagickwand-dev --no-install-recommends \
#    && rm -rf /var/lib/apt/lists/* \
#    && printf "\n" | pecl install imagick \
#    && docker-php-ext-enable imagick

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Timezone
RUN apt-get install -y tzdata
ENV TZ America/Lima
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Add user for application
#RUN groupadd -g 1000 nginx
#RUN useradd -u 1000 nginx

# Copy existing application directory permissions
#COPY --chown=nginx:nginx . /var/www
#RUN chown -R nginx:nginx /var/www

RUN cp /usr/local/etc/php/php.ini-development /usr/local/etc/php/php.ini
COPY conf.d /usr/local/etc/php/conf.d

# Set Locale
RUN locale-gen es_ES.UTF-8
ENV LANG es_ES.UTF-8
ENV LANGUAGE es_ES:es
#ENV LC_ALL es_ES.UTF-8

# Change current user to nginx
#USER nginx

# Expose port 9000 and start php-fpm server
EXPOSE 9000
CMD ["php-fpm"]
