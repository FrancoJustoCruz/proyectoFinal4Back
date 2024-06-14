-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-06-2024 a las 19:55:10
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `edificio`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id`, `nombre`, `createdAt`, `updatedAt`) VALUES
(1, 'Fontanería', '2024-06-12 14:26:48', '2024-06-12 14:26:48'),
(2, 'Electricidad', '2024-06-12 14:27:11', '2024-06-12 14:27:11'),
(4, 'Seguridad', '2024-06-12 14:27:30', '2024-06-12 14:27:30'),
(8, 'Mascotas', '2024-06-14 17:36:12', '2024-06-14 17:36:12'),
(9, 'Limpieza', '2024-06-14 17:36:21', '2024-06-14 17:36:21'),
(10, 'Estacionamiento', '2024-06-14 17:36:52', '2024-06-14 17:36:52');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `incidencia`
--

CREATE TABLE `incidencia` (
  `id` int(11) NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `categoriaId` int(11) NOT NULL,
  `descripcion` text NOT NULL,
  `estado` varchar(255) NOT NULL,
  `media` varchar(255) DEFAULT NULL,
  `userId` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `imagen` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `incidencia`
--

INSERT INTO `incidencia` (`id`, `uuid`, `categoriaId`, `descripcion`, `estado`, `media`, `userId`, `createdAt`, `updatedAt`, `imagen`) VALUES
(34, 'b8d900a6-14d1-4bd9-ac61-a879b8a4b733', 4, 'Robaron hace poco, adjunto foto del ladron', 'pendiente', NULL, 6, '2024-06-14 17:38:29', '2024-06-14 17:38:29', '1718386709753.jpg'),
(35, '27189c8f-e3ea-4da9-a312-5e95cfccbea1', 8, 'El perro del vecino ensucio todo', 'pendiente', NULL, 8, '2024-06-14 17:51:46', '2024-06-14 17:51:46', '1718387506664.jpeg'),
(36, '03f2b5cd-42e3-4409-9147-fe7f96b417ef', 8, 'Se escapo mi pikachu,adjunto foto', 'pendiente', NULL, 8, '2024-06-14 17:52:20', '2024-06-14 17:52:20', '1718387540880.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `product`
--

INSERT INTO `product` (`id`, `uuid`, `name`, `price`, `userId`, `createdAt`, `updatedAt`) VALUES
(2, 'ac0ecbc7-6628-41ff-9a21-75901eb4ffe5', 'nuevo', 888, 1, '2024-06-12 03:15:00', '2024-06-12 03:28:22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `sid` varchar(36) NOT NULL,
  `expires` datetime DEFAULT NULL,
  `data` text DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`sid`, `expires`, `data`, `createdAt`, `updatedAt`) VALUES
('-EW8JGWkDBuBLSKTt14sl0LYHYsBUE4-', '2024-06-15 16:12:13', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-14 16:12:13', '2024-06-14 16:12:13'),
('-wtSrDpmPx5Wy2KAAimEDLodHhzouhc5', '2024-06-15 17:35:12', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-14 17:35:12', '2024-06-14 17:35:12'),
('1Pl9QmG3tQuLnobWIcjzEF45Gxbe8ifG', '2024-06-14 23:25:04', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-13 23:25:04', '2024-06-13 23:25:04'),
('2PlcFWYXY7xuFjXJPpraO8Hk-7sAtlnu', '2024-06-15 01:06:25', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-14 01:06:25', '2024-06-14 01:06:25'),
('2q0Ez8Bl-IqWjvphbUOtK3BClUHtyxMb', '2024-06-14 23:06:01', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-13 23:06:01', '2024-06-13 23:06:01'),
('2Taw0EVd2600L4Xu6zf_28nRWRJFEfMs', '2024-06-14 23:07:06', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-13 23:07:06', '2024-06-13 23:07:06'),
('3daVjcSKNWf4A7LF_PeP_jfotYAFCtjI', '2024-06-15 16:36:00', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-14 16:36:00', '2024-06-14 16:36:00'),
('3Ey-scgVqOA-yDK745uiv0vb7SzMZYMQ', '2024-06-14 23:11:12', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-13 23:11:12', '2024-06-13 23:11:12'),
('3J-_zt9LEett3phFxgIqcN01MS8H2Ccb', '2024-06-15 01:17:35', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"userId\":\"3a23d887-720e-4010-8aa7-fd4786c22805\"}', '2024-06-14 01:06:35', '2024-06-14 01:17:35'),
('3LKSQb2Zw119_Z1aauCv_HBTveUFFSuI', '2024-06-14 23:35:38', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-13 23:35:38', '2024-06-13 23:35:38'),
('3RyX3KS29v38BvHKFumUQ8CFG7uiVHah', '2024-06-15 15:58:08', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-14 15:58:08', '2024-06-14 15:58:08'),
('3s3WfXGL50tTt42809vWBzv1TyKmLVsJ', '2024-06-15 17:10:40', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-14 17:10:40', '2024-06-14 17:10:40'),
('3y8KfsV1OyPv1EtYJVuJTXANxwtRQ3gh', '2024-06-14 23:37:20', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-13 23:37:20', '2024-06-13 23:37:20'),
('55zj_sWi5O1AqrZHWjcH9NfbktBH-8Ju', '2024-06-15 16:36:41', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-14 16:36:41', '2024-06-14 16:36:41'),
('5IFXcq2EJmqn3UqpvrNb7t42LaiQXh8f', '2024-06-14 22:15:10', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-13 22:15:10', '2024-06-13 22:15:10'),
('5_xCFWECXveU2Ahq27YHce3j90G5A5Mb', '2024-06-15 17:10:38', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-14 17:10:38', '2024-06-14 17:10:38'),
('6LekkPpX5Er7KYMMRrMet6XaWvzJLzen', '2024-06-14 23:25:01', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-13 23:25:01', '2024-06-13 23:25:01'),
('6m4cgSwO-GhGKqVhSI_Z52Eqoe0vH-iX', '2024-06-14 18:12:24', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-13 18:12:24', '2024-06-13 18:12:24'),
('6z4aHU5Y1Iwbr1mUZITT4j3vee9oLoQy', '2024-06-15 17:32:10', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-14 17:32:10', '2024-06-14 17:32:10'),
('7aB6zw21Vwz8o3-ZdLEoZVVJYnlBDeQx', '2024-06-15 01:07:12', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-14 01:07:12', '2024-06-14 01:07:12'),
('7bY9pJ3tdlsvHBSTKl8JbXiMOi7nFUmE', '2024-06-14 22:15:15', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-13 22:15:15', '2024-06-13 22:15:15'),
('7eHLf_dw4AkjndMD4snwPeSoAL38n1wu', '2024-06-15 17:36:52', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-14 17:36:52', '2024-06-14 17:36:52'),
('7F2RWWTg3KJDzCFo8Lga82jqq0xQSIDY', '2024-06-15 17:47:11', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-14 17:47:11', '2024-06-14 17:47:11'),
('7XtvYHkFIAbxjwUbze9SjX8on3E1o-I1', '2024-06-14 19:30:29', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-13 19:30:29', '2024-06-13 19:30:29'),
('8MhhbA3kGcQhGpC48t2DEYX66xEnj6Vg', '2024-06-14 23:38:44', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-13 23:38:44', '2024-06-13 23:38:44'),
('8qYG5uVGulztosehQ2ibaBWI-Dfx62ED', '2024-06-15 17:10:44', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-14 17:10:44', '2024-06-14 17:10:44'),
('8T0Z0UuKsOzgJXrXFc0M_SbaxoAY96Sl', '2024-06-14 17:48:08', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-13 17:48:08', '2024-06-13 17:48:08'),
('9I6ZQIN0sZZv5b_h2c28hJHO0SOpKJZy', '2024-06-14 23:25:04', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-13 23:25:04', '2024-06-13 23:25:04'),
('a158aevcPGaxn9DzNviv-N5cQgcAmR3F', '2024-06-15 17:36:04', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-14 17:36:04', '2024-06-14 17:36:04'),
('aDKr3UIf3K-pEG58R6iL5bjBoPQ3FCNc', '2024-06-14 23:37:02', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-13 23:37:02', '2024-06-13 23:37:02'),
('aqQylrBCkSHyTFICO2tx0AAihYerGzmh', '2024-06-15 17:10:50', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-14 17:10:50', '2024-06-14 17:10:50'),
('B6s6TdZ0ZfpI9ktuvlWqmmYnSrFHrUIE', '2024-06-14 23:11:12', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-13 23:11:12', '2024-06-13 23:11:12'),
('bAIpM2ivqvmvlMUWigiD6jRCbebHOTiz', '2024-06-15 01:06:49', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-14 01:06:49', '2024-06-14 01:06:49'),
('BPN7mTRqjCBCSYCUo8aCooIaj71OTmBG', '2024-06-14 23:37:46', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-13 23:37:46', '2024-06-13 23:37:46'),
('BrKmi-kxd7mIy5pC_nWEtGnGdGkFwuGX', '2024-06-14 23:08:04', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-13 23:08:04', '2024-06-13 23:08:04'),
('Bzn2ip7IDI2CCM5kMQ3F8If8KM-yqoVP', '2024-06-15 17:34:42', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-14 17:34:42', '2024-06-14 17:34:42'),
('c9ECd4mCRE_SO4pboAwfTrOHN2mc7L-L', '2024-06-14 18:21:29', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-13 18:21:29', '2024-06-13 18:21:29'),
('cII6RXOJ_YWmBQVGHGPzh-rX_PmBnmNY', '2024-06-15 17:35:54', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-14 17:35:54', '2024-06-14 17:35:54'),
('CpwyHBZWZElehcA5c_LWfuZaH2mE0vFF', '2024-06-14 23:36:09', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-13 23:36:09', '2024-06-13 23:36:09'),
('dVzVxfk-ttl2xoMeMKCvzUUVaevscDPG', '2024-06-14 23:07:33', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-13 23:07:33', '2024-06-13 23:07:33'),
('e-iEQ3bddreZwJ1CY8Dx1LWH1xMcrE3Q', '2024-06-14 23:07:28', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-13 23:07:28', '2024-06-13 23:07:28'),
('em4CkVQ4BVbB78fblnZArvITNkHftTMD', '2024-06-15 01:17:06', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-14 01:17:06', '2024-06-14 01:17:06'),
('eMoblvkweCA9_0gWSdx6VIQtSBcRz5lL', '2024-06-14 23:11:13', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-13 23:11:13', '2024-06-13 23:11:13'),
('eyg-AnUWtc5INwNoQ0rvY8T42NKge3zq', '2024-06-14 23:05:44', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-13 23:05:44', '2024-06-13 23:05:44'),
('f3BC2R_FAJvjAS1Q0nENFuIcdPEDZ_9h', '2024-06-14 23:25:04', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-13 23:25:04', '2024-06-13 23:25:04'),
('fbGyX3fAHiip4eMrFNxdqzcrKrU2b80h', '2024-06-15 17:32:09', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-14 17:32:09', '2024-06-14 17:32:09'),
('gc-U6ZX5x2XaO6pvQvuBx-ll2e7K05Cx', '2024-06-14 23:35:19', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-13 23:35:19', '2024-06-13 23:35:19'),
('gic73jTjNw8IU26yhkRE1sceypW-Fr5o', '2024-06-15 17:31:36', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-14 17:31:36', '2024-06-14 17:31:36'),
('h5IEVojxMME6LmISoY-nwmtqWgjwJcgM', '2024-06-15 17:10:37', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-14 17:10:37', '2024-06-14 17:10:37'),
('H8z7ndkmZ9EyYqq7afwW2V1hzb7F4xX9', '2024-06-15 17:32:12', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-14 17:32:12', '2024-06-14 17:32:12'),
('Hefl9Yl0kXwZnErFXIm-taBvsmBKltTE', '2024-06-15 01:06:35', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-14 01:06:35', '2024-06-14 01:06:35'),
('i0byhgMg8lAw0F7I7vI5nzcvY2dLjL7r', '2024-06-15 15:57:42', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-14 15:57:42', '2024-06-14 15:57:42'),
('i9cr8_ZCn3IR5jRZ0gJEp7OxOCQxyctp', '2024-06-15 17:34:06', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-14 17:34:06', '2024-06-14 17:34:06'),
('If52bYbKraUxcseINOW_vw0EIB7DAaRm', '2024-06-14 18:25:15', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-13 18:25:15', '2024-06-13 18:25:15'),
('IqrjHYxmofugo6An5iyRH5dUfU722ETx', '2024-06-15 17:52:20', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"userId\":\"8a7a35e1-e5f0-42c6-b5e7-fb352e57f2d0\"}', '2024-06-14 17:50:57', '2024-06-14 17:52:20'),
('jetv_1u5UN_p9GHyCyo8ybKeAgh_-lif', '2024-06-14 22:23:16', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-13 22:23:16', '2024-06-13 22:23:16'),
('JfiYNgaFGz2B6h09ICQPmc76K95_VC0U', '2024-06-15 17:31:54', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-14 17:31:54', '2024-06-14 17:31:54'),
('JRcIh9VwAQB5jp8xGznQGJqvF2NrsTBD', '2024-06-14 23:55:03', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-13 23:55:03', '2024-06-13 23:55:03'),
('Jsmd-EJsRiYZmAu-9xhwAAmdvnmV_U1j', '2024-06-14 23:37:43', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-13 23:37:43', '2024-06-13 23:37:43'),
('K-kagzwinu6cypNwhh1d9aTiYtTGS-vP', '2024-06-15 17:36:12', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-14 17:36:12', '2024-06-14 17:36:12'),
('kGQV5HmEOzbPD9orlxSn98zk9yJ8sRjR', '2024-06-14 23:37:44', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-13 23:37:44', '2024-06-13 23:37:44'),
('Ky-Bg8tFlUEVMhsiqOjbu7s7O_7miQ11', '2024-06-14 19:28:32', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-13 19:28:32', '2024-06-13 19:28:32'),
('kyVqTo73Kdkd4-ormG2zPpy1js9HaO3-', '2024-06-15 17:10:36', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-14 17:10:36', '2024-06-14 17:10:36'),
('KZ4qnQZljwXsJBf-KUetPMxdtryn9QQc', '2024-06-14 23:11:11', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-13 23:11:11', '2024-06-13 23:11:11'),
('L1W_pdzACYu20kigTIOCXn9-K4AbfJYX', '2024-06-15 17:32:11', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-14 17:32:11', '2024-06-14 17:32:11'),
('LqTm2qerY3bYASn5gaZQqVqBWgFJH-3j', '2024-06-14 18:21:58', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-13 18:21:58', '2024-06-13 18:21:58'),
('m2VbXwc9Kh7IB7hfVD7zsqymYciioVR7', '2024-06-14 19:00:54', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-13 19:00:54', '2024-06-13 19:00:54'),
('mkNUwrZhwq_fzO6XjEfwu6cTSrC8DA-b', '2024-06-15 17:34:00', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-14 17:34:00', '2024-06-14 17:34:00'),
('mRBiitMjbKHervEcXe0p0dHmhCVsOUms', '2024-06-14 18:02:49', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-13 18:02:49', '2024-06-13 18:02:49'),
('mxrgLj_4Wh9PXmf845zoRPr5W6aDQUa4', '2024-06-15 17:10:35', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-14 17:10:35', '2024-06-14 17:10:35'),
('NddOpjLyjZvC13ZWzHSh97pTBg3FSOyP', '2024-06-14 23:54:58', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-13 23:54:58', '2024-06-13 23:54:58'),
('nIkljXZAdNhN1W_MUCcWAN1ihjymTQHC', '2024-06-14 17:48:38', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-13 17:48:38', '2024-06-13 17:48:38'),
('OaYvjL-IwqmnJM4go67J4hVLUcso4oxC', '2024-06-15 00:22:08', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-14 00:22:08', '2024-06-14 00:22:08'),
('Oq9El1iCmaYIJMkVpcLRWus3K6qiwA6R', '2024-06-15 17:29:24', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-14 17:29:24', '2024-06-14 17:29:24'),
('ozpwys6-y-AR9w8rYZ_GxfwULiBf7Gdn', '2024-06-15 16:59:45', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-14 16:59:45', '2024-06-14 16:59:45'),
('oZw0ynViFzt7-gv4vKq8UWcNf1M1sZnR', '2024-06-14 19:28:23', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-13 19:28:23', '2024-06-13 19:28:23'),
('PCxCfLDwX2gkd36GssrBcPDx_gWWX21U', '2024-06-15 17:36:05', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-14 17:36:05', '2024-06-14 17:36:05'),
('PGSskeO2rcNw8uMaFZQZX_ciR-scrR4h', '2024-06-15 15:13:51', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-14 15:13:51', '2024-06-14 15:13:51'),
('poQgRTZaby1CGfTrWagvHN7G81Kqf5Ud', '2024-06-14 23:37:41', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-13 23:37:41', '2024-06-13 23:37:41'),
('PYw2A5ckcYODcJmwSTVtCBg5Coq23OCD', '2024-06-15 17:36:21', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-14 17:36:21', '2024-06-14 17:36:21'),
('qLLCxtk2Ep_4UFOm8u5zY4XbraOVIAXq', '2024-06-15 01:15:07', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-14 01:15:07', '2024-06-14 01:15:07'),
('qNXz5EwtZbfwi5njc3x_GQGrJO9cANjg', '2024-06-14 23:37:48', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-13 23:37:48', '2024-06-13 23:37:48'),
('qQdKuMVt7p4XT-7T0Fk-M20bzslFls8B', '2024-06-15 16:12:31', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-14 16:12:31', '2024-06-14 16:12:31'),
('QUNxfUDtvlidOoBAjHm_zGpIx7p0ipCS', '2024-06-15 17:10:45', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-14 17:10:45', '2024-06-14 17:10:45'),
('RGGyb0nn-c1RFsPSWK3MzZFqkc4tU0YV', '2024-06-15 17:50:57', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-14 17:50:57', '2024-06-14 17:50:57'),
('RjrrE7Ymo006YsiCXQK867yDcGsRZGIG', '2024-06-15 17:34:11', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-14 17:34:11', '2024-06-14 17:34:11'),
('rxAXCzOIULBtjKgUJTzOn65riSVmUFgH', '2024-06-14 23:11:12', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-13 23:11:12', '2024-06-13 23:11:12'),
('S-I8Jt6VlzvyPsqvKDBshanDE4rM7tjc', '2024-06-15 17:10:35', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-14 17:10:35', '2024-06-14 17:10:35'),
('s4WmawVTZrPcFY6dwMs9dVYMR_0uS0Rj', '2024-06-14 23:06:54', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-13 23:06:54', '2024-06-13 23:06:54'),
('TaISIcCbOwlz2wKMxSVmLjmUGNXq8NJZ', '2024-06-15 15:56:59', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-14 15:56:59', '2024-06-14 15:56:59'),
('tl8GBU2NHD9fSLxYyxOqhWZM8T5gtprO', '2024-06-14 22:14:08', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-13 22:14:08', '2024-06-13 22:14:08'),
('tzId_0B-BhEWj0jXBEs9C11mMRs8vUv_', '2024-06-14 18:22:07', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-13 18:22:07', '2024-06-13 18:22:07'),
('UARwkeecHqUXOvxYRvB01JZUrltCfwpM', '2024-06-15 17:32:46', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-14 17:32:46', '2024-06-14 17:32:46'),
('UOJJqaJvl-bhjmz7BfEhyONhwOFqKFlA', '2024-06-14 18:14:53', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-13 18:14:53', '2024-06-13 18:14:53'),
('v0ivN6puclMwFvi6p2DuJHnvGAxTk1V7', '2024-06-14 23:37:26', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-13 23:37:26', '2024-06-13 23:37:26'),
('VGCVFm5Yez-jOJd7GhBObef4FWAqy2o-', '2024-06-14 18:45:43', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-13 18:45:43', '2024-06-13 18:45:43'),
('VjmUX-_S0vCK7fpmT_2UAUnI8vpqORw1', '2024-06-15 17:35:46', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-14 17:35:46', '2024-06-14 17:35:46'),
('VZlr3PaxYWKQMDUZHlgU0nvkJYER1hYt', '2024-06-15 17:35:34', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-14 17:35:34', '2024-06-14 17:35:34'),
('wANfgqb2MzuwdnIyNq5ERfD8Wyn3gxBy', '2024-06-14 22:14:27', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-13 22:14:27', '2024-06-13 22:14:27'),
('wBecFsCgEkuNrXMLJUfm4sUellip7EBM', '2024-06-14 17:55:19', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-13 17:55:19', '2024-06-13 17:55:19'),
('Wheor25gD1OlgZOFr2VRBmGW7rHrVGUA', '2024-06-15 17:32:41', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-14 17:32:41', '2024-06-14 17:32:41'),
('wxaFx5-R7dzt0jQGdngm_vT6ZhW8KyUF', '2024-06-15 17:10:36', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-14 17:10:36', '2024-06-14 17:10:36'),
('X0H6vaLvw82N1pQ3ipd9dvMKdXOSx5m_', '2024-06-15 01:17:27', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-14 01:17:27', '2024-06-14 01:17:27'),
('X6Sl0sH63sin6qRUIa3UihA-1ORmMTPy', '2024-06-14 19:26:25', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-13 19:26:25', '2024-06-13 19:26:25'),
('xBSGl1zskJPx8tQKwKr2kae8PAw8jz4l', '2024-06-14 18:25:04', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-13 18:25:04', '2024-06-13 18:25:04'),
('xyv-0sBX0I6UsPwkHMd_i4mpFw1v4xWQ', '2024-06-14 22:08:33', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-13 22:08:33', '2024-06-13 22:08:33'),
('Y_T-GgvYI9ntZ_WGUf4KOqSMtVl0J0DP', '2024-06-14 18:21:40', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-13 18:21:40', '2024-06-13 18:21:40'),
('z497agUsD_Sa2Zk50hvHgdvOcIPk_dQW', '2024-06-14 23:37:45', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-13 23:37:45', '2024-06-13 23:37:45'),
('ZNIg3jN2cNfGaFBX3tCaqC4ZqvjijQgD', '2024-06-14 23:07:46', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-13 23:07:46', '2024-06-13 23:07:46'),
('_oSIWG0lTIpP94XMcl-gPgttsi52hiF2', '2024-06-15 17:10:51', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-06-14 17:10:51', '2024-06-14 17:10:51');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `uuid`, `name`, `email`, `password`, `role`, `createdAt`, `updatedAt`) VALUES
(1, '3a23d887-720e-4010-8aa7-fd4786c22805', 'franco justo cruz ', 'francojusto@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$cIUAbeEhhNvwywunXWAYsg$g4ExRC/L0G1ZeKjXPPXnM9YYUOmCjt8OrOxFgf+NSD4', 'admin', '2024-06-10 23:49:31', '2024-06-14 17:31:54'),
(6, '8409cea9-d95d-4649-9687-635a48a6f3f3', 'Harold', 'harold123@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$/0bM6FVnmAkMPSnvY9FrUA$ag0lpU7Bp7LgInSdDp+OLqgFVyoYOffIaV0xb8999mE', 'admin', '2024-06-14 17:32:47', '2024-06-14 17:34:11'),
(8, '8a7a35e1-e5f0-42c6-b5e7-fb352e57f2d0', 'Usuario1', 'usuario1@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$axEU9LaHS3hVIffaqlXX6g$kbrKJx9ArTeI0Aq1ZxJdIDvOkzDN3dl1S6We2aJPjko', 'user', '2024-06-14 17:34:42', '2024-06-14 17:34:42'),
(9, '19368cef-0aff-49b7-b4fd-0387dd8ccea1', 'Usuario2', 'usuario2@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$5wdsb92h/Z6u9pY+FeeoAQ$byNAL6rq1iaB4AJD00sJHG/2N3XxfNVshaP1xGpq3x0', 'user', '2024-06-14 17:35:12', '2024-06-14 17:35:12');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `incidencia`
--
ALTER TABLE `incidencia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoriaId` (`categoriaId`),
  ADD KEY `userId` (`userId`);

--
-- Indices de la tabla `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`sid`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `incidencia`
--
ALTER TABLE `incidencia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `incidencia`
--
ALTER TABLE `incidencia`
  ADD CONSTRAINT `incidencia_ibfk_1` FOREIGN KEY (`categoriaId`) REFERENCES `categoria` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `incidencia_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
