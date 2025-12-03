FROM public.ecr.aws/docker/library/alpine:3.23.0@sha256:51183f2cfa6320055da30872f211093f9ff1d3cf06f39a0bdb212314c5dc7375
ARG DOVECOT_VERSION
ARG RSPAMD_CLIENT_VERSION

RUN addgroup -g 1000 vmail \
    && adduser -h /srv/mail -s /bin/sh -G vmail -D -u 1000 vmail

RUN apk add --no-cache \
    dovecot=${DOVECOT_VERSION} \
    dovecot-fts-flatcurve=${DOVECOT_VERSION} \
    dovecot-lmtpd=${DOVECOT_VERSION} \
    dovecot-mysql=${DOVECOT_VERSION} \
    dovecot-pigeonhole-plugin=${DOVECOT_VERSION} \
    rspamd-client=${RSPAMD_CLIENT_VERSION} \
    && rm -rf /etc/dovecot/*

USER vmail

ENTRYPOINT ["/usr/sbin/dovecot", "-F"]
