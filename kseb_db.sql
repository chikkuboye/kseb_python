-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 23, 2022 at 07:32 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kseb_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `id` int(11) NOT NULL,
  `User_Id` int(11) NOT NULL,
  `month` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `bill` int(11) NOT NULL,
  `paid status` varchar(10) NOT NULL,
  `bill date` date NOT NULL,
  `due_date` date DEFAULT NULL,
  `total_unit` int(11) NOT NULL,
  `invoice_num` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`id`, `User_Id`, `month`, `year`, `bill`, `paid status`, `bill date`, `due_date`, `total_unit`, `invoice_num`) VALUES
(60, 1, 11, 2022, 610, '0', '2022-11-11', '2022-11-25', 122, 8253),
(61, 2, 11, 2022, 480, '0', '2022-11-11', '2022-11-25', 96, 7240),
(62, 4, 11, 2022, 565, '0', '2022-11-11', '2022-11-25', 113, 5107),
(63, 5, 11, 2022, 345, '0', '2022-11-11', '2022-11-25', 69, 6090),
(64, 6, 11, 2022, 695, '0', '2022-11-11', '2022-11-25', 139, 6000),
(65, 7, 11, 2022, 0, '0', '2022-11-11', '2022-11-25', 0, 5635);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `Name` varchar(25) NOT NULL,
  `Address` varchar(40) NOT NULL,
  `Phone_num` bigint(20) NOT NULL,
  `Cust_code` int(11) NOT NULL,
  `Email` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `Name`, `Address`, `Phone_num`, `Cust_code`, `Email`) VALUES
