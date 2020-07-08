#!/usr/bin/env bash

wait_for_db_connection() {
    # make sure pg is ready to accept connections
    until pg_isready -d $DATABASE_URL
    do
      echo "Waiting for postgres at: $DATABASE_URL"
      sleep 1;
    done
}

wait_for_db_connection

exec "$@"