FROM public.ecr.aws/docker/library/alpine:3.23@sha256:865b95f46d98cf867a156fe4a135ad3fe50d2056aa3f25ed31662dff6da4eb62
ARG DOVECOT_VERSION
ARG RSPAMD_CLIENT_VERSION

RUN addgroup -g 1000 vmail \
    && adduser -h /srv/mail -s /bin/sh -G vmail -D -u 1000 vmail

RUN apk add --no-cache \
    dovecot=${DOVECOT_VERSION} \
    dovecot-fts-flatcurve=${DOVECOT_VERSION} \
    dovecot-lmtpd=${DOVECOT_VERSION} \
    dovecot-mysql=${DOVECOT_VERSION} \
    dovecot-pgsql=${DOVECOT_VERSION} \
    dovecot-pigeonhole-plugin=${DOVECOT_VERSION} \
    rspamd-client=${RSPAMD_CLIENT_VERSION} \
    && rm -rf /etc/dovecot/*

USER vmail

ENTRYPOINT ["/usr/sbin/dovecot", "-F"]
