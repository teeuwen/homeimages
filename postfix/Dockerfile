FROM public.ecr.aws/docker/library/alpine:3.22.1@sha256:4bcff63911fcb4448bd4fdacec207030997caf25e9bea4045fa6c8c44de311d1
ARG POSTFIX_VERSION

RUN apk add --no-cache \
    postfix=${POSTFIX_VERSION} \
    postfix-mysql=${POSTFIX_VERSION}

COPY --chmod=755 entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
