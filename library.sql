-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 16, 2025 at 09:43 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `library`
--

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `bookid` int(11) NOT NULL,
  `bookName` varchar(255) NOT NULL,
  `status` varchar(20) DEFAULT 'available',
  `synopsis` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`bookid`, `bookName`, `status`, `synopsis`) VALUES
(1, 'The Glimpse of a Love', 'available', ''),
(2, 'You Are My Destiny', 'available', ''),
(3, 'Once Upon A Time', 'available', 'bhjsdjbczxx nmnj'),
(4, 'There is a Princess That Hate FYP', 'available', 'ghjbsxjsxan');

-- --------------------------------------------------------

--
-- Table structure for table `borrow`
--

CREATE TABLE `borrow` (
  `borrowid` int(11) NOT NULL,
  `borrowDate` date NOT NULL,
  `userid` int(50) NOT NULL,
  `bookid` int(50) NOT NULL,
  `returnBy` date DEFAULT NULL,
  `status` varchar(20) DEFAULT 'Borrowed'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `borrow`
--

INSERT INTO `borrow` (`borrowid`, `borrowDate`, `userid`, `bookid`, `returnBy`, `status`) VALUES
(15, '2025-06-22', 1, 1, '2025-07-06', 'Returned'),
(16, '2025-06-22', 1, 1, '2025-07-06', 'Returned'),
(17, '2025-06-22', 1, 1, '2025-07-06', 'borrowed'),
(18, '2025-06-22', 1, 1, '2025-07-06', 'borrowed'),
(19, '2025-06-22', 1, 1, '2025-07-06', 'borrowed'),
(20, '2025-06-15', 1, 1, '2025-06-29', 'borrowed'),
(21, '2025-06-15', 1, 1, '2025-06-29', 'borrowed'),
(22, '2025-06-22', 1, 2, '2025-07-06', 'borrowed'),
(25, '2025-06-24', 3, 4, '2025-07-08', 'borrowed'),
(26, '2025-06-25', 3, 3, '2025-07-09', 'Returned');

-- --------------------------------------------------------

--
-- Table structure for table `return`
--

CREATE TABLE `return` (
  `returnid` int(11) NOT NULL,
  `returnDate` date NOT NULL,
  `borrowid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `return`
--

INSERT INTO `return` (`returnid`, `returnDate`, `borrowid`) VALUES
(1, '2025-06-16', 16),
(2, '2025-06-16', 15);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `staffid` int(11) NOT NULL,
  `staffName` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userid` int(11) NOT NULL,
  `username` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userid`, `username`) VALUES
(1, 'rey'),
(3, 'Hanis'),
(4, 'Irisaz');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`bookid`);

--
-- Indexes for table `borrow`
--
ALTER TABLE `borrow`
  ADD PRIMARY KEY (`borrowid`),
  ADD KEY `userid_fk` (`userid`),
  ADD KEY `bookid_fk` (`bookid`);

--
-- Indexes for table `return`
--
ALTER TABLE `return`
  ADD PRIMARY KEY (`returnid`),
  ADD KEY `borrowid` (`borrowid`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staffid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `book`
--
ALTER TABLE `book`
  MODIFY `bookid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `borrow`
--
ALTER TABLE `borrow`
  MODIFY `borrowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `return`
--
ALTER TABLE `return`
  MODIFY `returnid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `staffid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `borrow`
--
ALTER TABLE `borrow`
  ADD CONSTRAINT `bookid_fk` FOREIGN KEY (`bookid`) REFERENCES `book` (`bookid`),
  ADD CONSTRAINT `userid_fk` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`);

--
-- Constraints for table `return`
--
ALTER TABLE `return`
  ADD CONSTRAINT `borrowid` FOREIGN KEY (`borrowid`) REFERENCES `borrow` (`borrowid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
