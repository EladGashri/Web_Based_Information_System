CREATE DATABASE  IF NOT EXISTS `group2` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `group2`;
-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: group2
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `batch`
--

DROP TABLE IF EXISTS `batch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `batch` (
  `item_id` int NOT NULL,
  `manufacture_date` date NOT NULL,
  `expiration_date` date NOT NULL,
  PRIMARY KEY (`item_id`,`manufacture_date`,`expiration_date`),
  UNIQUE KEY `batch_item_id_uindex` (`item_id`),
  CONSTRAINT `batch_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batch`
--

LOCK TABLES `batch` WRITE;
/*!40000 ALTER TABLE `batch` DISABLE KEYS */;
INSERT INTO `batch` VALUES (33221,'2020-03-12','2030-08-12'),(37658,'2020-02-05','2022-11-10'),(39029,'2020-01-19','2025-07-20'),(49382,'2019-12-20','2024-12-10'),(55872,'2020-01-02','2021-07-10'),(77362,'2019-09-18','2021-05-18');
/*!40000 ALTER TABLE `batch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business`
--

DROP TABLE IF EXISTS `business`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `business` (
  `u_name` varchar(30) NOT NULL,
  `company_name` varchar(30) NOT NULL,
  `contact_person` varchar(30) NOT NULL,
  `licence_number` int NOT NULL,
  PRIMARY KEY (`u_name`),
  UNIQUE KEY `business_user_name_uindex` (`u_name`),
  CONSTRAINT `business_ibfk_1` FOREIGN KEY (`u_name`) REFERENCES `customer` (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business`
--

