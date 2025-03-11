#!/bin/bash
set -e

# Source .env file if it exists
if [ -f .env ]; then
    source .env
fi

# Debugging
echo "DATABASE_URL environment variable check:"
if [ -z "$DATABASE_URL" ]; then
    echo "DATABASE_URL is empty or not set!"
else
    echo "DATABASE_URL is set (first 10 chars): ${DATABASE_URL:0:10}..."
fi

# Print environment variables being passed to the GitHub action
echo "GitHub Action environment:" 
env | grep -i database || echo "No DATABASE_URL in environment"

# Run goose migrations with explicit DATABASE_URL
echo "Running migrations from sql/schema directory"
DATABASE_URL="$DATABASE_URL" goose -dir sql/schema turso "$DATABASE_URL" up