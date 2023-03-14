<?php
session_start();
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
    <title><?php echo $problem_description ?> - Name Website</title>
</head>

<body>

    <!-- Navbar -->
    <?php include "../include/navbar.php" ?>

    <!-- Main Content -->

    <!-- Footer -->
    <?php include "../include/footer.php" ?>

</body>

</html>