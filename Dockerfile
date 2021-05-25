FROM alpine:latest

RUN apk update && \
    apk upgrade && \
    apk add --no-cache rsync && \
    rm -rf /var/cache/apk/*
