FROM public.ecr.aws/docker/library/alpine:3.22@sha256:4b7ce07002c69e8f3d704a9c5d6fd3053be500b7f1c69fc0d80990c2ad8dd412
ARG POSTFIX_VERSION

RUN apk add --no-cache \
    postfix=${POSTFIX_VERSION} \
    postfix-mysql=${POSTFIX_VERSION} \
    postfix-pgsql=${POSTFIX_VERSION}

COPY --chmod=755 entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
