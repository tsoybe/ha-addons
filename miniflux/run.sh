#!/bin/sh
export DATABASE_URL="postgres://${DB_USER}:${DB_PASSWORD}@${DB_HOST}:${DB_PORT}/${DB_NAME}?sslmode=disable"
echo "##############################"
echo $DATABASE_URL

exec /usr/bin/miniflux
