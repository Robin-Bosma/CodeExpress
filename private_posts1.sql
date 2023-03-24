-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 24 mrt 2023 om 10:17
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
-- Indexen voor tabel `private_posts`
--
ALTER TABLE `private_posts`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `private_posts`
--
ALTER TABLE `private_posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
