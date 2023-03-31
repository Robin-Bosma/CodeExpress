<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
session_start();
include "../include/connection.php";

$stmt = $pdo->prepare("SELECT * FROM private_posts WHERE url = ?");
$stmt->execute([$_GET["url"]]);
$post = $stmt->fetch(PDO::FETCH_ASSOC);

$url = $_GET["url"];

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
        <div class="private-left-container">
            <h1 class="config"><?= $post["title"] ?></h1>
            <div class="header-box">
                <h2 class="margin"><?= $post["tags"] ?></h2>
                <h2 class="margin"><?= $post["date"] ?></h2>
                <button id="copy-btn" onclick="copyToClipboard()">Copy Code</button>
            </div>

            </p>
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
        <div class="private-right-container">
            <h1>Post History</h1>
            <div class="private-right-container-content">
                <div class="line">
                    <div class="flex-direction-row-height">
                        <p class="his-margin-righter">Title</p>
                        <p>Tags</p>
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
                                echo "<td>" . $row["tags"] . "</td>";
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
    </div>



    <!-- Footer -->
    <?php include "../include/footer.php" ?>

</body>

<script>
    // The function for copying code
    function copyToClipboard() {
        var codeDiv = document.getElementById("code");
        var codeText = codeDiv.innerText;
        navigator.clipboard.writeText(codeText).then(function() {
            alert("Code copied to clipboard!");
        }, function() {
            alert("Failed to copy code to clipboard.");
        });
    }
</script>

</html>