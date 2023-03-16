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

    <form method="post" action="../page/index.php">
        <h1 class="config-code">Code:</h1>
        <textarea cols="80" rows="10" id="code" type="text" name="code" required>
</textarea>
        <h1 class="config-code">Description:</h1>
        <textarea cols="80" rows="10" id="code" type="text" name="description" required>
</textarea>
        <h1 class="config">Configurations</h1>
        <div class="configurations">
            <p class="config-title">Title:</p> <input type="text" id="title" name="title" required>
        </div>
        <div class="configurations">
            <p class="config-tags">Created by:</p> <input type="text" id="tags" name="creator">
        </div>

        <div class="category" required>
            <p class="config-category">Category:</p>
            <div id="checkboxes">
                <input type="checkbox" id="checkbox-codes" name="category[]" value="HTML">
                <label for="HTML">HTML</label><br>
                <input type="checkbox" id="checkbox-codes" name="category[]" value="CSS">
                <label for="CSS">CSS</label><br>
                <input type="checkbox" id="checkbox-codes" name="category[]" value="PHP">
                <label for="PHP">PHP</label><br>
                <input type="checkbox" id="checkbox-codes" name="category[]" value="JavaScript">
                <label for="JavaScript">JavaScript</label><br>
                <input type="checkbox" id="checkbox-codes" name="category[]" value="SQL">
                <label for="SQL">SQL</label><br>
            </div>
        </div>
        <div><input type="submit" id="submit" href="code.php" value="Create Public post"> <input type="submit" id="submit" value="Create Private post"></div>
    </form>
    <tbody>
        <?php
        // Retrieve data from the configuration table
        $sql = "SELECT * FROM configuration";
        $result = $pdo->query($sql);

        if ($result->rowCount() > 0) {
            while ($row = $result->fetch()) {
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