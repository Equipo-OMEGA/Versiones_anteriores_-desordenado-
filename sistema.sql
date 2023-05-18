-- SQLBook: Code
-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-04-2023 a las 23:01:54
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sistema`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_estado`
--

CREATE TABLE `cat_estado` (
  `idcat_estado` int(11) NOT NULL,
  `nombre_estado` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `cat_estado`
--

INSERT INTO `cat_estado` (`idcat_estado`, `nombre_estado`) VALUES
(1, 'ags'),
(2, 'sinaloa'),
(3, 'chiapas'),
(4, 'zacatecas'),
(5, 'guerrero'),
(6, 'queretaro'),
(7, 'yucatan'),
(8, 'puebla'),
(9, 'oaxaca'),
(10, 'jalisco');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_municipios`
--

CREATE TABLE `cat_municipios` (
  `idcat_municipios` int(11) NOT NULL,
  `nombre_municipio` varchar(45) NOT NULL,
  `cat_estado_idcat_estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `cat_municipios`
--

INSERT INTO `cat_municipios` (`idcat_municipios`, `nombre_municipio`, `cat_estado_idcat_estado`) VALUES
(1, 'ags', 1),
(1, 'culiacan', 2),
(1, 'tuxtla gutierrez', 3),
(1, 'apozol', 4),
(1, 'tlapa', 5),
(1, 'santiago de queretaro', 6),
(2, 'calvillo', 1),
(2, 'el rosario', 2),
(2, 'comitan de dominguez', 3),
(2, 'apulco', 4),
(2, 'cualac', 5),
(2, 'san juan del rio', 6),
(3, 'jesus maria', 1),
(3, 'elota', 2),
(3, 'tapachula', 3),
(3, 'atolinga', 4),
(3, 'igualapa', 5),
(3, 'cadereyta', 6),
(4, 'san jose de gracia', 1),
(4, 'mazatlan', 2),
(4, 'acacoyagua', 3),
(4, 'benito juarez', 4),
(4, 'azoyu', 5),
(4, 'merida', 7),
(5, 'el llano', 1),
(5, 'uncordia', 2),
(5, 'berriozabal', 3),
(5, 'calera', 4),
(5, 'arcella', 5),
(5, 'vallalodid', 7),
(6, 'asientos', 1),
(6, 'ahume', 2),
(6, 'cintalapa', 3),
(6, 'concepcion del oro', 4),
(6, 'alpoyeca', 5),
(6, 'maxcanu', 7),
(7, 'cosio', 1),
(7, 'chuix', 2),
(7, 'tonala', 3),
(7, 'cuauhtemoc', 4),
(7, 'alcozauca de guerrero', 5),
(7, 'tehuacan', 8),
(8, 'san francisco de los romo', 1),
(8, 'salvador alvarado', 2),
(8, 'san cristobal de las casas', 3),
(8, 'general de enrique estrada', 4),
(8, 'olinala', 5),
(8, 'zacapoaxtla', 8),
(9, 'pabellon de arteaga', 1),
(9, 'san ignacio', 2),
(9, 'villa comaltitlan', 3),
(9, 'loreto', 4),
(9, 'petlatlan', 5),
(9, 'camocuautla', 8),
(10, 'tepezala', 1),
(10, 'sinaloa', 2),
(10, 'aldama', 3),
(10, 'jerez', 4),
(10, 'atenango del rio', 5),
(10, 'oaxaca de juarez', 9),
(11, 'rincon de romos', 1),
(11, 'escuinapa', 2),
(11, 'pijijiapan', 3),
(11, 'jalpa', 4),
(11, 'leonardo bravo', 5),
(11, 'Ocotlán de Morelos', 9),
(12, 'badiraguato', 2),
(12, 'mapastepec', 3),
(12, 'luis moya', 4),
(12, 'castillo', 5),
(12, 'Pinotepa de Don Luis', 9),
(13, 'cosala', 2),
(13, 'oxchuc', 3),
(13, 'juchipila', 4),
(13, 'iliatenco', 5),
(13, 'zapopan', 10),
(14, 'el fuerte', 2),
(14, 'chilon', 3),
(14, 'mazapil', 4),
(14, 'juchitan', 5),
(14, 'san juan de los lagos', 10),
(15, 'navolato', 2),
(15, 'villaflores', 3),
(15, 'villa hidalgo', 4),
(15, 'marquelia', 5),
(15, 'talpa de allende', 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `producto` varchar(100) NOT NULL,
  `precio` varchar(100) NOT NULL,
  `unidad` varchar(50) NOT NULL,
  `existencia` varchar(50) NOT NULL,
  `costo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `producto`, `precio`, `unidad`, `existencia`, `costo`) VALUES
(7, 'Coca Cola', '$18', '1', '30', '$16'),
(8, 'Pan', '$12', '2', '60', '$10'),
(9, 'Pizza', '$25', '1', '30', '$150'),
(10, 'Powerd', '$26', '1', '12', '$20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `a_paterno` varchar(100) NOT NULL,
  `a_materno` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `telefono` varchar(100) NOT NULL,
  `rol` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `nombre`, `a_paterno`, `a_materno`, `email`, `password`, `telefono`, `rol`) VALUES
(8, 'Carlos', 'Roque', 'Davila', 'carlosjroqued@gmail.com', '195nos', '4495356454', 'Admin'),
(9, 'Bryan', 'De Luna', 'Medina', 'deluna@gmail.com', '12dsr2', '4495356454', 'usuario'),
(10, 'Kevin', 'Rios', 'Ojeda', 'kevin@gmail.com', '123r4rv', '4495356454', 'usuario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `iduser` int(11) NOT NULL,
  `A_paterno` varchar(45) NOT NULL,
  `A_materno` varchar(45) NOT NULL,
  `Email` varchar(60) NOT NULL,
  `Contraseña` varchar(255) NOT NULL,
  `Telefono` int(10) NOT NULL,
  `Rol` varchar(1) NOT NULL,
  `Estatus` tinyint(4) NOT NULL,
  `cat_estado_idcat_estado` int(11) NOT NULL,
  `cat_municipios_idcat_municipios` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cat_estado`
--
ALTER TABLE `cat_estado`
  ADD PRIMARY KEY (`idcat_estado`);

--
-- Indices de la tabla `cat_municipios`
--
ALTER TABLE `cat_municipios`
  ADD PRIMARY KEY (`idcat_municipios`,`cat_estado_idcat_estado`),
  ADD KEY `fk_cat_municipios_cat_estado1_idx` (`cat_estado_idcat_estado`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`iduser`,`cat_estado_idcat_estado`,`cat_municipios_idcat_municipios`),
  ADD KEY `fk_users_cat_municipios1_idx` (`cat_municipios_idcat_municipios`),
  ADD KEY `fk_users_cat_estado1_idx` (`cat_estado_idcat_estado`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cat_estado`
--
ALTER TABLE `cat_estado`
  MODIFY `idcat_estado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `iduser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cat_municipios`
--
ALTER TABLE `cat_municipios`
  ADD CONSTRAINT `fk_cat_municipios_cat_estado1` FOREIGN KEY (`cat_estado_idcat_estado`) REFERENCES `cat_estado` (`idcat_estado`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_users_cat_estado1` FOREIGN KEY (`cat_estado_idcat_estado`) REFERENCES `cat_estado` (`idcat_estado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_cat_municipios1` FOREIGN KEY (`cat_municipios_idcat_municipios`) REFERENCES `cat_municipios` (`idcat_municipios`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
