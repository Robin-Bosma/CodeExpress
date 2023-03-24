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

// Check if the form was submitted
if (isset($_POST['title'])) {
    // Sanitize and validate the input
    $title = htmlspecialchars($_POST['title']);
    // Insert the new code into the database
    $stmt = $pdo->prepare("INSERT INTO configuration (title, code, category, description, date) VALUES (?, ?, ?, ?, NOW())");
    $stmt->execute([$title, $_POST['code'], $_POST['category'], $_POST['description']]);
    // Get the ID of the last inserted row
    $id = $pdo->lastInsertId();
} else {
    $id = ''; // If the form was not submitted, do not pre-fill the ID
}

?>


<!DOCTYPE html>
<html lang="en">

<head>
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
    <link rel="icon" href="../img/logo.png" type="image/x-icon" />
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
        return htmlspecialchars($code->code);
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
            <h1 class="config"><?php echo getTitle(); ?></h1>
            <div class="header-box">
                <h2 class="margin"><?php echo getCategory(); ?></h2>
                <h2 class="margin"><?php echo getDatum(); ?></h2>
                <button id="copy-btn" onclick="copyToClipboard()">Copy Code</button>
            </div>
            <form method="post" action="../page/index.php">
            <h1 class="config-code">Code:</h1>
            <textarea cols="80" rows="10" id="code" type="text" name="code" mode="text/html">
    <?php echo getCode(); ?>
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
            </form>
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

// Retrieve comments for this code snippet
$sql = "SELECT * FROM comments WHERE code_id = ?";
$stmt = $pdo->prepare($sql);
$stmt->execute([$id]);
$comments = $stmt->fetchAll(PDO::FETCH_OBJ);

// Insert new comment
if (isset($_POST['submit'])) {
    $comment_text = htmlspecialchars($_POST['comment_text']);
    $comment_date = date('Y-m-d H:i:s');
    $user_id = $_SESSION['user_id'];
    $stmt = $pdo->prepare("INSERT INTO comments (text, date, user_id, code_id) VALUES (?, ?, ?, ?)");
    $stmt->execute([$comment_text, $comment_date, $user_id, $id]);
    header("Refresh:0");
}
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