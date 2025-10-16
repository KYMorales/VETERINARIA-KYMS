-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: 172.20.79.186    Database: VETERINARIANS_KYMS_DB
-- ------------------------------------------------------
-- Server version	9.2.0

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
-- Table structure for table `appointments`
--

DROP TABLE IF EXISTS `appointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pet_id` int NOT NULL,
  `veterinarian_id` int NOT NULL,
  `date` datetime NOT NULL,
  `reason` text,
  PRIMARY KEY (`id`),
  KEY `fk_appointments_pet` (`pet_id`),
  KEY `fk_appointments_vet` (`veterinarian_id`),
  CONSTRAINT `fk_appointments_pet` FOREIGN KEY (`pet_id`) REFERENCES `pets` (`id`),
  CONSTRAINT `fk_appointments_vet` FOREIGN KEY (`veterinarian_id`) REFERENCES `veterinarians` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointments`
--

LOCK TABLES `appointments` WRITE;
/*!40000 ALTER TABLE `appointments` DISABLE KEYS */;
INSERT INTO `appointments` VALUES (41,1,1,'2025-01-05 09:00:00','Chequeo general anual'),(42,2,2,'2025-01-05 10:30:00','Vacunación antirrábica'),(43,3,3,'2025-01-06 11:00:00','Consulta por tos persistente'),(44,4,4,'2025-01-06 15:00:00','Problemas digestivos'),(45,5,5,'2025-01-07 09:15:00','Control posquirúrgico'),(46,6,6,'2025-01-07 14:00:00','Revisión de cojera'),(47,7,7,'2025-01-08 09:30:00','Chequeo por caída de pelo'),(48,8,8,'2025-01-08 11:00:00','Consulta por alergias'),(49,9,9,'2025-01-09 16:00:00','Revisión dental'),(50,10,10,'2025-01-10 10:30:00','Chequeo de crecimiento'),(51,11,11,'2025-01-10 14:30:00','Problemas respiratorios'),(52,12,12,'2025-01-11 12:00:00','Vacunación polivalente'),(53,13,13,'2025-01-11 15:00:00','Chequeo prequirúrgico'),(54,14,14,'2025-01-12 09:45:00','Control de peso'),(55,15,15,'2025-01-12 11:20:00','Revisión de piel'),(56,16,16,'2025-01-13 13:00:00','Chequeo por diarrea'),(57,17,17,'2025-01-13 16:00:00','Consulta por vómitos'),(58,18,18,'2025-01-14 10:00:00','Control posvacuna'),(59,19,19,'2025-01-14 14:15:00','Chequeo anual'),(60,20,20,'2025-01-15 09:30:00','Consulta por apatía'),(61,21,21,'2025-01-15 11:45:00','Problemas de oído'),(62,22,22,'2025-01-16 15:00:00','Consulta por cojera leve'),(63,23,23,'2025-01-17 10:15:00','Chequeo poscirugía dental'),(64,24,24,'2025-01-17 12:30:00','Vacunación de refuerzo'),(65,25,25,'2025-01-18 09:50:00','Consulta por fiebre'),(66,26,26,'2025-01-18 13:00:00','Chequeo postparto'),(67,27,27,'2025-01-19 15:20:00','Revisión de herida'),(68,28,28,'2025-01-20 09:40:00','Consulta por pérdida de apetito'),(69,29,29,'2025-01-20 14:00:00','Control de vacunación'),(70,30,30,'2025-01-21 10:30:00','Problemas respiratorios'),(71,31,31,'2025-01-21 16:00:00','Chequeo poscirugía de esterilización'),(72,32,32,'2025-01-22 09:15:00','Consulta por picazón'),(73,33,33,'2025-01-22 11:40:00','Revisión general'),(74,34,34,'2025-01-23 14:10:00','Chequeo de crecimiento'),(75,35,35,'2025-01-24 10:45:00','Consulta por cojera'),(76,36,36,'2025-01-24 12:50:00','Vacunación anual'),(77,37,37,'2025-01-25 15:10:00','Problemas digestivos'),(78,38,38,'2025-01-26 09:00:00','Chequeo de piel'),(79,39,39,'2025-01-26 11:30:00','Consulta por tos'),(80,40,40,'2025-01-27 16:30:00','Revisión prequirúrgica'),(81,41,41,'2025-01-28 10:10:00','Chequeo posparto'),(82,42,42,'2025-01-28 13:00:00','Vacunación de refuerzo'),(83,43,43,'2025-01-29 09:30:00','Problemas de piel'),(84,44,44,'2025-01-29 11:00:00','Consulta por dolor abdominal'),(85,45,45,'2025-01-30 15:20:00','Chequeo anual'),(86,46,46,'2025-01-30 16:40:00','Consulta por fiebre'),(87,47,47,'2025-01-31 09:15:00','Chequeo por pérdida de apetito'),(88,48,48,'2025-02-01 11:20:00','Control de vacunación'),(89,49,49,'2025-02-01 13:30:00','Problemas respiratorios'),(90,50,50,'2025-02-02 09:30:00','Chequeo poscirugía'),(91,51,51,'2025-02-02 14:10:00','Consulta por alergias'),(92,52,52,'2025-02-03 11:45:00','Chequeo general'),(93,53,53,'2025-02-03 16:20:00','Consulta por vómitos'),(94,54,54,'2025-02-04 09:00:00','Chequeo dental'),(95,55,55,'2025-02-04 12:30:00','Vacunación anual'),(96,56,56,'2025-02-05 10:15:00','Consulta por tos'),(97,57,57,'2025-02-05 13:00:00','Chequeo dermatológico'),(98,58,58,'2025-02-06 09:45:00','Control de peso'),(99,59,59,'2025-02-06 11:30:00','Chequeo general'),(100,60,60,'2025-02-07 15:40:00','Problemas de piel'),(101,61,61,'2025-02-07 09:30:00','Consulta posvacunación'),(102,62,62,'2025-02-08 12:00:00','Revisión de herida'),(103,63,63,'2025-02-08 16:15:00','Chequeo general'),(104,64,64,'2025-02-09 10:30:00','Consulta por tos persistente'),(105,65,65,'2025-02-09 14:20:00','Chequeo dental'),(106,66,66,'2025-02-10 09:15:00','Vacunación polivalente'),(107,67,67,'2025-02-10 11:40:00','Control poscirugía'),(108,68,68,'2025-02-11 15:00:00','Consulta por vómitos'),(109,69,69,'2025-02-11 09:50:00','Chequeo anual'),(110,70,70,'2025-02-12 13:10:00','Control de peso'),(111,71,71,'2025-02-12 16:00:00','Chequeo posparto'),(112,72,72,'2025-02-13 10:45:00','Consulta dermatológica'),(113,73,73,'2025-02-13 12:50:00','Chequeo general'),(114,74,74,'2025-02-14 09:20:00','Consulta por pérdida de apetito'),(115,75,75,'2025-02-14 11:30:00','Chequeo anual'),(116,76,76,'2025-02-15 14:00:00','Vacunación antirrábica'),(117,77,77,'2025-02-15 16:20:00','Chequeo dental'),(118,78,78,'2025-02-16 09:30:00','Consulta por tos persistente'),(119,79,79,'2025-02-16 12:15:00','Chequeo general'),(120,80,80,'2025-02-17 15:00:00','Chequeo posquirúrgico'),(121,81,81,'2025-02-17 09:30:00','Consulta dermatológica'),(122,82,82,'2025-02-18 10:20:00','Chequeo general'),(123,83,83,'2025-02-18 14:30:00','Vacunación polivalente'),(124,84,84,'2025-02-19 11:00:00','Consulta por apatía'),(125,85,85,'2025-02-19 16:10:00','Chequeo dental'),(126,86,86,'2025-02-20 09:40:00','Control de peso'),(127,87,87,'2025-02-20 13:15:00','Consulta por fiebre'),(128,88,88,'2025-02-21 15:20:00','Chequeo anual'),(129,89,89,'2025-02-21 10:30:00','Chequeo dermatológico'),(130,90,90,'2025-02-22 12:45:00','Consulta por diarrea'),(131,91,91,'2025-02-22 16:20:00','Chequeo posvacunación'),(132,92,92,'2025-02-23 09:15:00','Control posparto'),(133,93,93,'2025-02-23 11:30:00','Vacunación anual'),(134,94,94,'2025-02-24 13:10:00','Consulta general'),(135,95,95,'2025-02-24 15:30:00','Chequeo posquirúrgico'),(136,96,96,'2025-02-25 09:45:00','Consulta por tos persistente'),(137,97,97,'2025-02-25 11:40:00','Control de peso'),(138,98,98,'2025-02-26 14:00:00','Chequeo dermatológico'),(139,99,99,'2025-02-26 16:15:00','Consulta general'),(140,100,100,'2025-02-27 10:30:00','Chequeo de rutina');
/*!40000 ALTER TABLE `appointments` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `ai_appointments_audit` AFTER INSERT ON `appointments` FOR EACH ROW BEGIN
  INSERT INTO appointments_audit (appointment_id, actionAppointment, before_data, after_data)
  VALUES (
    NEW.id,
    'INSERT',
    NULL,
    JSON_OBJECT(
      'id', NEW.id,
      'pet_id', NEW.pet_id,
      'veterinarian_id', NEW.veterinarian_id,
      'date', NEW.date,
      'reason', NEW.reason
    )
  );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `au_appointments_audit` AFTER UPDATE ON `appointments` FOR EACH ROW BEGIN
  INSERT INTO appointments_audit (appointment_id, actionAppointment, before_data, after_data)
  VALUES (
    NEW.id,
    'UPDATE',
    JSON_OBJECT(
      'id', OLD.id,
      'pet_id', OLD.pet_id,
      'veterinarian_id', OLD.veterinarian_id,
      'date', OLD.date,
      'reason', OLD.reason
    ),
    JSON_OBJECT(
      'id', NEW.id,
      'pet_id', NEW.pet_id,
      'veterinarian_id', NEW.veterinarian_id,
      'date', NEW.date,
      'reason', NEW.reason
    )
  );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `ad_appointments_audit` AFTER DELETE ON `appointments` FOR EACH ROW BEGIN
  INSERT INTO appointments_audit (appointment_id, actionAppointment, before_data, after_data)
  VALUES (
    OLD.id,
    'DELETE',
    JSON_OBJECT(
      'id', OLD.id,
      'pet_id', OLD.pet_id,
      'veterinarian_id', OLD.veterinarian_id,
      'date', OLD.date,
      'reason', OLD.reason
    ),
    NULL
  );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `appointments_audit`
--

DROP TABLE IF EXISTS `appointments_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointments_audit` (
  `id` int NOT NULL AUTO_INCREMENT,
  `appointment_id` int NOT NULL,
  `actionAppointment` varchar(10) DEFAULT NULL,
  `changed_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `before_data` json DEFAULT NULL,
  `after_data` json DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointments_audit`
--

LOCK TABLES `appointments_audit` WRITE;
/*!40000 ALTER TABLE `appointments_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointments_audit` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `bii_appointments_audit_guard_insert` BEFORE INSERT ON `appointments_audit` FOR EACH ROW BEGIN
  SIGNAL SQLSTATE '45000'
  SET MESSAGE_TEXT = 'INSERT en appointments_audit solo permitido desde triggers de appointments.';
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `biu_appointments_audit_block_update` BEFORE UPDATE ON `appointments_audit` FOR EACH ROW BEGIN
  SIGNAL SQLSTATE '45000'
  SET MESSAGE_TEXT = 'appointments_audit es inmutable: UPDATE prohibido.';
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `bid_appointments_audit_block_delete` BEFORE DELETE ON `appointments_audit` FOR EACH ROW BEGIN
  SIGNAL SQLSTATE '45000'
  SET MESSAGE_TEXT = 'appointments_audit es inmutable: DELETE prohibido.';
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `laboratories`
--

DROP TABLE IF EXISTS `laboratories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `laboratories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `appointment_id` int NOT NULL,
  `test_type` varchar(100) NOT NULL,
  `result` text,
  `test_date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_laboratories_appointment` (`appointment_id`),
  CONSTRAINT `fk_laboratories_appointment` FOREIGN KEY (`appointment_id`) REFERENCES `appointments` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laboratories`
--

