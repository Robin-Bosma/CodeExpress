<?php
session_start();
include "../include/connection.php";

if (!isset($_GET["url"])) {
    header("Location: /index.php");
    exit;
}

$stmt = $pdo->prepare("SELECT * FROM private_posts WHERE url = ?");
$stmt->execute([$_GET["url"]]);
$post = $stmt->fetch(PDO::FETCH_ASSOC);

if (!$post) {
    header("Location: /index.php");
    exit;
}

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>Code Express</title>
    <link rel="icon" href="../img/logo.png" type="image/x-icon" />
    <style>
        <?php include '../style.css'; ?>
    </style>
</head>


<body>
    <!-- Navbar -->
    <?php include "../include/navbar.php" ?>

    <h1><?= $post["title"] ?></h1>
    <p>Created by: <?= $post["creator"] ?></p>
    <p>Categories: <?= $post["category"] ?></p>
    <p>Description: <?= $post["description"] ?></p>
    <h1>Code</h1>
    <pre><?= htmlspecialchars($post["code"]) ?></pre>

    <!-- Footer -->
    <?php include "../include/footer.php" ?>
</body>

</html>