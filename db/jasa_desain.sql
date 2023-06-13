-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 13, 2023 at 02:46 PM
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
-- Database: `jasa_desain`
--

-- --------------------------------------------------------

--
-- Table structure for table `chat`
--

CREATE TABLE `chat` (
  `idChat` int(11) NOT NULL,
  `tanggalChat` date NOT NULL,
  `jam` datetime NOT NULL,
  `isiPesan` varchar(100) NOT NULL,
  `emailUser` varchar(30) NOT NULL,
  `emailPemilik` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `informasi_jasa`
--

CREATE TABLE `informasi_jasa` (
  `kategoriJasa` varchar(20) NOT NULL,
  `deskripsiJasa` varchar(100) NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `informasi_portofolio`
--

CREATE TABLE `informasi_portofolio` (
  `gambar` varchar(100) NOT NULL,
  `judul` varchar(20) NOT NULL,
  `deskripsiPortofolio` varchar(100) NOT NULL,
  `tanggalPortofolio` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `informasi_user`
--

CREATE TABLE `informasi_user` (
  `noTelpUser` varchar(15) NOT NULL,
  `namaUser` varchar(20) NOT NULL,
  `passwordUser` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jasa`
--

CREATE TABLE `jasa` (
  `idJasa` int(11) NOT NULL,
  `kategori` varchar(20) NOT NULL,
  `emailPemilik` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pemilik`
--

CREATE TABLE `pemilik` (
  `namaPemilik` varchar(20) NOT NULL,
  `emailPemilik` varchar(30) NOT NULL,
  `passwordPemilik` varchar(20) NOT NULL,
  `noTelpPemilik` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `portofolio`
--

CREATE TABLE `portofolio` (
  `idPortofolio` int(11) NOT NULL,
  `gambar` varchar(100) NOT NULL,
  `idJasa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `emailUser` varchar(30) NOT NULL,
  `noTelpUser` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_jasa`
--

CREATE TABLE `user_jasa` (
  `emailUser` varchar(30) NOT NULL,
  `idJasa` int(11) NOT NULL,
  `status` varchar(20) NOT NULL,
  `tanggalPermintaan` date NOT NULL,
  `deskripsiPermintaan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`idChat`),
  ADD KEY `chat_pemilik` (`emailPemilik`),
  ADD KEY `chat_user` (`emailUser`);

--
-- Indexes for table `informasi_jasa`
--
ALTER TABLE `informasi_jasa`
  ADD PRIMARY KEY (`kategoriJasa`),
  ADD KEY `kategoriJasa` (`kategoriJasa`);

--
-- Indexes for table `informasi_portofolio`
--
ALTER TABLE `informasi_portofolio`
  ADD PRIMARY KEY (`gambar`);

--
-- Indexes for table `informasi_user`
--
ALTER TABLE `informasi_user`
  ADD PRIMARY KEY (`noTelpUser`);

--
-- Indexes for table `jasa`
--
ALTER TABLE `jasa`
  ADD PRIMARY KEY (`idJasa`),
  ADD KEY `jasa_pemilik` (`emailPemilik`),
  ADD KEY `kategori` (`kategori`);

--
-- Indexes for table `pemilik`
--
ALTER TABLE `pemilik`
  ADD PRIMARY KEY (`emailPemilik`);

--
-- Indexes for table `portofolio`
--
ALTER TABLE `portofolio`
  ADD PRIMARY KEY (`idPortofolio`),
  ADD KEY `portofolio_jasa` (`idJasa`),
  ADD KEY `gambar` (`gambar`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`emailUser`),
  ADD KEY `noTelpUser_2` (`noTelpUser`),
  ADD KEY `noTelpUser` (`noTelpUser`);

--
-- Indexes for table `user_jasa`
--
ALTER TABLE `user_jasa`
  ADD PRIMARY KEY (`emailUser`,`idJasa`,`status`,`tanggalPermintaan`,`deskripsiPermintaan`),
  ADD KEY `userjasa_jasa` (`idJasa`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chat`
--
ALTER TABLE `chat`
  MODIFY `idChat` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jasa`
--
ALTER TABLE `jasa`
  MODIFY `idJasa` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `portofolio`
--
ALTER TABLE `portofolio`
  MODIFY `idPortofolio` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chat`
--
ALTER TABLE `chat`
  ADD CONSTRAINT `chat_pemilik` FOREIGN KEY (`emailPemilik`) REFERENCES `pemilik` (`emailPemilik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `chat_user` FOREIGN KEY (`emailUser`) REFERENCES `user` (`emailUser`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `informasi_jasa`
--
ALTER TABLE `informasi_jasa`
  ADD CONSTRAINT `fk_informasi_jasa` FOREIGN KEY (`kategoriJasa`) REFERENCES `jasa` (`kategori`) ON UPDATE CASCADE;

--
-- Constraints for table `informasi_portofolio`
--
ALTER TABLE `informasi_portofolio`
  ADD CONSTRAINT `fk_informasi_portofolio` FOREIGN KEY (`gambar`) REFERENCES `portofolio` (`gambar`) ON UPDATE CASCADE;

--
-- Constraints for table `informasi_user`
--
ALTER TABLE `informasi_user`
  ADD CONSTRAINT `fk_informasi_user` FOREIGN KEY (`noTelpUser`) REFERENCES `user` (`noTelpUser`) ON UPDATE CASCADE;

--
-- Constraints for table `jasa`
--
ALTER TABLE `jasa`
  ADD CONSTRAINT `jasa_pemilik` FOREIGN KEY (`emailPemilik`) REFERENCES `pemilik` (`emailPemilik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `portofolio`
--
ALTER TABLE `portofolio`
  ADD CONSTRAINT `portofolio_jasa` FOREIGN KEY (`idJasa`) REFERENCES `jasa` (`idJasa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_jasa`
--
ALTER TABLE `user_jasa`
  ADD CONSTRAINT `userjasa_jasa` FOREIGN KEY (`idJasa`) REFERENCES `jasa` (`idJasa`) ON UPDATE CASCADE,
  ADD CONSTRAINT `userjasa_user` FOREIGN KEY (`emailUser`) REFERENCES `user` (`emailUser`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
