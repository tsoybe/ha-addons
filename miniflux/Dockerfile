FROM ghcr.io/miniflux/miniflux

USER root
RUN apk add --no-cache jq

USER nobody
ENV RUN_MIGRATIONS=1

COPY run.sh /
CMD /run.sh
