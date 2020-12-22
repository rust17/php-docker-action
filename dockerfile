ARG VERSION
FROM php:${VERSION}-cli

RUN rm /etc/apt/preferences.d/no-debian-php
RUN apt-get update && apt-get install -y \
        libzip-dev libzip4 zlib1g-dev libcurl3-dev libxml2-dev libpng-dev libfreetype6-dev libjpeg62-turbo-dev libmcrypt-dev libicu-dev \
        cron unzip php-xml php-bcmath php-curl php-xml php-gd php-zip

ARG VERSION
RUN if [ ${VERSION} = "7.3" ]; then \
		docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
	;else \
		docker-php-ext-configure gd --with-freetype --with-jpeg \
	;fi && \
	docker-php-ext-install -j$(nproc) gd \
	&& docker-php-ext-configure intl \
	&& docker-php-ext-install pdo_mysql pcntl zip bcmath intl \
	&& php -m | grep -q 'gd'

# Install Php Redis Extension
RUN  printf "\n" | pecl install -o -f redis \
  &&  rm -rf /tmp/pear \
  &&  docker-php-ext-enable redis

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer