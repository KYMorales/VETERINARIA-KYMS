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
-- Table structure for table `medicalhistories`
--

DROP TABLE IF EXISTS `medicalhistories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicalhistories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `PetId` int DEFAULT NULL,
  `Description` text,
  `CreatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_medicalhistories_pets` (`PetId`),
  CONSTRAINT `fk_medicalhistories_pets` FOREIGN KEY (`PetId`) REFERENCES `pets` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicalhistories`
--

LOCK TABLES `medicalhistories` WRITE;
/*!40000 ALTER TABLE `medicalhistories` DISABLE KEYS */;
INSERT INTO `medicalhistories` VALUES (6,430,'Consulta por vómito esporádico. Tratamiento sintomático.','2025-01-16 10:20:00'),(7,431,'Chequeo anual, vacunación de refuerzo aplicada.','2025-01-18 12:45:00'),(8,432,'Herida en oreja. Limpieza y antibiótico tópico.','2025-01-20 09:10:00'),(9,433,'Consulta por tos seca. Diagnóstico: resfriado leve.','2025-01-22 14:15:00'),(10,434,'Chequeo postvacunación. Evolución normal.','2025-01-24 16:30:00'),(11,435,'Consulta por cojera. Radiografía descarta fractura.','2025-01-26 11:25:00'),(12,436,'Problemas de piel: dermatitis alérgica. Tratamiento tópico.','2025-01-28 15:00:00'),(13,437,'Chequeo geriátrico, leve pérdida de visión detectada.','2025-01-30 10:45:00'),(14,438,'Vacunación múltiple aplicada.','2025-02-01 13:20:00'),(15,439,'Consulta de urgencia por ingestión de objeto extraño. Observación clínica.','2025-02-03 17:30:00'),(16,440,'Chequeo general, mascota sana.','2025-02-05 09:15:00'),(17,441,'Tratamiento contra pulgas aplicado.','2025-02-07 11:50:00'),(18,442,'Vacuna contra parvovirus aplicada.','2025-02-09 08:40:00'),(19,443,'Control de peso, condición corporal ideal.','2025-02-11 14:25:00'),(20,444,'Consulta por diarrea leve. Tratamiento con dieta blanda.','2025-02-13 15:10:00'),(21,445,'Chequeo postoperatorio. Recuperación favorable.','2025-02-15 12:00:00'),(22,446,'Vacunación anual aplicada.','2025-02-17 09:50:00'),(23,447,'Consulta por picazón excesiva. Diagnóstico: alergia ambiental.','2025-02-19 16:40:00'),(24,448,'Chequeo de cachorro, tercera dosis de vacunas.','2025-02-21 11:05:00'),(25,449,'Consulta por tos. Tratamiento con jarabe expectorante.','2025-02-23 13:30:00'),(26,450,'Chequeo dental, limpieza realizada.','2025-02-25 10:15:00'),(27,451,'Revisión por cojera. Diagnóstico: artritis incipiente.','2025-02-27 12:40:00'),(28,452,'Vacunación múltiple aplicada.','2025-03-01 14:20:00'),(29,453,'Consulta por vómitos. Tratamiento gastroprotector.','2025-03-03 09:55:00'),(30,454,'Chequeo general. Se recomienda control de peso.','2025-03-05 15:35:00'),(31,455,'Vacuna contra rabia aplicada.','2025-03-07 11:10:00'),(32,456,'Consulta de urgencia por convulsión. Tratamiento inmediato.','2025-03-09 17:25:00'),(33,457,'Chequeo anual, mascota en buen estado.','2025-03-11 08:45:00'),(34,458,'Vacunación de refuerzo aplicada.','2025-03-13 14:00:00'),(35,459,'Consulta por diarrea crónica. Dieta especial recetada.','2025-03-15 16:50:00'),(36,460,'Chequeo postvacunación. Evolución normal.','2025-03-17 12:15:00'),(37,461,'Tratamiento antiparasitario administrado.','2025-03-19 09:35:00'),(38,462,'Consulta por falta de apetito. Diagnóstico: estrés.','2025-03-21 15:10:00'),(39,463,'Chequeo geriátrico, movilidad reducida detectada.','2025-03-23 10:20:00'),(40,464,'Vacuna contra moquillo aplicada.','2025-03-25 11:55:00'),(41,465,'Consulta por tos recurrente. Tratamiento con antibióticos.','2025-03-27 13:40:00'),(42,466,'Chequeo general, todo en orden.','2025-03-29 09:05:00'),(43,467,'Vacunación anual aplicada.','2025-03-31 14:20:00'),(44,468,'Consulta por diarrea leve. Tratamiento con dieta blanda.','2025-04-02 16:00:00'),(45,469,'Chequeo de cachorro, segunda vacuna aplicada.','2025-04-04 09:30:00'),(46,470,'Consulta por picazón en la piel. Tratamiento tópico.','2025-04-06 11:20:00'),(47,471,'Vacunación de refuerzo aplicada.','2025-04-08 15:40:00'),(48,472,'Chequeo general, mascota sana.','2025-04-10 10:15:00'),(49,473,'Consulta por vómito leve. Tratamiento con antiemético.','2025-04-12 13:50:00'),(50,474,'Chequeo dental, extracciones realizadas.','2025-04-14 12:00:00'),(51,475,'Vacuna contra rabia aplicada.','2025-04-16 09:25:00'),(52,476,'Chequeo postoperatorio, cicatrización adecuada.','2025-04-18 14:30:00'),(53,477,'Consulta por diarrea leve. Se recomienda dieta blanda.','2025-04-20 16:15:00'),(54,478,'Chequeo anual, todo en orden.','2025-04-22 10:45:00'),(55,479,'Vacunación múltiple aplicada.','2025-04-24 13:00:00'),(56,480,'Consulta por vómitos recurrentes. Tratamiento médico.','2025-04-26 11:35:00'),(57,481,'Chequeo geriátrico, artritis avanzada diagnosticada.','2025-04-28 15:20:00'),(58,482,'Vacunación anual aplicada.','2025-04-30 09:40:00'),(59,483,'Consulta por tos y estornudos. Diagnóstico: resfriado.','2025-05-02 14:10:00'),(60,484,'Chequeo general, mascota en buen estado.','2025-05-04 10:50:00'),(61,485,'Vacuna contra moquillo aplicada.','2025-05-06 12:30:00'),(62,486,'Consulta por diarrea crónica. Tratamiento dietético.','2025-05-08 09:15:00'),(63,487,'Chequeo anual. Control dental realizado.','2025-05-10 11:55:00'),(64,488,'Vacunación de refuerzo aplicada.','2025-05-12 13:25:00'),(65,489,'Consulta de urgencia por golpe. Diagnóstico: contusión leve.','2025-05-14 17:45:00'),(66,490,'Consulta por vómito esporádico. Tratamiento sintomático.','2025-01-16 10:20:00'),(67,491,'Chequeo anual, vacunación de refuerzo aplicada.','2025-01-18 12:45:00'),(68,492,'Herida en oreja. Limpieza y antibiótico tópico.','2025-01-20 09:10:00'),(69,493,'Consulta por tos seca. Diagnóstico: resfriado leve.','2025-01-22 14:15:00'),(70,494,'Chequeo postvacunación. Evolución normal.','2025-01-24 16:30:00'),(71,495,'Consulta por cojera. Radiografía descarta fractura.','2025-01-26 11:25:00'),(72,496,'Problemas de piel: dermatitis alérgica. Tratamiento tópico.','2025-01-28 15:00:00'),(73,497,'Chequeo geriátrico, leve pérdida de visión detectada.','2025-01-30 10:45:00'),(74,498,'Vacunación múltiple aplicada.','2025-02-01 13:20:00'),(75,499,'Consulta de urgencia por ingestión de objeto extraño. Observación clínica.','2025-02-03 17:30:00'),(76,500,'Chequeo general, mascota sana.','2025-02-05 09:15:00'),(77,501,'Tratamiento contra pulgas aplicado.','2025-02-07 11:50:00'),(78,502,'Vacuna contra parvovirus aplicada.','2025-02-09 08:40:00'),(79,503,'Control de peso, condición corporal ideal.','2025-02-11 14:25:00'),(80,504,'Consulta por diarrea leve. Tratamiento con dieta blanda.','2025-02-13 15:10:00'),(81,505,'Chequeo postoperatorio. Recuperación favorable.','2025-02-15 12:00:00'),(82,506,'Vacunación anual aplicada.','2025-02-17 09:50:00'),(83,507,'Consulta por picazón excesiva. Diagnóstico: alergia ambiental.','2025-02-19 16:40:00'),(84,508,'Chequeo de cachorro, tercera dosis de vacunas.','2025-02-21 11:05:00'),(85,509,'Consulta por tos. Tratamiento con jarabe expectorante.','2025-02-23 13:30:00'),(86,510,'Chequeo dental, limpieza realizada.','2025-02-25 10:15:00'),(87,511,'Revisión por cojera. Diagnóstico: artritis incipiente.','2025-02-27 12:40:00'),(88,512,'Vacunación múltiple aplicada.','2025-03-01 14:20:00'),(89,513,'Consulta por vómitos. Tratamiento gastroprotector.','2025-03-03 09:55:00'),(90,514,'Chequeo general. Se recomienda control de peso.','2025-03-05 15:35:00'),(91,515,'Vacuna contra rabia aplicada.','2025-03-07 11:10:00'),(92,516,'Consulta de urgencia por convulsión. Tratamiento inmediato.','2025-03-09 17:25:00'),(93,517,'Chequeo anual, mascota en buen estado.','2025-03-11 08:45:00'),(94,518,'Vacunación de refuerzo aplicada.','2025-03-13 14:00:00'),(95,519,'Consulta por diarrea crónica. Dieta especial recetada.','2025-03-15 16:50:00'),(96,520,'Chequeo postvacunación. Evolución normal.','2025-03-17 12:15:00'),(97,521,'Tratamiento antiparasitario administrado.','2025-03-19 09:35:00'),(98,522,'Consulta por falta de apetito. Diagnóstico: estrés.','2025-03-21 15:10:00'),(99,523,'Chequeo geriátrico, movilidad reducida detectada.','2025-03-23 10:20:00'),(100,524,'Vacuna contra moquillo aplicada.','2025-03-25 11:55:00'),(101,525,'Consulta por tos recurrente. Tratamiento con antibióticos.','2025-03-27 13:40:00'),(102,526,'Chequeo general, todo en orden.','2025-03-29 09:05:00'),(103,527,'Vacunación anual aplicada.','2025-03-31 14:20:00'),(104,528,'Consulta por diarrea leve. Tratamiento con dieta blanda.','2025-04-02 16:00:00'),(105,529,'Chequeo de cachorro, segunda vacuna aplicada.','2025-04-04 09:30:00');
/*!40000 ALTER TABLE `medicalhistories` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-02  8:37:26
