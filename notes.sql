-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.32-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for rexshackredmbuild_c50ff1
CREATE DATABASE IF NOT EXISTS `rexshackredmbuild_c50ff1` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `rexshackredmbuild_c50ff1`;

-- Dumping structure for table rexshackredmbuild_c50ff1.notes
CREATE TABLE IF NOT EXISTS `notes` (
  `id` varchar(12) NOT NULL,
  `coords` varchar(255) DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_notes_coords` (`coords`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table rexshackredmbuild_c50ff1.notes: ~3 rows (approximately)
INSERT INTO `notes` (`id`, `coords`, `creator`, `message`) VALUES
	('3CO0yqM9gajH', '{"x":-275.42974853515627,"y":798.5065307617188,"z":118.98703002929688,"w":63.42466735839844}', 'MAD DOG', 'aaaaaaaaaaa'),
	('BcJBhbXj9zSB', '{"x":-276.56268310546877,"y":799.4754028320313,"z":119.33863830566406,"w":324.5085144042969}', 'MAD DOG', 'aaaaaaaaaaaaa'),
	('EJqDxvVlxOPq', '{"x":-293.8284912109375,"y":794.9595947265625,"z":118.59210205078125,"w":98.94083404541016}', 'MAD DOG', 'aaaaaaaaaaaaa');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
