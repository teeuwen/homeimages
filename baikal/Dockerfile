FROM public.ecr.aws/docker/library/busybox:latest AS builder
ARG BAIKAL_VERSION

ADD https://github.com/sabre-io/Baikal/releases/download/${BAIKAL_VERSION}/baikal-${BAIKAL_VERSION}.zip .
RUN unzip -q baikal-${BAIKAL_VERSION}.zip

FROM public.ecr.aws/nginx/nginx:1.29.0-alpine-slim@sha256:01ada80968b9b10b230ccc45737e5a52de58771bfa0ef9613f7eb85039128730
ARG BAIKAL_VERSION

ENV PHP_VERSION=83
RUN apk add --no-cache \
    php${PHP_VERSION} \
    php${PHP_VERSION}-curl \
    php${PHP_VERSION}-fpm \
    php${PHP_VERSION}-mbstring \
    php${PHP_VERSION}-openssl \
    php${PHP_VERSION}-pdo \
    php${PHP_VERSION}-pdo_sqlite \
    php${PHP_VERSION}-session \
    php${PHP_VERSION}-sqlite3 \
    php${PHP_VERSION}-xml \
    php${PHP_VERSION}-xmlreader \
    php${PHP_VERSION}-xmlwriter \
    openssl \
    && sed -i 's/^user = .*/user = nginx/' /etc/php${PHP_VERSION}/php-fpm.d/www.conf \
    && sed -i 's/^group = .*/group = nginx/' /etc/php${PHP_VERSION}/php-fpm.d/www.conf \
    && sed -i 's/^;listen.owner = .*/listen.owner = nginx/' /etc/php${PHP_VERSION}/php-fpm.d/www.conf \
    && sed -i 's/^;listen.group = .*/listen.group = nginx/' /etc/php${PHP_VERSION}/php-fpm.d/www.conf \
    && sed -i 's/^listen = .*/listen = \/var\/run\/php-fpm.sock/' /etc/php${PHP_VERSION}/php-fpm.d/www.conf

# Baikal does not create this folder on its own
COPY --chmod=755 <<EOF /docker-entrypoint.d/30-create-baikal-db-folder.sh
#!/bin/sh
mkdir -p /var/www/baikal/Specific/db
EOF

COPY --chmod=755 <<EOF /docker-entrypoint.d/40-php-fpm.sh
#!/bin/sh
/usr/sbin/php-fpm${PHP_VERSION} --daemonize
EOF

COPY --from=builder --chown=nginx:nginx baikal /var/www/baikal
COPY nginx.conf /etc/nginx/conf.d/default.conf

VOLUME /var/www/baikal/config
VOLUME /var/www/baikal/Specific
