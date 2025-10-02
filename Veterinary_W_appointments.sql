-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: 172.20.79.186    Database: Veterinary_W
-- ------------------------------------------------------
-- Server version	9.2.0

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
-- Table structure for table `appointments`
--

DROP TABLE IF EXISTS `appointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Pet_Id` int DEFAULT NULL,
  `VeterinarianId` int DEFAULT NULL,
  `DateAppointment` date NOT NULL,
  `Reason` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_appointments_pets` (`Pet_Id`),
  KEY `fk_appointments_vets` (`VeterinarianId`),
  CONSTRAINT `fk_appointments_pets` FOREIGN KEY (`Pet_Id`) REFERENCES `pets` (`id`),
  CONSTRAINT `fk_appointments_vets` FOREIGN KEY (`VeterinarianId`) REFERENCES `veterinarians` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=206 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointments`
--

LOCK TABLES `appointments` WRITE;
/*!40000 ALTER TABLE `appointments` DISABLE KEYS */;
INSERT INTO `appointments` VALUES (106,430,6,'2025-01-05','Vacunación anual'),(107,431,7,'2025-01-06','Consulta general'),(108,432,8,'2025-01-07','Chequeo dental'),(109,433,9,'2025-01-08','Revisión de piel'),(110,434,10,'2025-01-09','Control de peso'),(111,435,11,'2025-01-10','Desparasitación'),(112,436,12,'2025-01-11','Vacunación de refuerzo'),(113,437,13,'2025-01-12','Chequeo de oídos'),(114,438,14,'2025-01-13','Control post-operatorio'),(115,439,15,'2025-01-14','Examen de sangre'),(116,440,16,'2025-01-15','Chequeo de rutina'),(117,441,17,'2025-01-16','Problemas digestivos'),(118,442,18,'2025-01-17','Consulta de piel'),(119,443,19,'2025-01-18','Vacunación contra rabia'),(120,444,20,'2025-01-19','Chequeo dental'),(121,445,21,'2025-01-20','Problemas de apetito'),(122,446,22,'2025-01-21','Control de alergias'),(123,447,23,'2025-01-22','Chequeo de patas'),(124,448,24,'2025-01-23','Consulta de comportamiento'),(125,449,25,'2025-01-24','Control de peso'),(126,450,26,'2025-01-25','Revisión general'),(127,451,27,'2025-01-26','Chequeo de vacunas'),(128,452,28,'2025-01-27','Problemas respiratorios'),(129,453,29,'2025-01-28','Chequeo pre-quirúrgico'),(130,454,30,'2025-01-29','Control de heridas'),(131,455,31,'2025-01-30','Vacunación múltiple'),(132,456,32,'2025-01-31','Chequeo de movilidad'),(133,457,33,'2025-02-01','Consulta de piel'),(134,458,34,'2025-02-02','Revisión de oídos'),(135,459,35,'2025-02-03','Chequeo digestivo'),(136,460,36,'2025-02-04','Vacunación anual'),(137,461,37,'2025-02-05','Consulta general'),(138,462,38,'2025-02-06','Chequeo dental'),(139,463,39,'2025-02-07','Revisión de piel'),(140,464,40,'2025-02-08','Control de peso'),(141,465,41,'2025-02-09','Desparasitación'),(142,466,42,'2025-02-10','Vacunación de refuerzo'),(143,467,43,'2025-02-11','Chequeo de oídos'),(144,468,44,'2025-02-12','Control post-operatorio'),(145,469,45,'2025-02-13','Examen de sangre'),(146,470,46,'2025-02-14','Chequeo de rutina'),(147,471,47,'2025-02-15','Problemas digestivos'),(148,472,48,'2025-02-16','Consulta de piel'),(149,473,49,'2025-02-17','Vacunación contra rabia'),(150,474,50,'2025-02-18','Chequeo dental'),(151,475,51,'2025-02-19','Problemas de apetito'),(152,476,52,'2025-02-20','Control de alergias'),(153,477,53,'2025-02-21','Chequeo de patas'),(154,478,54,'2025-02-22','Consulta de comportamiento'),(155,479,55,'2025-02-23','Control de peso'),(156,480,56,'2025-02-24','Revisión general'),(157,481,57,'2025-02-25','Chequeo de vacunas'),(158,482,58,'2025-02-26','Problemas respiratorios'),(159,483,59,'2025-02-27','Chequeo pre-quirúrgico'),(160,484,60,'2025-02-28','Control de heridas'),(161,485,61,'2025-03-01','Vacunación múltiple'),(162,486,62,'2025-03-02','Chequeo de movilidad'),(163,487,63,'2025-03-03','Consulta de piel'),(164,488,64,'2025-03-04','Revisión de oídos'),(165,489,65,'2025-03-05','Chequeo digestivo'),(166,490,66,'2025-03-06','Vacunación anual'),(167,491,67,'2025-03-07','Consulta general'),(168,492,68,'2025-03-08','Chequeo dental'),(169,493,69,'2025-03-09','Revisión de piel'),(170,494,70,'2025-03-10','Control de peso'),(171,495,71,'2025-03-11','Desparasitación'),(172,496,72,'2025-03-12','Vacunación de refuerzo'),(173,497,73,'2025-03-13','Chequeo de oídos'),(174,498,74,'2025-03-14','Control post-operatorio'),(175,499,75,'2025-03-15','Examen de sangre'),(176,500,76,'2025-03-16','Chequeo de rutina'),(177,501,77,'2025-03-17','Problemas digestivos'),(178,502,78,'2025-03-18','Consulta de piel'),(179,503,79,'2025-03-19','Vacunación contra rabia'),(180,504,80,'2025-03-20','Chequeo dental'),(181,505,81,'2025-03-21','Problemas de apetito'),(182,506,82,'2025-03-22','Control de alergias'),(183,507,83,'2025-03-23','Chequeo de patas'),(184,508,84,'2025-03-24','Consulta de comportamiento'),(185,509,85,'2025-03-25','Control de peso'),(186,510,86,'2025-03-26','Revisión general'),(187,511,87,'2025-03-27','Chequeo de vacunas'),(188,512,88,'2025-03-28','Problemas respiratorios'),(189,513,89,'2025-03-29','Chequeo pre-quirúrgico'),(190,514,90,'2025-03-30','Control de heridas'),(191,515,91,'2025-03-31','Vacunación múltiple'),(192,516,92,'2025-04-01','Chequeo de movilidad'),(193,517,93,'2025-04-02','Consulta de piel'),(194,518,94,'2025-04-03','Revisión de oídos'),(195,519,95,'2025-04-04','Chequeo digestivo'),(196,520,96,'2025-04-05','Vacunación anual'),(197,521,97,'2025-04-06','Consulta general'),(198,522,98,'2025-04-07','Chequeo dental'),(199,523,99,'2025-04-08','Revisión de piel'),(200,524,100,'2025-04-09','Control de peso'),(201,525,101,'2025-04-10','Desparasitación'),(202,526,102,'2025-04-11','Vacunación de refuerzo'),(203,527,103,'2025-04-12','Chequeo de oídos'),(204,528,104,'2025-04-13','Control post-operatorio'),(205,529,105,'2025-04-14','Examen de sangre');
/*!40000 ALTER TABLE `appointments` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-02  8:37:27
