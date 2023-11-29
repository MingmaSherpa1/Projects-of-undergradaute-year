-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 18, 2023 at 09:02 PM
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
-- Database: `restaurant_mingma`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `C_ID` varchar(20) NOT NULL,
  `C_Name` varchar(20) NOT NULL,
  `C_Address` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`C_ID`, `C_Name`, `C_Address`) VALUES
('1', 'Lisa', 'Barnes'),
('2', 'Phil', 'Waterloo'),
('3', 'Gloria', 'Deptford'),
('4', 'Cam', 'Whitechapel'),
('5', 'Jay', 'Charlton'),
('6', 'Lily', 'Deptford');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `E_ID` varchar(20) NOT NULL,
  `E_Name` varchar(20) NOT NULL,
  `E_Address` varchar(20) NOT NULL,
  `E_Position` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`E_ID`, `E_Name`, `E_Address`, `E_Position`) VALUES
('143', 'Sam', 'Westminister', 'Manager'),
('285', 'Alex', 'Monument', 'Barback'),
('301', 'Mitch', 'Victoria', 'Server'),
('492', 'Andy', 'Waterloo', 'Kitchen Assistant'),
('859', 'George', 'Canada Water', 'Head Chef'),
('937', 'Haley', 'Westminister', 'Front Desk');

-- --------------------------------------------------------

--
-- Table structure for table `food`
--

CREATE TABLE `food` (
  `F_ID` varchar(20) NOT NULL,
  `F_Name` varchar(20) NOT NULL,
  `F_Price` int(11) NOT NULL,
  `F_Quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `food`
--

INSERT INTO `food` (`F_ID`, `F_Name`, `F_Price`, `F_Quantity`) VALUES
('1-F', 'Chicken Gyoza', 5, 23),
('2-F', 'Salmon Teriyaki', 12, 20),
('3-F', 'Pumpkin Kororke', 8, 6),
('4-F', 'Salmon Box', 14, 5),
('5-F', 'Iro Platter', 50, 2),
('6-F', 'Miso soup', 3, 12);

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `I_No` varchar(20) NOT NULL,
  `I_Date` date NOT NULL,
  `I_Price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`I_No`, `I_Date`, `I_Price`) VALUES
('1-I', '2022-11-12', 12),
('2-I', '2021-09-15', 357),
('3-I', '2023-01-23', 561),
('4-I', '2023-04-03', 279),
('5-I', '2021-09-15', 56),
('6-I', '2022-06-19', 92);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `O_ID` varchar(20) NOT NULL,
  `O_Type` varchar(20) NOT NULL,
  `O_Price` int(11) NOT NULL,
  `C_ID` varchar(20) NOT NULL,
  `E_ID` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`O_ID`, `O_Type`, `O_Price`, `C_ID`, `E_ID`) VALUES
('11', 'Takeaway', 24, '1', '143'),
('22', 'Collection', 36, '2', '859'),
('33', 'Dinein', 15, '3', '492'),
('44', 'Delivery', 83, '4', '937'),
('55', 'Dinein', 92, '5', '285'),
('66', 'Delivery', 61, '6', '301');

-- --------------------------------------------------------

--
-- Table structure for table `orders_food`
--

CREATE TABLE `orders_food` (
  `O_ID` varchar(20) NOT NULL,
  `F_ID` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders_food`
--

INSERT INTO `orders_food` (`O_ID`, `F_ID`) VALUES
('11', '1-F'),
('22', '3-F'),
('33', '4-F'),
('44', '2-F'),
('55', '5-F'),
('66', '2-F');

-- --------------------------------------------------------

--
-- Table structure for table `orders_rider`
--

CREATE TABLE `orders_rider` (
  `O_ID` varchar(20) NOT NULL,
  `R_ID` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders_rider`
--

INSERT INTO `orders_rider` (`O_ID`, `R_ID`) VALUES
('44', '1-R'),
('66', '2-R');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `P_ID` varchar(20) NOT NULL,
  `P_Type` varchar(20) NOT NULL,
  `P_Date` date NOT NULL,
  `O_ID` varchar(20) NOT NULL,
  `I_No` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`P_ID`, `P_Type`, `P_Date`, `O_ID`, `I_No`) VALUES
