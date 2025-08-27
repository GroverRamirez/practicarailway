#!/bin/bash
set -e

echo "Starting Laravel application..."

# Wait for database to be ready
echo "Waiting for database connection..."
until php artisan tinker --execute="DB::connection()->getPdo();" 2>/dev/null; do
  echo "Database not ready, waiting..."
  sleep 2
done

echo "Database is ready!"

# Run migrations
echo "Running database migrations..."
php artisan migrate --force

# Clear and cache configurations
echo "Setting up application..."
php artisan config:clear
php artisan route:clear
php artisan view:clear
php artisan config:cache
php artisan view:cache

echo "Application is ready to start!"

# Start the application
exec php -S 0.0.0.0:$PORT -t public public/index.php
