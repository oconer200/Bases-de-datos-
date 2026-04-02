-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.4.7 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.16.0.7229
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para agcontrol
CREATE DATABASE IF NOT EXISTS `agcontrol` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `agcontrol`;

-- Volcando estructura para tabla agcontrol.almacenes
CREATE TABLE IF NOT EXISTS `almacenes` (
  `id_almacen` int NOT NULL,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ubicacion` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_almacen`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla agcontrol.almacenes: 10 rows
INSERT IGNORE INTO `almacenes` (`id_almacen`, `nombre`, `ubicacion`) VALUES
	(1, 'Bodega Central', 'B100'),
	(2, 'Bodega Central', 'A900'),
	(3, 'Bodega Central', 'A700'),
	(4, 'Bodega Central', 'A800'),
	(5, 'Bodega Central', 'A600'),
	(6, 'Bodega Central', 'A500'),
	(7, 'Bodega Central', 'A400'),
	(8, 'Bodega Central', 'A100'),
	(9, 'Bodega Central', 'A300'),
	(10, 'Bodega Central', 'A200');

-- Volcando estructura para tabla agcontrol.analisis_suelo
CREATE TABLE IF NOT EXISTS `analisis_suelo` (
  `AnalisisID` int NOT NULL AUTO_INCREMENT,
  `ParcelaID` int NOT NULL,
  `FechaMuestreo` date DEFAULT NULL,
  `pH` decimal(4,2) DEFAULT NULL,
  `NutrienteN` decimal(10,2) DEFAULT NULL,
  `NutrienteP` decimal(10,2) DEFAULT NULL,
  `NutrienteK` decimal(10,2) DEFAULT NULL,
  `MateriaOrganica` decimal(10,2) DEFAULT NULL,
  `ConductividadElectrica` decimal(10,2) DEFAULT NULL,
  `Laboratorio` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Recomendaciones` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`AnalisisID`),
  KEY `ParcelaID` (`ParcelaID`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla agcontrol.analisis_suelo: 10 rows
INSERT IGNORE INTO `analisis_suelo` (`AnalisisID`, `ParcelaID`, `FechaMuestreo`, `pH`, `NutrienteN`, `NutrienteP`, `NutrienteK`, `MateriaOrganica`, `ConductividadElectrica`, `Laboratorio`, `Recomendaciones`) VALUES
	(1, 1, '2025-02-01', 6.50, 45.00, 20.00, 30.00, 3.20, 1.50, 'AgroLab Medellín', 'Aplicar fertilizante nitrogenado'),
	(2, 2, '2025-02-05', 5.80, 30.00, 15.00, 25.00, 2.80, 1.20, 'AgroLab Cali', 'Corregir acidez con cal agrícola'),
	(3, 3, '2025-02-10', 6.20, 40.00, 18.00, 28.00, 3.00, 1.40, 'AgroLab Bogotá', 'Aplicar fósforo'),
	(4, 4, '2025-02-15', 6.80, 50.00, 22.00, 35.00, 3.50, 1.60, 'AgroLab Manizales', 'Buen balance, mantener manejo'),
	(5, 5, '2025-02-20', 5.50, 25.00, 12.00, 20.00, 2.50, 1.10, 'AgroLab Pereira', 'Aumentar materia orgánica'),
	(6, 6, '2025-02-25', 6.00, 35.00, 17.00, 27.00, 2.90, 1.30, 'AgroLab Tunja', 'Aplicar potasio'),
	(7, 7, '2025-03-01', 6.40, 42.00, 19.00, 29.00, 3.10, 1.50, 'AgroLab Medellín', 'Mantener fertilización balanceada'),
	(8, 8, '2025-03-05', 5.90, 28.00, 14.00, 22.00, 2.70, 1.20, 'AgroLab Cali', 'Aplicar cal y compost'),
	(9, 9, '2025-03-10', 6.60, 48.00, 21.00, 33.00, 3.40, 1.60, 'AgroLab Bogotá', 'Condiciones óptimas'),
	(10, 10, '2025-03-15', 6.10, 36.00, 16.00, 26.00, 3.00, 1.40, 'AgroLab Manizales', 'Reforzar nitrógeno y fósforo');

-- Volcando estructura para tabla agcontrol.area
CREATE TABLE IF NOT EXISTS `area` (
  `AreaID` int NOT NULL AUTO_INCREMENT,
  `NombreArea` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`AreaID`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla agcontrol.area: 10 rows
INSERT IGNORE INTO `area` (`AreaID`, `NombreArea`) VALUES
	(1, 'Cultivos'),
	(2, 'Riego'),
	(3, 'Mantenimiento'),
	(4, 'Cosecha'),
	(5, 'Logística'),
	(6, 'Ventas'),
	(7, 'Almacén'),
	(8, 'Calidad'),
	(9, 'Administración'),
	(10, 'Investigación');

-- Volcando estructura para tabla agcontrol.asignaciones
CREATE TABLE IF NOT EXISTS `asignaciones` (
  `id_asignacion` int NOT NULL,
  `fecha` date DEFAULT NULL,
  `horas` int DEFAULT NULL,
  `dni_empleado` int DEFAULT NULL,
  `id_parcela` int DEFAULT NULL,
  `id_tarea` int DEFAULT NULL,
  `Observaciones` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id_asignacion`),
  KEY `dni_empleado` (`dni_empleado`),
  KEY `id_parcela` (`id_parcela`),
  KEY `id_tarea` (`id_tarea`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla agcontrol.asignaciones: 10 rows
INSERT IGNORE INTO `asignaciones` (`id_asignacion`, `fecha`, `horas`, `dni_empleado`, `id_parcela`, `id_tarea`, `Observaciones`) VALUES
	(1, '2024-03-01', 8, 1, 1, 1, 'Condiciones óptimas'),
	(2, '2024-03-02', 8, 2, 2, 2, 'Se rego el cultivo'),
	(3, '2024-03-15', 6, 3, 3, 3, 'Cambio de aceite'),
	(4, '2024-04-01', 8, 4, 3, 6, 'Buen rendimiento'),
	(5, '2024-05-01', 4, 5, 5, 5, 'Entrega a bodega'),
	(6, '2024-06-15', 10, 6, 6, 6, 'Cliente satisfecho'),
	(7, '2024-07-01', 8, 7, 7, 7, 'Stock actualizado'),
	(8, '2024-08-01', 10, 8, 8, 8, 'Producto excelente'),
	(9, '2024-09-01', 8, 9, 9, 9, 'Revisión contratos'),
	(10, '2024-10-01', 8, 10, 10, 10, 'Prueba de fertilizantes');

-- Volcando estructura para tabla agcontrol.calidades
CREATE TABLE IF NOT EXISTS `calidades` (
  `id_calidad` int NOT NULL,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_calidad`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla agcontrol.calidades: 10 rows
INSERT IGNORE INTO `calidades` (`id_calidad`, `nombre`) VALUES
	(1, 'Premium (Exportación)'),
	(2, 'Primera'),
	(3, 'Segunda'),
	(4, 'Industrial'),
	(5, 'Para Semilla'),
	(6, 'Orgánica Certificada'),
	(7, 'Procesada'),
	(8, 'Procesada'),
	(9, 'Granel'),
	(10, 'Maduración Media');

-- Volcando estructura para tabla agcontrol.clientes
CREATE TABLE IF NOT EXISTS `clientes` (
  `ClienteID` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RUC_DNI` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DireccionFiscal` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Telefono` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LineaCredito` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`ClienteID`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla agcontrol.clientes: 10 rows
INSERT IGNORE INTO `clientes` (`ClienteID`, `Nombre`, `RUC_DNI`, `DireccionFiscal`, `Telefono`, `Email`, `LineaCredito`) VALUES
	(1, 'Supermercado Éxito', '800123456', 'Medellín', '3101111111', 'compras@exito.com', 50000000.00),
	(2, 'Almacenes Olímpica', '800234567', 'Barranquilla', '3102222222', 'ventas@olimpica.com', 40000000.00),
	(3, 'Carulla S.A.', '800345678', 'Bogotá', '3103333333', 'contacto@carulla.com', 30000000.00),
	(4, 'Makro Colombia', '800456789', 'Cali', '3104444444', 'compras@makro.com', 60000000.00),
	(5, 'Jumbo', '800567890', 'Bogotá', '3105555555', 'ventas@jumbo.com', 35000000.00),
	(6, 'Tiendas D1', '800678901', 'Medellín', '3106666666', 'compras@d1.com', 25000000.00),
	(7, 'Ara', '800789012', 'Cali', '3107777777', 'ventas@ara.com', 20000000.00),
	(8, 'La Vaquita', '800890123', 'Tunja', '3108888888', 'contacto@lavaquita.com', 15000000.00),
	(9, 'Surtimax', '800901234', 'Manizales', '3109999999', 'ventas@surtimax.com', 18000000.00),
	(10, 'Colsubsidio', '801012345', 'Bogotá', '3110000000', 'compras@colsubsidio.com', 22000000.00);

-- Volcando estructura para tabla agcontrol.cosechas
CREATE TABLE IF NOT EXISTS `cosechas` (
  `id_cosecha` int NOT NULL,
  `fecha_ini` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `id_siembra` int DEFAULT NULL,
  `id_metodo_cosecha` int DEFAULT NULL,
  `id_calidad` int DEFAULT NULL,
  PRIMARY KEY (`id_cosecha`),
  KEY `id_siembra` (`id_siembra`),
  KEY `id_metodo_cosecha` (`id_metodo_cosecha`),
  KEY `id_calidad` (`id_calidad`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla agcontrol.cosechas: 10 rows
INSERT IGNORE INTO `cosechas` (`id_cosecha`, `fecha_ini`, `fecha_fin`, `cantidad`, `id_siembra`, `id_metodo_cosecha`, `id_calidad`) VALUES
	(1, '2024-03-01', '2024-07-01', 12000, 1, 2, 1),
	(2, '2024-02-15', '2024-06-15', 8000, 2, 1, 2),
	(3, '2024-04-10', '2024-08-20', 15000, 3, 6, 3),
	(4, '2024-03-20', '2024-08-01', 25000, 4, 5, 1),
	(5, '2024-01-30', '2024-08-10', 2000, 5, 3, 1),
	(6, '2024-02-05', '2024-10-15', 10000, 6, 2, 2),
	(7, '2024-03-25', '2024-09-30', 5000, 7, 1, 1),
	(8, '2024-01-10', '2024-10-05', 6000, 8, 1, 2),
	(9, '2024-02-28', '2024-10-10', 3000, 9, 3, 2),
	(10, '2024-03-15', '2024-11-01', 7000, 10, 8, 1);

-- Volcando estructura para tabla agcontrol.cultivos
CREATE TABLE IF NOT EXISTS `cultivos` (
  `id_cultivo` int NOT NULL,
  `nombre_comun` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nombre_cientifico` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tiempo_crecimiento` int DEFAULT NULL,
  `agua_requerida` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TempOptima` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`id_cultivo`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla agcontrol.cultivos: 10 rows
INSERT IGNORE INTO `cultivos` (`id_cultivo`, `nombre_comun`, `nombre_cientifico`, `tiempo_crecimiento`, `agua_requerida`, `TempOptima`) VALUES
	(1, 'Maíz', 'Zea mays', 120, '500mm', 20.00),
	(2, 'Trigo', 'Triticum', 150, '200mm', 18.00),
	(3, 'Arroz', 'Oryza sativa', 110, '900mm', 15.00),
	(4, 'Tomate', 'Solanum lycopersicum', 90, '500mm', 22.00),
	(5, 'Papa', 'Solanum tuberosum', 130, '500mm', 24.00),
	(6, 'Café', 'Coffea arabica', 1000, '900mm', 18.00),
	(7, 'Girasol', 'Helianthus annuus', 100, '200mm', 16.00),
	(8, 'Cebolla', 'Allium cepa', 120, '200mm', 25.00),
	(9, 'Zanahoria', 'Daucus carota', 110, '500mm', 20.00),
	(10, 'Fresa', 'Fragaria', 75, '900mm', 22.00);

-- Volcando estructura para tabla agcontrol.detalles_venta
CREATE TABLE IF NOT EXISTS `detalles_venta` (
  `id_detalle` int NOT NULL,
  `id_venta` int DEFAULT NULL,
  `id_cosecha` int DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `precio` int DEFAULT NULL,
  `vlr_total` int DEFAULT NULL,
  PRIMARY KEY (`id_detalle`),
  KEY `id_cosecha` (`id_cosecha`),
  KEY `fk_venta_cascade` (`id_venta`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla agcontrol.detalles_venta: 10 rows
INSERT IGNORE INTO `detalles_venta` (`id_detalle`, `id_venta`, `id_cosecha`, `cantidad`, `precio`, `vlr_total`) VALUES
	(1, 1, 1, 1000, 15000, 15000000),
	(2, 2, 2, 500, 12500, 6250000),
	(3, 3, 3, 2000, 13000, 26000000),
	(4, 4, 4, 5000, 8500, 42500000),
	(5, 5, 5, 100, 9500, 950000),
	(6, 6, 6, 2000, 11500, 23000000),
	(7, 7, 10, 1000, 12000, 12000000),
	(8, 8, 8, 1200, 13000, 15600000),
	(9, 9, 9, 300, 14000, 4200000),
	(10, 10, 7, 1500, 22000, 33000000);

-- Volcando estructura para tabla agcontrol.empleados
CREATE TABLE IF NOT EXISTS `empleados` (
  `dni` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apellido` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FechaNacimiento` date DEFAULT NULL,
  `Direccion` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefono` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_especialidad` int DEFAULT NULL,
  `FechaContratacion` date DEFAULT NULL,
  `salario` int DEFAULT NULL,
  `AreaID` int DEFAULT NULL,
  PRIMARY KEY (`dni`),
  KEY `AreaID` (`AreaID`),
  KEY `id_especialidad` (`id_especialidad`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla agcontrol.empleados: 10 rows
INSERT IGNORE INTO `empleados` (`dni`, `nombre`, `apellido`, `FechaNacimiento`, `Direccion`, `telefono`, `id_especialidad`, `FechaContratacion`, `salario`, `AreaID`) VALUES
	('1001', 'Carlos', 'Ramírez', '1985-05-10', 'Medellín', '3001111111', 1, '2020-01-15', 2500000, 1),
	('1002', 'Ana', 'Gómez', '1990-07-20', 'Cali', '3002222222', 2, '2021-03-10', 2800000, 2),
	('1003', 'Luis', 'Martínez', '1988-09-12', 'Bogotá', '3003333333', 3, '2019-06-01', 2200000, 3),
	('1004', 'María', 'Fernández', '1992-11-05', 'Manizales', '3004444444', 4, '2022-02-20', 1800000, 4),
	('1005', 'Jorge', 'Pérez', '1987-03-18', 'Pereira', '3005555555', 5, '2020-09-15', 2000000, 5),
	('1006', 'Sofía', 'López', '1995-01-25', 'Barranquilla', '3006666666', 6, '2021-05-30', 2300000, 6),
	('1007', 'Andrés', 'Torres', '1989-04-14', 'Tunja', '3007777777', 7, '2018-08-10', 1900000, 7),
	('1008', 'Paula', 'Castro', '1993-06-22', 'Medellín', '3008888888', 8, '2022-07-01', 2100000, 8),
	('1009', 'Felipe', 'Moreno', '1986-02-11', 'Cali', '3009999999', 9, '2017-04-12', 3000000, 9),
	('1010', 'Laura', 'Jiménez', '1994-12-30', 'Bogotá', '3010000000', 10, '2023-01-05', 2700000, 10);

-- Volcando estructura para tabla agcontrol.especialidades
CREATE TABLE IF NOT EXISTS `especialidades` (
  `id_especialidad` int NOT NULL,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_especialidad`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla agcontrol.especialidades: 10 rows
INSERT IGNORE INTO `especialidades` (`id_especialidad`, `nombre`) VALUES
	(1, 'Agrónomo'),
	(2, 'Ingeniera Agrícola'),
	(3, 'Mecánico'),
	(4, 'Operaria'),
	(5, 'Logística'),
	(6, 'Ventas'),
	(7, 'Almacenista'),
	(8, 'Control de calidad'),
	(9, 'Administrador'),
	(10, 'Investigadora');

-- Volcando estructura para tabla agcontrol.fincas
CREATE TABLE IF NOT EXISTS `fincas` (
  `id_finca` int NOT NULL,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extension` int DEFAULT NULL,
  `id_suelo` int DEFAULT NULL,
  `Latitud` decimal(9,6) DEFAULT NULL,
  `Longitud` decimal(9,6) DEFAULT NULL,
  `Altitud` int DEFAULT NULL,
  `TempPromedio` decimal(5,2) DEFAULT NULL,
  `region` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_finca`),
  KEY `id_suelo` (`id_suelo`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla agcontrol.fincas: 10 rows
INSERT IGNORE INTO `fincas` (`id_finca`, `nombre`, `extension`, `id_suelo`, `Latitud`, `Longitud`, `Altitud`, `TempPromedio`, `region`) VALUES
	(1, 'La Esperanza', 50, 4, 6.032145, -75.428765, 2100, 18.50, 'Valle Central'),
	(2, 'El Recreo', 30, 1, 6.123456, -75.456789, 1950, 19.00, 'Valle Central'),
	(3, 'San José', 100, 3, 6.234567, -75.567890, 1800, 20.00, 'Pacífico Sur'),
	(4, 'Bella Vista', 25, 10, 6.345678, -75.678901, 1700, 21.00, 'Pacífico Sur'),
	(5, 'Los Olivos', 45, 8, 6.456789, -75.789012, 1600, 22.00, 'Pacífico Sur'),
	(6, 'La Pampa', 80, 2, 6.567890, -75.890123, 1750, 19.50, 'Pacífico Sur'),
	(7, 'El Paraíso', 60, 4, 6.678901, -75.901234, 1850, 20.50, 'Zona Norte'),
	(8, 'Don Antón', 35, 3, 6.789012, -75.912345, 1900, 18.00, 'Zona Norte'),
	(9, 'Villa Flor', 20, 9, 6.890123, -75.923456, 2000, 17.50, 'Zona Norte'),
	(10, 'Las Acacias', 55, 4, 6.901234, -75.934567, 2100, 16.50, 'Zona Norte');

-- Volcando estructura para tabla agcontrol.insumos
CREATE TABLE IF NOT EXISTS `insumos` (
  `id_insumo` int NOT NULL,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_tipo_insumo` int DEFAULT NULL,
  `id_unidad` int DEFAULT NULL,
  `stock` int DEFAULT NULL,
  `id_almacen` int DEFAULT NULL,
  `FechaCaducidad` date DEFAULT NULL,
  `precio` int DEFAULT NULL,
  `ProveedorID` int DEFAULT NULL,
  PRIMARY KEY (`id_insumo`),
  KEY `ProveedorID` (`ProveedorID`),
  KEY `id_tipo_insumo` (`id_tipo_insumo`),
  KEY `id_unidad` (`id_unidad`),
  KEY `id_almacen` (`id_almacen`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla agcontrol.insumos: 10 rows
INSERT IGNORE INTO `insumos` (`id_insumo`, `nombre`, `id_tipo_insumo`, `id_unidad`, `stock`, `id_almacen`, `FechaCaducidad`, `precio`, `ProveedorID`) VALUES
	(1, 'Urea', 1, 1, 500, 1, '2026-12-31', 1200, 1),
	(2, 'Semilla Maíz Híbrido', 3, 1, 200, 2, '2027-03-01', 5000, 2),
	(3, 'Herbicida Glifosato', 2, 2, 100, 3, '2026-06-30', 8000, 3),
	(4, 'Fertilizante NPK', 1, 1, 300, 4, '2026-11-30', 2500, 4),
	(5, 'Sistema Riego Goteo', 8, 1, 10, 5, '2028-01-01', 1500000, 5),
	(6, 'Semilla Café', 3, 1, 150, 6, '2027-05-15', 6000, 6),
	(7, 'Semilla de arroz', 3, 1, 2, 7, '2030-01-01', 120000000, 6),
	(8, 'Biofertilizante Orgánico', 1, 2, 80, 8, '2026-09-30', 15000, 8),
	(9, 'Insecticida Biológico', 2, 2, 60, 9, '2026-08-15', 20000, 9),
	(10, 'Fertilizante Fosfato', 1, 1, 400, 10, '2026-10-31', 1800, 10);

-- Volcando estructura para tabla agcontrol.mantenimientos
CREATE TABLE IF NOT EXISTS `mantenimientos` (
  `MantenimientoID` int NOT NULL AUTO_INCREMENT,
  `MaquinariaID` int NOT NULL,
  `Fecha` date DEFAULT NULL,
  `Tipo` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Descripcion` text COLLATE utf8mb4_unicode_ci,
  `PiezasReemplazadas` text COLLATE utf8mb4_unicode_ci,
  `Costo` decimal(10,2) DEFAULT NULL,
  `TecnicoID` int DEFAULT NULL,
  PRIMARY KEY (`MantenimientoID`),
  KEY `MaquinariaID` (`MaquinariaID`),
  KEY `TecnicoID` (`TecnicoID`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla agcontrol.mantenimientos: 10 rows
INSERT IGNORE INTO `mantenimientos` (`MantenimientoID`, `MaquinariaID`, `Fecha`, `Tipo`, `Descripcion`, `PiezasReemplazadas`, `Costo`, `TecnicoID`) VALUES
	(1, 1, '2023-01-15', 'Preventivo', 'Cambio de aceite', 'Filtro de aceite', 500000.00, 3),
	(2, 2, '2023-02-10', 'Correctivo', 'Reparación de frenos', 'Pastillas de freno', 1200000.00, 3),
	(3, 3, '2023-03-05', 'Preventivo', 'Lubricación general', 'Grasa industrial', 300000.00, 3),
	(4, 4, '2023-01-20', 'Correctivo', 'Cambio de bomba hidráulica', 'Bomba hidráulica', 2500000.00, 3),
	(5, 5, '2023-02-25', 'Preventivo', 'Revisión eléctrica', 'Batería', 800000.00, 3),
	(6, 6, '2023-03-15', 'Correctivo', 'Cambio de embrague', 'Kit embrague', 1800000.00, 3),
	(7, 7, '2023-01-30', 'Preventivo', 'Cambio de filtros', 'Filtro aire', 400000.00, 3),
	(8, 8, '2023-02-18', 'Correctivo', 'Reparación motor', 'Pistones', 3500000.00, 3),
	(9, 9, '2023-03-10', 'Preventivo', 'Revisión transmisión', 'Aceite transmisión', 600000.00, 3),
	(10, 10, '2023-03-22', 'Correctivo', 'Cambio de neumáticos', 'Neumáticos traseros', 2200000.00, 3);

-- Volcando estructura para tabla agcontrol.maquinaria
CREATE TABLE IF NOT EXISTS `maquinaria` (
  `MaquinariaID` int NOT NULL,
  `Marca` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Modelo` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AñoFabricacion` year DEFAULT NULL,
  `Potencia` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Combustible` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Horometro` decimal(10,2) DEFAULT NULL,
  `Estado` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`MaquinariaID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla agcontrol.maquinaria: 10 rows
INSERT IGNORE INTO `maquinaria` (`MaquinariaID`, `Marca`, `Modelo`, `AñoFabricacion`, `Potencia`, `Combustible`, `Horometro`, `Estado`) VALUES
	(1, 'John Deere', 'JD5050', '2020', '50 HP', 'Diésel', 1200.00, 'Operativa'),
	(2, 'Case IH', 'Farmall 75', '2019', '75 HP', 'Diésel', 1500.00, 'Operativa'),
	(3, 'Kubota', 'M7040', '2021', '70 HP', 'Diésel', 800.00, 'Operativa'),
	(4, 'New Holland', 'T5.95', '2018', '95 HP', 'Diésel', 2000.00, 'Mantenimiento'),
	(5, 'Massey Ferguson', 'MF4707', '2022', '75 HP', 'Diésel', 500.00, 'Operativa'),
	(6, 'John Deere', 'JD6110', '2017', '110 HP', 'Diésel', 2500.00, 'Operativa'),
	(7, 'Case IH', 'Magnum 250', '2020', '250 HP', 'Diésel', 1800.00, 'Operativa'),
	(8, 'Kubota', 'L6060', '2019', '60 HP', 'Diésel', 1300.00, 'Operativa'),
	(9, 'New Holland', 'T7.210', '2021', '210 HP', 'Diésel', 900.00, 'Operativa'),
	(10, 'Massey Ferguson', 'MF5711', '2022', '110 HP', 'Diésel', 400.00, 'Operativa');

-- Volcando estructura para tabla agcontrol.metodos_cosecha
CREATE TABLE IF NOT EXISTS `metodos_cosecha` (
  `id_metodo_cosecha` int NOT NULL,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_metodo_cosecha`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla agcontrol.metodos_cosecha: 10 rows
INSERT IGNORE INTO `metodos_cosecha` (`id_metodo_cosecha`, `nombre`) VALUES
	(1, 'Manual'),
	(2, 'Mecánica Combinada'),
	(3, 'Manual con Tijera'),
	(4, 'Vibración'),
	(5, 'Segadora'),
	(6, 'Arranque'),
	(7, 'Ordeño'),
	(8, 'Corte Directo'),
	(9, 'Escalera'),
	(10, 'Automatizada');

-- Volcando estructura para tabla agcontrol.metodos_pago
CREATE TABLE IF NOT EXISTS `metodos_pago` (
  `id_metodo_pago` int NOT NULL,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_metodo_pago`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla agcontrol.metodos_pago: 10 rows
INSERT IGNORE INTO `metodos_pago` (`id_metodo_pago`, `nombre`) VALUES
	(1, 'Efectivo'),
	(2, 'Transferencia'),
	(3, 'Crédito 30 días'),
	(4, 'Cheque'),
	(5, 'Tarjeta Débito'),
	(6, 'Tarjeta Crédito'),
	(7, 'Trueque Insumos'),
	(8, 'Remesa'),
	(9, 'App Móvil'),
	(10, 'Giro');

-- Volcando estructura para tabla agcontrol.movimientos_insumos
CREATE TABLE IF NOT EXISTS `movimientos_insumos` (
  `id_movimiento` int NOT NULL,
  `id_insumo` int DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `tipo` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `ResponsableID` int DEFAULT NULL,
  `Destino` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_movimiento`),
  KEY `id_insumo` (`id_insumo`),
  KEY `ResponsableID` (`ResponsableID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla agcontrol.movimientos_insumos: 10 rows
INSERT IGNORE INTO `movimientos_insumos` (`id_movimiento`, `id_insumo`, `fecha`, `tipo`, `cantidad`, `ResponsableID`, `Destino`) VALUES
	(1, 2, '2025-01-10', 'Entrada', 200, 4, 'Bodega_C'),
	(2, 2, '2025-02-05', 'Salida', 50, 4, 'Parcela 1'),
	(3, 3, '2025-01-15', 'Entrada', 100, 4, 'Bodega_C'),
	(4, 5, '2025-02-20', 'Salida', 30, 4, 'Parcela 2'),
	(5, 5, '2025-01-25', 'Entrada', 50, 4, 'Bodega_C'),
	(6, 9, '2025-03-01', 'Salida', 20, 4, 'Parcela 3'),
	(7, 5, '2025-02-10', 'Entrada', 150, 4, 'Bodega_C'),
	(8, 4, '2025-03-15', 'Salida', 40, 4, 'Parcela 4'),
	(9, 3, '2025-02-28', 'Entrada', 5, 4, 'Bodega_C'),
	(10, 9, '2025-03-20', 'Salida', 2, 4, 'Parcela 5');

-- Volcando estructura para tabla agcontrol.parcelas
CREATE TABLE IF NOT EXISTS `parcelas` (
  `id_parcela` int NOT NULL,
  `codigo` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `area` int DEFAULT NULL,
  `id_finca` int DEFAULT NULL,
  `id_riego` int DEFAULT NULL,
  `HistorialUso` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id_parcela`),
  KEY `id_finca` (`id_finca`),
  KEY `id_riego` (`id_riego`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla agcontrol.parcelas: 10 rows
INSERT IGNORE INTO `parcelas` (`id_parcela`, `codigo`, `area`, `id_finca`, `id_riego`, `HistorialUso`) VALUES
	(1, 'P-01', 5, 1, 1, 'Maíz en 2024'),
	(2, 'P-02', 5, 1, 2, ''),
	(3, 'P-03', 10, 2, 3, 'Papa en 2024'),
	(4, 'P-04', 8, 3, 4, ''),
	(5, 'P-05', 4, 4, 5, 'Tomate en 2024'),
	(6, 'P-06', 12, 5, 1, ''),
	(7, 'P-07', 15, 6, 3, 'Trigo en 2024'),
	(8, 'P-08', 6, 7, 2, ''),
	(9, 'P-09', 5, 8, 1, 'Aguacate en 2024'),
	(10, 'P-10', 10, 9, 5, '');

-- Volcando estructura para tabla agcontrol.proveedores
CREATE TABLE IF NOT EXISTS `proveedores` (
  `ProveedorID` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RUC_DNI` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DireccionFiscal` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Telefono` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Especialidad` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CondicionesPago` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ProveedorID`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla agcontrol.proveedores: 10 rows
INSERT IGNORE INTO `proveedores` (`ProveedorID`, `Nombre`, `RUC_DNI`, `DireccionFiscal`, `Telefono`, `Email`, `Especialidad`, `CondicionesPago`) VALUES
	(1, 'Agroinsumos S.A.', '900123456', 'Medellín', '3001234567', 'ventas@agroinsumos.com', 'Fertilizantes', '30 días'),
	(2, 'Semillas del Valle', '900234567', 'Cali', '3012345678', 'info@semillasvalle.com', 'Semillas', 'Contado'),
	(3, 'Agroquímicos Andinos', '900345678', 'Bogotá', '3023456789', 'contacto@agroandinos.com', 'Plaguicidas', '15 días'),
	(4, 'NutriCampo Ltda.', '900456789', 'Manizales', '3034567890', 'ventas@nutricampo.com', 'Fertilizantes', '30 días'),
	(5, 'AgroRiego SAS', '900567890', 'Pereira', '3045678901', 'soporte@agroriego.com', 'Sistemas de riego', 'Contado'),
	(6, 'CampoFértil S.A.', '900678901', 'Medellín', '3056789012', 'ventas@campofertil.com', 'Semillas', '30 días'),
	(7, 'AgroMaquinaria Ltda.', '900789012', 'Bogotá', '3067890123', 'info@agromaquinaria.com', 'Maquinaria', '60 días'),
	(8, 'BioAgro SAS', '900890123', 'Cali', '3078901234', 'bio@bioagro.com', 'Biofertilizantes', 'Contado'),
	(9, 'AgroProtec S.A.', '900901234', 'Barranquilla', '3089012345', 'ventas@agroprotec.com', 'Plaguicidas', '30 días'),
	(10, 'AgroAndes Ltda.', '901012345', 'Tunja', '3090123456', 'contacto@agroandes.com', 'Fertilizantes', '15 días');

-- Volcando estructura para tabla agcontrol.repuestos_usados
CREATE TABLE IF NOT EXISTS `repuestos_usados` (
  `id_repUsados` int NOT NULL,
  `id_mantenimiento` int DEFAULT NULL,
  `id_insumo` int DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  PRIMARY KEY (`id_repUsados`),
  KEY `id_mantenimiento` (`id_mantenimiento`),
  KEY `id_insumo` (`id_insumo`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla agcontrol.repuestos_usados: 10 rows
INSERT IGNORE INTO `repuestos_usados` (`id_repUsados`, `id_mantenimiento`, `id_insumo`, `cantidad`) VALUES
	(1, 1, 6, 2),
	(2, 1, 10, 1),
	(3, 2, 6, 4),
	(4, 4, 6, 5),
	(5, 8, 10, 2),
	(6, 10, 6, 2),
	(7, 2, 10, 1),
	(8, 3, 6, 1),
	(9, 5, 6, 1),
	(10, 6, 10, 1);

-- Volcando estructura para tabla agcontrol.siembras
CREATE TABLE IF NOT EXISTS `siembras` (
  `SiembraID` int NOT NULL,
  `ParcelaID` int NOT NULL,
  `CultivoID` int NOT NULL,
  `FechaSiembra` date DEFAULT NULL,
  `DensidadSiembra` decimal(10,2) DEFAULT NULL,
  `FechaEstCosecha` date DEFAULT NULL,
  `RendimientoEsperado` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`SiembraID`),
  KEY `ParcelaID` (`ParcelaID`),
  KEY `CultivoID` (`CultivoID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla agcontrol.siembras: 10 rows
INSERT IGNORE INTO `siembras` (`SiembraID`, `ParcelaID`, `CultivoID`, `FechaSiembra`, `DensidadSiembra`, `FechaEstCosecha`, `RendimientoEsperado`) VALUES
	(1, 1, 1, '2024-03-01', 30000.00, '2024-07-01', 8000.00),
	(2, 2, 1, '2024-02-15', 5000.00, '2024-12-04', 4000.00),
	(3, 3, 1, '2024-04-10', 25000.00, '2024-07-10', 7000.00),
	(4, 4, 1, '2024-03-20', 20000.00, '2024-06-20', 6000.00),
	(5, 5, 1, '2024-01-30', 15000.00, '2024-05-30', 9000.00),
	(6, 6, 1, '2024-02-05', 18000.00, '2024-06-05', 7500.00),
	(7, 7, 7, '2024-03-25', 22000.00, '2024-08-25', 10000.00),
	(8, 8, 8, '2024-01-10', 1000.00, '2024-01-10', 15000.00),
	(9, 9, 9, '2024-02-28', 800.00, '2024-11-30', 12000.00),
	(10, 10, 10, '2024-03-15', 1200.00, '2024-10-15', 11000.00);

-- Volcando estructura para tabla agcontrol.sistemas_riego
CREATE TABLE IF NOT EXISTS `sistemas_riego` (
  `id_riego` int NOT NULL,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_riego`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla agcontrol.sistemas_riego: 10 rows
INSERT IGNORE INTO `sistemas_riego` (`id_riego`, `nombre`) VALUES
	(1, 'Goteo'),
	(2, 'Aspersión'),
	(3, 'Gravedad'),
	(4, 'Pivot Central'),
	(5, 'Microaspersión'),
	(6, 'Manual'),
	(7, 'Exudación'),
	(8, 'Multicompuerta'),
	(9, 'Subterráneo'),
	(10, 'Hidropónico');

-- Volcando estructura para tabla agcontrol.tareas
CREATE TABLE IF NOT EXISTS `tareas` (
  `id_tarea` int NOT NULL,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_tarea`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla agcontrol.tareas: 10 rows
INSERT IGNORE INTO `tareas` (`id_tarea`, `nombre`) VALUES
	(1, 'Cultivos'),
	(2, 'Riego'),
	(3, 'Mantenimiento'),
	(4, 'Cosecha'),
	(5, 'Logística'),
	(6, 'Ventas'),
	(7, 'Almacén'),
	(8, 'Calidad'),
	(9, 'Administración'),
	(10, 'Investigación');

-- Volcando estructura para tabla agcontrol.tipos_insumo
CREATE TABLE IF NOT EXISTS `tipos_insumo` (
  `id_tipo_insumo` int NOT NULL,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_tipo_insumo`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla agcontrol.tipos_insumo: 10 rows
INSERT IGNORE INTO `tipos_insumo` (`id_tipo_insumo`, `nombre`) VALUES
	(1, 'Fertilizante'),
	(2, 'Pesticida'),
	(3, 'Semilla'),
	(4, 'Herbicida'),
	(5, 'Fungicida'),
	(6, 'Combustible'),
	(7, 'Lubricante'),
	(8, 'Herramienta'),
	(9, 'Abono Orgánico'),
	(10, 'Repuesto');

-- Volcando estructura para tabla agcontrol.tipos_suelo
CREATE TABLE IF NOT EXISTS `tipos_suelo` (
  `id_suelo` int NOT NULL,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_suelo`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla agcontrol.tipos_suelo: 10 rows
INSERT IGNORE INTO `tipos_suelo` (`id_suelo`, `nombre`) VALUES
	(1, 'Arcilloso'),
	(2, 'Arenoso'),
	(3, 'Limoso'),
	(4, 'Franco'),
	(5, 'Salino'),
	(6, 'Turba'),
	(7, 'Calizo'),
	(8, 'Franco-Arcilloso'),
	(9, 'Franco-Arenoso'),
	(10, 'Volcánico');

-- Volcando estructura para tabla agcontrol.unidades_medida
CREATE TABLE IF NOT EXISTS `unidades_medida` (
  `id_unidad` int NOT NULL,
  `nombre` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_unidad`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla agcontrol.unidades_medida: 10 rows
INSERT IGNORE INTO `unidades_medida` (`id_unidad`, `nombre`) VALUES
	(1, 'Kilogramos'),
	(2, 'Litros'),
	(3, 'Toneladas'),
	(4, 'Gramos'),
	(5, 'Metros'),
	(6, 'Sacos'),
	(7, 'Galones'),
	(8, 'Bultos'),
	(9, 'Cajas'),
	(10, 'Mililitros');

-- Volcando estructura para tabla agcontrol.ventas
CREATE TABLE IF NOT EXISTS `ventas` (
  `id_venta` int NOT NULL,
  `fecha` date DEFAULT NULL,
  `id_cliente` int DEFAULT NULL,
  `id_metodo_pago` int DEFAULT NULL,
  `vlr_subtotal` decimal(10,2) DEFAULT NULL,
  `descuento` decimal(10,2) DEFAULT NULL,
  `impuesto` int DEFAULT NULL,
  `vlr_total` int DEFAULT NULL,
  PRIMARY KEY (`id_venta`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_metodo_pago` (`id_metodo_pago`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla agcontrol.ventas: 10 rows
INSERT IGNORE INTO `ventas` (`id_venta`, `fecha`, `id_cliente`, `id_metodo_pago`, `vlr_subtotal`, `descuento`, `impuesto`, `vlr_total`) VALUES
	(1, '2024-06-20', 1, 1, 15000000.00, 1500000.00, 2565000, 16065000),
	(2, '2024-07-20', 2, 2, 6250000.00, 625000.00, 1068750, 6693750),
	(3, '2024-08-20', 3, 3, 26000000.00, 2600000.00, 4446000, 27846000),
	(4, '2024-09-20', 4, 2, 42500000.00, 4250000.00, 7267500, 45517500),
	(5, '2024-09-20', 6, 5, 950000.00, 95000.00, 162450, 1017450),
	(6, '2024-10-20', 1, 2, 23000000.00, 2300000.00, 3933000, 24633000),
	(7, '2024-10-20', 10, 3, 12000000.00, 1200000.00, 2052000, 12852000),
	(8, '2024-11-20', 8, 2, 15600000.00, 1560000.00, 2667600, 16707600),
	(9, '2024-12-20', 5, 1, 4200000.00, 420000.00, 718200, 4498200),
	(10, '2024-12-20', 3, 2, 33000000.00, 3300000.00, 5643000, 35343000);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
