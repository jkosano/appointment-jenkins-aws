-- phpMyAdmin SQL Dump
-- version 4.9.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Jan 16, 2021 at 10:04 PM
-- Server version: 5.7.26
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `appointment`
--
CREATE DATABASE IF NOT EXISTS `appointment` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `appointment`;

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `appointment_id` int(11) NOT NULL,
  `customer_id` int(20) NOT NULL,
  `barber_id` int(128) NOT NULL,
  `service_type` varchar(20) NOT NULL,
  `date` varchar(200) NOT NULL,
  `time` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`appointment_id`, `customer_id`, `barber_id`, `service_type`, `date`, `time`) VALUES
(1, 1, 1, 'Adult Haircut - $25', '2020-06-24 00:00:00', '3:00 PM'),
(13, 19, 3, 'Adult Haircut - $25', '06/17/2020', '10:00 AM'),
(14, 21, 4, 'Adult Haircut - $25', '06/20/2020', '11:30 AM'),
(15, 22, 2, 'Adult Haircut - $25', '06/20/2020', '10:30 AM'),
(16, 23, 2, 'Beard - $35', '06/18/2020', '12:00 PM'),
(17, 24, 3, 'Edgeup - $10', '06/27/2020', '11:00 AM'),
(18, 25, 2, 'Beard - $35', '07/03/2020', '11:00 AM'),
(19, 26, 3, 'Adult Haircut - $25', '06/25/2020', '11:30 AM'),
(20, 27, 3, 'Child Haircut - $15', '07/04/2020', '10:30 AM'),
(21, 28, 2, 'Adult Haircut - $25', '12/31/2020', '10:00 AM');

-- --------------------------------------------------------

--
-- Table structure for table `barbers`
--

CREATE TABLE `barbers` (
  `barber_id` int(128) NOT NULL,
  `name` varchar(200) NOT NULL,
  `phone` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barbers`
--

INSERT INTO `barbers` (`barber_id`, `name`, `phone`) VALUES
(1, 'Bob Parker', '8019299000'),
(2, 'John Smith', '8012727888'),
(3, 'Ashley Martinez', '8017889000'),
(4, 'Joe Johnson', '8012729000');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(20) NOT NULL,
  `barber_id` int(128) NOT NULL,
  `name` varchar(200) NOT NULL,
  `phone` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `barber_id`, `name`, `phone`) VALUES
(1, 1, 'Bob Johnson', '8016788765'),
(19, 3, 'Joe Black', '8019879000'),
(20, 4, 'Jacob K', '8015678100'),
(21, 4, 'Jacob K', '8015678100'),
(22, 2, 'Ken Brown', '8017656789'),
(23, 2, 'Benny L', '8019899000'),
(24, 3, 'Jim Joe', '801900000'),
(25, 2, 'John Martinez', '8019787654'),
(26, 3, 'Test', '8019899000'),
(27, 3, 'Joe', '8019298765'),
(28, 2, 'test2', '8018018011');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `review_id` int(11) NOT NULL,
  `customer_id` int(20) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `date` varchar(200) NOT NULL,
  `star_rating` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `service_id` int(11) NOT NULL,
  `appointment_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`appointment_id`),
  ADD KEY `appointment_fk` (`barber_id`),
  ADD KEY `appointment_fk2` (`customer_id`);

--
-- Indexes for table `barbers`
--
ALTER TABLE `barbers`
  ADD PRIMARY KEY (`barber_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `customer_fk` (`barber_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `review_fk` (`customer_id`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`service_id`),
  ADD KEY `service_fk_1` (`appointment_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `appointment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `barbers`
--
ALTER TABLE `barbers`
  MODIFY `barber_id` int(128) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `service`
--
ALTER TABLE `service`
  MODIFY `service_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `appointment_fk` FOREIGN KEY (`barber_id`) REFERENCES `barbers` (`barber_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `appointment_fk2` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON UPDATE CASCADE;

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_fk` FOREIGN KEY (`barber_id`) REFERENCES `barbers` (`barber_id`) ON UPDATE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `review_fk` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON UPDATE CASCADE;

--
-- Constraints for table `service`
--
ALTER TABLE `service`
  ADD CONSTRAINT `service_fk_1` FOREIGN KEY (`appointment_id`) REFERENCES `appointment` (`appointment_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
