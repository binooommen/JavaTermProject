-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 07, 2015 at 03:11 AM
-- Server version: 5.6.16
-- PHP Version: 5.5.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `simpleerp`
--
CREATE DATABASE IF NOT EXISTS `simpleerp` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `simpleerp`;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_date` date DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `create_date`, `name`) VALUES
(1, '2015-04-06', 'Bino'),
(2, '2015-04-06', 'Neha'),
(3, '2015-04-06', 'Ashish'),
(4, '2015-04-06', 'Kuldeep');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_date` date DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `cost_price` float DEFAULT NULL,
  `list_price` float DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `create_date`, `name`, `cost_price`, `list_price`, `description`) VALUES
(1, '2015-04-06', 'nokia lumia 620', 400, 500, 'It is a very good phone with lots of good features.'),
(2, '2015-04-06', 'nokia lumia 520', 300, 400, 'It is a very good phone with lots of good features.'),
(3, '2015-04-06', 'Iphone 6', 700, 900, 'It is a very good phone with lots of good features.'),
(4, '2015-04-06', 'Iphone 6 plus', 900, 1000, 'It is a very good phone with lots of good features.');

-- --------------------------------------------------------

--
-- Table structure for table `purchase`
--

CREATE TABLE IF NOT EXISTS `purchase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_date` date DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` float NOT NULL,
  `total` float NOT NULL,
  `note` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- RELATIONS FOR TABLE `purchase`:
--   `product_id`
--       `product` -> `id`
--

--
-- Dumping data for table `purchase`
--

INSERT INTO `purchase` (`id`, `create_date`, `product_id`, `quantity`, `total`, `note`) VALUES
(1, '2015-04-06', 1, 2, 800, 'This was bought from Mr. JJ'),
(2, '2015-04-06', 1, 4, 1600, 'This was bought from Mr. JJ'),
(3, '2015-04-06', 2, 3, 900, 'This was bought from Mr. JJ'),
(4, '2015-04-06', 4, 2, 1800, 'This was bought from Mr. JJ');

-- --------------------------------------------------------

--
-- Table structure for table `sale`
--

CREATE TABLE IF NOT EXISTS `sale` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_date` date DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` float NOT NULL,
  `total` float NOT NULL,
  `note` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- RELATIONS FOR TABLE `sale`:
--   `customer_id`
--       `customer` -> `id`
--   `product_id`
--       `product` -> `id`
--

--
-- Dumping data for table `sale`
--

INSERT INTO `sale` (`id`, `create_date`, `customer_id`, `product_id`, `quantity`, `total`, `note`) VALUES
(1, '2015-04-06', 1, 1, 1, 500, 'This was the first product sold'),
(2, '2015-04-06', 2, 2, 2, 800, 'Only one more product left');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `purchase`
--
ALTER TABLE `purchase`
  ADD CONSTRAINT `purchase_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Constraints for table `sale`
--
ALTER TABLE `sale`
  ADD CONSTRAINT `sale_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  ADD CONSTRAINT `sale_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
