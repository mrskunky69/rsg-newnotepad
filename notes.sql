





CREATE TABLE IF NOT EXISTS `notes` (
  `id` varchar(12) NOT NULL,
  `coords` varchar(255) DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_notes_coords` (`coords`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
