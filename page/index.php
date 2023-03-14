<?php
session_start();
include "../include/connection.php";
include "../include/insert-post.php";
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

        <!-- configuration -->
        <form method="post" action="../page/index.php">
            <div id="container-row">
                <div id="configuration">
                    <h1>Configuration</h1>
                    <div id="config-row">
                        <div id="confing-title">
                            <div id="pasting-code">
                                <h1> Code:</h1>
                                <input type="text" name="code" value="" required>
                            </div>
                            <h2 id="title-mr">Title:</h2>
                            <h2 id="category-mr">Category:</h2>
                            <h2 id="date-mr">Date:</h2>
                        </div>
                        <div id="config-input">
                            <input name="title" type="text" name="title" required>
                            <input name="category" type="text" name="category" required>
                            <input name="date" type="date" name="date" required>
                        </div>
                    </div>
                </div>
                <!-- description -->
                <div id="description">
                    <h1> description </h1>
                    <input id="description-input" name="description" type="text" value="" required>
                </div>
            </div>
            <!-- buttons post -->
            <input type="submit" name="submit" value="Create public post" onclick="">
            <input type="submit" name="submit-privite" value="Create privite post">
        </form>
        <!-- history -->
        <table>
    <thead>
        <tr>
            <th>Title</th>
            <th>Category</th>
        </tr>
    </thead>
    <tbody>
        <?php
        // Retrieve data from the configuration table
        $sql = "SELECT * FROM configuration";
        $result = $pdo->query($sql);

        if ($result->rowCount() > 0) {
            while($row = $result->fetch()) {
                echo "<tr>";
                echo "<td>" . $row["title"] . "</td>";
                echo "<td>" . $row["category"] . "</td>";
                echo "</tr>";
            }
        } else {
            echo "<tr><td colspan='2'>No results found</td></tr>";
        }
        ?>
    </tbody>
</table>
    <!-- Footer -->
    <?php include "../include/footer.php" ?>
</body>

</html>
