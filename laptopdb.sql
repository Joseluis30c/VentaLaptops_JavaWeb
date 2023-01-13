-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-06-2021 a las 23:47:36
-- Versión del servidor: 10.4.17-MariaDB
-- Versión de PHP: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `laptopdb`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_BuscarCliente` (IN `xid` INT)  NO SQL
SELECT c.id_cliente as ID,
CASE
    WHEN c.tipo_doc="1" THEN "RUC"
    WHEN c.tipo_doc="2" THEN "DNI"
END as Documento,
c.nro_doc as N°Documento, c.nom_cli as Cliente, c.dir_cli as Direccion, d.nom_dis as Distrito, c.est_cliente as Estado
from 
cliente c inner join distrito d on c.id_dis=d.id_dis
WHERE
id_cliente = xid$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_BuscarProducto` (IN `xidpro` INT)  NO SQL
SELECT p.id_producto as ID, p.nom_producto as Producto, m.nom_marca as Marca, p.pre_producto as Precio, p.img_producto as Imagen, p.estado as Estado
FROM
producto p INNER JOIN marca m  on p.id_marca = m.id_marca
WHERE 
id_producto = xidpro$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_ClientesPorDistrito` (IN `xdis` INT)  NO SQL
SELECT c.id_cliente as ID,
CASE
    WHEN c.tipo_doc="1" THEN "RUC"
    WHEN c.tipo_doc="2" THEN "DNI"
END as Doc,
c.nro_doc,c.nom_cli as Cliente, d.nom_dis as Distrito,c.est_cliente as Estado, c.dir_cli
from 
cliente c inner join distrito d on c.id_dis=d.id_dis
WHERE d.id_dis = xdis
order by 1$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_ConsultaProducto` (IN `xidpro` INT)  NO SQL
SELECT p.id_producto, p.nom_producto, m.nom_marca, c.nom_categoria, p.pre_producto, p.img_producto,p.estado
FROM
producto p INNER JOIN marca m ON p.id_marca=m.id_marca
INNER JOIN categoria c ON c.id_categoria=p.id_categoria
WHERE id_producto = xidpro$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_EliminarCliente` (IN `xid` INT)  NO SQL
DELETE FROM cliente
WHERE id_cliente=xid$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_EliminarProducto` (IN `xidpro` INT)  NO SQL
DELETE from producto
WHERE id_producto = xidpro$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Filtrar` (IN `xnom` VARCHAR(25))  NO SQL
SELECT c.id_cliente as ID,
CASE
    WHEN c.tipo_doc="1" THEN "RUC"
    WHEN c.tipo_doc="2" THEN "DNI"
END as Doc,
c.nro_doc,c.nom_cli as Cliente, d.nom_dis as Distrito,c.est_cliente as Estado, c.dir_cli
from 
cliente c inner join distrito d on c.id_dis=d.id_dis
WHERE c.nom_cli LIKE concat(xnom, '%')
order by 1$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_IngresaProducto` (IN `nompro` VARCHAR(50), IN `idmar` INT, IN `prepro` DECIMAL, IN `img` VARCHAR(40), IN `esta` VARCHAR(11))  NO SQL
INSERT INTO producto (nom_producto, id_marca, pre_producto, img_producto,estado)
VALUES (nompro, idmar, prepro, img, esta)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_IngresarCliente` (IN `xtipo` CHAR(1), IN `xnro` VARCHAR(11), IN `xnom` VARCHAR(35), IN `xdir` VARCHAR(35), IN `xiddis` INT, IN `xestado` CHAR(1))  NO SQL
INSERT INTO cliente(tipo_doc, nro_doc, nom_cli, dir_cli, id_dis, est_cliente) 
VALUES (xtipo, xnro, xnom, xdir, xiddis, xestado)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_ListadoClientes` ()  NO SQL
SELECT c.id_cliente as ID,
CASE
    WHEN c.tipo_doc="1" THEN "RUC"
    WHEN c.tipo_doc="2" THEN "DNI"
