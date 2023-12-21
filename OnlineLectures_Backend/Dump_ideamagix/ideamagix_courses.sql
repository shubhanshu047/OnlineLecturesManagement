-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: ideamagix
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Cname` varchar(45) NOT NULL,
  `Clevel` varchar(45) NOT NULL,
  `Cdescription` varchar(255) DEFAULT NULL,
  `Cimage` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Cname_UNIQUE` (`Cname`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (8,'Java','Advanced','This is java full stack course covers all concept in detail.','https://th.bing.com/th/id/R.20503d65d917dc1330bfbafe405498c6?rik=n7sFSVw6OsBiXA&riu=http%3a%2f%2f4.bp.blogspot.com%2f-rLWryzyXD9s%2fTxbTBMnQm8I%2fAAAAAAAAJCM%2f2JXgWIDNjcE%2fs1600%2fjava.gif&ehk=YITVgdsfeWNEhwCtmNigEQLYNCwLKvcrSiN0BueqUm0%3d&risl=&pid=ImgRaw&r=0'),(9,'Python','Intermediate','This is python full stack course','https://th.bing.com/th/id/R.9d460ec0196c99cdb14cb98647305309?rik=%2b64YtxB0LZSCTg&riu=http%3a%2f%2fpluspng.com%2fimg-png%2fpython-logo-png-open-2000.png&ehk=OtjI1WIsGN2xW1l53b3QwDql%2fKrtBvqmXkwe8GhANPY%3d&risl=&pid=ImgRaw&r=0'),(13,'js','Advanced','This is java full stack course covers all concept in detail.','https://th.bing.com/th/id/R.20503d65d917dc1330bfbafe405498c6?rik=n7sFSVw6OsBiXA&riu=http%3a%2f%2f4.bp.blogspot.com%2f-rLWryzyXD9s%2fTxbTBMnQm8I%2fAAAAAAAAJCM%2f2JXgWIDNjcE%2fs1600%2fjava.gif&ehk=YITVgdsfeWNEhwCtmNigEQLYNCwLKvcrSiN0BueqUm0%3d&risl=&pid=ImgRaw&r=0');
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-21 18:10:31
