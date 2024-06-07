#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Set database connection variables
DB_HOST=localhost
DB_PORT=5432
DB_USER=your_db_user
DB_PASSWORD=your_db_password
DB_NAME=your_db_name

# Apply migrations to set up the database schema
echo "Applying migrations..."
for migration in ../migrations/*_up.sql; do
    psql "postgresql://${DB_USER}:${DB_PASSWORD}@${DB_HOST}:${DB_PORT}/${DB_NAME}" -f "$migration"
done

echo "Database initialization completed."
