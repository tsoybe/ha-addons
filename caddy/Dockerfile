ARG BUILD_FROM
FROM $BUILD_FROM

RUN apk update
RUN apk add --upgrade apk-tools
RUN apk upgrade --available

RUN curl -s https://api.github.com/repos/miniflux/v2/releases/latest \
    | jq -r '.assets[] | select(.name | test("linux-amd64$")) | .browser_download_url' \
    | xargs curl -L -o /usr/bin/miniflux
RUN chmod +x /usr/bin/miniflux

COPY services.d /etc/services.d/
