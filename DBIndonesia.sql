-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 18, 2018 at 11:21 AM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `DBIndonesia`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_favoriteFood`
--

CREATE TABLE `tb_favoriteFood` (
  `person_id` varchar(10) NOT NULL,
  `food_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_food`
--

CREATE TABLE `tb_food` (
  `food_id` int(10) NOT NULL,
  `name` varchar(25) NOT NULL,
  `price` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_food`
--

INSERT INTO `tb_food` (`food_id`, `name`, `price`) VALUES
(1, 'Nasi Kuning', '12000'),
(2, 'Nasi Pecel', '8000'),
(3, 'Dendeng Kering', '6000'),
(4, 'Ayam Bakar', '11000'),
(5, 'Ikan Asam Pedas', '7000'),
(6, 'Lontong Sayur', '10000'),
(7, 'Gado Gado', '10000'),
(8, 'Nasi Uduk', '15000'),
(9, 'Udang Bakar', '15000'),
(10, 'Ubi Goreng', '13000');

-- --------------------------------------------------------

--
-- Table structure for table `tb_person`
--

CREATE TABLE `tb_person` (
  `person_id` varchar(10) NOT NULL,
  `f_name` varchar(35) DEFAULT NULL,
  `l_name` varchar(40) DEFAULT NULL,
  `sex` enum('M','F') DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `city_id` smallint(11) DEFAULT NULL,
  `state_id` tinyint(5) DEFAULT NULL,
  `id_favFood` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_person`
--

INSERT INTO `tb_person` (`person_id`, `f_name`, `l_name`, `sex`, `birth_date`, `address`, `city_id`, `state_id`, `id_favFood`) VALUES
('1', 'Naufel', 'Abiyyu', 'M', '2015-02-01', 'jl. Hang Tuah no 2', 1, 2, 1),
('10', 'Ali', 'Abdurrahman', 'M', '2001-08-17', 'Jl. Batam No 90', 8, 17, 2),
('2', 'Yusron', 'Zahir', 'M', '2014-02-26', 'jl Kemerdekaan no 7', 9, 12, 3),
('3', 'Ihsan', 'Al Jundi', 'M', '1999-03-15', 'Jl Payakumbuh no 13', 5, 9, 4),
('4', 'Farras', 'Abiyyu', 'M', '2002-04-29', 'Jl. Bumi Sakinah No. 18', 15, 21, 5),
('5', 'Aisyah', 'Fatimah', 'F', '2001-02-27', 'Jl. Bengawan No.11', 8, 16, 6),
('6', 'Arjuna', 'Wika', 'M', '1990-02-21', 'Jl Bekasi No 13', 11, 33, 7),
('7', 'Abi', 'Sayuti', 'M', '1992-05-23', 'Jl Samarinda No 13', 9, 23, 5),
('8', 'Haidar', 'Rais', 'M', '1993-07-17', 'Jl Cibubur No 21', 11, 9, 8),
('9', 'Sam', 'Pramudana', 'M', '2002-10-20', 'Jl. Jatiasih No 12', 6, 12, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_favoriteFood`
--
ALTER TABLE `tb_favoriteFood`
  ADD PRIMARY KEY (`food_id`);

--
-- Indexes for table `tb_food`
--
ALTER TABLE `tb_food`
  ADD PRIMARY KEY (`food_id`);

--
-- Indexes for table `tb_person`
--
ALTER TABLE `tb_person`
  ADD PRIMARY KEY (`person_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_food`
--
ALTER TABLE `tb_food`
  MODIFY `food_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
