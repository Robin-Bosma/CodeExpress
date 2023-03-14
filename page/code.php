<?php
session_start();
include '../include/connection.php';
$problem_description = 'kaas';
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <style>
        <?php include '../style.css'; ?>
    </style>
    <?php
    if (isset($_POST['problem_description'])) {
        $problem_description = htmlspecialchars($_POST['problem_description']);
    }
    ?>
    <title><?php echo $problem_description ?> - CodeExpress</title>
</head>

<body>

    <!-- Navbar -->
    <?php include "../include/navbar.php" ?>

    <!-- Main Content -->
    <h1><?php echo $problem_description ?></h1>

    <!-- Footer -->
    <?php include "../include/footer.php" ?>

</body>

</html>