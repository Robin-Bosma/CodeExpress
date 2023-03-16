<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>
    <?php
    session_start();
    include "../include/connection.php";
    include "../include/insert-post.php";

    ?>

    <!DOCTYPE html>
    <html>

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
        <?php
        include "../include/connection.php";

        // Select all rows from the configuration table
        $sql = "SELECT * FROM configuration";
        $stmt = $pdo->query($sql);

        // Loop through the results and display each post
        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            // Determine which categories are checked
            $categories = array();
            if ($row["html"] == "true") {
                $categories[] = "HTML";
            }
            if ($row["css"] == "true") {
                $categories[] = "CSS";
            }
            if ($row["php"] == "true") {
                $categories[] = "PHP";
            }
            if ($row["javascript"] == "true") {
                $categories[] = "JavaScript";
            }
            if ($row["SQLcode"] == "true") {
                $categories[] = "SQL";
            }

            // Display post data
            echo "<h2>" . $row["title"] . "</h2>";
            echo "<p>" . $row["description"] . "</p>";
            echo "<ul>";
            foreach ($categories as $category) {
                echo "<li>" . $category . "</li>";
            }
            echo "</ul>";
            echo "<pre>" . $row["code"] . "</pre>";
        }
        ?>
        <!-- Footer -->
        <?php include "../include/footer.php" ?>

    </body>

    </html>