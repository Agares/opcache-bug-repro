FROM php:7.4.6

RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"
RUN mkdir $PHP_INI_DIR/php.d/

RUN docker-php-ext-install opcache
ADD opcache.ini .
RUN cat opcache.ini >> $PHP_INI_DIR/php.ini

RUN mkdir -p /wayfair/data/codebase/php/includes/filesystem/
RUN echo > rNSSDJBm2jVwL899rn2rA4g0PdC8Pb0S4mrd5Xfsqq00qdaaOW2PkZDOelKbI26iE64oYvrk7l
RUN echo > /wayfair/data/codebase/php/includes/filesystem/temporary_local_storage.php
ADD test.php .

RUN php -i | grep opcache
CMD ["php", "test.php"]