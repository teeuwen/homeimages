FROM public.ecr.aws/docker/library/alpine:3.21.3@sha256:a8560b36e8b8210634f77d9f7f9efd7ffa463e380b75e2e74aff4511df3ef88c
ARG POSTFIX_VERSION

RUN apk add --no-cache \
    postfix=${POSTFIX_VERSION}

CMD ["/usr/sbin/postfix", "start-fg"]
