FROM public.ecr.aws/docker/library/alpine:3.22.2@sha256:4b7ce07002c69e8f3d704a9c5d6fd3053be500b7f1c69fc0d80990c2ad8dd412
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
