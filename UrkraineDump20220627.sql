CREATE DATABASE  IF NOT EXISTS `ukraine_hackathon` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ukraine_hackathon`;
-- MySQL dump 10.13  Distrib 8.0.25, for macos11 (x86_64)
--
-- Host: localhost    Database: ukraine_hackathon
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
-- Table structure for table `resources`
--

DROP TABLE IF EXISTS `resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resources` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `description` text,
  `country` varchar(255) DEFAULT NULL,
  `is_active` tinyint DEFAULT '1',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_resource_users1_idx` (`user_id`),
  CONSTRAINT `fk_resource_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resources`
--

LOCK TABLES `resources` WRITE;
/*!40000 ALTER TABLE `resources` DISABLE KEYS */;
INSERT INTO `resources` VALUES (1,'The Ukrainian Red Cross','https://redcross.org.ua/en/donate/','which does loads of humanitarian stuff, from aiding refugees to training doctors','Ukraine',1,'2022-06-27 10:26:00','2022-06-27 12:34:51',1,'Donation','Red Cross'),(2,'The British Red Cross','https://donate.redcross.org.uk/appeal/ukraine-crisis-appeal','which has launched an appeal to raise funds for food, medical supplies, shelter and water','United Kingdom',1,'2022-06-27 10:26:50','2022-06-27 12:34:51',1,'Donation','Red Cross'),(3,'Revived Soldiers Ukraine','https://www.rsukraine.org','which funds medication and medical supplies for army hospitals on the front line','United States',1,'2022-06-27 10:28:33','2022-06-27 12:34:51',1,'Donation','NGO'),(4,'Nova Ukraine','https://novaukraine.org/donate/','a Ukraine-based non-profit that provides civilians with everything from baby food and hygiene products to clothes and household supplies','United States',1,'2022-06-27 10:29:16','2022-06-27 12:34:51',1,'Donation','NGO'),(5,'Sunflower for Peace','https://www.facebook.com/donate/507886070680475/','which provides first-aid backpacks to doctors and paramedics on the front line','United States',1,'2022-06-27 10:30:02','2022-06-27 12:34:51',1,'Donation','NGO'),(6,'Voices of Children','https://voices.org.ua/en/','a charity that focuses on helping children recover from the psychological trauma of war','Ukraine',1,'2022-06-27 10:31:10','2022-06-27 12:34:51',1,'Charity','NGO'),(7,'Doctors Without Borders','https://www.doctorswithoutborders.org/what-we-do/countries/ukraine','whose base in Ukraine provides treatments for a range of regional diseases and medical problems','Ukraine',1,'2022-06-27 10:32:51','2022-06-27 12:34:51',1,'Medical Aid','NGO'),(8,'The Kyiv Independent','https://www.patreon.com/kyivindependent','a Ukraine-based English-language newspaper. Not to toot our own horn, but journalism can be pretty damn important','Ukraine',1,'2022-06-27 10:33:43','2022-06-27 12:34:51',1,'Newspaper','News Organization'),(9,'Project HOPE','https://www.projecthope.org/ukraine','a humanitarian organisation that provides medical supplies and assistance to refugees both in Ukraine and once they’ve fled to surrounding countries','Ukraine',1,'2022-06-27 10:40:54','2022-06-27 12:34:51',1,'Humanitarian','NGO'),(10,'Project HOPE','https://www.projecthope.org/ukraine','a humanitarian organisation that provides medical supplies and assistance to refugees both in Ukraine and once they’ve fled to surrounding countries','Ukraine',1,'2022-06-27 11:46:47','2022-06-27 12:34:51',1,'Humanitarian','NGO'),(11,'International Medical Corps','https://give.internationalmedicalcorps.org/page/99837/donate/','whose teams are already on the ground in Ukraine delivering medical and mental health care','Ukraine',1,'2022-06-27 11:46:47','2022-06-27 12:34:51',1,'Medical Aid','NGO'),(12,'CARE','https://my.care.org/site/Donation2?idb=1009408054&df_id=31067&mfc_pref=T&31067.donation=form1','an international aid organisation aiming to provide food, water, hygiene kits, social services and more to Ukrainians in need','Ukraine',1,'2022-06-27 11:46:47','2022-06-27 12:34:51',1,'Humanitarian','NGO'),(13,'UNICEF','http://www.unicefusa.org/HelpUkraine','a global charity focused on the welfare of children, providing water, nutrition, healthcare and education','Ukraine',1,'2022-06-27 11:46:47','2022-06-27 12:34:51',1,'UNICEF','United Nations'),(14,'UNHCR','https://donate.unrefugees.org.uk/','a UN organisation focusing on helping Ukrainian refugees both in Ukraine and in Hungary, Poland, Romania and Slovakia','Ukraine',1,'2022-06-27 11:46:47','2022-06-27 12:34:51',1,'UNHCR','United Nations'),(15,'Save the Children','http://www.unicefusa.org/HelpUkraine','an international charity providing children with food, water and safety','Ukraine',1,'2022-06-27 11:46:47','2022-06-27 12:34:51',1,'Charity','NGO'),(16,'Choose Love','https://donate.chooselove.org/campaigns/ukraine-appeal/','a non-profit that doesn’t just provide medical care, food, clothing, shelter and legal aid, but also helps support Ukraine’s LGBTQ+ community','Ukraine',1,'2022-06-27 11:46:47','2022-06-27 12:34:51',1,'Medical Aid','NGO'),(17,'Airbnb.org','https://www.airbnb.org/get-involved','which is looking for a different kind of donation. The charitable arm of Airbnb has pledged to temporarily house 100,000 people fleeing the conflict, and it’s looking for people to volunteer their homes','Ukraine',1,'2022-06-27 11:46:47','2022-06-27 12:34:51',1,'Humanitarian','NGO'),(18,'Homes for Ukraine','https://www.timeout.com/news/how-to-sign-up-to-the-uks-homes-for-ukraine-scheme-031522','a government-run initiative in the UK encouraging residents to volunteer their homes and host Ukrainian families fleeing the conflict','United Kingdom',1,'2022-06-27 11:46:47','2022-06-27 12:34:51',1,'Humanitarian','Government'),(19,'Refugee Support Europe','https://www.refugeesupporteu.com/projects/ukraine/','a charity with a support team in Moldova assisting refugees on the ground with food, shelter and more','Ukraine',1,'2022-06-27 11:46:47','2022-06-27 12:34:51',1,'Humanitarian','NGO'),(20,'Muslim Hands','https://muslimhands.org.uk/donate/ukraine-refugee-crisis/ukraine-refugee-crisis','a charity handing out emergency packs containing food, blankets and hygiene products in Poland','United Kingdom',1,'2022-06-27 11:46:47','2022-06-27 12:34:51',1,'Humanitarian','NGO'),(21,'Room for Refugees','https://www.roomforrefugees.com/','a UK-based charity aiming to help Ukrainian refugees navigate the UK visa process','United Kingdom',1,'2022-06-27 11:46:47','2022-06-27 12:34:51',1,'Humanitarian','NGO'),(22,'WONDER Foundation','https://wonderfoundation.org.uk/donate-to-help-ukrainian-refugees-in-poland/','an organisation providing resources and support for women and children fleeing Ukraine. WONDER is working with other partners on the ground in Poland','United Kingdom',1,'2022-06-27 11:46:47','2022-06-27 12:34:51',1,'Humanitarian','NGO'),(23,'Kidsave','https://www.kidsave.org/standwithukraine','which is both providing humanitarian aid to refugees and is active in evacuation attempts from besieged areas','United States',1,'2022-06-27 11:46:47','2022-06-27 12:34:51',1,'Humanitarian','NGO'),(25,'test','www.rei.com','testing','USA',1,'2022-06-27 21:27:30','2022-06-27 21:27:30',2,'Food','NGO'),(26,'last one','www.rei.com','testing','USA',1,'2022-06-27 21:34:31','2022-06-27 21:34:31',2,'Housing','NGO'),(27,'bob_ross','www.rei.com','bobby r','USA',1,'2022-06-27 21:38:46','2022-06-27 21:38:46',2,'Food','NGO'),(28,'bob_ross','www.rei.com','tthststa','USA',1,'2022-06-27 21:39:13','2022-06-27 21:39:13',2,'Food','NGO'),(29,'bob_ross','www.rei.com','thasthst','USA',1,'2022-06-27 21:39:42','2022-06-27 21:39:42',2,'Food','NGO'),(30,'bob_ross','www.rei.com','thatshts','USA',1,'2022-06-27 21:42:06','2022-06-27 21:42:06',2,'Food','NGO'),(31,'bob_ross','www.rei.com','gastashtas','USA',1,'2022-06-27 23:18:25','2022-06-27 23:18:25',3,'Housing','NGO');
/*!40000 ALTER TABLE `resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `wants_updates` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'test','admin','admin@email.com','2022-06-27 12:31:23','2022-06-27 12:31:23',0),(2,'Bob','Ross','happytrees@gmail.com','2022-06-27 21:27:30','2022-06-27 21:42:06',0),(3,'Fred','Rogers','fred@gmail.com','2022-06-27 23:18:25','2022-06-27 23:18:25',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-27 23:25:29
