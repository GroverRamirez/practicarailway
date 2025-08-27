#!/usr/bin/env bash
set -euo pipefail

# Ejecutar migraciones si la base de datos está disponible
echo "Checking database connection..."
php artisan migrate --force || echo "Migration failed, continuing..."

# Limpiar caches
php artisan config:clear || true
php artisan route:clear || true
php artisan view:clear || true

# Cachear configuraciones
php artisan config:cache || true
php artisan view:cache || true

echo "Application ready to start!"
