<?php
session_start();
include '../include/connection.php';

if (isset($_GET['id'])) {
    $id = intval($_GET['id']);
    $query = "SELECT title FROM configuration WHERE id = $id";
    $result = mysqli_query($connection, $query);
    $row = mysqli_fetch_assoc($result);
    $title = $row['title'];
} else {
    $title = "CodeExpress";
}

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
    <div class="c-row">
        <h1>PHP</h1>
        <h1><?php echo 'date created' ?></h1>
        <h1><?php echo 'date edited' ?></h1>
        <button id="copy-btn" onclick="copyToClipboard()">Copy Code</button>
    </div>
    <h1>Code:</h1>
    <div id="code"></div>

    <h1>Comments</h1>
    <input type="text" placeholder="Write your comment here">
    <input type="submit" value="Add Comment">

    <!-- Footer -->
    <?php include "../include/footer.php" ?>

</body>

<script>
    function copyToClipboard() {
        var codeDiv = document.getElementById("code");
        var codeText = codeDiv.innerHTML;
        navigator.clipboard.writeText(codeText).then(function() {
            alert("Code copied to clipboard!");
        }, function() {
            alert("Failed to copy code to clipboard.");
        });
    }
</script>

</html>