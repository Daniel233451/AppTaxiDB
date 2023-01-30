-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-12-2022 a las 05:34:04
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `app_taxi`
--
CREATE DATABASE IF NOT EXISTS `app_taxi` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `app_taxi`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conductores_vehiculos`
--

CREATE TABLE `conductores_vehiculos` (
  `id_conductor` int(11) NOT NULL,
  `id_vehiculo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `conductores_vehiculos`
--

INSERT INTO `conductores_vehiculos` (`id_conductor`, `id_vehiculo`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `desencadenadores_promocion`
--

CREATE TABLE `desencadenadores_promocion` (
  `id` int(11) NOT NULL,
  `desencadenador` varchar(50) NOT NULL,
  `descripcion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

CREATE TABLE `estados` (
  `id` int(11) NOT NULL,
  `estado` varchar(20) NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `estados`
--

INSERT INTO `estados` (`id`, `estado`, `descripcion`) VALUES
(1, 'Solicitado', 'Solicitado'),
(2, 'Iniciado', 'Iniciado'),
(3, 'Finalizado', 'Finalizado'),
(4, 'Cancelado', 'Cancelado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metodos_pago`
--

CREATE TABLE `metodos_pago` (
  `id` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `alias` varchar(50) DEFAULT NULL,
  `banco` varchar(100) NOT NULL,
  `token` varchar(100) DEFAULT NULL,
  `clabe_interbancaria` varchar(18) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfiles`
--

CREATE TABLE `perfiles` (
  `id` int(11) NOT NULL,
  `perfil` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `perfiles`
--

INSERT INTO `perfiles` (`id`, `perfil`) VALUES
(1, 'Administrador'),
(2, 'Conductor'),
(3, 'Solicitante');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `promociones`
--

CREATE TABLE `promociones` (
  `id` int(11) NOT NULL,
  `id_tipo_promocion` int(11) NOT NULL,
  `id_desencadenador_promocion` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `valor` double NOT NULL,
  `vigencia_desde` datetime NOT NULL,
  `vigencia_hasta` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_promocion`
--

CREATE TABLE `tipos_promocion` (
  `id` int(11) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `descripcion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_vehiculo`
--

CREATE TABLE `tipos_vehiculo` (
  `id` int(11) NOT NULL,
  `tipo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipos_vehiculo`
--

INSERT INTO `tipos_vehiculo` (`id`, `tipo`) VALUES
(1, 'Camioneta'),
(2, 'Coche');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `id_perfil` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `foto` varchar(250) DEFAULT NULL,
  `telefono` varchar(10) DEFAULT NULL,
  `correo` varchar(100) NOT NULL,
  `usuario` varchar(100) NOT NULL,
  `contrasenia` varchar(64) NOT NULL,
  `calificacion` double DEFAULT NULL,
  `latitud` double DEFAULT NULL,
  `longitud` double DEFAULT NULL,
  `token_recuperacion_contrasenia` varchar(36) DEFAULT NULL,
  `codigo_recuperacion_contrasenia` varchar(6) DEFAULT NULL,
  `identificacion_oficial` varchar(255) DEFAULT NULL,
  `licencia_conducir` varchar(255) DEFAULT NULL,
  `cnap` varchar(255) DEFAULT NULL,
  `rfc` varchar(255) DEFAULT NULL,
  `activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `id_perfil`, `nombre`, `foto`, `telefono`, `correo`, `usuario`, `contrasenia`, `calificacion`, `latitud`, `longitud`, `token_recuperacion_contrasenia`, `codigo_recuperacion_contrasenia`, `identificacion_oficial`, `licencia_conducir`, `cnap`, `rfc`, `activo`) VALUES
(1, 2, 'Conductor1 Ap1 Ap2', NULL, '1234567890', 'conductor1@taxi.app', 'conductor1@taxi.app', '700c2cf765abd02306573a338957ae16ca3cc8e01468914b81eaa9c1', 5, NULL, NULL, '', '', NULL, NULL, NULL, NULL, 1),
(2, 2, 'Conductor2 Ap1 Ap2', NULL, '1234567890', 'conductor2@taxi.app', 'conductor2@taxi.app', '12345678', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 1),
(3, 3, 'Cliente1 Ape1 Ape2', NULL, '4831095111', 'cliente1@taxi.app', 'cliente1@taxi.app', '12345678', 4, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculos`
--

CREATE TABLE `vehiculos` (
  `id` int(11) NOT NULL,
  `id_duenio` int(11) NOT NULL,
  `id_tipo_vehiculo` int(11) NOT NULL,
  `marca` varchar(60) DEFAULT NULL,
  `modelo` varchar(60) DEFAULT NULL,
  `anio` varchar(4) NOT NULL,
  `color` varchar(50) DEFAULT NULL,
  `placa` varchar(7) NOT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `tarjeta_circulacion` varchar(255) DEFAULT NULL,
  `poliza_seguro` varchar(255) DEFAULT NULL,
  `activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `vehiculos`
--

INSERT INTO `vehiculos` (`id`, `id_duenio`, `id_tipo_vehiculo`, `marca`, `modelo`, `anio`, `color`, `placa`, `imagen`, `tarjeta_circulacion`, `poliza_seguro`, `activo`) VALUES
(1, 1, 2, 'Nissan', 'Versa', '2022', 'Rojo', 'ABC123', NULL, NULL, NULL, 1),
(2, 2, 1, 'Nissan2', 'Versa2', '2022', 'Rojo', 'ABC122', NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `viajes`
--

CREATE TABLE `viajes` (
  `id` int(11) NOT NULL,
  `id_conductor` int(11) NOT NULL,
  `id_vehiculo` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_estado` int(11) NOT NULL,
  `calificacion_conductor` double DEFAULT NULL,
  `calificacion_cliente` double DEFAULT NULL,
  `direccion_origen` varchar(250) DEFAULT NULL,
  `direccion_destino` varchar(250) DEFAULT NULL,
  `latitud_origen` double NOT NULL,
  `longitud_origen` double NOT NULL,
  `latitud_destino` double NOT NULL,
  `longitud_destino` double NOT NULL,
  `tiempo_inicio` datetime DEFAULT NULL,
  `tiempo_fin` datetime DEFAULT NULL,
  `distancia` double NOT NULL,
  `tarifa` varchar(100) NOT NULL,
  `costo` double DEFAULT NULL,
  `descuento` double DEFAULT NULL,
  `factura` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `viajes`
--

INSERT INTO `viajes` (`id`, `id_conductor`, `id_vehiculo`, `id_cliente`, `id_estado`, `calificacion_conductor`, `calificacion_cliente`, `direccion_origen`, `direccion_destino`, `latitud_origen`, `longitud_origen`, `latitud_destino`, `longitud_destino`, `tiempo_inicio`, `tiempo_fin`, `distancia`, `tarifa`, `costo`, `descuento`, `factura`) VALUES
(2, 1, 1, 3, 1, 5, 3, 'Moctezuma 46, Toriello Guerra, Tlalpan, 14050 Ciudad de México, CDMX', 'Av Renato Leduc 136, Col Del, Toriello Guerra, Tlalpan, 14050 Ciudad de México, CDMX', 19.294968, -99.167092, 19.518985, -99.135195, '2022-12-06 16:18:23', NULL, 36.8, '1', NULL, NULL, NULL),
(3, 2, 1, 3, 3, NULL, NULL, NULL, NULL, 19.294988, -99.167088, 19.518988, -99.135188, NULL, NULL, 88.8, '1', NULL, NULL, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `conductores_vehiculos`
--
ALTER TABLE `conductores_vehiculos`
  ADD KEY `id_conductor` (`id_conductor`),
  ADD KEY `id_vehiculo` (`id_vehiculo`);

--
-- Indices de la tabla `desencadenadores_promocion`
--
ALTER TABLE `desencadenadores_promocion`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indices de la tabla `estados`
--
ALTER TABLE `estados`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indices de la tabla `metodos_pago`
--
ALTER TABLE `metodos_pago`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Indices de la tabla `perfiles`
--
ALTER TABLE `perfiles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indices de la tabla `promociones`
--
ALTER TABLE `promociones`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `id_desencadenador_promocion` (`id_desencadenador_promocion`),
  ADD KEY `id_tipo_promocion` (`id_tipo_promocion`);

--
-- Indices de la tabla `tipos_promocion`
--
ALTER TABLE `tipos_promocion`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indices de la tabla `tipos_vehiculo`
--
ALTER TABLE `tipos_vehiculo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `id_perfil` (`id_perfil`);

--
-- Indices de la tabla `vehiculos`
--
ALTER TABLE `vehiculos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `id_tipo_vehiculo` (`id_tipo_vehiculo`),
  ADD KEY `id_duenio` (`id_duenio`);

--
-- Indices de la tabla `viajes`
--
ALTER TABLE `viajes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_conductor` (`id_conductor`),
  ADD KEY `id_estado` (`id_estado`),
  ADD KEY `id_vehiculo` (`id_vehiculo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `desencadenadores_promocion`
--
ALTER TABLE `desencadenadores_promocion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estados`
--
ALTER TABLE `estados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `metodos_pago`
--
ALTER TABLE `metodos_pago`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `perfiles`
--
ALTER TABLE `perfiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `promociones`
--
ALTER TABLE `promociones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipos_promocion`
--
ALTER TABLE `tipos_promocion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipos_vehiculo`
--
ALTER TABLE `tipos_vehiculo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `vehiculos`
--
ALTER TABLE `vehiculos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `viajes`
--
ALTER TABLE `viajes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `conductores_vehiculos`
--
ALTER TABLE `conductores_vehiculos`
  ADD CONSTRAINT `conductores_vehiculos_ibfk_1` FOREIGN KEY (`id_conductor`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `conductores_vehiculos_ibfk_2` FOREIGN KEY (`id_vehiculo`) REFERENCES `vehiculos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `metodos_pago`
--
ALTER TABLE `metodos_pago`
  ADD CONSTRAINT `metodos_pago_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `promociones`
--
ALTER TABLE `promociones`
  ADD CONSTRAINT `promociones_ibfk_1` FOREIGN KEY (`id_desencadenador_promocion`) REFERENCES `desencadenadores_promocion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `promociones_ibfk_2` FOREIGN KEY (`id_tipo_promocion`) REFERENCES `tipos_promocion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_perfil`) REFERENCES `perfiles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `vehiculos`
--
ALTER TABLE `vehiculos`
  ADD CONSTRAINT `vehiculos_ibfk_1` FOREIGN KEY (`id_tipo_vehiculo`) REFERENCES `tipos_vehiculo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `vehiculos_ibfk_2` FOREIGN KEY (`id_duenio`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `viajes`
--
ALTER TABLE `viajes`
  ADD CONSTRAINT `viajes_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `viajes_ibfk_2` FOREIGN KEY (`id_conductor`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `viajes_ibfk_3` FOREIGN KEY (`id_estado`) REFERENCES `estados` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `viajes_ibfk_4` FOREIGN KEY (`id_vehiculo`) REFERENCES `vehiculos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
