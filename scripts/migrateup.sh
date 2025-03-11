#!/bin/bash

# Exit if any command fails
set -e

# Load environment variables from .env
if [ -f .env ]; then
    echo "Loading environment variables from .env"
    set -o allexport
    source .env
    set +o allexport
fi

# Check if DATABASE_URL is set
if [ -z "$DATABASE_URL" ]; then
    echo "DATABASE_URL environment variable is not set"
    exit 1
fi

echo "DATABASE_URL: $DATABASE_URL"

# Run Goose migrations
goose -dir sql/schema -table goose_db_version turso "$DATABASE_URL" up