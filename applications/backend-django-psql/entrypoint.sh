#!/bin/bash
set -e

# until psql -h "$DB_HOST" -U "$DB_USE" -c '\l'; do
#   echo 'Waiting for Postgres';
#   sleep 5;
# done; echo -e "  >> Postgres is available";

if [ "$DB_MIGRATE" == "yes" ]; then
  echo "Starting database migration..."
  python manage.py migrate
fi

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"


