<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
session_start();
include "../include/connection.php";

$stmt = $pdo->prepare("SELECT * FROM private_posts WHERE url = ?");
$stmt->execute([$_GET["url"]]);
$post = $stmt->fetch(PDO::FETCH_ASSOC);

$url = $_GET["url"];

function getCategory1($post)
{
    return $post["html"];
}

function getCategory2($post)
{
    return $post["css"];
}

function getCategory3($post)
{
    return $post["php"];
}

function getCategory4($post)
{
    return $post["javascript"];
}

function getCategory5($post)
{
    return $post["SQLcode"];
}


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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.62.0/codemirror.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.62.0/mode/xml/xml.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.62.0/mode/javascript/javascript.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.62.0/mode/css/css.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.62.0/mode/htmlmixed/htmlmixed.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.62.0/mode/php/php.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.62.0/mode/sql/sql.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.62.0/codemirror.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.62.0/theme/darcula.min.css">
    <style>
        <?php include '../style.css'; ?>
    </style>
</head>


<body>
    <!-- Navbar -->
    <?php include "../include/navbar.php" ?>
    <div class="code-container">
        <div class="left-container">
            <h1><?= $post["title"] ?></h1>
            <p>Created by: <?= $post["creator"] ?></p>
            <p>Categories:

            </p>
            <p>Description: <?= $post["description"] ?></p>
            <h1>Code</h1>
            <!-- Code display using CodeMirror -->
            <textarea cols="80" rows="10" id="code" type="text" name="code" mode="text/html">
    <?php echo htmlspecialchars($post["code"]) ?>
</textarea>

            <script>
                var editor = CodeMirror.fromTextArea(document.getElementById("code"), {
                    lineNumbers: true,
                    mode: "htmlmixed",
                    theme: "darcula",
                    readOnly: true
                });

                var modes = {
                    "HTML": "htmlmixed",
                    "CSS": "css",
                    "JavaScript": "javascript",
                    "PHP": "php",
                    "Python": "python",
                    "Ruby": "ruby",
                    "Java": "clike",
                    "C++": "clike",
                    "C": "clike",
                    "SQL": "sql"
                };

                var modeSelect = document.getElementById("mode-select");

                for (var mode in modes) {
                    var option = document.createElement("option");
                    option.setAttribute("value", modes[mode]);
                    option.innerHTML = mode;
                    modeSelect.appendChild(option);
                }

                modeSelect.addEventListener("change", function() {
                    var mode = modeSelect.options[modeSelect.selectedIndex].value;
                    editor.setOption("mode", mode);
                });
            </script>
        </div>
    </div>
    <div>
        <h1 class="config">Comments</h1>
        <form method="post">
            <div class="flex-direction-column">
                <input class="code-input" type="text" id="comment_text" name="comment_text" placeholder="Write your comment here">
                <input class="code-button" type="submit" name="submit" value="Add Comment">
            </div>
            <?php
            // Connect to the SQL database
            $conn = mysqli_connect("localhost", "root", "", "codeexpress");

            // Check connection
            if (!$conn) {
                die("Connection failed: " . mysqli_connect_error());
            }

            // Check if the form has been submitted
            if (isset($_POST['submit'])) {
                // Get the comment text
                $comment_text = $_POST['comment_text'];
                // Generate a random username or leave it blank
                $username = rand(1, 9999);

                // Insert the comment into the SQL table
                $sql = "INSERT INTO comments (comment_text, username, date_created) VALUES ('$comment_text', '$username', NOW())";
                if (mysqli_query($conn, $sql)) {
                } else {
                    echo "Error: " . $sql . "<br>" . mysqli_error($conn);
                }
            }

            // Retrieve the comments from the SQL table
            $sql = "SELECT * FROM comments";
            $result = mysqli_query($conn, $sql);

            // Loop through the comments and display each one
            while ($row = mysqli_fetch_assoc($result)) {
                echo "<p>Anonymous user " . $row['username'] . " said: " . $row['comment_text'] . " | on " . date("F j, Y, g:i a", strtotime($row['date_created'])) . "</p>";
            }

            // Close the SQL connection
            mysqli_close($conn);
            ?>
        </form>
    </div>
    </div>
    <div class="right-container">
        <h1>Post History</h1>
        <div class="right-container-content">
            <div class="line">
                <div class="flex-direction-row-height">
                    <p class="margin-righter">Title</p>
                    <p>Category</p>
                </div>
            </div>
            <div class="table-container">
                <table>
                    <?php
                    // Retrieve data from the configuration table
                    $sql = "SELECT * FROM configuration";
                    $result = $pdo->query($sql);

                    if ($result->rowCount() > 0) {
                        while ($row = $result->fetch()) {
                            echo "<tr>";
                            echo "<td><a class='margin-right' href='../page/code.php?id=" . $row['id'] . "'>" . $row["title"] . "</a></td>";
                            echo "<td>" . $row["category"] . "</td>";
                            echo "</tr>";
                        }
                    } else {
                        echo "<tr><td colspan='2'>No results found</td></tr>";
                    }
                    ?>
                </table>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <?php include "../include/footer.php" ?>

</body>

</html>