END as Documento,
c.nro_doc as N°Documento,c.nom_cli as Nombre,c.dir_cli as Direccion, d.nom_dis as Distrito,c.est_cliente as Estado
from 
cliente c inner join distrito d on c.id_dis=d.id_dis
order by 1$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_ListadoDistritos` ()  NO SQL
SELECT id_dis, nom_dis
FROM
distrito
ORDER BY 2$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_ListadoMarca` ()  NO SQL
SELECT id_marca, nom_marca
FROM
marca
ORDER BY 2$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_ListadoProductos` ()  NO SQL
SELECT p.id_producto as ID, p.nom_producto as Producto, m.nom_marca as Marca, p.pre_producto as Precio,p.img_producto as Imagen, p.estado as Estado
FROM
producto p INNER JOIN marca m  on p.id_marca = m.id_marca
ORDER BY id_producto$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_ModificaProducto` (IN `xidpro` INT, IN `nompro` VARCHAR(50), IN `idmar` INT, IN `prepro` DECIMAL, IN `img` VARCHAR(30), IN `esta` VARCHAR(11))  NO SQL
UPDATE producto SET nom_producto=nompro, id_marca=idmar, pre_producto=prepro, img_producto=img, estado=esta
WHERE id_producto=xidpro$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_ModificarCliente` (IN `id` INT, IN `tipo` CHAR(1), IN `nro` VARCHAR(11), IN `nom` VARCHAR(35), IN `dir` VARCHAR(35), IN `iddis` INT, IN `estado` CHAR(1))  NO SQL
UPDATE cliente SET tipo_doc = tipo, nro_doc = nro, nom_cli = nom, dir_cli = dir, id_dis = iddis, est_cliente = estado
where id_cliente = id$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `tipo_doc` char(1) COLLATE utf8_spanish2_ci NOT NULL,
  `nro_doc` varchar(11) COLLATE utf8_spanish2_ci NOT NULL,
  `nom_cli` varchar(35) COLLATE utf8_spanish2_ci NOT NULL,
  `dir_cli` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `id_dis` int(11) NOT NULL,
  `est_cliente` char(1) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `tipo_doc`, `nro_doc`, `nom_cli`, `dir_cli`, `id_dis`, `est_cliente`) VALUES
(1, '1', '12398342783', 'PESATEC PERU S.A.C', 'Avenida Condevilla 1269', 1, 'A'),
(2, '2', '71395213', 'Jose Luis Chavesta', 'Mz. B lote 4 Ventanilla', 6, 'A'),
(14, '1', '12457845965', ' Compu Callao Tienda de informática', 'Av Saenz Peña 202', 1, 'D'),
(25, '2', '71395213', 'Luis Alberto', 'Alberto Fujimori', 6, 'A'),
(26, '2', '17432264', 'Maria Pilar Rivas', 'Alberto Fujimori', 6, 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `distrito`
--

CREATE TABLE `distrito` (
  `id_dis` int(11) NOT NULL,
  `nom_dis` varchar(25) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `distrito`
--

INSERT INTO `distrito` (`id_dis`, `nom_dis`) VALUES
(1, 'Callao'),
(2, 'Bellavista'),
(3, 'Carmen de la Legua'),
(4, 'La Punta'),
(5, 'La Perla'),
(6, 'Ventanilla');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

CREATE TABLE `marca` (
  `id_marca` int(11) NOT NULL,
  `nom_marca` varchar(25) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `marca`
--

INSERT INTO `marca` (`id_marca`, `nom_marca`) VALUES
(1, 'Huawei'),
(2, 'Lenovo'),
(3, 'Apple'),
(4, 'LG'),
(5, 'HP'),
(6, 'Gateway'),
(7, 'Toshiba'),
(8, 'Acer');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_producto` int(11) NOT NULL,
  `nom_producto` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `id_marca` int(11) NOT NULL,
  `pre_producto` decimal(10,0) NOT NULL,
  `img_producto` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `estado` varchar(11) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_producto`, `nom_producto`, `id_marca`, `pre_producto`, `img_producto`, `estado`) VALUES
(1, 'Laptop Gateway GWTN156 Ultra Slim', 6, '2900', 'img/lap/laptopHP-Gateway.jpg', 'DISPONIBLE'),
(2, 'Laptop Lenovo IdeaPad S145-14API', 2, '1900', 'img/lap/laptopLenovo.jpg', 'DISPONIBLE'),
(3, 'Apple MacBook SL 12\" Core i5 1.3Ghz', 3, '4499', 'img/lap/AppleApple.jpg', 'DISPONIBLE'),
(4, 'Laptop LG Gram 17 Ultra Ligero, Intel Core i7', 4, '5499', 'img/lap/AcerLG.jpg', 'DISPONIBLE'),
(5, 'Laptop Gateway GWTN156 Ultra Slim, Intel Core i5', 6, '2899', 'img/lap/AcerGateway.jpg', 'DISPONIBLE'),
(6, 'Laptop Huawei MateBook D 14 AMD Ryzen 7 3700U', 1, '3500', 'img/lap/HuaweiHuawei.jpg', 'DISPONIBLE'),
(7, 'Laptop LG Gram 14 Ultra-Lightweight 2 en 1', 4, '5599', 'img/lap/HuaweiLG.jpg', 'DISPONIBLE'),
(18, 'Convertible desmontable Toshiba Portege X30T- E314', 7, '4299', 'img/lap/ToshibaToshiba.jpg', 'DISPONIBLE'),
(19, 'Laptop Gateway GWTN156 Ultra Slim, Intel Core i5-1', 6, '2799', 'img/lap/ToshibaGateway.jpg', 'DISPONIBLE'),
(20, 'Laptop Intel i5 10º 8GB 256GB Win 10 15,6 FHD', 8, '2996', 'img/lap/AcerAcer.jpg', 'DISPONIBLE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(40) COLLATE utf8_spanish2_ci NOT NULL,
  `correo` varchar(255) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre`, `correo`) VALUES
(1, 'admin', 'admin@gmail.com');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`),
  ADD KEY `id_dis` (`id_dis`);

--
-- Indices de la tabla `distrito`
--
ALTER TABLE `distrito`
  ADD PRIMARY KEY (`id_dis`);

--
-- Indices de la tabla `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`id_marca`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `id_marca` (`id_marca`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `distrito`
--
ALTER TABLE `distrito`
  MODIFY `id_dis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `marca`
--
ALTER TABLE `marca`
  MODIFY `id_marca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`id_dis`) REFERENCES `distrito` (`id_dis`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`id_marca`) REFERENCES `marca` (`id_marca`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