('1-P', 'Cash', '2022-11-12', '11', '1-I'),
('2-P', 'Cash', '2023-01-23', '33', '3-I'),
('3-P', 'Card', '2021-09-15', '66', '5-I'),
('4-P', 'Card', '2021-09-15', '22', '2-I'),
('5-P', 'Cash', '2022-06-19', '55', '6-I'),
('6-P', 'Card', '2023-04-03', '44', '4-I');

-- --------------------------------------------------------

--
-- Table structure for table `rider`
--

CREATE TABLE `rider` (
  `R_ID` varchar(20) NOT NULL,
  `R_Name` varchar(20) NOT NULL,
  `Company` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rider`
--

INSERT INTO `rider` (`R_ID`, `R_Name`, `Company`) VALUES
('1-R', 'Siri', 'Uber'),
('2-R', 'Alexa', 'Deliveroo');

-- --------------------------------------------------------

--
-- Table structure for table `r_tables`
--

CREATE TABLE `r_tables` (
  `T_ID` varchar(20) NOT NULL,
  `Pax` int(11) NOT NULL,
  `O_ID` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `r_tables`
--

INSERT INTO `r_tables` (`T_ID`, `Pax`, `O_ID`) VALUES
('2A', 1, '33'),
('6D', 4, '55');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`C_ID`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`E_ID`);

--
-- Indexes for table `food`
--
ALTER TABLE `food`
  ADD PRIMARY KEY (`F_ID`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`I_No`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`O_ID`),
  ADD KEY `C_ID` (`C_ID`),
  ADD KEY `E_ID` (`E_ID`);

--
-- Indexes for table `orders_food`
--
ALTER TABLE `orders_food`
  ADD KEY `O_ID` (`O_ID`),
  ADD KEY `F_ID` (`F_ID`);

--
-- Indexes for table `orders_rider`
--
ALTER TABLE `orders_rider`
  ADD KEY `O_ID` (`O_ID`),
  ADD KEY `R_ID` (`R_ID`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`P_ID`),
  ADD KEY `O_ID` (`O_ID`),
  ADD KEY `I_No` (`I_No`);

--
-- Indexes for table `rider`
--
ALTER TABLE `rider`
  ADD PRIMARY KEY (`R_ID`);

--
-- Indexes for table `r_tables`
--
ALTER TABLE `r_tables`
  ADD PRIMARY KEY (`T_ID`),
  ADD KEY `O_ID` (`O_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`C_ID`) REFERENCES `customer` (`C_ID`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`E_ID`) REFERENCES `employee` (`E_ID`);

--
-- Constraints for table `orders_food`
--
ALTER TABLE `orders_food`
  ADD CONSTRAINT `orders_food_ibfk_1` FOREIGN KEY (`O_ID`) REFERENCES `orders` (`O_ID`),
  ADD CONSTRAINT `orders_food_ibfk_2` FOREIGN KEY (`F_ID`) REFERENCES `food` (`F_ID`);

--
-- Constraints for table `orders_rider`
--
ALTER TABLE `orders_rider`
  ADD CONSTRAINT `orders_rider_ibfk_1` FOREIGN KEY (`O_ID`) REFERENCES `orders` (`O_ID`),
  ADD CONSTRAINT `orders_rider_ibfk_2` FOREIGN KEY (`R_ID`) REFERENCES `rider` (`R_ID`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`O_ID`) REFERENCES `orders` (`O_ID`),
  ADD CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`I_No`) REFERENCES `invoice` (`I_No`);

--
-- Constraints for table `r_tables`
--
ALTER TABLE `r_tables`
  ADD CONSTRAINT `r_tables_ibfk_1` FOREIGN KEY (`O_ID`) REFERENCES `orders` (`O_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
