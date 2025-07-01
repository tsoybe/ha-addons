#!/usr/bin/sh

export HOME=/data
exec /usr/bin/caddy run --resume --config /caddy.json
