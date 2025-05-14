ARG BUILD_FROM
FROM $BUILD_FROM

# Installiere Miniflux und benötigte Pakete
RUN apk add --no-cache curl postgresql-client
RUN wget -O /usr/local/bin/miniflux https://github.com/miniflux/v2/releases/download/2.2.8/miniflux-linux-arm64
RUN chmod +x /usr/local/bin/miniflux

COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD [ "/run.sh" ]