LOCK TABLES `business` WRITE;
/*!40000 ALTER TABLE `business` DISABLE KEYS */;
INSERT INTO `business` VALUES ('Beilinson_PTK','Beilinson Medical Center','Yosi Abutbul',45673281),('donni_OWA','OWA','Donni epstein',9678434),('hunter_DDB','DDB','Alex Hunter',342544),('Ichilov_TA','Ichilov Medical Center','Dani Azrieli',6377585),('Ilon_OSS','OSS','Roni Cohen',65647),('Leumi_gv','Leumi','Sara Ben-Shabat',76132987),('ronen_PPR','PPR','Ronen Goldberg',664410);
/*!40000 ALTER TABLE `business` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business_type`
--

DROP TABLE IF EXISTS `business_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `business_type` (
  `user_name` varchar(30) NOT NULL,
  `type` varchar(30) NOT NULL,
  PRIMARY KEY (`user_name`),
  UNIQUE KEY `business_type_user_name_uindex` (`user_name`),
  CONSTRAINT `business_type_ibfk_1` FOREIGN KEY (`user_name`) REFERENCES `business` (`u_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_type`
--

LOCK TABLES `business_type` WRITE;
/*!40000 ALTER TABLE `business_type` DISABLE KEYS */;
INSERT INTO `business_type` VALUES ('Beilinson_PTK','Hospital'),('donni_OWA','HMO'),('hunter_DDB','Hospital'),('Ichilov_TA','Hospital'),('Ilon_OSS','Mental Health Institution'),('Leumi_gv','HMO'),('ronen_PPR','Hostel');
/*!40000 ALTER TABLE `business_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `u_name` varchar(30) NOT NULL,
  `it_id` int NOT NULL,
  `amount` int DEFAULT NULL,
  PRIMARY KEY (`u_name`,`it_id`),
  KEY `fk_item` (`it_id`),
  CONSTRAINT `fk_customer` FOREIGN KEY (`u_name`) REFERENCES `customer` (`user_name`),
  CONSTRAINT `fk_item` FOREIGN KEY (`it_id`) REFERENCES `item` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES ('Leumi_gv',49302,100),('Leumi_gv',74849,5),('ronen_PPR',22332,4),('ronen_PPR',49302,100);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consultation`
--

DROP TABLE IF EXISTS `consultation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consultation` (
  `consultation_id` int NOT NULL,
  `consultation_date` date DEFAULT NULL,
  `physician_id` int DEFAULT NULL,
  `customer_user_name` varchar(30) DEFAULT NULL,
  `summary` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`consultation_id`),
  UNIQUE KEY `consultation_consultation_id_uindex` (`consultation_id`),
  KEY `customer_user_name` (`customer_user_name`),
  KEY `physician_id` (`physician_id`),
  CONSTRAINT `consultation_ibfk_1` FOREIGN KEY (`physician_id`) REFERENCES `physicians` (`employee_id`),
  CONSTRAINT `consultation_ibfk_2` FOREIGN KEY (`customer_user_name`) REFERENCES `private` (`u_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consultation`
--

LOCK TABLES `consultation` WRITE;
/*!40000 ALTER TABLE `consultation` DISABLE KEYS */;
INSERT INTO `consultation` VALUES (34576,'2020-04-28',65200686,'DanielQ2','Consultation was set up in order to check progress of usage of medical item for COVID-19. Customer has been advised to keep using registered items.'),(43678,'2020-04-11',18745343,'Odeliiaa44','Consultation was set up in order to check progress of usage of medical item for COVID-19. Customer has been advised to keep using registered items.'),(70021,'2020-01-07',84437632,'IbnMusa7','Consultation was set up in order to examine proper medical items for current mental state. Customer has been advised the registed items.'),(98563,'2020-02-08',34727906,'Erika56','Consultation was set up in order to examine proper medical items for current mental state. Customer has been advised the registed items.'),(265114,'2020-01-11',34727906,'IbnMusa7','Consultation was set up in order to examine proper medical items for current mental state. Customer has been advised the registed items.'),(342337,'2020-04-25',84437632,'Kobiiee53','Consultation was set up in order to examine proper medical items for current mental state. Customer has been advised the registed items.');
/*!40000 ALTER TABLE `consultation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact` (
  `contact_name` varchar(50) NOT NULL,
  `contact_email` varchar(50) NOT NULL,
  `contact_text` varchar(500) NOT NULL,
  PRIMARY KEY (`contact_name`,`contact_email`,`contact_text`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
INSERT INTO `contact` VALUES ('Elad Gashri','eladgashri@gmail.com','Hi'),('Yoni','yoni@gmail.com','Hi');
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `user_name` varchar(30) NOT NULL,
  `user_password` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `phone_number` bigint NOT NULL,
  `cc_number` bigint DEFAULT NULL,
  `street` varchar(30) DEFAULT NULL,
  `st_number` int DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `customer_management_id` int DEFAULT NULL,
  PRIMARY KEY (`user_name`),
  UNIQUE KEY `customer_email_uindex` (`email`),
  KEY `cc_number` (`cc_number`),
  KEY `customer_management_id` (`customer_management_id`),
  CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`customer_management_id`) REFERENCES `customers_management` (`employee_id`),
  CONSTRAINT `customer_ibfk_2` FOREIGN KEY (`cc_number`) REFERENCES `customer_cc` (`cc_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('Beilinson_PTK','IsThisCityExist?7','meir@rmc.gov.il',97239376363,4580578234475120,'Zeev Jabutinsky Rd',39,'PetahTikva',26215867),('DanielQ2','WhatIsLovee','dannieboy@gmail.com',97254538296,5385432265478650,'Hahaaliya',165,'Ashkelon',46325233),('donni_OWA','donald1278','donnie@ows.co.il',97237467543,3365735697891660,'Reut',22,'Haifa',46325233),('elad','elad','elad@walla.com',972111111111,1111111111111111,'aaaa',1,'tel aviv',10129438),('Erika56','ThisIsMee21','ericaa@gmail.com',97234582532,4938227432981740,'Ibn Gvirol',5,'Tel Aviv',24450768),('hunter_DDB','huntie111','hunter@ddb.co.il',97233532232,6344321154336570,'Hayarkon',4,'Tel Aviv',26215867),('IbnMusa7','helloworldd55','ibniim@gmail.com',97234582254,4958443309503870,'Hamelachim',245,'Eilat',46325233),('Ichilov_TA','WeMissJlm7','Navac@tlvmc.gov.il',97236974730,4580347923457130,'Weizmann',6,'Tel Aviv',10129438),('Ilon_OSS','ConnectMeNow','ilon@oss.co.il',97237564332,5437664378955990,'Hamacabim',43,'Tel Aviv',24450768),('katie2256','CallMe1111','katiedd@gmail.com',97265843266,3968473626112540,'Hana Senesh',75,'Tel Aviv',26215867),('Kobiiee53','SoBeIt23','kobi1111@gmail.com',97248329543,2337328990122180,'Yerushalayim',22,'Tel Aviv',10129438),('Leumi_gv','ido235544','medsupport@leumi.com',97239372367,2985746325547960,'Oveltin',28,'Haifa',10129438),('Odeliiaa44','OdiCatodii','odeliat@gmail.com',97237564887,4933827543882980,'Florentin',11,'Tel Aviv',24450768),('ronen_PPR','ronennppr1','ronen@ppr.co.il',97237543266,4985549983221980,'Hashomer',157,'Bat Yam',10129438),('yoni','12345678','yoni@walla.com',972545878790,1234123412341234,'Sami',1,'Haifa',10129438);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_cc`
--

DROP TABLE IF EXISTS `customer_cc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_cc` (
  `cc_number` bigint NOT NULL,
  `validation_date` int DEFAULT NULL,
  `csv` int DEFAULT NULL,
  PRIMARY KEY (`cc_number`),
  UNIQUE KEY `customer_cc_cc_number_uindex` (`cc_number`),
  CONSTRAINT `fk_costumer_cc` FOREIGN KEY (`cc_number`) REFERENCES `customer` (`cc_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_cc`
--

LOCK TABLES `customer_cc` WRITE;
/*!40000 ALTER TABLE `customer_cc` DISABLE KEYS */;
INSERT INTO `customer_cc` VALUES (1111111111111111,111,111),(1234123412341234,1234,123),(2337328990122180,1021,558),(2985746325547960,324,648),(3365735697891660,1225,332),(3968473626112540,321,954),(4580347923457130,1224,132),(4580578234475120,1023,357),(4933827543882980,1222,951),(4938227432981740,1123,543),(4958443309503870,1222,541),(4985549983221980,125,525),(5385432265478650,1225,436),(5437664378955990,421,435),(6344321154336570,1222,643);
/*!40000 ALTER TABLE `customer_cc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_purchased`
--

DROP TABLE IF EXISTS `customer_purchased`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_purchased` (
  `u_name` varchar(30) NOT NULL,
  `it_id` int NOT NULL,
  `amount` int DEFAULT NULL,
  `purchase_date` date DEFAULT NULL,
  PRIMARY KEY (`u_name`,`it_id`),
  KEY `fk_purchase_item` (`it_id`),
  CONSTRAINT `fk_purchase_customer` FOREIGN KEY (`u_name`) REFERENCES `customer` (`user_name`),
  CONSTRAINT `fk_purchase_item` FOREIGN KEY (`it_id`) REFERENCES `item` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_purchased`
--

LOCK TABLES `customer_purchased` WRITE;
/*!40000 ALTER TABLE `customer_purchased` DISABLE KEYS */;
INSERT INTO `customer_purchased` VALUES ('elad',22332,1,'2020-07-28'),('Leumi_gv',13321,10,'2020-07-08'),('Leumi_gv',74849,4,'2020-07-08'),('Leumi_gv',77362,7,'2020-07-08'),('ronen_PPR',33221,10,'2020-04-07');
/*!40000 ALTER TABLE `customer_purchased` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers_management`
--

DROP TABLE IF EXISTS `customers_management`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers_management` (
  `employee_id` int NOT NULL,
  `rank` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  UNIQUE KEY `customers_management_employee_id_uindex` (`employee_id`),
  CONSTRAINT `customers_management_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers_management`
--

LOCK TABLES `customers_management` WRITE;
/*!40000 ALTER TABLE `customers_management` DISABLE KEYS */;
INSERT INTO `customers_management` VALUES (10129438,'Customer Manager'),(24450768,'Customer Manager'),(26215867,'Customer Manager'),(46322674,'Senior Manager'),(46325233,'Customer Manager'),(99020933,'Technical Support');
/*!40000 ALTER TABLE `customers_management` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery`
--

DROP TABLE IF EXISTS `delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery` (
  `delivery_id` int NOT NULL,
  `delivery_date` date DEFAULT NULL,
  PRIMARY KEY (`delivery_id`),
  UNIQUE KEY `delivery_delivery_id_uindex` (`delivery_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery`
--

LOCK TABLES `delivery` WRITE;
/*!40000 ALTER TABLE `delivery` DISABLE KEYS */;
INSERT INTO `delivery` VALUES (12124,'2020-08-04'),(19309,'2020-08-20'),(30002,'2020-09-30'),(50994,'2020-09-17'),(55000,'2020-09-25'),(98367,'2020-07-19'),(299282,'2019-10-17'),(388837,'2019-07-06'),(488372,'2019-12-10'),(663772,'2020-03-17'),(884732,'2019-08-08'),(991882,'2019-08-08');
/*!40000 ALTER TABLE `delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email`
--

DROP TABLE IF EXISTS `email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email` (
  `email_adress` varchar(50) NOT NULL,
  PRIMARY KEY (`email_adress`),
  UNIQUE KEY `email_adress` (`email_adress`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email`
--

LOCK TABLES `email` WRITE;
/*!40000 ALTER TABLE `email` DISABLE KEYS */;
INSERT INTO `email` VALUES ('eladgashri@gmail.com'),('yoni@gmail.com');
/*!40000 ALTER TABLE `email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `employee_id` int NOT NULL,
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `phone_num` bigint DEFAULT NULL,
  `Street` varchar(30) DEFAULT NULL,
  `street_number` int DEFAULT NULL,
  `City` varchar(30) DEFAULT NULL,
  `salary` int DEFAULT NULL,
  `seniority` float DEFAULT NULL,
  `manager_id` int DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  UNIQUE KEY `employee_employee_id_uindex` (`employee_id`),
  KEY `manager_id` (`manager_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (26665,'Oz','Tokel',97253332367,'Ibn Gvirol',3,'Tel_Aviv',10000,1,474654),(34376,'Dor','Levi',97233332367,'Dizangof',2,'Tel_Aviv',10000,1,474654),(34656,'Adi','Cohen',97283332367,'Tamar',58,'Tel_Aviv',9000,1,474654),(98465,'Dov','Levi',97234532367,'Nablus_RD',42,'Tel_Aviv',8000,1,474654),(235457,'Shay','Cohen',97233332367,'King George',54,'Tel_Aviv',10000,1,474654),(236676,'Ron','Adva',97234532367,'Hatayelet',62,'Tel_Aviv',10000,1,474654),(265412,'Avihai','Ton',97233332367,'Ibn Gvirol',23,'Tel_Aviv',8000,1,474654),(456214,'Ran','Akesa',97233332367,'Hertzel',7,'Tel_Aviv',8000,1,474654),(474654,'Shimi','Koll',97239372167,'Bugrashov',6,'Tel_Aviv',50000,10,NULL),(662134,'Netanel','Kash',97233332367,'Hertzel',55,'Tel_Aviv',10000,1,474654),(786475,'Avi','Moniki',97234565367,'King George',7,'Tel_Aviv',8000,1,474654),(2627543,'Tal','Yigh',97233332367,'King George',26,'Tel_Aviv',9000,1,474654),(2651143,'Avi','Izik',97239372388,'Dizangof',2,'Tel_Aviv',9000,4,474654),(3943584,'Daniel','Levi',97239372344,'Tamar',10,'Tel_Aviv',9000,5,474654),(5733896,'Pablo','Escobar',97236672444,'Nablus_RD',14,'Tel_Aviv',7000,1,474654),(6542227,'Ronen','Danel',97275472367,'Tzahala',9,'Tel_Aviv',29000,1,474654),(7469022,'Eviatar','Shore',97239372136,'Ibn Gvirol',5,'Tel_Aviv',14000,2,474654),(7620734,'Hertzel','Avitan',97239372365,'Neubaugasse',32,'Tel_Aviv',8000,1,474654),(10129438,'Frank','Wosh',97230652367,'Hagalil',75,'Tel_Aviv',8000,0,474654),(18745343,'Shonna','Levi',97245452367,'Hatayelet',22,'Tel_Aviv',7000,0,474654),(24450768,'Ido','Cohen',97239372067,'Hapardes',252,'Tel_Aviv',16000,1,474654),(26215867,'Oran','Akols',97239370067,'King George',54,'Tel_Aviv',27000,5,474654),(34727906,'Tal','aslo',97266472367,'Jabotinsky',6,'Tel_Aviv',11000,0,474654),(46322674,'Dan','Cohen',97239242367,'Dizangof',77,'Tel_Aviv',31000,4,474654),(46325233,'Itamar','Tam',97239742367,'Ibn Gvirol',33,'Tel_Aviv',12000,1,474654),(59565743,'Ron','Cohen',97233332367,'Haarbaa',52,'Tel_Aviv',15000,1,474654),(64438721,'Donald','Cach',97236572367,'Yehuda Halevi',523,'Tel_Aviv',10000,1,474654),(65200686,'Itzhak','Cohen',97235272367,'Hatayelet',23,'Tel_Aviv',22000,2,474654),(84437632,'Benny','dol',97234372367,'Alenbi',31,'Tel_Aviv',20000,2,474654),(99020933,'Israel','Donda',97239334367,'Ben Gurion',31,'Tel_Aviv',9000,0,474654);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_user`
--

DROP TABLE IF EXISTS `employee_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_user` (
  `user` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `id` int NOT NULL,
  PRIMARY KEY (`user`),
  UNIQUE KEY `employee_user_id_uindex` (`id`),
  UNIQUE KEY `employee_user_password_uindex` (`password`),
  UNIQUE KEY `employee_user_user_uindex` (`user`),
  CONSTRAINT `fk_employee_user` FOREIGN KEY (`id`) REFERENCES `employee` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_user`
--

LOCK TABLES `employee_user` WRITE;
/*!40000 ALTER TABLE `employee_user` DISABLE KEYS */;
INSERT INTO `employee_user` VALUES ('dba','dba',662134);
/*!40000 ALTER TABLE `employee_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `export_delivery`
--

DROP TABLE IF EXISTS `export_delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `export_delivery` (
  `delivery_id` int NOT NULL,
  PRIMARY KEY (`delivery_id`),
  UNIQUE KEY `export_delivery_delivery_id_uindex` (`delivery_id`),
  CONSTRAINT `export_delivery_ibfk_1` FOREIGN KEY (`delivery_id`) REFERENCES `delivery` (`delivery_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `export_delivery`
--

LOCK TABLES `export_delivery` WRITE;
/*!40000 ALTER TABLE `export_delivery` DISABLE KEYS */;
INSERT INTO `export_delivery` VALUES (12124),(19309),(30002),(50994),(55000),(98367);
/*!40000 ALTER TABLE `export_delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `going_to`
--

DROP TABLE IF EXISTS `going_to`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `going_to` (
  `user_name_customer` varchar(50) NOT NULL,
  `export_delivery_ID` int NOT NULL,
  PRIMARY KEY (`user_name_customer`,`export_delivery_ID`),
  KEY `export_delivery_ID` (`export_delivery_ID`),
  CONSTRAINT `going_to_ibfk_1` FOREIGN KEY (`user_name_customer`) REFERENCES `customer` (`user_name`),
  CONSTRAINT `going_to_ibfk_2` FOREIGN KEY (`export_delivery_ID`) REFERENCES `export_delivery` (`delivery_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `going_to`
--

LOCK TABLES `going_to` WRITE;
/*!40000 ALTER TABLE `going_to` DISABLE KEYS */;
INSERT INTO `going_to` VALUES ('IbnMusa7',12124),('donni_OWA',19309),('hunter_DDB',30002),('ronen_PPR',50994),('Erika56',55000),('Ilon_OSS',98367);
/*!40000 ALTER TABLE `going_to` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `handling_delivery`
--

DROP TABLE IF EXISTS `handling_delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `handling_delivery` (
  `delivery_id` int NOT NULL,
  `inventory_worker_id` int NOT NULL,
  PRIMARY KEY (`delivery_id`,`inventory_worker_id`),
  KEY `inventory_worker_id` (`inventory_worker_id`),
  CONSTRAINT `handling_delivery_ibfk_1` FOREIGN KEY (`delivery_id`) REFERENCES `delivery` (`delivery_id`),
  CONSTRAINT `handling_delivery_ibfk_2` FOREIGN KEY (`inventory_worker_id`) REFERENCES `inventory_worker` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `handling_delivery`
--

LOCK TABLES `handling_delivery` WRITE;
/*!40000 ALTER TABLE `handling_delivery` DISABLE KEYS */;
INSERT INTO `handling_delivery` VALUES (55000,235457),(30002,265412),(12124,456214),(19309,2627543),(50994,59565743),(98367,59565743);
/*!40000 ALTER TABLE `handling_delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `import_delivery`
--

DROP TABLE IF EXISTS `import_delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `import_delivery` (
  `delivery_id` int NOT NULL,
  `company_id` int NOT NULL,
  PRIMARY KEY (`delivery_id`),
  KEY `company_id` (`company_id`),
  CONSTRAINT `import_delivery_ibfk_1` FOREIGN KEY (`delivery_id`) REFERENCES `delivery` (`delivery_id`),
  CONSTRAINT `import_delivery_ibfk_2` FOREIGN KEY (`company_id`) REFERENCES `supplier` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `import_delivery`
--

LOCK TABLES `import_delivery` WRITE;
/*!40000 ALTER TABLE `import_delivery` DISABLE KEYS */;
INSERT INTO `import_delivery` VALUES (488372,11244),(388837,12312),(991882,22003),(663772,23990),(299282,44332),(884732,77383);
/*!40000 ALTER TABLE `import_delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_worker`
--

DROP TABLE IF EXISTS `inventory_worker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory_worker` (
  `employee_id` int NOT NULL,
  `employee_position` varchar(30) NOT NULL,
  PRIMARY KEY (`employee_id`),
  UNIQUE KEY `inventory_worker_employee_id_uindex` (`employee_id`),
  CONSTRAINT `inventory_worker_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_worker`
--

LOCK TABLES `inventory_worker` WRITE;
/*!40000 ALTER TABLE `inventory_worker` DISABLE KEYS */;
INSERT INTO `inventory_worker` VALUES (235457,'Package Handler'),(265412,'Package Handler'),(456214,'Package Handler'),(662134,'Data Base Administrtor'),(2627543,'Package Handler'),(59565743,'Package Handler');
/*!40000 ALTER TABLE `inventory_worker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `item_id` int NOT NULL,
  `inventory_amount` int DEFAULT NULL,
  `item_name` varchar(30) NOT NULL,
  `price` float NOT NULL,
  `description` varchar(5000) DEFAULT NULL,
  `item_img` varchar(30) DEFAULT NULL,
  `discount_percent` int DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  UNIQUE KEY `item_item_id_uindex` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (13321,8,'Tomotherapy Machine',780000,'Verifying the location of each tumor before treatment.\nTargeting tumors with optimal levels of radiation.\nMinimizing the damage to surrounding, healthy areas.\nReducing the side effects of radiation therapy.','media/img/13321.jpg',7),(22332,90000,'Goggles',10,'High-definition beam shaping.\nCombination of fast leaves and High Dose Rate mode.\nReal-time leaf positioning.\nMultifunctional platform.\nUltra-low MLC leakage.\nPredictive maintenance.','media/img/22332.jpg',NULL),(28373,4,'Linear Accelerator',321000,'Deliver high-energy X-rays that conform to the specific size, shape and location of a tumor.\nCan target and destroy cancerous cells in a precise area of a patient’s body.\nMinimal exposure to the surrounding healthy tissue.\nHas several built-in protective measures designed to prevent the delivery of dosages in excess of the prescribed amount.\nCan be used to treat cancer in virtually any area of the body.\nCan also be used to execute a variety of radiation delivery techniques.','media/img/28373.jpg',5),(33221,40000,'Coronavirus Gloves',3,'The best latex free gloves.\nFeaturing chemical and cut resistant nitrile rubber.\nOur gloves are 15 mils thick for maximum hygiene, durability and dexterity.\nThey are also featuring odor resistant flock lining and slip resistant texturing.','media/img/33221.jpg',NULL),(37658,25432,'Test Kits',15,'Helps patients to safely manage chemotherapy spills.\nInstruction booklet features very easy to understand step-by-step instructions with pictures.\nQuality, chemo-approved products are selected for ease of use by patients and family with no health-care knowledge.\nSingle use.','media/img/37658.jpg',15),(39029,36,'Magnetic Seizure Therapy',20000,'An innovative therapeutic method.\nSignificant clinical and quality of life improvement.\nDemonstrated evidence for feasibility in patients with treatment-resistant schizophrenia.','media/img/39029.jpg',NULL),(40032,40,'Deep Brain Stimulation',2000,'Programmable DBS system to provide the best symptom control for you. As your symptoms change over time, the programming can be changed.\nOption to adjust the settings to minimize side effects while providing the best possible symptom control.\nHas been rigorously assessed with level one evidence.\nFDA approved for people with Parkinson\'s who had recent onset of movement symptoms.','media/img/40032.jpg',10),(40039,100,'Repetitive Transcranial Magnet',2000,'Brain stimulation therapy used to treat depression and anxiety.\nInduces an electrical current in specific nerve cells.\nFDA approved as a treatment for major depression when other treatments haven’t been effective.\nDramatically reducing depression\'s symptoms.','media/img/40039.jpg',NULL),(44030,1200,'Home Oxygen',70000,'The elderly: Improving brain functioning as they develop dementia and other conditions.\nWhite-collar women: Skin care, Skin nutrition and elasticity maintenance, Reduction of sub-health status.\nBusinessman: Relaxing physical and mental tension, Improves physical ability, Reducing sub-health status and improving work efficiency.\nStudents: Improving remembrance and reducing mental fatigue.','media/img/44030.jpg',NULL),(48377,900,'Vagus Nerve Stimulation',1000,'Device implanted under the skin.\nSends electrical pulses through the left vagus nerve.\nHas a favorable effect on mood, especially depressive symptoms.\n32% of depressed people responded to VSN and 14% had a full remission of symptoms.','media/img/48377.jpg',NULL),(49302,30000,'Remdesevir',200,'An investigational nucleotide analog with broad-spectrum antiviral activity.\nSafe and effective treatment for COVID-19.\nWith potential for some patients to be treated with only a 5-day regimen.\nHelp hospitals and healthcare workers treat more patients in urgent need of care.','media/img/49302.jpg',NULL),(49382,700000,'Surgical Masks',1,'A wide variety of highly protective face masks.\nProviding full protection against viral air infection.\nExists in various colors and shapes.\nFit for daily use and for medical specialists.','media/img/49382.jpg',NULL),(55872,1485,'Home Chemotherapy Spill Kit',15,'Helps patients to safely manage chemotherapy spills.\nInstruction booklet features very easy to understand step-by-step instructions with pictures.\nQuality, chemo-approved products are selected for ease of use by patients and family with no health-care knowledge.\nSingle use.','media/img/55872.jpg',NULL),(74839,4,'Ct Scan',150000,'Designed for applications where many components must be inspected quickly.\nWide-Area Detector CT now with Deep Learning Spectral.\nOne rotation to acquire a whole heart.\nStroke assessment in under 5 minutes.\nSimple and streamlined CT Fluoroscopy.','media/img/74839.jpg',12),(74849,80,'Ventilators',10000,'Different treatment options can be provided according to patients\' needs, from CPAP to S, T, S / T, VGPS five modes.\nWith real-time monitoring 8 kinds of respiratory parameters.\nWith independent medical grade humidifier, better humidification and heating.\nWith oxygen cylinder slot easy to move the cylinder with trolley.\nRecording function (SD card).\nMaximum leak compensation function. 60L/min.\nAdjustable trigger sensitivity.\nWith full face mask.\nWith trolley, easy to move the device.\nAlarm function.','media/img/74849.jpg',NULL),(77362,8000,'Gowns',100,'Good tensile strength.\nNon-Irritating to skin.\nOdorless.\nLightweight, soft, breathable.\nImpervious and water-proof.\nSanitation and quality in accordance with the EN 93/42/CE standard.','media/img/77362.jpg',NULL),(84739,130,'Sonogram',54000,'A class leading operating temperature range.\nA rugged aluminum casing with no air intake.\nMeet a wide range of inspection demands regardless of the environment.\n10.4″ high resolution display\nOne of largest size ratios when compared to an instrument’s total footprint.\nCan be operated when wearing gloves.\nHighly responsive touch screen offers the best resolution in its class','media/img/84739.jpg',NULL),(92837,3,'MRI Scan',2570000,'Free-breathing exams with Compressed Sensing improve the patient experience.\nExpanded BioMatrix Tuners adapt to challenging body regions to provide excellent homogeneity.\nNew anatomy-adaptive coils for improved patient comfort.\nNew BioMatrix Sensors capture respiratory and cardiac motion for increased consistency.\nBioMatrix dockable table with eDrive assistance and AutoDocking.\nCost-efficient energy management with EcoPower.','media/img/92837.jpg',NULL);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_class`
--

DROP TABLE IF EXISTS `item_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_class` (
  `id` int NOT NULL,
  `item_class` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `item_class_item_id_uindex` (`id`),
  CONSTRAINT `item_class_ibfk_1` FOREIGN KEY (`id`) REFERENCES `item` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_class`
--

LOCK TABLES `item_class` WRITE;
/*!40000 ALTER TABLE `item_class` DISABLE KEYS */;
INSERT INTO `item_class` VALUES (13321,'oncology'),(22332,'corona'),(28373,'oncology'),(33221,'corona'),(37658,'corona'),(39029,'psychiatry'),(40032,'psychiatry'),(40039,'psychiatry'),(44030,'oncology'),(48377,'psychiatry'),(49302,'corona'),(49382,'corona'),(55872,'oncology'),(74839,'oncology'),(74849,'corona'),(77362,'corona'),(84739,'oncology'),(92837,'oncology');
/*!40000 ALTER TABLE `item_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_department`
--

DROP TABLE IF EXISTS `item_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_department` (
  `it_id` int NOT NULL,
  `department` varchar(30) NOT NULL,
  PRIMARY KEY (`it_id`,`department`),
  CONSTRAINT `item_department_ibfk_1` FOREIGN KEY (`it_id`) REFERENCES `item` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_department`
--

LOCK TABLES `item_department` WRITE;
/*!40000 ALTER TABLE `item_department` DISABLE KEYS */;
INSERT INTO `item_department` VALUES (13321,'business'),(22332,'business'),(22332,'private'),(28373,'business'),(33221,'business'),(33221,'private'),(37658,'business'),(37658,'private'),(39029,'business'),(40032,'business'),(40039,'business'),(40039,'private'),(44030,'business'),(44030,'private'),(48377,'business'),(48377,'private'),(49302,'business'),(49302,'private'),(49382,'business'),(49382,'private'),(55872,'business'),(55872,'private'),(74839,'business'),(74849,'business'),(74849,'private'),(77362,'business'),(77362,'private'),(84739,'business'),(92837,'business');
/*!40000 ALTER TABLE `item_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_in_delivery`
--

DROP TABLE IF EXISTS `item_in_delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_in_delivery` (
  `delivery_id` int NOT NULL,
  `item_id` int NOT NULL,
  `delivery_amount` int NOT NULL,
  PRIMARY KEY (`delivery_id`,`item_id`),
  UNIQUE KEY `item_in_delivery_delivery_id_uindex` (`delivery_id`),
  KEY `item_id` (`item_id`),
  CONSTRAINT `item_in_delivery_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`),
  CONSTRAINT `item_in_delivery_ibfk_2` FOREIGN KEY (`delivery_id`) REFERENCES `delivery` (`delivery_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_in_delivery`
--

LOCK TABLES `item_in_delivery` WRITE;
/*!40000 ALTER TABLE `item_in_delivery` DISABLE KEYS */;
INSERT INTO `item_in_delivery` VALUES (12124,39029,74),(19309,55872,290),(30002,49382,322),(50994,77362,800),(55000,33221,90),(98367,37658,28);
/*!40000 ALTER TABLE `item_in_delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_in_order`
--

DROP TABLE IF EXISTS `item_in_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_in_order` (
  `order_id` int NOT NULL,
  `item_id` int NOT NULL,
  `order_amount` int NOT NULL,
  PRIMARY KEY (`order_id`,`item_id`),
  KEY `item_id` (`item_id`),
  CONSTRAINT `item_in_order_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `item_in_order_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_in_order`
--

LOCK TABLES `item_in_order` WRITE;
/*!40000 ALTER TABLE `item_in_order` DISABLE KEYS */;
INSERT INTO `item_in_order` VALUES (23452,55872,2500),(56789,37658,100),(222676,39029,700),(534436,77362,3470),(636977,33221,10000),(1246332,49382,10000);
/*!40000 ALTER TABLE `item_in_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_in_purchase`
--

DROP TABLE IF EXISTS `item_in_purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_in_purchase` (
  `purchase_id` int NOT NULL,
  `item_id` int NOT NULL,
  `purchase_amount` int NOT NULL,
  PRIMARY KEY (`purchase_id`,`item_id`),
  KEY `item_id` (`item_id`),
  CONSTRAINT `item_in_purchase_ibfk_1` FOREIGN KEY (`purchase_id`) REFERENCES `purchase` (`purchase_id`),
  CONSTRAINT `item_in_purchase_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_in_purchase`
--

LOCK TABLES `item_in_purchase` WRITE;
/*!40000 ALTER TABLE `item_in_purchase` DISABLE KEYS */;
INSERT INTO `item_in_purchase` VALUES (22331,49382,400),(39920,55872,14),(66473,39029,12),(88473,37658,705),(99282,77362,60),(99837,33221,31);
/*!40000 ALTER TABLE `item_in_purchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_received_by`
--

DROP TABLE IF EXISTS `order_received_by`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_received_by` (
  `inventory_worker_id` int NOT NULL,
  `order_id` int NOT NULL,
  PRIMARY KEY (`inventory_worker_id`,`order_id`),
  KEY `fk_order_id_order_received_by` (`order_id`),
  CONSTRAINT `fk_inventory_worker_order_received_by` FOREIGN KEY (`inventory_worker_id`) REFERENCES `inventory_worker` (`employee_id`),
  CONSTRAINT `fk_order_id_order_received_by` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_received_by`
--

LOCK TABLES `order_received_by` WRITE;
/*!40000 ALTER TABLE `order_received_by` DISABLE KEYS */;
INSERT INTO `order_received_by` VALUES (2627543,23452),(59565743,56789),(456214,222676),(59565743,534436),(235457,636977),(265412,1246332);
/*!40000 ALTER TABLE `order_received_by` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL,
  `order_date` date DEFAULT NULL,
  `customer_user_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `orders_order_id_uindex` (`order_id`),
  KEY `customer_user_name` (`customer_user_name`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_user_name`) REFERENCES `customer` (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (23452,'2020-01-02','Erika56'),(56789,'2020-05-02','Ichilov_TA'),(222676,'2020-05-22','Odeliiaa44'),(534436,'2020-02-02','Ichilov_TA'),(636977,'2020-03-03','Ichilov_TA'),(1246332,'2020-05-02','Leumi_gv');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `physicians`
--

DROP TABLE IF EXISTS `physicians`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `physicians` (
  `employee_id` int NOT NULL,
  PRIMARY KEY (`employee_id`),
  UNIQUE KEY `physicians_employee_id_uindex` (`employee_id`),
  CONSTRAINT `physicians_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `physicians`
--

LOCK TABLES `physicians` WRITE;
/*!40000 ALTER TABLE `physicians` DISABLE KEYS */;
INSERT INTO `physicians` VALUES (474654),(18745343),(34727906),(64438721),(65200686),(84437632);
/*!40000 ALTER TABLE `physicians` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `physicians_internships`
--

DROP TABLE IF EXISTS `physicians_internships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `physicians_internships` (
  `employee_id` int NOT NULL,
  `internships` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  CONSTRAINT `physicians_internships_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `physicians` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `physicians_internships`
--

LOCK TABLES `physicians_internships` WRITE;
/*!40000 ALTER TABLE `physicians_internships` DISABLE KEYS */;
INSERT INTO `physicians_internships` VALUES (474654,'Oncology'),(18745343,'Infectious Disease'),(34727906,'Psychiatry'),(64438721,'Oncology'),(65200686,'Infectious Disease'),(84437632,'Psychiatry');
/*!40000 ALTER TABLE `physicians_internships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `private`
--

DROP TABLE IF EXISTS `private`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `private` (
  `u_name` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  PRIMARY KEY (`u_name`),
  CONSTRAINT `private_ibfk_1` FOREIGN KEY (`u_name`) REFERENCES `customer` (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `private`
--

LOCK TABLES `private` WRITE;
/*!40000 ALTER TABLE `private` DISABLE KEYS */;
INSERT INTO `private` VALUES ('DanielQ2','Daniel','Cohen'),('elad','elad','gashri'),('Erika56','Erika','Schultz'),('IbnMusa7','Muhamad','Ibn_Musa_El_Huarismi'),('katie2256','Katie','Silverman'),('Kobiiee53','Kobi','Masuka'),('Odeliiaa44','Odelia','Levi'),('yoni','Yonatan','Shimi');
/*!40000 ALTER TABLE `private` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `procurement_worker`
--

DROP TABLE IF EXISTS `procurement_worker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `procurement_worker` (
  `employee_id` int NOT NULL,
  `employee_position` varchar(30) NOT NULL,
  PRIMARY KEY (`employee_id`),
  CONSTRAINT `procurement_worker_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `procurement_worker`
--

LOCK TABLES `procurement_worker` WRITE;
/*!40000 ALTER TABLE `procurement_worker` DISABLE KEYS */;
INSERT INTO `procurement_worker` VALUES (26665,'Purchase agent'),(34376,'Price Coordinator'),(34656,'Accountant'),(98465,'Director of Operations'),(236676,'Secretary of Operations'),(786475,'Purchasing adapter');
/*!40000 ALTER TABLE `procurement_worker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase`
--

DROP TABLE IF EXISTS `purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase` (
  `purchase_id` int NOT NULL,
  `purchase_date` date DEFAULT NULL,
  PRIMARY KEY (`purchase_id`),
  UNIQUE KEY `purchase_purchase_id_uindex` (`purchase_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase`
--

LOCK TABLES `purchase` WRITE;
/*!40000 ALTER TABLE `purchase` DISABLE KEYS */;
INSERT INTO `purchase` VALUES (22331,'2020-01-14'),(39920,'2018-05-19'),(66473,'2020-03-20'),(88473,'2020-03-22'),(99282,'2017-08-08'),(99837,'2020-05-09');
/*!40000 ALTER TABLE `purchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchased_from`
--

DROP TABLE IF EXISTS `purchased_from`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchased_from` (
  `purchase_id` int NOT NULL,
  `company_id` int NOT NULL,
  PRIMARY KEY (`purchase_id`,`company_id`),
  KEY `company_id` (`company_id`),
  CONSTRAINT `purchased_from_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `supplier` (`company_id`),
  CONSTRAINT `purchased_from_ibfk_2` FOREIGN KEY (`purchase_id`) REFERENCES `purchase` (`purchase_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchased_from`
--

LOCK TABLES `purchased_from` WRITE;
/*!40000 ALTER TABLE `purchased_from` DISABLE KEYS */;
INSERT INTO `purchased_from` VALUES (88473,11244),(22331,12312),(99282,22003),(66473,23990),(99837,44332),(39920,77383);
/*!40000 ALTER TABLE `purchased_from` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchasing`
--

DROP TABLE IF EXISTS `purchasing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchasing` (
  `purchase_id` int NOT NULL,
  `procurement_worker_id` int NOT NULL,
  PRIMARY KEY (`purchase_id`,`procurement_worker_id`),
  KEY `procurement_worker_id` (`procurement_worker_id`),
  CONSTRAINT `purchasing_ibfk_1` FOREIGN KEY (`purchase_id`) REFERENCES `purchase` (`purchase_id`),
  CONSTRAINT `purchasing_ibfk_2` FOREIGN KEY (`procurement_worker_id`) REFERENCES `procurement_worker` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchasing`
--

LOCK TABLES `purchasing` WRITE;
/*!40000 ALTER TABLE `purchasing` DISABLE KEYS */;
INSERT INTO `purchasing` VALUES (88473,26665),(99282,26665),(99837,26665),(22331,786475),(39920,786475),(66473,786475);
/*!40000 ALTER TABLE `purchasing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recommended_item`
--

DROP TABLE IF EXISTS `recommended_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recommended_item` (
  `consultation_id` int NOT NULL,
  `item_id` int NOT NULL,
  PRIMARY KEY (`consultation_id`,`item_id`),
  KEY `fk_item_recommended_item` (`item_id`),
  CONSTRAINT `fk_consultation_recommended_item` FOREIGN KEY (`consultation_id`) REFERENCES `consultation` (`consultation_id`),
  CONSTRAINT `fk_item_recommended_item` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recommended_item`
--

LOCK TABLES `recommended_item` WRITE;
/*!40000 ALTER TABLE `recommended_item` DISABLE KEYS */;
INSERT INTO `recommended_item` VALUES (98563,33221),(70021,37658),(265114,39029),(342337,49382),(43678,55872),(34576,77362);
/*!40000 ALTER TABLE `recommended_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_workers`
--

DROP TABLE IF EXISTS `sales_workers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_workers` (
  `employee_id` int NOT NULL,
  `degree` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  CONSTRAINT `sales_workers_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_workers`
--

LOCK TABLES `sales_workers` WRITE;
/*!40000 ALTER TABLE `sales_workers` DISABLE KEYS */;
INSERT INTO `sales_workers` VALUES (2651143,'VP Sales'),(3943584,'Sales Manager'),(5733896,'Sales Manager'),(6542227,'Account Representetive'),(7469022,'Account Representetive'),(7620734,'vp sales');
/*!40000 ALTER TABLE `sales_workers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `company_id` int NOT NULL,
  `contact_person` varchar(50) NOT NULL,
  `phone_number` bigint NOT NULL,
  `street` varchar(50) DEFAULT NULL,
  `st_number` int DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`company_id`),
  UNIQUE KEY `supplier_company_id_uindex` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (11244,'John Black',972546000000,'Ben Gurion',15,'Yeroham'),(12312,'Sami Gal',972546000000,'Frishman',19,'Tel Aviv'),(22003,'Moshe Cohen',972540000000,'Gordon',27,'Jerusalem'),(23990,'Ofira Asayag',972530000000,'Marmorek',5,'Jerusalem'),(44332,'Eyal Berkovitch',972546000000,'Ben Gurion',8,'Tel Aviv'),(77383,'Andy Cohen',972539000000,'Herzel',4,'Lod');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'group2'
--

--
-- Dumping routines for database 'group2'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-02  5:22:36
