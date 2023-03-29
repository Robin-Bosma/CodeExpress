<?php
session_start();
include "../include/connection.php";
$counter = 0;
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
    <div id="overview-container">
        <nav class="item">
            <?php include "../include/navbar.php" ?>
        </nav>

        <div id="overview-content" class="content">
            <?php
            // Get the search query from the URL parameter
            $query = isset($_GET['q']) ? htmlspecialchars($_GET['q']) : '';

            // Query the database to find matching code snippets
            $stmt = $pdo->prepare("SELECT * FROM configuration WHERE title LIKE :query OR code LIKE :query OR tags LIKE :query LIKE :query OR description LIKE :query OR creator LIKE :query");
            $stmt->bindValue(':query', "%$query%");
            $stmt->execute();
            $code_array = $stmt->fetchAll(PDO::FETCH_OBJ);

            // Display the search results in history
            if (count($code_array) > 0) {
                foreach ($code_array as $key) {
                    echo "<h1 class='overview-line'><a class='overview-link' href='code.php?id={$key->id}'>{$key->title}</a></h1>";
                    echo "<div id='overview-item'>";
                    echo "<div id='overview-creator'>";
                    echo "<p id='overview-end'> Created by: {$key->creator}</p>";
                    echo "</div>";
                    echo "<div id='overview-desc'>";
                    echo "<p>Description:<br>{$key->description}</p>";
                    echo "</div>";
                    echo "<div id='overview-desc'>";
                    echo "<p>Tag(s):<br>{$key->tags}</p>";
                    echo "</div>";
                    echo "<div id='overview-date'>";
                    echo "<p class='overview-end'>Date created: {$key->date}</p>";
                    echo "</div>";
                    echo "</div>";
                    $counter++;
                    if ($counter % 3 == 0) {
                        $images = array("image1.png", "image2.png", "image3.png", "image4.png", "image5.png", "image6.png", "image7.png", "image8.png", "image9.png", "image10.png");
                        $rand_image = array_rand($images);
                        echo "<a href='https://www.youtube.com/watch?v=dQw4w9WgXcQ'><img src='../img//{$images[$rand_image]}' alt='Advertisement' class='Advertisement'></a>";
                    }
                }
            } else {
                echo "<h1>No results found.</h1>";
            }
            ?>
        </div>
        <!-- Footer -->
        <div id="overview-footer">
            <?php include "../include/footer.php" ?>
        </div>

    </div>
</body>

</html>