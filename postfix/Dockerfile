FROM public.ecr.aws/docker/library/alpine:3.21.3
ARG POSTFIX_VERSION

RUN apk add --no-cache \
    postfix=${POSTFIX_VERSION}

CMD ["/usr/sbin/postfix", "start-fg"]
