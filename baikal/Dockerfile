FROM public.ecr.aws/docker/library/busybox:latest AS builder
ARG BAIKAL_VERSION

ADD https://github.com/sabre-io/Baikal/releases/download/${BAIKAL_VERSION}/baikal-${BAIKAL_VERSION}.zip .
RUN unzip -q baikal-${BAIKAL_VERSION}.zip

FROM public.ecr.aws/docker/library/alpine:3.22.2@sha256:4b7ce07002c69e8f3d704a9c5d6fd3053be500b7f1c69fc0d80990c2ad8dd412

ENV PHP_VERSION=84
RUN apk add --no-cache \
    nginx \
    openssl \
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
    && sed -i 's/^;error_log = .*/error_log = \/dev\/null/' /etc/php${PHP_VERSION}/php-fpm.conf \
    && sed -i '/^user = .*/d;/^group = .*/d' /etc/php${PHP_VERSION}/php-fpm.d/www.conf \
    && sed -i 's/^;listen.owner = .*/listen.owner = nginx/' /etc/php${PHP_VERSION}/php-fpm.d/www.conf \
    && sed -i 's/^;listen.group = .*/listen.group = nginx/' /etc/php${PHP_VERSION}/php-fpm.d/www.conf \
    && sed -i 's/^listen = .*/listen = 127.0.0.1:9000/' /etc/php${PHP_VERSION}/php-fpm.d/www.conf

COPY --from=builder --chown=nginx:nginx baikal /var/www/baikal
COPY nginx.conf /etc/nginx/nginx.conf
COPY --chmod=755 entrypoint.sh /

USER nginx

VOLUME /run
VOLUME /tmp
VOLUME /var/www/baikal/Specific
VOLUME /var/www/baikal/config

ENTRYPOINT ["/entrypoint.sh"]
