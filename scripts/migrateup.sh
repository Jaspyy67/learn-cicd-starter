#!/bin/bash
set -e

# Source .env file if it exists
if [ -f .env ]; then
    source .env
fi

echo "Current directory: $(pwd)"
echo "Listing potential migration directories:"
ls -la
ls -la db/ 2>/dev/null || echo "No db/ directory"
ls -la sql/ 2>/dev/null || echo "No sql/ directory"
ls -la migrations/ 2>/dev/null || echo "No migrations/ directory"

# Try to find migration files
echo "Searching for migration files:"
find . -name "*.sql" | grep -i migrat || echo "No migration files found"

# Now run goose with the correct directory
# Use the directory where your migrations are located
MIGRATIONS_DIR="./migrations" # Change this to where your migrations actually are
echo "Using migrations directory: $MIGRATIONS_DIR"

goose -dir "$MIGRATIONS_DIR" turso "$DATABASE_URL" up