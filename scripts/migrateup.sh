#!/bin/bash
set -e

# Source .env file if it exists
if [ -f .env ]; then
    source .env
fi

# Run goose migrations
echo "Running migrations from sql/schema directory"
goose -dir sql/schema turso "$DATABASE_URL" up