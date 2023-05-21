-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: project
-- ------------------------------------------------------
-- Server version	8.0.18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `compound_loan`
--

DROP TABLE IF EXISTS `compound_loan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compound_loan` (
  `ID` int(11) DEFAULT NULL,
  `principal_amount` float(10,2) DEFAULT NULL,
  `interest_rate` float(4,2) DEFAULT NULL,
  `time` float(4,2) DEFAULT NULL,
  `final_amount` int(11) DEFAULT NULL,
  KEY `ID` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compound_loan`
--

LOCK TABLES `compound_loan` WRITE;
/*!40000 ALTER TABLE `compound_loan` DISABLE KEYS */;
INSERT INTO `compound_loan` VALUES (1000,1200.00,1.50,3.00,1255),(2100,9000.00,0.50,2.00,9090),(1000,6000.00,2.00,2.50,6305),(1200,1200.00,2.40,1.50,1243),(1200,1200.00,2.50,3.00,1292);
/*!40000 ALTER TABLE `compound_loan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `ID` int(11) NOT NULL,
  `password` char(10) NOT NULL,
  `name` char(20) DEFAULT NULL,
  `father_name` char(20) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `city` char(10) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `phone_no` char(10) DEFAULT NULL,
  `passport_no` char(10) DEFAULT NULL,
  `balance` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1000,'headboy','Mohsin','Murtaza','2003-09-09','New Delhi','M','0501234578','MM98563',4100000),(1100,'cultural','Shezan','Chisty','2003-01-01','Bangalore','M','0501010101','SC65410',100000),(1200,'sports','Nufail','Abdul','2003-01-01','Jeddah','M','0506651890','NV12345',984800),(2100,'red','Aquib','Javid','2003-12-12','Jeddah','M','0506654789','AJ78965',3985050),(2200,'blue','Zaid','Ansari','2003-01-01','Mumbai','M','0509632000','ZA0101',1450000),(2300,'green','Abdul','Irshad','2020-01-01','Ahmedabad','M','0501234560','AX98740',1210000),(2400,'yellow','Naveed','Buhari','2003-01-20','Chennai','M','0501236540','NB78902',2950000);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `emp_id` int(11) DEFAULT NULL,
  `password` char(10) DEFAULT NULL,
  `name` char(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (230,'green','Omar'),(240,'yellow','Razine'),(210,'red','Muaz'),(220,'blue','Ali'),(100,'head','Haroon'),(110,'culture','Shakoor'),(120,'sports','Muizz');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `simple_loan`
--

DROP TABLE IF EXISTS `simple_loan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `simple_loan` (
  `ID` int(11) DEFAULT NULL,
  `principal_amount` float(10,2) DEFAULT NULL,
  `interest_rate` float(4,2) DEFAULT NULL,
  `time` float(4,2) DEFAULT NULL,
  `final_amount` int(11) DEFAULT NULL,
  KEY `ID` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `simple_loan`
--

LOCK TABLES `simple_loan` WRITE;
/*!40000 ALTER TABLE `simple_loan` DISABLE KEYS */;
INSERT INTO `simple_loan` VALUES (1000,1500.00,2.50,2.00,1575),(1100,1200.00,2.50,5.00,1350),(1300,6000.00,2.00,1.00,6120),(1000,5000.00,2.50,3.00,5375),(1000,1000.00,2.50,3.00,1075);
/*!40000 ALTER TABLE `simple_loan` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-04 17:53:20
