FROM ghcr.io/miniflux/miniflux

RUN apk add --no-cache jq

ENV RUN_MIGRATIONS=1

COPY run.sh /
CMD /run.sh
