<?php
echo "PHP is working!";
echo "<br>PHP Version: " . phpversion();
echo "<br>Current time: " . date('Y-m-d H:i:s');
echo "<br>Environment: " . ($_ENV['APP_ENV'] ?? 'not set');
echo "<br>Database connection: ";

try {
    $host = $_ENV['DB_HOST'] ?? 'mysql.railway.internal';
    $dbname = $_ENV['DB_DATABASE'] ?? 'railway';
    $username = $_ENV['DB_USERNAME'] ?? 'root';
    $password = $_ENV['DB_PASSWORD'] ?? '';
    
    $pdo = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    echo "SUCCESS - Connected to MySQL";
} catch (Exception $e) {
    echo "FAILED - " . $e->getMessage();
}
?>
