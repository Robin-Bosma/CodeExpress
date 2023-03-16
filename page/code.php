<?php
session_start();
include '../include/connection.php';

if (isset($_GET['id'])) {
    $id = intval($_GET['id']);
    $stmt = $pdo->prepare("SELECT title FROM configuration WHERE id = ?");
    $stmt->execute([$id]);
    $row = $stmt->fetch(PDO::FETCH_ASSOC);
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
    <!-- comments -->
    <h1>Comments</h1>
    <form method="post" action="../page/code.php">
        <input type="text" name="comment" placeholder="Write your comment here" required>
        <input type="submit" value="Add Comment">
    </form>

    <?php
    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        $stmt = $pdo->prepare('SELECT COUNT(*) FROM comments WHERE comment = ?');
        $stmt->execute([$_POST['comment']]);
        $count = $stmt->fetchColumn();
        if ($count == 0) {
            $stmt = $pdo->prepare('INSERT INTO comments (comment, date) VALUES (?, ?)');
            $stmt->execute([$_POST['comment'], date('Y-m-d H:i:s')]);
        } else {
            echo '<p style="color: red;">This comment has already been submitted.</p>';
        }
    }

    $stmt = $pdo->query('SELECT * FROM comments');

    while ($row = $stmt->fetch()) {
        echo '<p><strong>' . $row['comment'] . '</strong> (' . $row['date'] . ')</p>';
    }
    ?>

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
