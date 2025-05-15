# FROM ghcr.io/miniflux/miniflux
FROM ghcr.io/home-assistant/amd64-base:latest

# ARG BUILD_FROM
# FROM $BUILD_FROM

RUN curl -s https://api.github.com/repos/miniflux/v2/releases/latest \
    | jq -r '.assets[] | select(.name | test("linux-amd64$")) | .browser_download_url' \
    | xargs curl -L -o /usr/bin/miniflux

RUN chmod +x /usr/bin/miniflux

RUN mkdir -p /etc/services.d/miniflux
COPY run /etc/services.d/miniflux

# CMD /run.sh
