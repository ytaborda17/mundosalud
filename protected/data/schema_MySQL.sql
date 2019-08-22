-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.38-0ubuntu0.12.04.1 - (Ubuntu)
-- Server OS:                    debian-linux-gnu
-- HeidiSQL Version:             8.3.0.4694
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for mundosal_page
CREATE DATABASE IF NOT EXISTS `mundosal_page` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `mundosal_page`;


-- Dumping structure for table mundosal_page.contacto
CREATE TABLE IF NOT EXISTS `contacto` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `tipo_id` int(11) NOT NULL COMMENT 'Tipo',
  `grupo_id` int(11) NOT NULL COMMENT 'Grupo',
  `valor` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Valor',
  `activo` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Activo',
  PRIMARY KEY (`id`),
  KEY `atributo_tipo` (`tipo_id`),
  KEY `contacto_grupo` (`grupo_id`),
  CONSTRAINT `FK_contacto_contacto_grupos` FOREIGN KEY (`grupo_id`) REFERENCES `contacto_grupos` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_contacto_contacto_tipos` FOREIGN KEY (`tipo_id`) REFERENCES `contacto_tipos` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='usar con campos como email, telefono o dirección, que pueden ser mas de uno';

-- Dumping data for table mundosal_page.contacto: ~4 rows (approximately)
/*!40000 ALTER TABLE `contacto` DISABLE KEYS */;
INSERT INTO `contacto` (`id`, `tipo_id`, `grupo_id`, `valor`, `activo`) VALUES
	(1, 1, 1, 'Av. Bella Vista, entre calle 69 y 70, Edif. Lisa María, piso No. 1 Local No. 3 ', 1),
	(2, 2, 1, 'Telf: (0261)7983202 - 7978341-7989486-7988343', 1),
	(3, 1, 2, 'Av. La Limpia, Sector La Fusta C.C La Espacial diagonal a la farmacia SAAS ', 1),
	(4, 2, 2, 'Telf: (0261)7594186- (0414)6209489', 1);
/*!40000 ALTER TABLE `contacto` ENABLE KEYS */;


-- Dumping structure for table mundosal_page.contacto_grupos
CREATE TABLE IF NOT EXISTS `contacto_grupos` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `titulo` varchar(140) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Título',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table mundosal_page.contacto_grupos: ~2 rows (approximately)
/*!40000 ALTER TABLE `contacto_grupos` DISABLE KEYS */;
INSERT INTO `contacto_grupos` (`id`, `titulo`) VALUES
	(1, 'PARA SPA Y PROGRAMAR TU CITA DE MÉDICO EN SU CASA'),
	(2, 'PARA ODONTOLOGÍA');
/*!40000 ALTER TABLE `contacto_grupos` ENABLE KEYS */;


-- Dumping structure for table mundosal_page.contacto_tipos
CREATE TABLE IF NOT EXISTS `contacto_tipos` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `etiqueta` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Etiqueta',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table mundosal_page.contacto_tipos: ~3 rows (approximately)
/*!40000 ALTER TABLE `contacto_tipos` DISABLE KEYS */;
INSERT INTO `contacto_tipos` (`id`, `etiqueta`) VALUES
	(1, 'direccion'),
	(2, 'telefono'),
	(3, 'email');
/*!40000 ALTER TABLE `contacto_tipos` ENABLE KEYS */;


-- Dumping structure for table mundosal_page.empresa
CREATE TABLE IF NOT EXISTS `empresa` (
  `id` int(11) NOT NULL COMMENT 'ID',
  `nombre` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Nombre de la empresa',
  `rif` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'RIF',
  `impuesto` decimal(10,3) NOT NULL COMMENT 'Impuesto (%)',
  `direccion` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Dirección',
  `somos` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Quiénes somos',
  `mision` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Misión',
  `vision` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Visión',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table mundosal_page.empresa: ~1 rows (approximately)
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
INSERT INTO `empresa` (`id`, `nombre`, `rif`, `impuesto`, `direccion`, `somos`, `mision`, `vision`) VALUES
	(0, 'Mundo Salud, C. A.', 'J-31134350-4', 25.360, 'Av. Bella Vista entre calle 69 y 70 Edif. Lisa María, piso N° 1 Local N° 3', 'Está conformado por un grupo de médicos especialistas y terapeutas profesionales, que ofrecen una variedad de tratamientos de base orgánica y médica, utilizando tecnología y productos de última generación, cada uno orientado a garantizar la mayor satisfacción posible e inducir elevados niveles de bienestar. \r\n\r\nNuestro innovador sistema de previsión le permite tener acceso a nuestros productos y servicios de manera rápida y sencilla', 'Mundo Salud es una empresa integral que cuenta con más de 10 años de experiencia en el mercado, ofrece servicios en Salud, estética, y cosmetología, brindándole a nuestros afiliados costos accesibles y tratamientos de calidad, utilizando la más alta tecnología y un personal altamente calificado, siguiendo la gerencia del servicio como eje central, logrando satisfacer las necesidades de cada afiliado.', 'Posicionarnos en el mercado occidental como empresa líder en los servicios de salud, estética, y cosmetologías, teniendo como objetivo principal la excelencia del servicio.');
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;


-- Dumping structure for table mundosal_page.menu
CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `padre` int(11) NOT NULL,
  `estatus` tinyint(1) DEFAULT '1',
  `operation` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `active` text COLLATE utf8_unicode_ci NOT NULL,
  `pic` varchar(25) COLLATE utf8_unicode_ci DEFAULT '0',
  `sort` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table mundosal_page.menu: ~23 rows (approximately)
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` (`id`, `label`, `padre`, `estatus`, `operation`, `url`, `active`, `pic`, `sort`) VALUES
	(1, 'INICIO', 0, 1, '', '/index', 'site/index', '', 0),
	(2, 'QUIENES SOMOS', 0, 1, '', '/quienes_somos', 'site/quienes_somos', '', 0),
	(3, 'TRATAMIENTOS', 0, 1, '', '', 'site/tratamientos', '', 0),
	(4, 'PLANES', 0, 1, NULL, '/planes', 'site/planes', '', 0),
	(5, 'CONTÁCTANOS', 0, 1, NULL, '/contacto', 'site/contacto', '', 0),
	(6, 'SPA', 0, 0, NULL, '/spa', 'site/spa', '.jpg', 0),
	(7, 'MEDICOS EN CASA', 0, 0, NULL, '/medicosCasa', 'site/medicosCasa', '.jpg', 0),
	(8, 'ODONTOLOGIA', 0, 0, NULL, '/odontologia', 'site/odontologia', '.jpg', 0),
	(9, 'LIMPIEZA FACIAL CON COLÁGENO', 3, 1, NULL, '/tratamientos?td=1', '', '', 0),
	(10, 'LIMPIEZA DE ESPALDA', 3, 1, NULL, '/tratamientos?td=2', '', '', 0),
	(11, 'HIDRATACIÓN FACIAL', 3, 1, NULL, '/tratamientos?td=3', '', '', 0),
	(12, 'PEELING', 3, 1, NULL, '/tratamientos?td=4', '', '', 0),
	(13, 'FOTOREJUVENECIMIENTO', 3, 1, NULL, '/tratamientos?td=5', '', '', 0),
	(14, 'DEPILACION LASER', 3, 1, NULL, '/tratamientos?td=6', '', '', 0),
	(15, 'CARBOXITERAPIA', 3, 1, NULL, '/tratamientos?td=7', '', '', 0),
	(16, 'ULTRACAVITACIÓN', 3, 1, NULL, '/tratamientos?td=8', '', '', 0),
	(17, 'VACUMTERAPIA', 3, 1, NULL, '/tratamientos?td=9', '', '', 0),
	(18, 'MASAJES REDUCTIVOS', 3, 1, NULL, '/tratamientos?td=10', '', '', 0),
	(19, 'MASAJES RELAJANTES', 3, 1, NULL, '/tratamientos?td=11', '', '', 0),
	(20, 'CHOCOTERAPIA', 3, 1, NULL, '/tratamientos?td=12', '', '', 0),
	(21, 'ENDERMOLOGY', 3, 1, NULL, '/tratamientos?td=13', '', '', 0),
	(22, 'DRENAJE LINFÁTICO', 3, 1, NULL, '/tratamientos?td=14', '', '', 0),
	(23, 'RADIOFRECUENCIA', 3, 1, NULL, '/tratamientos?td=15', '', '', 0);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;


