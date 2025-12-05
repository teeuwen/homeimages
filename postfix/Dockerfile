FROM public.ecr.aws/docker/library/alpine:3.23@sha256:51183f2cfa6320055da30872f211093f9ff1d3cf06f39a0bdb212314c5dc7375
ARG POSTFIX_VERSION

RUN apk add --no-cache \
    postfix=${POSTFIX_VERSION} \
    postfix-mysql=${POSTFIX_VERSION} \
    postfix-pgsql=${POSTFIX_VERSION}

COPY --chmod=755 entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
