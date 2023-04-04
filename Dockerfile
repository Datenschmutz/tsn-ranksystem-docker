FROM php:8.2.4-apache

# TSN TSN-Ranksystem Version
ARG VERSION=1.3.22

EXPOSE 80
ENV APACHE_DOCUMENT_ROOT /app

RUN apt update \
 && apt install -y git zlib1g-dev libzip-dev dumb-init \
 && apt-get autoremove -y \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* \
 && docker-php-ext-install zip mysqli pdo pdo_mysql

RUN git clone https://github.com/Newcomer1989/TSN-Ranksystem.git /app \
 && cd ${APACHE_DOCUMENT_ROOT} \
 && git fetch --all --tags --prune \
 && git checkout tags/${VERSION} \
 && rm -R .git .github \
 && mv /app/other /app/other.default \
 && mkdir -p /cronjob \
 && sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf \
 && sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

COPY php.ini /usr/local/etc/php/php.ini

VOLUME ["/app/other","/app/logs"]
ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["bash", "-c", "/entrypoint.sh"]
WORKDIR /app

ADD entrypoint.sh /

