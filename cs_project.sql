-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 22, 2022 at 02:28 PM
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
-- Database: `cs_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `login_time` datetime NOT NULL,
  `logout_time` datetime NOT NULL DEFAULT current_timestamp(),
  `ip` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id`, `email`, `login_time`, `logout_time`, `ip`) VALUES
(1, 'aaaa@gmail.com', '2022-05-22 13:58:52', '2022-05-22 17:28:54', '::1'),
(2, 'aaaa@gmail.com', '2022-05-22 13:59:14', '2022-05-22 17:29:15', '::1'),
(3, 'aaaa@gmail.com', '2022-05-22 14:17:59', '2022-05-22 17:57:16', '::1');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(600) NOT NULL,
  `salt` varchar(50) NOT NULL,
  `timestamp` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `full_name`, `email`, `password`, `salt`, `timestamp`) VALUES
(3, 'aa', 'aaaa@gmail.com', 'ee736c9c26c1aff821ea44b823c8e412c6219368f31cee074f48933c730025743be9528dff0466676f7d5c12936f0767415087f0d71e3796c8d3b7a915a3feb2', '5p1zTA9T2BU96x4PsOxQ', '2022-05-11'),
(4, 'Test', 'bbbb@gmail.com', '018ab7e4e1264a8195191168a778ef63159c1c31b42cd97df5e58f92ee7c0424c1e245a28acd1c8d11e35b7e28f728ba9d5617912dae6bae69c83a1d7b60071e', 'x764dXkyP94AKcJNpSJU', '2022-05-22'),
(5, 'cc', 'cc@gmail.com', 'c5dc006f27c64fbe096259d325ac2fff52ec46fc18b83d848a4a1e9c142a3b4311fd818b2c6ffdc18480343468d2117a92f3deeb32f9af7b45134e7f851f2d0a', 'V4u7JUR1pfF4FYTZYVOB', '2022-05-22');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
