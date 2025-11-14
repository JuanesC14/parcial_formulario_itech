-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 14-11-2025 a las 18:34:37
-- Versión del servidor: 9.1.0
-- Versión de PHP: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `parcial_formulario_itech`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `areas_interes`
--

DROP TABLE IF EXISTS `areas_interes`;
CREATE TABLE IF NOT EXISTS `areas_interes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `areas_interes`
--

INSERT INTO `areas_interes` (`id`, `name`) VALUES
(6, 'Aplicaciones Móviles'),
(4, 'Bases de Datos'),
(7, 'Computación en la Nube'),
(1, 'Desarrollo Web'),
(5, 'DevOps'),
(2, 'Inteligencia Artificial'),
(3, 'Seguridad Informática');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `countries`
--

DROP TABLE IF EXISTS `countries`;
CREATE TABLE IF NOT EXISTS `countries` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(120) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `countries`
--

INSERT INTO `countries` (`id`, `name`) VALUES
(7, 'Belice'),
(2, 'Costa Rica'),
(5, 'El Salvador'),
(6, 'Guatemala'),
(4, 'Honduras'),
(3, 'Nicaragua'),
(1, 'Panamá');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscriptores`
--

DROP TABLE IF EXISTS `inscriptores`;
CREATE TABLE IF NOT EXISTS `inscriptores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `apellido` varchar(150) NOT NULL,
  `edad` int DEFAULT NULL,
  `sexo` enum('male','female','other') NOT NULL,
  `pais_residencia` varchar(120) NOT NULL,
  `nacionalidad` varchar(120) NOT NULL,
  `correo` varchar(255) NOT NULL,
  `celular` varchar(50) DEFAULT NULL,
  `intereses` json DEFAULT NULL,
  `observaciones` text,
  `fecha_formulario` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `inscriptores`
--

INSERT INTO `inscriptores` (`id`, `nombre`, `apellido`, `edad`, `sexo`, `pais_residencia`, `nacionalidad`, `correo`, `celular`, `intereses`, `observaciones`, `fecha_formulario`) VALUES
(1, 'Juan', 'Carrion', 22, 'male', 'Panamá', 'panameña', 'Juan@gmail.com', '67893456', '[\"Desarrollo Web\"]', 'Muy buen evento', '2025-11-14 12:14:05'),
(2, 'Juan', 'Carrion', NULL, 'male', 'Panamá', 'panameña', 'Juan@gmail.com', '67893450', '[\"Aplicaciones Móviles\", \"Desarrollo Web\", \"Inteligencia Artificial\"]', 'Muy buena la comida', '2025-11-14 13:08:11'),
(3, 'Marta', 'Lopez', NULL, 'female', 'Costa Rica', 'Costarisence', 'Marta@gmail.com', '69302345', '[\"Seguridad Informática\"]', 'Interesante', '2025-11-14 13:19:24');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
