-- MySQL dump 10.13  Distrib 9.2.0, for Linux (x86_64)
--
-- Host: localhost    Database: Veterinary_Clinic_UB
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
-- Current Database: `Veterinary_Clinic_UB`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `Veterinary_Clinic_UB` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `Veterinary_Clinic_UB`;

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
INSERT INTO `appointments` VALUES (106,106,6,'2025-01-05','Vacunación anual'),(107,107,7,'2025-01-06','Consulta general'),(108,108,8,'2025-01-07','Chequeo dental'),(109,109,9,'2025-01-08','Revisión de piel'),(110,110,10,'2025-01-09','Control de peso'),(111,111,11,'2025-01-10','Desparasitación'),(112,112,12,'2025-01-11','Vacunación de refuerzo'),(113,113,13,'2025-01-12','Chequeo de oídos'),(114,114,14,'2025-01-13','Control post-operatorio'),(115,115,15,'2025-01-14','Examen de sangre'),(116,116,16,'2025-01-15','Chequeo de rutina'),(117,117,17,'2025-01-16','Problemas digestivos'),(118,118,18,'2025-01-17','Consulta de piel'),(119,119,19,'2025-01-18','Vacunación contra rabia'),(120,120,20,'2025-01-19','Chequeo dental'),(121,121,21,'2025-01-20','Problemas de apetito'),(122,122,22,'2025-01-21','Control de alergias'),(123,123,23,'2025-01-22','Chequeo de patas'),(124,124,24,'2025-01-23','Consulta de comportamiento'),(125,125,25,'2025-01-24','Control de peso'),(126,126,26,'2025-01-25','Revisión general'),(127,127,27,'2025-01-26','Chequeo de vacunas'),(128,128,28,'2025-01-27','Problemas respiratorios'),(129,129,29,'2025-01-28','Chequeo pre-quirúrgico'),(130,130,30,'2025-01-29','Control de heridas'),(131,131,31,'2025-01-30','Vacunación múltiple'),(132,132,32,'2025-01-31','Chequeo de movilidad'),(133,133,33,'2025-02-01','Consulta de piel'),(134,134,34,'2025-02-02','Revisión de oídos'),(135,135,35,'2025-02-03','Chequeo digestivo'),(136,136,36,'2025-02-04','Vacunación anual'),(137,137,37,'2025-02-05','Consulta general'),(138,138,38,'2025-02-06','Chequeo dental'),(139,139,39,'2025-02-07','Revisión de piel'),(140,140,40,'2025-02-08','Control de peso'),(141,141,41,'2025-02-09','Desparasitación'),(142,142,42,'2025-02-10','Vacunación de refuerzo'),(143,143,43,'2025-02-11','Chequeo de oídos'),(144,144,44,'2025-02-12','Control post-operatorio'),(145,145,45,'2025-02-13','Examen de sangre'),(146,146,46,'2025-02-14','Chequeo de rutina'),(147,147,47,'2025-02-15','Problemas digestivos'),(148,148,48,'2025-02-16','Consulta de piel'),(149,149,49,'2025-02-17','Vacunación contra rabia'),(150,150,50,'2025-02-18','Chequeo dental'),(151,151,51,'2025-02-19','Problemas de apetito'),(152,152,52,'2025-02-20','Control de alergias'),(153,153,53,'2025-02-21','Chequeo de patas'),(154,154,54,'2025-02-22','Consulta de comportamiento'),(155,155,55,'2025-02-23','Control de peso'),(156,156,56,'2025-02-24','Revisión general'),(157,157,57,'2025-02-25','Chequeo de vacunas'),(158,158,58,'2025-02-26','Problemas respiratorios'),(159,159,59,'2025-02-27','Chequeo pre-quirúrgico'),(160,160,60,'2025-02-28','Control de heridas'),(161,161,61,'2025-03-01','Vacunación múltiple'),(162,162,62,'2025-03-02','Chequeo de movilidad'),(163,163,63,'2025-03-03','Consulta de piel'),(164,164,64,'2025-03-04','Revisión de oídos'),(165,165,65,'2025-03-05','Chequeo digestivo'),(166,166,66,'2025-03-06','Vacunación anual'),(167,167,67,'2025-03-07','Consulta general'),(168,168,68,'2025-03-08','Chequeo dental'),(169,169,69,'2025-03-09','Revisión de piel'),(170,170,70,'2025-03-10','Control de peso'),(171,171,71,'2025-03-11','Desparasitación'),(172,172,72,'2025-03-12','Vacunación de refuerzo'),(173,173,73,'2025-03-13','Chequeo de oídos'),(174,174,74,'2025-03-14','Control post-operatorio'),(175,175,75,'2025-03-15','Examen de sangre'),(176,176,76,'2025-03-16','Chequeo de rutina'),(177,177,77,'2025-03-17','Problemas digestivos'),(178,178,78,'2025-03-18','Consulta de piel'),(179,179,79,'2025-03-19','Vacunación contra rabia'),(180,180,80,'2025-03-20','Chequeo dental'),(181,181,81,'2025-03-21','Problemas de apetito'),(182,182,82,'2025-03-22','Control de alergias'),(183,183,83,'2025-03-23','Chequeo de patas'),(184,184,84,'2025-03-24','Consulta de comportamiento'),(185,185,85,'2025-03-25','Control de peso'),(186,186,86,'2025-03-26','Revisión general'),(187,187,87,'2025-03-27','Chequeo de vacunas'),(188,188,88,'2025-03-28','Problemas respiratorios'),(189,189,89,'2025-03-29','Chequeo pre-quirúrgico'),(190,190,90,'2025-03-30','Control de heridas'),(191,191,91,'2025-03-31','Vacunación múltiple'),(192,192,92,'2025-04-01','Chequeo de movilidad'),(193,193,93,'2025-04-02','Consulta de piel'),(194,194,94,'2025-04-03','Revisión de oídos'),(195,195,95,'2025-04-04','Chequeo digestivo'),(196,196,96,'2025-04-05','Vacunación anual'),(197,197,97,'2025-04-06','Consulta general'),(198,198,98,'2025-04-07','Chequeo dental'),(199,199,99,'2025-04-08','Revisión de piel'),(200,200,100,'2025-04-09','Control de peso'),(201,201,101,'2025-04-10','Desparasitación'),(202,202,102,'2025-04-11','Vacunación de refuerzo'),(203,203,103,'2025-04-12','Chequeo de oídos'),(204,204,104,'2025-04-13','Control post-operatorio'),(205,205,105,'2025-04-14','Examen de sangre');
/*!40000 ALTER TABLE `appointments` ENABLE KEYS */;
UNLOCK TABLES;

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
INSERT INTO `medicalhistories` VALUES (6,106,'Consulta general, buen estado de salud. Se aplicó vacuna antirrábica.','2024-11-10 10:15:00'),(7,107,'Revisión por diarrea leve. Tratamiento con probióticos.','2024-11-12 09:45:00'),(8,108,'Chequeo anual, se aplicó desparasitación oral.','2024-11-15 11:30:00'),(9,109,'Herida en pata trasera, limpieza y antibióticos.','2024-11-18 15:00:00'),(10,110,'Vacuna múltiple aplicada, mascota sin complicaciones.','2024-11-20 16:20:00'),(11,111,'Control de peso, sobrepeso leve. Recomendación de dieta.','2024-11-22 14:10:00'),(12,112,'Problemas de piel (dermatitis). Tratamiento con shampoo medicado.','2024-11-25 09:20:00'),(13,113,'Chequeo postoperatorio, recuperación favorable.','2024-11-28 10:40:00'),(14,114,'Vacunación contra moquillo. No se observan reacciones adversas.','2024-12-01 12:00:00'),(15,115,'Consulta por vómitos. Diagnóstico: gastritis leve.','2024-12-02 13:50:00'),(16,116,'Control dental, limpieza realizada.','2024-12-04 11:10:00'),(17,117,'Chequeo general, mascota sana.','2024-12-06 09:30:00'),(18,118,'Vacuna antirrábica aplicada.','2024-12-08 15:45:00'),(19,119,'Revisión por cojera. Diagnóstico: esguince leve.','2024-12-10 10:00:00'),(20,120,'Consulta por tos. Tratamiento para traqueobronquitis.','2024-12-12 17:00:00'),(21,121,'Chequeo de cachorro, desparasitación y primera vacuna.','2024-12-14 09:15:00'),(22,122,'Consulta por otitis. Limpieza y gotas óticas.','2024-12-16 16:25:00'),(23,123,'Control de peso, normal.','2024-12-18 11:35:00'),(24,124,'Cirugía de esterilización. Recuperación controlada.','2024-12-20 08:50:00'),(25,125,'Consulta de urgencia por fiebre. Tratamiento antibiótico.','2024-12-22 20:15:00'),(26,126,'Chequeo anual, se aplicó refuerzo de vacunas.','2024-12-24 12:45:00'),(27,127,'Vacunación múltiple aplicada.','2024-12-26 15:30:00'),(28,128,'Consulta por diarrea. Se recomienda dieta blanda.','2024-12-28 13:40:00'),(29,129,'Chequeo de cachorro, segunda dosis de vacunas.','2025-01-02 09:20:00'),(30,130,'Problemas de piel, diagnóstico: alergia alimentaria.','2025-01-04 14:10:00'),(31,131,'Vacuna contra parvovirus aplicada.','2025-01-06 11:25:00'),(32,132,'Chequeo dental, se extrajo pieza dañada.','2025-01-08 10:30:00'),(33,133,'Revisión por caída. No se encontraron fracturas.','2025-01-10 16:00:00'),(34,134,'Consulta por apatía. Diagnóstico: anemia leve.','2025-01-12 12:15:00'),(35,135,'Chequeo anual, mascota en perfecto estado.','2025-01-14 09:45:00'),(36,196,'Consulta por vómitos recurrentes. Tratamiento gastroprotector.','2025-03-12 15:10:00'),(37,197,'Chequeo geriátrico, se diagnosticó artritis.','2025-03-14 11:40:00'),(38,198,'Vacunación anual realizada.','2025-03-15 13:20:00'),(39,199,'Revisión por tos. Diagnóstico: infección respiratoria.','2025-03-16 17:00:00'),(40,200,'Control dental, se detectó placa bacteriana.','2025-03-18 10:50:00'),(41,201,'Chequeo de cachorro, se aplicó primera vacuna.','2025-03-19 09:30:00'),(42,202,'Consulta por herida superficial. Curación realizada.','2025-03-21 12:00:00'),(43,203,'Chequeo general, buen estado de salud.','2025-03-23 08:45:00'),(44,204,'Vacunación contra rabia aplicada.','2025-03-25 14:00:00'),(45,205,'Consulta de urgencia, diagnóstico: intoxicación leve. Tratamiento inmediato.','2025-03-27 20:30:00'),(46,136,'Consulta por vómito esporádico. Tratamiento sintomático.','2025-01-16 10:20:00'),(47,137,'Chequeo anual, vacunación de refuerzo aplicada.','2025-01-18 12:45:00'),(48,138,'Herida en oreja. Limpieza y antibiótico tópico.','2025-01-20 09:10:00'),(49,139,'Consulta por tos seca. Diagnóstico: resfriado leve.','2025-01-22 14:15:00'),(50,140,'Chequeo postvacunación. Evolución normal.','2025-01-24 16:30:00'),(51,141,'Consulta por cojera. Radiografía descarta fractura.','2025-01-26 11:25:00'),(52,142,'Problemas de piel: dermatitis alérgica. Tratamiento tópico.','2025-01-28 15:00:00'),(53,143,'Chequeo geriátrico, leve pérdida de visión detectada.','2025-01-30 10:45:00'),(54,144,'Vacunación múltiple aplicada.','2025-02-01 13:20:00'),(55,145,'Consulta de urgencia por ingestión de objeto extraño. Observación clínica.','2025-02-03 17:30:00'),(56,146,'Chequeo general, mascota sana.','2025-02-05 09:15:00'),(57,147,'Tratamiento contra pulgas aplicado.','2025-02-07 11:50:00'),(58,148,'Vacuna contra parvovirus aplicada.','2025-02-09 08:40:00'),(59,149,'Control de peso, condición corporal ideal.','2025-02-11 14:25:00'),(60,150,'Consulta por diarrea leve. Tratamiento con dieta blanda.','2025-02-13 15:10:00'),(61,151,'Chequeo postoperatorio. Recuperación favorable.','2025-02-15 12:00:00'),(62,152,'Vacunación anual aplicada.','2025-02-17 09:50:00'),(63,153,'Consulta por picazón excesiva. Diagnóstico: alergia ambiental.','2025-02-19 16:40:00'),(64,154,'Chequeo de cachorro, tercera dosis de vacunas.','2025-02-21 11:05:00'),(65,155,'Consulta por tos. Tratamiento con jarabe expectorante.','2025-02-23 13:30:00'),(66,156,'Chequeo dental, limpieza realizada.','2025-02-25 10:15:00'),(67,157,'Revisión por cojera. Diagnóstico: artritis incipiente.','2025-02-27 12:40:00'),(68,158,'Vacunación múltiple aplicada.','2025-03-01 14:20:00'),(69,159,'Consulta por vómitos. Tratamiento gastroprotector.','2025-03-03 09:55:00'),(70,160,'Chequeo general. Se recomienda control de peso.','2025-03-05 15:35:00'),(71,161,'Vacuna contra rabia aplicada.','2025-03-07 11:10:00'),(72,162,'Consulta de urgencia por convulsión. Tratamiento inmediato.','2025-03-09 17:25:00'),(73,163,'Chequeo anual, mascota en buen estado.','2025-03-11 08:45:00'),(74,164,'Vacunación de refuerzo aplicada.','2025-03-13 14:00:00'),(75,165,'Consulta por diarrea crónica. Dieta especial recetada.','2025-03-15 16:50:00'),(76,166,'Chequeo postvacunación. Evolución normal.','2025-03-17 12:15:00'),(77,167,'Tratamiento antiparasitario administrado.','2025-03-19 09:35:00'),(78,168,'Consulta por falta de apetito. Diagnóstico: estrés.','2025-03-21 15:10:00'),(79,169,'Chequeo geriátrico, movilidad reducida detectada.','2025-03-23 10:20:00'),(80,170,'Vacuna contra moquillo aplicada.','2025-03-25 11:55:00'),(81,171,'Consulta por tos recurrente. Tratamiento con antibióticos.','2025-03-27 13:40:00'),(82,172,'Chequeo general, todo en orden.','2025-03-29 09:05:00'),(83,173,'Vacunación anual aplicada.','2025-03-31 14:20:00'),(84,174,'Consulta por diarrea leve. Tratamiento con dieta blanda.','2025-04-02 16:00:00'),(85,175,'Chequeo de cachorro, segunda vacuna aplicada.','2025-04-04 09:30:00'),(86,176,'Consulta por picazón en la piel. Tratamiento tópico.','2025-04-06 11:20:00'),(87,177,'Vacunación de refuerzo aplicada.','2025-04-08 15:40:00'),(88,178,'Chequeo general, mascota sana.','2025-04-10 10:15:00'),(89,179,'Consulta por vómito leve. Tratamiento con antiemético.','2025-04-12 13:50:00'),(90,180,'Chequeo dental, extracciones realizadas.','2025-04-14 12:00:00'),(91,181,'Vacuna contra rabia aplicada.','2025-04-16 09:25:00'),(92,182,'Chequeo postoperatorio, cicatrización adecuada.','2025-04-18 14:30:00'),(93,183,'Consulta por diarrea leve. Se recomienda dieta blanda.','2025-04-20 16:15:00'),(94,184,'Chequeo anual, todo en orden.','2025-04-22 10:45:00'),(95,185,'Vacunación múltiple aplicada.','2025-04-24 13:00:00'),(96,186,'Consulta por vómitos recurrentes. Tratamiento médico.','2025-04-26 11:35:00'),(97,187,'Chequeo geriátrico, artritis avanzada diagnosticada.','2025-04-28 15:20:00'),(98,188,'Vacunación anual aplicada.','2025-04-30 09:40:00'),(99,189,'Consulta por tos y estornudos. Diagnóstico: resfriado.','2025-05-02 14:10:00'),(100,190,'Chequeo general, mascota en buen estado.','2025-05-04 10:50:00'),(101,191,'Vacuna contra moquillo aplicada.','2025-05-06 12:30:00'),(102,192,'Consulta por diarrea crónica. Tratamiento dietético.','2025-05-08 09:15:00'),(103,193,'Chequeo anual. Control dental realizado.','2025-05-10 11:55:00'),(104,194,'Vacunación de refuerzo aplicada.','2025-05-12 13:25:00'),(105,195,'Consulta de urgencia por golpe. Diagnóstico: contusión leve.','2025-05-14 17:45:00');
/*!40000 ALTER TABLE `medicalhistories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owners`
--

DROP TABLE IF EXISTS `owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `owners` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `Address` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owners`
--

LOCK TABLES `owners` WRITE;
/*!40000 ALTER TABLE `owners` DISABLE KEYS */;
INSERT INTO `owners` VALUES (8,'Juan Pérez','3001112233','Calle 10 #5-20, Bogotá'),(9,'María Rodríguez','3012223344','Carrera 15 #8-40, Medellín'),(10,'Carlos Gómez','3023334455','Av. Santander 45-32, Cali'),(11,'Ana Martínez','3034445566','Calle 100 #20-15, Barranquilla'),(12,'Luis Fernández','3045556677','Cra 7 #32-45, Cartagena'),(13,'Laura Sánchez','3056667788','Cl 45 #18-12, Bucaramanga'),(14,'Andrés Ramírez','3067778899','Cl 12 #7-25, Cúcuta'),(15,'Paola Herrera','3078889900','Av. 30 de Agosto #25-40, Pereira'),(16,'Felipe Torres','3089990011','Cra 45 #32-11, Santa Marta'),(17,'Diana Castro','3090001122','Cl 22 #5-33, Manizales'),(18,'Sofía Ramírez','3101112233','Cra 12 #45-67, Bogotá'),(19,'Mateo Ríos','3112223344','Cl 89 #21-54, Medellín'),(20,'Valentina López','3123334455','Cra 23 #44-19, Cali'),(21,'Camilo Ortega','3134445566','Av. 4N #6-78, Barranquilla'),(22,'Isabella Moreno','3145556677','Cl 72 #19-28, Cartagena'),(23,'Sebastián Vargas','3156667788','Cra 45 #32-10, Bucaramanga'),(24,'Gabriela Cárdenas','3167778899','Cl 10 #25-34, Cúcuta'),(25,'Martín Silva','3178889900','Cl 8 #13-22, Pereira'),(26,'Juliana Mendoza','3189990011','Av. 5 #32-40, Santa Marta'),(27,'David Patiño','3190001122','Cra 1 #11-21, Manizales'),(28,'Natalia Torres','3201112233','Cl 67 #9-14, Bogotá'),(29,'Santiago Morales','3212223344','Cra 45 #65-22, Medellín'),(30,'Daniela Álvarez','3223334455','Av. Pasoancho #14-77, Cali'),(31,'Tomás González','3234445566','Cl 29 #8-45, Barranquilla'),(32,'Valeria Jiménez','3245556677','Cra 7 #56-23, Cartagena'),(33,'Samuel Rodríguez','3256667788','Cl 13 #3-17, Bucaramanga'),(34,'Mariana Romero','3267778899','Cra 16 #22-10, Cúcuta'),(35,'Diego Gutiérrez','3278889900','Av. Bolívar #40-21, Pereira'),(36,'Camila Hernández','3289990011','Cl 11 #12-44, Santa Marta'),(37,'Esteban Peña','3290001122','Cra 24 #30-11, Manizales'),(38,'Lucía Navarro','3301112233','Cl 100 #9-10, Bogotá'),(39,'Ricardo Mejía','3312223344','Cra 7 #55-19, Medellín'),(40,'Daniel Suárez','3323334455','Cl 34 #6-12, Cali'),(41,'Manuela León','3334445566','Av. Murillo #33-22, Barranquilla'),(42,'Cristian Rojas','3345556677','Cra 10 #27-44, Cartagena'),(43,'Alejandra Quiroz','3356667788','Cl 15 #4-30, Bucaramanga'),(44,'Andrés Castaño','3367778899','Cl 99 #10-20, Cúcuta'),(45,'Melissa Parra','3378889900','Cra 23 #32-16, Pereira'),(46,'Felipe Cifuentes','3389990011','Cl 17 #7-90, Santa Marta'),(47,'Valentina Beltrán','3390001122','Av. Colón #25-14, Manizales'),(48,'José Herrera','3401112233','Cl 40 #9-22, Bogotá'),(49,'Karen Lozano','3412223344','Cra 21 #33-11, Medellín'),(50,'Juan Esteban','3423334455','Cl 7 #14-44, Cali'),(51,'Laura Vargas','3434445566','Cra 45 #66-90, Barranquilla'),(52,'David Sánchez','3445556677','Cl 78 #11-22, Cartagena'),(53,'María Fernanda','3456667788','Cl 3 #7-56, Bucaramanga'),(54,'Nicolás Castillo','3467778899','Av. Libertadores #44-30, Cúcuta'),(55,'Sofía Duarte','3478889900','Cra 50 #40-20, Pereira'),(56,'Camilo Díaz','3489990011','Cl 60 #19-23, Santa Marta'),(57,'Sara Acosta','3490001122','Cl 32 #12-78, Manizales'),(58,'Kevin Ramos','3501112233','Cra 19 #5-15, Bogotá'),(59,'Ángela Bautista','3512223344','Cl 23 #8-60, Medellín'),(60,'Julián Córdoba','3523334455','Cra 50 #12-13, Cali'),(61,'Luisa Arango','3534445566','Cl 70 #20-19, Barranquilla'),(62,'Andrés Molina','3545556677','Cra 80 #25-11, Cartagena'),(63,'Mónica Salazar','3556667788','Cl 55 #14-17, Bucaramanga'),(64,'Felipe Ávila','3567778899','Cl 8 #15-90, Cúcuta'),(65,'Daniel Restrepo','3578889900','Av. Circunvalar #33-22, Pereira'),(66,'Tatiana Salas','3589990011','Cra 32 #22-44, Santa Marta'),(67,'Carlos Ramírez','3590001122','Cl 45 #10-33, Manizales'),(68,'Verónica Gil','3601112233','Cra 25 #15-12, Bogotá'),(69,'Sebastián Duarte','3612223344','Cl 50 #7-23, Medellín'),(70,'Liliana Fonseca','3623334455','Cra 6 #11-28, Cali'),(71,'Manuel Pardo','3634445566','Cl 77 #12-45, Barranquilla'),(72,'Catalina Barrios','3645556677','Cra 9 #33-17, Cartagena'),(73,'Alexander Muñoz','3656667788','Cl 22 #8-29, Bucaramanga'),(74,'Marisol Gálvez','3667778899','Cra 43 #11-20, Cúcuta'),(75,'Óscar Pérez','3678889900','Cl 16 #22-15, Pereira'),(76,'Sandra Molina','3689990011','Cra 12 #14-33, Santa Marta'),(77,'Héctor Valdés','3690001122','Av. Panamericana #45-32, Manizales'),(78,'Natalia Rincón','3701112233','Cra 7 #66-45, Bogotá'),(79,'Cristian López','3712223344','Cl 88 #10-17, Medellín'),(80,'Daniela Torres','3723334455','Cra 22 #20-44, Cali'),(81,'Andrés Gallo','3734445566','Cl 40 #30-21, Barranquilla'),(82,'Paula Ochoa','3745556677','Cra 8 #25-22, Cartagena'),(83,'Miguel Ángel Ruiz','3756667788','Cl 70 #9-55, Bucaramanga'),(84,'Camila Pineda','3767778899','Cra 19 #22-66, Cúcuta'),(85,'Jorge Cáceres','3778889900','Cl 44 #17-28, Pereira'),(86,'María José Silva','3789990011','Cra 12 #56-20, Santa Marta'),(87,'Felipe González','3790001122','Cl 25 #10-16, Manizales'),(88,'Claudia Rivera','3801112233','Cra 20 #33-90, Bogotá'),(89,'David Cabrera','3812223344','Cl 8 #12-15, Medellín'),(90,'Viviana Correa','3823334455','Cra 7 #40-32, Cali'),(91,'Ricardo Salazar','3834445566','Cl 66 #20-11, Barranquilla'),(92,'Estefanía Gómez','3845556677','Cra 22 #19-14, Cartagena'),(93,'Mauricio Delgado','3856667788','Cl 77 #11-45, Bucaramanga'),(94,'Tatiana Méndez','3867778899','Cra 14 #13-10, Cúcuta'),(95,'Nicolás Vargas','3878889900','Cl 55 #8-19, Pereira'),(96,'Valentina Becerra','3889990011','Cra 6 #18-12, Santa Marta'),(97,'Carlos Ospina','3890001122','Cl 32 #5-18, Manizales'),(98,'Andrea Bonilla','3901112233','Cra 12 #34-20, Bogotá'),(99,'Fernando Morales','3912223344','Cl 18 #9-12, Medellín'),(100,'Diana Ávila','3923334455','Cra 50 #23-11, Cali'),(101,'Julio César Marín','3934445566','Cl 77 #16-21, Barranquilla'),(102,'Carolina López','3945556677','Cra 21 #9-22, Cartagena'),(103,'Pedro Castillo','3956667788','Cl 66 #11-10, Bucaramanga'),(104,'Isabel García','3967778899','Cra 32 #10-17, Cúcuta'),(105,'Cristina Méndez','3978889900','Cl 8 #14-44, Pereira'),(106,'Óscar Gaitán','3989990011','Cra 44 #23-12, Santa Marta'),(107,'Patricia Flórez','3990001122','Cl 22 #19-16, Manizales');
/*!40000 ALTER TABLE `owners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `AppointmentId` int DEFAULT NULL,
  `Amount` decimal(10,2) NOT NULL,
  `PaymentDate` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_payments_appointments` (`AppointmentId`),
  CONSTRAINT `fk_payments_appointments` FOREIGN KEY (`AppointmentId`) REFERENCES `appointments` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (6,106,75000.00,'2025-01-05'),(7,107,120000.00,'2025-01-06'),(8,108,98000.00,'2025-01-07'),(9,109,150000.00,'2025-01-08'),(10,110,135000.00,'2025-01-09'),(11,111,65000.00,'2025-01-10'),(12,112,110000.00,'2025-01-11'),(13,113,172000.00,'2025-01-12'),(14,114,88000.00,'2025-01-13'),(15,115,102000.00,'2025-01-14'),(16,116,95000.00,'2025-01-15'),(17,117,160000.00,'2025-01-16'),(18,118,72000.00,'2025-01-17'),(19,119,128000.00,'2025-01-18'),(20,120,143000.00,'2025-01-19'),(21,121,90000.00,'2025-01-20'),(22,122,155000.00,'2025-01-21'),(23,123,134000.00,'2025-01-22'),(24,124,118000.00,'2025-01-23'),(25,125,98000.00,'2025-01-24'),(26,126,66000.00,'2025-01-25'),(27,127,178000.00,'2025-01-26'),(28,128,112000.00,'2025-01-27'),(29,129,72000.00,'2025-01-28'),(30,130,89000.00,'2025-01-29'),(31,131,132000.00,'2025-01-30'),(32,132,150000.00,'2025-01-31'),(33,133,99000.00,'2025-02-01'),(34,134,145000.00,'2025-02-02'),(35,135,70000.00,'2025-02-03'),(36,136,162000.00,'2025-02-04'),(37,137,138000.00,'2025-02-05'),(38,138,97000.00,'2025-02-06'),(39,139,175000.00,'2025-02-07'),(40,140,129000.00,'2025-02-08'),(41,141,142000.00,'2025-02-09'),(42,142,88000.00,'2025-02-10'),(43,143,115000.00,'2025-02-11'),(44,144,168000.00,'2025-02-12'),(45,145,74000.00,'2025-02-13'),(46,146,92000.00,'2025-02-14'),(47,147,123000.00,'2025-02-15'),(48,148,159000.00,'2025-02-16'),(49,149,133000.00,'2025-02-17'),(50,150,69000.00,'2025-02-18'),(51,151,176000.00,'2025-02-19'),(52,152,118000.00,'2025-02-20'),(53,153,102000.00,'2025-02-21'),(54,154,156000.00,'2025-02-22'),(55,155,134000.00,'2025-02-23'),(56,156,95000.00,'2025-02-24'),(57,157,89000.00,'2025-02-25'),(58,158,172000.00,'2025-02-26'),(59,159,143000.00,'2025-02-27'),(60,160,97000.00,'2025-02-28'),(61,161,121000.00,'2025-03-01'),(62,162,140000.00,'2025-03-02'),(63,163,109000.00,'2025-03-03'),(64,164,175000.00,'2025-03-04'),(65,165,87000.00,'2025-03-05'),(66,166,113000.00,'2025-03-06'),(67,167,154000.00,'2025-03-07'),(68,168,126000.00,'2025-03-08'),(69,169,91000.00,'2025-03-09'),(70,170,134000.00,'2025-03-10'),(71,171,144000.00,'2025-03-11'),(72,172,101000.00,'2025-03-12'),(73,173,132000.00,'2025-03-13'),(74,174,157000.00,'2025-03-14'),(75,175,141000.00,'2025-03-15'),(76,176,82000.00,'2025-03-16'),(77,177,116000.00,'2025-03-17'),(78,178,173000.00,'2025-03-18'),(79,179,124000.00,'2025-03-19'),(80,180,91000.00,'2025-03-20'),(81,181,165000.00,'2025-03-21'),(82,182,140000.00,'2025-03-22'),(83,183,99000.00,'2025-03-23'),(84,184,150000.00,'2025-03-24'),(85,185,88000.00,'2025-03-25'),(86,186,132000.00,'2025-03-26'),(87,187,119000.00,'2025-03-27'),(88,188,146000.00,'2025-03-28'),(89,189,73000.00,'2025-03-29'),(90,190,172000.00,'2025-03-30'),(91,191,108000.00,'2025-03-31'),(92,192,125000.00,'2025-04-01'),(93,193,164000.00,'2025-04-02'),(94,194,139000.00,'2025-04-03'),(95,195,98000.00,'2025-04-04'),(96,196,118000.00,'2025-04-05'),(97,197,155000.00,'2025-04-06'),(98,198,135000.00,'2025-04-07'),(99,199,112000.00,'2025-04-08'),(100,200,170000.00,'2025-04-09'),(101,201,75000.00,'2025-04-10'),(102,202,128000.00,'2025-04-11'),(103,203,102000.00,'2025-04-12'),(104,204,145000.00,'2025-04-13'),(105,205,99000.00,'2025-04-14');
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pets`
--

DROP TABLE IF EXISTS `pets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Species` varchar(50) DEFAULT NULL,
  `Breed` varchar(50) DEFAULT NULL,
  `Age` int DEFAULT NULL,
  `OwnerId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pets_owners` (`OwnerId`),
  CONSTRAINT `fk_pets_owners` FOREIGN KEY (`OwnerId`) REFERENCES `owners` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=206 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pets`
--

LOCK TABLES `pets` WRITE;
/*!40000 ALTER TABLE `pets` DISABLE KEYS */;
INSERT INTO `pets` VALUES (106,'Max','Perro','Labrador Retriever',3,8),(107,'Luna','Gato','Persa',2,9),(108,'Rocky','Perro','Bulldog',4,10),(109,'Milo','Gato','Siamés',1,11),(110,'Toby','Perro','Beagle',5,12),(111,'Nala','Gato','Maine Coon',2,13),(112,'Simba','Perro','Golden Retriever',3,14),(113,'Coco','Gato','Bengalí',2,15),(114,'Bruno','Perro','Pastor Alemán',6,16),(115,'Mia','Gato','Esfinge',1,17),(116,'Zeus','Perro','Rottweiler',4,18),(117,'Kira','Gato','Angora',3,19),(118,'Chester','Perro','Pug',2,20),(119,'Tom','Gato','Común Europeo',5,21),(120,'Bobby','Perro','Dálmata',4,22),(121,'Pelusa','Gato','Persa',2,23),(122,'Balto','Perro','Husky Siberiano',3,24),(123,'Fiona','Gato','Siberiano',4,25),(124,'Jack','Perro','Boxer',2,26),(125,'Lola','Gato','Ragdoll',3,27),(126,'Apolo','Perro','Doberman',5,28),(127,'Chispa','Gato','Bombay',1,29),(128,'Firulais','Perro','Criollo',4,30),(129,'Kitty','Gato','Siamés',2,31),(130,'Sasha','Perro','Shih Tzu',3,32),(131,'Greta','Gato','Birmano',2,33),(132,'Lucas','Perro','Cocker Spaniel',4,34),(133,'Nube','Gato','Exótico',1,35),(134,'Thor','Perro','Pitbull',5,36),(135,'Katy','Gato','Balinés',3,37),(136,'Lucky','Perro','Chihuahua',2,38),(137,'Mushu','Gato','Común',1,39),(138,'Scooby','Perro','Gran Danés',6,40),(139,'Daisy','Gato','Siamés',4,41),(140,'Rex','Perro','Bulldog Francés',3,42),(141,'Olivia','Gato','Angora',2,43),(142,'Leo','Perro','Border Collie',5,44),(143,'Molly','Gato','Persa',2,45),(144,'Kyra','Perro','Shar Pei',4,46),(145,'Candy','Gato','Común',3,47),(146,'Hércules','Perro','Husky',3,48),(147,'Kiko','Gato','Bombay',2,49),(148,'Rocco','Perro','Labrador',5,50),(149,'Gala','Gato','Persa',1,51),(150,'Duke','Perro','Pastor Belga',6,52),(151,'Tina','Gato','Siberiano',2,53),(152,'Oso','Perro','San Bernardo',4,54),(153,'Cleo','Gato','Ragdoll',3,55),(154,'Axel','Perro','Doberman',2,56),(155,'Chanel','Gato','Angora',4,57),(156,'Fido','Perro','Poodle',3,58),(157,'Momo','Gato','Bengalí',2,59),(158,'Sultán','Perro','Criollo',4,60),(159,'Kiara','Gato','Común',1,61),(160,'Tommy','Perro','Fox Terrier',3,62),(161,'Bella','Gato','Persa',2,63),(162,'Spike','Perro','Bulldog Inglés',5,64),(163,'Luz','Gato','Siamés',3,65),(164,'Rambo','Perro','Pitbull',2,66),(165,'Atenea','Gato','Ragdoll',4,67),(166,'Brandy','Perro','Golden Retriever',3,68),(167,'Pecas','Gato','Siberiano',2,69),(168,'Zephyr','Perro','Beagle',5,70),(169,'Nina','Gato','Angora',1,71),(170,'Flash','Perro','Husky',4,72),(171,'Perla','Gato','Común',3,73),(172,'Spike','Perro','Chow Chow',2,74),(173,'Maggie','Gato','Bombay',2,75),(174,'Shadow','Perro','Pastor Alemán',6,76),(175,'Lili','Gato','Persa',1,77),(176,'Otto','Perro','Boxer',3,78),(177,'Sami','Gato','Siamés',2,79),(178,'Hunter','Perro','Labrador',4,80),(179,'Nico','Gato','Común',1,81),(180,'Zara','Perro','Shih Tzu',3,82),(181,'Miel','Gato','Angora',2,83),(182,'Bingo','Perro','Criollo',5,84),(183,'Chispa','Gato','Bengalí',3,85),(184,'Kenai','Perro','Husky',2,86),(185,'Yara','Gato','Persa',4,87),(186,'Snoopy','Perro','Beagle',4,88),(187,'Nina','Gato','Bombay',3,89),(188,'Bolt','Perro','Pastor Alemán',5,90),(189,'Luna','Gato','Común',2,91),(190,'Otis','Perro','Bulldog',3,92),(191,'Estrella','Gato','Angora',1,93),(192,'Chester','Perro','Golden Retriever',6,94),(193,'Maya','Gato','Persa',2,95),(194,'Tango','Perro','Rottweiler',4,96),(195,'Nube','Gato','Siamés',3,97),(196,'Hugo','Perro','Pug',2,98),(197,'Susi','Gato','Común',1,99),(198,'Iron','Perro','Doberman',5,100),(199,'Kira','Gato','Ragdoll',2,101),(200,'Leo','Perro','Fox Terrier',3,102),(201,'Pacha','Gato','Bombay',2,103),(202,'Oscar','Perro','Criollo',4,104),(203,'Mimi','Gato','Angora',2,105),(204,'Blue','Perro','Husky',3,106),(205,'Lola','Gato','Persa',1,107);
/*!40000 ALTER TABLE `pets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veterinarians`
--

DROP TABLE IF EXISTS `veterinarians`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `veterinarians` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Specialization` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veterinarians`
--

LOCK TABLES `veterinarians` WRITE;
/*!40000 ALTER TABLE `veterinarians` DISABLE KEYS */;
INSERT INTO `veterinarians` VALUES (6,'Laura Gómez','Medicina General'),(7,'Andrés Martínez','Cirugía'),(8,'Carolina Ríos','Dermatología'),(9,'Felipe Ramírez','Traumatología'),(10,'Mariana Torres','Medicina Interna'),(11,'Santiago Castro','Odontología'),(12,'Valentina López','Cardiología'),(13,'Camilo Pérez','Oftalmología'),(14,'Juliana Hernández','Neurología'),(15,'Mateo Ortiz','Anestesiología'),(16,'Paula Cárdenas','Oncología'),(17,'Sebastián Díaz','Ortopedia'),(18,'Natalia Vargas','Animales Exóticos'),(19,'Cristian Moreno','Medicina Preventiva'),(20,'Daniela Patiño','Rehabilitación'),(21,'José Gutiérrez','Urgencias'),(22,'Marcela Sánchez','Nefrología'),(23,'Juan Esteban Ruiz','Infectología'),(24,'Isabel Correa','Endocrinología'),(25,'Tomás Navarro','Imagenología'),(26,'Liliana Méndez','Medicina General'),(27,'Óscar Herrera','Cirugía'),(28,'Patricia López','Dermatología'),(29,'Rodrigo Silva','Traumatología'),(30,'Estefanía Duarte','Medicina Interna'),(31,'Mauricio Roldán','Odontología'),(32,'Gabriela Jiménez','Cardiología'),(33,'Ricardo Castaño','Oftalmología'),(34,'Claudia Peña','Neurología'),(35,'David Suárez','Anestesiología'),(36,'Ana María Torres','Oncología'),(37,'Fernando Cabrera','Ortopedia'),(38,'Catalina Romero','Animales Exóticos'),(39,'Julián Vargas','Medicina Preventiva'),(40,'Sandra Castro','Rehabilitación'),(41,'Luis Fernando Pérez','Urgencias'),(42,'Paola Rincón','Nefrología'),(43,'Jorge Morales','Infectología'),(44,'Verónica Salazar','Endocrinología'),(45,'Diego Mejía','Imagenología'),(46,'Mónica Rodríguez','Medicina General'),(47,'Álvaro Gómez','Cirugía'),(48,'Tatiana López','Dermatología'),(49,'Nelson Ramírez','Traumatología'),(50,'Clara Villamil','Medicina Interna'),(51,'Iván Restrepo','Odontología'),(52,'Lorena Pérez','Cardiología'),(53,'Manuel Ospina','Oftalmología'),(54,'Rosaura Quintero','Neurología'),(55,'Esteban Herrera','Anestesiología'),(56,'Fabiola Gallo','Oncología'),(57,'Carlos Marín','Ortopedia'),(58,'Viviana Cifuentes','Animales Exóticos'),(59,'Mauricio Torres','Medicina Preventiva'),(60,'Alejandra Sierra','Rehabilitación'),(61,'Camilo Salgado','Urgencias'),(62,'Laura Restrepo','Nefrología'),(63,'Felipe Cárdenas','Infectología'),(64,'Andrea Morales','Endocrinología'),(65,'Hernán Zapata','Imagenología'),(66,'Gloria Ramírez','Medicina General'),(67,'José Luis Torres','Cirugía'),(68,'Marcela Correa','Dermatología'),(69,'Carlos Fernández','Traumatología'),(70,'Adriana Lozano','Medicina Interna'),(71,'Felipe Jaramillo','Odontología'),(72,'Luisa González','Cardiología'),(73,'Mario Ortiz','Oftalmología'),(74,'Carolina Vélez','Neurología'),(75,'Ángela Montoya','Anestesiología'),(76,'Claudio Valencia','Oncología'),(77,'Patricia Calderón','Ortopedia'),(78,'Javier Bautista','Animales Exóticos'),(79,'Sandra Ocampo','Medicina Preventiva'),(80,'Mauricio Díaz','Rehabilitación'),(81,'Daniel Corredor','Urgencias'),(82,'Alejandra Pérez','Nefrología'),(83,'Fernando Patiño','Infectología'),(84,'Nathalia Cárdenas','Endocrinología'),(85,'Pablo Rojas','Imagenología'),(86,'Marisol Díaz','Medicina General'),(87,'Guillermo Álvarez','Cirugía'),(88,'Carla Méndez','Dermatología'),(89,'Diego López','Traumatología'),(90,'Lorena Sánchez','Medicina Interna'),(91,'Héctor Ríos','Odontología'),(92,'María Fernanda Torres','Cardiología'),(93,'Sergio Peña','Oftalmología'),(94,'Eliana Romero','Neurología'),(95,'Martín Guzmán','Anestesiología'),(96,'Katherine Morales','Oncología'),(97,'Óscar Rincón','Ortopedia'),(98,'Margarita Jiménez','Animales Exóticos'),(99,'Cristian Ávila','Medicina Preventiva'),(100,'Sandra Rojas','Rehabilitación'),(101,'Nelson Gómez','Urgencias'),(102,'Diana Rodríguez','Nefrología'),(103,'Felipe Torres','Infectología'),(104,'Daniela Lozano','Endocrinología'),(105,'Camila Herrera','Imagenología');
/*!40000 ALTER TABLE `veterinarians` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'Veterinary_Clinic_UB'
--

--
-- Dumping routines for database 'Veterinary_Clinic_UB'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-02 13:54:23
