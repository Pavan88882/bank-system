-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: banksystem
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `account_info`
--

DROP TABLE IF EXISTS `account_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_info` (
  `Account_No` bigint NOT NULL,
  `Customer_Id` varchar(5) DEFAULT NULL,
  `Account_Type` varchar(15) DEFAULT NULL,
  `Registration_date` date DEFAULT NULL,
  `Activation_date` date DEFAULT NULL,
  `IFSC_Code` varchar(20) DEFAULT NULL,
  `Interest` decimal(7,2) DEFAULT NULL,
  `Initial_Deposit` bigint DEFAULT NULL,
  PRIMARY KEY (`Account_No`),
  KEY `Acc_Info_fk` (`Customer_Id`),
  KEY `Acc_Info_Bank_fk` (`IFSC_Code`),
  CONSTRAINT `Acc_Info_Bank_fk` FOREIGN KEY (`IFSC_Code`) REFERENCES `bank_info` (`IFSC_code`),
  CONSTRAINT `Acc_Info_fk` FOREIGN KEY (`Customer_Id`) REFERENCES `customer_personal_info` (`Customer_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_info`
--

LOCK TABLES `account_info` WRITE;
/*!40000 ALTER TABLE `account_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bank_info`
--

DROP TABLE IF EXISTS `bank_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bank_info` (
  `IFSC_code` varchar(20) NOT NULL,
  `Bank_Name` varchar(25) DEFAULT NULL,
  `Branch_Name` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`IFSC_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank_info`
--

LOCK TABLES `bank_info` WRITE;
/*!40000 ALTER TABLE `bank_info` DISABLE KEYS */;
INSERT INTO `bank_info` VALUES ('MAHB0000681','Maharashtra Bank','Ranjangaon');
/*!40000 ALTER TABLE `bank_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_personal_info`
--

DROP TABLE IF EXISTS `customer_personal_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_personal_info` (
  `Customer_Id` varchar(5) NOT NULL,
  `Customer_name` varchar(255) DEFAULT NULL,
  `Date_Of_Birth` date DEFAULT NULL,
  `Guardian_Name` varchar(255) DEFAULT NULL,
  `Adress` varchar(255) DEFAULT NULL,
  `Contact_No` bigint DEFAULT NULL,
  `Mail_Id` varchar(30) DEFAULT NULL,
  `Gender` varchar(1) DEFAULT NULL,
  `Marital_Status` varchar(30) DEFAULT NULL,
  `Identification_Doc_Type` varchar(30) DEFAULT NULL,
  `Id_Doc_No` varchar(20) DEFAULT NULL,
  `Citizenship` varchar(10) DEFAULT NULL,
  `age` int DEFAULT NULL,
  PRIMARY KEY (`Customer_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_personal_info`
--

LOCK TABLES `customer_personal_info` WRITE;
/*!40000 ALTER TABLE `customer_personal_info` DISABLE KEYS */;
INSERT INTO `customer_personal_info` VALUES ('1','john','2001-12-14','pavan','pune',7263060464,'aniketjagade9@gmail.com','M','Married','Passport','2092398723','Indian',21),('2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,18);
/*!40000 ALTER TABLE `customer_personal_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_reference_info`
--

DROP TABLE IF EXISTS `customer_reference_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_reference_info` (
  `Customer_id` varchar(5) NOT NULL,
  `Reference_Acc_Name` varchar(20) DEFAULT NULL,
  `Reference_Acc_No` bigint DEFAULT NULL,
  `Reference_Acc_Address` varchar(60) DEFAULT NULL,
  `Relation` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`Customer_id`),
  CONSTRAINT `Cust_Ref_Info_fk` FOREIGN KEY (`Customer_id`) REFERENCES `customer_personal_info` (`Customer_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_reference_info`
--

LOCK TABLES `customer_reference_info` WRITE;
/*!40000 ALTER TABLE `customer_reference_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_reference_info` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-24 11:22:23
