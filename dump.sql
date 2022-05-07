-- MariaDB dump 10.19  Distrib 10.6.5-MariaDB, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: test
-- ------------------------------------------------------
-- Server version	10.6.5-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client` (
  `id_client` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identifiant du client',
  `id_contact` int(11) NOT NULL COMMENT 'FOREIGN KEY : Identifiant du contact',
  `id_pays` int(11) NOT NULL COMMENT 'FOREIGN KEY : Identifiant du pays',
  `fld_raisonSociale` varchar(255) DEFAULT NULL COMMENT 'Raison sociale du client',
  `fld_dateCreation` datetime NOT NULL COMMENT 'Date de création du client',
  PRIMARY KEY (`id_client`),
  KEY `FK_ContactClient` (`id_contact`),
  KEY `FK_PaysClient` (`id_pays`),
  CONSTRAINT `FK_ContactClient` FOREIGN KEY (`id_contact`) REFERENCES `contact` (`id_contact`),
  CONSTRAINT `FK_PaysClient` FOREIGN KEY (`id_pays`) REFERENCES `pays` (`id_pays`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COMMENT='Table des clients';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,1,55,NULL,'2022-03-02 12:05:00'),(2,23,2,'SARL DUPONT','1990-05-16 00:08:16'),(3,38,5,NULL,'2012-12-08 15:01:34'),(4,28,8,'SARL TINTIN','2001-09-06 00:05:52'),(5,9,3,'ATELIER ROULEMENT','2004-11-21 17:17:22'),(6,44,6,NULL,'1994-02-21 00:50:53'),(7,6,5,'GARAGE 123','1993-08-17 08:53:42'),(8,14,9,NULL,'1978-09-09 12:57:54'),(9,5,1,NULL,'1972-12-15 10:06:26'),(10,33,6,'ASSOCIATION IT','1985-03-24 08:00:08');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commande`
--

