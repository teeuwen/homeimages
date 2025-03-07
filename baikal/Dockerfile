FROM public.ecr.aws/docker/library/busybox:latest AS builder
ARG baikal_version

ADD https://github.com/sabre-io/Baikal/releases/download/${baikal_version}/baikal-${baikal_version}.zip .
RUN unzip -q baikal-${baikal_version}.zip

FROM public.ecr.aws/nginx/nginx:1.27.4-alpine-slim
ARG baikal_version

ENV php_version=83
RUN apk add --no-cache \
    php${php_version} \
    php${php_version}-curl \
    php${php_version}-fpm \
    php${php_version}-mbstring \
    php${php_version}-openssl \
    php${php_version}-pdo \
    php${php_version}-pdo_sqlite \
    php${php_version}-session \
    php${php_version}-sqlite3 \
    php${php_version}-xml \
    openssl \
    && sed -i 's/^user = .*/user = nginx/' /etc/php${php_version}/php-fpm.d/www.conf \
    && sed -i 's/^group = .*/group = nginx/' /etc/php${php_version}/php-fpm.d/www.conf \
    && sed -i 's/^;listen.owner = .*/listen.owner = nginx/' /etc/php${php_version}/php-fpm.d/www.conf \
    && sed -i 's/^;listen.group = .*/listen.group = nginx/' /etc/php${php_version}/php-fpm.d/www.conf \
    && sed -i 's/^listen = .*/listen = \/var\/run\/php-fpm.sock/' /etc/php${php_version}/php-fpm.d/www.conf

# Baikal does not create this folder on its own
COPY --chmod=755 <<EOF /docker-entrypoint.d/30-create-baikal-db-folder.sh
#!/bin/sh
mkdir -p /var/www/baikal/Specific/db
EOF

COPY --chmod=755 <<EOF /docker-entrypoint.d/40-php-fpm.sh
#!/bin/sh
/usr/sbin/php-fpm${php_version} --daemonize
EOF

COPY --from=builder --chown=nginx:nginx baikal /var/www/baikal
COPY nginx.conf /etc/nginx/conf.d/default.conf

VOLUME /var/www/baikal/config
VOLUME /var/www/baikal/Specific
