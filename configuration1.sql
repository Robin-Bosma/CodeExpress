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
-- Tabelstructuur voor tabel `configuration`
--

CREATE TABLE `configuration` (
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
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `configuration`
--

INSERT INTO `configuration` (`id`, `code`, `title`, `html`, `css`, `php`, `javascript`, `SQLcode`, `date`, `description`, `creator`, `email`) VALUES
(1, 'Test', 'Test', 'false', 'false', 'false', 'false', 'false', '2023-03-21', 'Test', 'Test', NULL),
(2, 'Test', 'Test', 'false', 'false', 'false', 'false', 'false', '2023-03-21', 'Test', 'Test', NULL),
(3, 'test', 'test', '', '', '', '', '', '2023-03-21', 'test', 'test', NULL),
(4, 'testqweq', 'qwe', 'HTML', '', '', '', '', '2023-03-21', 'qwe', 'qwe', NULL),
(5, 'Test123123', '123', 'HTML', 'CSS', 'PHP', 'JavaScript', 'SQL', '2023-03-21', '123123', '123', NULL),
(6, 'Test123123', '123', 'HTML', 'CSS', 'PHP', 'JavaScript', 'SQL', '2023-03-21', '123123', '123', NULL),
(7, 'qweqeqweqe', 'qweqweqwe', 'false', 'false', 'false', 'false', 'false', '2023-03-22', 'qweqwewe', 'qweqwe', NULL),
(8, 'tqweqweq', 'sdfsdf', 'true', 'true', 'true', 'true', 'true', '2023-03-22', 'eqreteqt', 'sdf', NULL),
(9, 'tqweqweqefdw', 'fwedfwdf', NULL, NULL, NULL, NULL, NULL, '2023-03-22', 'fwedfw', 'wfewf', NULL),
(10, 'gdvdffbdfb', 'fbdfbdfbdfbdf', 'false', 'false', 'false', 'false', 'false', '2023-03-22', 'dfbdfbdbd', 'bdfbdfbdfbdf', NULL),
(11, 'qwe', 'qweqw', 'false', 'false', 'false', 'false', 'false', '2023-03-22', 'eqweqwe', 'qweqw', NULL),
(12, 'dfddefqefqqqwqrqqqfqweqwqwqw', 'qwweqweqwe', 'HTML', 'CSS', 'PHP', 'JavaScript', 'SQL', '2023-03-23', 'qweqwqweqw', 'qweqweqwe', NULL),
(13, '    $stmt2->bindParam(\":creator\", $creator);\r\n', 'qwqwqwe', 'HTML', 'CSS', 'PHP', 'JavaScript', 'SQL', '2023-03-24', 'qweqwdqwd', 'qwqweqwqwe', 'test@gmail.com'),
(14, 'testercode', 'testemail', 'HTML', 'CSS', 'PHP', 'JavaScript', 'SQL', '2023-03-24', 'tester', 'Roger', '152245@jamail.nl'),
(15, 'testercode', 'testemail', 'HTML', 'CSS', 'PHP', 'JavaScript', 'SQL', '2023-03-24', 'tester', 'Roger', '152245@jamail.nl'),
(16, 'testercode', 'testemail', 'HTML', 'CSS', 'PHP', 'JavaScript', 'SQL', '2023-03-24', 'tester', 'Roger', '152245@jamail.nl'),
(17, 'testercode', 'testemail', 'HTML', 'CSS', 'PHP', 'JavaScript', 'SQL', '2023-03-24', 'tester', 'Roger', '152245@jamail.nl'),
(18, 'testercode', 'testemail', 'HTML', 'CSS', 'PHP', 'JavaScript', 'SQL', '2023-03-24', 'tester', 'Roger', '152245@jamail.nl'),
(19, 'testercode', 'testemail', 'HTML', 'CSS', 'PHP', 'JavaScript', 'SQL', '2023-03-24', 'tester', 'Roger', '152245@jamail.nl'),
(20, 'testercode', 'testemail', 'HTML', 'CSS', 'PHP', 'JavaScript', 'SQL', '2023-03-24', 'tester', 'Roger', '152245@jamail.nl'),
(21, 'testercode', 'testemail', 'HTML', 'CSS', 'PHP', 'JavaScript', 'SQL', '2023-03-24', 'tester', 'Roger', '152245@jamail.nl'),
(22, 'testercode', 'testemail', 'HTML', 'CSS', 'PHP', 'JavaScript', 'SQL', '2023-03-24', 'tester', 'Roger', '152245@jamail.nl'),
(23, 'testercode', 'testemail', 'HTML', 'CSS', 'PHP', 'JavaScript', 'SQL', '2023-03-24', 'tester', 'Roger', '152245@jamail.nl'),
(24, 'testercode', 'testemail', 'HTML', 'CSS', 'PHP', 'JavaScript', 'SQL', '2023-03-24', 'tester', 'Roger', '152245@jamail.nl');

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `configuration`
--
ALTER TABLE `configuration`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `configuration`
--
ALTER TABLE `configuration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
