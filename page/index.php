<?php
session_start();
include "../include/connection.php";
require_once "../include/insert-post.php";
?>

<!DOCTYPE html>
<html>

<head>
    <title>Code Express</title>
    <link rel="icon" href="../img/logo.png" type="image/x-icon" />

    <!-- Include CodeMirror Stylesheet -->
    <link rel="stylesheet" href="https://codemirror.net/theme/dracula.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.62.0/codemirror.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.62.0/theme/darcula.min.css" />

    <script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.62.0/codemirror.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.62.0/mode/xml/xml.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.62.0/mode/javascript/javascript.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.62.0/mode/css/css.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.62.0/mode/htmlmixed/htmlmixed.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.62.0/mode/php/php.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.62.0/mode/sql/sql.min.js"></script>

    <!-- Include Your Custom Stylesheet -->
    <style>
        <?php include '../style.css'; ?>
    </style>
</head>

<body>
    <!-- Navbar -->
    <div class="item">
        <?php include "../include/navbar.php" ?>
    </div>
    <div class="grid-container">
        <div class="item1">
            <form method="post" action="../page/index.php">
                <h1 class="config-code">Code:</h1>

                <!-- Add the Textarea Element for Code -->
                <textarea cols="80" rows="10" id="code" type="text" name="code" mode="text/html"></textarea>
                <!-- Initialize CodeMirror on the Textarea Element with Multiple Modes -->
                <h1 class="config">Configurations</h1>
        </div>
        <!-- configuration -->
        <div class="item2">
            <div class="configurations">
                <p class="config-title">Title:</p>
                <input type="text" id="title" name="title" placeholder="Title (max 15 characters)" maxlength="15" required>
            </div>
            <div class="configurations">
                <p class="config-created">Created by:</p>
                <input type="text" id="created" name="creator" placeholder="Who made this code?" required>  
            </div>
            <div class="configurations">
                <p class="config-tags">Tags:</p>
                <input type="tags" id="tags" name="tags" placeholder="For example: HTML, CSS" required>
            </div>
        </div>
        <div class="item3-text">
            <h1 class="config-desc">Description:</h1>
        </div>
        <div class="item3">
            <textarea cols="80" rows="10" id="desc" type="text" name="description" placeholder="Give a small description about you code.. What Language does your code use? What is your code about?"></textarea>
        </div>
        <div class="item4">
            <div class="right-container">
                <h1>Post History</h1>
                <div class="right-container-content">
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
                                    echo "<tr class='his-line'>";
                                    echo "<div id='his-overview-item'>"; 
                                    echo "<td id='his-line'><a class='margin-right' href='../page/code.php?id=" . $row['id'] . "'>" . $row["title"] . "</a></td>";
                                    echo "<td id='his-end'>" . $row["tags"] . "</td> ";
                                    echo "</div>";
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
        <div class="item5">
            <input type="submit" id="submit-public" name="submit-public" href="code.php" value="Create Public post">
                <div class="private-post-form">
            <input type="submit" id="submit-private" name="submit-private" value="Create Private post">
            <div class="configurations">
                <p class="config-email">Email:</p>
                <input type="email" id="email" name="email" placeholder="Needed to retrieve private post link!"> 
            </div>
        </div>
        </div>
        </form>
        </table>
        <!-- Footer -->
        <div class="item7">
            <?php include "../include/footer.php" ?>
        </div>
</body>
<script>
    var editor = CodeMirror.fromTextArea(document.getElementById("code"), {
        lineNumbers: true,
        mode: "htmlmixed",
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

    function selectMode() {
        var mode = modes[document.getElementById("mode").value];
        editor.setOption("mode", mode);
    }

    function updateCode() {
        document.getElementById("code").value = editor.getValue();
    }

    editor.on("change", function() {
        updateCode();
    });

    document.getElementById("mode").addEventListener("change", selectMode);
    selectMode();
</script>

</html>