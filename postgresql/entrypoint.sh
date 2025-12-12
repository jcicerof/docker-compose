#!/bin/sh
set -e

# Initialize database cluster on first run
if [ ! -s "$PGDATA/PG_VERSION" ]; then
    echo "Initializing PostgreSQL ULTRA-SLIM database cluster..."
    initdb -D "$PGDATA"

    # Set the postgres user password if provided
    if [ -n "$POSTGRES_PASSWORD" ]; then
        postgres --single -D "$PGDATA" <<EOF
ALTER USER postgres WITH PASSWORD '${POSTGRES_PASSWORD}';
EOF
    fi
fi

echo "Starting PostgreSQL server..."
exec "$@"

