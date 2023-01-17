-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 17, 2023 at 09:50 PM
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
-- Database: `schooldb`
--

-- --------------------------------------------------------

--
-- Table structure for table `academiccalender`
--

CREATE TABLE `academiccalender` (
  `date` date NOT NULL,
  `status` varchar(20) NOT NULL,
  `event` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `academiccalender`
--

INSERT INTO `academiccalender` (`date`, `status`, `event`) VALUES
('2023-01-21', 'h', 'saturday'),
('2023-01-22', 'h', 'Sunday');

-- --------------------------------------------------------

--
-- Table structure for table `admininfo`
--

CREATE TABLE `admininfo` (
  `adminId` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `pass` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admininfo`
--

INSERT INTO `admininfo` (`adminId`, `name`, `pass`) VALUES
('A100', 'Noor Elahi Khan Lodhi', '3126'),
('A560', 'Irfan Haider', '1111');

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE `class` (
  `cid` varchar(10) NOT NULL,
  `class` int(11) NOT NULL,
  `tid` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`cid`, `class`, `tid`) VALUES
('C200', 2, 'T100'),
('C500', 5, 'T200'),
('C700', 7, 'T090');

-- --------------------------------------------------------

--
-- Table structure for table `stuattend`
--

CREATE TABLE `stuattend` (
  `roll` varchar(20) NOT NULL,
  `date` date NOT NULL,
  `status` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stuattend`
--

INSERT INTO `stuattend` (`roll`, `date`, `status`) VALUES
('2020-ce-003', '2023-01-15', 'p'),
('2020-ce-003', '2023-01-17', 'p');

-- --------------------------------------------------------

--
-- Table structure for table `stuinfo`
--

CREATE TABLE `stuinfo` (
  `roll` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `cid` varchar(20) NOT NULL,
  `father` varchar(100) NOT NULL,
  `dob` date NOT NULL,
  `addDate` date NOT NULL,
  `phone` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stuinfo`
--

INSERT INTO `stuinfo` (`roll`, `name`, `cid`, `father`, `dob`, `addDate`, `phone`) VALUES
('2020-ce-003', 'Noor Elahi Khan Lodhi', 'C200', 'Ibrahim Noor Khan Lodhi', '2000-01-07', '2019-09-26', 3182345899),
('2020-CE-03', 'Irfan', 'C200', 'Haider', '2000-07-17', '2023-01-11', 92334284623);

-- --------------------------------------------------------

--
-- Table structure for table `stumarks`
--

CREATE TABLE `stumarks` (
  `roll` varchar(20) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `type` varchar(10) NOT NULL,
  `obtained` int(11) NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stumarks`
--

INSERT INTO `stumarks` (`roll`, `subject`, `type`, `obtained`, `total`) VALUES
('2020-ce-003', 'DSP', 'FINAL', 47, 50),
('2020-ce-003', 'DSP', 'MID', 24, 30),
('2020-ce-003', 'DSP', 'Test1', 10, 10),
('2020-ce-003', 'DSP', 'Test2', 10, 10),
('2020-ce-003', 'Software', 'FINAL', 48, 50),
('2020-ce-003', 'Software', 'MID', 24, 30),
('2020-ce-003', 'Software', 'Test1', 9, 10),
('2020-ce-003', 'Software', 'Test2', 10, 10);

-- --------------------------------------------------------

--
-- Table structure for table `subinfo`
--

CREATE TABLE `subinfo` (
  `subject` varchar(100) NOT NULL,
  `tid` varchar(20) NOT NULL,
  `cid` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subinfo`
--

INSERT INTO `subinfo` (`subject`, `tid`, `cid`) VALUES
('DSP', 'T100', 'C200'),
('Software', 'T333', 'C200'),
('AOOP', 'T200', 'C700');

-- --------------------------------------------------------

--
-- Table structure for table `teachattend`
--

CREATE TABLE `teachattend` (
  `id` varchar(10) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teachattend`
--

INSERT INTO `teachattend` (`id`, `date`, `time`, `status`) VALUES
('T100', '2023-01-15', '20:38:07', 'p'),
('T100', '2023-01-17', '10:48:54', 'p'),
('T100', '2023-01-18', '01:46:25', 'p');

-- --------------------------------------------------------

--
-- Table structure for table `teachinfo`
--

CREATE TABLE `teachinfo` (
  `tid` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `dob` date NOT NULL,
  `joinDate` date NOT NULL,
  `pass` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teachinfo`
--

INSERT INTO `teachinfo` (`tid`, `name`, `dob`, `joinDate`, `pass`) VALUES
('T090', 'Naseem', '1980-03-02', '2023-01-18', '222'),
('T100', 'Noman', '1990-01-17', '2013-02-14', '1234'),
('T200', 'Faiza Farooq', '1998-07-18', '2023-01-26', '4321'),
('T333', 'Yasir', '1990-03-03', '2023-01-18', '22222');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `academiccalender`
--
ALTER TABLE `academiccalender`
  ADD PRIMARY KEY (`date`,`event`);

--
-- Indexes for table `admininfo`
--
ALTER TABLE `admininfo`
  ADD PRIMARY KEY (`adminId`);

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`cid`),
  ADD KEY `teacherId` (`tid`);

--
-- Indexes for table `stuattend`
--
ALTER TABLE `stuattend`
  ADD PRIMARY KEY (`roll`,`date`);

--
-- Indexes for table `stuinfo`
--
ALTER TABLE `stuinfo`
  ADD PRIMARY KEY (`roll`);

--
-- Indexes for table `stumarks`
--
ALTER TABLE `stumarks`
  ADD PRIMARY KEY (`roll`,`subject`,`type`);

--
-- Indexes for table `subinfo`
--
ALTER TABLE `subinfo`
  ADD PRIMARY KEY (`subject`,`tid`),
  ADD KEY `classID` (`cid`);

--
-- Indexes for table `teachattend`
--
ALTER TABLE `teachattend`
  ADD PRIMARY KEY (`id`,`date`);

--
-- Indexes for table `teachinfo`
--
ALTER TABLE `teachinfo`
  ADD PRIMARY KEY (`tid`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `class`
--
ALTER TABLE `class`
  ADD CONSTRAINT `teacherId` FOREIGN KEY (`tid`) REFERENCES `teachinfo` (`tid`);

--
-- Constraints for table `stuattend`
--
ALTER TABLE `stuattend`
  ADD CONSTRAINT `roll` FOREIGN KEY (`roll`) REFERENCES `stuinfo` (`roll`);

--
-- Constraints for table `stumarks`
--
ALTER TABLE `stumarks`
  ADD CONSTRAINT `roll1` FOREIGN KEY (`roll`) REFERENCES `stuinfo` (`roll`);

--
-- Constraints for table `subinfo`
--
ALTER TABLE `subinfo`
  ADD CONSTRAINT `classID` FOREIGN KEY (`cid`) REFERENCES `class` (`cid`);

--
-- Constraints for table `teachattend`
--
ALTER TABLE `teachattend`
  ADD CONSTRAINT `teacherId1` FOREIGN KEY (`id`) REFERENCES `teachinfo` (`tid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