LOCK TABLES `laboratories` WRITE;
/*!40000 ALTER TABLE `laboratories` DISABLE KEYS */;
INSERT INTO `laboratories` VALUES (1,41,'Hemograma completo','Resultados dentro de parámetros normales','2025-01-28'),(2,42,'Prueba de orina','Ligera infección urinaria detectada','2025-01-28'),(3,43,'Examen de heces','Presencia de parásitos intestinales','2025-01-29'),(4,44,'Radiografía torácica','No se observan anomalías','2025-01-29'),(5,45,'Ecografía abdominal','Hígado con leve inflamación','2025-01-30'),(6,46,'Hemograma completo','Anemia leve detectada','2025-01-30'),(7,47,'Prueba de alergias','Reacción positiva a polvo ambiental','2025-01-31'),(8,48,'Examen de piel','Dermatitis alérgica confirmada','2025-02-01'),(9,49,'Radiografía de cadera','Signos de displasia leve','2025-02-01'),(10,50,'Prueba de orina','Resultados normales','2025-02-02'),(11,51,'Ecografía abdominal','Sin hallazgos relevantes','2025-02-02'),(12,52,'Hemograma completo','Glóbulos blancos elevados','2025-02-03'),(13,53,'Examen de heces','Sin presencia de parásitos','2025-02-03'),(14,54,'Radiografía torácica','Posible bronquitis leve','2025-02-04'),(15,55,'Prueba de orina','Infección urinaria controlada','2025-02-04'),(16,56,'Examen de piel','Piel reseca sin signos de infección','2025-02-05'),(17,57,'Hemograma completo','Valores normales','2025-02-05'),(18,58,'Ecografía abdominal','Estómago inflamado','2025-02-06'),(19,59,'Radiografía de columna','Columna en buen estado','2025-02-06'),(20,60,'Prueba de alergias','Sin reacciones significativas','2025-02-07'),(21,61,'Hemograma completo','Resultados normales','2025-02-07'),(22,62,'Examen de heces','Restos alimenticios mal digeridos','2025-02-08'),(23,63,'Radiografía de cadera','Articulaciones normales','2025-02-08'),(24,64,'Prueba de orina','Cristales presentes en la orina','2025-02-09'),(25,65,'Ecografía abdominal','Intestino inflamado','2025-02-09'),(26,66,'Hemograma completo','Plaquetas bajas','2025-02-10'),(27,67,'Examen de piel','Leve irritación','2025-02-10'),(28,68,'Radiografía torácica','Posible neumonía incipiente','2025-02-11'),(29,69,'Prueba de orina','Normal','2025-02-11'),(30,70,'Examen de heces','Presencia de parásitos controlada','2025-02-12'),(31,71,'Hemograma completo','Resultados normales','2025-02-12'),(32,72,'Ecografía abdominal','Inflamación leve de riñón','2025-02-13'),(33,73,'Radiografía de cadera','Deterioro articular moderado','2025-02-13'),(34,74,'Examen de piel','Dermatitis leve','2025-02-14'),(35,75,'Prueba de orina','Infección leve persistente','2025-02-14'),(36,76,'Hemograma completo','Valores normales','2025-02-15'),(37,77,'Examen de heces','Sin parásitos','2025-02-15'),(38,78,'Radiografía torácica','Bronquitis detectada','2025-02-16'),(39,79,'Ecografía abdominal','Todo dentro de la normalidad','2025-02-16'),(40,80,'Hemograma completo','Resultados normales','2025-02-17'),(41,81,'Prueba de alergias','Reacción a ácaros','2025-02-17'),(42,82,'Examen de piel','Piel con irritación leve','2025-02-18'),(43,83,'Radiografía de cadera','Cadera sana','2025-02-18'),(44,84,'Prueba de orina','Resultados normales','2025-02-19'),(45,85,'Hemograma completo','Leve anemia','2025-02-19'),(46,86,'Examen de heces','Sin anomalías','2025-02-20'),(47,87,'Ecografía abdominal','Hígado inflamado','2025-02-20'),(48,88,'Radiografía torácica','Posible infección pulmonar','2025-02-21'),(49,89,'Prueba de orina','Resultados normales','2025-02-21'),(50,90,'Hemograma completo','Resultados normales','2025-02-22'),(51,91,'Examen de piel','Alergia leve detectada','2025-02-22'),(52,92,'Radiografía de cadera','Displasia moderada','2025-02-23'),(53,93,'Ecografía abdominal','Estómago inflamado','2025-02-23'),(54,94,'Prueba de orina','Normal','2025-02-24'),(55,95,'Hemograma completo','Resultados normales','2025-02-24'),(56,96,'Examen de heces','Parásitos tratados exitosamente','2025-02-25'),(57,97,'Radiografía torácica','Pulmones en buen estado','2025-02-25'),(58,98,'Prueba de alergias','Reacción a polen','2025-02-26'),(59,99,'Examen de piel','Sin anomalías','2025-02-26'),(60,100,'Ecografía abdominal','Todo dentro de lo normal','2025-02-27'),(61,101,'Hemograma completo','Valores normales','2025-02-27'),(62,102,'Prueba de orina','Leve infección urinaria','2025-02-28'),(63,103,'Examen de heces','Sin parásitos','2025-02-28'),(64,104,'Radiografía torácica','Bronquios inflamados','2025-03-01'),(65,105,'Ecografía abdominal','Hígado inflamado','2025-03-01'),(66,106,'Hemograma completo','Glóbulos blancos altos','2025-03-02'),(67,107,'Examen de piel','Piel reseca','2025-03-02'),(68,108,'Prueba de orina','Cristales en orina','2025-03-03'),(69,109,'Radiografía de cadera','Articulaciones normales','2025-03-03'),(70,110,'Examen de heces','Resultados normales','2025-03-04'),(71,111,'Hemograma completo','Leve anemia','2025-03-04'),(72,112,'Prueba de alergias','Reacción a ácaros','2025-03-05'),(73,113,'Ecografía abdominal','Todo normal','2025-03-05'),(74,114,'Examen de piel','Dermatitis leve','2025-03-06'),(75,115,'Prueba de orina','Infección leve persistente','2025-03-06'),(76,116,'Hemograma completo','Resultados normales','2025-03-07'),(77,117,'Examen de heces','Sin parásitos','2025-03-07'),(78,118,'Radiografía torácica','Bronquitis leve','2025-03-08'),(79,119,'Ecografía abdominal','Todo dentro de la normalidad','2025-03-08'),(80,120,'Hemograma completo','Resultados normales','2025-03-09'),(81,121,'Prueba de alergias','Reacción a polvo','2025-03-09'),(82,122,'Examen de piel','Piel con irritación leve','2025-03-10'),(83,123,'Radiografía de cadera','Cadera sana','2025-03-10'),(84,124,'Prueba de orina','Resultados normales','2025-03-11'),(85,125,'Hemograma completo','Leve anemia','2025-03-11'),(86,126,'Examen de heces','Sin anomalías','2025-03-12'),(87,127,'Ecografía abdominal','Hígado inflamado','2025-03-12'),(88,128,'Radiografía torácica','Posible infección pulmonar','2025-03-13'),(89,129,'Prueba de orina','Resultados normales','2025-03-13'),(90,130,'Hemograma completo','Resultados normales','2025-03-14'),(91,131,'Examen de piel','Alergia leve detectada','2025-03-14'),(92,132,'Radiografía de cadera','Displasia moderada','2025-03-15'),(93,133,'Ecografía abdominal','Estómago inflamado','2025-03-15'),(94,134,'Prueba de orina','Normal','2025-03-16'),(95,135,'Hemograma completo','Resultados normales','2025-03-16'),(96,136,'Examen de heces','Parásitos tratados exitosamente','2025-03-17'),(97,137,'Radiografía torácica','Pulmones en buen estado','2025-03-17'),(98,138,'Prueba de alergias','Reacción a polen','2025-03-18'),(99,139,'Examen de piel','Sin anomalías','2025-03-18'),(100,140,'Ecografía abdominal','Todo dentro de lo normal','2025-03-19');
/*!40000 ALTER TABLE `laboratories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medical_histories`
--

DROP TABLE IF EXISTS `medical_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medical_histories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pet_id` int NOT NULL,
  `description` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pet_id` (`pet_id`),
  CONSTRAINT `fk_medicalhistory_pet` FOREIGN KEY (`pet_id`) REFERENCES `pets` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medical_histories`
--

LOCK TABLES `medical_histories` WRITE;
/*!40000 ALTER TABLE `medical_histories` DISABLE KEYS */;
INSERT INTO `medical_histories` VALUES (1,1,'Chequeo inicial: cachorro en buen estado general, sin anomalías visibles.','2025-01-05 10:15:00'),(2,2,'Consulta por diarrea leve. Se recomienda hidratación y dieta blanda.','2025-01-06 11:00:00'),(3,3,'Revisión de vacunación pendiente. Se aplicó vacuna antirrábica.','2025-01-07 14:30:00'),(4,4,'Herida superficial en la pata trasera. Se limpió y desinfectó.','2025-01-08 09:45:00'),(5,5,'Control de crecimiento: peso adecuado y apetito normal.','2025-01-09 16:20:00'),(6,6,'Chequeo postoperatorio de esterilización. Cicatrización correcta.','2025-01-10 12:00:00'),(7,7,'Problema dental detectado: acumulación de sarro.','2025-01-11 15:30:00'),(8,8,'Consulta por tos frecuente. Posible traqueítis leve.','2025-01-12 10:45:00'),(9,9,'Examen de piel: dermatitis alérgica tratada con antihistamínico.','2025-01-13 13:15:00'),(10,10,'Chequeo general: mascota activa, vacunación al día.','2025-01-14 11:00:00'),(11,11,'Otitis externa diagnosticada. Se prescribe tratamiento antibiótico.','2025-01-15 09:20:00'),(12,12,'Control de desparasitación interna y externa realizado.','2025-01-16 17:30:00'),(13,13,'Consulta por cojera. Posible esguince leve.','2025-01-17 14:45:00'),(14,14,'Examen de laboratorio: hemograma dentro de parámetros normales.','2025-01-18 10:30:00'),(15,15,'Vacunación polivalente aplicada sin reacciones adversas.','2025-01-19 12:10:00'),(16,16,'Control nutricional: sobrepeso detectado. Se sugiere dieta hipocalórica.','2025-01-20 09:40:00'),(17,17,'Chequeo geriátrico: inicio de artrosis en patas traseras.','2025-01-21 16:25:00'),(18,18,'Problemas gastrointestinales recurrentes. Se recomienda ecografía.','2025-01-22 11:15:00'),(19,19,'Chequeo cardiológico: leve soplo funcional detectado.','2025-01-23 15:00:00'),(20,20,'Consulta por vómitos. Posible intoxicación leve.','2025-01-24 13:20:00'),(21,21,'Herida por mordedura en oreja. Se sutura bajo anestesia local.','2025-01-25 09:10:00'),(22,22,'Vacuna refuerzo contra parvovirus aplicada.','2025-01-26 14:35:00'),(23,23,'Consulta por pérdida de apetito. Examen físico normal.','2025-01-27 16:10:00'),(24,24,'Chequeo dental: extracción de molar dañado.','2025-01-28 10:50:00'),(25,25,'Dermatitis por pulgas. Se inicia tratamiento antiparasitario.','2025-01-29 13:15:00'),(26,26,'Chequeo de cachorro: crecimiento normal y buen estado.','2025-01-30 11:00:00'),(27,27,'Examen de piel: alopecia localizada. Posible hongos.','2025-01-31 15:25:00'),(28,28,'Consulta por tos. Diagnóstico presuntivo: bronquitis leve.','2025-02-01 12:45:00'),(29,29,'Chequeo rutinario. Peso y condición corporal adecuados.','2025-02-02 10:30:00'),(30,30,'Se aplicó vacuna contra leptospirosis.','2025-02-03 14:20:00'),(31,31,'Control de fractura antigua. Mascota sin dolor al caminar.','2025-02-04 09:50:00'),(32,32,'Chequeo geriátrico: leve pérdida de visión.','2025-02-05 13:10:00'),(33,33,'Examen de laboratorio: glucosa ligeramente elevada.','2025-02-06 11:25:00'),(34,34,'Otitis media diagnosticada en oreja izquierda.','2025-02-07 16:00:00'),(35,35,'Chequeo anual. Todas las vacunas al día.','2025-02-08 12:30:00'),(36,36,'Consulta por diarrea intermitente. Se prescribe probiótico.','2025-02-09 10:15:00'),(37,37,'Chequeo reproductivo: en celo, sin complicaciones.','2025-02-10 14:40:00'),(38,38,'Control postvacunal: sin reacciones adversas.','2025-02-11 15:20:00'),(39,39,'Consulta por decaimiento. Se sugiere análisis de sangre.','2025-02-12 09:35:00'),(40,40,'Herida superficial en hocico. Se limpió y aplicó antibiótico tópico.','2025-02-13 11:50:00'),(41,41,'Chequeo general: mascota sana y activa.','2025-02-14 13:25:00'),(42,42,'Vacunación contra moquillo aplicada exitosamente.','2025-02-15 10:40:00'),(43,43,'Dermatitis alérgica tratada con corticoide inyectable.','2025-02-16 14:15:00'),(44,44,'Control nutricional: sobrepeso leve.','2025-02-17 09:20:00'),(45,45,'Chequeo por cojera: lesión muscular tratada con reposo.','2025-02-18 12:50:00'),(46,46,'Vacunación polivalente completada.','2025-02-19 11:10:00'),(47,47,'Chequeo de cachorro: peso adecuado y conducta normal.','2025-02-20 13:30:00'),(48,48,'Consulta por tos seca. Se receta jarabe expectorante.','2025-02-21 10:15:00'),(49,49,'Chequeo oftalmológico: inicio de cataratas.','2025-02-22 14:05:00'),(50,50,'Consulta por vómitos y diarrea. Posible gastroenteritis.','2025-02-23 11:35:00'),(51,51,'Chequeo postoperatorio. Cicatrización sin complicaciones.','2025-02-24 09:50:00'),(52,52,'Vacunación anual completa. Mascota en buen estado.','2025-02-25 16:10:00'),(53,53,'Consulta por rascado excesivo. Posible alergia alimentaria.','2025-02-26 10:45:00'),(54,54,'Control de desparasitación realizado.','2025-02-27 13:15:00'),(55,55,'Chequeo geriátrico: pérdida auditiva moderada.','2025-02-28 12:00:00'),(56,56,'Consulta por cojera repentina. Diagnóstico: luxación leve.','2025-03-01 14:35:00'),(57,57,'Herida en cola suturada bajo anestesia local.','2025-03-02 11:10:00'),(58,58,'Vacunación contra rabia aplicada.','2025-03-03 09:30:00'),(59,59,'Chequeo anual completo. Todos los valores normales.','2025-03-04 13:50:00'),(60,60,'Consulta por tos recurrente. Diagnóstico: laringitis.','2025-03-05 12:40:00'),(61,61,'Examen de piel: alopecia difusa. Posible hipotiroidismo.','2025-03-06 15:25:00'),(62,62,'Chequeo por vómitos crónicos. Se sugiere endoscopia.','2025-03-07 11:35:00'),(63,63,'Consulta por diarrea con sangre. Se solicita coprológico.','2025-03-08 10:20:00'),(64,64,'Control postvacunal: sin reacciones adversas.','2025-03-09 14:50:00'),(65,65,'Chequeo nutricional: mascota con bajo peso.','2025-03-10 12:30:00'),(66,66,'Herida en pata trasera. Vendaje aplicado.','2025-03-11 09:40:00'),(67,67,'Consulta por halitosis. Se recomienda limpieza dental.','2025-03-12 13:25:00'),(68,68,'Chequeo geriátrico: inicio de insuficiencia renal.','2025-03-13 11:15:00'),(69,69,'Examen oftalmológico: conjuntivitis leve.','2025-03-14 16:20:00'),(70,70,'Consulta por diarrea esporádica. Se receta dieta especial.','2025-03-15 10:10:00'),(71,71,'Chequeo rutinario: todo en orden.','2025-03-16 12:45:00'),(72,72,'Vacuna de refuerzo contra moquillo aplicada.','2025-03-17 09:55:00'),(73,73,'Consulta por pérdida de apetito. Diagnóstico: gastritis leve.','2025-03-18 13:15:00'),(74,74,'Chequeo de cachorro. Peso y talla adecuados.','2025-03-19 10:20:00'),(75,75,'Dermatitis localizada tratada con shampoo medicado.','2025-03-20 11:40:00'),(76,76,'Consulta por vómito ocasional. Examen físico normal.','2025-03-21 14:00:00'),(77,77,'Vacuna contra leptospirosis aplicada.','2025-03-22 12:30:00'),(78,78,'Chequeo anual completo.','2025-03-23 10:50:00'),(79,79,'Consulta por cojera. Posible esguince tratado con antiinflamatorio.','2025-03-24 13:15:00'),(80,80,'Examen de sangre: anemia leve detectada.','2025-03-25 09:20:00'),(81,81,'Vacunación polivalente aplicada sin complicaciones.','2025-03-26 12:40:00'),(82,82,'Chequeo geriátrico: mascota con artrosis avanzada.','2025-03-27 14:50:00'),(83,83,'Consulta por dermatitis húmeda. Se prescribe antibiótico tópico.','2025-03-28 10:30:00'),(84,84,'Chequeo nutricional: mascota obesa. Se recomienda dieta.','2025-03-29 13:25:00'),(85,85,'Vacuna contra rabia aplicada. Sin reacciones adversas.','2025-03-30 11:45:00'),(86,86,'Consulta por vómitos. Posible indigestión.','2025-03-31 09:30:00'),(87,87,'Chequeo de cachorro: todo en orden.','2025-04-01 12:15:00'),(88,88,'Examen de laboratorio: función renal normal.','2025-04-02 11:00:00'),(89,89,'Consulta por tos persistente. Se receta jarabe.','2025-04-03 13:40:00'),(90,90,'Chequeo dental: extracción de pieza dañada.','2025-04-04 10:10:00'),(91,91,'Control de vacunación: todas al día.','2025-04-05 12:20:00'),(92,92,'Chequeo geriátrico: presión arterial elevada.','2025-04-06 11:30:00'),(93,93,'Consulta por dermatitis recurrente. Posible alergia ambiental.','2025-04-07 09:50:00'),(94,94,'Chequeo general: mascota sana y activa.','2025-04-08 13:15:00'),(95,95,'Examen de laboratorio: glucosa normal.','2025-04-09 11:40:00'),(96,96,'Vacunación anual contra parvovirus aplicada.','2025-04-10 10:25:00'),(97,97,'Chequeo nutricional: mascota con peso ideal.','2025-04-11 12:30:00'),(98,98,'Consulta por cojera leve. Se recomienda reposo.','2025-04-12 14:15:00'),(99,99,'Chequeo postoperatorio: evolución favorable.','2025-04-13 11:10:00'),(100,100,'Vacunación antirrábica realizada sin complicaciones.','2025-04-14 10:45:00');
/*!40000 ALTER TABLE `medical_histories` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `ai_medical_histories_audit` AFTER INSERT ON `medical_histories` FOR EACH ROW BEGIN
  SET @from_medical_trigger = 1;
  INSERT INTO medical_histories_audit (medical_history_id, actionMedicalHistory, before_data, after_data)
  VALUES (
    NEW.id,
    'INSERT',
    NULL,
    JSON_OBJECT(
      'id', NEW.id,
      'pet_id', NEW.pet_id,
      'description', NEW.description,
      'created_at', NEW.created_at
    )
  );
  SET @from_medical_trigger = NULL;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `au_medical_histories_audit` AFTER UPDATE ON `medical_histories` FOR EACH ROW BEGIN
  SET @from_medical_trigger = 1;
  INSERT INTO medical_histories_audit (medical_history_id, actionMedicalHistory, before_data, after_data)
  VALUES (
    NEW.id,
    'UPDATE',
    JSON_OBJECT('id', OLD.id, 'pet_id', OLD.pet_id, 'description', OLD.description, 'created_at', OLD.created_at),
    JSON_OBJECT('id', NEW.id, 'pet_id', NEW.pet_id, 'description', NEW.description, 'created_at', NEW.created_at)
  );
  SET @from_medical_trigger = NULL;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `ad_medical_histories_audit` AFTER DELETE ON `medical_histories` FOR EACH ROW BEGIN
  SET @from_medical_trigger = 1;
  INSERT INTO medical_histories_audit (medical_history_id, actionMedicalHistory, before_data, after_data)
  VALUES (
    OLD.id,
    'DELETE',
    JSON_OBJECT('id', OLD.id, 'pet_id', OLD.pet_id, 'description', OLD.description, 'created_at', OLD.created_at),
    NULL
  );
  SET @from_medical_trigger = NULL;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `medical_histories_audit`
--

DROP TABLE IF EXISTS `medical_histories_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medical_histories_audit` (
  `id` int NOT NULL AUTO_INCREMENT,
  `medical_history_id` int NOT NULL,
  `actionMedicalHistory` enum('INSERT','UPDATE','DELETE') NOT NULL,
  `changed_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `before_data` json DEFAULT NULL,
  `after_data` json DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medical_histories_audit`
--

LOCK TABLES `medical_histories_audit` WRITE;
/*!40000 ALTER TABLE `medical_histories_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `medical_histories_audit` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `bii_medical_histories_audit_guard_insert` BEFORE INSERT ON `medical_histories_audit` FOR EACH ROW BEGIN
  IF COALESCE(@from_medical_trigger, 0) <> 1 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'INSERT solo permitido desde triggers de medical_histories.';
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `biu_medical_histories_audit_block_update` BEFORE UPDATE ON `medical_histories_audit` FOR EACH ROW BEGIN
  SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'medical_histories_audit es inmutable: UPDATE prohibido.';
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `bid_medical_histories_audit_block_delete` BEFORE DELETE ON `medical_histories_audit` FOR EACH ROW BEGIN
  SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'medical_histories_audit es inmutable: DELETE prohibido.';
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `medications`
--

DROP TABLE IF EXISTS `medications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text,
  `stock` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=199 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medications`
--

LOCK TABLES `medications` WRITE;
/*!40000 ALTER TABLE `medications` DISABLE KEYS */;
INSERT INTO `medications` VALUES (1,'Amoxicilina','Antibiótico de amplio espectro para infecciones bacterianas.',120),(2,'Cefalexina','Antibiótico usado en infecciones de piel, huesos y tejidos blandos.',95),(3,'Doxiciclina','Antibiótico para infecciones respiratorias y urinarias.',110),(4,'Enrofloxacina','Antibiótico fluoroquinolona para infecciones graves.',85),(5,'Metronidazol','Antibacteriano y antiparasitario usado en giardiasis y diarreas.',75),(6,'Clindamicina','Antibiótico efectivo en infecciones dentales y óseas.',60),(7,'Gentamicina','Antibiótico inyectable para infecciones graves.',50),(8,'Trimetoprim-Sulfametoxazol','Combinación antibiótica usada en vías urinarias.',70),(9,'Prednisolona','Corticosteroide antiinflamatorio y antialérgico.',90),(10,'Dexametasona','Corticosteroide de acción rápida en emergencias.',65),(11,'Ketoprofeno','Antiinflamatorio no esteroideo usado en dolor y fiebre.',80),(12,'Meloxicam','AINE usado para inflamaciones articulares y musculares.',75),(13,'Carprofeno','Antiinflamatorio para perros con artritis o dolor postquirúrgico.',85),(14,'Firocoxib','AINE para el tratamiento del dolor crónico en perros.',60),(15,'Flunixin Meglumina','AINE para dolor agudo y cólicos.',50),(16,'Aspirina Veterinaria','AINE de uso controlado en perros.',40),(17,'Omeprazol','Protector gástrico usado en úlceras y gastritis.',100),(18,'Ranitidina','Reductor de ácido gástrico en casos de reflujo.',85),(19,'Sucralfato','Protector gástrico en úlceras y erosiones.',70),(20,'Famotidina','Inhibidor de ácido gástrico.',90),(21,'Ivermectina','Antiparasitario usado en ácaros, pulgas y lombrices.',120),(22,'Selamectina','Antiparasitario tópico de amplio espectro.',95),(23,'Moxidectina','Antiparasitario interno y externo.',100),(24,'Milbemicina Oxima','Antiparasitario preventivo de filariosis.',75),(25,'Fenbendazol','Antiparasitario oral para perros y gatos.',85),(26,'Albendazol','Antiparasitario usado en helmintos intestinales.',70),(27,'Prazicuantel','Antiparasitario contra tenias.',65),(28,'Levamisol','Antiparasitario y estimulante inmunitario.',55),(29,'Pirantel Pamoato','Antiparasitario para nemátodos.',90),(30,'Febantel','Antiparasitario combinado en perros.',80),(31,'Furosemida','Diurético usado en insuficiencia cardíaca.',60),(32,'Espironolactona','Diurético ahorrador de potasio en tratamientos cardíacos.',65),(33,'Benazepril','Inhibidor de la ECA para insuficiencia cardíaca.',50),(34,'Enalapril','Antihipertensivo para perros y gatos.',55),(35,'Pimobendan','Fármaco inotrópico positivo para insuficiencia cardíaca.',45),(36,'Digoxina','Fármaco cardiotónico en arritmias.',40),(37,'Metoclopramida','Antiemético y procinético.',90),(38,'Maropitant','Antiemético de uso veterinario.',85),(39,'Ondansetrón','Antiemético en vómitos persistentes.',75),(40,'Domperidona','Antiemético y estimulante de la motilidad gástrica.',65),(41,'Insulina Canina','Hormona para el tratamiento de diabetes.',70),(42,'Insulina NPH','Insulina de acción intermedia.',65),(43,'Insulina Glargina','Insulina de acción prolongada.',60),(44,'Levotiroxina','Hormona tiroidea para hipotiroidismo.',85),(45,'Metimazol','Fármaco antitiroideo para hipertiroidismo felino.',70),(46,'Deslorelina','Implante hormonal para control reproductivo.',55),(47,'Cabergolina','Fármaco usado para inhibir la lactancia.',45),(48,'Clomipramina','Antidepresivo tricíclico usado en ansiedad canina.',50),(49,'Fluoxetina','Antidepresivo ISRS para trastornos de conducta.',60),(50,'Selegilina','Inhibidor de la MAO para disfunción cognitiva en perros.',40),(51,'Diazepam','Ansiolítico y relajante muscular.',70),(52,'Midazolam','Ansiolítico usado en emergencias.',50),(53,'Fenobarbital','Anticonvulsivo usado en epilepsia canina.',65),(54,'Levetiracetam','Anticonvulsivo moderno para perros y gatos.',60),(55,'Bromuro de Potasio','Anticonvulsivo complementario.',55),(56,'Gabapentina','Analgésico neurológico y anticonvulsivo.',70),(57,'Tramadol','Analgésico opioide para dolor moderado.',80),(58,'Buprenorfina','Opioide usado en gatos y perros.',60),(59,'Morfina','Opioide de uso hospitalario.',40),(60,'Fentanilo','Opioide potente en parches o inyección.',35),(61,'Codeína','Analgésico y antitusígeno.',55),(62,'Butorfanol','Analgésico y sedante.',50),(63,'Acepromazina','Tranquilizante usado en consultas y cirugías.',60),(64,'Xilacina','Sedante y analgésico.',55),(65,'Medetomidina','Sedante y analgésico potente.',50),(66,'Dexmedetomidina','Sedante moderno con reversores.',45),(67,'Atipamezol','Antagonista para revertir sedación.',40),(68,'Propofol','Anestésico de inducción rápida.',50),(69,'Ketamina','Anestésico disociativo.',65),(70,'Isoflurano','Anestésico inhalado.',35),(71,'Sevoflurano','Anestésico inhalado moderno.',30),(72,'Lidocaína','Anestésico local y antiarrítmico.',85),(73,'Bupivacaína','Anestésico local de larga duración.',70),(74,'Ropivacaína','Anestésico local.',60),(75,'Epinefrina','Adrenalina usada en emergencias.',40),(76,'Norepinefrina','Vasopresor en emergencias.',35),(77,'Dopamina','Fármaco cardiovascular de soporte.',30),(78,'Dobutamina','Inotrópico positivo para emergencias.',25),(79,'Clorhexidina','Antiséptico de amplio uso en heridas.',120),(80,'Povidona Yodada','Antiséptico usado en cirugías y heridas.',100),(81,'Alcohol Etílico 70%','Antiséptico y desinfectante.',150),(82,'Peróxido de Hidrógeno','Desinfectante usado en heridas superficiales.',110),(83,'Sulfadiazina de Plata','Cicatrizante y antibacteriano en quemaduras.',80),(84,'Ácido Bórico','Antiséptico oftálmico.',60),(85,'Lactato de Ringer','Solución intravenosa de rehidratación.',140),(86,'Suero Fisiológico 0.9%','Solución IV para hidratación.',160),(87,'Glucosa 5%','Solución IV de soporte energético.',130),(88,'Manitol','Diurético osmótico en emergencias.',50),(89,'Coloidales','Expansores de volumen plasmático.',45),(90,'Electrolitos Orales','Sales de rehidratación oral.',100),(91,'Vitamina B12','Suplemento vitamínico inyectable.',90),(92,'Multivitamínico Veterinario','Complemento oral de vitaminas.',95),(93,'Calcio Gluconato','Suplemento para hipocalcemia.',60),(94,'Hierro Dextrano','Suplemento inyectable contra anemia.',55),(95,'Zinc','Suplemento mineral para piel y pelo.',70),(96,'Omega 3','Suplemento nutricional para articulaciones y piel.',85),(97,'Probióticos','Complemento intestinal para diarreas.',75),(98,'Condroitina y Glucosamina','Suplemento articular.',65),(99,'Vitamina D','Suplemento vitamínico para regulación de calcio y fósforo.',70),(100,'Hierro','Suplemento mineral usado en casos de anemia y deficiencia.',60),(101,'Amoxicilina','Antibiótico de amplio espectro para infecciones bacterianas.',120),(102,'Cefalexina','Antibiótico usado en infecciones de piel, huesos y tejidos blandos.',95),(103,'Doxiciclina','Antibiótico para infecciones respiratorias y urinarias.',110),(104,'Enrofloxacina','Antibiótico fluoroquinolona para infecciones graves.',85),(105,'Metronidazol','Antibacteriano y antiparasitario usado en giardiasis y diarreas.',75),(106,'Clindamicina','Antibiótico efectivo en infecciones dentales y óseas.',60),(107,'Gentamicina','Antibiótico inyectable para infecciones graves.',50),(108,'Trimetoprim-Sulfametoxazol','Combinación antibiótica usada en vías urinarias.',70),(109,'Prednisolona','Corticosteroide antiinflamatorio y antialérgico.',90),(110,'Dexametasona','Corticosteroide de acción rápida en emergencias.',65),(111,'Ketoprofeno','Antiinflamatorio no esteroideo usado en dolor y fiebre.',80),(112,'Meloxicam','AINE usado para inflamaciones articulares y musculares.',75),(113,'Carprofeno','Antiinflamatorio para perros con artritis o dolor postquirúrgico.',85),(114,'Firocoxib','AINE para el tratamiento del dolor crónico en perros.',60),(115,'Flunixin Meglumina','AINE para dolor agudo y cólicos.',50),(116,'Aspirina Veterinaria','AINE de uso controlado en perros.',40),(117,'Omeprazol','Protector gástrico usado en úlceras y gastritis.',100),(118,'Ranitidina','Reductor de ácido gástrico en casos de reflujo.',85),(119,'Sucralfato','Protector gástrico en úlceras y erosiones.',70),(120,'Famotidina','Inhibidor de ácido gástrico.',90),(121,'Ivermectina','Antiparasitario usado en ácaros, pulgas y lombrices.',120),(122,'Selamectina','Antiparasitario tópico de amplio espectro.',95),(123,'Moxidectina','Antiparasitario interno y externo.',100),(124,'Milbemicina Oxima','Antiparasitario preventivo de filariosis.',75),(125,'Fenbendazol','Antiparasitario oral para perros y gatos.',85),(126,'Albendazol','Antiparasitario usado en helmintos intestinales.',70),(127,'Prazicuantel','Antiparasitario contra tenias.',65),(128,'Levamisol','Antiparasitario y estimulante inmunitario.',55),(129,'Pirantel Pamoato','Antiparasitario para nemátodos.',90),(130,'Febantel','Antiparasitario combinado en perros.',80),(131,'Furosemida','Diurético usado en insuficiencia cardíaca.',60),(132,'Espironolactona','Diurético ahorrador de potasio en tratamientos cardíacos.',65),(133,'Benazepril','Inhibidor de la ECA para insuficiencia cardíaca.',50),(134,'Enalapril','Antihipertensivo para perros y gatos.',55),(135,'Pimobendan','Fármaco inotrópico positivo para insuficiencia cardíaca.',45),(136,'Digoxina','Fármaco cardiotónico en arritmias.',40),(137,'Metoclopramida','Antiemético y procinético.',90),(138,'Maropitant','Antiemético de uso veterinario.',85),(139,'Ondansetrón','Antiemético en vómitos persistentes.',75),(140,'Domperidona','Antiemético y estimulante de la motilidad gástrica.',65),(141,'Insulina Canina','Hormona para el tratamiento de diabetes.',70),(142,'Insulina NPH','Insulina de acción intermedia.',65),(143,'Insulina Glargina','Insulina de acción prolongada.',60),(144,'Levotiroxina','Hormona tiroidea para hipotiroidismo.',85),(145,'Metimazol','Fármaco antitiroideo para hipertiroidismo felino.',70),(146,'Deslorelina','Implante hormonal para control reproductivo.',55),(147,'Cabergolina','Fármaco usado para inhibir la lactancia.',45),(148,'Clomipramina','Antidepresivo tricíclico usado en ansiedad canina.',50),(149,'Fluoxetina','Antidepresivo ISRS para trastornos de conducta.',60),(150,'Selegilina','Inhibidor de la MAO para disfunción cognitiva en perros.',40),(151,'Diazepam','Ansiolítico y relajante muscular.',70),(152,'Midazolam','Ansiolítico usado en emergencias.',50),(153,'Fenobarbital','Anticonvulsivo usado en epilepsia canina.',65),(154,'Levetiracetam','Anticonvulsivo moderno para perros y gatos.',60),(155,'Bromuro de Potasio','Anticonvulsivo complementario.',55),(156,'Gabapentina','Analgésico neurológico y anticonvulsivo.',70),(157,'Tramadol','Analgésico opioide para dolor moderado.',80),(158,'Buprenorfina','Opioide usado en gatos y perros.',60),(159,'Morfina','Opioide de uso hospitalario.',40),(160,'Fentanilo','Opioide potente en parches o inyección.',35),(161,'Codeína','Analgésico y antitusígeno.',55),(162,'Butorfanol','Analgésico y sedante.',50),(163,'Acepromazina','Tranquilizante usado en consultas y cirugías.',60),(164,'Xilacina','Sedante y analgésico.',55),(165,'Medetomidina','Sedante y analgésico potente.',50),(166,'Dexmedetomidina','Sedante moderno con reversores.',45),(167,'Atipamezol','Antagonista para revertir sedación.',40),(168,'Propofol','Anestésico de inducción rápida.',50),(169,'Ketamina','Anestésico disociativo.',65),(170,'Isoflurano','Anestésico inhalado.',35),(171,'Sevoflurano','Anestésico inhalado moderno.',30),(172,'Lidocaína','Anestésico local y antiarrítmico.',85),(173,'Bupivacaína','Anestésico local de larga duración.',70),(174,'Ropivacaína','Anestésico local.',60),(175,'Epinefrina','Adrenalina usada en emergencias.',40),(176,'Norepinefrina','Vasopresor en emergencias.',35),(177,'Dopamina','Fármaco cardiovascular de soporte.',30),(178,'Dobutamina','Inotrópico positivo para emergencias.',25),(179,'Clorhexidina','Antiséptico de amplio uso en heridas.',120),(180,'Povidona Yodada','Antiséptico usado en cirugías y heridas.',100),(181,'Alcohol Etílico 70%','Antiséptico y desinfectante.',150),(182,'Peróxido de Hidrógeno','Desinfectante usado en heridas superficiales.',110),(183,'Sulfadiazina de Plata','Cicatrizante y antibacteriano en quemaduras.',80),(184,'Ácido Bórico','Antiséptico oftálmico.',60),(185,'Lactato de Ringer','Solución intravenosa de rehidratación.',140),(186,'Suero Fisiológico 0.9%','Solución IV para hidratación.',160),(187,'Glucosa 5%','Solución IV de soporte energético.',130),(188,'Manitol','Diurético osmótico en emergencias.',50),(189,'Coloidales','Expansores de volumen plasmático.',45),(190,'Electrolitos Orales','Sales de rehidratación oral.',100),(191,'Vitamina B12','Suplemento vitamínico inyectable.',90),(192,'Multivitamínico Veterinario','Complemento oral de vitaminas.',95),(193,'Calcio Gluconato','Suplemento para hipocalcemia.',60),(194,'Hierro Dextrano','Suplemento inyectable contra anemia.',55),(195,'Zinc','Suplemento mineral para piel y pelo.',70),(196,'Omega 3','Suplemento nutricional para articulaciones y piel.',85),(197,'Probióticos','Complemento intestinal para diarreas.',75),(198,'Condroitina y Glucosamina','Suplemento articular.',65);
/*!40000 ALTER TABLE `medications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owners`
--

DROP TABLE IF EXISTS `owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `owners` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owners`
--

LOCK TABLES `owners` WRITE;
/*!40000 ALTER TABLE `owners` DISABLE KEYS */;
INSERT INTO `owners` VALUES (1,'Carlos Ramírez','3004567890','carlos.ramirez@mail.com','Cra 10 #12-34, Bogotá'),(2,'María Fernández','3109876543','maria.fernandez@mail.com','Cll 45 #23-67, Medellín'),(3,'Andrés López','3201234567','andres.lopez@mail.com','Av. Caracas #56-78, Bogotá'),(4,'Paola Gutiérrez','3012345678','paola.gutierrez@mail.com','Cra 15 #23-45, Cali'),(5,'Julián Torres','3156789012','julian.torres@mail.com','Cll 80 #12-90, Barranquilla'),(6,'Sandra Morales','3129876543','sandra.morales@mail.com','Cra 25 #45-89, Cartagena'),(7,'Felipe Castro','3002345678','felipe.castro@mail.com','Cll 100 #67-45, Bogotá'),(8,'Ana María Suárez','3115678901','ana.suarez@mail.com','Av. 30 #12-67, Medellín'),(9,'Camilo Herrera','3137890123','camilo.herrera@mail.com','Cra 50 #34-56, Bucaramanga'),(10,'Diana Rojas','3209871234','diana.rojas@mail.com','Cll 23 #56-89, Bogotá'),(11,'Juan Pérez','3013456789','juan.perez@mail.com','Cra 60 #78-90, Cali'),(12,'Natalia Vargas','3102345678','natalia.vargas@mail.com','Cll 40 #23-12, Bogotá'),(13,'Mauricio Sánchez','3124567890','mauricio.sanchez@mail.com','Cra 12 #34-67, Medellín'),(14,'Claudia Rodríguez','3146789012','claudia.rodriguez@mail.com','Av. 80 #45-12, Cali'),(15,'Sergio Díaz','3009876543','sergio.diaz@mail.com','Cll 50 #78-23, Cartagena'),(16,'Carolina Méndez','3201230987','carolina.mendez@mail.com','Cra 22 #90-12, Bogotá'),(17,'Esteban Torres','3016789012','esteban.torres@mail.com','Cll 67 #23-89, Medellín'),(18,'Mónica Ramírez','3135678901','monica.ramirez@mail.com','Cra 35 #45-67, Barranquilla'),(19,'Ricardo González','3157890123','ricardo.gonzalez@mail.com','Av. 20 #67-89, Bogotá'),(20,'Tatiana López','3112345678','tatiana.lopez@mail.com','Cll 12 #34-56, Cali'),(21,'David Castro','3103456789','david.castro@mail.com','Cra 45 #78-90, Bucaramanga'),(22,'Luisa Fernández','3129871234','luisa.fernandez@mail.com','Cll 56 #90-12, Bogotá'),(23,'Óscar Martínez','3141234567','oscar.martinez@mail.com','Av. 15 #23-78, Medellín'),(24,'Patricia Gutiérrez','3005678901','patricia.gutierrez@mail.com','Cra 67 #45-23, Cali'),(25,'Fernando Vargas','3207890123','fernando.vargas@mail.com','Cll 78 #12-45, Bogotá'),(26,'Verónica Ruiz','3016782345','veronica.ruiz@mail.com','Cra 23 #56-78, Medellín'),(27,'Diego Cárdenas','3137896543','diego.cardenas@mail.com','Cll 12 #45-67, Bogotá'),(28,'Marcela Ortega','3152347890','marcela.ortega@mail.com','Av. 45 #23-90, Cali'),(29,'Álvaro Jiménez','3124561234','alvaro.jimenez@mail.com','Cra 78 #90-23, Cartagena'),(30,'Liliana Vargas','3206783456','liliana.vargas@mail.com','Cll 23 #12-78, Barranquilla'),(31,'Hernán Ríos','3145678901','hernan.rios@mail.com','Cra 12 #34-23, Bogotá'),(32,'Marcela Cortés','3109871234','marcela.cortes@mail.com','Cll 45 #67-12, Cali'),(33,'Rodrigo Peña','3132345678','rodrigo.pena@mail.com','Av. 60 #78-45, Medellín'),(34,'Isabel Navarro','3154567890','isabel.navarro@mail.com','Cra 23 #45-67, Bogotá'),(35,'Jorge Castillo','3116789012','jorge.castillo@mail.com','Cll 12 #90-34, Cali'),(36,'Viviana Pardo','3007894561','viviana.pardo@mail.com','Cra 40 #23-78, Cartagena'),(37,'Edwin Ramírez','3201237890','edwin.ramirez@mail.com','Cll 90 #67-23, Bogotá'),(38,'Gloria Torres','3014567890','gloria.torres@mail.com','Av. 30 #12-45, Bucaramanga'),(39,'Hugo Gutiérrez','3127891234','hugo.gutierrez@mail.com','Cra 15 #34-90, Bogotá'),(40,'Carla Moreno','3145671234','carla.moreno@mail.com','Cll 34 #78-12, Cali'),(41,'Iván Castaño','3107892345','ivan.castano@mail.com','Cra 23 #45-78, Medellín'),(42,'Rosa Méndez','3156781234','rosa.mendez@mail.com','Av. 12 #90-45, Cartagena'),(43,'Pedro Hernández','3134567890','pedro.hernandez@mail.com','Cll 60 #34-23, Bogotá'),(44,'Ángela Reyes','3206789123','angela.reyes@mail.com','Cra 78 #23-12, Barranquilla'),(45,'Santiago Pineda','3002346789','santiago.pineda@mail.com','Av. 23 #67-89, Cali'),(46,'Beatriz Rojas','3127894561','beatriz.rojas@mail.com','Cll 34 #12-67, Bogotá'),(47,'Mauricio Cabrera','3148901234','mauricio.cabrera@mail.com','Cra 45 #67-90, Medellín'),(48,'Gabriela Sánchez','3115671234','gabriela.sanchez@mail.com','Av. 90 #23-45, Bogotá'),(49,'Adrián Torres','3157896543','adrian.torres@mail.com','Cll 23 #78-12, Cali'),(50,'Lorena Ramírez','3101234560','lorena.ramirez@mail.com','Cra 34 #56-23, Cartagena'),(51,'Ricardo López','3004567890','ricardo.lopez@mail.com','Cra 10 #23-45, Bogotá'),(52,'Sandra Díaz','3125678901','sandra.diaz@mail.com','Cll 34 #56-78, Medellín'),(53,'Fernando Aguilar','3156789012','fernando.aguilar@mail.com','Av. 45 #67-89, Cali'),(54,'Mariana Castro','3107890123','mariana.castro@mail.com','Cra 12 #34-56, Cartagena'),(55,'Oscar Beltrán','3138901234','oscar.beltran@mail.com','Cll 56 #78-90, Barranquilla'),(56,'Patricia Romero','3209012345','patricia.romero@mail.com','Av. 67 #89-12, Bucaramanga'),(57,'Felipe Vargas','3140123456','felipe.vargas@mail.com','Cra 78 #90-23, Bogotá'),(58,'Andrea Peña','3111234567','andrea.pena@mail.com','Cll 89 #12-34, Cali'),(59,'Camilo Herrera','3002345678','camilo.herrera@mail.com','Av. 90 #23-45, Medellín'),(60,'Lucía Acosta','3123456789','lucia.acosta@mail.com','Cra 23 #45-67, Cartagena'),(61,'Julián Ríos','3154567891','julian.rios@mail.com','Cll 34 #56-78, Bogotá'),(62,'Carolina Mendoza','3105678902','carolina.mendoza@mail.com','Av. 45 #67-89, Cali'),(63,'Ramiro Ortega','3136789013','ramiro.ortega@mail.com','Cra 56 #78-90, Medellín'),(64,'Paola Paredes','3207890124','paola.paredes@mail.com','Cll 67 #89-12, Cartagena'),(65,'Sebastián Cruz','3148901235','sebastian.cruz@mail.com','Av. 78 #90-23, Bogotá'),(66,'Natalia Lozano','3119012346','natalia.lozano@mail.com','Cra 89 #12-34, Barranquilla'),(67,'Héctor Camacho','3000123457','hector.camacho@mail.com','Cll 90 #23-45, Bucaramanga'),(68,'Valentina Duarte','3121234568','valentina.duarte@mail.com','Av. 23 #45-67, Cali'),(69,'Mauricio Guerrero','3152345679','mauricio.guerrero@mail.com','Cra 34 #56-78, Bogotá'),(70,'Gloria Espinosa','3103456780','gloria.espinosa@mail.com','Cll 45 #67-89, Medellín'),(71,'Francisco Cárdenas','3134567891','francisco.cardenas@mail.com','Av. 56 #78-90, Cartagena'),(72,'Elena Quintero','3205678902','elena.quintero@mail.com','Cra 67 #89-12, Cali'),(73,'Javier Marín','3146789013','javier.marin@mail.com','Cll 78 #90-23, Bogotá'),(74,'Rocío Patiño','3117890124','rocio.patino@mail.com','Av. 89 #12-34, Medellín'),(75,'Andrés Palacios','3008901235','andres.palacios@mail.com','Cra 90 #23-45, Barranquilla'),(76,'Marcos Salazar','3129012347','marcos.salazar@mail.com','Cll 12 #34-56, Bogotá'),(77,'Isabel Cortés','3150123458','isabel.cortes@mail.com','Av. 23 #45-67, Cali'),(78,'Tomás Andrade','3101234569','tomas.andrade@mail.com','Cra 34 #56-78, Medellín'),(79,'Laura Becerra','3132345670','laura.becerra@mail.com','Cll 45 #67-89, Barranquilla'),(80,'Cristian Fajardo','3203456781','cristian.fajardo@mail.com','Av. 56 #78-90, Cartagena'),(81,'Silvia Guzmán','3144567892','silvia.guzman@mail.com','Cra 67 #89-12, Bucaramanga'),(82,'Rafael Castaño','3115678903','rafael.castano@mail.com','Cll 78 #90-23, Cali'),(83,'Adriana Gil','3006789014','adriana.gil@mail.com','Av. 89 #12-34, Bogotá'),(84,'Esteban Porras','3127890125','esteban.porras@mail.com','Cra 90 #23-45, Medellín'),(85,'Verónica Torres','3158901236','veronica.torres@mail.com','Cll 12 #34-56, Cartagena'),(86,'Manuel Robledo','3109012347','manuel.robledo@mail.com','Av. 23 #45-67, Bogotá'),(87,'Claudia Moreno','3130123458','claudia.moreno@mail.com','Cra 34 #56-78, Cali'),(88,'Fabián Duarte','3201234569','fabian.duarte@mail.com','Cll 45 #67-89, Medellín'),(89,'Marcela Vargas','3142345670','marcela.vargas@mail.com','Av. 56 #78-90, Cartagena'),(90,'Rodrigo Pineda','3113456781','rodrigo.pineda@mail.com','Cra 67 #89-12, Barranquilla'),(91,'Lorena Castillo','3004567892','lorena.castillo@mail.com','Cll 78 #90-23, Bucaramanga'),(92,'Iván Guerrero','3125678903','ivan.guerrero@mail.com','Av. 89 #12-34, Bogotá'),(93,'Paula Cabrera','3156789014','paula.cabrera@mail.com','Cra 90 #23-45, Medellín'),(94,'Álvaro Villalba','3107890125','alvaro.villalba@mail.com','Cll 12 #34-56, Cali'),(95,'Tatiana Rincón','3138901236','tatiana.rincon@mail.com','Av. 23 #45-67, Barranquilla'),(96,'Mauricio Nieto','3209012347','mauricio.nieto@mail.com','Cra 34 #56-78, Cartagena'),(97,'Carmen Salinas','3140123458','carmen.salinas@mail.com','Cll 45 #67-89, Bogotá'),(98,'Gustavo León','3111234569','gustavo.leon@mail.com','Av. 56 #78-90, Medellín'),(99,'Mónica Beltrán','3002345670','monica.beltran@mail.com','Cra 67 #89-12, Cali'),(100,'Jorge Cifuentes','3123456781','jorge.cifuentes@mail.com','Cll 78 #90-23, Cartagena');
/*!40000 ALTER TABLE `owners` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `after_insert_owners` AFTER INSERT ON `owners` FOR EACH ROW BEGIN
  INSERT INTO owners_audit (owner_id, actionOwner, after_data)
  VALUES (
    NEW.id,
    'INSERT',
    JSON_OBJECT('id', NEW.id, 'name', NEW.name, 'phone', NEW.phone, 'email', NEW.email, 'address', NEW.address)
  );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `after_update_owners` AFTER UPDATE ON `owners` FOR EACH ROW BEGIN
  INSERT INTO owners_audit (owner_id, actionOwner, before_data, after_data)
  VALUES (
    NEW.id,
    'UPDATE',
    JSON_OBJECT('id', OLD.id, 'name', OLD.name, 'phone', OLD.phone, 'email', OLD.email, 'address', OLD.address),
    JSON_OBJECT('id', NEW.id, 'name', NEW.name, 'phone', NEW.phone, 'email', NEW.email, 'address', NEW.address)
  );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `after_delete_owners` AFTER DELETE ON `owners` FOR EACH ROW BEGIN
  INSERT INTO owners_audit (owner_id, actionOwner, before_data)
  VALUES (
    OLD.id,
    'DELETE',
    JSON_OBJECT('id', OLD.id, 'name', OLD.name, 'phone', OLD.phone, 'email', OLD.email, 'address', OLD.address)
  );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `owners_audit`
--

DROP TABLE IF EXISTS `owners_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `owners_audit` (
  `id` int NOT NULL AUTO_INCREMENT,
  `owner_id` int NOT NULL,
  `actionOwner` varchar(10) DEFAULT NULL,
  `changed_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `before_data` json DEFAULT NULL,
  `after_data` json DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owners_audit`
--

LOCK TABLES `owners_audit` WRITE;
/*!40000 ALTER TABLE `owners_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `owners_audit` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `before_insert_owners_audit` BEFORE INSERT ON `owners_audit` FOR EACH ROW BEGIN
  SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'INSERT prohibido en owners_audit';
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `before_update_owners_audit` BEFORE UPDATE ON `owners_audit` FOR EACH ROW BEGIN
  SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'UPDATE prohibido en owners_audit';
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `before_delete_owners_audit` BEFORE DELETE ON `owners_audit` FOR EACH ROW BEGIN
  SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'DELETE prohibido en owners_audit';
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `appointment_id` int NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_payments_appointment` (`appointment_id`),
  CONSTRAINT `fk_payments_appointment` FOREIGN KEY (`appointment_id`) REFERENCES `appointments` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,41,50000.00,'2025-01-01'),(2,42,75000.00,'2025-01-01'),(3,43,32000.00,'2025-01-02'),(4,44,45000.00,'2025-01-02'),(5,45,60000.00,'2025-01-03'),(6,46,40000.00,'2025-01-03'),(7,47,70000.00,'2025-01-04'),(8,48,52000.00,'2025-01-04'),(9,49,38000.00,'2025-01-05'),(10,50,62000.00,'2025-01-05'),(11,51,55000.00,'2025-01-06'),(12,52,47000.00,'2025-01-06'),(13,53,80000.00,'2025-01-07'),(14,54,36000.00,'2025-01-07'),(15,55,44000.00,'2025-01-08'),(16,56,51000.00,'2025-01-08'),(17,57,60000.00,'2025-01-09'),(18,58,73000.00,'2025-01-09'),(19,59,39000.00,'2025-01-10'),(20,60,45000.00,'2025-01-10'),(21,61,64000.00,'2025-01-11'),(22,62,48000.00,'2025-01-11'),(23,63,72000.00,'2025-01-12'),(24,64,53000.00,'2025-01-12'),(25,65,50000.00,'2025-01-13'),(26,66,61000.00,'2025-01-13'),(27,67,57000.00,'2025-01-14'),(28,68,42000.00,'2025-01-14'),(29,69,69000.00,'2025-01-15'),(30,70,55000.00,'2025-01-15'),(31,71,46000.00,'2025-01-16'),(32,72,63000.00,'2025-01-16'),(33,73,37000.00,'2025-01-17'),(34,74,75000.00,'2025-01-17'),(35,75,42000.00,'2025-01-18'),(36,76,58000.00,'2025-01-18'),(37,77,65000.00,'2025-01-19'),(38,78,46000.00,'2025-01-19'),(39,79,51000.00,'2025-01-20'),(40,80,39000.00,'2025-01-20'),(41,81,54000.00,'2025-01-21'),(42,82,72000.00,'2025-01-21'),(43,83,47000.00,'2025-01-22'),(44,84,59000.00,'2025-01-22'),(45,85,66000.00,'2025-01-23'),(46,86,70000.00,'2025-01-23'),(47,87,35000.00,'2025-01-24'),(48,88,49000.00,'2025-01-24'),(49,89,78000.00,'2025-01-25'),(50,90,43000.00,'2025-01-25'),(51,91,60000.00,'2025-01-26'),(52,92,37000.00,'2025-01-26'),(53,93,56000.00,'2025-01-27'),(54,94,72000.00,'2025-01-27'),(55,95,41000.00,'2025-01-28'),(56,96,47000.00,'2025-01-28'),(57,97,69000.00,'2025-01-29'),(58,98,51000.00,'2025-01-29'),(59,99,75000.00,'2025-01-30'),(60,100,48000.00,'2025-01-30'),(61,101,53000.00,'2025-01-31'),(62,102,65000.00,'2025-01-31'),(63,103,38000.00,'2025-02-01'),(64,104,72000.00,'2025-02-01'),(65,105,60000.00,'2025-02-02'),(66,106,44000.00,'2025-02-02'),(67,107,58000.00,'2025-02-03'),(68,108,69000.00,'2025-02-03'),(69,109,37000.00,'2025-02-04'),(70,110,54000.00,'2025-02-04'),(71,111,71000.00,'2025-02-05'),(72,112,49000.00,'2025-02-05'),(73,113,43000.00,'2025-02-06'),(74,114,67000.00,'2025-02-06'),(75,115,51000.00,'2025-02-07'),(76,116,46000.00,'2025-02-07'),(77,117,75000.00,'2025-02-08'),(78,118,39000.00,'2025-02-08'),(79,119,58000.00,'2025-02-09'),(80,120,63000.00,'2025-02-09'),(81,121,41000.00,'2025-02-10'),(82,122,56000.00,'2025-02-10'),(83,123,72000.00,'2025-02-11'),(84,124,49000.00,'2025-02-11'),(85,125,45000.00,'2025-02-12'),(86,126,60000.00,'2025-02-12'),(87,127,66000.00,'2025-02-13'),(88,128,48000.00,'2025-02-13'),(89,129,53000.00,'2025-02-14'),(90,130,70000.00,'2025-02-14'),(91,131,42000.00,'2025-02-15'),(92,132,57000.00,'2025-02-15'),(93,133,65000.00,'2025-02-16'),(94,134,49000.00,'2025-02-16'),(95,135,74000.00,'2025-02-17'),(96,136,39000.00,'2025-02-17'),(97,137,52000.00,'2025-02-18'),(98,138,60000.00,'2025-02-18'),(99,139,45000.00,'2025-02-19'),(100,140,73000.00,'2025-02-19');
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `au_payments_audit` AFTER UPDATE ON `payments` FOR EACH ROW BEGIN
  INSERT INTO payments_audit (payment_id, actionPayment, before_data, after_data)
  VALUES (
    NEW.id,
    'UPDATE',
    JSON_OBJECT(
      'id', OLD.id,
      'appointment_id', OLD.appointment_id,
      'amount', OLD.amount,
      'payment_date', OLD.payment_date
    ),
    JSON_OBJECT(
      'id', NEW.id,
      'appointment_id', NEW.appointment_id,
      'amount', NEW.amount,
      'payment_date', NEW.payment_date
    )
  );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `ad_payments_audit` AFTER DELETE ON `payments` FOR EACH ROW BEGIN
  INSERT INTO payments_audit (payment_id, actionPayment, before_data, after_data)
  VALUES (
    OLD.id,
    'DELETE',
    JSON_OBJECT(
      'id', OLD.id,
      'appointment_id', OLD.appointment_id,
      'amount', OLD.amount,
      'payment_date', OLD.payment_date
    ),
    NULL
  );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `payments_audit`
--

DROP TABLE IF EXISTS `payments_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments_audit` (
  `id` int NOT NULL AUTO_INCREMENT,
  `payment_id` int NOT NULL,
  `actionPayment` varchar(10) DEFAULT NULL,
  `changed_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `before_data` json DEFAULT NULL,
  `after_data` json DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments_audit`
--

LOCK TABLES `payments_audit` WRITE;
/*!40000 ALTER TABLE `payments_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments_audit` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `bii_payments_audit_guard_insert` BEFORE INSERT ON `payments_audit` FOR EACH ROW BEGIN
  SIGNAL SQLSTATE '45000'
  SET MESSAGE_TEXT = 'INSERT en payments_audit solo permitido desde triggers de payments.';
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `biu_payments_audit_block_update` BEFORE UPDATE ON `payments_audit` FOR EACH ROW BEGIN
  SIGNAL SQLSTATE '45000'
  SET MESSAGE_TEXT = 'payments_audit es inmutable: UPDATE prohibido.';
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `bid_payments_audit_block_delete` BEFORE DELETE ON `payments_audit` FOR EACH ROW BEGIN
  SIGNAL SQLSTATE '45000'
  SET MESSAGE_TEXT = 'payments_audit es inmutable: DELETE prohibido.';
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `pets`
--

DROP TABLE IF EXISTS `pets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `species` varchar(50) DEFAULT NULL,
  `breed` varchar(50) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `owner_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pets_owner` (`owner_id`),
  CONSTRAINT `fk_pets_owner` FOREIGN KEY (`owner_id`) REFERENCES `owners` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pets`
--

LOCK TABLES `pets` WRITE;
/*!40000 ALTER TABLE `pets` DISABLE KEYS */;
INSERT INTO `pets` VALUES (1,'Paola','Perro','Labrador Retriever','2020-03-15',1),(2,'Milo','Gato','Siames','2019-07-22',2),(3,'Max','Perro','Golden Retriever','2021-01-05',3),(4,'Simba','Gato','Persa','2018-11-30',4),(5,'Rocky','Perro','Bulldog Inglés','2020-08-10',5),(6,'Coco','Gato','Maine Coon','2021-06-14',6),(7,'Bruno','Perro','Pastor Alemán','2019-05-20',7),(8,'Nala','Gato','Bengalí','2020-02-25',8),(9,'Toby','Perro','Beagle','2021-09-18',9),(10,'Mia','Gato','Ragdoll','2019-10-12',10),(11,'Zeus','Perro','Rottweiler','2018-06-05',11),(12,'Chloe','Gato','Sphynx','2020-01-08',12),(13,'Thor','Perro','Husky Siberiano','2019-12-19',13),(14,'Kira','Gato','Angora Turco','2021-07-25',14),(15,'Bobby','Perro','Pug','2018-09-30',15),(16,'Lola','Gato','Británico Corto de Pelo','2020-04-17',16),(17,'Duke','Perro','Dálmata','2021-03-05',17),(18,'Mishu','Gato','Bombay','2019-01-20',18),(19,'Jack','Perro','Chihuahua','2020-11-15',19),(20,'Pelusa','Gato','Himalayo','2018-07-22',20),(21,'Rex','Perro','Doberman','2019-05-09',21),(22,'Sasha','Gato','Fold Escocés','2020-08-14',22),(23,'Tango','Perro','Boxer','2021-10-01',23),(24,'Luna','Gato','Mestizo','2018-04-12',24),(25,'Apolo','Perro','San Bernardo','2020-06-19',25),(26,'Cleo','Gato','Oriental','2019-09-03',26),(27,'Otto','Perro','Bulldog Francés','2021-12-21',27),(28,'Moka','Gato','Balines','2020-02-10',28),(29,'Leo','Perro','Shar Pei','2018-11-28',29),(30,'Daisy','Gato','Chartreux','2019-06-30',30),(31,'Sam','Perro','Terranova','2020-07-07',31),(32,'Canela','Gato','Devon Rex','2018-12-02',32),(33,'Tyson','Perro','Mestizo','2019-08-18',33),(34,'Mimi','Gato','Azul Ruso','2021-05-13',34),(35,'Baco','Perro','Cocker Spaniel','2020-09-25',35),(36,'Gala','Gato','Sagrado de Birmania','2019-11-05',36),(37,'Oso','Perro','Mastín Español','2021-01-16',37),(38,'Nube','Gato','Manx','2020-03-30',38),(39,'Dante','Perro','Whippet','2018-05-22',39),(40,'Molly','Gato','Cornish Rex','2019-02-08',40),(41,'Balto','Perro','Samoyedo','2021-08-11',41),(42,'Greta','Gato','Tonquinés','2020-12-19',42),(43,'Zar','Perro','Setter Irlandés','2019-10-25',43),(44,'Fiona','Gato','American Shorthair','2021-04-02',44),(45,'Hércules','Perro','Bóxer','2018-06-29',45),(46,'Ruby','Gato','Ocicat','2020-09-11',46),(47,'Spike','Perro','Akita Inu','2019-01-27',47),(48,'Mora','Gato','Korat','2021-07-23',48),(49,'Kenai','Perro','Galgo Español','2020-05-18',49),(50,'Pecas','Gato','Exótico','2019-03-15',50),(51,'Ares','Perro','Cane Corso','2021-10-29',51),(52,'Nina','Gato','Selkirk Rex','2020-01-22',52),(53,'Rocko','Perro','Shih Tzu','2018-08-09',53),(54,'Miel','Gato','Van Turco','2019-12-13',54),(55,'Loki','Perro','Basenji','2021-11-17',55),(56,'Sol','Gato','Peterbald','2020-06-21',56),(57,'Hugo','Perro','Pointer','2019-09-14',57),(58,'Nina','Gato','Snowshoe','2018-02-28',58),(59,'Spike','Perro','Bichón Maltés','2020-08-03',59),(60,'Cereza','Gato','Abisinio','2019-05-12',60),(61,'Hank','Perro','Fox Terrier','2021-09-01',61),(62,'Perla','Gato','Bosque de Noruega','2020-02-26',62),(63,'Dino','Perro','Staffordshire Terrier','2018-12-14',63),(64,'Sami','Gato','Laperm','2019-07-09',64),(65,'Frodo','Perro','Basset Hound','2021-04-20',65),(66,'Estrella','Gato','American Curl','2020-11-10',66),(67,'Odin','Perro','Mastín Napolitano','2019-08-30',67),(68,'Lila','Gato','Japanese Bobtail','2018-05-11',68),(69,'Axel','Perro','Gran Danés','2020-01-19',69),(70,'Menta','Gato','Khao Manee','2019-03-24',70),(71,'Rambo','Perro','Bulldog Americano','2021-07-06',71),(72,'Cata','Gato','Singapura','2020-09-09',72),(73,'Hunter','Perro','Border Collie','2019-11-15',73),(74,'Nina','Gato','Mestizo','2018-10-05',74),(75,'Otis','Perro','Dogo Argentino','2021-02-02',75),(76,'Kiara','Gato','Oriental','2020-04-07',76),(77,'Rocco','Perro','Bullmastiff','2019-06-20',77),(78,'Sofi','Gato','Azul Ruso','2018-03-18',78),(79,'Enzo','Perro','Chow Chow','2020-12-01',79),(80,'Michi','Gato','Siamés','2019-01-29',80),(81,'Bolt','Perro','Foxhound','2021-05-30',81),(82,'Canelita','Gato','Maine Coon','2020-07-12',82),(83,'Benji','Perro','Teckel','2019-09-09',83),(84,'Nieve','Gato','British Longhair','2018-11-25',84),(85,'Drako','Perro','Pastor Belga','2021-08-18',85),(86,'Coco','Gato','Siamés','2020-06-30',86),(87,'Lucky','Perro','Caniche','2019-03-17',87),(88,'Tina','Gato','Exótico','2018-09-14',88),(89,'Rolo','Perro','Pekinés','2021-03-09',89),(90,'Gato','Gato','Himalayo','2020-01-23',90),(91,'Shadow','Perro','Corgi Galés','2019-05-27',91),(92,'Kity','Gato','Persa','2018-07-07',92),(93,'Buster','Perro','Boston Terrier','2021-06-14',93),(94,'Chispa','Gato','Siames','2020-10-16',94),(95,'Leo','Perro','Pomerania','2019-04-05',95),(96,'Nina','Gato','Bombay','2018-12-22',96),(97,'Simón','Perro','Fox Terrier','2021-02-27',97),(98,'Tita','Gato','Sphynx','2020-09-02',98),(99,'Rocky','Perro','Dálmata','2019-11-11',99),(100,'Misu','Gato','Mestizo','2018-01-18',100);
/*!40000 ALTER TABLE `pets` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `after_insert_pets` AFTER INSERT ON `pets` FOR EACH ROW BEGIN
  INSERT INTO pets_audit (pet_id, actionPet, changed_at, after_data)
  VALUES (
    NEW.id,
    'INSERT',
    NOW(),
    JSON_OBJECT(
      'id', NEW.id,
      'name', NEW.name,
      'species', NEW.species,
      'breed', NEW.breed,
      'birth_date', NEW.birth_date,
      'owner_id', NEW.owner_id
    )
  );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `after_update_pets` AFTER UPDATE ON `pets` FOR EACH ROW BEGIN
  INSERT INTO pets_audit (pet_id, actionPet, changed_at, before_data, after_data)
  VALUES (
    NEW.id,
    'UPDATE',
    NOW(),
    JSON_OBJECT(
      'id', OLD.id,
      'name', OLD.name,
      'species', OLD.species,
      'breed', OLD.breed,
      'birth_date', OLD.birth_date,
      'owner_id', OLD.owner_id
    ),
    JSON_OBJECT(
      'id', NEW.id,
      'name', NEW.name,
      'species', NEW.species,
      'breed', NEW.breed,
      'birth_date', NEW.birth_date,
      'owner_id', NEW.owner_id
    )
  );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `after_delete_pets` AFTER DELETE ON `pets` FOR EACH ROW BEGIN
  INSERT INTO pets_audit (pet_id, actionPet, changed_at, before_data)
  VALUES (
    OLD.id,
    'DELETE',
    NOW(),
    JSON_OBJECT(
      'id', OLD.id,
      'name', OLD.name,
      'species', OLD.species,
      'breed', OLD.breed,
      'birth_date', OLD.birth_date,
      'owner_id', OLD.owner_id
    )
  );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `pets_audit`
--

DROP TABLE IF EXISTS `pets_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pets_audit` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `pet_id` int NOT NULL,
  `actionPet` enum('INSERT','UPDATE','DELETE') NOT NULL DEFAULT 'INSERT',
  `changed_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `changed_by` varchar(255) NOT NULL DEFAULT 'Admin',
  `before_data` json DEFAULT NULL,
  `after_data` json DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pets_audit`
--

LOCK TABLES `pets_audit` WRITE;
/*!40000 ALTER TABLE `pets_audit` DISABLE KEYS */;
INSERT INTO `pets_audit` VALUES (1,1,'UPDATE','2025-10-15 03:20:26','Admin','{\"id\": 1, \"name\": \"Luna\", \"breed\": \"Labrador Retriever\", \"species\": \"Perro\", \"owner_id\": 1, \"birth_date\": \"2020-03-15\"}','{\"id\": 1, \"name\": \"Paola\", \"breed\": \"Labrador Retriever\", \"species\": \"Perro\", \"owner_id\": 1, \"birth_date\": \"2020-03-15\"}');
/*!40000 ALTER TABLE `pets_audit` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `before_update_pets_audit` BEFORE UPDATE ON `pets_audit` FOR EACH ROW BEGIN
  SIGNAL SQLSTATE '45000' 
  SET MESSAGE_TEXT = 'No se permite modificar registros en pets_audit.';
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `before_delete_pets_audit` BEFORE DELETE ON `pets_audit` FOR EACH ROW BEGIN
  SIGNAL SQLSTATE '45000' 
  SET MESSAGE_TEXT = 'No se permite eliminar registros de pets_audit.';
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `prescription_medications`
--

DROP TABLE IF EXISTS `prescription_medications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescription_medications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `prescription_id` int NOT NULL,
  `medication_id` int NOT NULL,
  `dosage` varchar(100) DEFAULT NULL,
  `duration` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_prescmeds_prescription` (`prescription_id`),
  KEY `fk_prescmeds_medication` (`medication_id`),
  CONSTRAINT `fk_prescmeds_medication` FOREIGN KEY (`medication_id`) REFERENCES `medications` (`id`),
  CONSTRAINT `fk_prescmeds_prescription` FOREIGN KEY (`prescription_id`) REFERENCES `prescriptions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescription_medications`
--

LOCK TABLES `prescription_medications` WRITE;
/*!40000 ALTER TABLE `prescription_medications` DISABLE KEYS */;
INSERT INTO `prescription_medications` VALUES (1,1,1,'1 tableta cada 12 horas','5 días'),(2,1,2,'2 ml vía oral','7 días'),(3,2,3,'1 tableta cada 24 horas','10 días'),(4,2,4,'1 cápsula vía oral','5 días'),(5,3,5,'5 ml cada 8 horas','7 días'),(6,3,6,'1 tableta cada 12 horas','10 días'),(7,4,7,'2 tabletas vía oral','5 días'),(8,4,8,'1 tableta cada 8 horas','3 días'),(9,5,9,'10 ml vía oral','7 días'),(10,5,10,'1 cápsula cada 12 horas','14 días'),(11,6,11,'1 tableta cada 24 horas','7 días'),(12,6,12,'5 ml cada 12 horas','10 días'),(13,7,13,'2 cápsulas vía oral','5 días'),(14,7,14,'1 tableta cada 8 horas','7 días'),(15,8,15,'5 ml vía oral','3 días'),(16,8,16,'1 tableta cada 12 horas','5 días'),(17,9,17,'1 tableta cada 24 horas','7 días'),(18,9,18,'2 ml vía oral','10 días'),(19,10,19,'5 ml vía oral','7 días'),(20,10,20,'1 tableta cada 12 horas','14 días'),(21,11,21,'1 cápsula cada 12 horas','5 días'),(22,11,22,'5 ml cada 8 horas','7 días'),(23,12,23,'1 tableta vía oral','10 días'),(24,12,24,'1 tableta cada 24 horas','5 días'),(25,13,25,'2 ml cada 12 horas','7 días'),(26,13,26,'1 cápsula vía oral','10 días'),(27,14,27,'1 tableta cada 12 horas','5 días'),(28,14,28,'5 ml vía oral','7 días'),(29,15,29,'2 cápsulas vía oral','10 días'),(30,15,30,'1 tableta cada 8 horas','14 días'),(31,16,31,'5 ml cada 12 horas','7 días'),(32,16,32,'1 tableta cada 24 horas','5 días'),(33,17,33,'1 cápsula vía oral','10 días'),(34,17,34,'2 ml cada 8 horas','7 días'),(35,18,35,'1 tableta cada 12 horas','5 días'),(36,18,36,'5 ml vía oral','10 días'),(37,19,37,'1 cápsula cada 24 horas','7 días'),(38,19,38,'2 tabletas vía oral','5 días'),(39,20,39,'1 tableta cada 8 horas','10 días'),(40,20,40,'5 ml cada 12 horas','7 días'),(41,21,41,'1 cápsula vía oral','5 días'),(42,21,42,'1 tableta cada 12 horas','10 días'),(43,22,43,'2 ml vía oral','7 días'),(44,22,44,'1 tableta cada 24 horas','5 días'),(45,23,45,'5 ml cada 8 horas','10 días'),(46,23,46,'1 tableta vía oral','7 días'),(47,24,47,'2 cápsulas vía oral','5 días'),(48,24,48,'1 tableta cada 12 horas','10 días'),(49,25,49,'5 ml vía oral','7 días'),(50,25,50,'1 cápsula cada 8 horas','5 días'),(51,26,1,'1 tableta cada 12 horas','10 días'),(52,26,2,'5 ml vía oral','7 días'),(53,27,3,'1 tableta cada 24 horas','5 días'),(54,27,4,'2 cápsulas vía oral','10 días'),(55,28,5,'1 tableta cada 8 horas','7 días'),(56,28,6,'5 ml cada 12 horas','5 días'),(57,29,7,'1 cápsula vía oral','10 días'),(58,29,8,'2 ml vía oral','7 días'),(59,30,9,'1 tableta cada 12 horas','5 días'),(60,30,10,'5 ml vía oral','10 días'),(61,31,11,'1 tableta cada 24 horas','7 días'),(62,31,12,'2 cápsulas vía oral','5 días'),(63,32,13,'1 tableta cada 8 horas','10 días'),(64,32,14,'5 ml cada 12 horas','7 días'),(65,33,15,'1 cápsula vía oral','5 días'),(66,33,16,'1 tableta cada 12 horas','10 días'),(67,34,17,'2 ml vía oral','7 días'),(68,34,18,'1 tableta cada 24 horas','5 días'),(69,35,19,'5 ml cada 8 horas','10 días'),(70,35,20,'1 tableta vía oral','7 días'),(71,36,21,'2 cápsulas vía oral','5 días'),(72,36,22,'1 tableta cada 12 horas','10 días'),(73,37,23,'5 ml vía oral','7 días'),(74,37,24,'1 cápsula cada 8 horas','5 días'),(75,38,25,'1 tableta cada 24 horas','10 días'),(76,38,26,'2 ml vía oral','7 días'),(77,39,27,'1 tableta cada 12 horas','5 días'),(78,39,28,'5 ml vía oral','10 días'),(79,40,29,'1 cápsula vía oral','7 días'),(80,40,30,'2 tabletas vía oral','5 días'),(81,41,31,'1 tableta cada 8 horas','10 días'),(82,41,32,'5 ml cada 12 horas','7 días'),(83,42,33,'1 cápsula vía oral','5 días'),(84,42,34,'1 tableta cada 12 horas','10 días'),(85,43,35,'2 ml vía oral','7 días'),(86,43,36,'1 tableta cada 24 horas','5 días'),(87,44,37,'5 ml cada 8 horas','10 días'),(88,44,38,'1 tableta vía oral','7 días'),(89,45,39,'2 cápsulas vía oral','5 días'),(90,45,40,'1 tableta cada 12 horas','10 días'),(91,46,41,'5 ml vía oral','7 días'),(92,46,42,'1 cápsula cada 8 horas','5 días'),(93,47,43,'1 tableta cada 24 horas','10 días'),(94,47,44,'2 ml vía oral','7 días'),(95,48,45,'1 tableta cada 12 horas','5 días'),(96,48,46,'5 ml vía oral','10 días'),(97,49,47,'1 cápsula vía oral','7 días'),(98,49,48,'2 tabletas vía oral','5 días'),(99,50,49,'1 tableta cada 8 horas','10 días'),(100,50,50,'5 ml cada 12 horas','7 días'),(151,1,1,'250 mg cada 12 horas','7 días'),(152,2,2,'100 mg cada 24 horas','5 días'),(153,3,3,'250 mg cada 8 horas','10 días'),(154,4,4,'50 mg cada 12 horas','5 días'),(155,5,5,'15 mg cada 24 horas','3 días'),(156,6,6,'100 mg cada 12 horas','7 días'),(157,7,7,'0.2 ml por kg','1 dosis única'),(158,8,8,'Aplicar tópicamente cada 7 días','2 aplicaciones'),(159,9,9,'5 mg cada 12 horas','3 días'),(160,10,10,'10 ml por vía oral','5 días'),(161,11,11,'75 mg cada 12 horas','7 días'),(162,12,12,'250 mg cada 8 horas','10 días'),(163,13,13,'50 mg cada 12 horas','5 días'),(164,14,14,'20 mg cada 24 horas','14 días'),(165,15,15,'10 ml por vía oral cada 12 horas','7 días'),(166,16,16,'2 cápsulas al día','30 días'),(167,17,17,'1 ml inyectable cada 7 días','2 dosis'),(168,18,18,'2 comprimidos al día','1 mes'),(169,19,19,'5 mg cada 24 horas','7 días'),(170,20,20,'10 mg cada 24 horas','10 días'),(171,21,21,'1 gota en cada ojo','7 días'),(172,22,22,'Aplicar crema 2 veces al día','14 días'),(173,23,23,'Aplicar crema 1 vez al día','7 días'),(174,24,24,'2 cápsulas al día','30 días'),(175,25,25,'100 mg cada 12 horas','5 días'),(176,26,26,'250 mg cada 12 horas','10 días'),(177,27,27,'100 mg cada 12 horas','7 días'),(178,28,28,'50 mg cada 12 horas','3 días'),(179,29,29,'50 mg cada 24 horas','5 días'),(180,30,30,'Aplicar 1 gota por oído','7 días'),(181,31,31,'100 mg cada 12 horas','10 días'),(182,32,32,'10 ml cada 24 horas','5 días'),(183,33,33,'Aplicar 1 dosis subcutánea','1 dosis'),(184,34,34,'5 ml cada 12 horas','7 días'),(185,35,35,'50 mg cada 24 horas','7 días'),(186,36,36,'10 ml por vía oral','10 días'),(187,37,37,'Aplicar tópicamente 2 veces al día','7 días'),(188,38,38,'250 mg cada 12 horas','7 días'),(189,39,39,'10 mg cada 24 horas','5 días'),(190,40,40,'1 cápsula cada 12 horas','7 días'),(191,41,41,'100 mg cada 12 horas','7 días'),(192,42,42,'5 ml cada 24 horas','5 días'),(193,43,43,'Aplicar crema 2 veces al día','10 días'),(194,44,44,'1 gota por ojo','7 días'),(195,45,45,'250 mg cada 12 horas','7 días'),(196,46,46,'2 cápsulas al día','10 días'),(197,47,47,'50 mg cada 12 horas','7 días'),(198,48,48,'Aplicar 1 dosis subcutánea','1 dosis'),(199,49,49,'10 ml cada 24 horas','5 días'),(200,50,50,'5 ml cada 12 horas','7 días');
/*!40000 ALTER TABLE `prescription_medications` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `ai_prescription_medications_audit` AFTER INSERT ON `prescription_medications` FOR EACH ROW BEGIN
  SET @from_presc_med_trigger = 1;
  INSERT INTO prescription_medications_audit (prescription_medication_id, actionPrescriptionMed, before_data, after_data)
  VALUES (
    NEW.id,
    'INSERT',
    NULL,
    JSON_OBJECT('id', NEW.id, 'prescription_id', NEW.prescription_id, 'medication_id', NEW.medication_id, 'dosage', NEW.dosage, 'duration', NEW.duration)
  );
  SET @from_presc_med_trigger = NULL;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `au_prescription_medications_audit` AFTER UPDATE ON `prescription_medications` FOR EACH ROW BEGIN
  SET @from_presc_med_trigger = 1;
  INSERT INTO prescription_medications_audit (prescription_medication_id, actionPrescriptionMed, before_data, after_data)
  VALUES (
    NEW.id,
    'UPDATE',
    JSON_OBJECT('id', OLD.id, 'prescription_id', OLD.prescription_id, 'medication_id', OLD.medication_id, 'dosage', OLD.dosage, 'duration', OLD.duration),
    JSON_OBJECT('id', NEW.id, 'prescription_id', NEW.prescription_id, 'medication_id', NEW.medication_id, 'dosage', NEW.dosage, 'duration', NEW.duration)
  );
  SET @from_presc_med_trigger = NULL;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `ad_prescription_medications_audit` AFTER DELETE ON `prescription_medications` FOR EACH ROW BEGIN
  SET @from_presc_med_trigger = 1;
  INSERT INTO prescription_medications_audit (prescription_medication_id, actionPrescriptionMed, before_data, after_data)
  VALUES (
    OLD.id,
    'DELETE',
    JSON_OBJECT('id', OLD.id, 'prescription_id', OLD.prescription_id, 'medication_id', OLD.medication_id, 'dosage', OLD.dosage, 'duration', OLD.duration),
    NULL
  );
  SET @from_presc_med_trigger = NULL;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `prescription_medications_audit`
--

DROP TABLE IF EXISTS `prescription_medications_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescription_medications_audit` (
  `id` int NOT NULL AUTO_INCREMENT,
  `prescription_medication_id` int NOT NULL,
  `actionPrescriptionMed` enum('INSERT','UPDATE','DELETE') NOT NULL,
  `changed_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `before_data` json DEFAULT NULL,
  `after_data` json DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescription_medications_audit`
--

LOCK TABLES `prescription_medications_audit` WRITE;
/*!40000 ALTER TABLE `prescription_medications_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `prescription_medications_audit` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `bii_prescription_medications_audit_guard_insert` BEFORE INSERT ON `prescription_medications_audit` FOR EACH ROW BEGIN
  IF COALESCE(@from_presc_med_trigger, 0) <> 1 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'INSERT solo permitido desde triggers de prescription_medications.';
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `biu_prescription_medications_audit_block_update` BEFORE UPDATE ON `prescription_medications_audit` FOR EACH ROW BEGIN
  SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'prescription_medications_audit es inmutable: UPDATE prohibido.';
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `bid_prescription_medications_audit_block_delete` BEFORE DELETE ON `prescription_medications_audit` FOR EACH ROW BEGIN
  SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'prescription_medications_audit es inmutable: DELETE prohibido.';
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `prescriptions`
--

DROP TABLE IF EXISTS `prescriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescriptions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `appointment_id` int NOT NULL,
  `notes` text,
  PRIMARY KEY (`id`),
  KEY `fk_prescriptions_appointment` (`appointment_id`),
  CONSTRAINT `fk_prescriptions_appointment` FOREIGN KEY (`appointment_id`) REFERENCES `appointments` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescriptions`
--

LOCK TABLES `prescriptions` WRITE;
/*!40000 ALTER TABLE `prescriptions` DISABLE KEYS */;
INSERT INTO `prescriptions` VALUES (1,41,'Administrar 5 ml de antibiótico vía oral cada 12 horas durante 7 días. Control en 1 semana.'),(2,42,'Aplicar gotas oftálmicas dos veces al día. Evitar que el gato se rasque los ojos.'),(3,43,'Dar 1 comprimido de antiparasitario cada 24 horas por 5 días.'),(4,44,'Continuar con dieta hipoalergénica. Revisar peso en 2 semanas.'),(5,45,'Aplicar crema dermatológica en las lesiones cada 8 horas. Evitar el contacto con otros animales.'),(6,46,'Administrar vacuna antirrábica. Observar por 30 minutos en clínica.'),(7,47,'Dar 2 ml de suplemento vitamínico por vía oral cada 24 horas durante 10 días.'),(8,48,'Aplicar desparasitante interno una vez. Control en 1 mes.'),(9,49,'Administrar antiinflamatorio según peso. Evitar ejercicio intenso durante 5 días.'),(10,50,'Mantener dieta blanda y agua fresca. Control de temperatura diario.'),(11,51,'Aplicar ungüento en heridas 3 veces al día hasta cicatrización.'),(12,52,'Dar 1 tableta de sedante 30 minutos antes de procedimiento.'),(13,53,'Administrar 3 ml de antibiótico inyectable cada 24 horas por 3 días.'),(14,54,'Mantener reposo y evitar saltos. Aplicar compresas tibias 2 veces al día.'),(15,55,'Control de glucosa diario. Ajustar dieta según resultados.'),(16,56,'Aplicar gotas nasales 2 veces al día durante 7 días.'),(17,57,'Dar suplemento hepático 1 vez al día durante 14 días.'),(18,58,'Administrar antiparasitario externo cada 30 días.'),(19,59,'Aplicar crema antibiótica en orejas cada 12 horas. Evitar rascado.'),(20,60,'Vacuna múltiple aplicada. Observación 30 minutos.'),(21,61,'Administrar 5 ml de jarabe expectorante cada 12 horas por 5 días.'),(22,62,'Evitar contacto con otros perros. Mantener hidratación.'),(23,63,'Aplicar pomada ocular 3 veces al día hasta mejoría.'),(24,64,'Administrar 1 tableta de analgesico cada 24 horas según peso.'),(25,65,'Control de dieta. Evitar alimentos con grasa durante 2 semanas.'),(26,66,'Aplicar loción calmante en piel 2 veces al día.'),(27,67,'Dar 2 ml de suplemento mineral por vía oral cada 12 horas.'),(28,68,'Administrar antibiótico inyectable 2 veces al día durante 5 días.'),(29,69,'Mantener reposo absoluto durante 3 días.'),(30,70,'Dar 1 cápsula de antiparasitario semanal durante 4 semanas.'),(31,71,'Aplicar gotas óticas 2 veces al día hasta limpieza completa.'),(32,72,'Vacuna contra parvovirus aplicada. Control en 1 mes.'),(33,73,'Administrar 3 ml de jarabe antiinflamatorio cada 12 horas por 7 días.'),(34,74,'Aplicar ungüento en piel afectada 3 veces al día.'),(35,75,'Mantener dieta baja en sodio y control de peso.'),(36,76,'Administrar antibiótico oral cada 24 horas por 10 días.'),(37,77,'Control de heridas. Aplicar vendaje limpio cada 24 horas.'),(38,78,'Dar suplemento digestivo por vía oral cada 12 horas durante 7 días.'),(39,79,'Evitar ejercicio intenso y control de temperatura diaria.'),(40,80,'Aplicar gotas oftálmicas 3 veces al día.'),(41,81,'Administrar antiparasitario externo mensual.'),(42,82,'Vacuna antirrábica aplicada. Observación 30 minutos.'),(43,83,'Dar 2 ml de antiinflamatorio oral cada 24 horas por 5 días.'),(44,84,'Aplicar crema hidratante en piel 2 veces al día.'),(45,85,'Mantener dieta especial y control de glucosa diaria.'),(46,86,'Administrar antibiótico inyectable 1 vez al día por 5 días.'),(47,87,'Control de heridas quirúrgicas. Cambiar vendaje cada 24 horas.'),(48,88,'Dar suplemento vitamínico por vía oral durante 14 días.'),(49,89,'Evitar contacto con otros animales. Mantener hidratación.'),(50,90,'Aplicar gotas nasales 2 veces al día por 7 días.'),(51,91,'Vacuna múltiple aplicada. Control en 1 mes.'),(52,92,'Administrar 1 tableta de sedante 30 minutos antes de procedimiento.'),(53,93,'Aplicar crema antibiótica en orejas cada 12 horas.'),(54,94,'Dar 2 ml de jarabe expectorante cada 12 horas por 5 días.'),(55,95,'Mantener dieta blanda y agua fresca. Control diario.'),(56,96,'Aplicar ungüento en heridas 3 veces al día.'),(57,97,'Administrar antiinflamatorio según peso durante 5 días.'),(58,98,'Vacuna contra leptospirosis aplicada. Observar 30 minutos.'),(59,99,'Dar 1 tableta de antiparasitario cada 24 horas por 5 días.'),(60,100,'Control de glucosa diario y dieta especial durante 2 semanas.'),(61,101,'Administrar 3 ml de antibiótico oral cada 12 horas durante 7 días.'),(62,102,'Aplicar gotas oftálmicas 2 veces al día. Mantener higiene ocular.'),(63,103,'Dar 1 comprimido de antiparasitario cada 24 horas por 5 días.'),(64,104,'Continuar con dieta hipoalergénica y control de peso semanal.'),(65,105,'Aplicar crema dermatológica en las lesiones cada 8 horas. Evitar rascado.'),(66,106,'Vacuna antirrábica aplicada. Observar por 30 minutos.'),(67,107,'Administrar suplemento vitamínico 2 ml vía oral cada 24 horas durante 10 días.'),(68,108,'Aplicar desparasitante interno una vez. Control en 1 mes.'),(69,109,'Administrar antiinflamatorio según peso durante 5 días. Evitar ejercicio intenso.'),(70,110,'Mantener dieta blanda y agua fresca. Control diario de temperatura.'),(71,111,'Aplicar ungüento en heridas 3 veces al día hasta cicatrización.'),(72,112,'Dar 1 tableta de sedante 30 minutos antes del procedimiento.'),(73,113,'Administrar 3 ml de antibiótico inyectable cada 24 horas por 3 días.'),(74,114,'Mantener reposo y aplicar compresas tibias 2 veces al día.'),(75,115,'Control de glucosa diario y ajustar dieta según resultados.'),(76,116,'Aplicar gotas nasales 2 veces al día durante 7 días.'),(77,117,'Administrar suplemento hepático 1 vez al día durante 14 días.'),(78,118,'Aplicar antiparasitario externo cada 30 días.'),(79,119,'Aplicar crema antibiótica en orejas cada 12 horas. Evitar rascado.'),(80,120,'Vacuna múltiple aplicada. Observación de 30 minutos.'),(81,121,'Administrar jarabe expectorante 5 ml cada 12 horas por 5 días.'),(82,122,'Evitar contacto con otros perros. Mantener hidratación.'),(83,123,'Aplicar pomada ocular 3 veces al día hasta mejoría.'),(84,124,'Administrar tableta de analgésico según peso cada 24 horas.'),(85,125,'Control de dieta, evitar alimentos con grasa durante 2 semanas.'),(86,126,'Aplicar loción calmante en piel 2 veces al día.'),(87,127,'Dar 2 ml de suplemento mineral por vía oral cada 12 horas.'),(88,128,'Administrar antibiótico inyectable 2 veces al día durante 5 días.'),(89,129,'Mantener reposo absoluto durante 3 días.'),(90,130,'Dar 1 cápsula de antiparasitario semanal durante 4 semanas.'),(91,131,'Aplicar gotas óticas 2 veces al día hasta limpieza completa.'),(92,132,'Vacuna contra parvovirus aplicada. Control en 1 mes.'),(93,133,'Administrar jarabe antiinflamatorio 3 ml cada 12 horas por 7 días.'),(94,134,'Aplicar ungüento en piel afectada 3 veces al día.'),(95,135,'Mantener dieta baja en sodio y control de peso.'),(96,136,'Administrar antibiótico oral cada 24 horas por 10 días.'),(97,137,'Control de heridas. Cambiar vendaje cada 24 horas.'),(98,138,'Dar suplemento digestivo por vía oral cada 12 horas durante 7 días.'),(99,139,'Evitar ejercicio intenso y controlar temperatura diaria.'),(100,140,'Aplicar gotas oftálmicas 3 veces al día hasta recuperación.');
/*!40000 ALTER TABLE `prescriptions` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `ai_prescriptions_audit` AFTER INSERT ON `prescriptions` FOR EACH ROW BEGIN
  SET @from_prescriptions_trigger = 1;
  INSERT INTO prescriptions_audit (prescription_id, actionPrescription, before_data, after_data)
  VALUES (
    NEW.id,
    'INSERT',
    NULL,
    JSON_OBJECT('id', NEW.id, 'appointment_id', NEW.appointment_id, 'notes', NEW.notes)
  );
  SET @from_prescriptions_trigger = NULL;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `au_prescriptions_audit` AFTER UPDATE ON `prescriptions` FOR EACH ROW BEGIN
  SET @from_prescriptions_trigger = 1;
  INSERT INTO prescriptions_audit (prescription_id, actionPrescription, before_data, after_data)
  VALUES (
    NEW.id,
    'UPDATE',
    JSON_OBJECT('id', OLD.id, 'appointment_id', OLD.appointment_id, 'notes', OLD.notes),
    JSON_OBJECT('id', NEW.id, 'appointment_id', NEW.appointment_id, 'notes', NEW.notes)
  );
  SET @from_prescriptions_trigger = NULL;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `ad_prescriptions_audit` AFTER DELETE ON `prescriptions` FOR EACH ROW BEGIN
  SET @from_prescriptions_trigger = 1;
  INSERT INTO prescriptions_audit (prescription_id, actionPrescription, before_data, after_data)
  VALUES (
    OLD.id,
    'DELETE',
    JSON_OBJECT('id', OLD.id, 'appointment_id', OLD.appointment_id, 'notes', OLD.notes),
    NULL
  );
  SET @from_prescriptions_trigger = NULL;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `prescriptions_audit`
--

DROP TABLE IF EXISTS `prescriptions_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescriptions_audit` (
  `id` int NOT NULL AUTO_INCREMENT,
  `prescription_id` int NOT NULL,
  `actionPrescription` enum('INSERT','UPDATE','DELETE') NOT NULL,
  `changed_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `before_data` json DEFAULT NULL,
  `after_data` json DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescriptions_audit`
--

LOCK TABLES `prescriptions_audit` WRITE;
/*!40000 ALTER TABLE `prescriptions_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `prescriptions_audit` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `bii_prescriptions_audit_guard_insert` BEFORE INSERT ON `prescriptions_audit` FOR EACH ROW BEGIN
  IF COALESCE(@from_prescriptions_trigger, 0) <> 1 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'INSERT solo permitido desde triggers de prescriptions.';
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `biu_prescriptions_audit_block_update` BEFORE UPDATE ON `prescriptions_audit` FOR EACH ROW BEGIN
  SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'prescriptions_audit es inmutable: UPDATE prohibido.';
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `bid_prescriptions_audit_block_delete` BEFORE DELETE ON `prescriptions_audit` FOR EACH ROW BEGIN
  SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'prescriptions_audit es inmutable: DELETE prohibido.';
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `procedures`
--

DROP TABLE IF EXISTS `procedures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `procedures` (
  `id` int NOT NULL AUTO_INCREMENT,
  `appointment_id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text,
  `cost` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_procedures_appointment` (`appointment_id`),
  CONSTRAINT `fk_procedures_appointment` FOREIGN KEY (`appointment_id`) REFERENCES `appointments` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `procedures`
--

LOCK TABLES `procedures` WRITE;
/*!40000 ALTER TABLE `procedures` DISABLE KEYS */;
INSERT INTO `procedures` VALUES (1,41,'Consulta general','Revisión clínica completa del paciente',70000.00),(2,42,'Vacunación antirrábica','Aplicación de vacuna contra la rabia',45000.00),(3,43,'Limpieza dental','Procedimiento de profilaxis dental para prevenir sarro',80000.00),(4,44,'Desparasitación','Tratamiento antiparasitario oral',60000.00),(5,45,'Esterilización','Cirugía de esterilización de mascota',250000.00),(6,46,'Examen de sangre','Análisis hematológico completo',90000.00),(7,47,'Consulta dermatológica','Evaluación de problemas en piel y pelaje',75000.00),(8,48,'Vacunación séxtuple','Aplicación de vacuna polivalente',95000.00),(9,49,'Cirugía de emergencia','Atención quirúrgica inmediata por accidente',350000.00),(10,50,'Consulta oftalmológica','Revisión de ojos y visión',70000.00),(11,51,'Control postoperatorio','Revisión tras cirugía realizada',50000.00),(12,52,'Examen de orina','Análisis urinario completo',85000.00),(13,53,'Consulta nutricional','Asesoría en dieta y alimentación',65000.00),(14,54,'Castración felina','Cirugía de castración en gatos',220000.00),(15,55,'Limpieza de oído','Limpieza profunda de canal auditivo',55000.00),(16,56,'Vacuna contra moquillo','Aplicación de vacuna para prevenir moquillo canino',50000.00),(17,57,'Ecografía abdominal','Examen de diagnóstico por ultrasonido',180000.00),(18,58,'Radiografía','Imagen diagnóstica por rayos X',160000.00),(19,59,'Consulta cardiológica','Evaluación de corazón y sistema circulatorio',120000.00),(20,60,'Análisis coproparasitario','Estudio de heces para detectar parásitos',65000.00),(21,61,'Vacunación contra parvovirus','Aplicación de vacuna contra parvovirosis',50000.00),(22,62,'Cirugía ortopédica','Corrección de fracturas y lesiones óseas',400000.00),(23,63,'Consulta neurológica','Evaluación de sistema nervioso',130000.00),(24,64,'Tratamiento antipulgas','Aplicación de pipeta antipulgas',60000.00),(25,65,'Control de peso','Seguimiento del peso y condición corporal',50000.00),(26,66,'Vacunación leptospirosis','Aplicación de vacuna contra leptospira',48000.00),(27,67,'Cirugía oftálmica','Corrección de problemas en párpados',280000.00),(28,68,'Consulta geriátrica','Atención especializada en mascotas senior',90000.00),(29,69,'Examen de glucosa','Medición de niveles de glucosa en sangre',75000.00),(30,70,'Limpieza profunda dental','Detartraje y pulido dental completo',95000.00),(31,71,'Aplicación suero','Hidratación intravenosa',70000.00),(32,72,'Examen fecal','Estudio de materia fecal para parásitos',60000.00),(33,73,'Vacunación coronavirus canino','Aplicación de vacuna contra coronavirus canino',52000.00),(34,74,'Control postvacunal','Revisión de efectos tras vacuna',45000.00),(35,75,'Consulta de comportamiento','Evaluación conductual y asesoría',85000.00),(36,76,'Cirugía de tejidos blandos','Extracción de masas o tumores superficiales',320000.00),(37,77,'Examen hepático','Pruebas de funcionamiento del hígado',110000.00),(38,78,'Consulta reproductiva','Asesoría en reproducción y fertilidad',95000.00),(39,79,'Aplicación de antibióticos','Tratamiento inyectado de antibióticos',60000.00),(40,80,'Vacunación triple felina','Aplicación de vacuna contra panleucopenia, calicivirus y rinotraqueitis',88000.00),(41,81,'Consulta respiratoria','Evaluación de sistema respiratorio',80000.00),(42,82,'Radiografía torácica','Imagen diagnóstica de tórax',170000.00),(43,83,'Cirugía de hernia','Corrección quirúrgica de hernia abdominal',300000.00),(44,84,'Examen renal','Pruebas de función renal',115000.00),(45,85,'Consulta traumatológica','Atención de lesiones músculo-esqueléticas',100000.00),(46,86,'Limpieza quirúrgica','Aseo de herida bajo anestesia',120000.00),(47,87,'Aplicación analgésico','Tratamiento de dolor con inyección',55000.00),(48,88,'Consulta de control','Chequeo rutinario de salud',65000.00),(49,89,'Ecocardiograma','Examen ecográfico del corazón',200000.00),(50,90,'Vacuna contra hepatitis','Aplicación de vacuna contra hepatitis canina',55000.00),(51,91,'Consulta de urgencias','Atención inmediata por accidente o síntoma grave',150000.00),(52,92,'Cirugía abdominal','Cirugía exploratoria o correctiva abdominal',380000.00),(53,93,'Consulta de piel','Revisión de alergias y dermatitis',75000.00),(54,94,'Aplicación antiparasitario inyectable','Tratamiento contra parásitos internos',70000.00),(55,95,'Examen oftálmico','Prueba de visión y estructuras oculares',95000.00),(56,96,'Vacunación polivalente felina','Aplicación de vacuna múltiple para gatos',87000.00),(57,97,'Consulta pediátrica','Atención de cachorros o gatitos',70000.00),(58,98,'Control nutricional','Seguimiento de dieta balanceada',65000.00),(59,99,'Tratamiento de heridas','Curación y vendaje de heridas',80000.00),(60,100,'Electrocardiograma','Estudio eléctrico del corazón',140000.00),(61,101,'Consulta preventiva','Revisión rutinaria para detectar problemas tempranos',65000.00),(62,102,'Examen de tiroides','Prueba hormonal para tiroides',125000.00),(63,103,'Vacuna contra tos de perreras','Aplicación de vacuna contra Bordetella',58000.00),(64,104,'Cirugía dental','Extracción de pieza dental dañada',200000.00),(65,105,'Consulta digestiva','Evaluación de sistema gastrointestinal',90000.00),(66,106,'Aplicación de vitaminas','Inyección de complejo vitamínico',50000.00),(67,107,'Examen bacteriológico','Cultivo de muestras para identificar bacterias',130000.00),(68,108,'Consulta endocrina','Evaluación de hormonas y metabolismo',110000.00),(69,109,'Vacunación anual combinada','Aplicación de esquema anual completo',95000.00),(70,110,'Consulta posvacunación','Revisión de reacciones adversas',48000.00),(71,111,'Cirugía de cesárea','Parto asistido por cesárea',400000.00),(72,112,'Control posparto','Revisión de madre y crías',65000.00),(73,113,'Consulta por vómito','Atención por vómito recurrente',70000.00),(74,114,'Tratamiento intravenoso','Aplicación de fluidoterapia IV',120000.00),(75,115,'Ecografía reproductiva','Examen de diagnóstico en gestación',150000.00),(76,116,'Vacunación contra giardia','Aplicación de vacuna para giardiasis',60000.00),(77,117,'Examen de heces','Prueba coproparasitaria detallada',70000.00),(78,118,'Consulta por diarrea','Atención de cuadro de diarrea aguda',70000.00),(79,119,'Aplicación de calmante','Medicamento para disminuir ansiedad',65000.00),(80,120,'Cirugía exploratoria','Procedimiento quirúrgico para diagnóstico',350000.00),(81,121,'Consulta poscirugía','Revisión de evolución tras operación',60000.00),(82,122,'Tratamiento tópico dermatológico','Aplicación de cremas o pomadas',55000.00),(83,123,'Examen serológico','Pruebas de anticuerpos en sangre',140000.00),(84,124,'Consulta neuromuscular','Evaluación de movilidad y fuerza muscular',120000.00),(85,125,'Vacuna contra leptospirosis','Aplicación de vacuna preventiva',50000.00),(86,126,'Limpieza de heridas','Curación y sutura menor',95000.00),(87,127,'Consulta por tos','Atención por síntomas respiratorios',65000.00),(88,128,'Examen bioquímico','Análisis de enzimas y electrolitos',135000.00),(89,129,'Cirugía menor','Extracción de pequeño quiste o masa',220000.00),(90,130,'Aplicación antipulgas','Tratamiento preventivo contra pulgas',55000.00),(91,131,'Consulta de control anual','Chequeo médico completo anual',70000.00),(92,132,'Ecografía torácica','Examen por ultrasonido de tórax',180000.00),(93,133,'Examen endocrino','Pruebas de hormonas específicas',140000.00),(94,134,'Consulta por cojera','Atención por alteración de la marcha',80000.00),(95,135,'Tratamiento con antibiótico oral','Administración de antibióticos vía oral',60000.00),(96,136,'Vacunación refuerzo','Aplicación de refuerzo anual',52000.00),(97,137,'Examen citológico','Análisis de células en muestras',125000.00),(98,138,'Consulta alérgica','Evaluación de alergias estacionales',75000.00),(99,139,'Aplicación de antiinflamatorio','Medicamento para reducir inflamación',60000.00),(100,140,'Consulta preventiva geriátrica','Revisión integral para mascotas mayores',90000.00);
/*!40000 ALTER TABLE `procedures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vaccine_applications`
--

DROP TABLE IF EXISTS `vaccine_applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vaccine_applications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `appointment_id` int NOT NULL,
  `vaccine_id` int NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_vaccineapplications_appointment` (`appointment_id`),
  KEY `fk_vaccineapplications_vaccine` (`vaccine_id`),
  CONSTRAINT `fk_vaccineapplications_appointment` FOREIGN KEY (`appointment_id`) REFERENCES `appointments` (`id`),
  CONSTRAINT `fk_vaccineapplications_vaccine` FOREIGN KEY (`vaccine_id`) REFERENCES `vaccines` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vaccine_applications`
--

LOCK TABLES `vaccine_applications` WRITE;
/*!40000 ALTER TABLE `vaccine_applications` DISABLE KEYS */;
INSERT INTO `vaccine_applications` VALUES (1,41,1,'2025-01-05'),(2,42,2,'2025-01-06'),(3,43,3,'2025-01-06'),(4,44,4,'2025-01-07'),(5,45,5,'2025-01-07'),(6,46,6,'2025-01-08'),(7,47,7,'2025-01-08'),(8,48,8,'2025-01-09'),(9,49,9,'2025-01-09'),(10,50,10,'2025-01-10'),(11,51,11,'2025-01-10'),(12,52,12,'2025-01-11'),(13,53,13,'2025-01-11'),(14,54,14,'2025-01-12'),(15,55,15,'2025-01-12'),(16,56,16,'2025-01-13'),(17,57,17,'2025-01-13'),(18,58,18,'2025-01-14'),(19,59,19,'2025-01-14'),(20,60,20,'2025-01-15'),(21,61,21,'2025-01-15'),(22,62,22,'2025-01-16'),(23,63,23,'2025-01-16'),(24,64,24,'2025-01-17'),(25,65,25,'2025-01-17'),(26,66,26,'2025-01-18'),(27,67,27,'2025-01-18'),(28,68,28,'2025-01-19'),(29,69,29,'2025-01-19'),(30,70,30,'2025-01-20'),(31,71,31,'2025-01-20'),(32,72,32,'2025-01-21'),(33,73,33,'2025-01-21'),(34,74,34,'2025-01-22'),(35,75,35,'2025-01-22'),(36,76,36,'2025-01-23'),(37,77,37,'2025-01-23'),(38,78,38,'2025-01-24'),(39,79,39,'2025-01-24'),(40,80,40,'2025-01-25'),(41,81,41,'2025-01-25'),(42,82,42,'2025-01-26'),(43,83,43,'2025-01-26'),(44,84,44,'2025-01-27'),(45,85,45,'2025-01-27'),(46,86,46,'2025-01-28'),(47,87,47,'2025-01-28'),(48,88,48,'2025-01-29'),(49,89,49,'2025-01-29'),(50,90,50,'2025-01-30'),(51,91,51,'2025-01-30'),(52,92,52,'2025-01-31'),(53,93,53,'2025-01-31'),(54,94,54,'2025-02-01'),(55,95,55,'2025-02-01'),(56,96,56,'2025-02-02'),(57,97,57,'2025-02-02'),(58,98,58,'2025-02-03'),(59,99,59,'2025-02-03'),(60,100,60,'2025-02-04'),(61,101,61,'2025-02-04'),(62,102,62,'2025-02-05'),(63,103,63,'2025-02-05'),(64,104,64,'2025-02-06'),(65,105,65,'2025-02-06'),(66,106,66,'2025-02-07'),(67,107,67,'2025-02-07'),(68,108,68,'2025-02-08'),(69,109,69,'2025-02-08'),(70,110,70,'2025-02-09'),(71,111,71,'2025-02-09'),(72,112,72,'2025-02-10'),(73,113,73,'2025-02-10'),(74,114,74,'2025-02-11'),(75,115,75,'2025-02-11'),(76,116,76,'2025-02-12'),(77,117,77,'2025-02-12'),(78,118,78,'2025-02-13'),(79,119,79,'2025-02-13'),(80,120,80,'2025-02-14'),(81,121,81,'2025-02-14'),(82,122,82,'2025-02-15'),(83,123,83,'2025-02-15'),(84,124,84,'2025-02-16'),(85,125,85,'2025-02-16'),(86,126,86,'2025-02-17'),(87,127,87,'2025-02-17'),(88,128,88,'2025-02-18'),(89,129,89,'2025-02-18'),(90,130,90,'2025-02-19'),(91,131,91,'2025-02-19'),(92,132,92,'2025-02-20'),(93,133,93,'2025-02-20'),(94,134,94,'2025-02-21'),(95,135,95,'2025-02-21'),(96,136,96,'2025-02-22'),(97,137,97,'2025-02-22'),(98,138,98,'2025-02-23'),(99,139,99,'2025-02-23'),(100,140,100,'2025-02-24');
/*!40000 ALTER TABLE `vaccine_applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vaccines`
--

DROP TABLE IF EXISTS `vaccines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vaccines` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vaccines`
--

LOCK TABLES `vaccines` WRITE;
/*!40000 ALTER TABLE `vaccines` DISABLE KEYS */;
INSERT INTO `vaccines` VALUES (1,'Vacuna antirrábica','Prevención de la rabia en perros y gatos.'),(2,'Vacuna múltiple canina','Protege contra parvovirus, moquillo, hepatitis y leptospirosis.'),(3,'Vacuna múltiple felina','Protege contra panleucopenia, calicivirus y rinotraqueítis.'),(4,'Vacuna contra parvovirus','Prevención de parvovirus canino.'),(5,'Vacuna contra moquillo','Prevención de moquillo canino.'),(6,'Vacuna contra hepatitis','Prevención de hepatitis canina.'),(7,'Vacuna contra leptospirosis','Prevención de leptospirosis en perros.'),(8,'Vacuna contra rinotraqueítis','Prevención de rinotraqueítis felina.'),(9,'Vacuna contra calicivirus','Prevención de calicivirus felino.'),(10,'Vacuna contra leucemia felina','Prevención de leucemia en gatos.'),(11,'Vacuna contra tos de las perreras','Prevención de traqueobronquitis infecciosa canina.'),(12,'Vacuna contra giardiasis','Prevención de giardiasis en perros y gatos.'),(13,'Vacuna contra coronavirus canino','Prevención de coronavirus intestinal canino.'),(14,'Vacuna contra enfermedad de Lyme','Prevención de enfermedad de Lyme transmitida por garrapatas.'),(15,'Vacuna contra tos felina','Prevención de traqueobronquitis felina.'),(16,'Vacuna contra leptospirosis tipo 2','Prevención específica contra leptospirosis serovariedad 2.'),(17,'Vacuna contra rabia felina','Prevención de la rabia en gatos.'),(18,'Vacuna contra clostridiosis','Prevención de clostridiosis en animales de granja y mascotas.'),(19,'Vacuna contra parainfluenza','Prevención de parainfluenza canina.'),(20,'Vacuna contra coronavirus felino','Prevención de coronavirus intestinal en gatos.'),(21,'Vacuna antitetánica','Prevención de tétanos en animales susceptibles.'),(22,'Vacuna contra fiebre aftosa','Prevención de fiebre aftosa en animales de granja.'),(23,'Vacuna contra brucelosis','Prevención de brucelosis en animales.'),(24,'Vacuna contra moquillo felino','Prevención de moquillo felino.'),(25,'Vacuna contra panleucopenia','Prevención de panleucopenia felina.'),(26,'Vacuna contra ehrlichiosis','Prevención de ehrlichiosis transmitida por garrapatas.'),(27,'Vacuna contra toxoplasmosis','Prevención de toxoplasmosis felina.'),(28,'Vacuna contra distemper felino','Prevención de distemper en gatos.'),(29,'Vacuna contra adenovirus','Prevención de adenovirus canino.'),(30,'Vacuna contra parvovirus felino','Prevención de parvovirus en gatos.'),(31,'Vacuna contra influenza canina','Prevención de influenza canina.'),(32,'Vacuna contra coronavirus bovino','Prevención de coronavirus en bovinos.'),(33,'Vacuna contra rabia bovina','Prevención de rabia en bovinos.'),(34,'Vacuna contra paratuberculosis','Prevención de enfermedad de Johne.'),(35,'Vacuna contra leptospirosis bovina','Prevención de leptospirosis en bovinos.'),(36,'Vacuna contra fiebre aftosa tipo O','Prevención de fiebre aftosa serotipo O.'),(37,'Vacuna contra fiebre aftosa tipo A','Prevención de fiebre aftosa serotipo A.'),(38,'Vacuna contra leucemia bovina','Prevención de leucemia en bovinos.'),(39,'Vacuna contra parainfluenza bovina','Prevención de parainfluenza en bovinos.'),(40,'Vacuna contra brucelosis bovina','Prevención de brucelosis en bovinos.'),(41,'Vacuna contra rabia ovina','Prevención de rabia en ovejas.'),(42,'Vacuna contra clostridiosis ovina','Prevención de clostridiosis en ovejas.'),(43,'Vacuna contra fiebre aftosa ovina','Prevención de fiebre aftosa en ovejas.'),(44,'Vacuna contra influenza felina','Prevención de influenza en gatos.'),(45,'Vacuna antirrábica canina','Prevención de rabia en perros.'),(46,'Vacuna múltiple canina avanzada','Protege contra moquillo, parvovirus, hepatitis, leptospirosis y tos de las perreras.'),(47,'Vacuna múltiple felina avanzada','Protege contra panleucopenia, rinotraqueítis, calicivirus y leucemia.'),(48,'Vacuna de refuerzo rabia','Aplicar como refuerzo anual.'),(49,'Vacuna de refuerzo múltiple','Aplicar como refuerzo anual según protocolo.'),(50,'Vacuna contra micoplasma','Prevención de infecciones respiratorias por micoplasma.'),(51,'Vacuna contra bordetella','Prevención de bordetella en perros.'),(52,'Vacuna contra parvovirus tipo 2','Prevención de parvovirus tipo 2 en perros.'),(53,'Vacuna contra adenovirus tipo 2','Prevención de adenovirus tipo 2 en perros.'),(54,'Vacuna contra toxoplasmosis bovina','Prevención de toxoplasmosis en bovinos.'),(55,'Vacuna contra brucelosis canina','Prevención de brucelosis en perros.'),(56,'Vacuna contra fiebre aftosa tipo C','Prevención de fiebre aftosa serotipo C.'),(57,'Vacuna contra moquillo tipo 2','Prevención de moquillo tipo 2 en perros.'),(58,'Vacuna antirrábica felina avanzada','Prevención de rabia en gatos con mayor duración.'),(59,'Vacuna antirrábica canina avanzada','Prevención de rabia en perros con mayor duración.'),(60,'Vacuna múltiple felina refuerzo','Refuerzo anual de vacuna múltiple felina.'),(61,'Vacuna múltiple canina refuerzo','Refuerzo anual de vacuna múltiple canina.'),(62,'Vacuna contra panleucopenia refuerzo','Refuerzo anual de panleucopenia.'),(63,'Vacuna contra parvovirus refuerzo','Refuerzo anual de parvovirus canino.'),(64,'Vacuna contra moquillo refuerzo','Refuerzo anual de moquillo canino.'),(65,'Vacuna contra leucemia felina refuerzo','Refuerzo anual de leucemia felina.'),(66,'Vacuna contra rinotraqueítis refuerzo','Refuerzo anual de rinotraqueítis felina.'),(67,'Vacuna contra calicivirus refuerzo','Refuerzo anual de calicivirus felino.'),(68,'Vacuna contra tos de las perreras refuerzo','Refuerzo anual de tos de las perreras.'),(69,'Vacuna contra leptospirosis refuerzo','Refuerzo anual de leptospirosis en perros.'),(70,'Vacuna contra influenza refuerzo','Refuerzo anual de influenza canina.'),(71,'Vacuna antirrábica refuerzo','Refuerzo anual de vacuna antirrábica.'),(72,'Vacuna múltiple avanzada refuerzo','Refuerzo anual de vacunas múltiples avanzadas.'),(73,'Vacuna contra giardiasis refuerzo','Refuerzo anual de prevención de giardiasis.'),(74,'Vacuna contra coronavirus refuerzo','Refuerzo anual de prevención de coronavirus.'),(75,'Vacuna contra enfermedad de Lyme refuerzo','Refuerzo anual de prevención de enfermedad de Lyme.'),(76,'Vacuna contra tos felina refuerzo','Refuerzo anual de tos felina.'),(77,'Vacuna contra leptospirosis tipo 2 refuerzo','Refuerzo anual específico contra leptospirosis serovariedad 2.'),(78,'Vacuna contra rabia felina refuerzo','Refuerzo anual de prevención de rabia en gatos.'),(79,'Vacuna contra clostridiosis refuerzo','Refuerzo anual de prevención de clostridiosis.'),(80,'Vacuna contra parainfluenza refuerzo','Refuerzo anual de prevención de parainfluenza canina.'),(81,'Vacuna contra coronavirus felino refuerzo','Refuerzo anual de prevención de coronavirus intestinal en gatos.'),(82,'Vacuna antitetánica refuerzo','Refuerzo anual de prevención de tétanos.'),(83,'Vacuna contra fiebre aftosa refuerzo','Refuerzo anual de prevención de fiebre aftosa.'),(84,'Vacuna contra brucelosis refuerzo','Refuerzo anual de prevención de brucelosis.'),(85,'Vacuna contra moquillo felino refuerzo','Refuerzo anual de moquillo felino.'),(86,'Vacuna contra panleucopenia refuerzo','Refuerzo anual de panleucopenia felina.'),(87,'Vacuna contra ehrlichiosis refuerzo','Refuerzo anual de ehrlichiosis transmitida por garrapatas.'),(88,'Vacuna contra toxoplasmosis refuerzo','Refuerzo anual de toxoplasmosis felina.'),(89,'Vacuna contra distemper felino refuerzo','Refuerzo anual de distemper en gatos.'),(90,'Vacuna contra adenovirus refuerzo','Refuerzo anual de adenovirus canino.'),(91,'Vacuna contra parvovirus felino refuerzo','Refuerzo anual de parvovirus en gatos.'),(92,'Vacuna contra influenza canina refuerzo','Refuerzo anual de influenza canina.'),(93,'Vacuna contra coronavirus bovino refuerzo','Refuerzo anual de coronavirus en bovinos.'),(94,'Vacuna contra rabia bovina refuerzo','Refuerzo anual de rabia en bovinos.'),(95,'Vacuna contra paratuberculosis refuerzo','Refuerzo anual de prevención de enfermedad de Johne.'),(96,'Vacuna contra leptospirosis bovina refuerzo','Refuerzo anual de leptospirosis en bovinos.'),(97,'Vacuna contra fiebre aftosa tipo O refuerzo','Refuerzo anual de fiebre aftosa serotipo O.'),(98,'Vacuna contra fiebre aftosa tipo A refuerzo','Refuerzo anual de fiebre aftosa serotipo A.'),(99,'Vacuna contra leucemia bovina refuerzo','Refuerzo anual de leucemia en bovinos.'),(100,'Vacuna contra parainfluenza bovina refuerzo','Refuerzo anual de parainfluenza en bovinos.'),(101,'Vacuna contra brucelosis bovina refuerzo','Refuerzo anual de brucelosis en bovinos.'),(102,'Vacuna contra rabia ovina refuerzo','Refuerzo anual de rabia en ovejas.'),(103,'Vacuna contra clostridiosis ovina refuerzo','Refuerzo anual de clostridiosis en ovejas.'),(104,'Vacuna contra fiebre aftosa ovina refuerzo','Refuerzo anual de fiebre aftosa en ovejas.'),(105,'Vacuna contra influenza felina refuerzo','Refuerzo anual de influenza en gatos.'),(106,'Vacuna antirrábica canina refuerzo','Refuerzo anual de rabia en perros.'),(107,'Vacuna múltiple canina avanzada refuerzo','Refuerzo anual de vacuna múltiple canina avanzada.'),(108,'Vacuna múltiple felina avanzada refuerzo','Refuerzo anual de vacuna múltiple felina avanzada.'),(109,'Vacuna de refuerzo rabia anual','Refuerzo anual de vacuna antirrábica.'),(110,'Vacuna de refuerzo múltiple anual','Refuerzo anual de vacuna múltiple según protocolo.'),(111,'Vacuna contra micoplasma refuerzo','Refuerzo anual de prevención de infecciones por micoplasma.'),(112,'Vacuna contra bordetella refuerzo','Refuerzo anual de prevención de bordetella en perros.'),(113,'Vacuna contra parvovirus tipo 2 refuerzo','Refuerzo anual de parvovirus tipo 2 en perros.'),(114,'Vacuna contra adenovirus tipo 2 refuerzo','Refuerzo anual de adenovirus tipo 2 en perros.'),(115,'Vacuna contra toxoplasmosis bovina refuerzo','Refuerzo anual de toxoplasmosis en bovinos.'),(116,'Vacuna contra brucelosis canina refuerzo','Refuerzo anual de brucelosis en perros.'),(117,'Vacuna contra fiebre aftosa tipo C refuerzo','Refuerzo anual de fiebre aftosa serotipo C.'),(118,'Vacuna contra moquillo tipo 2 refuerzo','Refuerzo anual de moquillo tipo 2 en perros.'),(119,'Vacuna antirrábica felina avanzada refuerzo','Refuerzo anual de rabia en gatos con mayor duración.'),(120,'Vacuna antirrábica canina avanzada refuerzo','Refuerzo anual de rabia en perros con mayor duración.'),(121,'Vacuna múltiple felina refuerzo anual','Refuerzo anual de vacuna múltiple felina.'),(122,'Vacuna múltiple canina refuerzo anual','Refuerzo anual de vacuna múltiple canina.'),(123,'Vacuna contra panleucopenia refuerzo anual','Refuerzo anual de panleucopenia felina.'),(124,'Vacuna contra parvovirus refuerzo anual','Refuerzo anual de parvovirus canino.'),(125,'Vacuna contra moquillo refuerzo anual','Refuerzo anual de moquillo canino.'),(126,'Vacuna contra leucemia felina refuerzo anual','Refuerzo anual de leucemia felina.'),(127,'Vacuna contra rinotraqueítis refuerzo anual','Refuerzo anual de rinotraqueítis felina.'),(128,'Vacuna contra calicivirus refuerzo anual','Refuerzo anual de calicivirus felino.'),(129,'Vacuna contra tos de las perreras refuerzo anual','Refuerzo anual de tos de las perreras.'),(130,'Vacuna contra leptospirosis refuerzo anual','Refuerzo anual de leptospirosis en perros.'),(131,'Vacuna contra influenza refuerzo anual','Refuerzo anual de influenza canina.'),(132,'Vacuna antirrábica refuerzo anual','Refuerzo anual de vacuna antirrábica.'),(133,'Vacuna múltiple avanzada refuerzo anual','Refuerzo anual de vacunas múltiples avanzadas.'),(134,'Vacuna contra giardiasis refuerzo anual','Refuerzo anual de prevención de giardiasis.');
/*!40000 ALTER TABLE `vaccines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veterinarians`
--

DROP TABLE IF EXISTS `veterinarians`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `veterinarians` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `specialty` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veterinarians`
--

LOCK TABLES `veterinarians` WRITE;
/*!40000 ALTER TABLE `veterinarians` DISABLE KEYS */;
INSERT INTO `veterinarians` VALUES (1,'Dr. Alejandro Gómez','Medicina General'),(2,'Dra. Mariana López','Cirugía'),(3,'Dr. Ricardo Fernández','Dermatología'),(4,'Dra. Carolina Méndez','Cardiología'),(5,'Dr. Juan Carlos Torres','Oftalmología'),(6,'Dra. Natalia Ríos','Neurología'),(7,'Dr. Andrés Martínez','Ortopedia'),(8,'Dra. Paola Herrera','Oncología'),(9,'Dr. Felipe Castro','Medicina Interna'),(10,'Dra. Juliana Vargas','Cirugía'),(11,'Dr. Javier Morales','Dermatología'),(12,'Dra. Claudia Navarro','Cardiología'),(13,'Dr. Esteban Romero','Medicina General'),(14,'Dra. Lorena Díaz','Odontología'),(15,'Dr. Camilo Suárez','Gastroenterología'),(16,'Dra. Gabriela León','Dermatología'),(17,'Dr. Daniel Ortega','Traumatología'),(18,'Dra. Marcela Gil','Cirugía'),(19,'Dr. Mauricio Peña','Medicina General'),(20,'Dra. Isabel Correa','Cardiología'),(21,'Dr. Santiago Pardo','Oncología'),(22,'Dra. Catalina Álvarez','Ortopedia'),(23,'Dr. José Ramírez','Dermatología'),(24,'Dra. Alejandra Pinto','Neurología'),(25,'Dr. Tomás Castillo','Medicina Interna'),(26,'Dra. Sofía Guzmán','Cirugía'),(27,'Dr. Iván Cárdenas','Odontología'),(28,'Dra. Liliana Soto','Oftalmología'),(29,'Dr. Sebastián Torres','Cardiología'),(30,'Dra. Mónica Rueda','Dermatología'),(31,'Dr. Óscar Montoya','Medicina General'),(32,'Dra. Verónica Lozano','Oncología'),(33,'Dr. Fernando Palacios','Traumatología'),(34,'Dra. Ángela Silva','Cirugía'),(35,'Dr. Nicolás Herrera','Ortopedia'),(36,'Dra. Daniela Castaño','Cardiología'),(37,'Dr. Rafael Jiménez','Neurología'),(38,'Dra. Patricia Medina','Odontología'),(39,'Dr. Cristian Salazar','Medicina General'),(40,'Dra. Laura Bonilla','Dermatología'),(41,'Dr. Diego Vargas','Oftalmología'),(42,'Dra. Valentina Rojas','Medicina Interna'),(43,'Dr. Hernán Arias','Cardiología'),(44,'Dra. Estefanía Rivera','Oncología'),(45,'Dr. Julián Cabrera','Cirugía'),(46,'Dra. Teresa Peña','Dermatología'),(47,'Dr. Guillermo Fonseca','Odontología'),(48,'Dra. Vanessa Marín','Neurología'),(49,'Dr. Álvaro Torres','Ortopedia'),(50,'Dra. Luisa Acosta','Gastroenterología'),(51,'Dr. Andrés Morales','Medicina General'),(52,'Dra. Jimena Quintero','Cardiología'),(53,'Dr. Camilo Cárdenas','Dermatología'),(54,'Dra. Paola Sánchez','Oncología'),(55,'Dr. Jorge Delgado','Cirugía'),(56,'Dra. Karina Roldán','Traumatología'),(57,'Dr. Martín González','Ortopedia'),(58,'Dra. Diana Molina','Neurología'),(59,'Dr. Alejandro Rivas','Medicina General'),(60,'Dra. Lorena Duarte','Oftalmología'),(61,'Dr. Samuel Parra','Dermatología'),(62,'Dra. Isabel González','Cardiología'),(63,'Dr. Kevin López','Odontología'),(64,'Dra. Andrea Cortés','Cirugía'),(65,'Dr. Felipe Vargas','Oncología'),(66,'Dra. Carolina Cárdenas','Neurología'),(67,'Dr. Esteban Gutiérrez','Medicina Interna'),(68,'Dra. Adriana Niño','Dermatología'),(69,'Dr. Cristian Pérez','Cardiología'),(70,'Dra. Valeria Castaño','Ortopedia'),(71,'Dr. David Torres','Medicina General'),(72,'Dra. Ana Beltrán','Cirugía'),(73,'Dr. Rodrigo Sánchez','Odontología'),(74,'Dra. María José López','Dermatología'),(75,'Dr. Pablo Castro','Cardiología'),(76,'Dra. Fernanda Ramírez','Oncología'),(77,'Dr. Enrique Torres','Medicina General'),(78,'Dra. Daniela Lozano','Cirugía'),(79,'Dr. Juan Esteban Ruiz','Ortopedia'),(80,'Dra. Mónica Calderón','Dermatología'),(81,'Dr. Javier López','Neurología'),(82,'Dra. Camila Ramírez','Cardiología'),(83,'Dr. Miguel Ángel Torres','Medicina Interna'),(84,'Dra. Catalina Herrera','Dermatología'),(85,'Dr. Sergio Duarte','Traumatología'),(86,'Dra. Tatiana Vargas','Cirugía'),(87,'Dr. Gustavo Salinas','Cardiología'),(88,'Dra. Patricia Gómez','Oncología'),(89,'Dr. Ricardo Rincón','Ortopedia'),(90,'Dra. Laura González','Neurología'),(91,'Dr. Juan Manuel Peña','Medicina General'),(92,'Dra. Gabriela Rodríguez','Cirugía'),(93,'Dr. Felipe Roldán','Dermatología'),(94,'Dra. Estela Romero','Cardiología'),(95,'Dr. Mauricio Gálvez','Oncología'),(96,'Dra. Alejandra Villalba','Medicina Interna'),(97,'Dr. Iván Herrera','Ortopedia'),(98,'Dra. Vanessa Rodríguez','Dermatología'),(99,'Dr. Rafael Gómez','Cardiología'),(100,'Dra. Natalia Sánchez','Cirugía'),(101,'Dr. Jorge Calderón','Odontología'),(102,'Dra. Mónica Pérez','Oncología'),(103,'Dr. Sebastián Morales','Medicina General'),(104,'Dra. Carolina Jiménez','Dermatología');
/*!40000 ALTER TABLE `veterinarians` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'VETERINARIANS_KYMS_DB'
--
/*!50003 DROP PROCEDURE IF EXISTS `Buscar mascotas de un dueño específico` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Buscar mascotas de un dueño específico`()
BEGIN
    SELECT p.Name AS PetName, o.Name AS OwnerName
    FROM Pets p
    INNER JOIN Owners o ON p.OwnerId = o.Id
    WHERE o.Id = owner_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Buscar mascotas por nombre parcial` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Buscar mascotas por nombre parcial`()
BEGIN
    SELECT p.Name AS PetName, o.Name AS OwnerName
    FROM Pets p
    INNER JOIN Owners o ON p.OwnerId = o.Id
    WHERE p.Name LIKE CONCAT('%', part_name, '%');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Citas dentro de un rango de fechas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Citas dentro de un rango de fechas`()
BEGIN
    SELECT a.Id, p.Name AS PetName, o.Name AS OwnerName, a.Date, a.Reason
    FROM Appointments a
    INNER JOIN Pets p ON a.PetId = p.Id
    INNER JOIN Owners o ON p.OwnerId = o.Id
    WHERE a.Date BETWEEN start_date AND end_date;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetPetsOwnersInnerJoin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `GetPetsOwnersInnerJoin`()
BEGIN
    SELECT p.Name AS PetName, o.Name AS OwnerName
    FROM Pets p
    INNER JOIN Owners o ON p.OwnerId = o.Id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Mostrar_mascotas_y_dueños_LEFT_JOIN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Mostrar_mascotas_y_dueños_LEFT_JOIN`()
BEGIN
    SELECT p.Name AS PetName, o.Name AS OwnerName
    FROM Pets p
    LEFT JOIN Owners o ON p.OwnerId = o.Id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Mostrar_nombres_de_mascotas_y_sus_dueños` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Mostrar_nombres_de_mascotas_y_sus_dueños`()
BEGIN
    SELECT p.Name AS PetName, o.Name AS OwnerName
    FROM Pets p
    INNER JOIN Owners o ON p.OwnerId = o.Id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Mostrar_nombres_de_mascotas_y_sus_dueños_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Mostrar_nombres_de_mascotas_y_sus_dueños_`()
BEGIN
    SELECT p.Name AS PetName, o.Name AS OwnerName
    FROM Pets p
    INNER JOIN Owners o ON p.OwnerId = o.Id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Todas las mascotas y sus dueños si existen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Todas las mascotas y sus dueños si existen`()
BEGIN
    SELECT p.Name AS PetName, o.Name AS OwnerName
    FROM Pets p
    LEFT JOIN Owners o ON p.OwnerId = o.Id;
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

-- Dump completed on 2025-10-15 22:14:37
