-- tablas.sql
CREATE DATABASE IF NOT EXISTS parcial_formulario_itech CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE parcial_formulario_itech;

-- tabla de países 
CREATE TABLE IF NOT EXISTS countries (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(120) NOT NULL UNIQUE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- tabla de áreas de interés
CREATE TABLE IF NOT EXISTS areas_interes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(150) NOT NULL UNIQUE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- tabla principal inscriptores
CREATE TABLE IF NOT EXISTS inscriptores (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(150) NOT NULL,
  apellido VARCHAR(150) NOT NULL,
  edad INT NULL,
  sexo ENUM('male','female','other') NOT NULL,
  pais_residencia VARCHAR(120) NOT NULL,
  nacionalidad VARCHAR(120) NOT NULL,
  correo VARCHAR(255) NOT NULL,
  celular VARCHAR(50),
  intereses JSON NULL,
  observaciones TEXT NULL,
  fecha_formulario DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- países
INSERT INTO countries (name) VALUES
('Panamá'),
('Costa Rica'),
('Nicaragua'),
('Honduras'),
('El Salvador'),
('Guatemala'),
('Belice');

-- áreas iniciales
INSERT INTO areas_interes (name) VALUES
('Desarrollo Web'),
('Inteligencia Artificial'),
('Seguridad Informática'),
('Bases de Datos'),
('DevOps'),
('Aplicaciones Móviles'),
('Computación en la Nube');
