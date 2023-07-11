CREATE DATABASE  IF NOT EXISTS `quizzi` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `quizzi`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: quizzi
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1,'Calculus and Anlytical Geometry',NULL),(2,'Multivariable Calculus',NULL),(3,'Applied Physics',NULL),(4,'Applied Physics - 2',NULL);
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrollments`
--

DROP TABLE IF EXISTS `enrollments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enrollments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `course_id` int NOT NULL,
  `level` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `enrollments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `enrollments_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrollments`
--

LOCK TABLES `enrollments` WRITE;
/*!40000 ALTER TABLE `enrollments` DISABLE KEYS */;
INSERT INTO `enrollments` VALUES (1,107,1,0),(3,107,4,0);
/*!40000 ALTER TABLE `enrollments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `question_text` varchar(255) NOT NULL,
  `correct_answer` varchar(255) NOT NULL,
  `wrong_answer_1` varchar(255) NOT NULL,
  `wrong_answer_2` varchar(255) NOT NULL,
  `wrong_answer_3` varchar(255) NOT NULL,
  `level` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (1,'What is the derivative of x^2?','2x','3x','x/2','x^2',1),(2,'What is the integral of 3x^2?','x^3','2x^2','3x','6x',2),(3,'What is the limit of (sin(x))/x as x approaches 0?','1','0','undefined','2',3),(4,'What is the derivative of e^x?','e^x','x^2','2x','e^(x^2)',1),(5,'What is the integral of 1/x?','ln(x)','x^2','e^x','1/(2x)',2),(6,'What is the limit of (1 - cos(x))/x as x approaches 0?','0','1','undefined','2',3),(7,'What is the derivative of ln(x)?','1/x','2x','e^x','x^2',1),(8,'What is the integral of e^x?','e^x','x^2','2x','e^(x^2)',2),(9,'What is the limit of (1 - sin(x))/x as x approaches 0?','0','1','undefined','2',3),(10,'What is the derivative of cos(x)?','-sin(x)','2x','e^x','x^2',1),(11,'What is the integral of sin(x)?','-cos(x)','x^2','e^x','cos(x^2)',2),(12,'What is the limit of (tan(x))/x as x approaches 0?','1','0','undefined','2',3),(13,'What is the derivative of tan(x)?','sec^2(x)','2x','e^x','x^2',1),(14,'What is the integral of cos(x)?','sin(x)','x^2','e^x','cos(x^2)',2),(15,'What is the limit of (1 - cos(x))/(x^2) as x approaches 0?','1/2','1','undefined','2',3),(16,'What is the derivative of sec(x)?','sec(x)tan(x)','2x','e^x','x^2',1),(17,'What is the integral of sec(x)?','ln|sec(x) + tan(x)|','x^2','e^x','sec(x^2)',2),(18,'What is the limit of (1 - cos(x))/(x^3) as x approaches 0?','1/6','1','undefined','2',3),(19,'What is the derivative of cot(x)?','-csc^2(x)','2x','e^x','x^2',1),(20,'What is the integral of csc(x)?','-ln|csc(x) + cot(x)|','x^2','e^x','csc(x^2)',2),(21,'What is the definition of a derivative?','The rate of change of a function at a given point','The integral of a function over an interval','The maximum value of a function','The sum of two functions',1),(22,'What is the chain rule used for?','To compute the derivative of a composite function','To find the integral of a function','To solve differential equations','To compute the limit of a function',2),(23,'What is the limit definition of a derivative?','lim(h → 0) [f(x + h) - f(x)]/h','lim(x → a) f(x)','lim(x → ∞) f(x)','lim(x → a) [f(x) - f(a)]/(x - a)',3),(24,'What is the formula for the derivative of a constant?','0','1','2','∞',1),(25,'What is the derivative of sin(x)?','cos(x)','sin(x)','tan(x)','sec(x)',2),(26,'What is the derivative of e^x?','e^x','ln(x)','x^2','1/x',2),(27,'What is the derivative of ln(x)?','1/x','x','e^x','cos(x)',2),(28,'What is the derivative of x^2?','2x','x^3','2/x','2',1),(29,'What is the derivative of a constant times a function?','The constant times the derivative of the function','The sum of the derivatives of the constant and the function','The derivative of the constant times the derivative of the function','The product of the constant and the function',2),(30,'What is the derivative of a sum of functions?','The sum of the derivatives of the functions','The product of the functions','The difference of the functions','The integral of the functions',1),(31,'What is the integral of a constant?','The constant times x','The derivative of the constant','The sum of the constant and x','The product of the constant and x',3),(32,'What is the integral of x^n?','x^(n+1)/(n+1)','nx^(n-1)','(1/n)x^n','(n+1)x^n',2),(33,'What is the integral of sin(x)?','-cos(x)','sin(x)','tan(x)','sec(x)',2),(34,'What is the integral of e^x?','e^x','ln(x)','x^2','1/x',2),(35,'What is the integral of 1/x?','ln|x|','1','x','cos(x)',2),(36,'What is the integral of a product of functions?','The product of the integrals of the functions','The sum of the integrals of the functions','The derivative of the product of the functions','The quotient of the integrals of the functions',2),(37,'What is the integral of a difference of functions?','The difference of the integrals of the functions','The product of the functions','The sum of the functions','The quotient of the functions',1),(38,'What is the fundamental theorem of calculus?','The derivative of the integral of a function is equal to the function itself','The integral of the derivative of a function is equal to the function itself','The sum of the derivatives of a function is equal to the integral of the function','The product of the derivatives of a function is equal to the integral of the function',1),(39,'What is the formula for the area of a rectangle?','Length × Width','Length + Width','2 × (Length + Width)','2 × Length × Width',3),(40,'What is the formula for the area of a circle?','π × Radius^2','2 × π × Radius','2 × π × Radius^2','π × Diameter',3),(41,'What is the formula for the volume of a cylinder?','π × Radius^2 × Height','2 × π × Radius × Height','π × Diameter × Height','2 × π × Radius × Diameter',3),(42,'Which of the following is an example of a vector quantity?','Velocity','Time','Temperature','Mass',1),(43,'The phenomenon of total internal reflection occurs when light travels from a medium of _________ to a medium of __________.','Low density','Higher refractive index','Lower refractive index','High density',1),(44,'Which of the following is NOT a type of electromagnetic radiation?','Sound waves','X-rays','Ultraviolet rays','Gamma rays',1),(45,'The SI unit of electric current is:','Ampere','Volt','Watt','Joule',1),(46,'Which of the following laws states that the pressure of a gas is inversely proportional to its volume at constant temperature?','Boyle\'s law','Newton\'s second law','Ohm\'s law','Archimedes\' principle',2),(47,'The rate of change of displacement with respect to time is known as:','Velocity','Acceleration','Momentum','Force',2),(48,'Which of the following statements about gravitational potential energy is correct?','It depends on both the mass and the height of the object','It depends on the mass of the object only','It depends on the height of the object only','It does not exist in reality',2),(49,'The process of a liquid changing into a vapor at a temperature below its boiling point is called:','Evaporation','Melting','Condensation','Sublimation',2),(50,'Which of the following is NOT a fundamental force of nature?','Nuclear force','Gravitational force','Electromagnetic force','Strong force',3),(51,'The phenomenon of splitting of light into its constituent colors is known as:','Dispersion','Reflection','Refraction','Diffraction',3),(52,'In which of the following devices is the photoelectric effect utilized?','Solar panels','Electric motors','Transformers','Thermometers',3),(53,'The power rating of an electrical appliance indicates:','The rate at which it converts electrical energy into other forms','The energy it consumes','The voltage it operates at','The resistance it possesses',3),(54,'Which of the following quantities remains constant in a projectile motion in the absence of air resistance?','Total mechanical energy','Velocity','Acceleration','Time of flight',4),(55,'The splitting of an atomic nucleus into two or more smaller nuclei is called:','Fission','Fusion','Emission','Decay',4),(56,'Which of the following is NOT a type of mechanical wave?','Light wave','Sound wave','Water wave','Seismic wave',4),(57,'The process of converting a solid directly into a gas without passing through the liquid state is called:','Sublimation','Melting','Evaporation','Condensation',4),(58,'The phenomenon of an object continuing to move in a straight line at a constant velocity in the absence of external forces is described by:','Newton\'s first law of motion','Newton\'s second law of motion','Newton\'s third law of motion','Archimedes\' principle',5),(59,'The temperature at which all molecular motion ceases is called:','Absolute zero','Boiling point','Freezing point','Melting point',5),(60,'The phenomenon of an electric current induced in a conductor due to a changing magnetic field is known as:','Induction','Conduction','Resistance','Capacitance',5),(61,'Which of the following statements about mirrors is correct?','Concave mirrors can produce both real and virtual images','Concave mirrors always produce virtual images','Convex mirrors always produce real images','Plane mirrors produce enlarged images',5),(62,'Which equation represents Faraday\'s law of electromagnetic induction?','E = -dφ/dt','F = ma','E = mc²','P = VI',1),(63,'What is the formula for the resonant frequency of an LC circuit?','f = 1 / (2π√(LC))','E = hf','V = IR','P = IV',1),(64,'Which law describes the force between two electric charges?','Coulomb\'s law','Newton\'s first law of motion','Ohm\'s law','Hooke\'s law',1),(65,'What is the formula for calculating the capacitance of a parallel-plate capacitor?','C = ε₀A / d','F = ma','V = IR','P = IV',2),(66,'What is the equation for the total resistance in a series circuit?','R_total = R₁ + R₂ + R₃ + ...','F = ma','E = mc²','P = IV',2),(67,'Which law describes the relationship between the electric current flowing through a conductor and the voltage across it?','Ohm\'s law','Newton\'s second law of motion','Boyle\'s law','Archimedes\' principle',2),(68,'Which formula is used to calculate the force experienced by a charged particle moving in a magnetic field?','F = qvB sin(θ)','E = hf','V = IR','P = IV',2),(69,'What is the formula for the wavelength of a particle with momentum?','λ = h / p','F = ma','E = mc²','P = IV',3),(70,'Which equation represents the relationship between energy and frequency of a photon?','E = hf','Coulomb\'s law','V = IR','P = IV',3),(71,'What is the formula for calculating the work done by a force acting on an object?','W = Fd cos(θ)','F = ma','E = mc²','P = IV',3),(72,'Which law describes the pressure of an ideal gas at constant temperature?','Boyle\'s law','Newton\'s third law of motion','Ohm\'s law','Hooke\'s law',3),(73,'What is the formula for calculating the speed of light in a medium?','v = c / n','F = ma','V = IR','P = IV',4),(74,'Which law describes the relationship between the intensity of light and the distance from the source?','Inverse square law','Coulomb\'s law','V = IR','P = IV',4),(75,'What is the equation for the force exerted by a magnetic field on a current-carrying wire?','F = BIL sin(θ)','E = hf','V = IR','P = IV',4),(76,'Which formula is used to calculate the de Broglie wavelength of a particle?','λ = h / p','F = ma','E = mc²','P = IV',4),(77,'What is the equation for the power dissipated in a resistor?','P = VI','F = ma','E = mc²','V = IR',5),(78,'Which law describes the change in entropy of a system?','Second law of thermodynamics','Newton\'s first law of motion','Boyle\'s law','Hooke\'s law',5),(79,'What is the formula for calculating the efficiency of a heat engine?','Efficiency = (W/Q_H) x 100%','F = ma','E = mc²','P = IV',5),(80,'Which equation represents the time dilation effect in special relativity?','Δt\' = Δt / √(1 - (v²/c²))','Coulomb\'s law','V = IR','P = IV',5),(81,'What is the formula for calculating the force experienced by a charged particle in an electric field?','F = qE','F = ma','E = mc²','P = IV',5);
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_attempts`
--

DROP TABLE IF EXISTS `quiz_attempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz_attempts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `quiz_id` int NOT NULL,
  `attempt_datetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `score` int NOT NULL,
  `wrong_questions` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `user_id` (`user_id`),
  KEY `quiz_id` (`quiz_id`),
  CONSTRAINT `quiz_attempts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `quiz_attempts_ibfk_2` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_attempts`
--

LOCK TABLES `quiz_attempts` WRITE;
/*!40000 ALTER TABLE `quiz_attempts` DISABLE KEYS */;
INSERT INTO `quiz_attempts` VALUES (1,107,2,'2023-07-01 00:31:18',1,'2,3');
/*!40000 ALTER TABLE `quiz_attempts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_questions`
--

DROP TABLE IF EXISTS `quiz_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz_questions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quiz_id` int NOT NULL,
  `question_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `quiz_id` (`quiz_id`),
  KEY `question_id` (`question_id`),
  CONSTRAINT `quiz_questions_ibfk_1` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`),
  CONSTRAINT `quiz_questions_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_questions`
--

LOCK TABLES `quiz_questions` WRITE;
/*!40000 ALTER TABLE `quiz_questions` DISABLE KEYS */;
INSERT INTO `quiz_questions` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,2,5),(6,2,6),(7,2,7),(8,2,8),(9,3,9),(10,3,10),(11,3,11),(12,3,12),(13,4,13),(14,4,14),(15,4,15),(16,4,16),(17,5,17),(18,5,18),(19,5,19),(20,5,20);
/*!40000 ALTER TABLE `quiz_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quizzes`
--

DROP TABLE IF EXISTS `quizzes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quizzes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `course_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `quizzes_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quizzes`
--

LOCK TABLES `quizzes` WRITE;
/*!40000 ALTER TABLE `quizzes` DISABLE KEYS */;
INSERT INTO `quizzes` VALUES (1,1,'Chapter 1','2023-06-23 02:57:05'),(2,1,'Chapter 2','2023-07-01 00:30:34'),(3,1,'Chapter 3','2023-07-01 04:24:00'),(4,1,'Chapter 4','2023-07-01 04:24:00'),(5,1,'Chapter 5','2023-07-01 04:25:04');
/*!40000 ALTER TABLE `quizzes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (107,'John Doe','john@gmail.com','$2a$10$j.xULXkkv/d.p3yIJ2L7Gu0GS1N3O4rFDWZ34qQbuIRJxskrl6kD.');
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

-- Dump completed on 2023-07-02 11:47:03
