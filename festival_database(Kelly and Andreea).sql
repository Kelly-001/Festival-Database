CREATE DATABASE  IF NOT EXISTS `festival` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `festival`;
-- MySQL dump 10.13  Distrib 8.0.22, for macos10.15 (x86_64)
--
-- Host: 127.0.0.1    Database: festival
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `activities`
--

DROP TABLE IF EXISTS `activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activities` (
  `activity_id` int NOT NULL,
  `activity_name` varchar(50) DEFAULT NULL,
  `date_id` int DEFAULT NULL,
  `employee_id` int DEFAULT NULL,
  `average_price` decimal(4,2) DEFAULT NULL,
  `age_restrictions` enum('All Participants','Over 16','Over 18') DEFAULT NULL,
  PRIMARY KEY (`activity_id`),
  KEY `date_id` (`date_id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `activities_ibfk_1` FOREIGN KEY (`date_id`) REFERENCES `festival_date` (`date_id`),
  CONSTRAINT `activities_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activities`
--

LOCK TABLES `activities` WRITE;
/*!40000 ALTER TABLE `activities` DISABLE KEYS */;
INSERT INTO `activities` VALUES (1,'Kayaking',2,9,5.08,'Over 18'),(2,'Face Painting',3,11,5.50,'All Participants'),(3,'VR Simulator',1,5,5.57,'Over 16'),(4,'Photo Booth',3,14,3.99,'All Participants');
/*!40000 ALTER TABLE `activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activity_purchases`
--

DROP TABLE IF EXISTS `activity_purchases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_purchases` (
  `activity_purchase_id` int NOT NULL,
  `activity_id` int DEFAULT NULL,
  `participant_id` int DEFAULT NULL,
  `amount_spent` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`activity_purchase_id`),
  KEY `activity_id` (`activity_id`),
  KEY `participant_id` (`participant_id`),
  CONSTRAINT `activity_purchases_ibfk_1` FOREIGN KEY (`activity_id`) REFERENCES `activities` (`activity_id`),
  CONSTRAINT `activity_purchases_ibfk_2` FOREIGN KEY (`participant_id`) REFERENCES `participants` (`participant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_purchases`
--

LOCK TABLES `activity_purchases` WRITE;
/*!40000 ALTER TABLE `activity_purchases` DISABLE KEYS */;
INSERT INTO `activity_purchases` VALUES (1,2,15,6.99),(2,2,7,5.44),(3,1,11,6.75),(4,3,15,6.80),(5,4,12,2.45),(6,4,19,3.55),(7,1,19,6.50),(8,2,6,5.00),(9,3,10,6.80),(10,4,11,2.99),(11,3,8,6.80),(12,2,9,5.00),(13,1,20,6.50),(14,3,2,5.30),(15,4,1,3.99);
/*!40000 ALTER TABLE `activity_purchases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artists`
--

DROP TABLE IF EXISTS `artists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artists` (
  `artist_id` int NOT NULL,
  `artist_name` varchar(50) DEFAULT NULL,
  `business_email` varchar(50) DEFAULT NULL,
  `country_of_origin` varchar(20) DEFAULT NULL,
  `employee_id` int DEFAULT NULL,
  PRIMARY KEY (`artist_id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `artists_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artists`
--

LOCK TABLES `artists` WRITE;
/*!40000 ALTER TABLE `artists` DISABLE KEYS */;
INSERT INTO `artists` VALUES (1,'Kodaline','kodasteve@gmail.com','Ireland',7),(2,'Glass Animals','glassanimals@gmail.com','England',7),(3,'The 1975','the1975band@gmail.com','England',1),(4,'Bastille','bastilledan@gmail.com','England',13),(5,'Tom Grennan','thomasgren@gmail.com','England',13),(6,'Tom Walker','tomwalker@gmail.com','Scotland',1),(7,'Nothing but Thieves','nbtbandtour@gmail.com','England',7),(8,'X Ambassadors','xambsband@gmail.com','USA',1);
/*!40000 ALTER TABLE `artists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `concert_schedule`
--

DROP TABLE IF EXISTS `concert_schedule`;
/*!50001 DROP VIEW IF EXISTS `concert_schedule`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `concert_schedule` AS SELECT 
 1 AS `artist_name`,
 1 AS `performance_time`,
 1 AS `date`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `employee_view`
--

DROP TABLE IF EXISTS `employee_view`;
/*!50001 DROP VIEW IF EXISTS `employee_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `employee_view` AS SELECT 
 1 AS `employee`,
 1 AS `department`,
 1 AS `working_for`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `employee_id` int NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email_address` varchar(50) DEFAULT NULL,
  `department` enum('Welcoming Participants','Food Trucks','Activities','Backstage Staff') DEFAULT NULL,
  `wage` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'Mike','Simpson','msimpson11@gmail.com','Backstage Staff',11.25),(2,'Emily','O’Brien','emily1999@gmail.com','Welcoming Participants',8.75),(3,'Hannah','Jensen','hannahjensen@gmail.com','Welcoming Participants',8.75),(4,'Josh','Rickman','joshr_man@gmail.com','Food Trucks',15.50),(5,'Mark','Davies','daviesm@gmail.com','Activities',11.20),(6,'Simon','Gillies','simon123@gmail.com','Welcoming Participants',12.45),(7,'Ava','Morries','thisisava@gmail.com','Backstage Staff',11.25),(8,'Ramona','Danner','rdannerr@gmail.com','Welcoming Participants',8.75),(9,'Dennis','Wolfe','deniswolfe9@gmail.com','Activities',12.25),(10,'Rebecca','Hansen','rebecca_hansen@gmail.com','Food Trucks',16.05),(11,'Lola','Wharton','whartonlola51@gmail.com','Activities',17.33),(12,'Mauri','Davies','maurimd@gmail.com','Food Trucks',14.02),(13,'Kevin','Hansen','kevinnn@gmail.com','Backstage Staff',11.25),(14,'Lara','Brady','larabrady@gmail.com','Activities',18.50),(15,'Richard','Sloan','richardsloan13@gmail.com','Food Trucks',17.75);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `festival_date`
--

DROP TABLE IF EXISTS `festival_date`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `festival_date` (
  `date_id` int NOT NULL,
  `date` enum('Saturday','Sunday','Both Days') DEFAULT NULL,
  PRIMARY KEY (`date_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `festival_date`
--

LOCK TABLES `festival_date` WRITE;
/*!40000 ALTER TABLE `festival_date` DISABLE KEYS */;
INSERT INTO `festival_date` VALUES (1,'Saturday'),(2,'Sunday'),(3,'Both Days');
/*!40000 ALTER TABLE `festival_date` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food_purchases`
--

DROP TABLE IF EXISTS `food_purchases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food_purchases` (
  `food_purchase_id` int NOT NULL,
  `food_truck_id` int DEFAULT NULL,
  `participant_id` int DEFAULT NULL,
  `amount_spent` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`food_purchase_id`),
  KEY `food_truck_id` (`food_truck_id`),
  KEY `participant_id` (`participant_id`),
  CONSTRAINT `food_purchases_ibfk_1` FOREIGN KEY (`food_truck_id`) REFERENCES `food_trucks` (`food_truck_id`),
  CONSTRAINT `food_purchases_ibfk_2` FOREIGN KEY (`participant_id`) REFERENCES `participants` (`participant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_purchases`
--

LOCK TABLES `food_purchases` WRITE;
/*!40000 ALTER TABLE `food_purchases` DISABLE KEYS */;
INSERT INTO `food_purchases` VALUES (1,2,4,10.50),(2,2,7,5.00),(3,3,11,12.00),(4,3,17,9.45),(5,4,11,5.99),(6,1,20,9.99),(7,4,14,20.25),(8,2,5,12.00),(9,3,3,15.50),(10,4,8,20.00),(11,1,9,11.30),(12,2,12,7.39),(13,3,16,9.50),(14,4,18,12.49),(15,1,11,9.99);
/*!40000 ALTER TABLE `food_purchases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food_trucks`
--

DROP TABLE IF EXISTS `food_trucks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food_trucks` (
  `food_truck_id` int NOT NULL,
  `food_truck_name` varchar(20) NOT NULL,
  `date_id` int DEFAULT NULL,
  `employee_id` int DEFAULT NULL,
  `average_price` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`food_truck_id`),
  KEY `date_id` (`date_id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `food_trucks_ibfk_1` FOREIGN KEY (`date_id`) REFERENCES `festival_date` (`date_id`),
  CONSTRAINT `food_trucks_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_trucks`
--

LOCK TABLES `food_trucks` WRITE;
/*!40000 ALTER TABLE `food_trucks` DISABLE KEYS */;
INSERT INTO `food_trucks` VALUES (1,'Eddie Rockets',1,15,8.40),(2,'Pizza Hut',3,4,5.99),(3,'Ben & Jerry’s',2,12,5.50),(4,'Wing It',3,10,8.00);
/*!40000 ALTER TABLE `food_trucks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participants`
--

DROP TABLE IF EXISTS `participants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `participants` (
  `participant_id` int NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email_address` varchar(50) DEFAULT NULL,
  `phone_number` varchar(10) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `ticket_type` enum('1-Day Saturday','1-Day Sunday','Full-Ticket') DEFAULT NULL,
  `favourite_artist` enum('Kodaline','Glass Animals','The 1975','Bastille','Tom Grennan','Tom Walker','Nothing but Thieves','X Ambassadors') DEFAULT NULL,
  `wristband_balance` decimal(5,2) DEFAULT NULL,
  `employee_id` int DEFAULT NULL,
  PRIMARY KEY (`participant_id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `participants_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participants`
--

LOCK TABLES `participants` WRITE;
/*!40000 ALTER TABLE `participants` DISABLE KEYS */;
INSERT INTO `participants` VALUES (1,'Caroline','Thompson','c.thompson@randatmail.com','0872243095',16,'1-Day Saturday','Kodaline',50.00,2),(2,'Alen','Anderson','a.anderson@randatmail.com','0874107534',14,'1-Day Sunday','X Ambassadors',60.00,3),(3,'Wilson','Harris','w.harris@randatmail.com','0879825554',23,'Full-Ticket','X Ambassadors',80.00,2),(4,'Sawyer','Cunningham','s.cunningham@randatmail.com','0863090495',30,'1-Day Saturday','Kodaline',40.00,8),(5,'Lenny','Casey','l.casey@randatmail.com','0862657777',26,'1-Day Saturday','X Ambassadors',20.00,6),(6,'Savana','Moore','s.moore@randatmail.com','0877742402',21,'1-Day Sunday','X Ambassadors',0.00,6),(7,'Adele','Fowler','a.fowler@randatmail.com','0863445116',21,'Full-Ticket','Tom Walker',65.00,2),(8,'Jessica','Brown','j.brown@randatmail.com','0868241758',17,'1-Day Saturday','Nothing but Thieves',95.00,3),(9,'Miranda','Kelly','m.kelly@randatmail.com','0876884646',33,'Full-Ticket','Kodaline',35.00,6),(10,'Lucas','Scott','l.scott@randatmail.com','0860607997',35,'Full-Ticket','Kodaline',0.00,8),(11,'William','Grant','w.grant@randatmail.com','0860546226',16,'1-Day Saturday','Kodaline',55.00,6),(12,'Kevin','Anderson','k.anderson@randatmail.com','0872599280',18,'Full-Ticket','Nothing but Thieves',45.00,8),(13,'Dainton','Casey','d.casey@randatmail.com','0872608871',29,'1-Day Saturday','The 1975',95.00,8),(14,'Owen','Miller','o.miller@randatmail.com','0868074129',41,'1-Day Sunday','Nothing but Thieves',35.00,2),(15,'Lilianna','Nelson','l.nelson@randatmail.com','0863895282',40,'Full-Ticket','The 1975',44.00,3),(16,'Isabella','Gray','i.gray@randatmail.com','0868382859',25,'Full-Ticket','Bastille',35.00,3),(17,'Clark','Crawford','c.crawford@randatmail.com','0872763800',26,'1-Day Saturday','The 1975',62.00,8),(18,'Amelia','Rogers','a.rogers@randatmail.com','0876802487',16,'1-Day Sunday','Bastille',25.00,6),(19,'Paul','Cole','p.cole@randatmail.com','0879299590',22,'Full-Ticket','Bastille',83.00,3),(20,'Henry','Carroll','h.carroll@randatmail.com','0862672674',20,'1-Day Saturday','The 1975',18.00,3);
/*!40000 ALTER TABLE `participants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `performance_schedule`
--

DROP TABLE IF EXISTS `performance_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `performance_schedule` (
  `performance_id` int NOT NULL,
  `artist_id` int DEFAULT NULL,
  `date_id` int DEFAULT NULL,
  `performance_time` time DEFAULT NULL,
  PRIMARY KEY (`performance_id`),
  KEY `artist_id` (`artist_id`),
  KEY `date_id` (`date_id`),
  CONSTRAINT `performance_schedule_ibfk_1` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`artist_id`),
  CONSTRAINT `performance_schedule_ibfk_2` FOREIGN KEY (`date_id`) REFERENCES `festival_date` (`date_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `performance_schedule`
--

LOCK TABLES `performance_schedule` WRITE;
/*!40000 ALTER TABLE `performance_schedule` DISABLE KEYS */;
INSERT INTO `performance_schedule` VALUES (1,1,1,'22:30:00'),(2,2,1,'20:50:00'),(3,3,2,'20:20:00'),(4,4,3,'23:30:00'),(5,5,1,'19:30:00'),(6,6,2,'19:25:00'),(7,7,3,'21:35:00'),(8,8,2,'22:15:00');
/*!40000 ALTER TABLE `performance_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `welcoming_participants`
--

DROP TABLE IF EXISTS `welcoming_participants`;
/*!50001 DROP VIEW IF EXISTS `welcoming_participants`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `welcoming_participants` AS SELECT 
 1 AS `participant`,
 1 AS `employee`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `concert_schedule`
--

/*!50001 DROP VIEW IF EXISTS `concert_schedule`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `concert_schedule` AS select `a`.`artist_name` AS `artist_name`,`ps`.`performance_time` AS `performance_time`,`d`.`date` AS `date` from ((`performance_schedule` `ps` join `artists` `a` on((`a`.`artist_id` = `ps`.`artist_id`))) join `festival_date` `d` on((`d`.`date_id` = `ps`.`date_id`))) order by `d`.`date`,`ps`.`performance_time` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `employee_view`
--

/*!50001 DROP VIEW IF EXISTS `employee_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `employee_view` AS select concat(`e`.`first_name`,' ',`e`.`last_name`) AS `employee`,`e`.`department` AS `department`,`ft`.`food_truck_name` AS `working_for` from (`food_trucks` `ft` join `employees` `e` on((`e`.`employee_id` = `ft`.`employee_id`))) union select concat(`e`.`first_name`,' ',`e`.`last_name`) AS `employee`,`e`.`department` AS `department`,`act`.`activity_name` AS `activity_name` from (`activities` `act` join `employees` `e` on((`e`.`employee_id` = `act`.`employee_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `welcoming_participants`
--

/*!50001 DROP VIEW IF EXISTS `welcoming_participants`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `welcoming_participants` AS select concat(`p`.`first_name`,' ',`p`.`last_name`) AS `participant`,concat(`e`.`first_name`,' ',`e`.`last_name`) AS `employee` from (`participants` `p` join `employees` `e` on((`e`.`employee_id` = `p`.`employee_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-31 13:09:20
