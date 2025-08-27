#!/usr/bin/env bash
set -euo pipefail

echo "Starting build process..."

# Frontend (Vite)
if [ -f package.json ]; then
  echo "Installing Node.js dependencies..."
  npm ci
  echo "Building frontend..."
  npm run build
fi

# PHP deps para prod
echo "Installing PHP dependencies..."
composer install --no-dev --prefer-dist --optimize-autoloader

# Limpiar caches
echo "Clearing caches..."
php artisan config:clear || true
php artisan route:clear || true
php artisan view:clear || true
php artisan event:clear || true

# Cachear configuraciones
echo "Caching configurations..."
php artisan config:cache || true
php artisan view:cache || true

# Ejecutar migraciones
echo "Running database migrations..."
php artisan migrate --force || echo "Migration failed, but continuing..."

echo "Build completed successfully!"
