-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 24, 2023 at 10:03 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

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
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `comment_text` varchar(255) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `problem_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `comment_text`, `username`, `date_created`, `problem_id`) VALUES
(1, 'Werkt dit?', '1473', '2023-03-24 08:38:15', 1),
(2, 'Duplicate', '1665', '2023-03-24 08:39:03', 1),
(3, 'Duplicate', '9770', '2023-03-24 08:39:06', 1),
(4, 'test 2', '669', '2023-03-24 08:39:36', 2);

-- --------------------------------------------------------

--
-- Table structure for table `configuration`
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
  `creator` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `configuration`
--

INSERT INTO `configuration` (`id`, `code`, `title`, `html`, `css`, `php`, `javascript`, `SQLcode`, `date`, `description`, `creator`) VALUES
(1, 'spdashd', 'xsLKCn', 'HTML', 'CSS', 'PHP', 'JavaScript', 'SQL', '2023-03-24', 'aspdj', 'dap'),
(2, 'spdashd', 'xsLKCn', 'false', 'true', 'false', 'false', 'false', '2023-03-24', 'aspdj', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `private_posts`
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
  `creator` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `problem_id` (`problem_id`);

--
-- Indexes for table `configuration`
--
ALTER TABLE `configuration`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `configuration`
--
ALTER TABLE `configuration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
