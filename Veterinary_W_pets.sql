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
-- Table structure for table `pets`
--

DROP TABLE IF EXISTS `pets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Species` varchar(50) NOT NULL,
  `Breed` varchar(50) NOT NULL,
  `Age` int NOT NULL,
  `OwnerId` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pets_owners` (`OwnerId`),
  CONSTRAINT `fk_pets_owners` FOREIGN KEY (`OwnerId`) REFERENCES `owners` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=530 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pets`
--

LOCK TABLES `pets` WRITE;
/*!40000 ALTER TABLE `pets` DISABLE KEYS */;
INSERT INTO `pets` VALUES (430,'Max','Perro','Labrador Retriever',3,105),(431,'Luna','Gato','Persa',2,106),(432,'Rocky','Perro','Bulldog',4,107),(433,'Milo','Gato','Siamés',1,108),(434,'Toby','Perro','Beagle',5,109),(435,'Nala','Gato','Maine Coon',2,110),(436,'Simba','Perro','Golden Retriever',3,111),(437,'Coco','Gato','Bengalí',2,112),(438,'Bruno','Perro','Pastor Alemán',6,113),(439,'Mia','Gato','Esfinge',1,114),(440,'Zeus','Perro','Rottweiler',4,115),(441,'Kira','Gato','Angora',3,116),(442,'Chester','Perro','Pug',2,117),(443,'Tom','Gato','Común Europeo',5,118),(444,'Bobby','Perro','Dálmata',4,119),(445,'Pelusa','Gato','Persa',2,120),(446,'Balto','Perro','Husky Siberiano',3,121),(447,'Fiona','Gato','Siberiano',4,122),(448,'Jack','Perro','Boxer',2,123),(449,'Lola','Gato','Ragdoll',3,124),(450,'Apolo','Perro','Doberman',5,125),(451,'Chispa','Gato','Bombay',1,126),(452,'Firulais','Perro','Criollo',4,127),(453,'Kitty','Gato','Siamés',2,128),(454,'Sasha','Perro','Shih Tzu',3,129),(455,'Greta','Gato','Birmano',2,130),(456,'Lucas','Perro','Cocker Spaniel',4,131),(457,'Nube','Gato','Exótico',1,132),(458,'Thor','Perro','Pitbull',5,133),(459,'Katy','Gato','Balinés',3,134),(460,'Lucky','Perro','Chihuahua',2,135),(461,'Mushu','Gato','Común',1,136),(462,'Scooby','Perro','Gran Danés',6,137),(463,'Daisy','Gato','Siamés',4,138),(464,'Rex','Perro','Bulldog Francés',3,139),(465,'Olivia','Gato','Angora',2,140),(466,'Leo','Perro','Border Collie',5,141),(467,'Molly','Gato','Persa',2,142),(468,'Kyra','Perro','Shar Pei',4,143),(469,'Candy','Gato','Común',3,144),(470,'Hércules','Perro','Husky',3,145),(471,'Kiko','Gato','Bombay',2,146),(472,'Rocco','Perro','Labrador',5,147),(473,'Gala','Gato','Persa',1,148),(474,'Duke','Perro','Pastor Belga',6,149),(475,'Tina','Gato','Siberiano',2,150),(476,'Oso','Perro','San Bernardo',4,151),(477,'Cleo','Gato','Ragdoll',3,152),(478,'Axel','Perro','Doberman',2,153),(479,'Chanel','Gato','Angora',4,154),(480,'Fido','Perro','Poodle',3,155),(481,'Momo','Gato','Bengalí',2,156),(482,'Sultán','Perro','Criollo',4,157),(483,'Kiara','Gato','Común',1,158),(484,'Tommy','Perro','Fox Terrier',3,159),(485,'Bella','Gato','Persa',2,160),(486,'Spike','Perro','Bulldog Inglés',5,161),(487,'Luz','Gato','Siamés',3,162),(488,'Rambo','Perro','Pitbull',2,163),(489,'Atenea','Gato','Ragdoll',4,164),(490,'Brandy','Perro','Golden Retriever',3,165),(491,'Pecas','Gato','Siberiano',2,166),(492,'Zephyr','Perro','Beagle',5,167),(493,'Nina','Gato','Angora',1,168),(494,'Flash','Perro','Husky',4,169),(495,'Perla','Gato','Común',3,170),(496,'Spike','Perro','Chow Chow',2,171),(497,'Maggie','Gato','Bombay',2,172),(498,'Shadow','Perro','Pastor Alemán',6,173),(499,'Lili','Gato','Persa',1,174),(500,'Otto','Perro','Boxer',3,175),(501,'Sami','Gato','Siamés',2,176),(502,'Hunter','Perro','Labrador',4,177),(503,'Nico','Gato','Común',1,178),(504,'Zara','Perro','Shih Tzu',3,179),(505,'Miel','Gato','Angora',2,180),(506,'Bingo','Perro','Criollo',5,181),(507,'Chispa','Gato','Bengalí',3,182),(508,'Kenai','Perro','Husky',2,183),(509,'Yara','Gato','Persa',4,184),(510,'Snoopy','Perro','Beagle',4,185),(511,'Nina','Gato','Bombay',3,186),(512,'Bolt','Perro','Pastor Alemán',5,187),(513,'Luna','Gato','Común',2,188),(514,'Otis','Perro','Bulldog',3,189),(515,'Estrella','Gato','Angora',1,190),(516,'Chester','Perro','Golden Retriever',6,191),(517,'Maya','Gato','Persa',2,192),(518,'Tango','Perro','Rottweiler',4,193),(519,'Nube','Gato','Siamés',3,194),(520,'Hugo','Perro','Pug',2,195),(521,'Susi','Gato','Común',1,196),(522,'Iron','Perro','Doberman',5,197),(523,'Kira','Gato','Ragdoll',2,198),(524,'Leo','Perro','Fox Terrier',3,199),(525,'Pacha','Gato','Bombay',2,200),(526,'Oscar','Perro','Criollo',4,201),(527,'Mimi','Gato','Angora',2,202),(528,'Blue','Perro','Husky',3,203),(529,'Lola','Gato','Persa',1,204);
/*!40000 ALTER TABLE `pets` ENABLE KEYS */;
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
