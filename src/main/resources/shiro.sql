-- MySQL dump 10.13  Distrib 5.7.16, for Linux (x86_64)
--
-- Host: localhost    Database: tables
-- ------------------------------------------------------
-- Server version	5.7.16-0ubuntu0.16.04.1

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
-- Table structure for table `db_teacher`
--

DROP TABLE IF EXISTS `db_teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` char(200) DEFAULT NULL,
  `username` char(100) DEFAULT NULL,
  `password` char(150) DEFAULT NULL,
  `major` char(150) DEFAULT NULL,
  `age` int(50) DEFAULT NULL,
  `teach_age` int(50) DEFAULT NULL,
  `status` int(10) DEFAULT NULL,
  `free_time` datetime DEFAULT NULL,
  `description` char(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_teacher`
--

LOCK TABLES `db_teacher` WRITE;
/*!40000 ALTER TABLE `db_teacher` DISABLE KEYS */;
/*!40000 ALTER TABLE `db_teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_student`
--

DROP TABLE IF EXISTS `db_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` char(200) DEFAULT NULL,
  `username` char(200) DEFAULT NULL,
  `password` char(200) DEFAULT NULL,
  `class_name` char(200) DEFAULT NULL,
  `major` char(200) DEFAULT NULL,
  `departdent` char(200) DEFAULT NULL,
  `status` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_student`
--

LOCK TABLES `db_student` WRITE;
/*!40000 ALTER TABLE `db_student` DISABLE KEYS */;
/*!40000 ALTER TABLE `db_student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-10-28 11:36:50
