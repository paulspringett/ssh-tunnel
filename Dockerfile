FROM alpine:3.2
MAINTAINER Paul Springett <paul@springett.me>

RUN apk add --update openssh-client && \
    rm -rf /var/cache/apk/*

ENV SSH_AUTH_SOCK /ssh/auth/sock
VOLUME ["/ssh"]

EXPOSE 3307
ENTRYPOINT ["/usr/bin/ssh", "-v", "-T", "-N", "-o", "StrictHostKeyChecking=false", "-o", "ServerAliveInterval=180", "-L"]
