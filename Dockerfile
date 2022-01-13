FROM alpine
RUN apk add --update dnsmasq
RUN rm -rf /var/cache/apk/*
EXPOSE 53 53/udp
ENTRYPOINT ["dnsmasq", "--no-hosts", "--no-daemon", "--keep-in-foreground", "--log-queries", "--no-resolv"]
