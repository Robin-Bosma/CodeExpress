<?php
session_start();
include "../include/connection.php"
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <link rel="icon" href="../img/CodeExpress-logo.png" type="image/x-icon" />
    <style>
        <?php include '../style.css'; ?>
    </style>
    <title>Overview - Code Express</title>
</head>

<body>

    <?php

$stmt = $pdo->prepare("SELECT * FROM configuration");
$stmt->execute();
$code_array = $stmt->fetchAll(PDO::FETCH_OBJ);

function echoCode($code_array) {
    foreach ($code_array as $key) {
        echo $key->title;
        echo "<a href='code.php?id=$key->id'>Details</a>";
    }
}

?>
    <!-- Navbar -->
    <?php include "../include/navbar.php" ?>

    <!-- Main Content -->
    <h1>Dit is overview</h1>
    <?php  echoCode($code_array);  ?>

    <!-- Footer -->
    <?php include "../include/footer.php" ?>

</body>

</html>