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
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owners`
--

LOCK TABLES `owners` WRITE;
/*!40000 ALTER TABLE `owners` DISABLE KEYS */;
INSERT INTO `owners` VALUES (105,'Juan Pérez','3001112233','Calle 10 #5-20, Bogotá'),(106,'María Rodríguez','3012223344','Carrera 15 #8-40, Medellín'),(107,'Carlos Gómez','3023334455','Av. Santander 45-32, Cali'),(108,'Ana Martínez','3034445566','Calle 100 #20-15, Barranquilla'),(109,'Luis Fernández','3045556677','Cra 7 #32-45, Cartagena'),(110,'Laura Sánchez','3056667788','Cl 45 #18-12, Bucaramanga'),(111,'Andrés Ramírez','3067778899','Cl 12 #7-25, Cúcuta'),(112,'Paola Herrera','3078889900','Av. 30 de Agosto #25-40, Pereira'),(113,'Felipe Torres','3089990011','Cra 45 #32-11, Santa Marta'),(114,'Diana Castro','3090001122','Cl 22 #5-33, Manizales'),(115,'Sofía Ramírez','3101112233','Cra 12 #45-67, Bogotá'),(116,'Mateo Ríos','3112223344','Cl 89 #21-54, Medellín'),(117,'Valentina López','3123334455','Cra 23 #44-19, Cali'),(118,'Camilo Ortega','3134445566','Av. 4N #6-78, Barranquilla'),(119,'Isabella Moreno','3145556677','Cl 72 #19-28, Cartagena'),(120,'Sebastián Vargas','3156667788','Cra 45 #32-10, Bucaramanga'),(121,'Gabriela Cárdenas','3167778899','Cl 10 #25-34, Cúcuta'),(122,'Martín Silva','3178889900','Cl 8 #13-22, Pereira'),(123,'Juliana Mendoza','3189990011','Av. 5 #32-40, Santa Marta'),(124,'David Patiño','3190001122','Cra 1 #11-21, Manizales'),(125,'Natalia Torres','3201112233','Cl 67 #9-14, Bogotá'),(126,'Santiago Morales','3212223344','Cra 45 #65-22, Medellín'),(127,'Daniela Álvarez','3223334455','Av. Pasoancho #14-77, Cali'),(128,'Tomás González','3234445566','Cl 29 #8-45, Barranquilla'),(129,'Valeria Jiménez','3245556677','Cra 7 #56-23, Cartagena'),(130,'Samuel Rodríguez','3256667788','Cl 13 #3-17, Bucaramanga'),(131,'Mariana Romero','3267778899','Cra 16 #22-10, Cúcuta'),(132,'Diego Gutiérrez','3278889900','Av. Bolívar #40-21, Pereira'),(133,'Camila Hernández','3289990011','Cl 11 #12-44, Santa Marta'),(134,'Esteban Peña','3290001122','Cra 24 #30-11, Manizales'),(135,'Lucía Navarro','3301112233','Cl 100 #9-10, Bogotá'),(136,'Ricardo Mejía','3312223344','Cra 7 #55-19, Medellín'),(137,'Daniel Suárez','3323334455','Cl 34 #6-12, Cali'),(138,'Manuela León','3334445566','Av. Murillo #33-22, Barranquilla'),(139,'Cristian Rojas','3345556677','Cra 10 #27-44, Cartagena'),(140,'Alejandra Quiroz','3356667788','Cl 15 #4-30, Bucaramanga'),(141,'Andrés Castaño','3367778899','Cl 99 #10-20, Cúcuta'),(142,'Melissa Parra','3378889900','Cra 23 #32-16, Pereira'),(143,'Felipe Cifuentes','3389990011','Cl 17 #7-90, Santa Marta'),(144,'Valentina Beltrán','3390001122','Av. Colón #25-14, Manizales'),(145,'José Herrera','3401112233','Cl 40 #9-22, Bogotá'),(146,'Karen Lozano','3412223344','Cra 21 #33-11, Medellín'),(147,'Juan Esteban','3423334455','Cl 7 #14-44, Cali'),(148,'Laura Vargas','3434445566','Cra 45 #66-90, Barranquilla'),(149,'David Sánchez','3445556677','Cl 78 #11-22, Cartagena'),(150,'María Fernanda','3456667788','Cl 3 #7-56, Bucaramanga'),(151,'Nicolás Castillo','3467778899','Av. Libertadores #44-30, Cúcuta'),(152,'Sofía Duarte','3478889900','Cra 50 #40-20, Pereira'),(153,'Camilo Díaz','3489990011','Cl 60 #19-23, Santa Marta'),(154,'Sara Acosta','3490001122','Cl 32 #12-78, Manizales'),(155,'Kevin Ramos','3501112233','Cra 19 #5-15, Bogotá'),(156,'Ángela Bautista','3512223344','Cl 23 #8-60, Medellín'),(157,'Julián Córdoba','3523334455','Cra 50 #12-13, Cali'),(158,'Luisa Arango','3534445566','Cl 70 #20-19, Barranquilla'),(159,'Andrés Molina','3545556677','Cra 80 #25-11, Cartagena'),(160,'Mónica Salazar','3556667788','Cl 55 #14-17, Bucaramanga'),(161,'Felipe Ávila','3567778899','Cl 8 #15-90, Cúcuta'),(162,'Daniel Restrepo','3578889900','Av. Circunvalar #33-22, Pereira'),(163,'Tatiana Salas','3589990011','Cra 32 #22-44, Santa Marta'),(164,'Carlos Ramírez','3590001122','Cl 45 #10-33, Manizales'),(165,'Verónica Gil','3601112233','Cra 25 #15-12, Bogotá'),(166,'Sebastián Duarte','3612223344','Cl 50 #7-23, Medellín'),(167,'Liliana Fonseca','3623334455','Cra 6 #11-28, Cali'),(168,'Manuel Pardo','3634445566','Cl 77 #12-45, Barranquilla'),(169,'Catalina Barrios','3645556677','Cra 9 #33-17, Cartagena'),(170,'Alexander Muñoz','3656667788','Cl 22 #8-29, Bucaramanga'),(171,'Marisol Gálvez','3667778899','Cra 43 #11-20, Cúcuta'),(172,'Óscar Pérez','3678889900','Cl 16 #22-15, Pereira'),(173,'Sandra Molina','3689990011','Cra 12 #14-33, Santa Marta'),(174,'Héctor Valdés','3690001122','Av. Panamericana #45-32, Manizales'),(175,'Natalia Rincón','3701112233','Cra 7 #66-45, Bogotá'),(176,'Cristian López','3712223344','Cl 88 #10-17, Medellín'),(177,'Daniela Torres','3723334455','Cra 22 #20-44, Cali'),(178,'Andrés Gallo','3734445566','Cl 40 #30-21, Barranquilla'),(179,'Paula Ochoa','3745556677','Cra 8 #25-22, Cartagena'),(180,'Miguel Ángel Ruiz','3756667788','Cl 70 #9-55, Bucaramanga'),(181,'Camila Pineda','3767778899','Cra 19 #22-66, Cúcuta'),(182,'Jorge Cáceres','3778889900','Cl 44 #17-28, Pereira'),(183,'María José Silva','3789990011','Cra 12 #56-20, Santa Marta'),(184,'Felipe González','3790001122','Cl 25 #10-16, Manizales'),(185,'Claudia Rivera','3801112233','Cra 20 #33-90, Bogotá'),(186,'David Cabrera','3812223344','Cl 8 #12-15, Medellín'),(187,'Viviana Correa','3823334455','Cra 7 #40-32, Cali'),(188,'Ricardo Salazar','3834445566','Cl 66 #20-11, Barranquilla'),(189,'Estefanía Gómez','3845556677','Cra 22 #19-14, Cartagena'),(190,'Mauricio Delgado','3856667788','Cl 77 #11-45, Bucaramanga'),(191,'Tatiana Méndez','3867778899','Cra 14 #13-10, Cúcuta'),(192,'Nicolás Vargas','3878889900','Cl 55 #8-19, Pereira'),(193,'Valentina Becerra','3889990011','Cra 6 #18-12, Santa Marta'),(194,'Carlos Ospina','3890001122','Cl 32 #5-18, Manizales'),(195,'Andrea Bonilla','3901112233','Cra 12 #34-20, Bogotá'),(196,'Fernando Morales','3912223344','Cl 18 #9-12, Medellín'),(197,'Diana Ávila','3923334455','Cra 50 #23-11, Cali'),(198,'Julio César Marín','3934445566','Cl 77 #16-21, Barranquilla'),(199,'Carolina López','3945556677','Cra 21 #9-22, Cartagena'),(200,'Pedro Castillo','3956667788','Cl 66 #11-10, Bucaramanga'),(201,'Isabel García','3967778899','Cra 32 #10-17, Cúcuta'),(202,'Cristina Méndez','3978889900','Cl 8 #14-44, Pereira'),(203,'Óscar Gaitán','3989990011','Cra 44 #23-12, Santa Marta'),(204,'Patricia Flórez','3990001122','Cl 22 #19-16, Manizales');
/*!40000 ALTER TABLE `owners` ENABLE KEYS */;
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
