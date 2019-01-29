-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 18, 2018 at 08:19 PM
-- Server version: 10.1.33-MariaDB
-- PHP Version: 7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ec021_av2_bestflix`
--
DROP DATABASE IF EXISTS `ec021_av2_bestflix`;
CREATE DATABASE IF NOT EXISTS `ec021_av2_bestflix` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `ec021_av2_bestflix`;

-- --------------------------------------------------------

--
-- Table structure for table `filme`
--

DROP TABLE IF EXISTS `filme`;
CREATE TABLE `filme` (
  `filme_id` int(11) NOT NULL,
  `titulo` text NOT NULL,
  `ano_lancamento` text NOT NULL,
  `genero_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `filme`
--

INSERT INTO `filme` (`filme_id`, `titulo`, `ano_lancamento`, `genero_id`) VALUES
(1, 'As Branquelas', '2004', 1),
(2, 'Se beber, não case!', '2009', 1),
(3, 'Missão Madrinha de Casamento', '2011', 1),
(4, 'Anjos da Lei', '2012', 1),
(5, 'It: a Coisa', '2017', 2),
(6, 'O Massacre da Serra Elétrica', '1974', 2),
(7, 'Corrente do Mal', '2014', 2),
(8, 'A Noite dos Mortos -Vivos', '1968', 2),
(9, 'O Chamado', '2002', 2),
(10, 'Psicose', '1960', 2),
(11, 'Os Goonies', '1985', 3),
(12, 'Valente', '2012', 3),
(13, 'A Era do Gelo', '2002', 3),
(14, 'Meu Malvado Favorito', '2010', 3),
(15, 'Vida de Inseto', '1998', 3),
(16, 'Frozen', '2013', 3),
(17, 'Kingsman: Serviço Secreto', '2015', 4),
(18, 'Dunkirk', '2017', 4),
(19, 'A Identidade Bourne', '2002', 4),
(20, 'Os Mercenários', '2010', 4),
(21, 'Atômica', '2017', 4),
(22, 'O Poderoso Chefão ', '1972', 5),
(23, 'Um Sonho de Liberdade ', '1995', 5),
(24, 'A Vida é Bela ', '1999', 5),
(25, 'Sempre ao Seu Lado ', '2009', 5);

-- --------------------------------------------------------

--
-- Table structure for table `genero`
--

DROP TABLE IF EXISTS `genero`;
CREATE TABLE `genero` (
  `genero_id` int(11) NOT NULL,
  `descricao` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `genero`
--

INSERT INTO `genero` (`genero_id`, `descricao`) VALUES
(1, 'Comédia'),
(2, 'Terror'),
(3, 'Infantil'),
(4, 'Ação'),
(5, 'Drama');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `filme`
--
ALTER TABLE `filme`
  ADD PRIMARY KEY (`filme_id`),
  ADD KEY `fk_genero_filme` (`genero_id`);

--
-- Indexes for table `genero`
--
ALTER TABLE `genero`
  ADD PRIMARY KEY (`genero_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `filme`
--
ALTER TABLE `filme`
  MODIFY `filme_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `genero`
--
ALTER TABLE `genero`
  MODIFY `genero_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `filme`
--
ALTER TABLE `filme`
  ADD CONSTRAINT `fk_genero_filme` FOREIGN KEY (`genero_id`) REFERENCES `genero` (`genero_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
