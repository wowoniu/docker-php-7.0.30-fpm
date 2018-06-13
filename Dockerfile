FROM php:7.0-fpm-alpine
MAINTAINER qiang <zhiqiangvip999@gmail.com>

#更改国内镜像源
RUN echo -e "https://mirrors.ustc.edu.cn/alpine/v3.7/main\nhttps://mirrors.ustc.edu.cn/alpine/v3.7/community\n" > /etc/apk/repositories

#安装拓展
RUN apk update && apk add  \
            libpng \
            libpng-dev \
            libxml2 \
            libxml2-dev \
            libxslt \
            libxslt-dev \
            icu \
            icu-dev \
            libmcrypt \
            libmcrypt-dev

RUN docker-php-ext-install gd \
	&& docker-php-ext-install mysqli \
	&& docker-php-ext-install pdo_mysql \
	&& docker-php-ext-install zip \
	&& docker-php-ext-install soap \
	&& docker-php-ext-install xsl \
	&& docker-php-ext-install intl \
	&& docker-php-ext-install bcmath \
	&& docker-php-ext-install mcrypt

#安装PHP COMPOSER
RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer


