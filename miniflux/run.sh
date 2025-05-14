#!/bin/sh

echo "##############################"

cat /data/options.json

DB_HOST=$(jq -r '.db_host' /data/options.json)
DB_PORT=$(jq -r '.db_port' /data/options.json)
DB_NAME=$(jq -r '.db_name' /data/options.json)
DB_USER=$(jq -r '.db_user' /data/options.json)
DB_PASSWORD=$(jq -r '.db_password' /data/options.json)

export DATABASE_URL="postgres://${DB_USER}:${DB_PASSWORD}@${DB_HOST}:${DB_PORT}/${DB_NAME}?sslmode=disable"

env

exec su-exec nobody /usr/bin/miniflux
