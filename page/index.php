<?php
session_start();
include "../include/connection.php"
?>
<!DOCTYPE html>
<html>

<head>
<title>Code Express</title>
    <link rel="icon" href="../img/CodeExpress-logo.png" type="image/x-icon" />
    <style>
        <?php include '../style.css'; ?>
    </style>
</head>

<body>
    <!-- Navbar -->
    <?php include "../include/navbar.php" ?>
    <!-- Main Content -->
    <div class="index-container">
        <div id="pasting-code">
            <h1> Code:</h1>
            <input type="text" value="">
        </div>
        <!-- configuration -->
        <div id="container-row">
            <div id="configuration">
                <h1>Configuration</h1>
                <div id="config-row">
                    <div id="confing-title">
                        <h2 id="title-mr">Title:</h2>
                        <h2 id="category-mr">Category:</h2>
                        <h2 id="date-mr">Date:</h2>
                    </div>
                    <div id="config-input">
                        <input name="title" type="text" name="title">
                        <input name="category" type="text" name="category">
                        <input name="date" type="date" name="date">
                    </div>
                </div>
            </div>

            <!-- description -->
            <div id="description">
                <h1> description </h1>
                <input id="description-input"  name="description" type="text" value="">
            </div>
        </div>
    </div>
    <!-- buttons post -->
    <input type="submit" name="submit-public" value="Create public post">
    <input type="submit" name="submit-privite" value="Create privite post">
    <!-- Footer -->
    <?php include "../include/footer.php"?>
</body>

</html>