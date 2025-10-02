-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: 172.20.79.186    Database: Veterinary_DB
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
  `Pet_Id` int DEFAULT NULL,
  `VeterinarianId` int DEFAULT NULL,
  `DateAppointment` date NOT NULL,
  `Reason` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_appointments_pets` (`Pet_Id`),
  KEY `fk_appointments_vets` (`VeterinarianId`),
  CONSTRAINT `fk_appointments_pets` FOREIGN KEY (`Pet_Id`) REFERENCES `pets` (`id`),
  CONSTRAINT `fk_appointments_vets` FOREIGN KEY (`VeterinarianId`) REFERENCES `veterinarians` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointments`
--

LOCK TABLES `appointments` WRITE;
/*!40000 ALTER TABLE `appointments` DISABLE KEYS */;
INSERT INTO `appointments` VALUES (6,6,6,'2025-05-01','Chequeo general'),(7,7,7,'2025-05-02','Vacunación anual'),(8,8,8,'2025-05-03','Desparasitación'),(9,9,9,'2025-05-04','Control de peso'),(10,10,10,'2025-05-05','Chequeo general'),(11,11,11,'2025-05-06','Emergencia - vómito'),(12,12,12,'2025-05-07','Revisión dental'),(13,13,13,'2025-05-08','Control postquirúrgico'),(14,14,14,'2025-05-09','Chequeo general'),(15,15,15,'2025-05-10','Vacunación refuerzo'),(16,16,16,'2025-05-11','Cirugía programada'),(17,17,17,'2025-05-12','Control de piel'),(18,18,18,'2025-05-13','Chequeo general'),(19,19,19,'2025-05-14','Desparasitación'),(20,20,20,'2025-05-15','Control nutricional'),(21,21,21,'2025-05-16','Chequeo cardiológico'),(22,22,22,'2025-05-17','Emergencia - herida'),(23,23,23,'2025-05-18','Revisión dental'),(24,24,24,'2025-05-19','Chequeo general'),(25,25,25,'2025-05-20','Control de peso'),(26,26,26,'2025-05-21','Chequeo general'),(27,27,27,'2025-05-22','Vacunación anual'),(28,28,28,'2025-05-23','Chequeo general'),(29,29,29,'2025-05-24','Desparasitación'),(30,30,30,'2025-05-25','Chequeo general'),(31,31,31,'2025-05-26','Emergencia - fiebre'),(32,32,32,'2025-05-27','Control de peso'),(33,33,33,'2025-05-28','Chequeo general'),(34,34,34,'2025-05-29','Revisión dental'),(35,35,35,'2025-05-30','Chequeo general'),(36,36,36,'2025-05-31','Vacunación refuerzo'),(37,37,37,'2025-06-01','Control de piel'),(38,38,38,'2025-06-02','Chequeo general'),(39,39,39,'2025-06-03','Desparasitación'),(40,40,40,'2025-06-04','Control nutricional'),(41,41,41,'2025-06-05','Chequeo general'),(42,42,42,'2025-06-06','Chequeo cardiológico'),(43,43,43,'2025-06-07','Emergencia - caída'),(44,44,44,'2025-06-08','Chequeo general'),(45,45,45,'2025-06-09','Revisión dental'),(46,46,46,'2025-06-10','Chequeo general'),(47,47,47,'2025-06-11','Vacunación anual'),(48,48,48,'2025-06-12','Chequeo general'),(49,49,49,'2025-06-13','Desparasitación'),(50,50,50,'2025-06-14','Control nutricional'),(51,51,51,'2025-06-15','Chequeo general'),(52,52,52,'2025-06-16','Chequeo cardiológico'),(53,53,53,'2025-06-17','Emergencia - diarrea'),(54,54,54,'2025-06-18','Chequeo general'),(55,55,55,'2025-06-19','Revisión dental'),(56,56,56,'2025-06-20','Chequeo general'),(57,57,57,'2025-06-21','Vacunación refuerzo'),(58,58,58,'2025-06-22','Chequeo general'),(59,59,59,'2025-06-23','Control de piel'),(60,60,60,'2025-06-24','Chequeo general'),(61,61,61,'2025-06-25','Desparasitación'),(62,62,62,'2025-06-26','Chequeo general'),(63,63,63,'2025-06-27','Emergencia - alergia'),(64,64,64,'2025-06-28','Chequeo general'),(65,65,65,'2025-06-29','Revisión dental'),(66,66,66,'2025-06-30','Chequeo general'),(67,67,67,'2025-07-01','Vacunación anual'),(68,68,68,'2025-07-02','Chequeo general'),(69,69,69,'2025-07-03','Desparasitación'),(70,70,70,'2025-07-04','Chequeo general'),(71,71,71,'2025-07-05','Control nutricional'),(72,72,72,'2025-07-06','Chequeo general'),(73,73,73,'2025-07-07','Emergencia - tos'),(74,74,74,'2025-07-08','Chequeo general'),(75,75,75,'2025-07-09','Revisión dental'),(76,76,76,'2025-07-10','Chequeo general'),(77,77,77,'2025-07-11','Vacunación refuerzo'),(78,78,78,'2025-07-12','Chequeo general'),(79,79,79,'2025-07-13','Control de piel'),(80,80,80,'2025-07-14','Chequeo general'),(81,81,81,'2025-07-15','Desparasitación'),(82,82,82,'2025-07-16','Chequeo general'),(83,83,83,'2025-07-17','Emergencia - fiebre'),(84,84,84,'2025-07-18','Chequeo general'),(85,85,85,'2025-07-19','Revisión dental'),(86,86,86,'2025-07-20','Chequeo general'),(87,87,87,'2025-07-21','Vacunación anual'),(88,88,88,'2025-07-22','Chequeo general'),(89,89,89,'2025-07-23','Control nutricional'),(90,90,90,'2025-07-24','Chequeo general'),(91,91,91,'2025-07-25','Desparasitación'),(92,92,92,'2025-07-26','Chequeo general'),(93,93,93,'2025-07-27','Emergencia - herida'),(94,94,94,'2025-07-28','Chequeo general'),(95,95,95,'2025-07-29','Revisión dental'),(96,96,96,'2025-07-30','Chequeo general'),(97,97,97,'2025-07-31','Vacunación refuerzo'),(98,98,98,'2025-08-01','Chequeo general'),(99,99,99,'2025-08-02','Control de piel'),(100,100,100,'2025-08-03','Chequeo general'),(101,101,101,'2025-08-04','Desparasitación'),(102,102,102,'2025-08-05','Chequeo general'),(103,103,103,'2025-08-06','Emergencia - vómito'),(104,104,104,'2025-08-07','Chequeo general'),(105,105,105,'2025-08-08','Revisión dental');
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
INSERT INTO `medicalhistories` VALUES (6,6,'Consulta por vómito esporádico. Tratamiento sintomático.','2025-01-16 10:20:00'),(7,7,'Chequeo anual, vacunación de refuerzo aplicada.','2025-01-18 12:45:00'),(8,8,'Herida en oreja. Limpieza y antibiótico tópico.','2025-01-20 09:10:00'),(9,9,'Consulta por tos seca. Diagnóstico: resfriado leve.','2025-01-22 14:15:00'),(10,10,'Chequeo postvacunación. Evolución normal.','2025-01-24 16:30:00'),(11,11,'Consulta por cojera. Radiografía descarta fractura.','2025-01-26 11:25:00'),(12,12,'Problemas de piel: dermatitis alérgica. Tratamiento tópico.','2025-01-28 15:00:00'),(13,13,'Chequeo geriátrico, leve pérdida de visión detectada.','2025-01-30 10:45:00'),(14,14,'Vacunación múltiple aplicada.','2025-02-01 13:20:00'),(15,15,'Consulta de urgencia por ingestión de objeto extraño. Observación clínica.','2025-02-03 17:30:00'),(16,16,'Chequeo general, mascota sana.','2025-02-05 09:15:00'),(17,17,'Tratamiento contra pulgas aplicado.','2025-02-07 11:50:00'),(18,18,'Vacuna contra parvovirus aplicada.','2025-02-09 08:40:00'),(19,19,'Control de peso, condición corporal ideal.','2025-02-11 14:25:00'),(20,20,'Consulta por diarrea leve. Tratamiento con dieta blanda.','2025-02-13 15:10:00'),(21,21,'Chequeo postoperatorio. Recuperación favorable.','2025-02-15 12:00:00'),(22,22,'Vacunación anual aplicada.','2025-02-17 09:50:00'),(23,23,'Consulta por picazón excesiva. Diagnóstico: alergia ambiental.','2025-02-19 16:40:00'),(24,24,'Chequeo de cachorro, tercera dosis de vacunas.','2025-02-21 11:05:00'),(25,25,'Consulta por tos. Tratamiento con jarabe expectorante.','2025-02-23 13:30:00'),(26,26,'Chequeo dental, limpieza realizada.','2025-02-25 10:15:00'),(27,27,'Revisión por cojera. Diagnóstico: artritis incipiente.','2025-02-27 12:40:00'),(28,28,'Vacunación múltiple aplicada.','2025-03-01 14:20:00'),(29,29,'Consulta por vómitos. Tratamiento gastroprotector.','2025-03-03 09:55:00'),(30,30,'Chequeo general. Se recomienda control de peso.','2025-03-05 15:35:00'),(31,31,'Vacuna contra rabia aplicada.','2025-03-07 11:10:00'),(32,32,'Consulta de urgencia por convulsión. Tratamiento inmediato.','2025-03-09 17:25:00'),(33,33,'Chequeo anual, mascota en buen estado.','2025-03-11 08:45:00'),(34,34,'Vacunación de refuerzo aplicada.','2025-03-13 14:00:00'),(35,35,'Consulta por diarrea crónica. Dieta especial recetada.','2025-03-15 16:50:00'),(36,36,'Chequeo postvacunación. Evolución normal.','2025-03-17 12:15:00'),(37,37,'Tratamiento antiparasitario administrado.','2025-03-19 09:35:00'),(38,38,'Consulta por falta de apetito. Diagnóstico: estrés.','2025-03-21 15:10:00'),(39,39,'Chequeo geriátrico, movilidad reducida detectada.','2025-03-23 10:20:00'),(40,40,'Vacuna contra moquillo aplicada.','2025-03-25 11:55:00'),(41,41,'Consulta por tos recurrente. Tratamiento con antibióticos.','2025-03-27 13:40:00'),(42,42,'Chequeo general, todo en orden.','2025-03-29 09:05:00'),(43,43,'Vacunación anual aplicada.','2025-03-31 14:20:00'),(44,44,'Consulta por diarrea leve. Tratamiento con dieta blanda.','2025-04-02 16:00:00'),(45,45,'Chequeo de cachorro, segunda vacuna aplicada.','2025-04-04 09:30:00'),(46,46,'Consulta por picazón en la piel. Tratamiento tópico.','2025-04-06 11:20:00'),(47,47,'Vacunación de refuerzo aplicada.','2025-04-08 15:40:00'),(48,48,'Chequeo general, mascota sana.','2025-04-10 10:15:00'),(49,49,'Consulta por vómito leve. Tratamiento con antiemético.','2025-04-12 13:50:00'),(50,50,'Chequeo dental, extracciones realizadas.','2025-04-14 12:00:00'),(51,51,'Vacuna contra rabia aplicada.','2025-04-16 09:25:00'),(52,52,'Chequeo postoperatorio, cicatrización adecuada.','2025-04-18 14:30:00'),(53,53,'Consulta por diarrea leve. Se recomienda dieta blanda.','2025-04-20 16:15:00'),(54,54,'Chequeo anual, todo en orden.','2025-04-22 10:45:00'),(55,55,'Vacunación múltiple aplicada.','2025-04-24 13:00:00'),(56,56,'Consulta por vómitos recurrentes. Tratamiento médico.','2025-04-26 11:35:00'),(57,57,'Chequeo geriátrico, artritis avanzada diagnosticada.','2025-04-28 15:20:00'),(58,58,'Vacunación anual aplicada.','2025-04-30 09:40:00'),(59,59,'Consulta por tos y estornudos. Diagnóstico: resfriado.','2025-05-02 14:10:00'),(60,60,'Chequeo general, mascota en buen estado.','2025-05-04 10:50:00'),(61,61,'Vacuna contra moquillo aplicada.','2025-05-06 12:30:00'),(62,62,'Consulta por diarrea crónica. Tratamiento dietético.','2025-05-08 09:15:00'),(63,63,'Chequeo anual. Control dental realizado.','2025-05-10 11:55:00'),(64,64,'Vacunación de refuerzo aplicada.','2025-05-12 13:25:00'),(65,65,'Consulta de urgencia por golpe. Diagnóstico: contusión leve.','2025-05-14 17:45:00'),(66,66,'Consulta por vómito esporádico. Tratamiento sintomático.','2025-01-16 10:20:00'),(67,67,'Chequeo anual, vacunación de refuerzo aplicada.','2025-01-18 12:45:00'),(68,68,'Herida en oreja. Limpieza y antibiótico tópico.','2025-01-20 09:10:00'),(69,69,'Consulta por tos seca. Diagnóstico: resfriado leve.','2025-01-22 14:15:00'),(70,70,'Chequeo postvacunación. Evolución normal.','2025-01-24 16:30:00'),(71,71,'Consulta por cojera. Radiografía descarta fractura.','2025-01-26 11:25:00'),(72,72,'Problemas de piel: dermatitis alérgica. Tratamiento tópico.','2025-01-28 15:00:00'),(73,73,'Chequeo geriátrico, leve pérdida de visión detectada.','2025-01-30 10:45:00'),(74,74,'Vacunación múltiple aplicada.','2025-02-01 13:20:00'),(75,75,'Consulta de urgencia por ingestión de objeto extraño. Observación clínica.','2025-02-03 17:30:00'),(76,76,'Chequeo general, mascota sana.','2025-02-05 09:15:00'),(77,77,'Tratamiento contra pulgas aplicado.','2025-02-07 11:50:00'),(78,78,'Vacuna contra parvovirus aplicada.','2025-02-09 08:40:00'),(79,79,'Control de peso, condición corporal ideal.','2025-02-11 14:25:00'),(80,80,'Consulta por diarrea leve. Tratamiento con dieta blanda.','2025-02-13 15:10:00'),(81,81,'Chequeo postoperatorio. Recuperación favorable.','2025-02-15 12:00:00'),(82,82,'Vacunación anual aplicada.','2025-02-17 09:50:00'),(83,83,'Consulta por picazón excesiva. Diagnóstico: alergia ambiental.','2025-02-19 16:40:00'),(84,84,'Chequeo de cachorro, tercera dosis de vacunas.','2025-02-21 11:05:00'),(85,85,'Consulta por tos. Tratamiento con jarabe expectorante.','2025-02-23 13:30:00'),(86,86,'Chequeo dental, limpieza realizada.','2025-02-25 10:15:00'),(87,87,'Revisión por cojera. Diagnóstico: artritis incipiente.','2025-02-27 12:40:00'),(88,88,'Vacunación múltiple aplicada.','2025-03-01 14:20:00'),(89,89,'Consulta por vómitos. Tratamiento gastroprotector.','2025-03-03 09:55:00'),(90,90,'Chequeo general. Se recomienda control de peso.','2025-03-05 15:35:00'),(91,91,'Vacuna contra rabia aplicada.','2025-03-07 11:10:00'),(92,92,'Consulta de urgencia por convulsión. Tratamiento inmediato.','2025-03-09 17:25:00'),(93,93,'Chequeo anual, mascota en buen estado.','2025-03-11 08:45:00'),(94,94,'Vacunación de refuerzo aplicada.','2025-03-13 14:00:00'),(95,95,'Consulta por diarrea crónica. Dieta especial recetada.','2025-03-15 16:50:00'),(96,96,'Chequeo postvacunación. Evolución normal.','2025-03-17 12:15:00'),(97,97,'Tratamiento antiparasitario administrado.','2025-03-19 09:35:00'),(98,98,'Consulta por falta de apetito. Diagnóstico: estrés.','2025-03-21 15:10:00'),(99,99,'Chequeo geriátrico, movilidad reducida detectada.','2025-03-23 10:20:00'),(100,100,'Vacuna contra moquillo aplicada.','2025-03-25 11:55:00'),(101,101,'Consulta por tos recurrente. Tratamiento con antibióticos.','2025-03-27 13:40:00'),(102,102,'Chequeo general, todo en orden.','2025-03-29 09:05:00'),(103,103,'Vacunación anual aplicada.','2025-03-31 14:20:00'),(104,104,'Consulta por diarrea leve. Tratamiento con dieta blanda.','2025-04-02 16:00:00'),(105,105,'Chequeo de cachorro, segunda vacuna aplicada.','2025-04-04 09:30:00');
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
INSERT INTO `owners` VALUES (7,'Connie McCreedy','811-477-4476','1007 Fairview '),(8,'Juan Pérez','3001112233','Calle 10 #5-20, Bogotá'),(9,'María Rodríguez','3012223344','Carrera 15 #8-40, Medellín'),(10,'Carlos Gómez','3023334455','Av. Santander 45-32, Cali'),(11,'Ana Martínez','3034445566','Calle 100 #20-15, Barranquilla'),(12,'Luis Fernández','3045556677','Cra 7 #32-45, Cartagena'),(13,'Laura Sánchez','3056667788','Cl 45 #18-12, Bucaramanga'),(14,'Andrés Ramírez','3067778899','Cl 12 #7-25, Cúcuta'),(15,'Paola Herrera','3078889900','Av. 30 de Agosto #25-40, Pereira'),(16,'Felipe Torres','3089990011','Cra 45 #32-11, Santa Marta'),(17,'Diana Castro','3090001122','Cl 22 #5-33, Manizales'),(18,'Sofía Ramírez','3101112233','Cra 12 #45-67, Bogotá'),(19,'Mateo Ríos','3112223344','Cl 89 #21-54, Medellín'),(20,'Valentina López','3123334455','Cra 23 #44-19, Cali'),(21,'Camilo Ortega','3134445566','Av. 4N #6-78, Barranquilla'),(22,'Isabella Moreno','3145556677','Cl 72 #19-28, Cartagena'),(23,'Sebastián Vargas','3156667788','Cra 45 #32-10, Bucaramanga'),(24,'Gabriela Cárdenas','3167778899','Cl 10 #25-34, Cúcuta'),(25,'Martín Silva','3178889900','Cl 8 #13-22, Pereira'),(26,'Juliana Mendoza','3189990011','Av. 5 #32-40, Santa Marta'),(27,'David Patiño','3190001122','Cra 1 #11-21, Manizales'),(28,'Natalia Torres','3201112233','Cl 67 #9-14, Bogotá'),(29,'Santiago Morales','3212223344','Cra 45 #65-22, Medellín'),(30,'Daniela Álvarez','3223334455','Av. Pasoancho #14-77, Cali'),(31,'Tomás González','3234445566','Cl 29 #8-45, Barranquilla'),(32,'Valeria Jiménez','3245556677','Cra 7 #56-23, Cartagena'),(33,'Samuel Rodríguez','3256667788','Cl 13 #3-17, Bucaramanga'),(34,'Mariana Romero','3267778899','Cra 16 #22-10, Cúcuta'),(35,'Diego Gutiérrez','3278889900','Av. Bolívar #40-21, Pereira'),(36,'Camila Hernández','3289990011','Cl 11 #12-44, Santa Marta'),(37,'Esteban Peña','3290001122','Cra 24 #30-11, Manizales'),(38,'Lucía Navarro','3301112233','Cl 100 #9-10, Bogotá'),(39,'Ricardo Mejía','3312223344','Cra 7 #55-19, Medellín'),(40,'Daniel Suárez','3323334455','Cl 34 #6-12, Cali'),(41,'Manuela León','3334445566','Av. Murillo #33-22, Barranquilla'),(42,'Cristian Rojas','3345556677','Cra 10 #27-44, Cartagena'),(43,'Alejandra Quiroz','3356667788','Cl 15 #4-30, Bucaramanga'),(44,'Andrés Castaño','3367778899','Cl 99 #10-20, Cúcuta'),(45,'Melissa Parra','3378889900','Cra 23 #32-16, Pereira'),(46,'Felipe Cifuentes','3389990011','Cl 17 #7-90, Santa Marta'),(47,'Valentina Beltrán','3390001122','Av. Colón #25-14, Manizales'),(48,'José Herrera','3401112233','Cl 40 #9-22, Bogotá'),(49,'Karen Lozano','3412223344','Cra 21 #33-11, Medellín'),(50,'Juan Esteban','3423334455','Cl 7 #14-44, Cali'),(51,'Laura Vargas','3434445566','Cra 45 #66-90, Barranquilla'),(52,'David Sánchez','3445556677','Cl 78 #11-22, Cartagena'),(53,'María Fernanda','3456667788','Cl 3 #7-56, Bucaramanga'),(54,'Nicolás Castillo','3467778899','Av. Libertadores #44-30, Cúcuta'),(55,'Sofía Duarte','3478889900','Cra 50 #40-20, Pereira'),(56,'Camilo Díaz','3489990011','Cl 60 #19-23, Santa Marta'),(57,'Sara Acosta','3490001122','Cl 32 #12-78, Manizales'),(58,'Kevin Ramos','3501112233','Cra 19 #5-15, Bogotá'),(59,'Ángela Bautista','3512223344','Cl 23 #8-60, Medellín'),(60,'Julián Córdoba','3523334455','Cra 50 #12-13, Cali'),(61,'Luisa Arango','3534445566','Cl 70 #20-19, Barranquilla'),(62,'Andrés Molina','3545556677','Cra 80 #25-11, Cartagena'),(63,'Mónica Salazar','3556667788','Cl 55 #14-17, Bucaramanga'),(64,'Felipe Ávila','3567778899','Cl 8 #15-90, Cúcuta'),(65,'Daniel Restrepo','3578889900','Av. Circunvalar #33-22, Pereira'),(66,'Tatiana Salas','3589990011','Cra 32 #22-44, Santa Marta'),(67,'Carlos Ramírez','3590001122','Cl 45 #10-33, Manizales'),(68,'Verónica Gil','3601112233','Cra 25 #15-12, Bogotá'),(69,'Sebastián Duarte','3612223344','Cl 50 #7-23, Medellín'),(70,'Liliana Fonseca','3623334455','Cra 6 #11-28, Cali'),(71,'Manuel Pardo','3634445566','Cl 77 #12-45, Barranquilla'),(72,'Catalina Barrios','3645556677','Cra 9 #33-17, Cartagena'),(73,'Alexander Muñoz','3656667788','Cl 22 #8-29, Bucaramanga'),(74,'Marisol Gálvez','3667778899','Cra 43 #11-20, Cúcuta'),(75,'Óscar Pérez','3678889900','Cl 16 #22-15, Pereira'),(76,'Sandra Molina','3689990011','Cra 12 #14-33, Santa Marta'),(77,'Héctor Valdés','3690001122','Av. Panamericana #45-32, Manizales'),(78,'Natalia Rincón','3701112233','Cra 7 #66-45, Bogotá'),(79,'Cristian López','3712223344','Cl 88 #10-17, Medellín'),(80,'Daniela Torres','3723334455','Cra 22 #20-44, Cali'),(81,'Andrés Gallo','3734445566','Cl 40 #30-21, Barranquilla'),(82,'Paula Ochoa','3745556677','Cra 8 #25-22, Cartagena'),(83,'Miguel Ángel Ruiz','3756667788','Cl 70 #9-55, Bucaramanga'),(84,'Camila Pineda','3767778899','Cra 19 #22-66, Cúcuta'),(85,'Jorge Cáceres','3778889900','Cl 44 #17-28, Pereira'),(86,'María José Silva','3789990011','Cra 12 #56-20, Santa Marta'),(87,'Felipe González','3790001122','Cl 25 #10-16, Manizales'),(88,'Claudia Rivera','3801112233','Cra 20 #33-90, Bogotá'),(89,'David Cabrera','3812223344','Cl 8 #12-15, Medellín'),(90,'Viviana Correa','3823334455','Cra 7 #40-32, Cali'),(91,'Ricardo Salazar','3834445566','Cl 66 #20-11, Barranquilla'),(92,'Estefanía Gómez','3845556677','Cra 22 #19-14, Cartagena'),(93,'Mauricio Delgado','3856667788','Cl 77 #11-45, Bucaramanga'),(94,'Tatiana Méndez','3867778899','Cra 14 #13-10, Cúcuta'),(95,'Nicolás Vargas','3878889900','Cl 55 #8-19, Pereira'),(96,'Valentina Becerra','3889990011','Cra 6 #18-12, Santa Marta'),(97,'Carlos Ospina','3890001122','Cl 32 #5-18, Manizales'),(98,'Andrea Bonilla','3901112233','Cra 12 #34-20, Bogotá'),(99,'Fernando Morales','3912223344','Cl 18 #9-12, Medellín'),(100,'Diana Ávila','3923334455','Cra 50 #23-11, Cali'),(101,'Julio César Marín','3934445566','Cl 77 #16-21, Barranquilla'),(102,'Carolina López','3945556677','Cra 21 #9-22, Cartagena'),(103,'Pedro Castillo','3956667788','Cl 66 #11-10, Bucaramanga'),(104,'Isabel García','3967778899','Cra 32 #10-17, Cúcuta'),(105,'Cristina Méndez','3978889900','Cl 8 #14-44, Pereira'),(106,'Óscar Gaitán','3989990011','Cra 44 #23-12, Santa Marta'),(107,'Patricia Flórez','3990001122','Cl 22 #19-16, Manizales');
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
INSERT INTO `payments` VALUES (6,6,120000.00,'2025-05-01'),(7,7,80000.00,'2025-05-02'),(8,8,150000.00,'2025-05-03'),(9,9,95000.00,'2025-05-04'),(10,10,110000.00,'2025-05-05'),(11,11,175000.00,'2025-05-06'),(12,12,60000.00,'2025-05-07'),(13,13,135000.00,'2025-05-08'),(14,14,125000.00,'2025-05-09'),(15,15,100000.00,'2025-05-10'),(16,16,145000.00,'2025-05-11'),(17,17,90000.00,'2025-05-12'),(18,18,160000.00,'2025-05-13'),(19,19,70000.00,'2025-05-14'),(20,20,105000.00,'2025-05-15'),(21,21,130000.00,'2025-05-16'),(22,22,155000.00,'2025-05-17'),(23,23,98000.00,'2025-05-18'),(24,24,102000.00,'2025-05-19'),(25,25,119000.00,'2025-05-20'),(26,26,125000.00,'2025-05-21'),(27,27,89000.00,'2025-05-22'),(28,28,135000.00,'2025-05-23'),(29,29,160000.00,'2025-05-24'),(30,30,140000.00,'2025-05-25'),(31,31,175000.00,'2025-05-26'),(32,32,195000.00,'2025-05-27'),(33,33,125000.00,'2025-05-28'),(34,34,105000.00,'2025-05-29'),(35,35,92000.00,'2025-05-30'),(36,36,185000.00,'2025-05-31'),(37,37,115000.00,'2025-06-01'),(38,38,142000.00,'2025-06-02'),(39,39,135000.00,'2025-06-03'),(40,40,98000.00,'2025-06-04'),(41,41,125000.00,'2025-06-05'),(42,42,132000.00,'2025-06-06'),(43,43,165000.00,'2025-06-07'),(44,44,108000.00,'2025-06-08'),(45,45,155000.00,'2025-06-09'),(46,46,140000.00,'2025-06-10'),(47,47,175000.00,'2025-06-11'),(48,48,99000.00,'2025-06-12'),(49,49,122000.00,'2025-06-13'),(50,50,195000.00,'2025-06-14'),(51,51,95000.00,'2025-06-15'),(52,52,118000.00,'2025-06-16'),(53,53,170000.00,'2025-06-17'),(54,54,150000.00,'2025-06-18'),(55,55,89000.00,'2025-06-19'),(56,56,110000.00,'2025-06-20'),(57,57,135000.00,'2025-06-21'),(58,58,98000.00,'2025-06-22'),(59,59,145000.00,'2025-06-23'),(60,60,125000.00,'2025-06-24'),(61,61,172000.00,'2025-06-25'),(62,62,105000.00,'2025-06-26'),(63,63,149000.00,'2025-06-27'),(64,64,160000.00,'2025-06-28'),(65,65,120000.00,'2025-06-29'),(66,66,175000.00,'2025-06-30'),(67,67,94000.00,'2025-07-01'),(68,68,155000.00,'2025-07-02'),(69,69,128000.00,'2025-07-03'),(70,70,110000.00,'2025-07-04'),(71,71,180000.00,'2025-07-05'),(72,72,115000.00,'2025-07-06'),(73,73,165000.00,'2025-07-07'),(74,74,99000.00,'2025-07-08'),(75,75,150000.00,'2025-07-09'),(76,76,132000.00,'2025-07-10'),(77,77,105000.00,'2025-07-11'),(78,78,185000.00,'2025-07-12'),(79,79,118000.00,'2025-07-13'),(80,80,135000.00,'2025-07-14'),(81,81,145000.00,'2025-07-15'),(82,82,122000.00,'2025-07-16'),(83,83,160000.00,'2025-07-17'),(84,84,125000.00,'2025-07-18'),(85,85,175000.00,'2025-07-19'),(86,86,95000.00,'2025-07-20'),(87,87,140000.00,'2025-07-21'),(88,88,165000.00,'2025-07-22'),(89,89,132000.00,'2025-07-23'),(90,90,105000.00,'2025-07-24'),(91,91,180000.00,'2025-07-25'),(92,92,115000.00,'2025-07-26'),(93,93,125000.00,'2025-07-27'),(94,94,175000.00,'2025-07-28'),(95,95,98000.00,'2025-07-29'),(96,96,155000.00,'2025-07-30'),(97,97,135000.00,'2025-07-31'),(98,98,125000.00,'2025-08-01'),(99,99,145000.00,'2025-08-02'),(100,100,172000.00,'2025-08-03'),(101,101,160000.00,'2025-08-04'),(102,102,118000.00,'2025-08-05'),(103,103,150000.00,'2025-08-06'),(104,104,175000.00,'2025-08-07'),(105,105,99000.00,'2025-08-08');
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
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pets`
--

LOCK TABLES `pets` WRITE;
/*!40000 ALTER TABLE `pets` DISABLE KEYS */;
INSERT INTO `pets` VALUES (6,'Max','Perro','Labrador Retriever',3,7),(7,'Luna','Gato','Persa',2,8),(8,'Rocky','Perro','Bulldog',4,9),(9,'Milo','Gato','Siamés',1,10),(10,'Toby','Perro','Beagle',5,11),(11,'Nala','Gato','Maine Coon',2,12),(12,'Simba','Perro','Golden Retriever',3,13),(13,'Coco','Gato','Bengalí',2,14),(14,'Bruno','Perro','Pastor Alemán',6,15),(15,'Mia','Gato','Esfinge',1,16),(16,'Zeus','Perro','Rottweiler',4,17),(17,'Kira','Gato','Angora',3,18),(18,'Chester','Perro','Pug',2,19),(19,'Tom','Gato','Común Europeo',5,20),(20,'Bobby','Perro','Dálmata',4,21),(21,'Pelusa','Gato','Persa',2,22),(22,'Balto','Perro','Husky Siberiano',3,23),(23,'Fiona','Gato','Siberiano',4,24),(24,'Jack','Perro','Boxer',2,25),(25,'Lola','Gato','Ragdoll',3,26),(26,'Apolo','Perro','Doberman',5,27),(27,'Chispa','Gato','Bombay',1,28),(28,'Firulais','Perro','Criollo',4,29),(29,'Kitty','Gato','Siamés',2,30),(30,'Sasha','Perro','Shih Tzu',3,31),(31,'Greta','Gato','Birmano',2,32),(32,'Lucas','Perro','Cocker Spaniel',4,33),(33,'Nube','Gato','Exótico',1,34),(34,'Thor','Perro','Pitbull',5,35),(35,'Katy','Gato','Balinés',3,36),(36,'Lucky','Perro','Chihuahua',2,37),(37,'Mushu','Gato','Común',1,38),(38,'Scooby','Perro','Gran Danés',6,39),(39,'Daisy','Gato','Siamés',4,40),(40,'Rex','Perro','Bulldog Francés',3,41),(41,'Olivia','Gato','Angora',2,42),(42,'Leo','Perro','Border Collie',5,43),(43,'Molly','Gato','Persa',2,44),(44,'Kyra','Perro','Shar Pei',4,45),(45,'Candy','Gato','Común',3,46),(46,'Hércules','Perro','Husky',3,47),(47,'Kiko','Gato','Bombay',2,48),(48,'Rocco','Perro','Labrador',5,49),(49,'Gala','Gato','Persa',1,50),(50,'Duke','Perro','Pastor Belga',6,51),(51,'Tina','Gato','Siberiano',2,52),(52,'Oso','Perro','San Bernardo',4,53),(53,'Cleo','Gato','Ragdoll',3,54),(54,'Axel','Perro','Doberman',2,55),(55,'Chanel','Gato','Angora',4,56),(56,'Fido','Perro','Poodle',3,57),(57,'Momo','Gato','Bengalí',2,58),(58,'Sultán','Perro','Criollo',4,59),(59,'Kiara','Gato','Común',1,60),(60,'Tommy','Perro','Fox Terrier',3,61),(61,'Bella','Gato','Persa',2,62),(62,'Spike','Perro','Bulldog Inglés',5,63),(63,'Luz','Gato','Siamés',3,64),(64,'Rambo','Perro','Pitbull',2,65),(65,'Atenea','Gato','Ragdoll',4,66),(66,'Brandy','Perro','Golden Retriever',3,67),(67,'Pecas','Gato','Siberiano',2,68),(68,'Zephyr','Perro','Beagle',5,69),(69,'Nina','Gato','Angora',1,70),(70,'Flash','Perro','Husky',4,71),(71,'Perla','Gato','Común',3,72),(72,'Spike','Perro','Chow Chow',2,73),(73,'Maggie','Gato','Bombay',2,74),(74,'Shadow','Perro','Pastor Alemán',6,75),(75,'Lili','Gato','Persa',1,76),(76,'Otto','Perro','Boxer',3,77),(77,'Sami','Gato','Siamés',2,78),(78,'Hunter','Perro','Labrador',4,79),(79,'Nico','Gato','Común',1,80),(80,'Zara','Perro','Shih Tzu',3,81),(81,'Miel','Gato','Angora',2,82),(82,'Bingo','Perro','Criollo',5,83),(83,'Chispa','Gato','Bengalí',3,84),(84,'Kenai','Perro','Husky',2,85),(85,'Yara','Gato','Persa',4,86),(86,'Snoopy','Perro','Beagle',4,87),(87,'Nina','Gato','Bombay',3,88),(88,'Bolt','Perro','Pastor Alemán',5,89),(89,'Luna','Gato','Común',2,90),(90,'Otis','Perro','Bulldog',3,91),(91,'Estrella','Gato','Angora',1,92),(92,'Chester','Perro','Golden Retriever',6,93),(93,'Maya','Gato','Persa',2,94),(94,'Tango','Perro','Rottweiler',4,95),(95,'Nube','Gato','Siamés',3,96),(96,'Hugo','Perro','Pug',2,97),(97,'Susi','Gato','Común',1,98),(98,'Iron','Perro','Doberman',5,99),(99,'Kira','Gato','Ragdoll',2,100),(100,'Leo','Perro','Fox Terrier',3,101),(101,'Pacha','Gato','Bombay',2,102),(102,'Oscar','Perro','Criollo',4,103),(103,'Mimi','Gato','Angora',2,104),(104,'Blue','Perro','Husky',3,105),(105,'Lola','Gato','Persa',1,106);
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
-- Dumping routines for database 'Veterinary_DB'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_appointments_september` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_appointments_september`()
SELECT a.Id, p.Name AS Pet, v.Name AS Veterinarian, a.DateAppointment, a.Reason
FROM appointments a
JOIN pets p ON a.Pet_Id = p.Id
JOIN veterinarians v ON a.VeterinarianId = v.Id
WHERE a.DateAppointment BETWEEN '2025-09-01' AND '2025-09-30' ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_owner_pets` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_owner_pets`()
BEGIN
    SELECT o.Name AS Owner, p.Name AS Pet
    FROM owners o
    JOIN pets p ON o.Id = p.OwnerId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_veterinarians_surgery` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_veterinarians_surgery`()
SELECT v.Name, v.Specialization
FROM veterinarians v
WHERE v.Specialization = 'Cirugía' ;;
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

-- Dump completed on 2025-10-02  8:32:57
