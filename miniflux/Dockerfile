FROM ghcr.io/miniflux/miniflux

USER root
RUN apk add --no-cache jq

COPY run.sh /
CMD /run.sh
