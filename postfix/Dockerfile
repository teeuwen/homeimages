FROM public.ecr.aws/docker/library/alpine:3.22.0@sha256:8a1f59ffb675680d47db6337b49d22281a139e9d709335b492be023728e11715
ARG POSTFIX_VERSION

RUN apk add --no-cache \
    postfix=${POSTFIX_VERSION}

CMD ["/usr/sbin/postfix", "start-fg"]
