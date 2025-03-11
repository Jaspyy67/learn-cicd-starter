#!/bin/bash

# Load variables from .env file if it exists
if [ -f .env ]; then
    source .env
fi

# Change directory to migrations folder
cd sql/schema

# Run Goose migrations directly using DATABASE_URL
goose turso $DATABASE_URL up