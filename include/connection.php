<?php

$localhost = 'localhost';
$db = 'codeexpress';
$user = 'root';
$pass = '';
$charset = 'utf8mb4';

$dsn = "mysql:host=$localhost;dbname=$db;charset=$charset";

try {
    $pdo = new PDO($dsn, $user, $pass);
} catch (\PDOException $e) {
    echo 'error connecting to database: ' . $e->getMessage();
}

 ?>