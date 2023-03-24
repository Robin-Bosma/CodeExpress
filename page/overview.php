<?php
session_start();
include "../include/connection.php";
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
            <form method="GET">
                <label for="q">Search:</label>
                <input type="text" id="q" name="q" value="<?php echo isset($_GET['q']) ? htmlspecialchars($_GET['q']) : '' ?>">
                <button type="submit">Submit</button>
            </form>

            <?php
            // Get the search query from the URL parameter
            $query = isset($_GET['q']) ? htmlspecialchars($_GET['q']) : '';

            // Query the database to find matching code snippets
            $stmt = $pdo->prepare("SELECT * FROM configuration WHERE title LIKE :query");
            $stmt->bindValue(':query', "%$query%");
            $stmt->execute();
            $code_array = $stmt->fetchAll(PDO::FETCH_OBJ);

            // Display the search results
            if (count($code_array) > 0) {
                foreach ($code_array as $key) {
                    echo "<h1 class='overview-line'><a class='overview-link' href='code.php?id={$key->id}'>{$key->title}</a></h1>";
                    echo "<div id='overview-item'>";
                    echo "<p>{$key->description}</p>";
                    echo "<p id='overview-end'> Created by: {$key->creator}</p>";
                    echo "<p class='overview-end'>Date created: {$key->date}</p>";
                    echo "</div>";
                }
            } else if ($query !== '') {
                echo "No results found for '$query'.";
            } else {
                // Display all code snippets if no search query is provided
                $stmt = $pdo->prepare("SELECT * FROM configuration");
                $stmt->execute();
                $code_array = $stmt->fetchAll(PDO::FETCH_OBJ);

                foreach ($code_array as $key) {
                    echo "<h1 class='overview-line'><a class='overview-link' href='code.php?id={$key->id}'>{$key->title}</a></h1>";
                    echo "<div id='overview-item'>";
                    echo "<p>{$key->description}</p>";
                    echo "<p id='overview-end'> Created by: {$key->creator}</p>";
                    echo "<p class='overview-end'>Date created: {$key->date}</p>";
                    echo "</div>";
                }
            }
            ?>
        </div>
    </div>

    <footer class="footer">
        <?php include "../include/footer.php" ?>
    </footer>


</body>

</html>
