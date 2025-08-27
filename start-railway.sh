#!/bin/bash
set -e

echo "=== Railway Startup Script ==="
echo "Current directory: $(pwd)"
echo "PHP version: $(php -v | head -1)"
echo "Port: $PORT"
echo "Environment: $APP_ENV"

# Check if public directory exists
if [ ! -d "public" ]; then
    echo "ERROR: public directory not found!"
    exit 1
fi

# Check if index.php exists
if [ ! -f "public/index.php" ]; then
    echo "ERROR: public/index.php not found!"
    exit 1
fi

# Check if vendor directory exists
if [ ! -d "vendor" ]; then
    echo "ERROR: vendor directory not found!"
    exit 1
fi

echo "All required files and directories found!"

# Test PHP basic functionality
echo "Testing PHP basic functionality..."
php -r "echo 'PHP is working!'; echo PHP_EOL;"

# Start the server with detailed logging
echo "Starting PHP server on port $PORT..."
echo "Document root: $(pwd)/public"
echo "Entry point: public/index.php"

exec php -S 0.0.0.0:$PORT -t public public/index.php
