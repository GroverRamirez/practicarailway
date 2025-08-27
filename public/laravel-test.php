<?php
echo "Testing Laravel Framework...<br>";

// Check if vendor directory exists
if (file_exists(__DIR__ . '/../vendor')) {
    echo "✅ Vendor directory exists<br>";
} else {
    echo "❌ Vendor directory missing<br>";
}

// Check if bootstrap directory exists
if (file_exists(__DIR__ . '/../bootstrap')) {
    echo "✅ Bootstrap directory exists<br>";
} else {
    echo "❌ Bootstrap directory missing<br>";
}

// Check if app directory exists
if (file_exists(__DIR__ . '/../app')) {
    echo "✅ App directory exists<br>";
} else {
    echo "❌ App directory missing<br>";
}

// Try to load Composer autoloader
try {
    require_once __DIR__ . '/../vendor/autoload.php';
    echo "✅ Composer autoloader loaded successfully<br>";
} catch (Exception $e) {
    echo "❌ Failed to load autoloader: " . $e->getMessage() . "<br>";
}

// Try to bootstrap Laravel
try {
    if (file_exists(__DIR__ . '/../bootstrap/app.php')) {
        $app = require_once __DIR__ . '/../bootstrap/app.php';
        echo "✅ Laravel app bootstrapped successfully<br>";
        echo "App class: " . get_class($app) . "<br>";
    } else {
        echo "❌ bootstrap/app.php not found<br>";
    }
} catch (Exception $e) {
    echo "❌ Failed to bootstrap Laravel: " . $e->getMessage() . "<br>";
}

echo "<br>Test completed!";
?>
