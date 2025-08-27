#!/usr/bin/env bash
set -euo pipefail

# Frontend (Vite)
if [ -f package.json ]; then
  npm ci
  npm run build
fi

# PHP deps para prod
composer install --no-dev --prefer-dist --optimize-autoloader

# Limpiar y cachear solo lo seguro (sin serializar rutas)
php artisan route:clear || true
php artisan config:clear || true
php artisan view:clear || true
php artisan event:clear || true

php artisan config:cache
php artisan view:cache
# NO 'php artisan optimize' ni 'route:cache' aquí por ahora
