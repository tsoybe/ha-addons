#!/bin/sh

echo "##############################"

export BASE_PATH=$(jq -r '.base_url' /data/options.json)
echo "BasePath: $BASE_PATH"

export RUN_MIGRATIONS=1

DB_HOST=$(jq -r '.db_host' /data/options.json)
DB_PORT=$(jq -r '.db_port' /data/options.json)
DB_NAME=$(jq -r '.db_name' /data/options.json)
DB_USER=$(jq -r '.db_user' /data/options.json)
DB_PASSWORD=$(jq -r '.db_password' /data/options.json)
export DATABASE_URL="postgres://${DB_USER}:${DB_PASSWORD}@${DB_HOST}:${DB_PORT}/${DB_NAME}?sslmode=disable"
echo "DATABASE_URL=\"postgres://${DB_USER}:***@${DB_HOST}:${DB_PORT}/${DB_NAME}?sslmode=disable\""

CREATE_ADMIN=$(jq -r '.create_admin' /data/options.json)
if [ "$CREATE_ADMIN" = "true" ]; then
  export CREATE_ADMIN=1
  export ADMIN_USERNAME=$(jq -r '.admin_username' /data/options.json)
  export ADMIN_PASSWORD=$(jq -r '.admin_password' /data/options.json)
  echo "Create Admin: $ADMIN_USERNAME"
else
  export CREATE_ADMIN=0
fi

echo "##############################"
exec /usr/bin/miniflux
