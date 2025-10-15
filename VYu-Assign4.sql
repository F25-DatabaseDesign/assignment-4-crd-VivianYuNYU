-- MySQL dump 10.13  Distrib 8.0.43, for macos15 (arm64)
--
-- Host: localhost    Database: united_helpers
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `assignment`
--

DROP TABLE IF EXISTS `assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assignment` (
  `volunteerId` int NOT NULL,
  `taskCode` int NOT NULL,
  `startDateTime` date NOT NULL,
  `endDateTime` date DEFAULT NULL,
  PRIMARY KEY (`volunteerId`,`taskCode`),
  KEY `taskCode` (`taskCode`),
  CONSTRAINT `assignment_ibfk_1` FOREIGN KEY (`volunteerId`) REFERENCES `volunteer` (`volunteerId`),
  CONSTRAINT `assignment_ibfk_2` FOREIGN KEY (`taskCode`) REFERENCES `task` (`taskCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignment`
--

LOCK TABLES `assignment` WRITE;
/*!40000 ALTER TABLE `assignment` DISABLE KEYS */;
INSERT INTO `assignment` VALUES (1,101,'2025-09-01','2025-10-01'),(1,102,'2025-09-15',NULL),(1,110,'2025-09-01','2025-10-01'),(2,102,'2025-07-18','2025-09-18'),(3,106,'2025-08-08','2025-08-31'),(3,107,'2025-08-08','2025-08-31'),(4,103,'2025-06-24','2025-09-24'),(5,108,'2025-06-01','2025-07-01'),(6,104,'2025-07-01','2025-08-31'),(7,108,'2025-08-11','2025-09-20'),(10,101,'2025-09-01','2025-10-01');
/*!40000 ALTER TABLE `assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `itemId` int NOT NULL AUTO_INCREMENT,
  `itemDescription` varchar(50) NOT NULL,
  `itemValue` decimal(6,2) NOT NULL,
  `quantityOnHand` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`itemId`)
) ENGINE=InnoDB AUTO_INCREMENT=516 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (501,'bottled water(1L)',3.50,5000),(502,'baged rice(2kg)',5.00,3000),(503,'baged bread(500g)',2.00,10000),(504,'bottled milk(1L)',5.50,4000),(505,'bandages',2.25,7000),(506,'toothpaste(tube)',1.75,3000),(507,'toothbrush',3.25,3000),(508,'towel',2.00,3000),(509,'first-aid packets',15.00,5000),(510,'sanitary pads(20 pack)',8.50,4000),(511,'tampons(20 pack)',6.00,4000),(512,'soap',1.75,5000),(513,'toy',20.00,1000),(514,'book',10.00,1500),(515,'cookie(package)',4.50,2000);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package`
--

DROP TABLE IF EXISTS `package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package` (
  `packageId` int NOT NULL AUTO_INCREMENT,
  `taskCode` int NOT NULL,
  `packageTypeId` int NOT NULL,
  `packageCreateDate` date NOT NULL,
  `packageWeight` decimal(5,2) NOT NULL,
  PRIMARY KEY (`packageId`),
  KEY `taskCode` (`taskCode`),
  KEY `packageTypeId` (`packageTypeId`),
  CONSTRAINT `package_ibfk_1` FOREIGN KEY (`taskCode`) REFERENCES `task` (`taskCode`),
  CONSTRAINT `package_ibfk_2` FOREIGN KEY (`packageTypeId`) REFERENCES `package_type` (`packageTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=1011 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package`
--

LOCK TABLES `package` WRITE;
/*!40000 ALTER TABLE `package` DISABLE KEYS */;
INSERT INTO `package` VALUES (1001,102,51,'2025-09-20',5.80),(1002,102,51,'2025-10-03',7.20),(1003,106,52,'2025-08-07',3.80),(1004,107,55,'2025-09-01',4.00),(1005,107,55,'2025-10-01',3.20),(1006,109,54,'2025-08-22',20.70),(1007,110,53,'2025-09-21',0.80),(1008,110,53,'2025-10-04',3.30),(1009,102,51,'2025-07-31',2.10),(1010,106,52,'2025-06-21',5.30);
/*!40000 ALTER TABLE `package` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package_contents`
--

DROP TABLE IF EXISTS `package_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package_contents` (
  `itemId` int NOT NULL,
  `packageId` int NOT NULL,
  `itemQuantity` int NOT NULL,
  PRIMARY KEY (`itemId`,`packageId`),
  KEY `packageId` (`packageId`),
  CONSTRAINT `package_contents_ibfk_1` FOREIGN KEY (`itemId`) REFERENCES `item` (`itemId`),
  CONSTRAINT `package_contents_ibfk_2` FOREIGN KEY (`packageId`) REFERENCES `package` (`packageId`),
  CONSTRAINT `package_contents_chk_1` CHECK ((`itemQuantity` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package_contents`
--

LOCK TABLES `package_contents` WRITE;
/*!40000 ALTER TABLE `package_contents` DISABLE KEYS */;
INSERT INTO `package_contents` VALUES (501,1006,10),(502,1006,5),(503,1006,10),(504,1006,5),(505,1001,20),(505,1002,15),(506,1004,10),(506,1005,20),(507,1004,10),(508,1005,20),(509,1001,12),(510,1007,15),(511,1007,18),(512,1004,8),(513,1003,12),(514,1003,10),(514,1010,5),(515,1006,20);
/*!40000 ALTER TABLE `package_contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package_type`
--

DROP TABLE IF EXISTS `package_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package_type` (
  `packageTypeId` int NOT NULL AUTO_INCREMENT,
  `packageTypeName` varchar(50) NOT NULL,
  PRIMARY KEY (`packageTypeId`),
  UNIQUE KEY `packageTypeName` (`packageTypeName`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package_type`
--

LOCK TABLES `package_type` WRITE;
/*!40000 ALTER TABLE `package_type` DISABLE KEYS */;
INSERT INTO `package_type` VALUES (51,'basic medical'),(52,'child-care'),(54,'food'),(55,'hygiene'),(53,'women care');
/*!40000 ALTER TABLE `package_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packing_list`
--

DROP TABLE IF EXISTS `packing_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `packing_list` (
  `packingListId` int NOT NULL AUTO_INCREMENT,
  `packingListName` varchar(50) NOT NULL,
  `packingListDescription` varchar(300) NOT NULL,
  PRIMARY KEY (`packingListId`),
  UNIQUE KEY `packingListName` (`packingListName`)
) ENGINE=InnoDB AUTO_INCREMENT=306 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packing_list`
--

LOCK TABLES `packing_list` WRITE;
/*!40000 ALTER TABLE `packing_list` DISABLE KEYS */;
INSERT INTO `packing_list` VALUES (301,'basic medical packages','200 first-aid packets and 200 bandages'),(302,'women care packages','100 sanitary pads and 100 tampons'),(303,'children care packages','50 toys, 50 books, and 100 bottles of milk'),(304,'basic food packages','50 bags of rice, 300 bags of bread, 50 bottles of milk, 200 bottles of water, and 30 packages of cookies'),(305,'Hygiene packages','50 soaps, 50 toothpastes, 50 toothbrushes, and 50 towels');
/*!40000 ALTER TABLE `packing_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task` (
  `taskCode` int NOT NULL,
  `packingListId` int DEFAULT NULL,
  `taskTypeId` int NOT NULL,
  `taskStatusId` int NOT NULL,
  `taskDescription` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`taskCode`),
  KEY `packingListId` (`packingListId`),
  KEY `taskTypeId` (`taskTypeId`),
  KEY `taskStatusId` (`taskStatusId`),
  CONSTRAINT `task_ibfk_1` FOREIGN KEY (`packingListId`) REFERENCES `packing_list` (`packingListId`),
  CONSTRAINT `task_ibfk_2` FOREIGN KEY (`taskTypeId`) REFERENCES `task_type` (`taskTypeId`),
  CONSTRAINT `task_ibfk_3` FOREIGN KEY (`taskStatusId`) REFERENCES `task_status` (`taskStatusId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES (101,NULL,132,10,'answer the telephone'),(102,301,133,10,'prepare basic medical packages'),(103,NULL,132,11,'update volunteer contact information'),(104,NULL,134,12,'transport packages to storage center'),(105,NULL,135,13,'clean up packaging area'),(106,303,133,11,'pack 50 children care packages'),(107,305,133,12,'prepare hygiene packages'),(108,NULL,132,11,'check and restore items'),(109,304,133,13,'prepare basic food packages'),(110,302,133,11,'prepare women care packages');
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_status`
--

DROP TABLE IF EXISTS `task_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_status` (
  `taskStatusId` int NOT NULL AUTO_INCREMENT,
  `taskStatusName` varchar(50) NOT NULL,
  PRIMARY KEY (`taskStatusId`),
  UNIQUE KEY `taskStatusName` (`taskStatusName`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_status`
--

LOCK TABLES `task_status` WRITE;
/*!40000 ALTER TABLE `task_status` DISABLE KEYS */;
INSERT INTO `task_status` VALUES (12,'completed'),(11,'ongoing'),(10,'open'),(13,'pending');
/*!40000 ALTER TABLE `task_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_type`
--

DROP TABLE IF EXISTS `task_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_type` (
  `taskTypeId` int NOT NULL AUTO_INCREMENT,
  `taskTypeName` varchar(50) NOT NULL,
  PRIMARY KEY (`taskTypeId`),
  UNIQUE KEY `taskTypeName` (`taskTypeName`)
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_type`
--

LOCK TABLES `task_type` WRITE;
/*!40000 ALTER TABLE `task_type` DISABLE KEYS */;
INSERT INTO `task_type` VALUES (135,'cleanup'),(134,'delivery'),(133,'packing'),(132,'recurring');
/*!40000 ALTER TABLE `task_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volunteer`
--

DROP TABLE IF EXISTS `volunteer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `volunteer` (
  `volunteerId` int NOT NULL AUTO_INCREMENT,
  `volunteerName` varchar(50) NOT NULL,
  `volunteerAddress` varchar(100) NOT NULL,
  `volunteerTelephone` varchar(50) NOT NULL,
  PRIMARY KEY (`volunteerId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volunteer`
--

LOCK TABLES `volunteer` WRITE;
/*!40000 ALTER TABLE `volunteer` DISABLE KEYS */;
INSERT INTO `volunteer` VALUES (1,'Alice','181 Mercer Street','(212) 555-1843'),(2,'Tom','87 White Street','(646) 555-9276'),(3,'Bianca','636 Greenwich Street','(917) 555-3029'),(4,'Eric','33 Third Avenue','(347) 555-7604'),(5,'Sam','33 Washington Square West','(718) 555-6210'),(6,'Daivd','120 East 12th Street','(929) 555-4785'),(7,'Helen','181 Mercer Street','(332) 555-1108'),(8,'Jeniffer','140 East 14th Street','(516) 555-2389'),(9,'Jack','33 Third Avenue','(914) 555-7742'),(10,'May','120 East 12th Street','(607) 555-9315');
/*!40000 ALTER TABLE `volunteer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-15 11:17:04
