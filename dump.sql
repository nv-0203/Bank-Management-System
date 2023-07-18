-- MySQL dump 10.13  Distrib 8.0.33, for macos13 (arm64)
--
-- Host: localhost    Database: bank
-- ------------------------------------------------------
-- Server version	8.0.33

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
  `ID` int DEFAULT NULL,
  `principal_amount` float(10,2) DEFAULT NULL,
  `interest_rate` float(4,2) DEFAULT NULL,
  `time` float(4,2) DEFAULT NULL,
  `final_amount` int DEFAULT NULL,
  KEY `ID` (`ID`),
  CONSTRAINT `fk_customer_id` FOREIGN KEY (`ID`) REFERENCES `customer` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compound_loan`
--

LOCK TABLES `compound_loan` WRITE;
/*!40000 ALTER TABLE `compound_loan` DISABLE KEYS */;
INSERT INTO `compound_loan` VALUES (1000,2500.00,5.25,3.50,2882),(1001,4200.00,6.80,2.20,4867),(1002,6700.00,4.50,4.80,7838),(1003,1800.00,3.20,1.50,1871),(1004,3200.00,7.50,2.80,3715),(1005,5200.00,4.90,3.20,6075),(1006,4300.00,6.10,1.80,4741),(1007,3800.00,5.75,2.70,4093),(1008,2900.00,3.90,4.30,3568),(1009,4800.00,6.40,3.90,6399),(1010,3600.00,5.00,2.50,4125),(1011,2700.00,4.30,1.20,2773),(1012,2200.00,3.75,2.90,2465),(1013,5800.00,5.60,4.10,6872),(1014,3100.00,4.00,2.30,3518),(1015,4100.00,6.70,3.30,5233),(1000,3900.00,4.50,2.80,4661),(1001,5300.00,6.00,3.50,6798),(1002,2000.00,3.50,1.80,2093),(1003,4500.00,5.90,4.50,5696),(1004,2800.00,5.10,3.70,4393),(1005,6400.00,6.90,2.40,8037),(1006,4900.00,3.60,4.80,7392),(1007,1700.00,2.90,1.60,1878),(1008,2100.00,4.70,2.20,2416),(1009,5100.00,5.00,3.80,6200),(1010,4100.00,6.30,2.80,5271),(1011,3600.00,4.80,2.40,4320),(1012,3900.00,6.10,3.60,5612),(1013,2200.00,3.30,1.90,2275),(1014,3300.00,5.40,2.60,4103);
/*!40000 ALTER TABLE `compound_loan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `ID` int NOT NULL,
  `password` char(10) NOT NULL,
  `name` char(20) DEFAULT NULL,
  `father_name` char(20) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `phone_no` char(10) DEFAULT NULL,
  `passport_no` char(10) DEFAULT NULL,
  `balance` int DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1000,'pass123','John Doe','Michael Doe','1990-05-15','New York','M','555-1234','AB1234567',4946),(1001,'abc456','Jane Smith','Robert Smith','1988-09-22','Los Angeles','F','555-9876','CD7890123',7000),(1002,'pass987','Michael Johnson','David Johnson','1995-03-10','Chicago','M','555-6543','EF4567890',3010),(1003,'qwerty789','Emily Adams','William Adams','1992-12-08','Houston','F','555-3456','GH6789012',4554),(1004,'123abc','Christopher Lee','Richard Lee','1985-07-28','Phoenix','M','555-2345','IJ7890123',5500),(1005,'xyz987','Amanda Wilson','Daniel Wilson','1998-01-02','Philadelphia','F','555-7890','KL9012345',8000),(1006,'hello123','Matthew Brown','Charles Brown','1994-06-20','San Antonio','M','555-8765','MN0123456',3500),(1007,'test456','Olivia Davis','Thomas Davis','1989-11-12','San Diego','F','555-5678','OP1234567',6000),(1008,'pass789','Andrew Miller','James Miller','1991-04-18','Dallas','M','555-4567','QR2345678',4800),(1009,'abc123','Sophia Wilson','John Wilson','1997-08-30','San Jose','F','555-6789','ST3456789',5200),(1010,'qwerty123','Michael Martin','Mark Martin','1993-02-25','Austin','M','555-7654','UV4567890',6500),(1011,'pass456','Isabella Clark','Joseph Clark','1987-10-14','Jacksonville','F','555-4567','WX5678901',4200),(1012,'test123','James Johnson','George Johnson','1996-05-07','Fort Worth','M','555-9876','YZ6789012',3800),(1013,'pass789','Abigail Allen','Christopher Allen','1999-09-01','San Francisco','F','555-8765','AB7890123',7500),(1014,'abc789','David Turner','Daniel Turner','1992-03-26','Columbus','M','555-5678','CD9012345',4200),(1015,'xyz123','Elizabeth Hall','Paul Hall','1995-07-16','Indianapolis','F','555-6543','EF0123456',5500),(1016,'hello456','Joseph Allen','Richard Allen','1988-11-05','Seattle','M','555-3456','GH5678901',6700),(1017,'test789','Mia Walker','Jason Walker','1997-02-23','Denver','F','555-2345','IJ6789012',3200),(1018,'abc123','Alexander Young','Andrew Young','1993-06-12','Washington','M','555-7890','KL7890123',4700),(1019,'xyz456','Ella Scott','Brian Scott','1986-09-28','Boston','F','555-8765','MN9012345',6800),(1020,'pass123','William Moore','Edward Moore','1994-01-03','Nashville','M','555-5678','OP0123456',5200),(1025,'ok123','Rohit','Sharma','1987-02-10','Mumbai','M','901234567','AF3451298',1200),(1030,'123dark','Lionel','Andreas','1980-09-08','Rosario','M','9012091203','LM01234',39000),(1100,'fire','Sam','George','2000-01-01','New York','M','9811191111','AB1234521',10000);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `emp_id` int DEFAULT NULL,
  `password` char(10) DEFAULT NULL,
  `name` char(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (9000,'pass1234','John Johnson'),(9001,'abc456','Jane Anderson'),(9002,'pass9876','Michael Williams'),(9003,'qwerty789','Emily Martinez'),(9004,'123abc','Christopher Lewis'),(9005,'xyz987','Amanda Turner'),(9006,'hello123','Matthew Scott'),(9007,'test456','Olivia Clark'),(9008,'pass789','Andrew Taylor'),(9009,'abc123','Sophia Moore');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `simple_loan`
--

DROP TABLE IF EXISTS `simple_loan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `simple_loan` (
  `ID` int DEFAULT NULL,
  `principal_amount` float(10,2) DEFAULT NULL,
  `interest_rate` float(4,2) DEFAULT NULL,
  `time` float(4,2) DEFAULT NULL,
  `final_amount` int DEFAULT NULL,
  KEY `ID` (`ID`),
  CONSTRAINT `fk_cutomer_id` FOREIGN KEY (`ID`) REFERENCES `customer` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `simple_loan`
--

LOCK TABLES `simple_loan` WRITE;
/*!40000 ALTER TABLE `simple_loan` DISABLE KEYS */;
INSERT INTO `simple_loan` VALUES (1000,5000.00,5.25,12.00,5500),(1001,7000.00,4.75,24.00,7500),(1002,3000.00,6.50,36.00,3500),(1003,4500.00,4.25,48.00,5000),(1004,5500.00,5.75,60.00,6000),(1005,8000.00,6.25,12.00,8500),(1006,3500.00,4.50,24.00,4000),(1007,6000.00,5.00,36.00,6500),(1008,4800.00,4.75,48.00,5300),(1009,5200.00,6.00,60.00,5800),(1002,10.00,1.00,1.00,10);
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

-- Dump completed on 2023-07-18 15:05:01
