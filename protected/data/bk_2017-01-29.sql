
-- Base de datos: `mundosaludgestor`
--
CREATE DATABASE IF NOT EXISTS `mundosaludgestor` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `mundosaludgestor`;
--
-- Base de datos: `mundosaludsite`
--
CREATE DATABASE IF NOT EXISTS `mundosaludsite` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `mundosaludsite`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contacto`
--

CREATE TABLE IF NOT EXISTS `contacto` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `tipo_id` int(11) NOT NULL COMMENT 'Tipo',
  `grupo_id` int(11) NOT NULL COMMENT 'Grupo',
  `valor` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Valor',
  `activo` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Activo',
  PRIMARY KEY (`id`),
  KEY `atributo_tipo` (`tipo_id`),
  KEY `contacto_grupo` (`grupo_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='usar con campos como email, telefono o dirección, que pueden ser mas de uno' AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `contacto`
--

INSERT INTO `contacto` (`id`, `tipo_id`, `grupo_id`, `valor`, `activo`) VALUES
(1, 1, 1, 'Av. Bella Vista, entre calle 69 y 70, Edif. Lisa María, piso No. 1 Local No. 3 ', 1),
(2, 2, 1, 'Telf: (0261)7983202 - 7978341-7989486-7988343', 1),
(3, 1, 2, 'Av. La Limpia, Sector La Fusta C.C La Espacial diagonal a la farmacia SAAS ', 1),
(4, 2, 2, 'Telf: (0261)7594186- (0414)6209489', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contacto_grupos`
--

CREATE TABLE IF NOT EXISTS `contacto_grupos` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `titulo` varchar(140) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Título',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `contacto_grupos`
--

INSERT INTO `contacto_grupos` (`id`, `titulo`) VALUES
(1, 'PARA SPA Y PROGRAMAR TU CITA DE MÉDICO EN SU CASA'),
(2, 'PARA ODONTOLOGÍA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contacto_tipos`
--

CREATE TABLE IF NOT EXISTS `contacto_tipos` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `etiqueta` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Etiqueta',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `contacto_tipos`
--

INSERT INTO `contacto_tipos` (`id`, `etiqueta`) VALUES
(1, 'direccion'),
(2, 'telefono'),
(3, 'email');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

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

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`id`, `nombre`, `rif`, `impuesto`, `direccion`, `somos`, `mision`, `vision`) VALUES
(0, 'Mundo Salud, C. A.', 'J-31134350-4', '25.360', 'Av. Bella Vista entre calle 69 y 70 Edif. Lisa María, piso N° 1 Local N° 3', 'Está conformado por un grupo de médicos especialistas y terapeutas profesionales, que ofrecen una variedad de tratamientos de base médica, utilizando tecnología y productos de última generación, cada uno orientado a garantizar la mayor satisfacción posible e inducir elevados niveles de bienestar. Nuestro innovador sistema de previsión le permite tener acceso a nuestros productos y servicios de manera rápida y sencilla', 'Mundo Salud es una empresa integral que cuenta con más de 10 años de experiencia en el mercado, ofrece servicios en Salud, estética, y cosmetología, brindándole a nuestros afiliados costos accesibles y tratamientos de calidad, utilizando la más alta tecnología y un personal altamente calificado, siguiendo la gerencia del servicio como eje central, logrando satisfacer las necesidades de cada afiliado.', 'Posicionarnos en el mercado occidental como empresa líder en los servicios de salud, estética, y cosmetologías, teniendo como objetivo principal la excelencia del servicio.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu`
--

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=24 ;

--
-- Volcado de datos para la tabla `menu`
--

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metadata`
--

CREATE TABLE IF NOT EXISTS `metadata` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `menu_id` int(11) DEFAULT NULL,
  `tipo_id` int(11) NOT NULL,
  `prop_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `prop_name_value` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Twt',
  `content` varchar(400) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Web (155),Twt (200), FB, Pin, G+',
  PRIMARY KEY (`id`),
  KEY `menu_id` (`menu_id`),
  KEY `meta_data_tipo` (`tipo_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=14 ;

--
-- Volcado de datos para la tabla `metadata`
--

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metadata_tipo`
--

CREATE TABLE IF NOT EXISTS `metadata_tipo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(140) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `metadata_tipo`
--

INSERT INTO `metadata_tipo` (`id`, `nombre`, `descripcion`) VALUES
(1, 'Web', 'De uso básico en el documento HTML'),
(2, 'Twitter', 'Red social'),
(3, 'Open Graph', 'Open Graph data'),
(4, 'Google', 'Red social G+');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planes`
--

CREATE TABLE IF NOT EXISTS `planes` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `titulo` text COLLATE utf8_unicode_ci COMMENT 'Título',
  `miembros` smallint(6) DEFAULT NULL COMMENT 'Cantidad de miembros',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `planes`
--

INSERT INTO `planes` (`id`, `titulo`, `miembros`) VALUES
(1, 'PLAN EMPRESARIAL\r\nCONSULTA MÉDICA DOMICILIARIA PROGRAMADA\r\nESTETICA Y ODONTOLOGICA', 5),
(2, 'PLAN PARTICULAR\r\nCONSULTA MÉDICA DOMICILIARIA PROGRAMADA\r\nESTETICA Y ODONTOLOGICA', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planes_componentes`
--

CREATE TABLE IF NOT EXISTS `planes_componentes` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `descripcion` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Descripción',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `planes_componentes`
--

INSERT INTO `planes_componentes` (`id`, `descripcion`) VALUES
(1, 'Consulta médica domiciliaria programada'),
(2, 'Piel Canela  Spa'),
(3, 'Plan Básico odontológico gratis');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planes_componentes_group`
--

CREATE TABLE IF NOT EXISTS `planes_componentes_group` (
  `plan_id` int(11) NOT NULL,
  `componente_id` int(11) NOT NULL,
  KEY `plan_id` (`plan_id`),
  KEY `componente_id` (`componente_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `planes_componentes_group`
--

INSERT INTO `planes_componentes_group` (`plan_id`, `componente_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 2),
(2, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planes_costos`
--

CREATE TABLE IF NOT EXISTS `planes_costos` (
  `plan_id` int(11) NOT NULL,
  `modalidad_id` int(11) NOT NULL,
  `frecuencia_id` int(11) NOT NULL,
  `costo` decimal(10,3) NOT NULL,
  KEY `FK_planes_costos_planes` (`plan_id`),
  KEY `FK_planes_costos_planes_modalidad` (`modalidad_id`),
  KEY `FK_planes_costos_planes_frecuencia` (`frecuencia_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `planes_costos`
--

INSERT INTO `planes_costos` (`plan_id`, `modalidad_id`, `frecuencia_id`, `costo`) VALUES
(1, 1, 2, '210.000'),
(1, 2, 2, '100.000'),
(2, 1, 1, '160.000'),
(2, 1, 2, '280.000'),
(2, 2, 2, '100.000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planes_frecuencia`
--

CREATE TABLE IF NOT EXISTS `planes_frecuencia` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `nombre` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Nombre',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Frecuencia de pago de planes' AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `planes_frecuencia`
--

INSERT INTO `planes_frecuencia` (`id`, `nombre`) VALUES
(1, 'Inscripción'),
(2, 'Mensual');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planes_modalidad`
--

CREATE TABLE IF NOT EXISTS `planes_modalidad` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `nombre` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Nombre',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Modo del plan: por grupo o por persona adicional' AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `planes_modalidad`
--

INSERT INTO `planes_modalidad` (`id`, `nombre`) VALUES
(1, 'Grupo familiar'),
(2, 'Adicional');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `redes`
--

CREATE TABLE IF NOT EXISTS `redes` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `tipo` int(11) NOT NULL COMMENT 'Tipo',
  `user` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Username',
  `iconOff` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Icono inactivo',
  `iconOn` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Icono activo',
  PRIMARY KEY (`id`),
  KEY `FK_redes_redes_tipos` (`tipo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `redes`
--

INSERT INTO `redes` (`id`, `tipo`, `user`, `iconOff`, `iconOn`) VALUES
(1, 1, 'mundo.salud.58', '1Off.png', '1On.png'),
(2, 2, 'MundoSaludCA', '2Off.png', '2On.png'),
(3, 3, 'mundo_salud_c.a', '3Off.png', '3On.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `redes_tipos`
--

CREATE TABLE IF NOT EXISTS `redes_tipos` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `nombre` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Nombre',
  `url` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT 'URL de la red social',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `redes_tipos`
--

INSERT INTO `redes_tipos` (`id`, `nombre`, `url`) VALUES
(1, 'Facebook', 'http://www.facebook.com/'),
(2, 'Twitter', 'http://twitter.com/'),
(3, 'Instagram', 'http://instagram.com/');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tratamientos`
--

CREATE TABLE IF NOT EXISTS `tratamientos` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `titulo` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Título',
  `descripcion` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Descripción',
  `lista_etiqueta` varchar(140) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Etiqueta de la lista',
  `lista_elementos` text COLLATE utf8_unicode_ci COMMENT 'Lista de elementos',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=16 ;

--
-- Volcado de datos para la tabla `tratamientos`
--

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
(13, 'ENDERMOLOGY', 'Un tratamiento no invasivo y sin dolor. La técnica de Endermology (LPG) es practicada por profesionales de la salud y la belleza. \r\n\r\nLa alta tecnología de (LPG) permite al médico realizar una mecanización óptima sobre todo en las células grasas de la hipodermis. Esta gimnasia cutánea permite reestructurar el tejido conjuntivo y reactiva la circulación sanguínea y linfática.   \r\n\r\nComo resultado de ésta técnica tenemos un cuerpo esbelto y afinado, una piel más suave y firme. Además, éste procedimiento sin dolor ofrece bienestar y relajación. Con ésta técnica de masaje profundo que utiliza un aparato de alta tecnología mediante un sistema de aspiración y dos rodillos, tracciona la piel y estimula la circulación sanguínea y linfática en su profundidad.', '', NULL),
(14, 'DRENAJE LINFÁTICO', 'El uso del drenaje linfático corporal ha adquirido importancia en los últimos años. Esta técnica consiste en la realización de masajes, eso es lo que lo hace interesante, pues el paciente no sufre durante su realización, sino que por el contrario es un momento agradable y relajante para el paciente, donde además se le están tratando diversos tipos de edemas por los cuales usted puede estar afectado.\r\n\r\nPor medio del drenaje linfático corporal se trabaja exhaustivamente el sistema linfático. Gracias a este, las sustancias vitales regresan al sistema circulatorio, aportándole las proteínas del plasma que se encuentran en diversos tejidos del cuerpo; este ayuda a mantener el equilibrio de los líquidos compensándolos por medio del drenaje de los tejidos, ayuda a prever enfermedades haciendo al cuerpo más sano y resistente, así como favorece la absorción positiva de grasas que se encuentran en el sistema digestivo. ', '', NULL),
(15, 'RADIOFRECUENCIA', 'La radiofrecuencia consiste en la aplicación de ondas electromagnéticas de alta frecuencia sobre la piel que provoca el calentamiento controlado de las diferentes capas de la dermis, lo que favorece:\r\n<ul><li>La formación de nuevo colágeno.</li><li>El drenaje linfático.</li><li>La circulación de la piel y el tejido subcutáneo.</li><li>La migración de fibroblastos.</li></ul>\r\nEn función de la frecuencia que se utilice se pueden calentar diferentes capas de la dermis. Es un procedimiento indoloro y que se utiliza para el tratamiento de la celulitis y la flacidez de la piel en cualquier parte del cuerpo.', '', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tratamientos_imagenes`
--

CREATE TABLE IF NOT EXISTS `tratamientos_imagenes` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `tratamiento_id` int(11) NOT NULL COMMENT 'Tratamiento',
  `pic` varchar(5) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Extensión',
  PRIMARY KEY (`id`),
  KEY `tratamiento_id` (`tratamiento_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=46 ;

--
-- Volcado de datos para la tabla `tratamientos_imagenes`
--

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `visitas`
--

CREATE TABLE IF NOT EXISTS `visitas` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `timeStamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Fecha y hora',
  `ipAddress` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Dirección IP',
  `status` int(11) DEFAULT NULL COMMENT 'Estatus',
  `city` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Ciudad',
  `region` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Estado/Región',
  `countryName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'País',
  `countryCode` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Código país',
  `latitude` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Latitud',
  `longitude` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Longitud',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=486 ;

--
-- Volcado de datos para la tabla `visitas`
--

INSERT INTO `visitas` (`id`, `timeStamp`, `ipAddress`, `status`, `city`, `region`, `countryName`, `countryCode`, `latitude`, `longitude`) VALUES
(1, '2014-10-31 19:10:56', '127.0.0.1', 404, '', '', '', '', '0', '0'),
(2, '2014-10-31 19:10:49', '127.0.0.1', 404, '', '', '', '', '0', '0'),
(3, '2014-10-31 19:10:18', '127.0.0.1', 404, '', '', '', '', '0', '0'),
(4, '2014-10-31 19:10:14', '127.0.0.1', 404, '', '', '', '', '0', '0'),
(5, '2014-11-01 02:10:13', '127.0.0.1', 404, '', '', '', '', '0', '0'),
(6, '2014-11-02 00:11:39', '127.0.0.1', 404, '', '', '', '', '0', '0'),
(7, '2014-11-08 17:11:24', '127.0.0.1', 404, '', '', '', '', '0', '0'),
(8, '2015-01-13 02:01:29', '127.0.0.1', 404, '', '', '', '', '0', '0'),
(9, '2015-01-13 02:01:54', '127.0.0.1', 404, '', '', '', '', '0', '0'),
(10, '2015-01-14 02:01:55', '127.0.0.1', 404, '', '', '', '', '0', '0'),
(11, '2015-01-25 17:01:16', '127.0.0.1', 404, '', '', '', '', '0', '0'),
(12, '2015-05-22 19:05:51', '190.207.4.71', 206, '', '', 'Venezuela', 'VE', '8', '-66'),
(13, '2015-05-22 19:05:34', '190.207.4.71', 206, '', '', 'Venezuela', 'VE', '8', '-66'),
(14, '2016-03-03 19:03:08', '190.27.113.24', 206, '', '', 'Colombia', 'CO', '4.5981', '-74.0758'),
(15, '2016-03-04 04:03:06', '181.50.59.79', 200, '', 'Distrito Capital', 'Colombia', 'CO', '4.6492', '-74.0628'),
(16, '2016-03-08 05:03:23', '181.50.59.79', 200, 'Bogot&aacute;', 'Distrito Capital', 'Colombia', 'CO', '4.6492', '-74.0628'),
(17, '2016-03-09 22:03:38', '201.237.123.150', 200, 'Liberia', 'Guanacaste', 'Costa Rica', 'CR', '10.635', '-85.4377'),
(18, '2016-03-19 00:03:52', '137.117.49.13', 206, '', '', 'United States', 'US', '38', '-97'),
(19, '2016-03-19 00:03:07', '137.117.49.13', 206, '', '', 'United States', 'US', '38', '-97'),
(20, '2016-03-19 00:03:08', '137.117.49.13', 206, '', '', 'United States', 'US', '38', '-97'),
(21, '2016-03-19 00:03:09', '137.117.49.13', 206, '', '', 'United States', 'US', '38', '-97'),
(22, '2016-03-19 00:03:10', '137.117.49.13', 206, '', '', 'United States', 'US', '38', '-97'),
(23, '2016-03-19 00:03:11', '137.117.49.13', 206, '', '', 'United States', 'US', '38', '-97'),
(24, '2016-03-19 00:03:12', '137.117.49.13', 206, '', '', 'United States', 'US', '38', '-97'),
(25, '2016-03-19 00:03:13', '137.117.49.13', 206, '', '', 'United States', 'US', '38', '-97'),
(26, '2016-03-19 00:03:14', '137.117.49.13', 206, '', '', 'United States', 'US', '38', '-97'),
(27, '2016-03-19 00:03:15', '137.117.49.13', 206, '', '', 'United States', 'US', '38', '-97'),
(28, '2016-03-19 00:03:16', '137.117.49.13', 206, '', '', 'United States', 'US', '38', '-97'),
(29, '2016-03-19 00:03:17', '137.117.49.13', 206, '', '', 'United States', 'US', '38', '-97'),
(30, '2016-03-19 00:03:18', '137.117.49.13', 206, '', '', 'United States', 'US', '38', '-97'),
(31, '2016-03-19 00:03:19', '137.117.49.13', 206, '', '', 'United States', 'US', '38', '-97'),
(32, '2016-03-19 00:03:20', '137.117.49.13', 206, '', '', 'United States', 'US', '38', '-97'),
(33, '2016-03-19 00:03:21', '137.117.49.13', 206, '', '', 'United States', 'US', '38', '-97'),
(34, '2016-03-19 00:03:22', '137.117.49.13', 206, '', '', 'United States', 'US', '38', '-97'),
(35, '2016-03-19 00:03:23', '137.117.49.13', 206, '', '', 'United States', 'US', '38', '-97'),
(36, '2016-03-19 00:03:24', '137.117.49.13', 206, '', '', 'United States', 'US', '38', '-97'),
(37, '2016-03-19 00:03:25', '137.117.49.13', 206, '', '', 'United States', 'US', '38', '-97'),
(38, '2016-03-19 00:03:26', '137.117.49.13', 206, '', '', 'United States', 'US', '38', '-97'),
(39, '2016-03-19 00:03:27', '137.117.49.13', 206, '', '', 'United States', 'US', '38', '-97'),
(40, '2016-03-19 11:03:22', '69.58.178.59', 200, 'Reston', 'VA', 'United States', 'US', '38.9599', '-77.3428'),
(41, '2016-03-22 17:03:05', '66.249.65.60', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(42, '2016-03-22 17:03:01', '66.249.65.60', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(43, '2016-03-22 17:03:20', '66.249.65.54', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(44, '2016-03-22 17:03:30', '66.249.65.54', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(45, '2016-03-22 17:03:42', '66.249.65.54', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(46, '2016-03-22 17:03:05', '66.249.65.54', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(47, '2016-03-22 17:03:19', '66.249.65.54', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(48, '2016-03-22 17:03:24', '66.249.65.54', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(49, '2016-03-22 17:03:38', '66.249.65.54', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(50, '2016-03-22 17:03:52', '66.249.65.54', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(51, '2016-03-22 17:03:21', '66.249.65.54', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(52, '2016-03-22 17:03:58', '66.249.65.54', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(53, '2016-03-22 17:03:22', '66.249.65.54', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(54, '2016-03-22 17:03:36', '66.249.65.54', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(55, '2016-03-22 17:03:54', '66.249.65.54', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(56, '2016-03-22 18:03:05', '66.249.65.54', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(57, '2016-03-22 18:03:18', '66.249.65.54', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(58, '2016-03-22 18:03:28', '66.249.65.54', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(59, '2016-03-22 18:03:57', '66.249.65.54', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(60, '2016-03-22 18:03:11', '66.249.65.54', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(61, '2016-03-22 18:03:38', '66.249.65.54', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(62, '2016-03-22 18:03:54', '66.249.65.54', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(63, '2016-03-22 18:03:48', '66.249.65.54', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(64, '2016-03-24 10:03:09', '66.249.65.54', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(65, '2016-03-24 10:03:30', '66.249.65.54', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(66, '2016-03-24 12:03:51', '66.249.65.60', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(67, '2016-03-24 13:03:04', '66.249.65.60', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(68, '2016-03-24 16:03:54', '66.249.65.60', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(69, '2016-03-24 21:03:46', '66.249.65.57', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(70, '2016-03-25 15:03:44', '66.249.75.105', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(71, '2016-03-26 08:03:55', '66.249.75.98', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(72, '2016-03-27 01:03:25', '66.249.75.105', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(73, '2016-03-27 06:03:29', '66.249.75.98', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(74, '2016-03-28 03:03:10', '207.46.13.170', 200, 'Redmond', 'WA', 'United States', 'US', '47.6801', '-122.1206'),
(75, '2016-03-28 05:03:11', '66.249.65.60', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(76, '2016-03-28 09:03:18', '66.249.65.57', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(77, '2016-03-28 23:03:36', '66.249.65.60', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(78, '2016-03-30 14:03:25', '157.55.39.244', 200, 'Redmond', 'WA', 'United States', 'US', '47.6801', '-122.1206'),
(79, '2016-03-30 21:03:22', '66.249.64.88', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(80, '2016-04-01 19:04:54', '66.249.65.54', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(81, '2016-04-02 03:04:34', '66.249.65.54', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(82, '2016-04-03 02:04:15', '157.55.39.199', 200, 'Redmond', 'WA', 'United States', 'US', '47.6801', '-122.1206'),
(83, '2016-04-03 20:04:06', '66.249.75.112', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(84, '2016-04-04 02:04:54', '66.249.75.112', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(85, '2016-04-05 02:04:23', '66.249.75.112', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(86, '2016-04-05 10:04:22', '157.55.39.5', 200, 'Redmond', 'WA', 'United States', 'US', '47.6801', '-122.1206'),
(87, '2016-04-06 20:04:18', '66.249.75.98', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(88, '2016-04-07 08:04:04', '66.249.75.105', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(89, '2016-04-07 12:04:48', '66.249.64.88', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(90, '2016-04-08 03:04:30', '66.249.64.83', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(91, '2016-04-08 17:04:25', '66.249.64.88', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(92, '2016-04-09 17:04:28', '66.249.64.78', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(93, '2016-04-09 23:04:57', '66.249.64.83', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(94, '2016-04-10 02:04:01', '66.249.64.88', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(95, '2016-04-10 16:04:15', '66.249.64.83', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(96, '2016-04-11 06:04:26', '66.249.64.78', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(97, '2016-04-11 15:04:50', '190.248.139.130', 200, '', 'Antioquia', 'Colombia', 'CO', '6.2518', '-75.5636'),
(98, '2016-04-11 19:04:07', '157.55.39.63', 200, 'Redmond', 'WA', 'United States', 'US', '47.6801', '-122.1206'),
(99, '2016-04-11 22:04:57', '66.249.64.78', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(100, '2016-04-12 05:04:30', '66.249.64.78', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(101, '2016-04-12 15:04:25', '66.249.64.78', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(102, '2016-04-13 03:04:39', '66.249.64.88', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(103, '2016-04-13 03:04:29', '201.191.92.196', 206, '', '', 'Costa Rica', 'CR', '10', '-84'),
(104, '2016-04-13 08:04:44', '190.97.254.2', 200, '', 'M&eacute;rida', 'Venezuela', 'VE', '8.5983', '-71.145'),
(105, '2016-04-13 23:04:45', '66.249.64.88', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(106, '2016-04-14 15:04:37', '157.55.39.116', 200, 'Redmond', 'WA', 'United States', 'US', '47.6801', '-122.1206'),
(107, '2016-04-15 04:04:15', '66.249.64.78', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(108, '2016-04-16 04:04:48', '66.249.64.78', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(109, '2016-04-16 10:04:10', '66.249.64.83', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(110, '2016-04-16 11:04:13', '66.249.64.78', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(111, '2016-04-18 16:04:09', '66.249.64.88', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(112, '2016-04-19 09:04:29', '66.249.64.83', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(113, '2016-04-19 10:04:13', '66.249.64.88', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(114, '2016-04-19 20:04:33', '69.58.178.56', 200, 'Reston', 'VA', 'United States', 'US', '38.9599', '-77.3428'),
(115, '2016-04-20 03:04:42', '66.249.64.83', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(116, '2016-04-28 02:04:29', '207.46.13.106', 200, 'Redmond', 'WA', 'United States', 'US', '47.6801', '-122.1206'),
(117, '2016-04-29 01:04:09', '66.249.64.210', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(118, '2016-05-04 08:05:24', '157.55.39.231', 200, 'Redmond', 'WA', 'United States', 'US', '47.6801', '-122.1206'),
(119, '2016-05-05 06:05:28', '157.55.39.88', 200, 'Redmond', 'WA', 'United States', 'US', '47.6801', '-122.1206'),
(120, '2016-05-07 03:05:47', '40.77.167.81', 206, '', '', 'United States', 'US', '38', '-97'),
(121, '2016-05-12 15:05:47', '13.92.246.173', 200, 'Washington', 'DC', 'United States', 'US', '38.8951', '-77.0364'),
(122, '2016-05-12 15:05:16', '13.92.246.173', 200, 'Washington', 'DC', 'United States', 'US', '38.8951', '-77.0364'),
(123, '2016-05-12 15:05:17', '13.92.246.173', 200, 'Washington', 'DC', 'United States', 'US', '38.8951', '-77.0364'),
(124, '2016-05-12 15:05:19', '13.92.246.173', 200, 'Washington', 'DC', 'United States', 'US', '38.8951', '-77.0364'),
(125, '2016-05-12 15:05:20', '13.92.246.173', 200, 'Washington', 'DC', 'United States', 'US', '38.8951', '-77.0364'),
(126, '2016-05-12 15:05:21', '13.92.246.173', 200, 'Washington', 'DC', 'United States', 'US', '38.8951', '-77.0364'),
(127, '2016-05-12 15:05:24', '13.92.246.173', 200, 'Washington', 'DC', 'United States', 'US', '38.8951', '-77.0364'),
(128, '2016-05-12 15:05:25', '13.92.246.173', 200, 'Washington', 'DC', 'United States', 'US', '38.8951', '-77.0364'),
(129, '2016-05-12 15:05:27', '13.92.246.173', 200, 'Washington', 'DC', 'United States', 'US', '38.8951', '-77.0364'),
(130, '2016-05-12 15:05:28', '13.92.246.173', 200, 'Washington', 'DC', 'United States', 'US', '38.8951', '-77.0364'),
(131, '2016-05-12 15:05:30', '13.92.246.173', 200, 'Washington', 'DC', 'United States', 'US', '38.8951', '-77.0364'),
(132, '2016-05-12 15:05:33', '13.92.246.173', 200, 'Washington', 'DC', 'United States', 'US', '38.8951', '-77.0364'),
(133, '2016-05-12 15:05:35', '13.92.246.173', 200, 'Washington', 'DC', 'United States', 'US', '38.8951', '-77.0364'),
(134, '2016-05-12 15:05:37', '13.92.246.173', 200, 'Washington', 'DC', 'United States', 'US', '38.8951', '-77.0364'),
(135, '2016-05-12 15:05:39', '13.92.246.173', 200, 'Washington', 'DC', 'United States', 'US', '38.8951', '-77.0364'),
(136, '2016-05-12 15:05:41', '13.92.246.173', 200, 'Washington', 'DC', 'United States', 'US', '38.8951', '-77.0364'),
(137, '2016-05-12 15:05:43', '13.92.246.173', 200, 'Washington', 'DC', 'United States', 'US', '38.8951', '-77.0364'),
(138, '2016-05-12 15:05:45', '13.92.246.173', 200, 'Washington', 'DC', 'United States', 'US', '38.8951', '-77.0364'),
(139, '2016-05-12 15:05:46', '13.92.246.173', 200, 'Washington', 'DC', 'United States', 'US', '38.8951', '-77.0364'),
(140, '2016-05-12 15:05:48', '13.92.246.173', 200, 'Washington', 'DC', 'United States', 'US', '38.8951', '-77.0364'),
(141, '2016-05-12 15:05:49', '13.92.246.173', 200, 'Washington', 'DC', 'United States', 'US', '38.8951', '-77.0364'),
(142, '2016-05-12 15:05:50', '13.92.246.173', 200, 'Washington', 'DC', 'United States', 'US', '38.8951', '-77.0364'),
(143, '2016-05-12 15:05:51', '13.92.246.173', 200, 'Washington', 'DC', 'United States', 'US', '38.8951', '-77.0364'),
(144, '2016-05-19 09:05:42', '69.58.178.58', 200, 'Reston', 'VA', 'United States', 'US', '38.9599', '-77.3428'),
(145, '2016-05-24 02:05:01', '13.90.249.177', 200, 'Washington', 'DC', 'United States', 'US', '38.8951', '-77.0364'),
(146, '2016-05-25 09:05:05', '66.249.64.88', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(147, '2016-05-25 09:05:20', '66.249.64.88', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(148, '2016-05-26 17:05:22', '66.249.64.88', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(149, '2016-05-27 14:05:42', '86.47.80.145', 206, '', '', 'Ireland', 'IE', '53.3478', '-6.2597'),
(150, '2016-05-27 14:05:01', '89.234.68.70', 206, '', '', 'Ireland', 'IE', '53.3478', '-6.2597'),
(151, '2016-06-04 17:06:44', '66.249.64.220', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(152, '2016-06-10 08:06:23', '66.249.64.210', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(153, '2016-06-13 01:06:22', '66.249.64.88', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(154, '2016-06-13 13:06:31', '66.249.64.215', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(155, '2016-06-13 19:06:04', '66.249.64.220', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(156, '2016-06-14 02:06:19', '66.249.64.210', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(157, '2016-06-19 16:06:59', '69.58.178.56', 200, 'Reston', 'VA', 'United States', 'US', '38.9599', '-77.3428'),
(158, '2016-06-20 13:06:42', '66.249.64.215', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(159, '2016-06-21 03:06:13', '66.249.64.220', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(160, '2016-06-22 22:06:57', '66.249.64.215', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(161, '2016-07-06 09:07:58', '66.249.64.210', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(162, '2016-07-08 18:07:12', '66.249.64.220', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(163, '2016-07-09 04:07:58', '66.249.64.220', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(164, '2016-07-13 03:07:25', '66.249.64.178', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(165, '2016-07-14 08:07:40', '66.249.64.176', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(166, '2016-07-14 12:07:45', '66.249.64.176', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(167, '2016-07-17 03:07:47', '66.249.64.178', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(168, '2016-07-19 06:07:59', '66.249.64.174', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(169, '2016-07-19 06:07:09', '69.58.178.56', 200, 'Reston', 'VA', 'United States', 'US', '38.9599', '-77.3428'),
(170, '2016-07-20 05:07:18', '66.249.64.178', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(171, '2016-07-21 04:07:33', '66.249.64.178', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(172, '2016-07-23 12:07:43', '66.249.64.178', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(173, '2016-07-24 05:07:38', '66.249.64.176', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(174, '2016-07-24 14:07:08', '66.249.64.178', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(175, '2016-07-26 18:07:52', '66.249.66.190', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(176, '2016-07-27 01:07:27', '66.249.66.187', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(177, '2016-07-29 03:07:46', '66.249.64.178', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(178, '2016-07-29 11:07:40', '66.249.64.176', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(179, '2016-08-03 16:08:54', '66.249.64.178', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(180, '2016-08-06 04:08:06', '66.249.64.178', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(181, '2016-08-12 11:08:21', '66.249.64.48', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(182, '2016-08-14 21:08:59', '66.249.64.174', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(183, '2016-08-19 01:08:09', '69.58.178.58', 200, 'Reston', 'VA', 'United States', 'US', '38.9599', '-77.3428'),
(184, '2016-08-23 10:08:31', '158.106.67.149', 200, '', 'QC', 'Canada', 'CA', '45.5005', '-73.5684'),
(185, '2016-08-23 10:08:15', '158.106.67.172', 200, '', 'QC', 'Canada', 'CA', '45.5005', '-73.5684'),
(186, '2016-09-14 11:09:57', '178.238.232.57', 206, '', '', 'Germany', 'DE', '51.2993', '9.491'),
(187, '2016-09-19 00:09:15', '69.58.178.59', 200, 'Reston', 'VA', 'United States', 'US', '38.9599', '-77.3428'),
(188, '2016-09-25 18:09:48', '180.76.15.32', 200, 'Beijing', 'Beijing', 'China', 'CN', '39.9289', '116.3883'),
(189, '2016-09-27 12:09:45', '66.249.64.176', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(190, '2016-09-27 15:09:29', '66.249.64.176', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(191, '2016-09-27 15:09:45', '66.249.64.174', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(192, '2016-09-27 19:09:01', '66.249.64.176', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(193, '2016-09-28 00:09:17', '66.249.64.178', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(194, '2016-09-28 04:09:36', '66.249.64.176', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(195, '2016-09-28 08:09:27', '66.249.64.174', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(196, '2016-09-29 17:09:59', '66.249.64.176', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(197, '2016-09-29 18:09:32', '66.249.64.178', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(198, '2016-09-30 00:09:01', '66.249.64.176', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(199, '2016-09-30 04:09:56', '66.249.64.178', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(200, '2016-09-30 10:09:12', '66.249.64.174', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(201, '2016-09-30 12:09:12', '66.249.64.176', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(202, '2016-09-30 21:09:10', '66.249.64.178', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(203, '2016-10-01 18:10:01', '66.249.64.174', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(204, '2016-10-01 19:10:07', '66.249.64.178', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(205, '2016-10-02 05:10:35', '66.249.64.174', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(206, '2016-10-02 22:10:09', '66.249.64.178', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(207, '2016-10-02 22:10:06', '66.249.64.174', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(208, '2016-10-03 00:10:31', '66.249.64.176', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(209, '2016-10-03 02:10:45', '66.249.64.174', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(210, '2016-10-04 13:10:01', '180.76.15.148', 200, 'Beijing', 'Beijing', 'China', 'CN', '39.9289', '116.3883'),
(211, '2016-10-04 13:10:01', '66.249.64.174', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(212, '2016-10-05 14:10:41', '200.90.39.49', 206, '', '', 'Venezuela', 'VE', '8', '-66'),
(213, '2016-10-05 17:10:41', '66.249.64.178', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(214, '2016-10-05 21:10:40', '186.94.101.5', 200, 'Puerto Cabello', 'Carabobo', 'Venezuela', 'VE', '10.4731', '-68.0125'),
(215, '2016-10-06 12:10:00', '190.199.37.104', 200, 'Los Toros', 'Gu&aacute;rico', 'Venezuela', 'VE', '8.45', '-67.45'),
(216, '2016-10-06 18:10:18', '66.249.64.176', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(217, '2016-10-07 15:10:11', '190.248.139.130', 200, 'Medell&iacute;n', 'Antioquia', 'Colombia', 'CO', '6.2518', '-75.5636'),
(218, '2016-10-08 03:10:10', '180.76.15.162', 200, 'Beijing', 'Beijing', 'China', 'CN', '39.9289', '116.3883'),
(219, '2016-10-08 15:10:13', '190.75.172.7', 200, 'Maracaibo', 'Zulia', 'Venezuela', 'VE', '10.6317', '-71.6406'),
(220, '2016-10-09 12:10:27', '66.249.64.174', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(221, '2016-10-09 22:10:47', '66.249.64.176', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(222, '2016-10-10 12:10:11', '186.92.212.156', 200, 'Jalisco', 'Trujillo', 'Venezuela', 'VE', '9.4436', '-70.5825'),
(223, '2016-10-10 17:10:40', '186.89.147.8', 200, 'Matur&iacute;n', 'Monagas', 'Venezuela', 'VE', '9.75', '-63.1767'),
(224, '2016-10-10 17:10:41', '66.249.65.31', 200, 'Marysville', 'CA', 'United States', 'US', '39.1587', '-121.4726'),
(225, '2016-10-10 18:10:13', '190.182.100.176', 200, 'Barranquilla', 'Atl&aacute;ntico', 'Colombia', 'CO', '10.9639', '-74.7964'),
(226, '2016-10-10 21:10:45', '66.249.65.31', 200, 'Marysville', 'CA', 'United States', 'US', '39.1587', '-121.4726'),
(227, '2016-10-11 08:10:37', '66.249.64.178', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(228, '2016-10-11 12:10:55', '72.76.221.220', 200, 'Springfield', 'NJ', 'United States', 'US', '40.6987', '-74.3296'),
(229, '2016-10-11 12:10:05', '72.76.221.220', 200, 'Springfield', 'NJ', 'United States', 'US', '40.6987', '-74.3296'),
(230, '2016-10-11 12:10:25', '72.76.221.220', 200, 'Springfield', 'NJ', 'United States', 'US', '40.6987', '-74.3296'),
(231, '2016-10-11 12:10:35', '72.76.221.220', 200, 'Springfield', 'NJ', 'United States', 'US', '40.6987', '-74.3296'),
(232, '2016-10-11 12:10:25', '72.76.221.220', 200, 'Springfield', 'NJ', 'United States', 'US', '40.6987', '-74.3296'),
(233, '2016-10-11 12:10:37', '72.76.221.220', 200, 'Springfield', 'NJ', 'United States', 'US', '40.6987', '-74.3296'),
(234, '2016-10-11 12:10:38', '72.76.221.220', 200, 'Springfield', 'NJ', 'United States', 'US', '40.6987', '-74.3296'),
(235, '2016-10-11 12:10:41', '72.76.221.220', 200, 'Springfield', 'NJ', 'United States', 'US', '40.6987', '-74.3296'),
(236, '2016-10-11 12:10:42', '72.76.221.220', 200, 'Springfield', 'NJ', 'United States', 'US', '40.6987', '-74.3296'),
(237, '2016-10-11 12:10:44', '72.76.221.220', 200, 'Springfield', 'NJ', 'United States', 'US', '40.6987', '-74.3296'),
(238, '2016-10-11 12:10:45', '72.76.221.220', 200, 'Springfield', 'NJ', 'United States', 'US', '40.6987', '-74.3296'),
(239, '2016-10-11 12:10:48', '72.76.221.220', 200, 'Springfield', 'NJ', 'United States', 'US', '40.6987', '-74.3296'),
(240, '2016-10-11 12:10:52', '72.76.221.220', 200, 'Springfield', 'NJ', 'United States', 'US', '40.6987', '-74.3296'),
(241, '2016-10-11 12:10:53', '72.76.221.220', 200, 'Springfield', 'NJ', 'United States', 'US', '40.6987', '-74.3296'),
(242, '2016-10-11 12:10:56', '72.76.221.220', 200, 'Springfield', 'NJ', 'United States', 'US', '40.6987', '-74.3296'),
(243, '2016-10-11 12:10:01', '72.76.221.220', 200, 'Springfield', 'NJ', 'United States', 'US', '40.6987', '-74.3296'),
(244, '2016-10-11 12:10:12', '72.76.221.220', 200, 'Springfield', 'NJ', 'United States', 'US', '40.6987', '-74.3296'),
(245, '2016-10-11 12:10:14', '72.76.221.220', 200, 'Springfield', 'NJ', 'United States', 'US', '40.6987', '-74.3296'),
(246, '2016-10-11 12:10:24', '72.76.221.220', 200, 'Springfield', 'NJ', 'United States', 'US', '40.6987', '-74.3296'),
(247, '2016-10-11 12:10:26', '72.76.221.220', 200, 'Springfield', 'NJ', 'United States', 'US', '40.6987', '-74.3296'),
(248, '2016-10-11 12:10:35', '72.76.221.220', 200, 'Springfield', 'NJ', 'United States', 'US', '40.6987', '-74.3296'),
(249, '2016-10-11 12:10:37', '72.76.221.220', 200, 'Springfield', 'NJ', 'United States', 'US', '40.6987', '-74.3296'),
(250, '2016-10-11 12:10:38', '72.76.221.220', 200, 'Springfield', 'NJ', 'United States', 'US', '40.6987', '-74.3296'),
(251, '2016-10-11 12:10:47', '72.76.221.220', 200, 'Springfield', 'NJ', 'United States', 'US', '40.6987', '-74.3296'),
(252, '2016-10-11 12:10:51', '72.76.221.220', 200, 'Springfield', 'NJ', 'United States', 'US', '40.6987', '-74.3296'),
(253, '2016-10-11 12:10:57', '72.76.221.220', 200, 'Springfield', 'NJ', 'United States', 'US', '40.6987', '-74.3296'),
(254, '2016-10-11 12:10:59', '72.76.221.220', 200, 'Springfield', 'NJ', 'United States', 'US', '40.6987', '-74.3296'),
(255, '2016-10-11 12:10:14', '72.76.221.220', 200, 'Springfield', 'NJ', 'United States', 'US', '40.6987', '-74.3296'),
(256, '2016-10-11 12:10:43', '72.76.221.220', 200, 'Springfield', 'NJ', 'United States', 'US', '40.6987', '-74.3296'),
(257, '2016-10-11 12:10:03', '72.76.221.220', 200, 'Springfield', 'NJ', 'United States', 'US', '40.6987', '-74.3296'),
(258, '2016-10-11 12:10:18', '72.76.221.220', 200, 'Springfield', 'NJ', 'United States', 'US', '40.6987', '-74.3296'),
(259, '2016-10-11 12:10:11', '72.76.221.220', 200, 'Springfield', 'NJ', 'United States', 'US', '40.6987', '-74.3296'),
(260, '2016-10-11 12:10:17', '72.76.221.220', 200, 'Springfield', 'NJ', 'United States', 'US', '40.6987', '-74.3296'),
(261, '2016-10-11 12:10:19', '72.76.221.220', 200, 'Springfield', 'NJ', 'United States', 'US', '40.6987', '-74.3296'),
(262, '2016-10-11 22:10:58', '180.76.15.27', 200, 'Beijing', 'Beijing', 'China', 'CN', '39.9289', '116.3883'),
(263, '2016-10-12 04:10:22', '66.249.64.178', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(264, '2016-10-12 09:10:47', '66.249.64.178', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(265, '2016-10-13 03:10:44', '82.80.249.192', 200, 'Or Yehuda', 'Tel Aviv', 'Israel', 'IL', '32.0311', '34.8458'),
(266, '2016-10-13 03:10:19', '82.80.249.192', 200, 'Or Yehuda', 'Tel Aviv', 'Israel', 'IL', '32.0311', '34.8458'),
(267, '2016-10-13 03:10:19', '82.80.249.192', 200, 'Or Yehuda', 'Tel Aviv', 'Israel', 'IL', '32.0311', '34.8458'),
(268, '2016-10-13 03:10:19', '82.80.249.192', 200, 'Or Yehuda', 'Tel Aviv', 'Israel', 'IL', '32.0311', '34.8458'),
(269, '2016-10-13 03:10:23', '82.80.249.192', 200, 'Or Yehuda', 'Tel Aviv', 'Israel', 'IL', '32.0311', '34.8458'),
(270, '2016-10-13 03:10:24', '82.80.249.192', 200, 'Or Yehuda', 'Tel Aviv', 'Israel', 'IL', '32.0311', '34.8458'),
(271, '2016-10-13 03:10:24', '82.80.249.192', 200, 'Or Yehuda', 'Tel Aviv', 'Israel', 'IL', '32.0311', '34.8458'),
(272, '2016-10-13 03:10:24', '82.80.249.192', 200, 'Or Yehuda', 'Tel Aviv', 'Israel', 'IL', '32.0311', '34.8458'),
(273, '2016-10-13 03:10:25', '82.80.249.192', 200, 'Or Yehuda', 'Tel Aviv', 'Israel', 'IL', '32.0311', '34.8458'),
(274, '2016-10-13 03:10:29', '82.80.249.192', 200, 'Or Yehuda', 'Tel Aviv', 'Israel', 'IL', '32.0311', '34.8458'),
(275, '2016-10-13 03:10:31', '82.80.249.192', 200, 'Or Yehuda', 'Tel Aviv', 'Israel', 'IL', '32.0311', '34.8458'),
(276, '2016-10-13 03:10:32', '82.80.249.192', 200, 'Or Yehuda', 'Tel Aviv', 'Israel', 'IL', '32.0311', '34.8458'),
(277, '2016-10-13 03:10:32', '82.80.249.192', 200, 'Or Yehuda', 'Tel Aviv', 'Israel', 'IL', '32.0311', '34.8458'),
(278, '2016-10-13 03:10:33', '82.80.249.192', 200, 'Or Yehuda', 'Tel Aviv', 'Israel', 'IL', '32.0311', '34.8458'),
(279, '2016-10-13 03:10:33', '82.80.249.192', 200, 'Or Yehuda', 'Tel Aviv', 'Israel', 'IL', '32.0311', '34.8458'),
(280, '2016-10-13 03:10:36', '82.80.249.192', 200, 'Or Yehuda', 'Tel Aviv', 'Israel', 'IL', '32.0311', '34.8458'),
(281, '2016-10-13 03:10:36', '82.80.249.192', 200, 'Or Yehuda', 'Tel Aviv', 'Israel', 'IL', '32.0311', '34.8458'),
(282, '2016-10-13 03:10:36', '82.80.249.192', 200, 'Or Yehuda', 'Tel Aviv', 'Israel', 'IL', '32.0311', '34.8458'),
(283, '2016-10-13 03:10:37', '82.80.249.192', 200, 'Or Yehuda', 'Tel Aviv', 'Israel', 'IL', '32.0311', '34.8458'),
(284, '2016-10-13 03:10:43', '82.80.249.192', 200, 'Or Yehuda', 'Tel Aviv', 'Israel', 'IL', '32.0311', '34.8458'),
(285, '2016-10-13 03:10:43', '82.80.249.192', 200, 'Or Yehuda', 'Tel Aviv', 'Israel', 'IL', '32.0311', '34.8458'),
(286, '2016-10-13 03:10:43', '82.80.249.192', 200, 'Or Yehuda', 'Tel Aviv', 'Israel', 'IL', '32.0311', '34.8458'),
(287, '2016-10-13 03:10:43', '82.80.249.192', 200, 'Or Yehuda', 'Tel Aviv', 'Israel', 'IL', '32.0311', '34.8458'),
(288, '2016-10-13 06:10:29', '66.249.64.178', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(289, '2016-10-13 06:10:26', '66.249.64.174', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(290, '2016-10-13 11:10:10', '66.249.64.178', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(291, '2016-10-13 11:10:36', '66.249.64.176', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(292, '2016-10-13 15:10:52', '66.249.64.138', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(293, '2016-10-13 15:10:12', '190.121.230.86', 200, 'Caracas', 'Distrito Federal', 'Venezuela', 'VE', '10.5', '-66.9167'),
(294, '2016-10-13 18:10:46', '66.249.64.128', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(295, '2016-10-14 07:10:26', '66.249.64.133', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(296, '2016-10-15 17:10:34', '66.249.64.128', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(297, '2016-10-16 05:10:01', '66.249.64.138', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(298, '2016-10-16 11:10:25', '66.249.64.133', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(299, '2016-10-16 13:10:59', '66.249.64.133', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(300, '2016-10-18 02:10:28', '66.249.64.133', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(301, '2016-10-18 03:10:12', '66.249.64.128', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(302, '2016-10-18 05:10:22', '180.76.15.155', 200, 'Beijing', 'Beijing', 'China', 'CN', '39.9289', '116.3883'),
(303, '2016-10-19 03:10:55', '66.249.64.133', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(304, '2016-10-19 11:10:42', '66.249.64.133', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(305, '2016-10-19 16:10:06', '69.58.178.56', 200, 'Reston', 'VA', 'United States', 'US', '38.9599', '-77.3428'),
(306, '2016-10-20 17:10:41', '66.249.64.138', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(307, '2016-10-21 03:10:16', '66.249.64.133', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(308, '2016-10-21 08:10:11', '66.249.64.128', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(309, '2016-10-21 12:10:54', '66.249.66.187', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(310, '2016-10-21 17:10:40', '66.249.64.138', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(311, '2016-10-21 18:10:18', '66.249.64.133', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(312, '2016-10-21 18:10:57', '66.249.64.138', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(313, '2016-10-24 02:10:13', '66.249.64.128', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(314, '2016-10-25 02:10:53', '66.249.64.133', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(315, '2016-10-26 01:10:23', '66.249.64.133', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(316, '2016-11-02 11:11:15', '180.76.15.157', 200, 'Beijing', 'Beijing', 'China', 'CN', '39.9289', '116.3883'),
(317, '2016-11-12 00:11:08', '66.249.64.44', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(318, '2016-11-12 00:11:21', '66.249.64.48', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(319, '2016-11-12 00:11:46', '66.249.64.44', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(320, '2016-11-12 00:11:15', '66.249.64.48', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(321, '2016-11-12 20:11:05', '180.76.15.9', 200, 'Beijing', 'Beijing', 'China', 'CN', '39.9289', '116.3883'),
(322, '2016-11-13 01:11:19', '66.249.64.48', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(323, '2016-11-14 17:11:13', '186.94.117.2', 200, 'Cabimas', 'Zulia', 'Venezuela', 'VE', '10.4019', '-71.4461'),
(324, '2016-11-15 11:11:23', '66.249.64.48', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(325, '2016-11-15 18:11:29', '190.77.72.24', 200, 'Buena Vista', 'Zulia', 'Venezuela', 'VE', '10.3831', '-71.2228'),
(326, '2016-11-15 19:11:52', '190.36.151.217', 200, 'Barquisimeto', 'Lara', 'Venezuela', 'VE', '10.0739', '-69.3228'),
(327, '2016-11-16 01:11:15', '66.249.64.48', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(328, '2016-11-16 05:11:40', '180.76.15.156', 200, 'Beijing', 'Beijing', 'China', 'CN', '39.9289', '116.3883'),
(329, '2016-11-16 15:11:52', '186.94.29.76', 200, 'La Mocha', 'Zulia', 'Venezuela', 'VE', '10.5633', '-71.4547'),
(330, '2016-11-16 16:11:25', '201.242.255.185', 200, 'Maracaibo', 'Zulia', 'Venezuela', 'VE', '10.6317', '-71.6406'),
(331, '2016-11-16 17:11:50', '66.249.64.48', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(332, '2016-11-17 01:11:02', '201.242.255.185', 200, 'Maracaibo', 'Zulia', 'Venezuela', 'VE', '10.6317', '-71.6406'),
(333, '2016-11-17 09:11:22', '186.93.193.73', 200, 'Maracaibo', 'Zulia', 'Venezuela', 'VE', '10.6317', '-71.6406'),
(334, '2016-11-17 11:11:13', '180.76.15.18', 200, 'Beijing', 'Beijing', 'China', 'CN', '39.9289', '116.3883'),
(335, '2016-11-17 16:11:24', '201.242.255.185', 200, 'Maracaibo', 'Zulia', 'Venezuela', 'VE', '10.6317', '-71.6406'),
(336, '2016-11-17 21:11:15', '66.249.64.46', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(337, '2016-11-18 00:11:47', '66.249.64.44', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(338, '2016-11-18 01:11:36', '66.249.64.48', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(339, '2016-11-18 02:11:25', '66.249.64.48', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(340, '2016-11-18 08:11:20', '66.249.64.48', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(341, '2016-11-18 23:11:37', '69.58.178.59', 200, 'Reston', 'VA', 'United States', 'US', '38.9599', '-77.3428'),
(342, '2016-11-19 00:11:27', '186.88.255.115', 200, 'Maracaibo', 'Zulia', 'Venezuela', 'VE', '10.6317', '-71.6406'),
(343, '2016-11-19 13:11:57', '66.249.64.46', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(344, '2016-11-19 22:11:47', '180.76.15.157', 200, 'Beijing', 'Beijing', 'China', 'CN', '39.9289', '116.3883'),
(345, '2016-11-21 00:11:06', '180.76.15.17', 200, 'Beijing', 'Beijing', 'China', 'CN', '39.9289', '116.3883'),
(346, '2016-11-22 20:11:06', '190.75.183.103', 200, 'Maracaibo', 'Zulia', 'Venezuela', 'VE', '10.6317', '-71.6406'),
(347, '2016-11-23 05:11:06', '66.249.64.46', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(348, '2016-11-23 15:11:46', '190.207.5.98', 200, 'Maracaibo', 'Zulia', 'Venezuela', 'VE', '10.6317', '-71.6406'),
(349, '2016-11-23 17:11:55', '190.207.5.98', 200, 'Maracaibo', 'Zulia', 'Venezuela', 'VE', '10.6317', '-71.6406'),
(350, '2016-11-25 01:11:30', '180.76.15.34', 200, 'Beijing', 'Beijing', 'China', 'CN', '39.9289', '116.3883'),
(351, '2016-11-25 16:11:24', '180.76.15.161', 200, 'Beijing', 'Beijing', 'China', 'CN', '39.9289', '116.3883'),
(352, '2016-11-26 20:11:53', '66.249.64.46', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(353, '2016-11-27 09:11:57', '66.249.64.46', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(354, '2016-11-28 03:11:07', '190.161.215.9', 200, 'San Bernardo', 'Regi&oacute;n Metropolitana', 'Chile', 'CL', '-33.6', '-70.7167'),
(355, '2016-11-28 19:11:29', '186.93.191.183', 200, 'Maracaibo', 'Zulia', 'Venezuela', 'VE', '10.6317', '-71.6406'),
(356, '2016-11-29 00:11:21', '186.91.60.5', 206, '', '', 'Venezuela', 'VE', '8', '-66'),
(357, '2016-11-29 20:11:06', '180.76.15.142', 200, 'Beijing', 'Beijing', 'China', 'CN', '39.9289', '116.3883'),
(358, '2016-11-29 20:11:25', '201.248.68.241', 200, 'Maracaibo', 'Zulia', 'Venezuela', 'VE', '10.6317', '-71.6406'),
(359, '2016-12-01 02:11:48', '187.225.252.236', 200, 'Mexico', 'The Federal District', 'Mexico', 'MX', '19.4342', '-99.1386'),
(360, '2016-12-01 21:12:45', '180.76.15.147', 200, 'Beijing', 'Beijing', 'China', 'CN', '39.9289', '116.3883'),
(361, '2016-12-02 14:12:14', '201.248.71.123', 200, 'Maracaibo', 'Zulia', 'Venezuela', 'VE', '10.6317', '-71.6406'),
(362, '2016-12-02 16:12:26', '201.211.233.192', 200, 'Ciudad Ojeda', 'Zulia', 'Venezuela', 'VE', '10.2033', '-71.31'),
(363, '2016-12-03 16:12:00', '186.139.193.60', 200, 'Jose Marmol', 'Buenos Aires', 'Argentina', 'AR', '-34.788', '-58.3749'),
(364, '2016-12-04 06:12:14', '181.141.84.122', 200, 'Cartagena', 'Bol&iacute;var', 'Colombia', 'CO', '10.3997', '-75.5144'),
(365, '2016-12-05 20:12:18', '66.249.88.14', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(366, '2016-12-05 20:12:40', '180.76.15.28', 200, 'Beijing', 'Beijing', 'China', 'CN', '39.9289', '116.3883'),
(367, '2016-12-05 21:12:55', '190.202.44.206', 206, '', '', 'Venezuela', 'VE', '8', '-66'),
(368, '2016-12-05 21:12:08', '190.202.44.206', 206, '', '', 'Venezuela', 'VE', '8', '-66'),
(369, '2016-12-05 23:12:12', '66.249.64.48', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(370, '2016-12-06 19:12:39', '180.76.15.32', 200, 'Beijing', 'Beijing', 'China', 'CN', '39.9289', '116.3883'),
(371, '2016-12-06 19:12:21', '201.211.233.192', 200, 'Ciudad Ojeda', 'Zulia', 'Venezuela', 'VE', '10.2033', '-71.31'),
(372, '2016-12-07 10:12:05', '66.249.64.48', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(373, '2016-12-07 16:12:06', '200.11.149.115', 206, '', '', 'Cayman Islands', 'KY', '19.5', '-80.5'),
(374, '2016-12-07 16:12:34', '66.249.64.46', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(375, '2016-12-07 23:12:11', '180.76.15.160', 200, 'Beijing', 'Beijing', 'China', 'CN', '39.9289', '116.3883'),
(376, '2016-12-09 13:12:24', '180.76.15.137', 200, 'Beijing', 'Beijing', 'China', 'CN', '39.9289', '116.3883'),
(377, '2016-12-09 18:12:18', '66.249.64.48', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(378, '2016-12-10 01:12:26', '180.76.15.143', 200, 'Beijing', 'Beijing', 'China', 'CN', '39.9289', '116.3883'),
(379, '2016-12-12 09:12:04', '42.104.72.186', 206, '', '', 'India', 'IN', '20', '77'),
(380, '2016-12-12 09:12:04', '42.104.72.186', 206, '', '', 'India', 'IN', '20', '77'),
(381, '2016-12-12 09:12:09', '42.104.72.186', 206, '', '', 'India', 'IN', '20', '77'),
(382, '2016-12-12 17:12:29', '66.249.64.48', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(383, '2016-12-12 18:12:26', '181.230.202.106', 200, 'Florida', 'Buenos Aires', 'Argentina', 'AR', '-34.5334', '-58.5094'),
(384, '2016-12-12 21:12:51', '190.39.73.48', 200, 'Barquisimeto', 'Lara', 'Venezuela', 'VE', '10.0739', '-69.3228'),
(385, '2016-12-13 15:12:47', '190.37.128.235', 200, 'Camatagua', 'Aragua', 'Venezuela', 'VE', '9.8', '-66.9167'),
(386, '2016-12-14 02:12:03', '180.76.15.146', 200, 'Beijing', 'Beijing', 'China', 'CN', '39.9289', '116.3883'),
(387, '2016-12-15 09:12:24', '180.76.15.10', 200, 'Beijing', 'Beijing', 'China', 'CN', '39.9289', '116.3883'),
(388, '2016-12-15 16:12:33', '180.76.15.11', 200, 'Beijing', 'Beijing', 'China', 'CN', '39.9289', '116.3883'),
(389, '2016-12-17 06:12:27', '180.76.15.139', 200, 'Beijing', 'Beijing', 'China', 'CN', '39.9289', '116.3883'),
(390, '2016-12-18 16:12:21', '186.185.176.251', 200, 'Caracas', 'Distrito Federal', 'Venezuela', 'VE', '10.5', '-66.9167'),
(391, '2016-12-18 18:12:08', '190.142.141.40', 200, 'Maracaibo', 'Zulia', 'Venezuela', 'VE', '10.6317', '-71.6406'),
(392, '2016-12-19 01:12:05', '69.58.178.59', 200, 'Reston', 'VA', 'United States', 'US', '38.9599', '-77.3428'),
(393, '2016-12-22 12:12:56', '190.202.44.206', 206, '', '', 'Venezuela', 'VE', '8', '-66'),
(394, '2016-12-26 15:12:24', '190.77.69.180', 200, 'Maracaibo', 'Zulia', 'Venezuela', 'VE', '10.6317', '-71.6406'),
(395, '2016-12-27 04:12:51', '186.185.220.202', 200, 'Maracaibo', 'Zulia', 'Venezuela', 'VE', '10.6317', '-71.6406'),
(396, '2016-12-28 21:12:42', '186.14.73.229', 200, 'Maracaibo', 'Zulia', 'Venezuela', 'VE', '10.6317', '-71.6406'),
(397, '2016-12-29 22:12:12', '181.197.109.225', 206, '', 'Chiriqu&iacute;', 'Panama', 'PA', '8.5667', '-82.4167'),
(398, '2016-12-31 04:12:35', '66.249.64.48', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(399, '2016-12-31 09:12:37', '66.249.64.46', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(400, '2016-12-31 10:12:32', '66.249.64.48', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(401, '2016-12-31 10:12:36', '66.249.64.48', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(402, '2016-12-31 10:12:27', '66.249.64.48', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(403, '2017-01-01 11:01:56', '66.249.64.48', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(404, '2017-01-01 13:01:09', '66.249.64.48', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(405, '2017-01-02 01:01:18', '66.249.64.46', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(406, '2017-01-02 01:01:09', '66.249.64.48', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(407, '2017-01-02 04:01:22', '66.249.64.44', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(408, '2017-01-02 17:01:57', '66.249.64.46', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(409, '2017-01-02 20:01:52', '190.142.248.90', 200, 'Ambrosio', 'Zulia', 'Venezuela', 'VE', '10.4272', '-71.4558'),
(410, '2017-01-03 06:01:25', '188.143.232.22', 200, 'Saint Petersburg', 'Sankt-Peterburg', 'Russian Federation', 'RU', '59.8944', '30.2642'),
(411, '2017-01-03 13:01:30', '186.91.56.119', 200, 'Maracaibo', 'Zulia', 'Venezuela', 'VE', '10.6317', '-71.6406'),
(412, '2017-01-03 20:01:40', '201.209.239.25', 200, 'Caracas', 'Distrito Federal', 'Venezuela', 'VE', '10.5', '-66.9167'),
(413, '2017-01-04 14:01:57', '190.39.110.113', 200, 'Carora', 'Lara', 'Venezuela', 'VE', '10.1778', '-70.0806'),
(414, '2017-01-04 20:01:30', '188.143.232.34', 200, 'Saint Petersburg', 'Sankt-Peterburg', 'Russian Federation', 'RU', '59.8944', '30.2642'),
(415, '2017-01-06 02:01:21', '66.249.64.48', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(416, '2017-01-06 17:01:14', '190.39.110.113', 200, 'Altagracia', 'Lara', 'Venezuela', 'VE', '10.3361', '-70.1978'),
(417, '2017-01-06 18:01:04', '190.39.73.231', 200, 'Barquisimeto', 'Lara', 'Venezuela', 'VE', '10.0739', '-69.3228'),
(418, '2017-01-07 14:01:52', '66.249.64.46', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(419, '2017-01-07 15:01:27', '66.249.64.44', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(420, '2017-01-07 21:01:23', '66.249.64.44', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(421, '2017-01-07 22:01:36', '190.39.73.231', 200, 'Barquisimeto', 'Lara', 'Venezuela', 'VE', '10.0739', '-69.3228'),
(422, '2017-01-08 21:01:58', '66.249.64.46', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(423, '2017-01-09 01:01:58', '190.203.237.180', 206, '', '', 'Venezuela', 'VE', '8', '-66'),
(424, '2017-01-09 15:01:17', '190.77.190.112', 200, 'Maracaibo', 'Zulia', 'Venezuela', 'VE', '10.6317', '-71.6406'),
(425, '2017-01-09 22:01:10', '186.167.248.207', 200, 'Caracas', 'Distrito Federal', 'Venezuela', 'VE', '10.5', '-66.9167'),
(426, '2017-01-10 19:01:19', '201.248.71.123', 200, 'Maracaibo', 'Zulia', 'Venezuela', 'VE', '10.6317', '-71.6406'),
(427, '2017-01-10 22:01:45', '66.249.64.48', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(428, '2017-01-11 02:01:46', '186.185.248.2', 200, 'Caracas', 'Distrito Federal', 'Venezuela', 'VE', '10.5', '-66.9167'),
(429, '2017-01-11 03:01:54', '180.76.15.161', 200, 'Beijing', 'Beijing', 'China', 'CN', '39.9289', '116.3883'),
(430, '2017-01-11 14:01:11', '201.248.71.123', 200, 'Maracaibo', 'Zulia', 'Venezuela', 'VE', '10.6317', '-71.6406'),
(431, '2017-01-11 18:01:33', '201.249.198.86', 200, 'Caracas', 'Distrito Federal', 'Venezuela', 'VE', '10.5', '-66.9167'),
(432, '2017-01-11 21:01:11', '190.6.0.160', 200, 'Maracaibo', 'Zulia', 'Venezuela', 'VE', '10.6317', '-71.6406'),
(433, '2017-01-12 05:01:10', '66.249.64.44', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(434, '2017-01-12 17:01:50', '66.249.64.44', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(435, '2017-01-12 21:01:44', '186.14.65.200', 200, 'Maracaibo', 'Zulia', 'Venezuela', 'VE', '10.6317', '-71.6406'),
(436, '2017-01-13 00:01:52', '66.249.64.46', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(437, '2017-01-13 15:01:35', '190.142.95.134', 200, 'Barquisimeto', 'Lara', 'Venezuela', 'VE', '10.0739', '-69.3228'),
(438, '2017-01-13 17:01:48', '190.39.73.231', 200, 'Barquisimeto', 'Lara', 'Venezuela', 'VE', '10.0739', '-69.3228');
INSERT INTO `visitas` (`id`, `timeStamp`, `ipAddress`, `status`, `city`, `region`, `countryName`, `countryCode`, `latitude`, `longitude`) VALUES
(439, '2017-01-13 18:01:45', '190.37.153.238', 200, 'Maracaibo', 'Zulia', 'Venezuela', 'VE', '10.6317', '-71.6406'),
(440, '2017-01-13 20:01:40', '186.24.41.194', 200, 'Caracas', 'Distrito Federal', 'Venezuela', 'VE', '10.5', '-66.9167'),
(441, '2017-01-13 20:01:29', '66.249.64.46', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(442, '2017-01-16 00:01:01', '66.249.64.46', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(443, '2017-01-16 13:01:01', '201.211.233.192', 200, 'Ciudad Ojeda', 'Zulia', 'Venezuela', 'VE', '10.2033', '-71.31'),
(444, '2017-01-16 15:01:52', '190.39.115.135', 200, 'Agua Viva', 'Lara', 'Venezuela', 'VE', '10.025', '-69.2872'),
(445, '2017-01-16 17:01:42', '186.185.158.198', 200, 'Maracay', 'Aragua', 'Venezuela', 'VE', '10.2469', '-67.5958'),
(446, '2017-01-16 23:01:49', '180.76.15.143', 200, 'Beijing', 'Beijing', 'China', 'CN', '39.9289', '116.3883'),
(447, '2017-01-17 14:01:56', '201.249.57.170', 206, '', '', 'Venezuela', 'VE', '8', '-66'),
(448, '2017-01-17 19:01:40', '66.249.64.192', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(449, '2017-01-17 20:01:32', '66.249.64.192', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(450, '2017-01-17 20:01:19', '190.75.170.20', 200, 'Maracaibo', 'Zulia', 'Venezuela', 'VE', '10.6317', '-71.6406'),
(451, '2017-01-17 22:01:40', '66.249.64.192', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(452, '2017-01-17 22:01:06', '66.249.64.192', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(453, '2017-01-18 14:01:54', '190.8.169.236', 200, 'Maracaibo', 'Zulia', 'Venezuela', 'VE', '10.6317', '-71.6406'),
(454, '2017-01-18 20:01:09', '66.249.64.202', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(455, '2017-01-19 00:01:44', '66.249.64.202', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(456, '2017-01-19 03:01:13', '69.58.178.56', 200, 'Reston', 'VA', 'United States', 'US', '38.9599', '-77.3428'),
(457, '2017-01-19 05:01:16', '66.249.64.192', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(458, '2017-01-19 20:01:12', '190.6.0.26', 200, 'Maracaibo', 'Zulia', 'Venezuela', 'VE', '10.6317', '-71.6406'),
(459, '2017-01-20 03:01:23', '66.249.73.53', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(460, '2017-01-20 07:01:49', '66.249.73.56', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(461, '2017-01-20 14:01:31', '66.249.73.50', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(462, '2017-01-20 22:01:07', '186.93.191.8', 200, 'Maracaibo', 'Zulia', 'Venezuela', 'VE', '10.6317', '-71.6406'),
(463, '2017-01-21 23:01:36', '66.249.64.48', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(464, '2017-01-22 01:01:45', '180.76.15.162', 200, 'Beijing', 'Beijing', 'China', 'CN', '39.9289', '116.3883'),
(465, '2017-01-23 16:01:17', '190.39.90.171', 200, 'Guanare', 'Portuguesa', 'Venezuela', 'VE', '9.05', '-69.75'),
(466, '2017-01-24 02:01:50', '186.88.235.132', 200, 'Maracaibo', 'Zulia', 'Venezuela', 'VE', '10.6317', '-71.6406'),
(467, '2017-01-25 17:01:53', '190.77.87.221', 200, 'Maracaibo', 'Zulia', 'Venezuela', 'VE', '10.6317', '-71.6406'),
(468, '2017-01-25 22:01:35', '190.37.152.83', 200, 'Maracaibo', 'Zulia', 'Venezuela', 'VE', '10.6317', '-71.6406'),
(469, '2017-01-25 22:01:00', '190.37.152.83', 200, 'Maracaibo', 'Zulia', 'Venezuela', 'VE', '10.6317', '-71.6406'),
(470, '2017-01-26 15:01:18', '186.92.222.108', 200, 'Maracay', 'Aragua', 'Venezuela', 'VE', '10.2469', '-67.5958'),
(471, '2017-01-26 17:01:45', '66.249.66.50', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(472, '2017-01-26 20:01:37', '186.92.222.108', 200, 'Maracay', 'Aragua', 'Venezuela', 'VE', '10.2469', '-67.5958'),
(473, '2017-01-27 08:01:31', '180.76.15.162', 200, 'Beijing', 'Beijing', 'China', 'CN', '39.9289', '116.3883'),
(474, '2017-01-27 15:01:30', '190.73.109.231', 200, 'Barbacoas', 'Aragua', 'Venezuela', 'VE', '9.4825', '-66.975'),
(475, '2017-01-27 19:01:00', '66.249.64.74', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(476, '2017-01-27 20:01:54', '200.44.71.42', 200, 'Maracaibo', 'Zulia', 'Venezuela', 'VE', '10.6317', '-71.6406'),
(477, '2017-01-27 21:01:07', '190.39.107.179', 200, 'Barquisimeto', 'Lara', 'Venezuela', 'VE', '10.0739', '-69.3228'),
(478, '2017-01-28 01:01:18', '190.39.107.179', 200, 'Barquisimeto', 'Lara', 'Venezuela', 'VE', '10.0739', '-69.3228'),
(479, '2017-01-28 04:01:21', '66.249.64.128', 200, 'Mountain View', 'CA', 'United States', 'US', '37.4192', '-122.0574'),
(480, '2017-01-28 18:01:34', '187.190.146.255', 200, 'Puebla', 'Puebla', 'Mexico', 'MX', '19.05', '-98.2'),
(481, '2017-01-28 19:01:25', '190.39.101.80', 200, 'Barquisimeto', 'Lara', 'Venezuela', 'VE', '10.0739', '-69.3228'),
(482, '2017-01-28 22:01:46', '190.39.81.121', 200, 'Barquisimeto', 'Lara', 'Venezuela', 'VE', '10.0739', '-69.3228'),
(483, '2017-01-29 03:01:44', '190.76.250.48', 206, '', '', 'Venezuela', 'VE', '8', '-66'),
(484, '2017-01-29 06:01:39', '66.249.83.221', 200, 'Philadelphia', 'PA', 'United States', 'US', '39.9543', '-75.1657'),
(485, '2017-01-29 06:01:39', '66.249.83.221', 200, 'Philadelphia', 'PA', 'United States', 'US', '39.9543', '-75.1657');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `contacto`
--
ALTER TABLE `contacto`
  ADD CONSTRAINT `FK_contacto_contacto_grupos` FOREIGN KEY (`grupo_id`) REFERENCES `contacto_grupos` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_contacto_contacto_tipos` FOREIGN KEY (`tipo_id`) REFERENCES `contacto_tipos` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `metadata`
--
ALTER TABLE `metadata`
  ADD CONSTRAINT `FK_meta_data_meta_data_tipo` FOREIGN KEY (`tipo_id`) REFERENCES `metadata_tipo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_social_meta_menu` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `planes_componentes_group`
--
ALTER TABLE `planes_componentes_group`
  ADD CONSTRAINT `FK__planes` FOREIGN KEY (`plan_id`) REFERENCES `planes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK__planes_componentes` FOREIGN KEY (`componente_id`) REFERENCES `planes_componentes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `planes_costos`
--
ALTER TABLE `planes_costos`
  ADD CONSTRAINT `FK_planes_costos_planes` FOREIGN KEY (`plan_id`) REFERENCES `planes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_planes_costos_planes_frecuencia` FOREIGN KEY (`frecuencia_id`) REFERENCES `planes_frecuencia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_planes_costos_planes_modalidad` FOREIGN KEY (`modalidad_id`) REFERENCES `planes_modalidad` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `redes`
--
ALTER TABLE `redes`
  ADD CONSTRAINT `FK_redes_redes_tipos` FOREIGN KEY (`tipo`) REFERENCES `redes_tipos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tratamientos_imagenes`
--
ALTER TABLE `tratamientos_imagenes`
  ADD CONSTRAINT `FK__tratamientos` FOREIGN KEY (`tratamiento_id`) REFERENCES `tratamientos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;