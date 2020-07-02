FROM php:7.2-fpm
#维护者信息
MAINTAINER miaocansky
#时区
ENV TZ Asia/Shanghai
RUN date -R

WORKDIR /working
RUN apt-get update --fix-missing && apt-get install -y libpng-dev libjpeg-dev libfreetype6-dev  \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include --with-jpeg-dir=/usr/include/jpeg \
    && docker-php-ext-install gd mysqli opcache pdo_mysql gd zip
ENV PHPREDIS_VERSION 5.2.2
ENV PHPXDEBUG_VERSION 2.6.0
ENV PHPSWOOLE_VERSION 4.5.1
ENV PHPMONGODB_VERSION 1.5.3
RUN pecl install redis-$PHPREDIS_VERSION \
#    && pecl install xdebug-$PHPXDEBUG_VERSION \
    && pecl install swoole-$PHPSWOOLE_VERSION \
    && pecl install mongodb-$PHPMONGODB_VERSION \
    && docker-php-ext-enable redis  swoole mongodb
# install composer new
# https://getcomposer.org/installer | https://install.phpcomposer.com/installer
 RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
     && php composer-setup.php \
     && php -r "unlink('composer-setup.php');" \
     && mv composer.phar /usr/local/bin/composer \
     && composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/
RUN apt-get install -y git
# clear
RUN rm -rf /var/cache/apt/* \
    && rm -rf /var/lib/apt/lists/*
RUN mkdir /var/lib/sessions \
    && chmod o=rwx -R /var/lib/sessions
#容器启动时执行指令


CMD ["php-fpm"]