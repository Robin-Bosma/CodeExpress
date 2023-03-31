-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 31 mrt 2023 om 11:29
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
(5, 'Wow', '4740', '2023-03-31 11:28:55', 42),
(6, 'Amazing', '2779', '2023-03-31 11:28:57', 42),
(7, 'Love it', '4691', '2023-03-31 11:29:01', 42),
(8, 'Is that a Footer?', '9775', '2023-03-31 11:29:09', 43),
(9, 'What the freak, insane', '9551', '2023-03-31 11:29:15', 43),
(10, 'wow amazing', '1601', '2023-03-31 11:29:17', 43),
(11, 'love it', '6264', '2023-03-31 11:29:24', 44),
(12, 'ill steal it :)', '2483', '2023-03-31 11:29:28', 44),
(13, ':O', '9096', '2023-03-31 11:29:31', 44),
(14, 'Give me', '3658', '2023-03-31 11:29:34', 44);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `configuration`
--

CREATE TABLE `configuration` (
  `id` int(11) NOT NULL,
  `code` longtext NOT NULL,
  `title` varchar(255) NOT NULL,
  `date` date DEFAULT NULL,
  `description` text DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `configuration`
--

INSERT INTO `configuration` (`id`, `code`, `title`, `date`, `description`, `creator`, `email`, `tags`) VALUES
(42, '<!DOCTYPE html>\r\n<html lang=\"en\">\r\n\r\n<head>\r\n  <title>Code Express</title>\r\n  <link rel=\"icon\" href=\"../img/CodeExpress-logo.png\" type=\"image/x-icon\">\r\n</head>\r\n\r\n<body>\r\n<nav class=\"navbar\">\r\n  <div class=\"logo\">\r\n    <a href=\"../page/index.php\"><img src=\"../img/CodeExpress-logo-text.png\" alt=\"Logo\"></a>\r\n  </div>\r\n  <ul class=\"navbar-all-code-links\">\r\n    <li><a href=\"../page/index.php\">Home</a></li>\r\n    <li>\r\n    <div>ㅤ</div>\r\n    </li>\r\n    <li>\r\n      <div class=\"separator\">|</div>\r\n    </li>\r\n    <li>\r\n    <div>ㅤ</div>\r\n    </li>\r\n    <li><a href=\"../page/overview.php\">Overview</a></li>\r\n    <li>\r\n    <div>ㅤ</div>\r\n    </li>\r\n    <li>\r\n      <div class=\"separator\">|</div>\r\n    </li>\r\n    <li>\r\n    <div>ㅤ</div>\r\n    </li>\r\n    <li><a href=\"mailto:infocodeexpress@gmail.com\">Contact</a></li>\r\n  </ul>\r\n\r\n  <form action=\"../page/overview.php\" method=\"get\">\r\n    <div class=\"search-bar\">\r\n      <input id=\"search-input\" type=\"text\" name=\"q\" placeholder=\"What are you looking for?\" value=\"<?php echo isset($_GET[\'q\']) ? htmlspecialchars($_GET[\'q\']) : \'\' ?>\">\r\n      <img src=\"../img/spyglass.png\" alt=\"spyglass\"></button>\r\n    </div>\r\n  </form>\r\n</nav>\r\n\r\n</body>\r\n\r\n</html>', 'Navbar', '2023-03-31', 'The Navbar for CodeExpress', 'Scrum Team', 'infocodeexpress@gmail.com', 'HTML, SQL, JavaScript'),
(43, '<!DOCTYPE html>\r\n<html lang=\"en\">\r\n\r\n<head>\r\n    <meta charset=\"UTF-8\">\r\n    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n    <title>Code Express</title>\r\n</head>\r\n\r\n<body>\r\n    <Footer>\r\n        <h1 class=\"footer-text\">Code</h1>\r\n        <div id=\"footer-codes\">\r\n            <a id=\"footer-html\" href=\"../page/index.php\">Home</a> | <a id=\"footer-html\" href=\"../page/overview.php\">Overview</a> | <a id=\"footer-html\" href=\"mailto:infocodeexpress@gmail.com\">Contact</a>\r\n        </div>\r\n        <div id=\"train-container\">\r\n            <img id=\"train\" src=\"../img/trainBG.png\" alt=\"train\">\r\n        </div>\r\n        <div>\r\n            <a id=\"footer-copyright\" href=\"../page/index.php\">Copyright &copy;2023 - 2024 All rights reserved | Code Express</a>\r\n        </div>\r\n    </Footer>\r\n</body>\r\n\r\n</html>', 'Footer', '2023-03-31', 'The Footer for CodeExpress', 'Scrum Team', 'infocodeexpress@gmail.com', 'HTML, SQL, JavaScript'),
(44, '<?php\r\nsession_start();\r\ninclude \"../include/connection.php\";\r\nrequire_once \"../include/insert-post.php\";\r\n?>\r\n\r\n<!DOCTYPE html>\r\n<html>\r\n\r\n<head>\r\n    <title>Code Express</title>\r\n    <link rel=\"icon\" href=\"../img/logo.png\" type=\"image/x-icon\" />\r\n\r\n    <!-- Include CodeMirror Stylesheet -->\r\n    <link rel=\"stylesheet\" href=\"https://codemirror.net/theme/dracula.css\">\r\n    <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.62.0/codemirror.min.css\" />\r\n    <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.62.0/theme/darcula.min.css\" />\r\n\r\n    <script src=\"https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.62.0/codemirror.min.js\"></script>\r\n    <script src=\"https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.62.0/mode/xml/xml.min.js\"></script>\r\n    <script src=\"https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.62.0/mode/javascript/javascript.min.js\"></script>\r\n    <script src=\"https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.62.0/mode/css/css.min.js\"></script>\r\n    <script src=\"https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.62.0/mode/htmlmixed/htmlmixed.min.js\"></script>\r\n    <script src=\"https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.62.0/mode/php/php.min.js\"></script>\r\n    <script src=\"https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.62.0/mode/sql/sql.min.js\"></script>\r\n\r\n    <!-- Include Your Custom Stylesheet -->\r\n    <style>\r\n        <?php include \'../style.css\'; ?>\r\n    </style>\r\n</head>\r\n\r\n<body>\r\n    <!-- Navbar -->\r\n    <div class=\"item\">\r\n        <?php include \"../include/navbar.php\" ?>\r\n    </div>\r\n    <div class=\"grid-container\">\r\n        <div class=\"item1\">\r\n            <form method=\"post\" action=\"../page/index.php\">\r\n                <h1 class=\"config-code\">Code:</h1>\r\n\r\n                <!-- Add the Textarea Element for Code -->\r\n                <textarea cols=\"80\" rows=\"10\" id=\"code\" type=\"text\" name=\"code\" mode=\"text/html\"></textarea>\r\n                <!-- Initialize CodeMirror on the Textarea Element with Multiple Modes -->\r\n                <h1 class=\"config\">Configurations</h1>\r\n        </div>\r\n        <!-- configuration -->\r\n        <div class=\"item2\">\r\n            <div class=\"configurations\">\r\n                <p class=\"config-title\">Title:</p>\r\n                <input type=\"text\" id=\"title\" name=\"title\" placeholder=\"Title\" required>\r\n            </div>\r\n            <div class=\"configurations\">\r\n                <p class=\"config-created\">Created by:</p>\r\n                <input type=\"text\" id=\"created\" name=\"creator\" placeholder=\"Who made this code?\" required>  \r\n            </div>\r\n            <div class=\"configurations\">\r\n                <p class=\"config-tags\">Tags:</p>\r\n                <input type=\"tags\" id=\"tags\" name=\"tags\" placeholder=\"For example: HTML, CSS\" required>\r\n            </div>\r\n        </div>\r\n        <div class=\"item3-text\">\r\n            <h1 class=\"config-desc\">Description:</h1>\r\n        </div>\r\n        <div class=\"item3\">\r\n            <textarea cols=\"80\" rows=\"10\" id=\"desc\" type=\"text\" name=\"description\" placeholder=\"Give a small description about you code.. What Language does your code use? What is your code about?\"></textarea>\r\n        </div>\r\n        <div class=\"item4\">\r\n            <div class=\"right-container\">\r\n                <h1>Post History</h1>\r\n                <div class=\"right-container-content\">\r\n                    <div class=\"line\">\r\n                        <div class=\"flex-direction-row-height\">\r\n                            <p class=\"his-margin-righter\">Title</p>\r\n                            <p>Tags</p>\r\n                        </div>\r\n                    </div>\r\n                    <div class=\"table-container\">\r\n                        <table>\r\n                            <?php\r\n                            // Retrieve data from the configuration table\r\n                            $sql = \"SELECT * FROM configuration\";\r\n                            $result = $pdo->query($sql);\r\n\r\n                            if ($result->rowCount() > 0) {\r\n                                while ($row = $result->fetch()) {\r\n                                    echo \"<tr class=\'his-line\'>\";\r\n                                    echo \"<div id=\'his-overview-item\'>\"; \r\n                                    echo \"<td id=\'his-line\'><a class=\'margin-right\' href=\'../page/code.php?id=\" . $row[\'id\'] . \"\'>\" . $row[\"title\"] . \"</a></td>\";\r\n                                    echo \"<td id=\'his-end\'>\" . $row[\"tags\"] . \"</td> \";\r\n                                    echo \"</div>\";\r\n                                }\r\n                            } else {\r\n                                echo \"<tr><td colspan=\'2\'>No results found</td></tr>\";\r\n                            }\r\n                            ?>\r\n                        </table>\r\n                    </div>\r\n                </div>\r\n            </div>\r\n        </div>\r\n        <div class=\"item5\">\r\n            <input type=\"submit\" id=\"submit-public\" name=\"submit-public\" href=\"code.php\" value=\"Create Public post\">\r\n                <div class=\"private-post-form\">\r\n            <input type=\"submit\" id=\"submit-private\" name=\"submit-private\" value=\"Create Private post\">\r\n            <div class=\"configurations\">\r\n                <p class=\"config-email\">Email:</p>\r\n                <input type=\"email\" id=\"email\" name=\"email\" placeholder=\"Needed to retrieve private post like!\"> \r\n            </div>\r\n        </div>\r\n        </div>\r\n        </form>\r\n        </table>\r\n        <!-- Footer -->\r\n        <div class=\"item7\">\r\n            <?php include \"../include/footer.php\" ?>\r\n        </div>\r\n</body>\r\n<script>\r\n    var editor = CodeMirror.fromTextArea(document.getElementById(\"code\"), {\r\n        lineNumbers: true,\r\n        mode: \"htmlmixed\",\r\n    });\r\n\r\n    var modes = {\r\n        \"HTML\": \"htmlmixed\",\r\n        \"CSS\": \"css\",\r\n        \"JavaScript\": \"javascript\",\r\n        \"PHP\": \"php\",\r\n        \"Python\": \"python\",\r\n        \"Ruby\": \"ruby\",\r\n        \"Java\": \"clike\",\r\n        \"C++\": \"clike\",\r\n        \"C\": \"clike\",\r\n        \"SQL\": \"sql\"\r\n    };\r\n\r\n    function selectMode() {\r\n        var mode = modes[document.getElementById(\"mode\").value];\r\n        editor.setOption(\"mode\", mode);\r\n    }\r\n\r\n    function updateCode() {\r\n        document.getElementById(\"code\").value = editor.getValue();\r\n    }\r\n\r\n    editor.on(\"change\", function() {\r\n        updateCode();\r\n    });\r\n\r\n    document.getElementById(\"mode\").addEventListener(\"change\", selectMode);\r\n    selectMode();\r\n</script>\r\n\r\n</html>', 'Index page', '2023-03-31', 'The amazing index page for this website', 'Scrum Team', 'infocodeexpress@gmail.com', 'HTML, SQL, JavaScript');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `private_posts`
--

CREATE TABLE `private_posts` (
  `id` int(11) NOT NULL,
  `code` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `date` date DEFAULT NULL,
  `description` text DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `private_posts`
--

INSERT INTO `private_posts` (`id`, `code`, `title`, `date`, `description`, `creator`, `url`, `email`, `tags`) VALUES
(1, 'Michel', 'Michel', '2023-03-21', 'Michek', 'Michel', '9c51e1c618c08d30', NULL, NULL),
(2, 'Testetr', 'testerete', '2023-03-21', 'testetet', 'testetet', '9b9c5eaeae4ab426', NULL, NULL),
(3, 'rea', 'ewe', '2023-03-21', 'qwqweqweqw', 'we', '59801efe0959d34e', NULL, NULL),
(4, 'Testerereqweqwe', 'qweqeqwe', '2023-03-22', 'qwwwqw', 'qweqwe', 'd7b264337833070a', NULL, NULL),
(5, 'rttrtr', 'trtr', '2023-03-22', 'trtr', 'trtr', 'd62decd4c4308569', NULL, NULL),
(6, 'qqerqwehheth', 'tetetheth', '2023-03-22', 'hehethe', 'etetheth', '4c254a826cea5053', NULL, NULL),
(7, 'qqerqwehheth', 'tetetheth', '2023-03-22', 'hehethe', 'etetheth', '57203cd52d1260f5', NULL, NULL),
(8, 'qqerqwehheth', 'tetetheth', '2023-03-22', 'hehethe', 'etetheth', '83c01d20e0c8fd8b', NULL, NULL),
(9, 'qqerqwehheth', 'tetetheth', '2023-03-22', 'hehethe', 'etetheth', '67f94cee1d850b3e', NULL, NULL),
(10, '<?php\r\n\r\ninclude \"connection.php\";\r\n\r\n// Define an array to store the true/false values for each category\r\n$category_values = array(\r\n  \'HTML\' => isset($_POST[\"category\"][\"HTML\"]),\r\n  \'CSS\' => isset($_POST[\"category\"][\"CSS\"]),\r\n  \'PHP\' => isset($_POST[\"ca', 'Test', '2023-03-23', 'Test', 'Test', 'f4d5e84b8573aca1', NULL, NULL),
(11, 'Could you help me make a system that sends an email to the person that created a private post with the private url in it?\r\n\r\nThis is my index.php\r\n<?php\r\nsession_start();\r\ninclude \"../include/connection.php\";\r\ninclude \"../include/insert-post.php\";\r\n?>\r\n\r\n', 'test', '2023-03-24', 'tq', 'test', '7c7d527b648bf317', 'tq', NULL),
(12, 'Tester123', 'test', '2023-03-24', 'tester', 'test', '0682191d00b67bd7', 'tester', NULL),
(13, '\r\n<?php\r\nsession_start();\r\ninclude \"../include/connection.php\";\r\ninclude \"../include/insert-post.php\";\r\n?>\r\n\r\n<!DOCTYPE html>\r\n<html>\r\n\r\n<head>\r\n    <title>Code Express</title>\r\n    <link rel=\"icon\" href=\"../img/logo.png\" type=\"image/x-icon\" />\r\n\r\n    <!-', 'qwe', '2023-03-24', 'qwe', 'qwe', '145f8ef4e9d04092', 'Te12st@gmail.com', NULL),
(14, '$headers .= \"Reply-To: noreply@example.com\\r\\n\";\r\n', 'Test-email', '2023-03-24', 'Test-email', 'Roger', '81033328b4013660', '152245@jamail.nl', NULL),
(15, '$headers .= \"Reply-To: noreply@example.com\\r\\n\";\r\n', 'Test-email', '2023-03-24', 'Test-email', 'Roger', '83cdb107d2d872cb', '152245@jamail.nl', NULL),
(16, '$headers .= \"Reply-To: noreply@example.com\\r\\n\";\r\n', 'Test-email', '2023-03-24', 'Test-email', 'Roger', '9fb86acd4b5cb0a4', '152245@jamail.nl', NULL),
(17, '$headers .= \"Reply-To: noreply@example.com\\r\\n\";\r\n', 'Test-email', '2023-03-24', 'Test-email', 'Roger', 'd14c309267733827', '152245@jamail.nl', NULL),
(18, '$headers .= \"Reply-To: noreply@example.com\\r\\n\";\r\n', 'Test-email', '2023-03-24', 'Test-email', 'Roger', 'cba74eba31974330', '152245@jamail.nl', NULL),
(19, '$headers .= \"Reply-To: noreply@example.com\\r\\n\";\r\n', 'Test-email', '2023-03-24', 'Test-email', 'Roger', 'fbc2e534684c75fa', '152245@jamail.nl', NULL),
(20, '$headers .= \"Reply-To: noreply@example.com\\r\\n\";\r\n', 'Test-email', '2023-03-24', 'Test-email', 'Roger', '31d49bbbe1b85c66', '152245@jamail.nl', NULL),
(21, '$headers .= \"Reply-To: noreply@example.com\\r\\n\";\r\n', 'Test-email', '2023-03-24', 'Test-email', 'Roger', 'ac464ac5d033abf9', '152245@jamail.nl', NULL),
(22, '$headers .= \"Reply-To: noreply@example.com\\r\\n\";\r\n', 'Test-email', '2023-03-24', 'Test-email', 'Roger', '8bba174a0b9c38dc', '152245@jamail.nl', NULL),
(23, '$headers .= \"Reply-To: noreply@example.com\\r\\n\";\r\n', 'Test-email', '2023-03-24', 'Test-email', 'Roger', '9672c48725cd9b96', '152245@jamail.nl', NULL),
(24, '$headers .= \"Reply-To: noreply@example.com\\r\\n\";\r\n', 'Test-email', '2023-03-24', 'Test-email', 'Roger', '28ace0919ab86add', '152245@jamail.nl', NULL),
(25, '$headers .= \"Reply-To: noreply@example.com\\r\\n\";\r\n', 'Test-email', '2023-03-24', 'Test-email', 'Roger', 'aeda64040a55275c', '152245@jamail.nl', NULL),
(26, '$headers .= \"Reply-To: noreply@example.com\\r\\n\";\r\n', 'Test-email', '2023-03-24', 'Test-email', 'Roger', '02485abb0241d7da', '152245@jamail.nl', NULL),
(27, '$headers .= \"Reply-To: noreply@example.com\\r\\n\";\r\n', 'Test-email', '2023-03-24', 'Test-email', 'Roger', '9a9a9b8ca0ef7936', '152245@jamail.nl', NULL),
(28, '$headers .= \"Reply-To: noreply@example.com\\r\\n\";\r\n', 'Test-email', '2023-03-24', 'Test-email', 'Roger', '9685a360ffcc52fa', '152245@jamail.nl', NULL),
(29, '$headers .= \"Reply-To: noreply@example.com\\r\\n\";\r\n', 'Test-email', '2023-03-24', 'Test-email', 'Roger', '267b430c1141d8ea', '152245@jamail.nl', NULL),
(30, '$headers .= \"Reply-To: noreply@example.com\\r\\n\";\r\n', 'Test-email', '2023-03-24', 'Test-email', 'Roger', '5131b813e7d2304d', '152245@jamail.nl', NULL),
(31, '$headers .= \"Reply-To: noreply@example.com\\r\\n\";\r\n', 'Test-email', '2023-03-24', 'Test-email', 'Roger', '432fc10bf8d5f16a', '152245@jamail.nl', NULL),
(32, '$headers .= \"Reply-To: noreply@example.com\\r\\n\";\r\n', 'Test-email', '2023-03-24', 'Test-email', 'Roger', 'ca0370056628e6b0', '152245@jamail.nl', NULL),
(33, '$headers .= \"Reply-To: noreply@example.com\\r\\n\";\r\n', 'Test-email', '2023-03-24', 'Test-email', 'Roger', '5194334e636d0871', '152245@jamail.nl', NULL),
(34, '$headers .= \"Reply-To: noreply@example.com\\r\\n\";\r\n', 'Test-email', '2023-03-24', 'Test-email', 'Roger', '863c01cbb44c935e', '152245@jamail.nl', NULL),
(35, '$headers .= \"Reply-To: noreply@example.com\\r\\n\";\r\n', 'Test-email', '2023-03-24', 'Test-email', 'Roger', 'c0d0ba9103febfe7', '152245@jamail.nl', NULL),
(36, '$headers .= \"Reply-To: noreply@example.com\\r\\n\";\r\n', 'Test-email', '2023-03-24', 'Test-email', 'Roger', '895b9e5563003b2d', '152245@jamail.nl', NULL),
(37, '$headers .= \"Reply-To: noreply@example.com\\r\\n\";\r\n', 'Test-email', '2023-03-24', 'Test-email', 'Roger', 'd7adeb2be0ab4ffd', '152245@jamail.nl', NULL),
(38, '$headers .= \"Reply-To: noreply@example.com\\r\\n\";\r\n', 'Test-email', '2023-03-24', 'Test-email', 'Roger', '33aecfc8d0bd654d', '152245@jamail.nl', NULL),
(39, 'testercode', 'testemail', '2023-03-24', 'tester', 'Roger', 'd1d4c69e03e529a5', '152245@jamail.nl', NULL),
(40, 'testercode', 'testemail', '2023-03-24', 'tester', 'Roger', '18037679710fb63c', '152245@jamail.nl', NULL),
(41, 'testercode', 'testemail', '2023-03-24', 'tester', 'Roger', 'faef0d8ac5956794', '152245@jamail.nl', NULL),
(42, 'testercode', 'testemail', '2023-03-24', 'tester', 'Roger', '3733ea4addb9661b', '152245@jamail.nl', NULL),
(43, 'testercode', 'testemail', '2023-03-24', 'tester', 'Roger', '019934b342052431', '152245@jamail.nl', NULL),
(44, 'testercode', 'testemail', '2023-03-24', 'tester', 'Roger', 'd26f6c2693ce6e08', '152245@jamail.nl', NULL),
(45, 'testercode', 'testemail', '2023-03-24', 'tester', 'Roger', '0e35a1caf5b61b50', '152245@jamail.nl', NULL),
(46, 'testercode', 'testemail', '2023-03-24', 'tester', 'Roger', '8944b3d5c5bd0f0a', '152245@jamail.nl', NULL),
(47, 'testercode', 'testemail', '2023-03-24', 'tester', 'Roger', 'bb6662a7d23a4cd0', '152245@jamail.nl', NULL),
(48, 'testercode', 'testemail', '2023-03-24', 'tester', 'Roger', '58a9a5434bb21272', '152245@jamail.nl', NULL),
(49, 'testercode', 'testemail', '2023-03-24', 'tester', 'Roger', '8fb1308b1774f888', '152245@jamail.nl', NULL),
(50, 'testercode', 'testemail', '2023-03-24', 'tester', 'Roger', '295c22a4519d9064', '152245@jamail.nl', NULL),
(51, 'testercode', 'testemail', '2023-03-24', 'tester', 'Roger', 'e09720f5c3ad6549', '152245@jamail.nl', NULL),
(52, 'testercode', 'testemail', '2023-03-24', 'tester', 'Roger', '5005d3aac25dc3e9', '152245@jamail.nl', NULL),
(53, 'testercode', 'testemail', '2023-03-24', 'tester', 'Roger', 'cfc0d42a891eeec8', '152245@jamail.nl', NULL),
(54, 'testeter1', 'rqwr', '2023-03-24', '1', 'Roger', '87fa9fad8a2edeaf', '152245@jamail.nl', NULL),
(55, 'qe', 'rqwrqwe', '2023-03-24', '1qwe', 'Rogerqwe', '1fa8dd010930d5fe', '152245@jamail.nl', NULL),
(56, 'efnivqsbasbvklanm,.b nasd;lvB BVANKV', 'EMAIL-TEST', '2023-03-24', 'qrqrqfadfqeef', 'testerenjoyer', '4b5be442a63dba78', 'test@gmail.com', NULL);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT voor een tabel `configuration`
--
ALTER TABLE `configuration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT voor een tabel `private_posts`
--
ALTER TABLE `private_posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