DROP TABLE IF EXISTS `commande`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commande` (
  `id_commande` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identifiant de la commande',
  `id_client` int(11) NOT NULL COMMENT 'FOREIGN KEY : Identifiant du client',
  `id_contact` int(11) NOT NULL COMMENT 'FOREIGN KEY : Identifiant du contact',
  `fld_montant` decimal(10,2) NOT NULL COMMENT 'Montant de la commande',
  `fld_montantFraisDePort` decimal(10,2) NOT NULL COMMENT 'Frais de port de la commande',
  `fld_preparee` tinyint(1) NOT NULL COMMENT 'Permet de savoir si la commande est préparée',
  `fld_expediee` tinyint(1) NOT NULL COMMENT 'Permet de savoir si la commande est expediée',
  `fld_dateCreation` datetime NOT NULL COMMENT 'Date de création de la commande',
  `fld_datePreparation` datetime DEFAULT NULL COMMENT 'Date de préparation de la commande',
  `fld_datePaiement` datetime DEFAULT NULL COMMENT 'Date de paiement de la commande',
  `fld_dateExpedition` datetime DEFAULT NULL COMMENT 'Date expedition de la commande',
  PRIMARY KEY (`id_commande`),
  KEY `FK_ClientCommande` (`id_client`),
  KEY `FK_ContactCommande` (`id_contact`),
  CONSTRAINT `FK_ClientCommande` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`),
  CONSTRAINT `FK_ContactCommande` FOREIGN KEY (`id_contact`) REFERENCES `contact` (`id_contact`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb3 COMMENT='Table des commandes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commande`
--

LOCK TABLES `commande` WRITE;
/*!40000 ALTER TABLE `commande` DISABLE KEYS */;
INSERT INTO `commande` VALUES (1,4,11,695.07,9.42,1,1,'2005-01-23 22:04:22','2005-01-25 02:36:22','2005-01-23 22:36:22','2005-01-25 17:36:22'),(2,10,35,238.02,30.35,1,0,'2015-07-11 11:52:33','2015-07-12 13:35:33','2015-07-11 12:35:33',NULL),(3,2,45,705.68,18.34,1,0,'2022-03-02 13:38:15','2022-03-04 07:38:15','2022-03-02 13:38:15',NULL),(4,7,19,12.27,29.74,1,0,'2022-03-02 13:38:15','2022-03-04 06:29:15','2022-03-02 15:29:15',NULL),(5,3,38,316.76,7.23,1,0,'2020-08-23 08:56:48','2020-08-24 06:14:48','2020-08-23 10:14:48',NULL),(6,5,4,360.86,31.84,1,0,'2022-03-02 13:38:15','2022-03-03 22:36:15','2022-03-02 14:36:15',NULL),(7,9,2,259.21,11.53,1,0,'2022-03-02 13:38:15','2022-03-02 20:32:15','2022-03-02 14:32:15',NULL),(8,3,12,139.55,29.89,0,0,'2004-05-14 15:10:32',NULL,'2004-05-14 16:50:32',NULL),(9,2,45,253.66,20.59,1,1,'2001-11-25 11:07:48','2001-11-26 14:46:48','2001-11-25 12:46:48','2001-11-27 07:46:48'),(10,2,23,1036.72,18.17,0,0,'2019-05-15 06:36:30',NULL,'2019-05-15 07:55:30',NULL),(11,4,28,937.87,25.98,0,0,'2001-04-22 00:37:50',NULL,'2001-04-22 02:12:50',NULL),(12,4,24,835.63,19.41,1,1,'2011-10-01 00:01:25','2011-10-01 18:05:25','2011-10-01 00:05:25','2011-10-02 12:05:25'),(13,6,44,916.84,32.40,1,1,'2022-03-02 13:38:15','2022-03-03 03:07:15','2022-03-02 15:07:15','2022-03-03 16:07:15'),(14,3,8,92.69,10.61,0,0,'2005-05-11 04:43:59',NULL,'2005-05-11 06:03:59',NULL),(15,7,19,243.71,39.17,0,0,'2007-06-26 14:53:53',NULL,'2007-06-26 15:04:53',NULL),(16,10,35,1038.65,35.29,1,1,'2022-03-02 13:38:15','2022-03-02 19:33:15','2022-03-02 14:33:15','2022-03-03 05:33:15'),(17,10,35,313.48,35.07,0,0,'2022-03-02 13:38:15',NULL,'2022-03-02 13:41:15',NULL),(18,3,12,236.00,10.96,1,0,'2022-03-02 13:38:15','2022-03-04 01:08:15','2022-03-02 15:08:15',NULL),(19,8,14,724.62,28.45,1,0,'2006-05-20 03:25:07','2006-05-20 20:48:07','2006-05-20 04:48:07',NULL),(20,5,20,588.60,15.75,0,0,'2010-11-09 07:11:51',NULL,'2010-11-09 07:36:51',NULL),(21,6,44,773.18,34.18,1,0,'2022-03-02 13:38:15','2022-03-03 16:36:15','2022-03-02 15:36:15',NULL),(22,5,34,526.52,7.78,1,1,'2022-03-02 13:38:15','2022-03-03 17:16:15','2022-03-02 14:16:15','2022-03-04 04:16:15'),(23,6,44,931.33,9.78,1,0,'2000-03-17 23:13:59','2000-03-18 12:29:59','2000-03-18 00:29:59',NULL),(24,6,48,314.11,5.22,0,0,'2001-07-19 09:42:24',NULL,'2001-07-19 10:08:24',NULL),(25,10,35,773.24,26.48,1,0,'2022-03-02 13:38:15','2022-03-03 17:00:15','2022-03-02 14:00:15',NULL),(26,5,4,370.24,17.20,0,0,'2013-07-17 02:53:26',NULL,'2013-07-17 03:25:26',NULL),(27,4,11,872.24,28.77,0,0,'2022-03-02 13:38:15',NULL,'2022-03-02 15:13:15',NULL),(28,8,14,277.56,39.15,0,0,'2022-03-02 13:38:15',NULL,'2022-03-02 14:01:15',NULL),(29,7,43,846.50,32.89,1,0,'2015-03-30 18:05:15','2015-03-31 00:15:15','2015-03-30 19:15:15',NULL),(30,9,3,897.71,21.48,1,1,'2010-01-13 01:38:22','2010-01-14 14:18:22','2010-01-13 02:18:22','2010-01-14 15:18:22'),(31,4,28,370.04,25.84,1,0,'2002-11-02 03:36:21','2002-11-03 07:29:21','2002-11-02 05:29:21',NULL),(32,2,41,711.17,12.84,0,0,'2012-06-02 08:49:35',NULL,'2012-06-02 10:15:35',NULL),(33,2,16,454.44,9.80,0,0,'2022-03-02 13:38:15',NULL,'2022-03-02 15:09:15',NULL),(34,7,43,548.88,19.21,0,0,'2022-03-02 13:38:15',NULL,'2022-03-02 14:57:15',NULL),(35,8,7,823.91,25.94,1,0,'2022-03-02 13:38:15','2022-03-03 07:40:15','2022-03-02 13:40:15',NULL),(36,7,6,1001.79,38.24,1,0,'2022-03-02 13:38:15','2022-03-03 04:50:15','2022-03-02 13:50:15',NULL),(37,5,20,79.53,20.11,0,0,'2022-03-02 13:38:15',NULL,'2022-03-02 14:32:15',NULL),(38,6,48,333.83,20.83,0,0,'2014-12-28 21:51:01',NULL,'2014-12-28 23:48:01',NULL),(39,7,19,312.18,6.35,0,0,'2022-03-02 13:38:15',NULL,'2022-03-02 14:43:15',NULL),(40,6,44,406.17,40.64,0,0,'2022-03-02 13:38:15',NULL,'2022-03-02 15:13:15',NULL),(41,6,44,996.65,22.85,0,0,'2022-03-02 13:38:15',NULL,'2022-03-02 14:21:15',NULL),(42,6,44,856.20,6.70,0,0,'2001-02-17 17:19:15',NULL,'2001-02-17 18:06:15',NULL),(43,8,14,187.16,37.53,1,0,'2022-03-02 13:38:15','2022-03-03 09:27:15','2022-03-02 15:27:15',NULL),(44,6,44,268.83,32.74,1,0,'2001-01-13 13:21:18','2001-01-15 10:06:18','2001-01-13 14:06:18',NULL),(45,6,48,676.51,9.82,0,0,'2022-03-02 13:38:15',NULL,'2022-03-02 13:58:15',NULL),(46,4,24,500.38,31.98,1,1,'2022-03-02 13:38:15','2022-03-03 15:01:15','2022-03-02 15:01:15','2022-03-04 07:01:15'),(47,6,48,452.64,35.08,1,1,'2022-03-02 13:38:15','2022-03-04 01:36:15','2022-03-02 15:36:15','2022-03-04 11:36:15'),(48,10,32,908.65,5.33,0,0,'2022-03-02 13:38:15',NULL,'2022-03-02 15:23:15',NULL),(49,9,5,710.83,6.92,0,0,'2022-03-02 13:38:15',NULL,'2022-03-02 14:31:15',NULL),(50,9,22,1039.83,19.56,0,0,'2022-03-02 13:38:15',NULL,'2022-03-02 14:46:15',NULL),(51,6,44,372.46,22.64,0,0,'2022-03-02 13:38:15',NULL,'2022-03-02 14:42:15',NULL),(52,5,34,344.05,14.73,0,0,'2006-09-19 10:33:22',NULL,'2006-09-19 12:29:22',NULL),(53,6,44,500.60,33.78,0,0,'2020-08-29 19:04:23',NULL,'2020-08-29 19:33:23',NULL),(54,9,2,656.61,23.26,0,0,'2011-06-27 06:27:34',NULL,'2011-06-27 07:05:34',NULL),(55,9,3,564.27,20.68,1,0,'2002-11-04 16:03:04','2002-11-04 21:45:04','2002-11-04 17:45:04',NULL),(56,4,11,343.62,27.86,0,0,'2000-03-21 21:47:32',NULL,'2000-03-21 22:29:32',NULL),(57,8,14,139.58,35.16,0,0,'2018-02-14 22:03:43',NULL,'2018-02-14 22:24:43',NULL),(58,7,43,855.40,28.63,1,1,'2022-03-02 13:38:15','2022-03-03 01:17:15','2022-03-02 15:17:15','2022-03-03 04:17:15'),(59,8,7,166.74,33.76,0,0,'2022-03-02 13:38:15',NULL,'2022-03-02 14:55:15',NULL),(60,3,12,29.36,13.56,0,0,'2022-03-02 13:38:15',NULL,'2022-03-02 15:06:15',NULL),(61,10,33,231.43,16.03,0,0,'2016-01-07 12:09:07',NULL,'2016-01-07 13:40:07',NULL),(62,8,14,782.68,22.19,1,1,'2002-07-08 16:09:54','2002-07-10 08:21:54','2002-07-08 17:21:54','2002-07-10 12:21:54'),(63,4,28,802.45,23.52,0,0,'2022-03-02 13:38:15',NULL,'2022-03-02 15:07:15',NULL),(64,9,5,1028.23,20.51,0,0,'2022-03-02 13:38:15',NULL,'2022-03-02 15:29:15',NULL),(65,9,22,420.65,3.53,0,0,'2022-03-02 13:38:15',NULL,'2022-03-02 14:27:15',NULL),(66,4,24,169.68,9.07,1,0,'2007-07-18 23:28:32','2007-07-20 00:02:32','2007-07-19 00:02:32',NULL),(67,4,11,1007.14,32.33,0,0,'2022-03-02 13:38:15',NULL,'2022-03-02 13:58:15',NULL),(68,4,28,427.55,39.45,1,0,'2020-08-02 08:09:39','2020-08-02 12:11:39','2020-08-02 08:11:39',NULL),(69,3,8,945.22,27.89,0,0,'2022-03-02 13:38:15',NULL,'2022-03-02 14:45:15',NULL),(70,4,24,404.23,23.03,0,0,'2022-03-02 13:38:15',NULL,'2022-03-02 15:09:15',NULL),(71,8,14,949.37,13.21,1,1,'2000-10-24 18:55:09','2000-10-26 11:14:09','2000-10-24 19:14:09','2000-10-26 23:14:09'),(72,3,38,978.40,39.33,1,1,'2013-11-30 18:44:37','2013-11-30 20:45:37','2013-11-30 19:45:37','2013-12-01 19:45:37'),(73,7,6,890.76,38.04,0,0,'2022-03-02 13:38:15',NULL,'2022-03-02 13:46:15',NULL),(74,10,35,471.78,10.22,1,0,'2001-03-22 23:53:51','2001-03-24 02:28:51','2001-03-23 01:28:51',NULL),(75,9,2,884.77,38.07,1,0,'2004-03-25 01:48:00','2004-03-26 07:23:00','2004-03-25 03:23:00',NULL),(76,7,19,588.82,29.23,1,1,'2008-12-29 17:51:35','2008-12-30 12:01:35','2008-12-29 19:01:35','2008-12-30 20:01:35'),(77,5,4,15.41,7.27,1,1,'2022-03-02 13:38:15','2022-03-04 12:47:15','2022-03-02 14:47:15','2022-03-05 08:47:15'),(78,6,44,422.54,23.50,0,0,'2022-03-02 13:38:15',NULL,'2022-03-02 13:52:15',NULL),(79,7,43,438.83,33.18,1,1,'2022-03-02 13:38:15','2022-03-04 05:21:15','2022-03-02 15:21:15','2022-03-04 09:21:15'),(80,7,19,249.20,20.70,1,0,'2012-06-24 04:50:57','2012-06-24 12:47:57','2012-06-24 06:47:57',NULL),(81,5,20,23.85,19.33,1,0,'2022-03-02 13:38:15','2022-03-02 22:18:15','2022-03-02 14:18:15',NULL),(82,9,3,769.52,6.34,1,0,'2002-02-10 09:06:42','2002-02-11 08:30:42','2002-02-10 10:30:42',NULL),(83,6,48,387.98,37.04,0,0,'2022-03-02 13:38:15',NULL,'2022-03-02 14:43:15',NULL),(84,6,44,143.33,29.61,0,0,'2022-03-02 13:38:15',NULL,'2022-03-02 14:51:15',NULL),(85,9,5,382.27,39.39,1,1,'2006-10-05 22:44:02','2006-10-07 12:36:02','2006-10-05 23:36:02','2006-10-07 20:36:02'),(86,8,14,865.56,22.88,0,0,'2022-03-02 13:38:15',NULL,'2022-03-02 14:18:15',NULL),(87,10,37,817.47,14.63,1,1,'2022-03-02 13:38:15','2022-03-03 17:22:15','2022-03-02 14:22:15','2022-03-03 20:22:15'),(88,3,12,452.60,6.87,0,0,'2022-03-02 13:38:15',NULL,'2022-03-02 15:19:15',NULL),(89,10,32,886.14,25.33,0,0,'2022-03-02 13:38:15',NULL,'2022-03-02 13:54:15',NULL),(90,9,22,688.80,19.63,0,0,'2022-03-02 13:38:15',NULL,'2022-03-02 13:55:15',NULL),(91,9,2,530.55,10.44,0,0,'2022-03-02 13:38:15',NULL,'2022-03-02 14:13:15',NULL),(92,6,44,256.44,38.31,0,0,'2019-02-11 02:21:38',NULL,'2019-02-11 02:26:38',NULL),(93,2,10,729.59,20.54,1,1,'2012-09-03 08:09:48','2012-09-04 08:52:48','2012-09-03 08:52:48','2012-09-04 22:52:48'),(94,7,19,206.22,29.80,0,0,'2022-03-02 13:38:15',NULL,'2022-03-02 14:57:15',NULL),(95,3,12,36.50,20.92,0,0,'2022-03-02 13:38:15',NULL,'2022-03-02 14:08:15',NULL),(96,5,20,616.23,30.05,0,0,'2022-03-02 13:38:15',NULL,'2022-03-02 14:09:15',NULL),(97,5,4,288.62,8.55,1,0,'2022-03-02 13:38:15','2022-03-04 03:45:15','2022-03-02 14:45:15',NULL),(98,10,33,78.37,16.75,1,0,'2022-03-02 13:38:15','2022-03-03 09:41:15','2022-03-02 13:41:15',NULL),(99,4,11,374.01,6.68,0,0,'2022-03-02 13:38:15',NULL,'2022-03-02 14:32:15',NULL),(100,6,48,866.42,18.54,1,1,'2004-09-22 18:05:17','2004-09-24 03:27:17','2004-09-22 18:27:17','2004-09-24 16:27:17'),(101,8,14,418.59,28.70,1,0,'2011-08-16 00:58:21','2011-08-16 14:04:21','2011-08-16 02:04:21',NULL),(102,4,28,232.59,27.82,1,0,'2022-03-02 13:38:15','2022-03-02 23:07:15','2022-03-02 14:07:15',NULL),(103,5,20,1027.17,14.74,0,0,'2022-03-02 13:38:15',NULL,'2022-03-02 14:44:15',NULL),(104,6,44,24.80,28.67,1,0,'2022-03-02 13:38:15','2022-03-02 21:44:15','2022-03-02 13:44:15',NULL),(105,4,24,930.32,23.21,0,0,'2022-03-02 13:38:15',NULL,'2022-03-02 14:46:15',NULL),(106,4,11,989.19,28.24,0,0,'2022-03-02 13:38:15',NULL,'2022-03-02 15:06:15',NULL),(107,6,44,35.18,8.35,0,0,'2001-11-04 22:08:22',NULL,'2001-11-05 00:03:22',NULL),(108,10,35,114.75,3.60,0,0,'2006-08-25 20:15:12',NULL,'2006-08-25 21:31:12',NULL),(109,5,34,448.91,11.48,0,0,'2009-06-10 05:02:24',NULL,'2009-06-10 05:34:24',NULL),(110,3,12,1012.58,10.60,0,0,'2019-09-02 09:43:34',NULL,'2019-09-02 10:38:34',NULL),(111,6,44,176.62,36.41,0,0,'2022-03-02 13:38:15',NULL,'2022-03-02 14:35:15',NULL),(112,8,7,151.75,7.54,0,0,'2022-03-02 13:38:15',NULL,'2022-03-02 13:43:15',NULL),(113,6,44,749.72,10.00,1,1,'2009-01-23 22:27:54','2009-01-24 11:56:54','2009-01-23 23:56:54','2009-01-25 09:56:54'),(114,6,48,233.57,27.52,0,0,'2022-03-02 13:38:15',NULL,'2022-03-02 14:54:15',NULL),(115,4,28,229.55,16.14,0,0,'2022-03-02 13:38:15',NULL,'2022-03-02 15:31:15',NULL),(116,8,14,462.87,33.80,1,1,'2009-08-01 20:00:24','2009-08-03 07:41:24','2009-08-01 21:41:24','2009-08-03 08:41:24'),(117,5,34,288.37,26.46,1,0,'2022-03-02 13:38:15','2022-03-04 06:25:15','2022-03-02 14:25:15',NULL),(118,4,24,419.25,31.85,0,0,'2022-03-02 13:38:15',NULL,'2022-03-02 14:29:15',NULL),(119,9,3,510.29,22.25,1,1,'2022-03-02 13:38:15','2022-03-02 18:33:15','2022-03-02 15:33:15','2022-03-03 04:33:15'),(120,9,22,966.32,28.67,0,0,'2022-03-02 13:38:15',NULL,'2022-03-02 14:45:15',NULL);
/*!40000 ALTER TABLE `commande` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact` (
  `id_client` int(11) NOT NULL COMMENT 'FOREIGN KEY : Identifiant du client',
  `id_contact` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identifiant du contact',
  `id_pays` int(11) NOT NULL COMMENT 'FOREIGN KEY : Identifiant du pays',
  `fld_nom` varchar(50) NOT NULL COMMENT 'Nom du contact',
  `fld_prenom` varchar(30) NOT NULL COMMENT 'Prenom du contact',
  `fld_mail` varchar(255) NOT NULL COMMENT 'Email du contact',
  `fld_telephone` varchar(15) DEFAULT NULL COMMENT 'Numéro de téléphone du contact',
  `fld_dateCreation` datetime NOT NULL COMMENT 'Date de création du contact',
  PRIMARY KEY (`id_contact`),
  KEY `FK_ClientContact` (`id_client`),
  KEY `FK_PaysContact` (`id_pays`),
  CONSTRAINT `FK_ClientContact` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`),
  CONSTRAINT `FK_PaysContact` FOREIGN KEY (`id_pays`) REFERENCES `pays` (`id_pays`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb3 COMMENT='Table des contacts';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
INSERT INTO `contact` VALUES (1,1,55,'Default','Client','default.client@123roulement.fr',NULL,'2022-03-02 12:05:00'),(9,2,100,'Torval','Linus','torval.linus@123roulement.fr','+33122334455','1988-09-12 04:00:45'),(9,3,15,'Anderson','Thomas','anderson.thomas@123roulement.fr','+33123546455','2017-05-03 21:58:17'),(5,4,17,'Apeupret','Jean Michel','apeupret.jean michel@123roulement.fr','+34918589144\n','2017-11-30 06:35:16'),(9,5,42,'Perceval','Peredur','perceval.peredur@123roulement.fr','+32907783317','2020-01-20 20:13:51'),(7,6,169,'Jobs','Steve','jobs.steve@123roulement.fr','+33958000786','2003-03-18 04:32:09'),(8,7,15,'Gates','Bill','gates.bill@123roulement.fr','+33972958353','1973-09-02 04:05:52'),(3,8,104,'Gandalf','Olorin','gandalf.olorin@123roulement.fr',NULL,'1976-08-09 17:34:12'),(5,9,23,'Jedusor','Tom','jedusor.tom@123roulement.fr','+32990293351','1994-08-14 22:28:23'),(2,10,86,'Potter','Harry','potter.harry@123roulement.fr','+32909611808','1975-09-15 14:53:53'),(4,11,81,'Granger','Hermione','granger.hermione@123roulement.fr','+33955675571','1997-11-05 02:06:08'),(3,12,148,'Wesley','Ronald','wesley.ronald@123roulement.fr','+31936015853','1979-04-25 02:58:49'),(3,13,142,'Wayne','Bruce','wayne.bruce@123roulement.fr','+32987320066','1999-09-11 01:35:42'),(8,14,78,'Wilson','Wade','wilson.wade@123roulement.fr','+33956800938','2012-09-14 00:01:03'),(3,15,91,'Tiberius','James','tiberius.james@123roulement.fr','+32954516849','1997-08-07 06:16:32'),(2,16,49,'Solo','Anne','solo.anne@123roulement.fr','+33758528097','1980-12-02 05:31:44'),(5,17,155,'Baca','Chou','baca.chou@123roulement.fr',NULL,'2017-07-20 01:58:50'),(4,18,15,'Skywalker','Luc','skywalker.luc@123roulement.fr','+33598499230','1976-02-17 00:34:38'),(7,19,154,'Dark','Vador','dark.vador@123roulement.fr',NULL,'2000-10-05 03:47:52'),(5,20,119,'Jones','Idiana','jones.idiana@123roulement.fr',NULL,'1998-05-24 12:36:41'),(9,21,92,'Corleon','Michael','corleon.michael@123roulement.fr',NULL,'2021-02-14 02:01:09'),(9,22,119,'Corleon','Vito','corleon.vito@123roulement.fr','+33188443501','2003-04-20 07:54:34'),(2,23,150,'Ford','Henry','ford.henry@123roulement.fr','+33756421206','1977-02-06 05:15:18'),(4,24,120,'Gator','Ali','gator.ali@123roulement.fr',NULL,'1973-06-18 19:55:09'),(5,25,69,'Outan','Laurent','outan.laurent@123roulement.fr','+33204305180','2001-04-30 09:16:30'),(2,26,166,'Alamaternité','Inès','alamaternité.inès@123roulement.fr',NULL,'2004-06-24 16:06:08'),(2,27,19,'Partout','Jamal','partout.jamal@123roulement.fr',NULL,'1988-08-03 11:26:09'),(4,28,190,'Bezos','Jeff','bezos.jeff@123roulement.fr',NULL,'1979-01-06 17:43:39'),(3,29,77,'Glace','Brice','glace.brice@123roulement.fr',NULL,'2006-08-20 20:13:16'),(2,30,187,'Ange','Lou','ange.lou@123roulement.fr','+33100446302','2016-04-14 15:06:25'),(2,31,71,'Oma','Modeste ','oma.modeste @123roulement.fr',NULL,'1990-09-20 08:16:21'),(10,32,111,'Abbé','Oscar','abbé.oscar@123roulement.fr',NULL,'1986-11-29 02:07:54'),(10,33,18,'Cient','Roland','cient.roland@123roulement.fr',NULL,'2001-07-06 17:39:13'),(5,34,82,'Pique','Sam','pique.sam@123roulement.fr',NULL,'1981-04-06 08:58:29'),(10,35,167,'Toupourplair','Ella ','toupourplair.ella @123roulement.fr',NULL,'1979-05-21 02:00:22'),(4,36,6,'Jean','Jean','jean.jean@123roulement.fr',NULL,'1973-05-25 20:01:51'),(10,37,136,'Fury','Nick','fury.nick@123roulement.fr',NULL,'1993-10-22 11:07:12'),(3,38,136,'Murdock','Matt','murdock.matt@123roulement.fr','+33482683291','1979-02-08 11:44:08'),(7,39,106,'Stark','Tony','stark.tony@123roulement.fr','+31844185289','2007-03-31 13:14:59'),(3,40,166,'Sparrow','Jack','sparrow.jack@123roulement.fr',NULL,'1983-09-06 08:13:53'),(2,41,119,'Kent','Clarck','kent.clarck@123roulement.fr','+33240890709','1989-10-01 05:47:19'),(7,42,99,'Travolta','John','travolta.john@123roulement.fr','+32814227219','2011-01-02 05:51:57'),(7,43,42,'Ewing','JR','ewing.jr@123roulement.fr','+35392790439','1978-03-10 00:21:14'),(6,44,117,'Biere','Emma','biere.emma@123roulement.fr','+33177918446','1993-04-23 14:44:57'),(2,45,114,'Bon','Jean','bon.jean@123roulement.fr','+32357033198','1982-07-04 10:20:47'),(7,46,176,'Troijours','Adam','troijours.adam@123roulement.fr',NULL,'1994-07-04 03:58:23'),(7,47,84,'Duerdeun','Tyler','duerdeun.tyler@123roulement.fr','+33659174570','1985-02-02 06:01:55'),(6,48,139,'Céparou','Jacques','céparou.jacques@123roulement.fr',NULL,'2006-04-01 03:38:37'),(9,49,5,'Pile','Emma','pile.emma@123roulement.fr',NULL,'2010-11-24 16:05:56'),(7,50,102,'Soze','Keyser','soze.keyser@123roulement.fr',NULL,'2012-06-11 20:55:06');
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pays`
--

DROP TABLE IF EXISTS `pays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pays` (
  `id_pays` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identifiant du pays',
  `fld_isoPays` varchar(2) NOT NULL COMMENT 'Iso du pays',
  `fld_devise` varchar(3) NOT NULL COMMENT 'Devise du pays',
  PRIMARY KEY (`id_pays`)
) ENGINE=InnoDB AUTO_INCREMENT=195 DEFAULT CHARSET=utf8mb3 COMMENT='Table des pays';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pays`
--

LOCK TABLES `pays` WRITE;
/*!40000 ALTER TABLE `pays` DISABLE KEYS */;
INSERT INTO `pays` VALUES (1,'AF','USD'),(2,'ZA','USD'),(3,'AL','USD'),(4,'DZ','USD'),(5,'DE','EUR'),(6,'AD','USD'),(7,'AO','USD'),(8,'SA','USD'),(9,'AR','USD'),(10,'AM','USD'),(11,'AU','USD'),(12,'AT','EUR'),(13,'BS','USD'),(14,'BH','USD'),(15,'BD','USD'),(16,'BB','USD'),(17,'BE','EUR'),(18,'BJ','USD'),(19,'BY','USD'),(20,'BO','USD'),(21,'BA','USD'),(22,'BR','USD'),(23,'BN','USD'),(24,'BG','EUR'),(25,'BF','USD'),(26,'BI','USD'),(27,'KH','USD'),(28,'CM','USD'),(29,'CA','USD'),(30,'CL','USD'),(31,'CN','USD'),(32,'CY','EUR'),(33,'CO','USD'),(34,'KM','USD'),(35,'CG','USD'),(36,'CD','USD'),(37,'KP','USD'),(38,'KR','USD'),(39,'CR','USD'),(40,'CI','USD'),(41,'HR','EUR'),(42,'CU','USD'),(43,'DK','EUR'),(44,'DJ','USD'),(45,'AE','USD'),(46,'EG','USD'),(47,'EC','USD'),(48,'ER','USD'),(49,'ES','EUR'),(50,'EE','EUR'),(51,'US','USD'),(52,'ET','USD'),(53,'FJ','USD'),(54,'FI','EUR'),(55,'FR','EUR'),(56,'GA','USD'),(57,'GE','USD'),(58,'GH','USD'),(59,'GR','EUR'),(60,'GT','USD'),(61,'GN','USD'),(62,'GW','USD'),(63,'HT','USD'),(64,'HN','USD'),(65,'HU','EUR'),(66,'IN','USD'),(67,'ID','USD'),(68,'IQ','USD'),(69,'IR','USD'),(70,'IE','EUR'),(71,'IS','USD'),(72,'IL','USD'),(73,'IT','EUR'),(74,'JM','USD'),(75,'JP','USD'),(76,'JO','USD'),(77,'KE','USD'),(78,'KW','USD'),(79,'LA','USD'),(80,'LV','EUR'),(81,'LB','USD'),(82,'LY','USD'),(83,'LI','USD'),(84,'LT','EUR'),(85,'MG','USD'),(86,'MY','USD'),(87,'MV','USD'),(88,'ML','USD'),(89,'MT','EUR'),(90,'MA','USD'),(91,'MU','USD'),(92,'MR','USD'),(93,'MX','USD'),(94,'MC','EUR'),(95,'MN','USD'),(96,'MZ','USD'),(97,'MM','USD'),(98,'NA','USD'),(99,'NP','USD'),(100,'NI','USD'),(101,'NE','USD'),(102,'NG','USD'),(103,'NO','USD'),(104,'NC','USD'),(105,'OM','USD'),(106,'UZ','USD'),(107,'PK','USD'),(108,'PA','USD'),(109,'PY','USD'),(110,'NL','EUR'),(111,'PE','USD'),(112,'PH','USD'),(113,'PL','EUR'),(114,'PT','EUR'),(115,'QA','USD'),(116,'CF','USD'),(117,'DO','USD'),(118,'CZ','EUR'),(119,'RO','EUR'),(120,'GB','GBP'),(121,'RU','USD'),(122,'RW','USD'),(123,'EH','USD'),(124,'LC','USD'),(125,'SM','EUR'),(126,'SV','USD'),(127,'ST','USD'),(128,'SN','USD'),(129,'SC','USD'),(130,'SG','USD'),(131,'SK','EUR'),(132,'SO','USD'),(133,'SD','USD'),(134,'LK','USD'),(135,'SE','EUR'),(136,'CH','USD'),(137,'SY','USD'),(138,'TW','USD'),(139,'TZ','USD'),(140,'TD','USD'),(141,'TH','USD'),(142,'TG','USD'),(143,'TN','USD'),(144,'TR','USD'),(145,'UA','USD'),(146,'UY','USD'),(147,'VU','USD'),(148,'VA','USD'),(149,'VE','USD'),(150,'VN','USD'),(151,'YE','USD'),(152,'MK','USD'),(153,'ZM','USD'),(154,'ZW','USD'),(155,'LU','EUR'),(156,'RE','EUR'),(157,'GP','EUR'),(158,'GF','EUR'),(159,'PF','EUR'),(160,'BL','EUR'),(161,'MQ','EUR'),(162,'YT','EUR'),(163,'MF','EUR'),(164,'PM','EUR'),(165,'NZ','USD'),(166,'AZ','USD'),(167,'SI','EUR'),(168,'KZ','USD'),(169,'RS','USD'),(170,'MD','USD'),(171,'HK','USD'),(172,'VI','USD'),(173,'DM','USD'),(174,'PR','USD'),(175,'XK','USD'),(176,'BZ','USD'),(177,'GI','USD'),(178,'CW','USD'),(179,'TT','USD'),(180,'WF','EUR'),(181,'SX','USD'),(182,'AW','USD'),(183,'JE','GBP'),(184,'ME','EUR'),(185,'GG','GBP'),(186,'AG','USD'),(187,'PG','EUR'),(188,'FO','EUR'),(189,'MH','USD'),(190,'LR','EUR'),(191,'BW','EUR'),(192,'KG','USD'),(193,'GL','USD'),(194,'SS','USD');
/*!40000 ALTER TABLE `pays` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-07 15:16:07
