CREATE DATABASE  IF NOT EXISTS `parkinglot_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `parkinglot_db`;
-- MySQL dump 10.13  Distrib 8.0.33, for macos13 (arm64)
--
-- Host: localhost    Database: parkinglot_db
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
-- Table structure for table `__EFMigrationsHistory`
--

DROP TABLE IF EXISTS `__EFMigrationsHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `__EFMigrationsHistory` (
  `MigrationId` varchar(150) NOT NULL,
  `ProductVersion` varchar(32) NOT NULL,
  PRIMARY KEY (`MigrationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `__EFMigrationsHistory`
--

LOCK TABLES `__EFMigrationsHistory` WRITE;
/*!40000 ALTER TABLE `__EFMigrationsHistory` DISABLE KEYS */;
INSERT INTO `__EFMigrationsHistory` VALUES ('20230623073524_InitialCreate','7.0.5');
/*!40000 ALTER TABLE `__EFMigrationsHistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspNetRoleClaims`
--

DROP TABLE IF EXISTS `aspNetRoleClaims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspNetRoleClaims` (
  `id` int NOT NULL AUTO_INCREMENT,
  `roleId` varchar(255) NOT NULL,
  `claimType` longtext,
  `claimValue` longtext,
  PRIMARY KEY (`id`),
  KEY `IX_AspNetRoleClaims_RoleId` (`roleId`),
  CONSTRAINT `FK_AspNetRoleClaims_AspNetRoles_RoleId` FOREIGN KEY (`roleId`) REFERENCES `AspNetRoles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspNetRoleClaims`
--

LOCK TABLES `aspNetRoleClaims` WRITE;
/*!40000 ALTER TABLE `aspNetRoleClaims` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspNetRoleClaims` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AspNetRoles`
--

DROP TABLE IF EXISTS `AspNetRoles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AspNetRoles` (
  `id` varchar(255) NOT NULL,
  `name` varchar(256) DEFAULT NULL,
  `normalizedName` varchar(256) DEFAULT NULL,
  `concurrencyStamp` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `RoleNameIndex` (`normalizedName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AspNetRoles`
--

LOCK TABLES `AspNetRoles` WRITE;
/*!40000 ALTER TABLE `AspNetRoles` DISABLE KEYS */;
INSERT INTO `AspNetRoles` VALUES ('2f910590-16eb-46e5-824a-91cad9c70636','User','USER',NULL),('5e18e3c7-021d-4a43-be45-e53a3211141b','Admin','ADMIN',NULL);
/*!40000 ALTER TABLE `AspNetRoles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AspNetUserClaims`
--

DROP TABLE IF EXISTS `AspNetUserClaims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AspNetUserClaims` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` varchar(255) NOT NULL,
  `claimType` longtext,
  `claimValue` longtext,
  PRIMARY KEY (`id`),
  KEY `IX_AspNetUserClaims_UserId` (`userId`),
  CONSTRAINT `FK_AspNetUserClaims_AspNetUsers_UserId` FOREIGN KEY (`userId`) REFERENCES `AspNetUsers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AspNetUserClaims`
--

LOCK TABLES `AspNetUserClaims` WRITE;
/*!40000 ALTER TABLE `AspNetUserClaims` DISABLE KEYS */;
/*!40000 ALTER TABLE `AspNetUserClaims` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AspNetUserLogins`
--

DROP TABLE IF EXISTS `AspNetUserLogins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AspNetUserLogins` (
  `loginProvider` varchar(128) NOT NULL,
  `providerKey` varchar(128) NOT NULL,
  `providerDisplayName` longtext,
  `userId` varchar(255) NOT NULL,
  PRIMARY KEY (`loginProvider`,`providerKey`),
  KEY `IX_AspNetUserLogins_UserId` (`userId`),
  CONSTRAINT `FK_AspNetUserLogins_AspNetUsers_UserId` FOREIGN KEY (`userId`) REFERENCES `AspNetUsers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AspNetUserLogins`
--

LOCK TABLES `AspNetUserLogins` WRITE;
/*!40000 ALTER TABLE `AspNetUserLogins` DISABLE KEYS */;
/*!40000 ALTER TABLE `AspNetUserLogins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AspNetUserRoles`
--

DROP TABLE IF EXISTS `AspNetUserRoles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AspNetUserRoles` (
  `userId` varchar(255) NOT NULL,
  `roleId` varchar(255) NOT NULL,
  PRIMARY KEY (`userId`,`roleId`),
  KEY `IX_AspNetUserRoles_RoleId` (`roleId`),
  CONSTRAINT `FK_AspNetUserRoles_AspNetRoles_RoleId` FOREIGN KEY (`roleId`) REFERENCES `AspNetRoles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_AspNetUserRoles_AspNetUsers_UserId` FOREIGN KEY (`userId`) REFERENCES `AspNetUsers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AspNetUserRoles`
--

LOCK TABLES `AspNetUserRoles` WRITE;
/*!40000 ALTER TABLE `AspNetUserRoles` DISABLE KEYS */;
INSERT INTO `AspNetUserRoles` VALUES ('7065838a-8360-40b9-b51d-6e8e9ee0a9f9','2f910590-16eb-46e5-824a-91cad9c70636'),('7f916643-508b-40f5-8239-e6c55daee64f','2f910590-16eb-46e5-824a-91cad9c70636'),('bdb00ef2-c716-4723-817c-15f0427998ba','2f910590-16eb-46e5-824a-91cad9c70636'),('2984817d-315b-42a5-b67f-00792d5c4809','5e18e3c7-021d-4a43-be45-e53a3211141b'),('2c0b0e0a-5189-4fc9-b705-190a673c5b1a','5e18e3c7-021d-4a43-be45-e53a3211141b');
/*!40000 ALTER TABLE `AspNetUserRoles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AspNetUsers`
--

DROP TABLE IF EXISTS `AspNetUsers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AspNetUsers` (
  `id` varchar(255) NOT NULL,
  `userName` varchar(256) DEFAULT NULL,
  `normalizedUserName` varchar(256) DEFAULT NULL,
  `email` varchar(256) DEFAULT NULL,
  `normalizedEmail` varchar(256) DEFAULT NULL,
  `emailConfirmed` tinyint(1) NOT NULL,
  `passwordHash` longtext,
  `securityStamp` longtext,
  `concurrencyStamp` longtext,
  `phoneNumber` longtext,
  `phoneNumberConfirmed` tinyint(1) NOT NULL,
  `twoFactorEnabled` tinyint(1) NOT NULL,
  `lockoutEnd` datetime(6) DEFAULT NULL,
  `lockoutEnabled` tinyint(1) NOT NULL,
  `accessFailedCount` int NOT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UserNameIndex` (`normalizedUserName`),
  KEY `EmailIndex` (`normalizedEmail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AspNetUsers`
--

LOCK TABLES `AspNetUsers` WRITE;
/*!40000 ALTER TABLE `AspNetUsers` DISABLE KEYS */;
INSERT INTO `AspNetUsers` VALUES ('2984817d-315b-42a5-b67f-00792d5c4809','rosie@gmail.com','ROSIE@GMAIL.COM','rosie@gmail.com','ROSIE@GMAIL.COM',0,'AQAAAAIAAYagAAAAEEXCoHkYabtvXp+lHXLgKAzLeXCQnwHuicM24+8CBUv6eAMs668rkGoNk+IGfU7KVg==','MG7Q5GP5XNS2ARR5272XLHH5LJTKBHIN','08605bdd-8e81-4844-a537-1288178f417c',NULL,0,0,NULL,1,0,'Rosé','Park'),('2c0b0e0a-5189-4fc9-b705-190a673c5b1a','marshal@gmail.com','MARSHAL@GMAIL.COM','marshal@gmail.com','MARSHAL@GMAIL.COM',0,'AQAAAAIAAYagAAAAENbN6Raz6KiPsgg3/GDV6FBVuToIGrBgTnsmwWc4RerFh1sowKJ9ddGqfKXp7M21vw==','DB7CJXNXPRX2I5ALZFM6LVN4SZQJ6VV3','a05a7bf2-1950-4fc3-a93b-746b9d0245e7',NULL,0,0,NULL,1,2,'marshal','matt'),('7065838a-8360-40b9-b51d-6e8e9ee0a9f9','hoshinoai@gmail.com','HOSHINOAI@GMAIL.COM','hoshinoai@gmail.com','HOSHINOAI@GMAIL.COM',0,'AQAAAAIAAYagAAAAEJ3GFx0lM3Dj/qb6XU96msYmXjEzNBpxhSu/oVh5ZmPGLLaADdBlG8FFgnkGjtPZ7w==','ZCAQODIFU3V4BRGOCXSN2EHNAMNH2SWZ','62c3b460-8eec-4eef-855b-426bcc86ed58',NULL,0,0,NULL,1,0,'Ai','Hoshino'),('7f916643-508b-40f5-8239-e6c55daee64f','akanekurokawa@gmail.com','AKANEKUROKAWA@GMAIL.COM','akanekurokawa@gmail.com','AKANEKUROKAWA@GMAIL.COM',0,'AQAAAAIAAYagAAAAENZBjuDCJxgCA1zcH7Oln4JMY+7vv3DJF4Jd44cLoKdT0zItUKlizWI5Aj2U5oE5Mw==','NEKZ7ZMQSCEWRJCIKBLFV6NBE6MPHEZT','3472efa6-d1f1-4f8b-80d6-34c9aeb09383',NULL,0,0,NULL,1,0,'Akane','Kurokawa'),('bdb00ef2-c716-4723-817c-15f0427998ba','jenkim@gmail.com','JENKIM@GMAIL.COM','jenkim@gmail.com','JENKIM@GMAIL.COM',0,'AQAAAAIAAYagAAAAEEIX8O5Byzct0jTbGBAfRxUCMOPPrEJvUGPfKvt9RNjdq2fUJPztqTx1QHOQDFRcuw==','NVLY4RKYC44COLCRLRYLESNP3R5RHUTN','a767049b-15a5-4cf3-b811-d636c6fc7637',NULL,0,0,NULL,1,0,'Jen','Kim');
/*!40000 ALTER TABLE `AspNetUsers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AspNetUserTokens`
--

DROP TABLE IF EXISTS `AspNetUserTokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AspNetUserTokens` (
  `userId` varchar(255) NOT NULL,
  `loginProvider` varchar(128) NOT NULL,
  `name` varchar(128) NOT NULL,
  `value` longtext,
  PRIMARY KEY (`userId`,`loginProvider`,`name`),
  CONSTRAINT `FK_AspNetUserTokens_AspNetUsers_UserId` FOREIGN KEY (`userId`) REFERENCES `AspNetUsers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AspNetUserTokens`
--

LOCK TABLES `AspNetUserTokens` WRITE;
/*!40000 ALTER TABLE `AspNetUserTokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `AspNetUserTokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utblMstDistricts`
--

DROP TABLE IF EXISTS `utblMstDistricts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utblMstDistricts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `districtName` varchar(45) NOT NULL,
  `description` varchar(255) NOT NULL,
  `createdBy` varchar(128) NOT NULL,
  `lastUpdatedOn` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utblMstDistricts`
--

LOCK TABLES `utblMstDistricts` WRITE;
/*!40000 ALTER TABLE `utblMstDistricts` DISABLE KEYS */;
INSERT INTO `utblMstDistricts` VALUES (1,'Gangtok','East','KM','2023-06-02 08:34:11'),(2,'Mangan','North','KM','2023-06-02 08:35:09'),(3,'Namchi','South','KM','2023-06-02 08:35:23'),(4,'Gyalshing','West','KM','2023-06-07 13:46:27'),(5,'Italy','test','KM','2023-06-09 08:40:43'),(6,'Rome','South','KM','2023-06-09 08:40:54'),(7,'Paris','France','KM','2023-06-09 09:06:15'),(8,'China','Cool','KM','2023-06-09 08:41:12'),(9,'New York','US','KM','2023-06-09 08:41:25'),(10,'Venice','Test','KM','2023-06-09 08:41:43'),(11,'Japan','Asia','KM','2023-06-09 08:41:59'),(12,'Venice','Very pretty','Me','2023-07-26 11:16:06');
/*!40000 ALTER TABLE `utblMstDistricts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utblMstParkingLotFacilities`
--

DROP TABLE IF EXISTS `utblMstParkingLotFacilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utblMstParkingLotFacilities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `facility` varchar(128) NOT NULL,
  `createdBy` varchar(255) NOT NULL,
  `lastUpdatedOn` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utblMstParkingLotFacilities`
--

LOCK TABLES `utblMstParkingLotFacilities` WRITE;
/*!40000 ALTER TABLE `utblMstParkingLotFacilities` DISABLE KEYS */;
INSERT INTO `utblMstParkingLotFacilities` VALUES (1,'Good Infrastructure','KM','2023-06-02 08:37:22'),(2,'Very nice','KM','2023-06-02 08:37:30'),(3,'Large','KM','2023-06-02 08:37:39'),(4,'Awesome','Lisa','2023-06-09 08:28:32');
/*!40000 ALTER TABLE `utblMstParkingLotFacilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utblMstParkingLotPaymentTypes`
--

DROP TABLE IF EXISTS `utblMstParkingLotPaymentTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utblMstParkingLotPaymentTypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `createdBy` varchar(255) DEFAULT NULL,
  `lastUpdatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utblMstParkingLotPaymentTypes`
--

LOCK TABLES `utblMstParkingLotPaymentTypes` WRITE;
/*!40000 ALTER TABLE `utblMstParkingLotPaymentTypes` DISABLE KEYS */;
INSERT INTO `utblMstParkingLotPaymentTypes` VALUES (1,'Free','KM','2023-06-02 08:37:52'),(2,'Paid','KM','2023-06-02 08:38:00'),(3,'Free/Paid','KM','2023-06-07 13:38:27');
/*!40000 ALTER TABLE `utblMstParkingLotPaymentTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utblMstParkingLotTypes`
--

DROP TABLE IF EXISTS `utblMstParkingLotTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utblMstParkingLotTypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(128) NOT NULL,
  `createdBy` varchar(255) DEFAULT NULL,
  `lastUpdatedBy` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utblMstParkingLotTypes`
--

LOCK TABLES `utblMstParkingLotTypes` WRITE;
/*!40000 ALTER TABLE `utblMstParkingLotTypes` DISABLE KEYS */;
INSERT INTO `utblMstParkingLotTypes` VALUES (1,'Big','KM','KM'),(2,'Open Ground','KM','KM'),(3,'Basement','KM','KM');
/*!40000 ALTER TABLE `utblMstParkingLotTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utblParkingLotFacilities`
--

DROP TABLE IF EXISTS `utblParkingLotFacilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utblParkingLotFacilities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `facilityId` int NOT NULL,
  `parkingLotId` int NOT NULL,
  `createdBy` varchar(255) DEFAULT NULL,
  `lastUpdatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parkinglotid_idx` (`parkingLotId`),
  KEY `facilityid_idx` (`facilityId`),
  CONSTRAINT `facilityid` FOREIGN KEY (`facilityId`) REFERENCES `utblMstParkingLotFacilities` (`id`),
  CONSTRAINT `parkinglotid` FOREIGN KEY (`parkingLotId`) REFERENCES `utblParkingLots` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utblParkingLotFacilities`
--

LOCK TABLES `utblParkingLotFacilities` WRITE;
/*!40000 ALTER TABLE `utblParkingLotFacilities` DISABLE KEYS */;
INSERT INTO `utblParkingLotFacilities` VALUES (73,1,12,'asd','2023-07-03 10:34:44'),(74,2,12,'asd','2023-07-03 10:34:44'),(76,1,13,'Jennie','2023-07-03 10:35:32'),(77,3,13,'Jennie','2023-07-03 10:35:32'),(79,2,14,'Blackpink','2023-07-03 10:36:28'),(80,3,14,'Blackpink','2023-07-03 10:36:28'),(82,2,15,'Blackpink','2023-07-03 10:36:54'),(83,3,15,'Blackpink','2023-07-03 10:36:54'),(85,1,16,'Jennie','2023-07-03 10:37:28'),(86,2,16,'Jennie','2023-07-03 10:37:28'),(87,3,16,'Jennie','2023-07-03 10:37:28'),(88,3,17,'Lisa','2023-07-03 10:38:00'),(89,4,17,'Lisa','2023-07-03 10:38:00'),(91,1,18,'Me','2023-07-03 10:38:27'),(92,2,18,'Me','2023-07-03 10:38:27'),(93,4,18,'Me','2023-07-03 10:38:27'),(94,2,19,'Blackpink','2023-07-03 10:38:54'),(95,3,19,'Blackpink','2023-07-03 10:38:54'),(97,3,20,'Me','2023-07-03 10:39:21'),(98,4,20,'Me','2023-07-03 10:39:21'),(103,2,8,'Blackpink','2023-07-17 11:50:57'),(104,3,8,'Blackpink','2023-07-17 11:50:57'),(106,2,9,'Blackpink','2023-07-17 11:51:18'),(107,3,9,'Blackpink','2023-07-17 11:51:18'),(109,2,10,'Blackpink','2023-07-17 11:51:37'),(110,4,10,'Blackpink','2023-07-17 11:51:37'),(112,3,11,'Blackpink','2023-07-17 11:51:49');
/*!40000 ALTER TABLE `utblParkingLotFacilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utblParkingLots`
--

DROP TABLE IF EXISTS `utblParkingLots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utblParkingLots` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `location` varchar(45) NOT NULL,
  `latitude` decimal(10,7) NOT NULL,
  `longitude` decimal(10,7) NOT NULL,
  `openingTime` time NOT NULL,
  `closingTime` time NOT NULL,
  `closedOn` varchar(45) NOT NULL,
  `ownerName` varchar(128) NOT NULL,
  `contactNo` int NOT NULL,
  `emailID` varchar(45) NOT NULL,
  `district_ID` int NOT NULL,
  `paymentType_ID` int NOT NULL,
  `createdBy` varchar(255) NOT NULL,
  `lastUpdatedOn` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utblParkingLots`
--

LOCK TABLES `utblParkingLots` WRITE;
/*!40000 ALTER TABLE `utblParkingLots` DISABLE KEYS */;
INSERT INTO `utblParkingLots` VALUES (8,'Lisa','Rome',27.8768680,89.7868760,'10:00:00','20:30:12','Sunday','Me',987589434,'khushi@gmail.com',1,3,'Blackpink','2023-07-17 11:50:57'),(9,'Jennie','Gangtok',27.3420884,88.6212028,'09:00:00','21:34:12','Sunday','Me',987589434,'khushi@gmail.com',9,3,'Blackpink','2023-07-17 11:51:18'),(10,'Rosé','France',27.3152444,88.6012913,'10:00:00','14:34:12','Sunday','Me',987589434,'khushi@gmail.com',1,3,'Blackpink','2023-07-17 11:51:37'),(11,'Jisoo','Seoul',27.3370379,88.6163202,'10:00:00','15:34:12','Sunday','Me',987589434,'khushi@gmail.com',1,3,'Blackpink','2023-07-17 11:51:49'),(12,'Taylor','New York',27.3358275,88.6134663,'10:00:00','08:30:00','Sunday','JennieRubyJane',987589434,'jenrybyjane@gmail.com',1,1,'asd','2023-07-03 10:34:44'),(13,'test1','Paris',27.3360563,88.6124256,'09:00:00','09:00:00','Weekends','Jennie',987654321,'khushi@gmail.com',2,1,'Jennie','2023-07-03 10:35:32'),(14,'test2','Rome',27.3372677,88.6098161,'10:00:00','09:00:00','Weekends','JennieRubyJane',987589434,'jenrybyjane@gmail.com',4,2,'Blackpink','2023-07-03 10:36:28'),(15,'test3','Paris',27.3394489,88.6125062,'10:00:00','08:30:00','Weekends','Me',987589434,'jenrybyjane@gmail.com',4,2,'Blackpink','2023-07-03 10:36:54'),(16,'test4','Paris',27.3256105,88.6032160,'10:00:00','08:30:00','Weekends','Jennie',987654321,'khushi@gmail.com',5,3,'Jennie','2023-07-03 10:37:28'),(17,'test5','Paris',27.3161818,88.6047986,'03:23:20','02:34:12','Sunday','Me',987589434,'khushi@gmail.com',3,1,'Lisa','2023-07-03 10:38:00'),(18,'test6','Gangtok',27.3177942,88.6023327,'03:23:20','02:34:12','Sunday','Me',987589434,'khushi@gmail.com',3,1,'Me','2023-07-03 10:38:27'),(19,'test7','Paris',27.3203667,88.6087330,'03:23:20','02:34:12','Sunday','Me',987589434,'khushi@gmail.com',2,2,'Blackpink','2023-07-03 10:38:54'),(20,'test8','Paris',27.3196282,88.6011136,'03:23:20','02:34:12','Sunday','Me',987589434,'jenrybyjane@gmail.com',1,2,'Me','2023-07-03 10:39:21');
/*!40000 ALTER TABLE `utblParkingLots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utblParkingLotTypes`
--

DROP TABLE IF EXISTS `utblParkingLotTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utblParkingLotTypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parkingLotId` int NOT NULL,
  `typeId` int NOT NULL,
  `createdBy` varchar(255) NOT NULL,
  `lastUpdatedOn` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `parkinglotid_idx` (`parkingLotId`),
  KEY `typeid_idx` (`typeId`),
  CONSTRAINT `parkingid` FOREIGN KEY (`parkingLotId`) REFERENCES `utblParkingLots` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `typeid` FOREIGN KEY (`typeId`) REFERENCES `utblMstParkingLotTypes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utblParkingLotTypes`
--

LOCK TABLES `utblParkingLotTypes` WRITE;
/*!40000 ALTER TABLE `utblParkingLotTypes` DISABLE KEYS */;
INSERT INTO `utblParkingLotTypes` VALUES (72,12,2,'asd','2023-07-03 10:34:44'),(73,12,3,'asd','2023-07-03 10:34:44'),(75,13,1,'Jennie','2023-07-03 10:35:32'),(76,13,3,'Jennie','2023-07-03 10:35:32'),(78,14,2,'Blackpink','2023-07-03 10:36:28'),(79,14,3,'Blackpink','2023-07-03 10:36:28'),(81,15,2,'Blackpink','2023-07-03 10:36:54'),(82,15,3,'Blackpink','2023-07-03 10:36:54'),(84,16,2,'Jennie','2023-07-03 10:37:28'),(85,16,3,'Jennie','2023-07-03 10:37:28'),(87,17,2,'Lisa','2023-07-03 10:38:00'),(88,17,3,'Lisa','2023-07-03 10:38:00'),(90,18,2,'Me','2023-07-03 10:38:27'),(91,18,3,'Me','2023-07-03 10:38:27'),(93,19,2,'Blackpink','2023-07-03 10:38:54'),(94,19,3,'Blackpink','2023-07-03 10:38:54'),(96,20,2,'Me','2023-07-03 10:39:21'),(97,20,3,'Me','2023-07-03 10:39:21'),(102,8,2,'Blackpink','2023-07-17 11:50:57'),(103,8,3,'Blackpink','2023-07-17 11:50:57'),(105,9,2,'Blackpink','2023-07-17 11:51:18'),(106,9,3,'Blackpink','2023-07-17 11:51:18'),(108,10,2,'Blackpink','2023-07-17 11:51:37'),(109,10,3,'Blackpink','2023-07-17 11:51:37'),(111,11,1,'Blackpink','2023-07-17 11:51:49');
/*!40000 ALTER TABLE `utblParkingLotTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'parkinglot_db'
--

--
-- Dumping routines for database 'parkinglot_db'
--
/*!50003 DROP PROCEDURE IF EXISTS `AddDistrict` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddDistrict`(
in district_name varchar(45),
in description varchar(255),
in created_by varchar(128)
)
BEGIN
	DECLARE Message VARCHAR(255); DECLARE Status VARCHAR(45);
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		GET DIAGNOSTICS CONDITION 1 @ERRNO = MYSQL_ERRNO, @MESSAGE_TEXT = MESSAGE_TEXT;
		SET Message = CONCAT("MySql Error: Erro code - ",@ERRNO,"-",@MESSAGE_TEXT);
		SET Status= "Error";
		select Status, Message;
	END;
	insert into utblMstDistricts(DistrictName, Description, CreatedBy, LastUpdatedOn)
    values(district_name, description, created_by, Now());
    set Status="success";
    set Message="District Added";
    select Status, Message;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddFacility` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddFacility`(
in facility varchar(128),
in created_by varchar(255)
)
BEGIN
	DECLARE Message VARCHAR(255); DECLARE Status VARCHAR(45);
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		GET DIAGNOSTICS CONDITION 1 @ERRNO = MYSQL_ERRNO, @MESSAGE_TEXT = MESSAGE_TEXT;
		SET Message = CONCAT("MySql Error: Erro code - ",@ERRNO,"-",@MESSAGE_TEXT);
		SET Status= "Error";
		select Status, Message;
	END;
	insert into utblMstParkingLotFacilities(Facility, CreatedBy, LastUpdatedOn)
    values(facility, created_by, Now());
    set Status="success";
    set Message="District Added";
    select Status, Message;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddParkinglots` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddParkinglots`(
    IN name VARCHAR(45),
    IN location VARCHAR(45),
    IN latitude DECIMAL(10,7),
    IN longitude DECIMAL(10,7), 
    IN opening_time TIME,
    IN closing_time TIME,
    IN closed_on VARCHAR(45),
    IN owner_name VARCHAR(128),
    IN contact_no INT(15),
    IN email_id VARCHAR(45),
    IN districtid INT,
    IN paymenttypeid INT,
    IN created_by VARCHAR(255),
    IN selected_facilities JSON,
    IN selected_types JSON
)
BEGIN
    DECLARE Message VARCHAR(255);
    DECLARE Status VARCHAR(45);
    DECLARE p_id INT;
    
    START TRANSACTION;
    tblock: BEGIN # start: transaction block
		DECLARE EXIT HANDLER FOR SQLEXCEPTION
		BEGIN
			GET DIAGNOSTICS CONDITION 1 @ERRNO = MYSQL_ERRNO, @STATE = RETURNED_SQLSTATE, @MESSAGE_TEXT = MESSAGE_TEXT;
			SET Message = CONCAT("MySql Error: Error code - ", @ERRNO, "-", @MESSAGE_TEXT);
			SET Status = "Error";
			SELECT Status, Message;
			ROLLBACK;
		END;
		
		INSERT INTO utblParkingLots(Name, Location, Latitude, Longitude, OpeningTime, ClosingTime, ClosedOn, OwnerName, ContactNo, Emailid, District_ID, PaymentType_ID, CreatedBy, LastUpdatedOn) 
		VALUES(name, location, latitude, longitude, opening_time, closing_time, closed_on, owner_name, contact_no, email_id, districtid, paymenttypeid, created_by, NOW());

		SET p_id = LAST_INSERT_ID();
		
		
		
		INSERT INTO utblParkingLotFacilities(FacilityId,ParkingLotId, CreatedBy, LastUpdatedOn)
		SELECT json_data.FacilityId,p_id,created_by,NOW()
		FROM JSON_TABLE(Selected_Facilities, '$[*]'
			COLUMNS (FacilityId INT PATH '$.FacilityID',
            IsChecked BOOL PATH '$.IsChecked'
            )
		) AS json_data
		WHERE json_data.IsChecked = 1;
		
		
		
		INSERT INTO utblParkingLotTypes(TypeId, ParkingLotId, CreatedBy, LastUpdatedOn)
		SELECT json_data.TypeID,p_id, created_by, Now()
		FROM JSON_TABLE(Selected_Types, '$[*]'
			COLUMNS (TypeID INT PATH '$.TypeID',
           IsChecked BOOL PATH '$.IsChecked' )
		) AS json_data
		WHERE json_data.IsChecked = 1;
		
		SET Status = "success";
		SET Message = "Parking Lot Added";
		SELECT Status, Message;
		
    COMMIT;
END tblock; # end: transaction block
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddParkingLotTypes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddParkingLotTypes`(
in type varchar(128),
in created_by varchar(255),
in lastupdated_by varchar(45)
)
BEGIN
	DECLARE Message VARCHAR(255); DECLARE Status VARCHAR(45);
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		GET DIAGNOSTICS CONDITION 1 @ERRNO = MYSQL_ERRNO, @MESSAGE_TEXT = MESSAGE_TEXT;
		SET Message = CONCAT("MySql Error: Erro code - ",@ERRNO,"-",@MESSAGE_TEXT);
		SET Status= "Error";
		select Status, Message;
	END;
	insert into utblMstParkingLotTypes(Type, CreatedBy, LastUpdatedBy) 
    values(type, created_by, lastupdated_by);
    set Status="success";
    set Message="District Added";
    select Status, Message;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddPaymentTypes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddPaymentTypes`(
in type varchar(128),
in created_by varchar(255)
)
BEGIN
	DECLARE Message VARCHAR(255); DECLARE Status VARCHAR(45);
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		GET DIAGNOSTICS CONDITION 1 @ERRNO = MYSQL_ERRNO, @MESSAGE_TEXT = MESSAGE_TEXT;
		SET Message = CONCAT("MySql Error: Erro code - ",@ERRNO,"-",@MESSAGE_TEXT);
		SET Status= "Error";
		select Status, Message;
	END;
	insert into utblMstParkingLotPaymentTypes(Type, CreatedBy, LastUpdatedOn) 
    values(type, created_by, Now());
    set Status="success";
    set Message="District Added";
    select Status, Message;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CountUsers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CountUsers`()
BEGIN
 select count(*) from AspNetUsers;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeleteDistrict` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteDistrict`(
in p_id int
)
BEGIN
	DECLARE Message VARCHAR(255); DECLARE Status VARCHAR(45);
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		GET DIAGNOSTICS CONDITION 1 @ERRNO = MYSQL_ERRNO, @MESSAGE_TEXT = MESSAGE_TEXT;
		SET Message = CONCAT("MySql Error: Erro code - ",@ERRNO,"-",@MESSAGE_TEXT);
		SET Status= "Error";
		select Status, Message;
	END;
	delete from utblMstDistricts where id=p_id;
    set Status="success";
    set Message="District Added";
    select Status, Message;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeleteFacility` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteFacility`(
in p_id int
)
BEGIN
	DECLARE Message VARCHAR(255); DECLARE Status VARCHAR(45);
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		GET DIAGNOSTICS CONDITION 1 @ERRNO = MYSQL_ERRNO, @MESSAGE_TEXT = MESSAGE_TEXT;
		SET Message = CONCAT("MySql Error: Erro code - ",@ERRNO,"-",@MESSAGE_TEXT);
		SET Status= "Error";
		select Status, Message;
	END;
	DELETE from utblMstParkingLotFacilites
    WHERE
        id=p_id;
    set Status="success";
    set Message="District Added";
    select Status, Message;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeleteParkingLots` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteParkingLots`(in p_id int)
BEGIN
DECLARE Message VARCHAR(255); DECLARE Status VARCHAR(45);
DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		GET DIAGNOSTICS CONDITION 1 @ERRNO = MYSQL_ERRNO, @STATE = RETURNED_SQLSTATE, @MESSAGE_TEXT = MESSAGE_TEXT;
		SET Message = CONCAT("MySql Error: Error code - ", @ERRNO, "-", @MESSAGE_TEXT);
		SET Status = "Error";
		SELECT Status, Message;
	END;
	Delete from utblParkingLotFacilities where ParkingLotId=p_id;
    Delete from utblParkingLotTypes where ParkingLotId=p_id;
    Delete from utblParkingLots where id=p_id;
    
    SET Status = "success";
	SET Message = "Parking Lot Deleted";
	SELECT Status, Message;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeleteParkingLotTypes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteParkingLotTypes`(
in p_id int
)
BEGIN
	DECLARE Message VARCHAR(255); DECLARE Status VARCHAR(45);
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		GET DIAGNOSTICS CONDITION 1 @ERRNO = MYSQL_ERRNO, @MESSAGE_TEXT = MESSAGE_TEXT;
		SET Message = CONCAT("MySql Error: Erro code - ",@ERRNO,"-",@MESSAGE_TEXT);
		SET Status= "Error";
		select Status, Message;
	END;
	delete from utblMstParkingLotTypes
    WHERE
        id=p_id;
    set Status="success";
    set Message="District Added";
    select Status, Message;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeletePaymentTypes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeletePaymentTypes`(
in p_id int
)
BEGIN
	DECLARE Message VARCHAR(255); DECLARE Status VARCHAR(45);
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		GET DIAGNOSTICS CONDITION 1 @ERRNO = MYSQL_ERRNO, @MESSAGE_TEXT = MESSAGE_TEXT;
		SET Message = CONCAT("MySql Error: Erro code - ",@ERRNO,"-",@MESSAGE_TEXT);
		SET Status= "Error";
		select Status, Message;
	END;
	delete from utblMstParkingLotPaymentTypes where id=p_id;
    set Status="success";
    set Message="District Added";
    select Status, Message;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeleteUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteUser`(
in p_id varchar(255)
)
BEGIN
DECLARE Message VARCHAR(255); DECLARE Status VARCHAR(45);
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		GET DIAGNOSTICS CONDITION 1 @ERRNO = MYSQL_ERRNO, @MESSAGE_TEXT = MESSAGE_TEXT;
		SET Message = CONCAT("MySql Error: Erro code - ",@ERRNO,"-",@MESSAGE_TEXT);
		SET Status= "Error";
		select Status, Message;
	END;
	delete from AspNetUsers where Id=p_id;
    set Status="success";
    set Message="Deleted";
    select Status, Message;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllUsers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllUsers`()
BEGIN
select  AspNetUsers.Id,
		AspNetUsers.FirstName, 
		AspNetUsers.LastName,
        AspNetRoles.Name,
        AspNetUsers.Email
        from AspNetUsers
		inner join AspNetUserRoles on AspNetUserRoles.UserId=AspNetUsers.Id
		inner join AspNetRoles on AspNetRoles.id=AspNetUserRoles.RoleId
        order by AspNetRoles.Name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetDistrict` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetDistrict`()
BEGIN
select * from utblMstDistricts;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetDistrictByid` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetDistrictByid`(in p_id int)
BEGIN
select * from utblMstDistricts where id=p_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetFacility` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetFacility`()
BEGIN
	select * from utblMstParkingLotFacilities;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetFacilityByid` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetFacilityByid`(in p_id int)
BEGIN
	select * from utblMstParkingLotFacilities where id=p_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetFacilityPaged` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetFacilityPaged`(IN pno INT,IN psize INT,IN sterm varchar(50))
BEGIN
Select * FROM(
	select ROW_NUMBER() OVER (ORDER BY Facility) as row_num,id,Facility,CreatedBy,LastUpdatedOn from utblMstParkingLotFacilities
    Where (Facility Like CONCAT('%',sterm,'%') OR sterm='')
    )a Where row_num>=pno LIMIT psize;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetParkingLots` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetParkingLots`()
BEGIN
	select utblParkingLots.id, utblParkingLots.Name, utblParkingLots.Location, utblParkingLots.Latitude, 
    utblParkingLots.Longitude, utblParkingLots.OpeningTime, utblParkingLots.ClosingTime, utblParkingLots.ClosedOn,
    utblParkingLots.OwnerName, utblParkingLots.ContactNo, utblParkingLots.EmailID,
	utblMstDistricts.DistrictName, utblMstParkingLotPaymentTypes.Type, 
    utblParkingLots.CreatedBy, utblParkingLots.LastUpdatedOn
    
    from ((utblParkingLots
		join utblMstDistricts on utblMstDistricts.id=utblParkingLots.District_ID)
        join utblMstParkingLotPaymentTypes on utblMstParkingLotPaymentTypes.id=utblParkingLots.PaymentType_ID);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetParkingLotsByid` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetParkingLotsByid`(in p_id int)
BEGIN
	select utblParkingLots.id, utblParkingLots.Name, utblParkingLots.Location, utblParkingLots.Latitude, 
    utblParkingLots.Longitude, utblParkingLots.OpeningTime, utblParkingLots.ClosingTime, utblParkingLots.ClosedOn,
    utblParkingLots.OwnerName, utblParkingLots.ContactNo, utblParkingLots.EmailID,utblParkingLots.District_ID,
    utblParkingLots.PaymentType_ID, utblMstDistricts.DistrictName, 
    utblMstParkingLotPaymentTypes.Type, utblParkingLots.CreatedBy, utblParkingLots.LastUpdatedOn
    
    from ((utblParkingLots
		join utblMstDistricts on utblMstDistricts.id=utblParkingLots.District_ID)
        join utblMstParkingLotPaymentTypes on utblMstParkingLotPaymentTypes.id=utblParkingLots.PaymentType_ID)
	where utblParkingLots.id=p_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetParkingLotsPaged` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetParkingLotsPaged`(
in pno int,
in psize int,
in sterm varchar(50)
)
BEGIN
	Select *
    FROM(
	select ROW_NUMBER() OVER (ORDER BY id) as row_num,Type,DistrictName,utblParkingLots.id,Name, Location, Latitude, Longitude, OpeningTime, ClosingTime, ClosedOn, OwnerName, ContactNo, EmailID, District_ID, PaymentType_ID,utblParkingLots.CreatedBy,utblParkingLots.LastUpdatedOn 
    from ((utblParkingLots
		join utblMstDistricts on utblMstDistricts.id=utblParkingLots.District_ID)
        join utblMstParkingLotPaymentTypes on utblMstParkingLotPaymentTypes.id=utblParkingLots.PaymentType_ID)
    Where (location Like CONCAT('%',sterm,'%') OR sterm='')
    )a Where row_num>=(psize*(pno-1)+1)  LIMIT psize;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetParkingLotTypes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetParkingLotTypes`()
BEGIN
	select * from utblMstParkingLotTypes;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetParkingLotTypesByid` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetParkingLotTypesByid`(in p_id int)
BEGIN
	select * from utblMstParkingLotTypes where id=p_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetPaymentTypes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetPaymentTypes`()
BEGIN
	select * from utblMstParkingLotPaymentTypes;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetPaymentTypesByid` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetPaymentTypesByid`(in p_id int)
BEGIN
	select * from utblMstParkingLotPaymentTypes where id=p_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetSelectedFacilitiesbyid` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetSelectedFacilitiesbyid`(in p_id int)
BEGIN
Select a.id as FacilityId,case when b.FacilityId is null then 0 else 1 end as IsChecked,Facility from utblMstParkingLotFacilities a
left outer join utblParkingLotFacilities b on a.id=b.FacilityId
and ParkingLotId=p_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetSelectParkingLotTypesbyid` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetSelectParkingLotTypesbyid`(in p_id int)
BEGIN
Select a.id as TypeId,case when b.TypeId is null then 0 else 1 end as IsChecked,Type from utblMstParkingLotTypes a
left outer join utblParkingLotTypes b on a.id=b.TypeId
and ParkingLotId=p_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetUserById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetUserById`(
in p_id varchar(255))
BEGIN
 select AspNetUsers.Id,
		AspNetUsers.FirstName, 
		AspNetUsers.LastName,
        AspNetUsers.Email,
        AspNetRoles.Name
        from AspNetUsers
        inner join AspNetUserRoles on AspNetUserRoles.UserId=AspNetUsers.Id
        inner join AspNetRoles on AspNetRoles.id=AspNetUserRoles.RoleId
        where AspNetUsers.Id = p_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetUsers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetUsers`()
BEGIN
select 
		AspNetUsers.Id,
		AspNetUsers.FirstName, 
		AspNetUsers.LastName,
        AspNetRoles.Name,
        AspNetUsers.Email
        from AspNetUsers
			inner join AspNetUserRoles on AspNetUserRoles.UserId=AspNetUsers.Id
			inner join AspNetRoles on AspNetRoles.id=AspNetUserRoles.RoleId
        order by AspNetRoles.Name;
        
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetUsersById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetUsersById`(
in p_id varchar(255))
BEGIN
 select Id, FirstName, LastName, Email from AspNetUsers
 where Id = p_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetUsersPaged` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetUsersPaged`(
in pno int,
in psize int,
in sterm varchar(50)
)
BEGIN
Select *
    FROM(
	select ROW_NUMBER() OVER (ORDER BY id) as row_num,
		AspNetUsers.Id,
		AspNetUsers.FirstName, 
		AspNetUsers.LastName,
        AspNetRoles.Name,
        AspNetUsers.Email
        from ((AspNetUsers
			inner join AspNetUserRoles on AspNetUserRoles.UserId=AspNetUsers.Id)
			inner join AspNetRoles on AspNetRoles.id=AspNetUserRoles.RoleId)
        Where (FirstName Like CONCAT('%',sterm,'%') OR sterm=''))a Where row_num>=(psize*(pno-1)+1)  LIMIT psize;
        
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateDistrict` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateDistrict`(
in p_id int,
in district_name varchar(45),
in description varchar(255),
in created_by varchar(128)
)
BEGIN
	DECLARE Message VARCHAR(255); DECLARE Status VARCHAR(45);
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		GET DIAGNOSTICS CONDITION 1 @ERRNO = MYSQL_ERRNO, @MESSAGE_TEXT = MESSAGE_TEXT;
		SET Message = CONCAT("MySql Error: Erro code - ",@ERRNO,"-",@MESSAGE_TEXT);
		SET Status= "Error";
		select Status, Message;
	END;
	update utblMstDistricts
    set 
		DistrictName = district_name,
        Description = description,
        CreatedBy = created_by,
        LastUpdatedOn = NOW()
    WHERE
        id=p_id;
    set Status="success";
    set Message="District Added";
    select Status, Message;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateFacility` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateFacility`(
in p_id int,
in facility varchar(128),
in created_by varchar(128)
)
BEGIN
	DECLARE Message VARCHAR(255); DECLARE Status VARCHAR(45);
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		GET DIAGNOSTICS CONDITION 1 @ERRNO = MYSQL_ERRNO, @MESSAGE_TEXT = MESSAGE_TEXT;
		SET Message = CONCAT("MySql Error: Erro code - ",@ERRNO,"-",@MESSAGE_TEXT);
		SET Status= "Error";
		select Status, Message;
	END;
	update utblMstParkingLotFacilities
    set 
		Facility=facility,
        CreatedBy = created_by,
        LastUpdatedOn = NOW()
    WHERE
        id=p_id;
    set Status="success";
    set Message="District Added";
    select Status, Message;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateParkinglots` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateParkinglots`(
	IN p_id int,
    IN name VARCHAR(45),
    IN location VARCHAR(45),
    IN latitude DECIMAL(10,7),
    IN longitude DECIMAL(10,7), 
    IN opening_time TIME,
    IN closing_time TIME,
    IN closed_on VARCHAR(45),
    IN owner_name VARCHAR(128),
    IN contact_no INT(15),
    IN email_id VARCHAR(45),
    IN districtid INT,
    IN paymenttypeid INT,
    IN created_by VARCHAR(255),
    IN selected_facilities JSON,
    IN selected_types JSON
)
BEGIN
    DECLARE Message VARCHAR(255);
    DECLARE Status VARCHAR(45);
    
    START TRANSACTION;
    tblock: BEGIN # start: transaction block
		DECLARE EXIT HANDLER FOR SQLEXCEPTION
		BEGIN
			GET DIAGNOSTICS CONDITION 1 @ERRNO = MYSQL_ERRNO, @STATE = RETURNED_SQLSTATE, @MESSAGE_TEXT = MESSAGE_TEXT;
			SET Message = CONCAT("MySql Error: Error code - ", @ERRNO, "-", @MESSAGE_TEXT);
			SET Status = "Error";
			SELECT Status, Message;
			ROLLBACK;
		END;
		
        
		UPDATE utblParkingLots
        SET 
			Name=name,
            Location=location,
            Latitude=latitude,
            Longitude=longitude, 
            OpeningTime=opening_time,
            ClosingTime=closing_time, 
            ClosedOn=closed_on,
            OwnerName=owner_name, 
            ContactNo=contact_no,
            EmailID=email_id,
            District_ID=districtid,
            PaymentType_ID=paymenttypeid,
            CreatedBy=created_by,
            LastUpdatedOn=Now()
            where  id=p_id;
            
		Delete from utblParkingLotFacilities where ParkingLotID=p_id;
        
		
		INSERT INTO utblParkingLotFacilities(FacilityID,ParkingLotID, CreatedBy, LastUpdatedOn)
		SELECT json_data.FacilityID,p_id,created_by,NOW()
		FROM JSON_TABLE(Selected_Facilities, '$[*]'
			COLUMNS (FacilityID INT PATH '$.FacilityID',
            IsChecked bool PATH '$.IsChecked')
		) AS json_data
		WHERE json_data.IsChecked=1;
		
        
        Delete from utblParkingLotTypes where ParkingLotID=p_id;
        
		INSERT INTO utblParkingLotTypes(TypeID, ParkingLotID, CreatedBy, LastUpdatedOn)
		SELECT json_data.TypeID,p_id, created_by, Now()
		FROM JSON_TABLE(Selected_Types, '$[*]'
			COLUMNS (TypeID INT PATH '$.TypeID',
            IsChecked bool PATH '$.IsChecked')
		) AS json_data
		WHERE json_data.IsChecked=1;
		
		SET Status = "success";
		SET Message = "Parking Lot Updated";
		SELECT Status, Message;
		
    COMMIT;
END tblock; # end: transaction block
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateParkingLotTypes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateParkingLotTypes`(
in p_id int,
in type varchar(128),
in created_by varchar(255),
in lastupdated_by varchar(45)
)
BEGIN
	DECLARE Message VARCHAR(255); DECLARE Status VARCHAR(45);
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		GET DIAGNOSTICS CONDITION 1 @ERRNO = MYSQL_ERRNO, @MESSAGE_TEXT = MESSAGE_TEXT;
		SET Message = CONCAT("MySql Error: Erro code - ",@ERRNO,"-",@MESSAGE_TEXT);
		SET Status= "Error";
		select Status, Message;
	END;
	update utblMstParkingLotTypes
    set 
		Type=type,
        CreatedBy = created_by,
        LastUpdatedBy = lastupdated_by
    WHERE
        id=p_id;
    set Status="success";
    set Message="District Added";
    select Status, Message;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdatePaymentTypes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdatePaymentTypes`(
in p_id int,
in type varchar(128),
in created_by varchar(255)
)
BEGIN
	DECLARE Message VARCHAR(255); DECLARE Status VARCHAR(45);
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		GET DIAGNOSTICS CONDITION 1 @ERRNO = MYSQL_ERRNO, @MESSAGE_TEXT = MESSAGE_TEXT;
		SET Message = CONCAT("MySql Error: Erro code - ",@ERRNO,"-",@MESSAGE_TEXT);
		SET Status= "Error";
		select Status, Message;
	END;
	update utblMstParkingLotPaymentTypes
    set
		Type=type,
        CreatedBy=created_by,
        LastUpdatedOn=Now()
	where 
		id=p_id;
    set Status="success";
    set Message="District Added";
    select Status, Message;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateUsers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateUsers`(
in p_id varchar(255),
in firstname varchar(255),
in lastname varchar(255),
in email varchar(255)
)
BEGIN
	DECLARE Message VARCHAR(255); DECLARE Status VARCHAR(45);
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		GET DIAGNOSTICS CONDITION 1 @ERRNO = MYSQL_ERRNO, @MESSAGE_TEXT = MESSAGE_TEXT;
		SET Message = CONCAT("MySql Error: Erro code - ",@ERRNO,"-",@MESSAGE_TEXT);
		SET Status= "Error";
		select Status, Message;
	END;
	update AspNetUsers
    set 
		FirstName = firstname,
        LastName = lastname,
        Email = email
    WHERE Id=p_id;
    
    set Status="success";
    set Message="Updated";
    select Status, Message;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-26 12:57:30
