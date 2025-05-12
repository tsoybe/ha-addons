FROM eclipse-mosquitto:1.6-openssl

RUN apk update
RUN apk add --upgrade apk-tools
RUN apk upgrade --available

RUN echo -e "persistence true\n\
persistence_location /mosquitto/data/\n\
log_dest file /mosquitto/log/mosquitto.log\n\
log_timestamp_format %Y-%m-%dT%H:%M:%S\n\
port 1883\n\
listener 9001\n\
protocol websockets\n\
" > /mosquitto/config/mosquitto.conf
