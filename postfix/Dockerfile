FROM public.ecr.aws/docker/library/alpine:3.23@sha256:865b95f46d98cf867a156fe4a135ad3fe50d2056aa3f25ed31662dff6da4eb62
ARG POSTFIX_VERSION

RUN apk add --no-cache \
    postfix=${POSTFIX_VERSION} \
    postfix-mysql=${POSTFIX_VERSION} \
    postfix-pgsql=${POSTFIX_VERSION}

COPY --chmod=755 entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
