-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 24 mrt 2023 om 10:54
-- Serverversie: 10.4.27-MariaDB
-- PHP-versie: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `codeexpress`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `comment_text` longtext NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `problem_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `comments`
--

INSERT INTO `comments` (`id`, `comment_text`, `username`, `date_created`, `problem_id`) VALUES
(1, 'Werkt dit?', '1473', '2023-03-24 08:38:15', 1),
(2, 'Duplicate', '1665', '2023-03-24 08:39:03', 1),
(3, 'Duplicate', '9770', '2023-03-24 08:39:06', 1),
(4, 'test 2', '669', '2023-03-24 08:39:36', 2);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `configuration`
--

CREATE TABLE `configuration` (
  `id` int(11) NOT NULL,
  `code` longtext NOT NULL,
  `title` varchar(255) NOT NULL,
  `html` varchar(50) DEFAULT NULL,
  `css` varchar(50) DEFAULT NULL,
  `php` varchar(50) DEFAULT NULL,
  `javascript` varchar(50) DEFAULT NULL,
  `SQLcode` varchar(50) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `description` text DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `configuration`
--

INSERT INTO `configuration` (`id`, `code`, `title`, `html`, `css`, `php`, `javascript`, `SQLcode`, `date`, `description`, `creator`, `email`) VALUES
(1, '<!DOCTYPE html>\r\n<html lang=\"en\">\r\n\r\n<head>\r\n  <title>Code Express</title>\r\n  <link rel=\"icon\" href=\"../img/CodeExpress-logo.png\" type=\"image/x-icon\">\r\n</head>\r\n\r\n<body>\r\n<nav class=\"navbar\">\r\n  <div class=\"logo\">\r\n    <a href=\"../page/index.php\"><img src', 'Navbar', 'HTML', 'CSS', 'PHP', 'JavaScript', 'SQL', '2023-03-24', 'Navbar we used for CodeExpress', 'Scrum Team', 'infocodeexpress@gmail.com'),
(2, '<!DOCTYPE html>\r\n<html lang=\"en\">\r\n\r\n<head>\r\n    <meta charset=\"UTF-8\">\r\n    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n    <title>Code Express</title>\r\n</head>\r\n\r\n<bo', 'Footer', 'HTML', 'CSS', 'PHP', 'JavaScript', 'SQL', '2023-03-24', 'Footer we used for CodeExpress', 'Scrum Team', 'infocodeexpress@gmail.com'),
(41, '<?php\r\nsession_start();\r\ninclude \'../include/connection.php\';\r\n\r\nif (isset($_GET[\'id\'])) {\r\n    $id = intval($_GET[\'id\']);\r\n    $stmt = $pdo->prepare(\"SELECT title FROM configuration WHERE id = ?\");\r\n    $stmt->execute([$id]);\r\n    $row = $stmt->fetch(PDO::FETCH_ASSOC);\r\n    $title = $row[\'title\'];\r\n} else {\r\n    $title = \"CodeExpress\";\r\n}\r\n\r\n?>\r\n\r\n<!DOCTYPE html>\r\n<html lang=\"en\">\r\n\r\n<head>\r\n    <link rel=\"stylesheet\" href=\"https://codemirror.net/theme/dracula.css\">\r\n    <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.62.0/codemirror.min.css\" />\r\n    <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.62.0/theme/darcula.min.css\" />\r\n\r\n    <script src=\"https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.62.0/codemirror.min.js\"></script>\r\n    <script src=\"https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.62.0/mode/xml/xml.min.js\"></script>\r\n    <script src=\"https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.62.0/mode/javascript/javascript.min.js\"></script>\r\n    <script src=\"https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.62.0/mode/css/css.min.js\"></script>\r\n    <script src=\"https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.62.0/mode/htmlmixed/htmlmixed.min.js\"></script>\r\n    <script src=\"https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.62.0/mode/php/php.min.js\"></script>\r\n    <script src=\"https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.62.0/mode/sql/sql.min.js\"></script>\r\n\r\n    <link rel=\"icon\" href=\"../img/logo.png\" type=\"image/x-icon\" />\r\n    <style>\r\n        <?php include \'../style.css\'; ?>\r\n    </style>\r\n    <?php\r\n    $stmt = $pdo->prepare(\"SELECT * FROM configuration WHERE id = ?\");\r\n    $stmt->execute([$id]);\r\n\r\n    $code = $stmt->fetch(PDO::FETCH_OBJ);\r\n\r\n    function getTitle()\r\n    {\r\n        global $code;\r\n        return $code->title;\r\n    }\r\n\r\n    function getCategory()\r\n    {\r\n        global $code;\r\n        return $code->category;\r\n    }\r\n\r\n    function getDatum()\r\n    {\r\n        global $code;\r\n        return $code->date;\r\n    }\r\n\r\n    function getCode()\r\n    {\r\n        global $code;\r\n        return htmlspecialchars($code->code);\r\n    }\r\n\r\n    function getDescription()\r\n    {\r\n        global $code;\r\n        return $code->description;\r\n    }\r\n\r\n    if (isset($_POST[\'title\'])) {\r\n        $title = htmlspecialchars($_POST[\'title\']);\r\n    }\r\n    ?>\r\n    <title><?php echo $title ?> - CodeExpress</title>\r\n</head>\r\n\r\n<body>\r\n\r\n    <!-- Navbar -->\r\n    <?php include \"../include/navbar.php\" ?>\r\n\r\n    <!-- Main Content -->\r\n    <div class=\"code-container\">\r\n        <div class=\"left-container\">\r\n            <h1 class=\"config\"><?php echo getTitle(); ?></h1>\r\n            <div class=\"header-box\">\r\n                <h2 class=\"margin\"><?php echo getCategory(); ?></h2>\r\n                <h2 class=\"margin\"><?php echo getDatum(); ?></h2>\r\n                <button id=\"copy-btn\" onclick=\"copyToClipboard()\">Copy Code</button>\r\n            </div>\r\n            <form method=\"post\" action=\"../page/index.php\">\r\n                <h1 class=\"config-code\">Code:</h1>\r\n                <textarea cols=\"80\" rows=\"10\" id=\"code\" type=\"text\" name=\"code\" mode=\"text/html\">\r\n    <?php echo getCode(); ?>\r\n</textarea>\r\n                <script>\r\n                    var editor = CodeMirror.fromTextArea(document.getElementById(\"code\"), {\r\n                        lineNumbers: true,\r\n                        mode: \"htmlmixed\",\r\n                        theme: \"darcula\",\r\n                        readOnly: true\r\n                    });\r\n\r\n                    var modes = {\r\n                        \"HTML\": \"htmlmixed\",\r\n                        \"CSS\": \"css\",\r\n                        \"JavaScript\": \"javascript\",\r\n                        \"PHP\": \"php\",\r\n                        \"Python\": \"python\",\r\n                        \"Ruby\": \"ruby\",\r\n                        \"Java\": \"clike\",\r\n                        \"C++\": \"clike\",\r\n                        \"C\": \"clike\",\r\n                        \"SQL\": \"sql\"\r\n                    };\r\n\r\n                    var modeSelect = document.getElementById(\"mode-select\");\r\n\r\n                    for (var mode in modes) {\r\n                        var option = document.createElement(\"option\");\r\n                        option.setAttribute(\"value\", modes[mode]);\r\n                        option.innerHTML = mode;\r\n                        modeSelect.appendChild(option);\r\n                    }\r\n\r\n                    modeSelect.addEventListener(\"change\", function() {\r\n                        var mode = modeSelect.options[modeSelect.selectedIndex].value;\r\n                        editor.setOption(\"mode\", mode);\r\n                    });\r\n                </script>\r\n            </form>\r\n            <div>\r\n                <h1 class=\"config\">Comments</h1>\r\n                <form method=\"post\">\r\n                    <div class=\"flex-direction-column\">\r\n                        <input class=\"code-input\" type=\"text\" id=\"comment_text\" name=\"comment_text\" placeholder=\"Write your comment here\">\r\n                        <input class=\"code-button\" type=\"submit\" name=\"submit\" value=\"Add Comment\">\r\n                    </div>\r\n                    <?php\r\n                    // Connect to the SQL database\r\n                    $conn = mysqli_connect(\"localhost\", \"root\", \"\", \"codeexpress\");\r\n\r\n                    // Check connection\r\n                    if (!$conn) {\r\n                        die(\"Connection failed: \" . mysqli_connect_error());\r\n                    }\r\n\r\n                    // Check if the form has been submitted\r\n                    if (isset($_POST[\'submit\'])) {\r\n                        // Get the comment text\r\n                        $comment_text = $_POST[\'comment_text\'];\r\n                        // Generate a random username or leave it blank\r\n                        $username = rand(1, 9999);\r\n                        // Get the problem ID from the URL parameter\r\n                        $problem_id = $_GET[\'id\'];\r\n\r\n                        // Insert the comment into the SQL table\r\n                        $sql = \"INSERT INTO comments (comment_text, username, date_created, problem_id) VALUES (\'$comment_text\', \'$username\', NOW(), $problem_id)\";\r\n                        if (mysqli_query($conn, $sql)) {\r\n                        } else {\r\n                            echo \"Error: \" . $sql . \"<br>\" . mysqli_error($conn);\r\n                        }\r\n                    }\r\n\r\n                    // Retrieve the comments from the SQL table\r\n                    $problem_id = $_GET[\'id\'];\r\n                    $sql = \"SELECT * FROM comments WHERE problem_id = $problem_id\";\r\n                    $result = mysqli_query($conn, $sql);\r\n\r\n                    // Loop through the comments and display each one\r\n                    while ($row = mysqli_fetch_assoc($result)) {\r\n                        echo \"<p>Anonymous user \" . $row[\'username\'] . \" said: \" . $row[\'comment_text\'] . \" | on \" . date(\"F j, Y, g:i a\", strtotime($row[\'date_created\'])) . \"</p>\";\r\n                    }\r\n\r\n                    // Close the SQL connection\r\n                    mysqli_close($conn);\r\n                    ?>\r\n                </form>\r\n            </div>\r\n        </div>\r\n        <div class=\"right-container\">\r\n            <h1>Post History</h1>\r\n            <div class=\"right-container-content\">\r\n                <div class=\"line\">\r\n                    <div class=\"flex-direction-row-height\">\r\n                        <p class=\"margin-righter\">Title</p>\r\n                        <p>Category</p>\r\n                    </div>\r\n                </div>\r\n                <div class=\"table-container\">\r\n                    <table>\r\n                        <?php\r\n                        // Retrieve data from the configuration table\r\n                        $sql = \"SELECT * FROM configuration\";\r\n                        $result = $pdo->query($sql);\r\n\r\n                        if ($result->rowCount() > 0) {\r\n                            while ($row = $result->fetch()) {\r\n                                echo \"<tr>\";\r\n                                echo \"<td><a class=\'margin-right\' href=\'../page/code.php?id=\" . $row[\'id\'] . \"\'>\" . $row[\"title\"] . \"</a></td>\";\r\n                                echo \"<td>\" . $row[\"category\"] . \"</td>\";\r\n                                echo \"</tr>\";\r\n                            }\r\n                        } else {\r\n                            echo \"<tr><td colspan=\'2\'>No results found</td></tr>\";\r\n                        }\r\n                        ?>\r\n                    </table>\r\n                </div>\r\n            </div>\r\n        </div>\r\n    </div>\r\n\r\n\r\n    <!-- Footer -->\r\n    <?php include \"../include/footer.php\" ?>\r\n\r\n</body>\r\n\r\n<script>\r\n    // The function for copying code\r\n    function copyToClipboard() {\r\n        var codeDiv = document.getElementById(\"code\");\r\n        var codeText = codeDiv.innerText;\r\n        navigator.clipboard.writeText(codeText).then(function() {\r\n            alert(\"Code copied to clipboard!\");\r\n        }, function() {\r\n            alert(\"Failed to copy code to clipboard.\");\r\n        });\r\n    }\r\n</script>\r\n\r\n</html>', 'Code.php', 'HTML', 'CSS', 'PHP', 'JavaScript', 'SQL', '2023-03-24', 'sfsf', 'Me', 'sdssfdfWg@gmail.com');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `private_posts`
--

CREATE TABLE `private_posts` (
  `id` int(11) NOT NULL,
  `code` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `html` varchar(50) DEFAULT NULL,
  `css` varchar(50) DEFAULT NULL,
  `php` varchar(50) DEFAULT NULL,
  `javascript` varchar(50) DEFAULT NULL,
  `SQLcode` varchar(50) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `description` text DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `private_posts`
--

INSERT INTO `private_posts` (`id`, `code`, `title`, `html`, `css`, `php`, `javascript`, `SQLcode`, `date`, `description`, `creator`, `url`, `email`) VALUES
(1, 'Michel', 'Michel', 'HTML', 'CSS', 'PHP', 'JavaScript', 'SQL', '2023-03-21', 'Michek', 'Michel', '9c51e1c618c08d30', NULL),
(2, 'Testetr', 'testerete', 'HTML', 'CSS', 'PHP', 'JavaScript', 'SQL', '2023-03-21', 'testetet', 'testetet', '9b9c5eaeae4ab426', NULL),
(3, 'rea', 'ewe', 'HTML', 'CSS', 'PHP', 'JavaScript', 'SQL', '2023-03-21', 'qwqweqweqw', 'we', '59801efe0959d34e', NULL),
(4, 'Testerereqweqwe', 'qweqeqwe', 'HTML', 'CSS', 'PHP', 'JavaScript', 'SQL', '2023-03-22', 'qwwwqw', 'qweqwe', 'd7b264337833070a', NULL),
(5, 'rttrtr', 'trtr', 'HTML', 'CSS', 'PHP', 'JavaScript', 'SQL', '2023-03-22', 'trtr', 'trtr', 'd62decd4c4308569', NULL),
(6, 'qqerqwehheth', 'tetetheth', '0', '0', '0', '0', '0', '2023-03-22', 'hehethe', 'etetheth', '4c254a826cea5053', NULL),
(7, 'qqerqwehheth', 'tetetheth', '0', '0', '0', '0', '0', '2023-03-22', 'hehethe', 'etetheth', '57203cd52d1260f5', NULL),
(8, 'qqerqwehheth', 'tetetheth', 'false', 'false', 'false', 'false', 'false', '2023-03-22', 'hehethe', 'etetheth', '83c01d20e0c8fd8b', NULL),
(9, 'qqerqwehheth', 'tetetheth', 'false', 'false', 'false', 'false', 'false', '2023-03-22', 'hehethe', 'etetheth', '67f94cee1d850b3e', NULL),
(10, '<?php\r\n\r\ninclude \"connection.php\";\r\n\r\n// Define an array to store the true/false values for each category\r\n$category_values = array(\r\n  \'HTML\' => isset($_POST[\"category\"][\"HTML\"]),\r\n  \'CSS\' => isset($_POST[\"category\"][\"CSS\"]),\r\n  \'PHP\' => isset($_POST[\"ca', 'Test', 'HTML', 'CSS', 'PHP', 'JavaScript', 'SQL', '2023-03-23', 'Test', 'Test', 'f4d5e84b8573aca1', NULL),
(11, 'Could you help me make a system that sends an email to the person that created a private post with the private url in it?\r\n\r\nThis is my index.php\r\n<?php\r\nsession_start();\r\ninclude \"../include/connection.php\";\r\ninclude \"../include/insert-post.php\";\r\n?>\r\n\r\n', 'test', 'HTML', 'CSS', 'PHP', 'JavaScript', 'SQL', '2023-03-24', 'tq', 'test', '7c7d527b648bf317', 'tq'),
(12, 'Tester123', 'test', 'HTML', 'CSS', 'PHP', 'JavaScript', 'SQL', '2023-03-24', 'tester', 'test', '0682191d00b67bd7', 'tester'),
(13, '\r\n<?php\r\nsession_start();\r\ninclude \"../include/connection.php\";\r\ninclude \"../include/insert-post.php\";\r\n?>\r\n\r\n<!DOCTYPE html>\r\n<html>\r\n\r\n<head>\r\n    <title>Code Express</title>\r\n    <link rel=\"icon\" href=\"../img/logo.png\" type=\"image/x-icon\" />\r\n\r\n    <!-', 'qwe', 'HTML', 'CSS', 'PHP', 'JavaScript', 'SQL', '2023-03-24', 'qwe', 'qwe', '145f8ef4e9d04092', 'Te12st@gmail.com'),
(14, '$headers .= \"Reply-To: noreply@example.com\\r\\n\";\r\n', 'Test-email', 'HTML', 'CSS', 'PHP', 'JavaScript', 'SQL', '2023-03-24', 'Test-email', 'Roger', '81033328b4013660', '152245@jamail.nl'),
(15, '$headers .= \"Reply-To: noreply@example.com\\r\\n\";\r\n', 'Test-email', 'HTML', 'CSS', 'PHP', 'JavaScript', 'SQL', '2023-03-24', 'Test-email', 'Roger', '83cdb107d2d872cb', '152245@jamail.nl'),
(16, '$headers .= \"Reply-To: noreply@example.com\\r\\n\";\r\n', 'Test-email', 'HTML', 'CSS', 'PHP', 'JavaScript', 'SQL', '2023-03-24', 'Test-email', 'Roger', '9fb86acd4b5cb0a4', '152245@jamail.nl'),
(17, '$headers .= \"Reply-To: noreply@example.com\\r\\n\";\r\n', 'Test-email', 'HTML', 'CSS', 'PHP', 'JavaScript', 'SQL', '2023-03-24', 'Test-email', 'Roger', 'd14c309267733827', '152245@jamail.nl'),
(18, '$headers .= \"Reply-To: noreply@example.com\\r\\n\";\r\n', 'Test-email', 'HTML', 'CSS', 'PHP', 'JavaScript', 'SQL', '2023-03-24', 'Test-email', 'Roger', 'cba74eba31974330', '152245@jamail.nl'),
(19, '$headers .= \"Reply-To: noreply@example.com\\r\\n\";\r\n', 'Test-email', 'HTML', 'CSS', 'PHP', 'JavaScript', 'SQL', '2023-03-24', 'Test-email', 'Roger', 'fbc2e534684c75fa', '152245@jamail.nl'),
(20, '$headers .= \"Reply-To: noreply@example.com\\r\\n\";\r\n', 'Test-email', 'HTML', 'CSS', 'PHP', 'JavaScript', 'SQL', '2023-03-24', 'Test-email', 'Roger', '31d49bbbe1b85c66', '152245@jamail.nl'),
(21, '$headers .= \"Reply-To: noreply@example.com\\r\\n\";\r\n', 'Test-email', 'HTML', 'CSS', 'PHP', 'JavaScript', 'SQL', '2023-03-24', 'Test-email', 'Roger', 'ac464ac5d033abf9', '152245@jamail.nl'),
(22, '$headers .= \"Reply-To: noreply@example.com\\r\\n\";\r\n', 'Test-email', 'HTML', 'CSS', 'PHP', 'JavaScript', 'SQL', '2023-03-24', 'Test-email', 'Roger', '8bba174a0b9c38dc', '152245@jamail.nl'),
(23, '$headers .= \"Reply-To: noreply@example.com\\r\\n\";\r\n', 'Test-email', 'HTML', 'CSS', 'PHP', 'JavaScript', 'SQL', '2023-03-24', 'Test-email', 'Roger', '9672c48725cd9b96', '152245@jamail.nl'),
(24, '$headers .= \"Reply-To: noreply@example.com\\r\\n\";\r\n', 'Test-email', 'HTML', 'CSS', 'PHP', 'JavaScript', 'SQL', '2023-03-24', 'Test-email', 'Roger', '28ace0919ab86add', '152245@jamail.nl'),
(25, '$headers .= \"Reply-To: noreply@example.com\\r\\n\";\r\n', 'Test-email', 'HTML', 'CSS', 'PHP', 'JavaScript', 'SQL', '2023-03-24', 'Test-email', 'Roger', 'aeda64040a55275c', '152245@jamail.nl'),
(26, '$headers .= \"Reply-To: noreply@example.com\\r\\n\";\r\n', 'Test-email', 'HTML', 'CSS', 'PHP', 'JavaScript', 'SQL', '2023-03-24', 'Test-email', 'Roger', '02485abb0241d7da', '152245@jamail.nl'),
(27, '$headers .= \"Reply-To: noreply@example.com\\r\\n\";\r\n', 'Test-email', 'HTML', 'CSS', 'PHP', 'JavaScript', 'SQL', '2023-03-24', 'Test-email', 'Roger', '9a9a9b8ca0ef7936', '152245@jamail.nl'),
(28, '$headers .= \"Reply-To: noreply@example.com\\r\\n\";\r\n', 'Test-email', 'HTML', 'CSS', 'PHP', 'JavaScript', 'SQL', '2023-03-24', 'Test-email', 'Roger', '9685a360ffcc52fa', '152245@jamail.nl'),
(29, '$headers .= \"Reply-To: noreply@example.com\\r\\n\";\r\n', 'Test-email', 'HTML', 'CSS', 'PHP', 'JavaScript', 'SQL', '2023-03-24', 'Test-email', 'Roger', '267b430c1141d8ea', '152245@jamail.nl'),
(30, '$headers .= \"Reply-To: noreply@example.com\\r\\n\";\r\n', 'Test-email', 'HTML', 'CSS', 'PHP', 'JavaScript', 'SQL', '2023-03-24', 'Test-email', 'Roger', '5131b813e7d2304d', '152245@jamail.nl'),
(31, '$headers .= \"Reply-To: noreply@example.com\\r\\n\";\r\n', 'Test-email', 'HTML', 'CSS', 'PHP', 'JavaScript', 'SQL', '2023-03-24', 'Test-email', 'Roger', '432fc10bf8d5f16a', '152245@jamail.nl'),
(32, '$headers .= \"Reply-To: noreply@example.com\\r\\n\";\r\n', 'Test-email', 'HTML', 'CSS', 'PHP', 'JavaScript', 'SQL', '2023-03-24', 'Test-email', 'Roger', 'ca0370056628e6b0', '152245@jamail.nl'),
(33, '$headers .= \"Reply-To: noreply@example.com\\r\\n\";\r\n', 'Test-email', 'HTML', 'CSS', 'PHP', 'JavaScript', 'SQL', '2023-03-24', 'Test-email', 'Roger', '5194334e636d0871', '152245@jamail.nl'),
(34, '$headers .= \"Reply-To: noreply@example.com\\r\\n\";\r\n', 'Test-email', 'HTML', 'CSS', 'PHP', 'JavaScript', 'SQL', '2023-03-24', 'Test-email', 'Roger', '863c01cbb44c935e', '152245@jamail.nl'),
(35, '$headers .= \"Reply-To: noreply@example.com\\r\\n\";\r\n', 'Test-email', 'HTML', 'CSS', 'PHP', 'JavaScript', 'SQL', '2023-03-24', 'Test-email', 'Roger', 'c0d0ba9103febfe7', '152245@jamail.nl'),
(36, '$headers .= \"Reply-To: noreply@example.com\\r\\n\";\r\n', 'Test-email', 'HTML', 'CSS', 'PHP', 'JavaScript', 'SQL', '2023-03-24', 'Test-email', 'Roger', '895b9e5563003b2d', '152245@jamail.nl'),
(37, '$headers .= \"Reply-To: noreply@example.com\\r\\n\";\r\n', 'Test-email', 'HTML', 'CSS', 'PHP', 'JavaScript', 'SQL', '2023-03-24', 'Test-email', 'Roger', 'd7adeb2be0ab4ffd', '152245@jamail.nl'),
(38, '$headers .= \"Reply-To: noreply@example.com\\r\\n\";\r\n', 'Test-email', 'HTML', 'CSS', 'PHP', 'JavaScript', 'SQL', '2023-03-24', 'Test-email', 'Roger', '33aecfc8d0bd654d', '152245@jamail.nl'),
(39, 'testercode', 'testemail', 'HTML', 'CSS', 'PHP', 'JavaScript', 'SQL', '2023-03-24', 'tester', 'Roger', 'd1d4c69e03e529a5', '152245@jamail.nl'),
(40, 'testercode', 'testemail', 'HTML', 'CSS', 'PHP', 'JavaScript', 'SQL', '2023-03-24', 'tester', 'Roger', '18037679710fb63c', '152245@jamail.nl'),
(41, 'testercode', 'testemail', 'HTML', 'CSS', 'PHP', 'JavaScript', 'SQL', '2023-03-24', 'tester', 'Roger', 'faef0d8ac5956794', '152245@jamail.nl'),
(42, 'testercode', 'testemail', 'HTML', 'CSS', 'PHP', 'JavaScript', 'SQL', '2023-03-24', 'tester', 'Roger', '3733ea4addb9661b', '152245@jamail.nl'),
(43, 'testercode', 'testemail', 'HTML', 'CSS', 'PHP', 'JavaScript', 'SQL', '2023-03-24', 'tester', 'Roger', '019934b342052431', '152245@jamail.nl'),
(44, 'testercode', 'testemail', 'HTML', 'CSS', 'PHP', 'JavaScript', 'SQL', '2023-03-24', 'tester', 'Roger', 'd26f6c2693ce6e08', '152245@jamail.nl'),
(45, 'testercode', 'testemail', 'HTML', 'CSS', 'PHP', 'JavaScript', 'SQL', '2023-03-24', 'tester', 'Roger', '0e35a1caf5b61b50', '152245@jamail.nl'),
(46, 'testercode', 'testemail', 'HTML', 'CSS', 'PHP', 'JavaScript', 'SQL', '2023-03-24', 'tester', 'Roger', '8944b3d5c5bd0f0a', '152245@jamail.nl'),
(47, 'testercode', 'testemail', 'HTML', 'CSS', 'PHP', 'JavaScript', 'SQL', '2023-03-24', 'tester', 'Roger', 'bb6662a7d23a4cd0', '152245@jamail.nl'),
(48, 'testercode', 'testemail', 'HTML', 'CSS', 'PHP', 'JavaScript', 'SQL', '2023-03-24', 'tester', 'Roger', '58a9a5434bb21272', '152245@jamail.nl'),
(49, 'testercode', 'testemail', 'HTML', 'CSS', 'PHP', 'JavaScript', 'SQL', '2023-03-24', 'tester', 'Roger', '8fb1308b1774f888', '152245@jamail.nl'),
(50, 'testercode', 'testemail', 'HTML', 'CSS', 'PHP', 'JavaScript', 'SQL', '2023-03-24', 'tester', 'Roger', '295c22a4519d9064', '152245@jamail.nl'),
(51, 'testercode', 'testemail', 'HTML', 'CSS', 'PHP', 'JavaScript', 'SQL', '2023-03-24', 'tester', 'Roger', 'e09720f5c3ad6549', '152245@jamail.nl'),
(52, 'testercode', 'testemail', 'HTML', 'CSS', 'PHP', 'JavaScript', 'SQL', '2023-03-24', 'tester', 'Roger', '5005d3aac25dc3e9', '152245@jamail.nl'),
(53, 'testercode', 'testemail', 'HTML', 'CSS', 'PHP', 'JavaScript', 'SQL', '2023-03-24', 'tester', 'Roger', 'cfc0d42a891eeec8', '152245@jamail.nl'),
(54, 'testeter1', 'rqwr', 'HTML', 'CSS', 'PHP', 'JavaScript', 'SQL', '2023-03-24', '1', 'Roger', '87fa9fad8a2edeaf', '152245@jamail.nl'),
(55, 'qe', 'rqwrqwe', 'HTML', 'CSS', 'PHP', 'JavaScript', 'SQL', '2023-03-24', '1qwe', 'Rogerqwe', '1fa8dd010930d5fe', '152245@jamail.nl'),
(56, 'efnivqsbasbvklanm,.b nasd;lvB BVANKV', 'EMAIL-TEST', 'HTML', 'CSS', 'PHP', 'JavaScript', 'SQL', '2023-03-24', 'qrqrqfadfqeef', 'testerenjoyer', '4b5be442a63dba78', 'test@gmail.com');

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `problem_id` (`problem_id`);

--
-- Indexen voor tabel `configuration`
--
ALTER TABLE `configuration`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `private_posts`
--
ALTER TABLE `private_posts`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT voor een tabel `configuration`
--
ALTER TABLE `configuration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT voor een tabel `private_posts`
--
ALTER TABLE `private_posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
