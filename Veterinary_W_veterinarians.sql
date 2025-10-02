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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-02  8:37:27
