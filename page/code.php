<?php
session_start();
include '../include/connection.php';
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <style>
        <?php include '../style.css'; ?>
    </style>
    <?php
    if (isset($_POST['title'])) {
        $title = htmlspecialchars($_POST['title']);
    }
    ?>
    <title><?php echo $title ?> - CodeExpress</title>
</head>

<body>

    <!-- Navbar -->
    <?php include "../include/navbar.php" ?>

    <!-- Main Content -->
    <h1><?php echo $title ?></h1>

    <h1>PHP</h1>
    <h1><?php echo $date_created ?></h1>
    <h1><?php echo $date_edited ?></h1>
    <button id="copy-btn" onclick="copyToClipboard()">Copy Code</button>

    <div id="code"> <button>Click me</button> <!-- your code here --> </div>

    <!-- Footer -->
    <?php include "../include/footer.php" ?>

</body>

<script>
    function copyToClipboard() {
        var codeDiv = document.getElementById("code");
        var codeText = codeDiv.textContent;
        navigator.clipboard.writeText(codeText).then(function() {
            alert("Code copied to clipboard!");
        }, function() {
            alert("Failed to copy code to clipboard.");
        });
    }
</script>

</html>