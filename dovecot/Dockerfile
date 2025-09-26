FROM public.ecr.aws/docker/library/alpine:3.22.1@sha256:4bcff63911fcb4448bd4fdacec207030997caf25e9bea4045fa6c8c44de311d1
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
