-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 24, 2024 at 05:51 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `choumengleang`
--

-- --------------------------------------------------------

--
-- Table structure for table `newproduct`
--

CREATE TABLE `newproduct` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `category` varchar(50) NOT NULL,
  `barcode` int(11) NOT NULL,
  `expired_date` date NOT NULL,
  `qty` int(11) NOT NULL,
  `unit_pricein` double NOT NULL,
  `unit_priceout` double NOT NULL,
  `product_image` text NOT NULL,
  `is_delete` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `newproduct`
--

INSERT INTO `newproduct` (`product_id`, `product_name`, `description`, `category`, `barcode`, `expired_date`, `qty`, `unit_pricein`, `unit_priceout`, `product_image`, `is_delete`) VALUES
(5, 'Green Tea', 'Refreshing green tea with antioxidants.', 'Beverages', 1234567005, '2025-10-15', 100, 1.2, 2.5, 'green_tea.jpg', 0),
(6, 'Chocolate Bar', 'Rich and creamy chocolate bar.', 'Snacks', 1234567006, '2024-05-10', 200, 0.8, 1.5, 'chocolate_bar.jpg', 0),
(7, 'Orange Juice', 'Freshly squeezed orange juice.', 'Beverages', 1234567007, '2024-12-25', 150, 1, 2, 'orange_juice.jpg', 0),
(8, 'Sandwich', 'Tasty chicken sandwich.', 'Food', 1234567008, '2024-08-30', 50, 2.5, 4, 'sandwich.jpg', 0),
(9, 'Potato Chips', 'Crispy and salty potato chips.', 'Snacks', 1234567009, '2025-03-15', 300, 0.7, 1.2, 'potato_chips.jpg', 0),
(10, 'Bottle Water', '500ml bottled water.', 'Beverages', 1234567010, '2026-01-01', 500, 0.3, 0.6, 'bottle_water.jpg', 0),
(11, 'Test', 'Test', '1', 55654654, '0000-00-00', 5, 55, 0, '', 0),
(12, 'Test one more', 'Test one more', '1', 646546, '0000-00-00', 5, 55, 65, '', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `newproduct`
--
ALTER TABLE `newproduct`
  ADD PRIMARY KEY (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `newproduct`
--
ALTER TABLE `newproduct`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