-- Dumping structure for table mundosal_page.metadata
CREATE TABLE IF NOT EXISTS `metadata` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `menu_id` int(11) DEFAULT NULL,
  `tipo_id` int(11) NOT NULL,
  `prop_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `prop_name_value` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Twt',
  `content` varchar(400) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Web (155),Twt (200), FB, Pin, G+',
  PRIMARY KEY (`id`),
  KEY `menu_id` (`menu_id`),
  KEY `meta_data_tipo` (`tipo_id`),
  CONSTRAINT `FK_meta_data_meta_data_tipo` FOREIGN KEY (`tipo_id`) REFERENCES `metadata_tipo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_social_meta_menu` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table mundosal_page.metadata: ~1 rows (approximately)
/*!40000 ALTER TABLE `metadata` DISABLE KEYS */;
INSERT INTO `metadata` (`id`, `menu_id`, `tipo_id`, `prop_name`, `prop_name_value`, `content`) VALUES
	(1, 1, 1, 'name', 'Keywords', 'spa,salud,masajes,peeling,odontologia'),
	(2, 1, 2, 'name', 'Description', 'Spa con excelentes profesionales y equipos de avanzada tecnologia, ofrecemos un servicio integral de tratamientos estéticos corporales y terapias alternativas con atención personalizada. '),
	(3, 1, 2, 'name', 'twitter:card', 'summary'),
	(4, 1, 2, 'name', 'twitter:site', '@MundoSaludCA'),
	(5, 1, 2, 'name', 'twitter:title', 'Mundo Salud C.A.'),
	(6, 1, 2, 'name', 'twitter:description', 'Spa con excelentes profesionales y equipos de avanzada tecnologia, ofrecemos un servicio integral de tratamientos estéticos corporales y terapias alternativas con atención personalizada.'),
	(7, 1, 2, 'name', 'twitter:image', 'http://mundosalud.com.ve/images/socialNetworkCover.jpg'),
	(8, 1, 3, 'property', 'og:card', 'summary'),
	(9, 1, 3, 'property', 'og:type', 'article'),
	(10, 1, 3, 'property', 'og:url', 'http://mundosalud.com.ve/'),
	(11, 1, 3, 'property', 'og:image', 'http://mundosalud.com.ve/images/socialNetworkCover.jpg'),
	(12, 1, 3, 'property', 'og:description', 'Spa con excelentes profesionales y equipos de avanzada tecnologia, ofrecemos un servicio integral de tratamientos estéticos corporales y terapias alternativas con atención personalizada.'),
	(13, 1, 3, 'property', 'og:site_name', 'Mundo Salud C.A.');
/*!40000 ALTER TABLE `metadata` ENABLE KEYS */;


-- Dumping structure for table mundosal_page.metadata_tipo
CREATE TABLE IF NOT EXISTS `metadata_tipo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(140) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table mundosal_page.metadata_tipo: ~4 rows (approximately)
/*!40000 ALTER TABLE `metadata_tipo` DISABLE KEYS */;
INSERT INTO `metadata_tipo` (`id`, `nombre`, `descripcion`) VALUES
	(1, 'Web', 'De uso básico en el documento HTML'),
	(2, 'Twitter', 'Red social'),
	(3, 'Open Graph', 'Open Graph data'),
	(4, 'Google', 'Red social G+');
