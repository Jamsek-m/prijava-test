-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Gostitelj: localhost
-- Čas nastanka: 06. nov 2016 ob 00.54
-- Različica strežnika: 5.7.16-0ubuntu0.16.04.1
-- Različica PHP: 7.0.8-0ubuntu0.16.04.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Zbirka podatkov: `learning`
--
CREATE DATABASE IF NOT EXISTS `learning` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `learning`;

-- --------------------------------------------------------

--
-- Struktura tabele `TEST_USERS`
--

CREATE TABLE `TEST_USERS` (
  `USER_ID` int(11) NOT NULL,
  `USER_NAME` varchar(200) NOT NULL,
  `USER_PASS` varchar(200) NOT NULL,
  `USER_DIS_NAME` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Odloži podatke za tabelo `TEST_USERS`
--

INSERT INTO `TEST_USERS` (`USER_ID`, `USER_NAME`, `USER_PASS`, `USER_DIS_NAME`) VALUES
(4, '15kol', 'ff19f40c394db57bf041ebf168d807e945509b0490ea74741d8ada52005c2c2c', 'Miha'),
(5, 'janez', '46e42b867f5573ffa950ac2bd2f31352c221b34b04eb7822ce81e386f882370b', 'Janez');

--
-- Indeksi zavrženih tabel
--

--
-- Indeksi tabele `TEST_USERS`
--
ALTER TABLE `TEST_USERS`
  ADD PRIMARY KEY (`USER_ID`);

--
-- AUTO_INCREMENT zavrženih tabel
--

--
-- AUTO_INCREMENT tabele `TEST_USERS`
--
ALTER TABLE `TEST_USERS`
  MODIFY `USER_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