(1, 'Mahalakshmi', 'palakkad', 9078990078, 12345, 'mahalakshmi@gmail.com'),
(2, 'Aswathy', 'kochi', 87908889976, 12367, 'achu@gmail.com'),
(4, 'Aishu', 'Thodupuzha', 7899880987, 12354, 'aishu@gmail.com'),
(5, 'Sneha', 'kochi', 6788877678, 12378, 'sneha@gmail.com'),
(6, 'Anjana', 'idukki', 7898778890, 12355, 'anjana@gmail.com'),
(7, 'Maha', 'Thrissur', 7899879800, 12389, 'maha@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `usage`
--

CREATE TABLE `usage` (
  `id` int(11) NOT NULL,
  `User_Id` int(11) NOT NULL,
  `Unit` int(11) NOT NULL,
  `Date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `usage`
--

INSERT INTO `usage` (`id`, `User_Id`, `Unit`, `Date`) VALUES
(1, 1, 5, '2022-10-10 07:38:29'),
(2, 6, 10, '2022-10-01 07:39:21'),
(3, 2, 4, '2022-10-10 07:39:37'),
(4, 4, 8, '2022-10-10 07:39:49'),
(5, 5, 7, '2022-10-10 07:40:00'),
(6, 1, 3, '2022-10-13 00:00:00'),
(7, 2, 5, '2022-11-10 07:40:33'),
(8, 5, 11, '2022-10-10 07:40:45'),
(9, 4, 12, '2022-11-10 07:41:25'),
(10, 2, 11, '2022-10-10 07:57:29'),
(11, 2, 5, '2022-11-10 07:57:44'),
(12, 2, 6, '2022-11-10 07:57:57'),
(13, 4, 3, '2022-10-10 07:58:09'),
(14, 4, 20, '2022-11-10 07:58:20'),
(15, 4, 12, '2022-11-10 07:58:29'),
(16, 5, 10, '2022-10-10 07:58:39'),
(17, 5, 15, '2022-10-10 07:58:52'),
(18, 5, 13, '2022-10-10 07:59:02'),
(19, 6, 13, '2022-10-10 07:59:13'),
(20, 6, 9, '2022-11-10 07:59:22'),
(21, 6, 16, '2022-11-10 07:59:32'),
(22, 1, 4, '2022-10-10 08:00:09'),
(23, 1, 11, '2022-11-10 08:00:20'),
(24, 1, 7, '2022-10-10 08:00:34'),
(25, 1, 9, '2022-11-10 08:00:45'),
(26, 1, 21, '2022-11-10 08:00:56'),
(27, 5, 12, '2022-11-10 08:01:08'),
(28, 5, 10, '2022-11-10 08:01:18'),
(29, 5, 13, '2022-11-10 08:01:27'),
(30, 5, 11, '2022-11-10 08:01:35'),
(31, 5, 11, '2022-11-10 08:02:15'),
(32, 4, 22, '2022-11-10 08:04:06'),
(33, 4, 21, '2022-11-10 08:04:31'),
(34, 4, 26, '2022-11-10 08:04:44'),
(35, 5, 12, '2022-11-10 08:04:58'),
(36, 1, 17, '2022-10-10 08:07:48'),
(37, 2, 11, '2022-10-10 12:38:06'),
(38, 4, 15, '2022-10-10 12:38:22'),
(39, 5, 17, '2022-10-10 12:38:37'),
(40, 6, 20, '2022-10-10 12:38:52'),
(41, 1, 24, '2022-10-10 12:39:07'),
(42, 2, 11, '2022-11-10 08:09:25'),
(43, 4, 11, '2022-10-10 08:11:37'),
(44, 4, 17, '2022-10-10 08:12:11'),
(45, 4, 18, '2022-10-10 08:12:25'),
(46, 4, 23, '2022-10-10 08:12:39'),
(47, 6, 24, '2022-10-10 08:14:54'),
(48, 6, 32, '2022-11-10 08:15:08'),
(49, 6, 34, '2022-10-10 08:15:20'),
(50, 6, 32, '2022-10-10 08:15:32'),
(51, 6, 22, '2022-11-10 08:15:46'),
(52, 2, 16, '2022-10-10 08:17:53'),
(53, 2, 32, '2022-11-10 08:18:06'),
(54, 2, 21, '2022-10-10 08:18:16'),
(55, 2, 37, '2022-11-10 08:18:28'),
(56, 2, 33, '2022-10-10 08:19:23'),
(57, 1, 22, '2022-11-10 08:20:09'),
(58, 6, 32, '2022-11-10 08:23:45'),
(59, 6, 23, '2022-11-10 08:24:06'),
(60, 6, 5, '2022-11-10 08:24:20'),
(61, 1, 4, '2022-11-11 14:36:37'),
(62, 1, 3, '2022-11-11 14:36:37'),
(63, 1, 4, '2022-11-11 14:36:42'),
(64, 1, 6, '2022-11-11 14:36:52'),
(65, 1, 6, '2022-11-11 14:37:02'),
(66, 1, 7, '2022-11-11 14:37:12'),
(67, 1, 1, '2022-11-11 14:37:22'),
(68, 1, 5, '2022-11-11 14:47:53'),
(69, 1, 5, '2022-11-11 14:47:53'),
(70, 1, 9, '2022-11-11 14:48:03'),
(71, 1, 9, '2022-11-11 14:48:13'),
(72, 1, 2, '2022-11-11 16:39:48'),
(73, 1, 4, '2022-11-11 16:39:53'),
(74, 1, 4, '2022-11-11 16:39:58'),
(75, 1, 5, '2022-11-11 16:40:03'),
(76, 1, 1, '2022-11-11 16:40:09'),
(77, 1, 6, '2022-11-11 16:40:14'),
(78, 1, 4, '2022-11-11 16:40:19'),
(79, 1, 10, '2022-11-11 16:40:24'),
(80, 1, 7, '2022-11-11 16:40:29'),
(81, 1, 2, '2022-11-11 16:40:34'),
(82, 1, 8, '2022-11-11 16:43:32'),
(83, 1, 6, '2022-11-11 16:43:37'),
(84, 1, 5, '2022-11-11 16:43:42'),
(85, 1, 3, '2022-11-11 16:43:47'),
(86, 1, 7, '2022-11-11 16:43:53'),
(87, 1, 8, '2022-11-11 16:43:58'),
(88, 1, 5, '2022-11-11 16:44:03'),
(89, 1, 1, '2022-11-11 16:44:08'),
(90, 1, 10, '2022-11-11 16:44:13'),
(91, 1, 2, '2022-11-11 16:44:18'),
(92, 1, 9, '2022-11-11 16:44:23'),
(93, 1, 9, '2022-11-11 16:44:28');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usage`
--
ALTER TABLE `usage`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bill`
--
ALTER TABLE `bill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `usage`
--
ALTER TABLE `usage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