/*!40000 ALTER TABLE `metadata_tipo` ENABLE KEYS */;


-- Dumping structure for table mundosal_page.planes
CREATE TABLE IF NOT EXISTS `planes` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `titulo` text COLLATE utf8_unicode_ci COMMENT 'Título',
  `miembros` smallint(6) DEFAULT NULL COMMENT 'Cantidad de miembros',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table mundosal_page.planes: ~2 rows (approximately)
/*!40000 ALTER TABLE `planes` DISABLE KEYS */;
INSERT INTO `planes` (`id`, `titulo`, `miembros`) VALUES
	(1, 'PLAN EMPRESARIAL\r\nCONSULTA MÉDICA DOMICILIARIA PROGRAMADA\r\nESTETICA Y ODONTOLOGICA', 5),
	(2, 'PLAN PARTICULAR\r\nCONSULTA MÉDICA DOMICILIARIA PROGRAMADA\r\nESTETICA Y ODONTOLOGICA', 5);
/*!40000 ALTER TABLE `planes` ENABLE KEYS */;


-- Dumping structure for table mundosal_page.planes_componentes
CREATE TABLE IF NOT EXISTS `planes_componentes` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `descripcion` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Descripción',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table mundosal_page.planes_componentes: ~3 rows (approximately)
/*!40000 ALTER TABLE `planes_componentes` DISABLE KEYS */;
INSERT INTO `planes_componentes` (`id`, `descripcion`) VALUES
	(1, 'Consulta médica domiciliaria programada'),
	(2, 'Piel Canela  Spa'),
	(3, 'Plan Básico odontológico gratis');
/*!40000 ALTER TABLE `planes_componentes` ENABLE KEYS */;


