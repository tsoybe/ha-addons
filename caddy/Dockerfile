ARG BUILD_FROM

FROM caddy:builder-alpine AS builder
RUN xcaddy build --with github.com/caddy-dns/desec


FROM $BUILD_FROM

RUN apk update
RUN apk add --upgrade apk-tools
RUN apk upgrade --available

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

EXPOSE 2019

COPY caddy.json /caddy.json
COPY run.sh /run.sh

RUN echo "{admin 0.0.0.0:2019}" > /Caddyfile

CMD ["/run.sh"]
