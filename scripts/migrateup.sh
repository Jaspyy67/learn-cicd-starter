#!/bin/bash
set -e

# Source .env file if it exists (useful for local development)
if [ -f .env ]; then
    source .env
fi

# Option 1: If migrations are in db/migrations relative to project root
goose turso "$DATABASE_URL" up
