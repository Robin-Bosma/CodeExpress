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
    $stmt = $pdo->prepare("SELECT * FROM configuration WHERE id = ?");
    $stmt->execute([$id]);

    $code = $stmt->fetch(PDO::FETCH_OBJ);

    function getTitle()
    {
        global $code;
        return $code->title;
    }

    function getCategory()
    {
        global $code;
        return $code->category;
    }

    function getDatum()
    {
        global $code;
        return $code->date;
    }

    function getCode()
    {
        global $code;
        return $code->code;
    }

    function getDescription()
    {
        global $code;
        return $code->description;
    }

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
    <div class="code-container">
        <div class="left-container">
            <div class="title-box">
                <h1><?php echo getTitle(); ?></h1>
            </div>
            <div class="flex-direction-row">
                <h2 class="margin"><?php echo getCategory(); ?></h2>
                <h2 class="margin"><?php echo getDatum(); ?></h2>
                <button id="copy-btn" onclick="copyToClipboard()">Copy Code</button>
            </div>
            <h1>Code:</h1>
            <div id="code">
                <?php echo getCode(); ?>
            </div>

            <div>
                <h1>Comments</h1>
                <div class="flex-direction-column">
                    <input class="code-input" type="text" placeholder="Write your comment here">
                    <input class="code-button" type="submit" value="Add Comment">
                </div>
            </div>
        </div>
        <div class="right-container">
            <h1>Post History</h1>
            <div class="right-container-content">
                <p class="line">"Title problem"</p>
                <div class="flex-direction-row">
                    <p class="margin">"Category"</p>
                    <p class="margin">"Date created"</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <?php include "../include/footer.php" ?>

</body>

<script>
    // The function for copying code
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