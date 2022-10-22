FROM dunglas/frankenphp:latest

RUN wget https://xdebug.org/files/xdebug-3.2.0RC1.tgz  \
    && tar -xzf xdebug-3.2.0RC1.tgz \
    && cd xdebug-3.2.0RC1 \
    && phpize \
    && ./configure --enable-xdebug \
    && make \
    && make install

RUN echo "zend_extension=opcache.so" >> /usr/local/lib/php.ini \
     && echo "xdebug.idekey="PHPSTORM"" >> /usr/local/lib/php.ini \
     && echo "zend_extension=xdebug.so" >> /usr/local/lib/php.ini