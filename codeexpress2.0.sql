-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 22 mrt 2023 om 08:55
-- Serverversie: 10.4.24-MariaDB
-- PHP-versie: 8.1.6

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
  `creator` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `configuration`
--

INSERT INTO `configuration` (`id`, `code`, `title`, `html`, `css`, `php`, `javascript`, `SQLcode`, `date`, `description`, `creator`) VALUES
(1, 'Test', 'Test', 'false', 'false', 'false', 'false', 'false', '2023-03-21', 'Test', 'Test'),
(2, 'Test', 'Test', 'false', 'false', 'false', 'false', 'false', '2023-03-21', 'Test', 'Test'),
(3, 'test', 'test', '', '', '', '', '', '2023-03-21', 'test', 'test'),
(4, 'testqweq', 'qwe', 'HTML', '', '', '', '', '2023-03-21', 'qwe', 'qwe'),
(5, 'Test123123', '123', 'HTML', 'CSS', 'PHP', 'JavaScript', 'SQL', '2023-03-21', '123123', '123'),
(6, 'Test123123', '123', 'HTML', 'CSS', 'PHP', 'JavaScript', 'SQL', '2023-03-21', '123123', '123');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
