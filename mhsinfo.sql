-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 05, 2025 at 01:34 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mhsinfo`
--

-- --------------------------------------------------------

--
-- Table structure for table `ambilkuliah`
--

CREATE TABLE `ambilkuliah` (
  `nomor` int(4) NOT NULL,
  `kdmk` varchar(7) NOT NULL,
  `npm` int(5) NOT NULL,
  `tahunakademik` varchar(9) DEFAULT NULL,
  `kehadiran` int(3) DEFAULT NULL,
  `tugas` int(3) DEFAULT NULL,
  `uts` int(3) DEFAULT NULL,
  `uas` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ambilkuliah`
--

INSERT INTO `ambilkuliah` (`nomor`, `kdmk`, `npm`, `tahunakademik`, `kehadiran`, `tugas`, `uts`, `uas`) VALUES
(12, 'mkb3301', 2147483647, '2026/2027', 100, 100, 100, 100);

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `npm` int(11) NOT NULL,
  `nmms` varchar(20) DEFAULT NULL,
  `jenkel` enum('L','P') DEFAULT NULL,
  `prodi` enum('TI','SI','TKJ','TPRT') DEFAULT NULL,
  `alamat` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`npm`, `nmms`, `jenkel`, `prodi`, `alamat`) VALUES
(2147483647, 'randy', 'L', 'TI', 'Bantarsari');

-- --------------------------------------------------------

--
-- Table structure for table `matamatakuliah`
--

CREATE TABLE `matamatakuliah` (
  `kdmk` varchar(7) NOT NULL,
  `nmmk` varchar(30) DEFAULT NULL,
  `sks` int(1) DEFAULT NULL,
  `semester` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `matamatakuliah`
--

INSERT INTO `matamatakuliah` (`kdmk`, `nmmk`, `sks`, `semester`) VALUES
('mkb3301', 'Pendidikan Linkgungan Hidup', 6, 7);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ambilkuliah`
--
ALTER TABLE `ambilkuliah`
  ADD PRIMARY KEY (`nomor`),
  ADD KEY `fk_kdmk` (`kdmk`),
  ADD KEY `fk_npm` (`npm`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`npm`);

--
-- Indexes for table `matamatakuliah`
--
ALTER TABLE `matamatakuliah`
  ADD PRIMARY KEY (`kdmk`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  MODIFY `npm` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2147483648;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ambilkuliah`
--
ALTER TABLE `ambilkuliah`
  ADD CONSTRAINT `fk_kdmk` FOREIGN KEY (`kdmk`) REFERENCES `matamatakuliah` (`kdmk`),
  ADD CONSTRAINT `fk_npm` FOREIGN KEY (`npm`) REFERENCES `mahasiswa` (`npm`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