-- Dumping structure for table mundosal_page.planes_componentes_group
CREATE TABLE IF NOT EXISTS `planes_componentes_group` (
  `plan_id` int(11) NOT NULL,
  `componente_id` int(11) NOT NULL,
  KEY `plan_id` (`plan_id`),
  KEY `componente_id` (`componente_id`),
  CONSTRAINT `FK__planes` FOREIGN KEY (`plan_id`) REFERENCES `planes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK__planes_componentes` FOREIGN KEY (`componente_id`) REFERENCES `planes_componentes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table mundosal_page.planes_componentes_group: ~6 rows (approximately)
/*!40000 ALTER TABLE `planes_componentes_group` DISABLE KEYS */;
INSERT INTO `planes_componentes_group` (`plan_id`, `componente_id`) VALUES
	(1, 1),
	(1, 2),
	(1, 3),
	(2, 1),
	(2, 2),
	(2, 3);
/*!40000 ALTER TABLE `planes_componentes_group` ENABLE KEYS */;


-- Dumping structure for table mundosal_page.planes_costos
CREATE TABLE IF NOT EXISTS `planes_costos` (
  `plan_id` int(11) NOT NULL,
  `modalidad_id` int(11) NOT NULL,
  `frecuencia_id` int(11) NOT NULL,
  `costo` decimal(10,3) NOT NULL,
  KEY `FK_planes_costos_planes` (`plan_id`),
  KEY `FK_planes_costos_planes_modalidad` (`modalidad_id`),
  KEY `FK_planes_costos_planes_frecuencia` (`frecuencia_id`),
  CONSTRAINT `FK_planes_costos_planes` FOREIGN KEY (`plan_id`) REFERENCES `planes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_planes_costos_planes_frecuencia` FOREIGN KEY (`frecuencia_id`) REFERENCES `planes_frecuencia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_planes_costos_planes_modalidad` FOREIGN KEY (`modalidad_id`) REFERENCES `planes_modalidad` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table mundosal_page.planes_costos: ~5 rows (approximately)
/*!40000 ALTER TABLE `planes_costos` DISABLE KEYS */;
INSERT INTO `planes_costos` (`plan_id`, `modalidad_id`, `frecuencia_id`, `costo`) VALUES
	(1, 1, 2, 210.000),
	(1, 2, 2, 100.000),
	(2, 1, 1, 160.000),
	(2, 1, 2, 280.000),
	(2, 2, 2, 100.000);
/*!40000 ALTER TABLE `planes_costos` ENABLE KEYS */;


-- Dumping structure for table mundosal_page.planes_frecuencia
CREATE TABLE IF NOT EXISTS `planes_frecuencia` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `nombre` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Nombre',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Frecuencia de pago de planes';

-- Dumping data for table mundosal_page.planes_frecuencia: ~2 rows (approximately)
/*!40000 ALTER TABLE `planes_frecuencia` DISABLE KEYS */;
INSERT INTO `planes_frecuencia` (`id`, `nombre`) VALUES
	(1, 'Inscripción'),
	(2, 'Mensual');
/*!40000 ALTER TABLE `planes_frecuencia` ENABLE KEYS */;


-- Dumping structure for table mundosal_page.planes_modalidad
CREATE TABLE IF NOT EXISTS `planes_modalidad` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `nombre` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Nombre',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Modo del plan: por grupo o por persona adicional';

-- Dumping data for table mundosal_page.planes_modalidad: ~2 rows (approximately)
/*!40000 ALTER TABLE `planes_modalidad` DISABLE KEYS */;
INSERT INTO `planes_modalidad` (`id`, `nombre`) VALUES
	(1, 'Grupo familiar'),
	(2, 'Adicional');
/*!40000 ALTER TABLE `planes_modalidad` ENABLE KEYS */;


-- Dumping structure for table mundosal_page.promociones
CREATE TABLE IF NOT EXISTS `promociones` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `activo` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Activo',
  `precio` decimal(10,3) DEFAULT NULL COMMENT 'Precio',
  `pic` varchar(55) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Picture name',
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Fecha de publicación',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table mundosal_page.promociones: ~4 rows (approximately)
/*!40000 ALTER TABLE `promociones` DISABLE KEYS */;
INSERT INTO `promociones` (`id`, `activo`, `precio`, `pic`, `time_stamp`) VALUES
	(1, 1, 560.000, '.jpg', '2014-10-14 00:00:47'),
	(2, 1, 580.000, '.jpg', '2014-10-14 00:02:17'),
	(3, 1, 1300.000, '.jpg', '2014-10-14 00:02:35'),
	(4, 1, 630.000, '.jpg', '2014-10-14 00:02:17');
/*!40000 ALTER TABLE `promociones` ENABLE KEYS */;


-- Dumping structure for table mundosal_page.redes
CREATE TABLE IF NOT EXISTS `redes` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `tipo` int(11) NOT NULL COMMENT 'Tipo',
  `user` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Username',
  `iconOff` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Icono inactivo',
  `iconOn` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Icono activo',
  PRIMARY KEY (`id`),
  KEY `FK_redes_redes_tipos` (`tipo`),
  CONSTRAINT `FK_redes_redes_tipos` FOREIGN KEY (`tipo`) REFERENCES `redes_tipos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table mundosal_page.redes: ~3 rows (approximately)
/*!40000 ALTER TABLE `redes` DISABLE KEYS */;
INSERT INTO `redes` (`id`, `tipo`, `user`, `iconOff`, `iconOn`) VALUES
	(1, 1, 'mundo.salud.58', '1Off.png', '1On.png'),
	(2, 2, 'MundoSaludCA', '2Off.png', '2On.png'),
	(3, 3, 'mundo_salud_c.a', '3Off.png', '3On.png');
/*!40000 ALTER TABLE `redes` ENABLE KEYS */;


-- Dumping structure for table mundosal_page.redes_tipos
CREATE TABLE IF NOT EXISTS `redes_tipos` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `nombre` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Nombre',
  `url` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT 'URL de la red social',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table mundosal_page.redes_tipos: ~3 rows (approximately)
/*!40000 ALTER TABLE `redes_tipos` DISABLE KEYS */;
INSERT INTO `redes_tipos` (`id`, `nombre`, `url`) VALUES
	(1, 'Facebook', 'http://www.facebook.com/'),
	(2, 'Twitter', 'http://twitter.com/'),
	(3, 'Instagram', 'http://instagram.com/');
/*!40000 ALTER TABLE `redes_tipos` ENABLE KEYS */;


-- Dumping structure for table mundosal_page.rotador
CREATE TABLE IF NOT EXISTS `rotador` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `decripcion` varchar(140) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Descipción',
  `menu_id` int(11) NOT NULL COMMENT 'Página',
  PRIMARY KEY (`id`),
  KEY `menu_id` (`menu_id`),
  CONSTRAINT `FK__menu` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table mundosal_page.rotador: ~1 rows (approximately)
/*!40000 ALTER TABLE `rotador` DISABLE KEYS */;
INSERT INTO `rotador` (`id`, `decripcion`, `menu_id`) VALUES
	(1, 'Inicio - principal', 1);
/*!40000 ALTER TABLE `rotador` ENABLE KEYS */;


-- Dumping structure for table mundosal_page.rotador_galeria
CREATE TABLE IF NOT EXISTS `rotador_galeria` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `pic` varchar(5) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Extensión',
  `rotador_id` int(11) NOT NULL COMMENT 'Rotador',
  PRIMARY KEY (`id`),
  KEY `rotador_id` (`rotador_id`),
  CONSTRAINT `FK__rotador` FOREIGN KEY (`rotador_id`) REFERENCES `rotador` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table mundosal_page.rotador_galeria: ~3 rows (approximately)
/*!40000 ALTER TABLE `rotador_galeria` DISABLE KEYS */;
INSERT INTO `rotador_galeria` (`id`, `pic`, `rotador_id`) VALUES
	(1, '.jpg', 1),
	(2, '.jpg', 1),
	(3, '.jpg', 1);
/*!40000 ALTER TABLE `rotador_galeria` ENABLE KEYS */;


-- Dumping structure for table mundosal_page.tratamientos
CREATE TABLE IF NOT EXISTS `tratamientos` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `titulo` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Título',
  `descripcion` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Descripción',
  `lista_etiqueta` varchar(140) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Etiqueta de la lista',
  `lista_elementos` text COLLATE utf8_unicode_ci COMMENT 'Lista de elementos',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table mundosal_page.tratamientos: ~15 rows (approximately)
/*!40000 ALTER TABLE `tratamientos` DISABLE KEYS */;
INSERT INTO `tratamientos` (`id`, `titulo`, `descripcion`, `lista_etiqueta`, `lista_elementos`) VALUES
	(1, 'LIMPIEZA FACIAL CON COLÁGENO', 'Nuestro tratamiento facial de velos de colágeno es ideal para la prevención y reparación de los signos de envejecimiento que permite a la piel recuperar su firmeza, elasticidad y tono, haciéndola lucir sana, nutrida e hidratada.\r\n\r\nUna gran ventaja del colágeno es su total compatibilidad con las células cutáneas y su asimilación por todo tipo de pieles, inclusive las más sensibles. Los productos de colágeno penetran hasta la segunda capa de la epidermis consiguiendo muy buenos resultados. ', 'Beneficios', 'Rehidratación cutánea profunda|->Regeneración celular|->Disminución de la profundidad de las arrugas|->Mejora el aspecto de la piel'),
	(2, 'LIMPIEZA DE ESPALDA', 'Al igual que la limpieza facial también existe la limpieza de espalda ya que es una de las zonas donde mayor cantidad de impurezas se acumulan y no sólo por ser una de las zonas donde más glandulas sebáceas existen del cuerpo sino que también es una de las partes del cuerpo que menos atención le prestamos ya que al no ser tan visual la obviamos más que otras partes. ', 'Beneficios', 'Piel más limpia y libre de impurezas|->Disminución en la aparición de pústulas (espinillas)|->Disminución de puntos negros|->Mejoras en la calidad de la piel'),
	(3, 'HIDRATACIÓN FACIAL', 'Hidrata a profundidad tu piel. Al mismo tiempo va a restaurar y estimular los mecanismos de tu piel para evitar que siga perdiendo agua y así mantenga el nivel hídrico óptimo de la piel.\r\n\r\nEste tratamiento es ideal para recuperar rápidamente la hidratación, tonicidad y brillo natural de la piel. Deja el cutis radiante y revitalizado. Pieles desnutridas secas, deshidratadas, con signos de estrés epidérmico. Ideal para aplicar en la zona del rostro y cuello, área frecuentemente descuidada y sujeta a gran deshidratación.\r\nLa hidratación facial está indicada para personas con pieles secas y deshidratadas.\r\n\r\nCualquier circunstancia que modifique o altere el contenido acuoso de la piel provoca una deshidratación, y ésta, cuando afecta un nivel de profundidad en la piel, origina una apariencia envejecida, lo que conlleva a que sea el primer paso a la vejez\r\r\n', '', ''),
	(4, 'PEELING', 'Peeling, significa peladura en inglés y consiste en la administración directa en la piel de ácidos de profundidad media. Lo realiza directamente por el médico especialista y tiene como objetivo eliminar la capa superficial de la piel, mejorando manchas, arrugas y cicatrices.\r\r\n\r\n<span class="colMor" style="font-size:1.2em;">¿Quiénes pueden beneficiarse?</span>\r\r\nSon candidatos quienes presenten un envejecimiento facial debido a la exposición solar, hipercromías (manchas), acné, queratosis, flacidez cutánea, pequeñas arrugas, estrías, cicatrices, poros abiertos', '¿Qué ventajas ofrece? ', 'Puede realizarse en cualquier época del año, en cualquier tipo de piel y en cualquier parte del cuerpo.|->Es rápido, simple e indoloro.|->No precisa anestesia general ni ingreso en clínica.|->Un cutis más luminoso, uniforme, compacto y elástico.'),
	(5, 'FOTOREJUVENECIMIENTO', 'Que tu piel este siempre lista para cualquier ocasión, sin necesidad de tener que llevar a cabo tratamientos dolorosos. La energía de la tecnología IPL transforma la luz en calor para permitir que tu piel luzca joven y radiante sin importar tu edad. La luz del IPL ataca los pigmentos que forman las manchas en tu piel, homogenizando el color\r\r\nCon el paso de tus sesiones de tratamiento podrás observar cómo se atenuan las arrugas finas y se disminuye el tamaño de los poros. Es importante que no estés consumiendo medicinas fotosensibles.\r\r\nEs un sistema de luz con calor, es por eso que es importante que protejas tu piel con bloqueador solar y la hidrates con gel de sábila.', '', ''),
	(6, 'DEPILACION LASER', 'Utilizamos equipos especializados para depilacion definitiva con tecnología de luz ultra pulsada la cual permite ajustar el calor, la intensidad para que se ajuste correctamente a tu tipo de piel.\r\r\n El IPL o luz ultra pulsada es la siguiente generacion del laser tradicional, le permite a nuestras expertas en depilacion realizar tratamientos personalizados para obtener mejores resultados.\r\r\nLa luz del IPL transforma la luz en calor para eliminar poco a poco las celulas responsables del crecimiento del vello hasta que no vuelve a crecer. \r\r\nEn la depilacion definitiva eliminamos el vello de forma definitiva y sin dolor mediante la aplicacion de tecnologia de IPL (Luz ultra pulsada). ', '', ''),
	(7, 'CARBOXITERAPIA', 'Es una técnica que esta basada en la aplicación percutánea de dióxido de carbono para lograr excelentes resultados estéticos, este tratamiento ofrece los mismos beneficios a la piel como el hacer ejercicio aeróbico.\r\r\nLa carboxiterapia ayuda a mejorar la circulación en piel como la oxigenación de los músculos lo que ejerce efectos favorables en la función muscular.', 'Entre sus aplicaciones se encuentran:', 'Celulitis|->Obesidad localizada |->Circulación periférica |->Fibrosis (post-quirúrgica) |->Psoriasis|->Flacidez cutánea'),
	(8, 'ULTRACAVITACIÓN', 'La ultracavitación consiste en un tratamiento no invasivo de aplicación médica que combate la grasa localizada y la celulitis mediante la aplicación de un novedoso equipo de ultrasonidos de nueva generación de alta potencia. Normalmente, los tratamiento duran de 30 a 45 minutos y permiten lograr una reducción de aproximadamente 2 cm por sesión.\r\n', '¿Cuáles son los resultados?', 'Cambios visibles desde las primeras sesiones|->Mejora progresiva de la llamada "piel de naranja"|->Transcurridos varios días de la primera sesión, se manifiesta la reducción de volumen de los acúmulos grasos|->Modelaje del cuerpo y eliminación la celulitis, con resultados altamente satisfactorios en cuanto a reducción de volumen|->Cada sesión de ultracavitación tiene una duración de entre 30 y 45 minutos|->Se aplica directamente sobre la piel y el paciente no percibe ningún tipo de dolor o de molestia. De hecho, el tratamiento es muy agradable|->Una vez finalizada la aplicación de la ultracavitación, es recomendable realizar un drenaje linfático, durante un mínimo de 10 a 15 minutos|->El número óptimo de sesiones se sitúa entre ocho y doce, realizadas dos veces por semana (cada 72 horas).'),
	(9, 'VACUMTERAPIA', 'La vacumterapia es un procedimiento no invasivo que se realiza a través de la piel por medio de un equipo que ejerce presión negativa en zonas específicas del cuerpo, usando diversos accesorios que actúan por succión a nivel hipodérmico con formas especializadas para las diferentes zonas a tratar.', 'Ventajas', 'Es un tratamiento seguro.|->No requiere hospitalización, después del tratamiento el paciente vuelve a un estilo de vida normal de inmediato.|->No se requiere anestesia.|->No es un procedimiento invasivo.|->No requiere intervención quirúrgica.|->Desaparición progresiva de la piel de naranja.|->Se evita la reproducción de la célula adiposa'),
	(10, 'MASAJES REDUCTIVOS', 'El masaje reductivo elimina la acumulación de grasa localizada y estiliza el contorno de la figura, es decir, crea una silueta más estética. Éste se realiza con una presión fuerte y una velocidad más rápida que la forma tradicional. ', 'Beneficios:', 'Es ideal para remover y eliminar la grasa no deseada|->Ayuda a disolver el tejido adiposo y la celulitis, por el calor que se genera de los movimientos especiales|->Intensifica la circulación y los procesos del metabolismo local, y ayuda a reabsorber las grasas e incrementa el consumo de calorías debido al aumento de la actividad motora.|->Se puede realizar en cualquier parte del cuerpo: cintura, caderas, piernas, abdomen y hasta debajo de la barbilla|->Beneficia la circulación sanguínea y linfática|->Reafirman y tonifican los músculos, por lo que compensan la falta de ejercicio|->Contribuye a eliminar la tensión muscular'),
	(11, 'MASAJES RELAJANTES', 'Los masajes relajantes son un tipo de tratamiento manual que se aplica en forma firme y progresiva con objeto de descargar la tensión acumulada sobre el cuerpo y calmar la mente.\r\n\r\nIdeados originalmente con el propósito de relajar los músculos, los masajes relajantes al igual que otros tratamientos manuales, desarrollan diferentes movimientos técnicos y maniobras armónicas, a efecto de que se estimule físicamente al organismo y surjan en él reacciones benéficas del tipo muscular, biológico, metabólico y hasta psicológico.\r\n\r\nEl masaje relajante es un procedimiento externo, natural y relajado, sin efectos secundarios, que se aplica por medio de las manos y antebrazos, sin el auxilio de aparatos, pero sí muchas veces con la ayuda de aceites y cremas, dentro de una atmósfera que invita a la tranquilidad. ', '', NULL),
	(12, 'CHOCOTERAPIA', 'La chocoterapia es un tratamiento beneficioso tanto física como mentalmente ya que nos permite hidratar y tonificar nuestra piel al mismo tiempo que nos ayuda a relajarnos y dejar de lado el estrés.\r\n\r\nEnergiza y reconforta tu cuerpo, al mismo tiempo que revitaliza la piel, dejándola suave, sin impurezas y ligeramente perfumada.\r\n\r\nOtro gran beneficio de la chocoterapia es el comprobado efecto antioxidante de sus componentes que ayudan en tratamientos anti-envejecimiento revitalizando la piel de manera asombrosa.\r\n\r\nA nivel psicológico se ha probado que el chocolate activa las endorfinas y estimula la serotonina lo que hace maravillas por nuestro estado de ánimo actuando como calmante natural.\r\n\r\nEl tratamiento de masajes con chocolate es un tratamiento integral, es decir, abarca tanto cuerpo como rostro.', '', NULL),
	(13, 'ENDERMOLOGY', 'Un tratamiento no invasivo y sin dolor. La técnica de Endermology (LPG) es practicada por profesionales de la salud y la belleza. \r\n\r\nLa alta tecnología de (LPG) permite al médico realizar una mecanización óptima sobre todo en las células grasas de la hipodermis. Esta gimnasia cutánea permite reestructurar el tejido conjuntivo y reactiva la circulación sanguínea y linfática.	 \r\n\r\nComo resultado de ésta técnica tenemos un cuerpo esbelto y afinado, una piel más suave y firme. Además, éste procedimiento sin dolor ofrece bienestar y relajación. Con ésta técnica de masaje profundo que utiliza un aparato de alta tecnología mediante un sistema de aspiración y dos rodillos, tracciona la piel y estimula la circulación sanguínea y linfática en su profundidad.', '', NULL),
	(14, 'DRENAJE LINFÁTICO', 'El uso del drenaje linfático corporal ha adquirido importancia en los últimos años. Esta técnica consiste en la realización de masajes, eso es lo que lo hace interesante, pues el paciente no sufre durante su realización, sino que por el contrario es un momento agradable y relajante para el paciente, donde además se le están tratando diversos tipos de edemas por los cuales usted puede estar afectado.\r\n\r\nPor medio del drenaje linfático corporal se trabaja exhaustivamente el sistema linfático. Gracias a este, las sustancias vitales regresan al sistema circulatorio, aportándole las proteínas del plasma que se encuentran en diversos tejidos del cuerpo; este ayuda a mantener el equilibrio de los líquidos compensándolos por medio del drenaje de los tejidos, ayuda a prever enfermedades haciendo al cuerpo más sano y resistente, así como favorece la absorción positiva de grasas que se encuentran en el sistema digestivo. ', '', NULL),
	(15, 'RADIOFRECUENCIA', 'La radiofrecuencia consiste en la aplicación de ondas electromagnéticas de alta frecuencia sobre la piel que provoca el calentamiento controlado de las diferentes capas de la dermis, lo que favorece:\r\n<ul><li>La formación de nuevo colágeno.</li><li>El drenaje linfático.</li><li>La circulación de la piel y el tejido subcutáneo.</li><li>La migración de fibroblastos.</li></ul>\r\nEn función de la frecuencia que se utilice se pueden calentar diferentes capas de la dermis. Es un procedimiento indoloro y que se utiliza para el tratamiento de la celulitis y la flacidez de la piel en cualquier parte del cuerpo.', '', NULL);
/*!40000 ALTER TABLE `tratamientos` ENABLE KEYS */;


-- Dumping structure for table mundosal_page.tratamientos_imagenes
CREATE TABLE IF NOT EXISTS `tratamientos_imagenes` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `tratamiento_id` int(11) NOT NULL COMMENT 'Tratamiento',
  `pic` varchar(5) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Extensión',
  PRIMARY KEY (`id`),
  KEY `tratamiento_id` (`tratamiento_id`),
  CONSTRAINT `FK__tratamientos` FOREIGN KEY (`tratamiento_id`) REFERENCES `tratamientos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table mundosal_page.tratamientos_imagenes: ~45 rows (approximately)
/*!40000 ALTER TABLE `tratamientos_imagenes` DISABLE KEYS */;
INSERT INTO `tratamientos_imagenes` (`id`, `tratamiento_id`, `pic`) VALUES
	(1, 1, '.jpg'),
	(2, 1, '.jpg'),
	(3, 1, '.jpg'),
	(4, 2, '.jpg'),
	(5, 2, '.jpg'),
	(6, 2, '.jpg'),
	(7, 3, '.jpg'),
	(8, 3, '.jpg'),
	(9, 3, '.jpg'),
	(10, 4, '.jpg'),
	(11, 4, '.jpg'),
	(12, 4, '.jpg'),
	(13, 5, '.jpg'),
	(14, 5, '.jpg'),
	(15, 5, '.jpg'),
	(16, 6, '.jpg'),
	(17, 6, '.jpg'),
	(18, 6, '.jpg'),
	(19, 7, '.jpg'),
	(20, 7, '.jpg'),
	(21, 7, '.jpg'),
	(22, 8, '.jpg'),
	(23, 8, '.jpg'),
	(24, 8, '.jpg'),
	(25, 9, '.jpg'),
	(26, 9, '.jpg'),
	(27, 9, '.jpg'),
	(28, 10, '.jpg'),
	(29, 10, '.jpg'),
	(30, 10, '.jpg'),
	(31, 11, '.jpg'),
	(32, 11, '.jpg'),
	(33, 11, '.jpg'),
	(34, 12, '.jpg'),
	(35, 12, '.jpg'),
	(36, 12, '.jpg'),
	(37, 13, '.jpg'),
	(38, 13, '.jpg'),
	(39, 13, '.jpg'),
	(40, 14, '.jpg'),
	(41, 14, '.jpg'),
	(42, 14, '.jpg'),
	(43, 15, '.jpg'),
	(44, 15, '.jpg'),
	(45, 15, '.jpg');
/*!40000 ALTER TABLE `tratamientos_imagenes` ENABLE KEYS */;


-- Dumping structure for table mundosal_page.visitas
CREATE TABLE IF NOT EXISTS `visitas` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `timeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha y hora',
  `ipAddress` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Dirección IP',
  `forwardedIpAddress` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Proxy IP o LAN IP',
  `status` int(11) NOT NULL COMMENT 'Estatus',
  `city` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Ciudad',
  `region` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Estado/Región',
  `countryName` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'País',
  `countryCode` varchar(5) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Código país',
  `latitude` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Latitud',
  `longitude` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Longitud',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table mundosal_page.visitas: ~0 rows (approximately)
/*!40000 ALTER TABLE `visitas` DISABLE KEYS */;
/*!40000 ALTER TABLE `visitas` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
