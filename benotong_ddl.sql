-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 15, 2024 at 10:16 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `benotong_ddl`
--

-- --------------------------------------------------------

--
-- Table structure for table `oders`
--

CREATE TABLE `oders` (
  `Order ID` int(11) NOT NULL,
  `Employee ID` varchar(125) NOT NULL,
  `Customer ID` varchar(125) NOT NULL,
  `Customer` varchar(125) NOT NULL,
  `Order Date` date NOT NULL,
  `Shipped Date` date NOT NULL,
  `Shipped ID` varchar(125) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `oders`
--

INSERT INTO `oders` (`Order ID`, `Employee ID`, `Customer ID`, `Customer`, `Order Date`, `Shipped Date`, `Shipped ID`) VALUES
(1, '[value-2]', '[value-3]', '[value-4]', '0000-00-00', '0000-00-00', '[value-7]'),
(2, 'Product Code', 'Product Name', 'Description', '0000-00-00', '0000-00-00', 'Reorder Level');

-- --------------------------------------------------------

--
-- Table structure for table `order details`
--

CREATE TABLE `order details` (
  `Product ID` int(11) NOT NULL,
  `Order ID` int(11) NOT NULL,
  `Quantity` decimal(50,0) NOT NULL,
  `Unit Price` varchar(125) NOT NULL,
  `Discount` decimal(50,0) NOT NULL,
  `Status ID` varchar(125) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `ID` int(11) NOT NULL,
  `Product Code` varchar(125) NOT NULL,
  `Product Name` varchar(125) NOT NULL,
  `Description` text NOT NULL,
  `Standard Cost` varchar(125) NOT NULL,
  `List Price` binary(50) NOT NULL,
  `Reorder Level` varchar(125) NOT NULL,
  `Quantity Per Unit` varchar(125) NOT NULL,
  `Discontinued` varchar(125) NOT NULL,
  `Minimum Reorder Code` varchar(125) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `oders`
--
ALTER TABLE `oders`
  ADD PRIMARY KEY (`Order ID`);

--
-- Indexes for table `order details`
--
ALTER TABLE `order details`
  ADD PRIMARY KEY (`Product ID`),
  ADD UNIQUE KEY `Discount` (`Discount`),
  ADD KEY `Product ID` (`Order ID`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `oders`
--
ALTER TABLE `oders`
  MODIFY `Order ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `order details`
--
ALTER TABLE `order details`
  MODIFY `Product ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order details`
--
ALTER TABLE `order details`
  ADD CONSTRAINT `Product ID` FOREIGN KEY (`Order ID`) REFERENCES `order details` (`Product ID`),
  ADD CONSTRAINT `order details_ibfk_1` FOREIGN KEY (`Product ID`) REFERENCES `products` (`ID`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `oders` (`Order ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
