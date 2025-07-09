-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 17/06/2025 às 15:54
-- Versão do servidor: 5.7.34
-- Versão do PHP: 8.1.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `platform`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `account_withdraws`
--

CREATE TABLE `account_withdraws` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `pix_type` varchar(255) NOT NULL,
  `pix_key` varchar(255) NOT NULL,
  `document` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura para tabela `affiliate_histories`
--

CREATE TABLE `affiliate_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `inviter` int(10) UNSIGNED NOT NULL,
  `commission` decimal(20,2) NOT NULL DEFAULT '0.00',
  `commission_type` varchar(191) DEFAULT NULL,
  `deposited` tinyint(4) DEFAULT '0',
  `deposited_amount` decimal(10,2) DEFAULT '0.00',
  `losses` bigint(20) DEFAULT '0',
  `losses_amount` decimal(10,2) DEFAULT '0.00',
  `commission_paid` decimal(10,2) DEFAULT '0.00',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `receita` decimal(10,2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `affiliate_withdraws`
--

CREATE TABLE `affiliate_withdraws` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment_id` varchar(191) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(20,2) NOT NULL DEFAULT '0.00',
  `proof` varchar(191) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `pix_key` varchar(191) DEFAULT NULL,
  `pix_type` varchar(191) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `cpf` varchar(14) DEFAULT NULL,
  `bank_info` text,
  `currency` varchar(50) DEFAULT NULL,
  `symbol` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `aprove_save_settings`
--

CREATE TABLE `aprove_save_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `approval_password_save` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `last_requested_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `aprove_save_settings`
--

INSERT INTO `aprove_save_settings` (`id`, `approval_password_save`, `created_at`, `updated_at`, `last_requested_at`) VALUES
(1, '$2y$10$Z9XCHJqAC0BzfCTx5PYCKO5QR2KvM2XiVhIqhbFYJ9mlbWZJOoKtG', '2024-08-15 00:27:52', '2025-04-18 20:46:11', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `aprove_withdrawals`
--

CREATE TABLE `aprove_withdrawals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `approval_password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `last_requested_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `aprove_withdrawals`
--

INSERT INTO `aprove_withdrawals` (`id`, `approval_password`, `created_at`, `updated_at`, `last_requested_at`) VALUES
(1, '$2y$10$Z9XCHJqAC0BzfCTx5PYCKO5QR2KvM2XiVhIqhbFYJ9mlbWZJOoKtG', '2024-08-14 21:27:52', '2024-11-03 11:25:22', '2024-10-08 15:54:21');

-- --------------------------------------------------------

--
-- Estrutura para tabela `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `link` varchar(191) DEFAULT NULL,
  `image` varchar(191) NOT NULL,
  `type` varchar(20) NOT NULL DEFAULT 'home',
  `description` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `mobile_image` varchar(191) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `banners`
--

INSERT INTO `banners` (`id`, `link`, `image`, `type`, `description`, `created_at`, `updated_at`, `mobile_image`) VALUES
(30, 'https://aglow777.com/games/play/1923/fortune-rabbit', '01JPZQZDSW5YQ9MCJ0XP18MKG6.jpg', 'carousel', NULL, '2024-12-18 13:00:32', '2025-03-22 17:16:13', ''),
(31, 'https://aglow777.com/games/play/1927/fortune-dragon', '01JPZR0654AE2EMSR59NH3CQPP.webp', 'carousel', NULL, '2024-12-27 18:57:49', '2025-03-22 17:16:38', ''),
(32, 'https://aglow777.com/games/play/1910/fortune-tiger', '01JPZR1FBJFEQF5E2F2ASFNP9R.jpg', 'carousel', NULL, '2024-12-27 18:57:59', '2025-03-22 17:17:20', ''),
(33, 'suporteapi@gmail.com', '01JPZR36FZX0MNCT318V0NCZN5.jpg', 'carousel', NULL, '2025-03-22 17:18:16', '2025-03-22 17:18:16', ''),
(35, 'https://seulinktelegram.com', '01JQ1WWB62CBNZDH50QCXZ74KB.png', 'home', 'ho', '2025-03-23 12:58:04', '2025-03-23 13:20:37', ''),
(36, 'https://telgramaqui.com', '01JQ1WY2QJ6J6DAJSR5NWFSFZA.png', 'home', 'ed', '2025-03-23 13:07:21', '2025-03-23 13:21:20', ''),
(37, 'https://instagram.com', '01JQ1W5M1KN21VN1FG9HF8S0BY.png', 'home', 'd', '2025-03-23 13:07:59', '2025-03-23 13:07:59', ''),
(38, 'https://umlinkaqui.com', '01JQ1X1JMEBZ1W7ZYEHSQBQ7HN.png', 'home', 'e', '2025-03-23 13:23:15', '2025-03-23 13:23:15', ''),
(39, 'https://seulink.com', '01JQ1X2RKXGDP3ET72BSRC21RH.png', 'home', 'w', '2025-03-23 13:23:54', '2025-03-23 13:23:54', ''),
(41, '/vip', '01JR0ZF5QG4P8ZP1EY2DACYYGZ.webp', 'home', NULL, '2025-04-04 15:02:05', '2025-04-04 15:02:05', '');

-- --------------------------------------------------------

--
-- Estrutura para tabela `baus`
--

CREATE TABLE `baus` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `bau_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `caminho` varchar(255) DEFAULT NULL,
  `dataS` timestamp NULL DEFAULT NULL,
  `aberto_em` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `value_mostrar` text,
  `slug` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `baus`
--

INSERT INTO `baus` (`id`, `user_id`, `bau_id`, `status`, `caminho`, `dataS`, `aberto_em`, `updated_at`, `created_at`, `value_mostrar`, `slug`) VALUES
(81, 127, 1, 3, '/assets/images/bauaberto.png', NULL, '2025-02-18 17:10:46', '2025-02-18 17:10:46', '2025-02-17 20:44:00', 'R$ 10', ''),
(82, 127, 2, 3, '/assets/images/bauaberto.png', NULL, '2025-02-18 17:10:52', '2025-02-18 17:10:52', '2025-02-18 06:19:47', 'R$ 10', ''),
(83, 127, 3, 3, '/assets/images/bauaberto.png', NULL, '2025-02-18 17:10:55', '2025-02-18 17:10:55', '2025-02-18 12:43:13', 'R$ 10', '');

-- --------------------------------------------------------

--
-- Estrutura para tabela `bs_pay_payments`
--

CREATE TABLE `bs_pay_payments` (
  `id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `withdrawal_id` int(11) DEFAULT NULL,
  `pix_key` varchar(255) DEFAULT NULL,
  `pix_type` varchar(50) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `observation` text,
  `status` enum('pending','completed','failed') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura para tabela `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` varchar(191) NOT NULL,
  `image` varchar(191) DEFAULT NULL,
  `slug` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image_select` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `image`, `slug`, `created_at`, `updated_at`, `image_select`) VALUES
(8, 'Pescaria', 'Pescaria', '01JS6BCD78JK8JTBV23P1XSXGK.webp', 'pescaria', '2024-06-18 19:30:26', '2025-04-19 07:22:11', '01JS6BCD79R6DPD19Y2Z3J3P91.webp'),
(3, 'Pragmatic', 'Pragmatic', '01JS6B3GY8ZX3RRHX0D5845H3V.webp', 'pragmatic', '2024-06-18 19:29:56', '2025-04-19 07:26:52', '01JS6B3GY8ZX3RRHX0D5845H3W.webp'),
(1, 'Popular', 'Popular', '01JS6CJCTWM9ZFSMXS5SAPETSR.webp', 'popular', '2024-06-18 19:28:56', '2025-04-19 07:42:56', '01JS6CJCTXDD945WMVBEFTTKGV.webp'),
(2, 'PG-Slot', 'PG-Slot', '01JS6B2GD1FDNABH6FN5034VG1.webp', 'pg-slot', '2024-06-18 19:28:57', '2025-04-19 07:16:47', '01JS6B2GD39N8WNTKK3DTC40PQ.webp'),
(9, 'Evoplay', 'Evoplay', '01JS6BEECQTH86T1TBWJE0R0EP.webp', 'evoplay', '2024-08-22 18:46:09', '2025-04-19 07:23:18', '01JS6BEECRE9SJJS7XC45C7CSK.webp'),
(10, 'NetEnd', 'netend', '01JS6BG207HBWK2389PKGK2C7X.webp', 'netend', '2025-03-22 21:45:00', '2025-04-19 07:24:11', '01JS6BG207HBWK2389PKGK2C7Y.webp'),
(4, 'Spribe', 'spribe', '01JS6BH847YG8PQE2K04JXAK2K.webp', 'spribe', '2025-03-23 02:46:32', '2025-04-19 07:24:50', '01JS6BH848QTWY33KW3XTTHVBB.webp'),
(7, 'Galaxsys', 'galaxsys', '01JS6BQEKRD8AW2V8H3EC4DHMK.webp', 'galaxsys', '2025-04-19 07:28:13', '2025-04-19 07:28:13', '01JS6BQEKS8R0MC1T1YCZ2KF84.webp'),
(5, 'Evolution', 'evolution', '01JS6BRR3GKE69BDJBESKP8NWA.webp', 'evolution', '2025-04-19 07:28:56', '2025-04-19 07:28:56', '01JS6BRR3GKE69BDJBESKP8NWB.webp'),
(11, 'Habanero', 'habanero', '01JS6BSJTEAH3VB7ER3WSBVQQ2.webp', 'habanero', '2025-04-19 07:29:23', '2025-04-19 07:29:23', '01JS6BSJTF5G0ZABJ5S2VTN8JQ.webp'),
(12, 'Microgaming', 'microgaming', '01JS6BTBNPT2FTQTPG99BJ693S.webp', 'microgaming', '2025-04-19 07:29:48', '2025-04-19 07:29:48', '01JS6BTBNQ3HE5FMR44Q10Y3KD.webp'),
(13, 'Booongo', 'booongo', '01JS6BV1WZDQTCMK3J1ASWAHG7.webp', 'booongo', '2025-04-19 07:30:11', '2025-04-19 07:30:11', '01JS6BV1X0R3C0X0R103NHXKNN.webp'),
(6, 'Pragmatic Live', 'pragmaticlive', '01JS6BVYJA717MY1E3D9S0N9ED.webp', 'pragmatic-live', '2025-04-19 07:30:40', '2025-04-19 07:30:40', '01JS6BVYJBQJP5GVW579FXN8CN.webp');

-- --------------------------------------------------------

--
-- Estrutura para tabela `category_game`
--

CREATE TABLE `category_game` (
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `game_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 ROW_FORMAT=FIXED;

--
-- Despejando dados para a tabela `category_game`
--

INSERT INTO `category_game` (`category_id`, `game_id`) VALUES
(2, 166),
(2, 167),
(2, 168),
(2, 169),
(2, 170),
(2, 171),
(2, 172),
(2, 173),
(2, 174),
(2, 175),
(2, 176),
(2, 177),
(2, 178),
(2, 179),
(2, 180),
(2, 181),
(2, 182),
(2, 183),
(2, 184),
(2, 185),
(2, 186),
(2, 187),
(2, 188),
(2, 189),
(2, 190),
(2, 191),
(2, 192),
(2, 193),
(2, 194),
(2, 195),
(2, 196),
(2, 197),
(2, 198),
(2, 199),
(2, 200),
(2, 201),
(2, 811),
(2, 812),
(2, 840),
(2, 841),
(2, 842),
(2, 843),
(2, 844),
(2, 845),
(2, 846),
(2, 847),
(2, 848),
(2, 849),
(2, 850),
(2, 851),
(2, 852),
(2, 853),
(2, 854),
(2, 855),
(2, 856),
(2, 857),
(2, 858),
(2, 859),
(2, 860),
(2, 861),
(2, 862),
(2, 863),
(2, 864),
(2, 865),
(2, 866),
(2, 867),
(2, 868),
(2, 869),
(2, 870),
(2, 872),
(2, 873),
(2, 874),
(2, 875),
(2, 876),
(2, 1422),
(2, 1081),
(2, 1423),
(2, 1424),
(2, 1425),
(2, 1426),
(2, 1427),
(2, 1428),
(2, 1429),
(2, 1430),
(2, 1431),
(2, 1432),
(2, 1433),
(2, 1434),
(2, 1435),
(2, 1436),
(2, 1437),
(2, 1438),
(2, 1439),
(2, 1440),
(2, 1441),
(2, 1442),
(2, 1443),
(2, 1445),
(2, 1446),
(2, 1447),
(3, 5),
(3, 18),
(3, 21),
(3, 26),
(3, 29),
(3, 30),
(3, 33),
(3, 41),
(3, 48),
(3, 50),
(3, 53),
(3, 70),
(3, 71),
(3, 72),
(3, 74),
(3, 76),
(3, 78),
(3, 87),
(3, 89),
(3, 97),
(3, 100),
(3, 103),
(3, 105),
(3, 106),
(3, 107),
(3, 111),
(3, 148),
(3, 150),
(3, 161),
(3, 215),
(3, 217),
(3, 219),
(3, 220),
(3, 224),
(3, 244),
(3, 246),
(3, 249),
(3, 256),
(3, 275),
(3, 277),
(3, 279),
(3, 280),
(3, 287),
(3, 632),
(3, 639),
(3, 641),
(3, 650),
(3, 656),
(3, 658),
(3, 663),
(3, 671),
(3, 674),
(3, 679),
(3, 697),
(3, 703),
(3, 787),
(3, 788),
(3, 808),
(3, 809),
(3, 810),
(3, 816),
(3, 817),
(3, 818),
(3, 819),
(3, 821),
(3, 822),
(3, 823),
(3, 825),
(3, 826),
(3, 827),
(3, 828),
(3, 830),
(3, 831),
(3, 833),
(3, 834),
(3, 835),
(3, 908),
(3, 1444),
(3, 1448),
(4, 791),
(4, 792),
(4, 793),
(4, 794),
(4, 795),
(4, 796),
(4, 871),
(4, 878),
(4, 1420),
(4, 1421),
(5, 1190),
(5, 1191),
(5, 1192),
(5, 1193),
(5, 1194),
(5, 1195),
(5, 1196),
(5, 1197),
(5, 1198),
(5, 1199),
(5, 1200),
(5, 1201),
(5, 1202),
(5, 1203),
(5, 1204),
(5, 1205),
(5, 1206),
(5, 1207),
(5, 1208),
(5, 1209),
(5, 1210),
(5, 1211),
(5, 1212),
(5, 1213),
(5, 1214),
(5, 1215),
(5, 1216),
(5, 1217),
(5, 1218),
(5, 1219),
(5, 1220),
(5, 1221),
(5, 1222),
(5, 1223),
(5, 1224),
(5, 1225),
(5, 1226),
(5, 1227),
(5, 1228),
(5, 1229),
(5, 1230),
(5, 1231),
(5, 1232),
(5, 1233),
(5, 1234),
(5, 1235),
(5, 1236),
(5, 1237),
(5, 1238),
(5, 1239),
(5, 1240),
(5, 1241),
(5, 1242),
(5, 1243),
(5, 1244),
(5, 1245),
(5, 1246),
(5, 1247),
(5, 1248),
(5, 1249),
(5, 1250),
(5, 1251),
(5, 1252),
(5, 1253),
(5, 1254),
(5, 1255),
(5, 1256),
(5, 1257),
(5, 1258),
(5, 1259),
(5, 1260),
(5, 1261),
(5, 1262),
(5, 1263),
(5, 1264),
(5, 1265),
(5, 1266),
(5, 1267),
(5, 1268),
(5, 1269),
(5, 1270),
(5, 1271),
(5, 1272),
(5, 1273),
(5, 1274),
(5, 1275),
(5, 1276),
(5, 1277),
(5, 1278),
(5, 1279),
(5, 1280),
(5, 1281),
(5, 1282),
(5, 1283),
(5, 1284),
(5, 1285),
(5, 1286),
(5, 1287),
(5, 1288),
(5, 1289),
(5, 1290),
(5, 1291),
(5, 1292),
(5, 1293),
(5, 1294),
(5, 1295),
(5, 1296),
(5, 1297),
(5, 1298),
(5, 1299),
(5, 1300),
(5, 1301),
(5, 1302),
(5, 1303),
(5, 1304),
(5, 1305),
(5, 1306),
(5, 1307),
(5, 1308),
(5, 1309),
(5, 1310),
(5, 1311),
(5, 1312),
(5, 1313),
(5, 1314),
(5, 1315),
(5, 1316),
(5, 1317),
(5, 1318),
(5, 1319),
(5, 1320),
(5, 1321),
(5, 1322),
(5, 1323),
(5, 1324),
(5, 1325),
(5, 1326),
(5, 1327),
(5, 1328),
(5, 1329),
(5, 1330),
(5, 1331),
(5, 1332),
(5, 1333),
(5, 1334),
(5, 1335),
(5, 1336),
(5, 1337),
(5, 1338),
(5, 1339),
(5, 1340),
(5, 1341),
(5, 1342),
(5, 1343),
(5, 1344),
(5, 1345),
(5, 1346),
(5, 1347),
(5, 1348),
(5, 1349),
(5, 1350),
(5, 1351),
(5, 1352),
(5, 1353),
(5, 1354),
(5, 1355),
(5, 1356),
(5, 1357),
(5, 1358),
(5, 1359),
(5, 1360),
(5, 1361),
(5, 1362),
(5, 1363),
(5, 1364),
(5, 1365),
(5, 1366),
(5, 1367),
(5, 1368),
(5, 1369),
(5, 1370),
(5, 1371),
(5, 1372),
(5, 1373),
(5, 1374),
(5, 1375),
(5, 1376),
(5, 1377),
(5, 1378),
(5, 1379),
(5, 1380),
(5, 1381),
(5, 1382),
(5, 1383),
(5, 1384),
(5, 1385),
(5, 1386),
(5, 1387),
(5, 1388),
(5, 1389),
(5, 1390),
(5, 1391),
(5, 1392),
(5, 1393),
(5, 1394),
(5, 1395),
(5, 1396),
(5, 1397),
(5, 1398),
(5, 1399),
(5, 1400),
(6, 1072),
(6, 1073),
(6, 1074),
(6, 1075),
(6, 1076),
(6, 1077),
(6, 1078),
(6, 1079),
(6, 1080),
(6, 1082),
(6, 1083),
(6, 1084),
(6, 1085),
(6, 1086),
(6, 1087),
(6, 1088),
(6, 1089),
(6, 1090),
(6, 1091),
(6, 1092),
(6, 1093),
(6, 1094),
(6, 1095),
(6, 1096),
(6, 1097),
(6, 1098),
(6, 1099),
(6, 1100),
(6, 1101),
(6, 1102),
(6, 1103),
(6, 1104),
(6, 1105),
(6, 1106),
(6, 1107),
(6, 1108),
(6, 1109),
(6, 1110),
(6, 1111),
(6, 1112),
(6, 1113),
(6, 1114),
(6, 1115),
(6, 1116),
(6, 1117),
(6, 1118),
(6, 1119),
(6, 1120),
(6, 1121),
(6, 1122),
(6, 1123),
(6, 1125),
(6, 1126),
(6, 1127),
(6, 1128),
(6, 1129),
(6, 1130),
(6, 1131),
(6, 1132),
(6, 1133),
(6, 1134),
(6, 1135),
(6, 1136),
(6, 1137),
(6, 1138),
(6, 1139),
(6, 1140),
(6, 1141),
(6, 1142),
(6, 1143),
(6, 1144),
(6, 1145),
(6, 1146),
(6, 1147),
(6, 1148),
(6, 1149),
(6, 1150),
(6, 1151),
(6, 1152),
(6, 1153),
(6, 1154),
(6, 1155),
(6, 1156),
(6, 1157),
(6, 1158),
(6, 1159),
(6, 1160),
(6, 1161),
(6, 1162),
(6, 1163),
(6, 1178),
(6, 1179),
(6, 1180),
(6, 1181),
(6, 1182),
(6, 1183),
(6, 1184),
(6, 1185),
(6, 1186),
(6, 1187),
(6, 1188),
(6, 1189),
(7, 706),
(7, 707),
(7, 708),
(7, 709),
(7, 710),
(7, 711),
(7, 712),
(7, 713),
(7, 714),
(7, 715),
(7, 716),
(7, 717),
(7, 718),
(7, 719),
(7, 720),
(7, 721),
(7, 722),
(7, 723),
(7, 724),
(7, 725),
(7, 726),
(7, 727),
(7, 728),
(7, 729),
(7, 730),
(7, 731),
(7, 732),
(7, 733),
(7, 734),
(8, 879),
(8, 880),
(8, 881),
(8, 882),
(8, 883),
(8, 884),
(8, 885),
(8, 886),
(8, 887),
(8, 888),
(8, 889),
(8, 890),
(8, 891),
(8, 892),
(8, 893),
(8, 894),
(8, 895),
(8, 896),
(8, 897),
(8, 898),
(8, 899),
(8, 900),
(8, 901),
(8, 902),
(9, 477),
(9, 478),
(9, 479),
(9, 480),
(9, 481),
(9, 482),
(9, 483),
(9, 484),
(9, 485),
(9, 486),
(9, 487),
(9, 488),
(9, 489),
(9, 490),
(9, 491),
(9, 492),
(9, 493),
(9, 494),
(9, 495),
(9, 496),
(9, 497),
(9, 498),
(9, 499),
(9, 500),
(9, 501),
(9, 502),
(9, 503),
(9, 504),
(9, 505),
(9, 506),
(9, 507),
(9, 508),
(9, 509),
(9, 510),
(9, 511),
(9, 512),
(9, 513),
(9, 514),
(9, 515),
(9, 516),
(9, 517),
(9, 518),
(9, 519),
(9, 520),
(9, 521),
(9, 522),
(9, 523),
(9, 524),
(9, 525),
(9, 526),
(9, 527),
(9, 528),
(9, 529),
(10, 1401),
(10, 1402),
(10, 1403),
(10, 1404),
(10, 1405),
(10, 1406),
(10, 1407),
(10, 1408),
(11, 288),
(11, 289),
(11, 290),
(11, 291),
(11, 292),
(11, 293),
(11, 294),
(11, 295),
(11, 296),
(11, 297),
(11, 298),
(11, 299),
(11, 300),
(11, 301),
(11, 302),
(11, 303),
(11, 304),
(11, 305),
(11, 306),
(11, 307),
(11, 308),
(11, 309),
(11, 310),
(11, 311),
(11, 312),
(11, 313),
(11, 314),
(11, 315),
(11, 316),
(11, 317),
(11, 318),
(11, 319),
(11, 320),
(11, 321),
(11, 322),
(11, 323),
(11, 324),
(11, 325),
(11, 326),
(11, 327),
(11, 328),
(11, 329),
(11, 330),
(11, 331),
(11, 332),
(11, 333),
(11, 334),
(11, 335),
(11, 336),
(11, 337),
(11, 338),
(11, 339),
(11, 340),
(11, 341),
(11, 342),
(11, 343),
(11, 344),
(11, 345),
(11, 346),
(11, 347),
(11, 348),
(11, 349),
(11, 350),
(11, 351),
(11, 352),
(11, 353),
(11, 354),
(11, 355),
(11, 356),
(11, 357),
(11, 358),
(11, 359),
(11, 360),
(11, 361),
(11, 362),
(11, 363),
(11, 364),
(11, 365),
(11, 366),
(11, 367),
(11, 368),
(11, 369),
(11, 370),
(11, 371),
(11, 372),
(11, 373),
(11, 374),
(11, 375),
(11, 376),
(11, 377),
(11, 378),
(11, 379),
(11, 380),
(11, 381),
(11, 382),
(11, 383),
(11, 779),
(11, 780),
(11, 781),
(11, 782),
(11, 783),
(11, 784),
(12, 752),
(12, 753),
(12, 754),
(12, 755),
(12, 756),
(12, 757),
(12, 758),
(12, 759),
(12, 760),
(12, 761),
(12, 762),
(12, 763),
(12, 764),
(12, 765),
(12, 766),
(12, 767),
(12, 768),
(12, 769),
(12, 770),
(12, 771),
(12, 772),
(12, 773),
(12, 774),
(12, 775),
(12, 776),
(12, 777),
(12, 778),
(13, 384),
(13, 385),
(13, 386),
(13, 387),
(13, 388),
(13, 389),
(13, 390),
(13, 391),
(13, 392),
(13, 393),
(13, 394),
(13, 395),
(13, 396),
(13, 397),
(13, 398),
(13, 399),
(13, 400),
(13, 401),
(13, 402),
(13, 403),
(13, 404),
(13, 405),
(13, 406),
(13, 407),
(13, 408),
(13, 409),
(13, 410),
(13, 411),
(13, 412),
(13, 413),
(13, 414),
(13, 415),
(13, 416),
(13, 417),
(13, 418),
(13, 419),
(13, 420),
(13, 421),
(13, 422),
(13, 423),
(13, 424),
(13, 425),
(13, 426),
(13, 427),
(13, 428),
(13, 429),
(13, 430),
(13, 431),
(13, 432),
(1, 1424),
(1, 1423),
(1, 1445),
(1, 1444),
(1, 1428),
(1, 1420),
(1, 1448),
(1, 1422);

-- --------------------------------------------------------

--
-- Estrutura para tabela `configs_playfiver`
--

CREATE TABLE `configs_playfiver` (
  `id` int(10) UNSIGNED NOT NULL,
  `rtp` decimal(5,2) DEFAULT NULL,
  `limit_enable` tinyint(1) DEFAULT '0',
  `limit_amount` decimal(10,2) DEFAULT NULL,
  `limit_hours` int(11) DEFAULT NULL,
  `bonus_enable` tinyint(1) DEFAULT '0',
  `edit` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `configs_playfiver`
--

INSERT INTO `configs_playfiver` (`id`, `rtp`, `limit_enable`, `limit_amount`, `limit_hours`, `bonus_enable`, `edit`, `created_at`, `updated_at`) VALUES
(1, 10.00, 0, 500.00, 1, 1, 1, '2025-04-19 04:39:32', '2025-06-17 04:17:20'),
(2, 10.00, 0, 500.00, 1, 1, 1, '2025-04-19 04:39:46', '2025-06-17 04:17:20'),
(3, 10.00, 0, 500.00, 1, 1, 1, '2025-04-19 04:42:42', '2025-06-17 04:17:20'),
(4, 10.00, 0, 500.00, 1, 1, 1, '2025-04-19 04:42:55', '2025-06-17 04:17:20'),
(5, 10.00, 0, 500.00, 1, 1, 1, '2025-04-19 04:55:33', '2025-06-17 04:17:20'),
(6, 10.00, 0, 500.00, 1, 1, 1, '2025-04-19 05:15:51', '2025-06-17 04:17:20'),
(7, 10.00, 0, 500.00, 1, 1, 1, '2025-04-19 05:36:11', '2025-06-17 04:17:20'),
(8, 10.00, 0, 500.00, 1, 1, 1, '2025-04-19 06:27:00', '2025-06-17 04:17:20'),
(9, 10.00, 0, 500.00, 1, 1, 1, '2025-04-19 18:42:37', '2025-06-17 04:17:20'),
(10, 10.00, 0, 500.00, 1, 1, 1, '2025-04-20 21:11:18', '2025-06-17 04:17:20'),
(11, 90.00, 0, 100.00, 1, 1, 1, '2025-06-06 18:34:06', '2025-06-17 04:17:20'),
(12, 95.00, 0, 100.00, 1, 1, 1, '2025-06-06 18:34:21', '2025-06-17 04:17:20'),
(13, 95.00, 0, 100.00, 1, 1, 1, '2025-06-16 02:15:12', '2025-06-17 04:17:20');

-- --------------------------------------------------------

--
-- Estrutura para tabela `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `code` varchar(3) NOT NULL,
  `symbol` varchar(5) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `code`, `symbol`, `created_at`, `updated_at`) VALUES
(1, 'Leke', 'ALL', 'Lek', '2023-11-07 18:01:38', NULL),
(2, 'Dollars', 'USD', '$', '2023-11-07 18:01:38', NULL),
(3, 'Afghanis', 'AFN', '؋', '2023-11-07 18:01:38', NULL),
(4, 'Pesos', 'ARS', '$', '2023-11-07 18:01:38', NULL),
(5, 'Guilders', 'AWG', 'ƒ', '2023-11-07 18:01:38', NULL),
(6, 'Dollars', 'AUD', '$', '2023-11-07 18:01:38', NULL),
(7, 'New Manats', 'AZN', 'ман', '2023-11-07 18:01:38', NULL),
(8, 'Dollars', 'BSD', '$', '2023-11-07 18:01:38', NULL),
(9, 'Dollars', 'BBD', '$', '2023-11-07 18:01:38', NULL),
(10, 'Rubles', 'BYR', 'p.', '2023-11-07 18:01:38', NULL),
(11, 'Euro', 'EUR', '€', '2023-11-07 18:01:38', NULL),
(12, 'Dollars', 'BZD', 'BZ$', '2023-11-07 18:01:38', NULL),
(13, 'Dollars', 'BMD', '$', '2023-11-07 18:01:38', NULL),
(14, 'Bolivianos', 'BOB', '$b', '2023-11-07 18:01:38', NULL),
(15, 'Convertible Marka', 'BAM', 'KM', '2023-11-07 18:01:38', NULL),
(16, 'Pula', 'BWP', 'P', '2023-11-07 18:01:38', NULL),
(17, 'Leva', 'BGN', 'лв', '2023-11-07 18:01:38', NULL),
(18, 'Reais', 'BRL', 'R$', '2023-11-07 18:01:38', NULL),
(19, 'Pounds', 'GBP', '£', '2023-11-07 18:01:38', NULL),
(20, 'Dollars', 'BND', '$', '2023-11-07 18:01:38', NULL),
(21, 'Riels', 'KHR', '៛', '2023-11-07 18:01:38', NULL),
(22, 'Dollars', 'CAD', '$', '2023-11-07 18:01:38', NULL),
(23, 'Dollars', 'KYD', '$', '2023-11-07 18:01:38', NULL),
(24, 'Pesos', 'CLP', '$', '2023-11-07 18:01:38', NULL),
(25, 'Yuan Renminbi', 'CNY', '¥', '2023-11-07 18:01:38', NULL),
(26, 'Pesos', 'COP', '$', '2023-11-07 18:01:38', NULL),
(27, 'Colón', 'CRC', '₡', '2023-11-07 18:01:38', NULL),
(28, 'Kuna', 'HRK', 'kn', '2023-11-07 18:01:38', NULL),
(29, 'Pesos', 'CUP', '₱', '2023-11-07 18:01:38', NULL),
(30, 'Koruny', 'CZK', 'Kč', '2023-11-07 18:01:38', NULL),
(31, 'Kroner', 'DKK', 'kr', '2023-11-07 18:01:38', NULL),
(32, 'Pesos', 'DOP', 'RD$', '2023-11-07 18:01:38', NULL),
(33, 'Dollars', 'XCD', '$', '2023-11-07 18:01:38', NULL),
(34, 'Pounds', 'EGP', '£', '2023-11-07 18:01:38', NULL),
(35, 'Colones', 'SVC', '$', '2023-11-07 18:01:38', NULL),
(36, 'Pounds', 'FKP', '£', '2023-11-07 18:01:38', NULL),
(37, 'Dollars', 'FJD', '$', '2023-11-07 18:01:38', NULL),
(38, 'Cedis', 'GHC', '¢', '2023-11-07 18:01:38', NULL),
(39, 'Pounds', 'GIP', '£', '2023-11-07 18:01:38', NULL),
(40, 'Quetzales', 'GTQ', 'Q', '2023-11-07 18:01:38', NULL),
(41, 'Pounds', 'GGP', '£', '2023-11-07 18:01:38', NULL),
(42, 'Dollars', 'GYD', '$', '2023-11-07 18:01:38', NULL),
(43, 'Lempiras', 'HNL', 'L', '2023-11-07 18:01:38', NULL),
(44, 'Dollars', 'HKD', '$', '2023-11-07 18:01:38', NULL),
(45, 'Forint', 'HUF', 'Ft', '2023-11-07 18:01:38', NULL),
(46, 'Kronur', 'ISK', 'kr', '2023-11-07 18:01:38', NULL),
(47, 'Rupees', 'INR', 'Rp', '2023-11-07 18:01:38', NULL),
(48, 'Rupiahs', 'IDR', 'Rp', '2023-11-07 18:01:38', NULL),
(49, 'Rials', 'IRR', '﷼', '2023-11-07 18:01:38', NULL),
(50, 'Pounds', 'IMP', '£', '2023-11-07 18:01:38', NULL),
(51, 'New Shekels', 'ILS', '₪', '2023-11-07 18:01:38', NULL),
(52, 'Dollars', 'JMD', 'J$', '2023-11-07 18:01:38', NULL),
(53, 'Yen', 'JPY', '¥', '2023-11-07 18:01:38', NULL),
(54, 'Pounds', 'JEP', '£', '2023-11-07 18:01:38', NULL),
(55, 'Tenge', 'KZT', 'лв', '2023-11-07 18:01:38', NULL),
(56, 'Won', 'KPW', '₩', '2023-11-07 18:01:38', NULL),
(57, 'Won', 'KRW', '₩', '2023-11-07 18:01:38', NULL),
(58, 'Soms', 'KGS', 'лв', '2023-11-07 18:01:38', NULL),
(59, 'Kips', 'LAK', '₭', '2023-11-07 18:01:38', NULL),
(60, 'Lati', 'LVL', 'Ls', '2023-11-07 18:01:38', NULL),
(61, 'Pounds', 'LBP', '£', '2023-11-07 18:01:38', NULL),
(62, 'Dollars', 'LRD', '$', '2023-11-07 18:01:38', NULL),
(63, 'Switzerland Francs', 'CHF', 'CHF', '2023-11-07 18:01:38', NULL),
(64, 'Litai', 'LTL', 'Lt', '2023-11-07 18:01:38', NULL),
(65, 'Denars', 'MKD', 'ден', '2023-11-07 18:01:38', NULL),
(66, 'Ringgits', 'MYR', 'RM', '2023-11-07 18:01:38', NULL),
(67, 'Rupees', 'MUR', '₨', '2023-11-07 18:01:38', NULL),
(68, 'Pesos', 'MXN', '$', '2023-11-07 18:01:38', NULL),
(69, 'Tugriks', 'MNT', '₮', '2023-11-07 18:01:38', NULL),
(70, 'Meticais', 'MZN', 'MT', '2023-11-07 18:01:38', NULL),
(71, 'Dollars', 'NAD', '$', '2023-11-07 18:01:38', NULL),
(72, 'Rupees', 'NPR', '₨', '2023-11-07 18:01:38', NULL),
(73, 'Guilders', 'ANG', 'ƒ', '2023-11-07 18:01:38', NULL),
(74, 'Dollars', 'NZD', '$', '2023-11-07 18:01:38', NULL),
(75, 'Cordobas', 'NIO', 'C$', '2023-11-07 18:01:38', NULL),
(76, 'Nairas', 'NGN', '₦', '2023-11-07 18:01:38', NULL),
(77, 'Krone', 'NOK', 'kr', '2023-11-07 18:01:38', NULL),
(78, 'Rials', 'OMR', '﷼', '2023-11-07 18:01:38', NULL),
(79, 'Rupees', 'PKR', '₨', '2023-11-07 18:01:38', NULL),
(80, 'Balboa', 'PAB', 'B/.', '2023-11-07 18:01:38', NULL),
(81, 'Guarani', 'PYG', 'Gs', '2023-11-07 18:01:38', NULL),
(82, 'Nuevos Soles', 'PEN', 'S/.', '2023-11-07 18:01:38', NULL),
(83, 'Pesos', 'PHP', 'Php', '2023-11-07 18:01:38', NULL),
(84, 'Zlotych', 'PLN', 'zł', '2023-11-07 18:01:38', NULL),
(85, 'Rials', 'QAR', '﷼', '2023-11-07 18:01:38', NULL),
(86, 'New Lei', 'RON', 'lei', '2023-11-07 18:01:38', NULL),
(87, 'Rubles', 'RUB', 'руб', '2023-11-07 18:01:38', NULL),
(88, 'Pounds', 'SHP', '£', '2023-11-07 18:01:38', NULL),
(89, 'Riyals', 'SAR', '﷼', '2023-11-07 18:01:38', NULL),
(90, 'Dinars', 'RSD', 'Дин.', '2023-11-07 18:01:38', NULL),
(91, 'Rupees', 'SCR', '₨', '2023-11-07 18:01:38', NULL),
(92, 'Dollars', 'SGD', '$', '2023-11-07 18:01:38', NULL),
(93, 'Dollars', 'SBD', '$', '2023-11-07 18:01:38', NULL),
(94, 'Shillings', 'SOS', 'S', '2023-11-07 18:01:38', NULL),
(95, 'Rand', 'ZAR', 'R', '2023-11-07 18:01:38', NULL),
(96, 'Rupees', 'LKR', '₨', '2023-11-07 18:01:38', NULL),
(97, 'Kronor', 'SEK', 'kr', '2023-11-07 18:01:38', NULL),
(98, 'Dollars', 'SRD', '$', '2023-11-07 18:01:38', NULL),
(99, 'Pounds', 'SYP', '£', '2023-11-07 18:01:38', NULL),
(100, 'New Dollars', 'TWD', 'NT$', '2023-11-07 18:01:38', NULL),
(101, 'Baht', 'THB', '฿', '2023-11-07 18:01:38', NULL),
(102, 'Dollars', 'TTD', 'TT$', '2023-11-07 18:01:38', NULL),
(103, 'Lira', 'TRY', '₺', '2023-11-07 18:01:38', NULL),
(104, 'Liras', 'TRL', '£', '2023-11-07 18:01:38', NULL),
(105, 'Dollars', 'TVD', '$', '2023-11-07 18:01:38', NULL),
(106, 'Hryvnia', 'UAH', '₴', '2023-11-07 18:01:38', NULL),
(107, 'Pesos', 'UYU', '$U', '2023-11-07 18:01:38', NULL),
(108, 'Sums', 'UZS', 'лв', '2023-11-07 18:01:38', NULL),
(109, 'Bolivares Fuertes', 'VEF', 'Bs', '2023-11-07 18:01:38', NULL),
(110, 'Dong', 'VND', '₫', '2023-11-07 18:01:38', NULL),
(111, 'Rials', 'YER', '﷼', '2023-11-07 18:01:38', NULL),
(112, 'Zimbabwe Dollars', 'ZWD', 'Z$', '2023-11-07 18:01:38', NULL),
(113, 'Rupees', 'INR', '₹', '2023-11-07 18:01:38', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `currency_alloweds`
--

CREATE TABLE `currency_alloweds` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `currency_id` bigint(20) UNSIGNED NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Estrutura para tabela `custom_layouts`
--

CREATE TABLE `custom_layouts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `font_family_default` varchar(191) DEFAULT NULL,
  `primary_color` varchar(20) NOT NULL DEFAULT '#FFFFFF',
  `title_color` varchar(20) NOT NULL DEFAULT '#ffffff',
  `text_color` varchar(20) NOT NULL DEFAULT '#98A7B5',
  `sub_text_color` varchar(20) NOT NULL DEFAULT '#656E78',
  `placeholder_color` varchar(20) NOT NULL DEFAULT '#FFFFFF',
  `background_color_cassino` varchar(20) NOT NULL DEFAULT '#24262B',
  `background_base` varchar(20) DEFAULT '#ECEFF1',
  `background_base_dark` varchar(20) DEFAULT '#24262B',
  `carousel_banners` varchar(20) DEFAULT '#1E2024',
  `carousel_banners_dark` varchar(20) DEFAULT '#1E2024',
  `sidebar_color` varchar(20) DEFAULT NULL,
  `sidebar_color_dark` varchar(20) DEFAULT NULL,
  `navtop_color` varchar(20) DEFAULT NULL,
  `navtop_color_dark` varchar(20) DEFAULT NULL,
  `side_menu` varchar(20) DEFAULT NULL,
  `side_menu_dark` varchar(20) DEFAULT NULL,
  `footer_color` varchar(20) DEFAULT NULL,
  `footer_color_dark` varchar(20) DEFAULT NULL,
  `border_radius` varchar(20) NOT NULL DEFAULT '.25rem',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `instagram` varchar(191) DEFAULT NULL,
  `facebook` varchar(191) DEFAULT NULL,
  `telegram` varchar(191) DEFAULT NULL,
  `twitter` varchar(191) DEFAULT NULL,
  `whastapp` varchar(191) DEFAULT NULL,
  `youtube` varchar(191) DEFAULT NULL,
  `search_border_color` varchar(20) NOT NULL,
  `Border_bottons_and_selected` varchar(20) NOT NULL,
  `background_bottom_navigation` varchar(20) DEFAULT NULL,
  `background_bottom_navigation_dark` varchar(20) DEFAULT NULL,
  `borders_and_dividers_colors` varchar(20) DEFAULT NULL,
  `search_back` varchar(20) DEFAULT NULL,
  `color_bt_1` varchar(20) DEFAULT NULL,
  `color_bt_2` varchar(20) DEFAULT NULL,
  `color_bt_3` varchar(20) DEFAULT NULL,
  `color_bt_4` varchar(20) DEFAULT NULL,
  `bt_1_link` varchar(191) DEFAULT NULL,
  `bt_2_link` varchar(191) DEFAULT NULL,
  `bt_3_link` varchar(191) DEFAULT NULL,
  `bt_4_link` varchar(191) DEFAULT NULL,
  `bt_5_link` varchar(191) DEFAULT NULL,
  `value_color_jackpot` varchar(20) DEFAULT NULL,
  `value_wallet_navtop` varchar(20) DEFAULT NULL,
  `bonus_color_dep` varchar(20) DEFAULT NULL,
  `colors_deposit_value` varchar(20) DEFAULT NULL,
  `color_players` varchar(20) DEFAULT NULL,
  `modal_termos_register` longtext,
  `modal_termos_cpf` longtext,
  `placeholder_background` varchar(20) DEFAULT NULL,
  `card_transaction` varchar(20) DEFAULT NULL,
  `back_sub_color` varchar(20) DEFAULT NULL,
  `item_sub_color` varchar(20) DEFAULT NULL,
  `text_sub_color` varchar(20) DEFAULT NULL,
  `title_sub_color` varchar(20) DEFAULT NULL,
  `botao_deposito_background_nav` varchar(20) DEFAULT NULL,
  `botao_deposito_text_nav` varchar(20) DEFAULT NULL,
  `botao_login_background_nav` varchar(20) DEFAULT NULL,
  `botao_login_text_nav` varchar(20) DEFAULT NULL,
  `botao_registro_background_nav` varchar(20) DEFAULT NULL,
  `botao_registro_text_nav` varchar(20) DEFAULT NULL,
  `botao_login_background_modal` varchar(20) DEFAULT NULL,
  `botao_login_text_modal` varchar(20) DEFAULT NULL,
  `botao_registro_background_modal` varchar(20) DEFAULT NULL,
  `botao_registro_text_modal` varchar(20) DEFAULT NULL,
  `botao_registro_border_nav` varchar(20) DEFAULT NULL,
  `botao_login_border_nav` varchar(20) DEFAULT NULL,
  `botao_deposito_border_nav` varchar(20) DEFAULT NULL,
  `invert_percentage` decimal(5,2) DEFAULT '50.00',
  `sepia_percentage` decimal(5,2) DEFAULT '5.00',
  `saturate_percentage` decimal(5,2) DEFAULT '500.00',
  `hue_rotate_deg` decimal(5,2) DEFAULT '190.00',
  `brightness_percentage` decimal(5,2) DEFAULT '100.00',
  `contrast_percentage` decimal(5,2) DEFAULT '100.00',
  `botao_deposito_text_dep` varchar(255) DEFAULT NULL,
  `botao_deposito_background_dep` varchar(255) DEFAULT NULL,
  `botao_deposito_border_dep` varchar(255) DEFAULT NULL,
  `botao_deposito_text_saq` varchar(255) DEFAULT NULL,
  `botao_deposito_background_saq` varchar(255) DEFAULT NULL,
  `botao_deposito_border_saq` varchar(255) DEFAULT NULL,
  `text_opacity` decimal(3,2) DEFAULT '1.00' COMMENT 'Opacidade do texto (0 a 1)',
  `background_color_category` varchar(20) DEFAULT NULL,
  `background_color_jackpot` varchar(20) DEFAULT NULL,
  `text_color_footer` varchar(20) DEFAULT NULL,
  `opacity_categories` varchar(20) DEFAULT NULL,
  `opacity_bottom_nav` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `custom_layouts`
--

INSERT INTO `custom_layouts` (`id`, `font_family_default`, `primary_color`, `title_color`, `text_color`, `sub_text_color`, `placeholder_color`, `background_color_cassino`, `background_base`, `background_base_dark`, `carousel_banners`, `carousel_banners_dark`, `sidebar_color`, `sidebar_color_dark`, `navtop_color`, `navtop_color_dark`, `side_menu`, `side_menu_dark`, `footer_color`, `footer_color_dark`, `border_radius`, `created_at`, `updated_at`, `instagram`, `facebook`, `telegram`, `twitter`, `whastapp`, `youtube`, `search_border_color`, `Border_bottons_and_selected`, `background_bottom_navigation`, `background_bottom_navigation_dark`, `borders_and_dividers_colors`, `search_back`, `color_bt_1`, `color_bt_2`, `color_bt_3`, `color_bt_4`, `bt_1_link`, `bt_2_link`, `bt_3_link`, `bt_4_link`, `bt_5_link`, `value_color_jackpot`, `value_wallet_navtop`, `bonus_color_dep`, `colors_deposit_value`, `color_players`, `modal_termos_register`, `modal_termos_cpf`, `placeholder_background`, `card_transaction`, `back_sub_color`, `item_sub_color`, `text_sub_color`, `title_sub_color`, `botao_deposito_background_nav`, `botao_deposito_text_nav`, `botao_login_background_nav`, `botao_login_text_nav`, `botao_registro_background_nav`, `botao_registro_text_nav`, `botao_login_background_modal`, `botao_login_text_modal`, `botao_registro_background_modal`, `botao_registro_text_modal`, `botao_registro_border_nav`, `botao_login_border_nav`, `botao_deposito_border_nav`, `invert_percentage`, `sepia_percentage`, `saturate_percentage`, `hue_rotate_deg`, `brightness_percentage`, `contrast_percentage`, `botao_deposito_text_dep`, `botao_deposito_background_dep`, `botao_deposito_border_dep`, `botao_deposito_text_saq`, `botao_deposito_background_saq`, `botao_deposito_border_saq`, `text_opacity`, `background_color_category`, `background_color_jackpot`, `text_color_footer`, `opacity_categories`, `opacity_bottom_nav`) VALUES
(1, '\'Roboto Condensed\', sans-serif', '#f7f7f7', '#ffffff', '#ffffff', '#ffffff', '#ffffff', '#252346', '#2c274e', '#2c274e', '#', '#', '#2c274e', '#2c274e', '#2b294d', '#2b294d', '#2c274e', '#3c3467', '#2c274e', '#2c274e', '1.3125rem', '2024-01-01 17:36:03', '2025-03-24 04:09:32', 'https://intagram.com', 'https://facebook.com', 'https://t.me/grupo777suporte', 'https://x.com', 'https://t.me/grupo777suporte', 'https://youtube.com', '#8870B8', '#291F40', '#2c274e', '#2c274e', '#2c274e', '#58418C', '#3E95FE', '#F45C4E', '#ca50f3', '#fbaf01', '/profile/linkconvite', '/profile/promocoes', '/profile/messages', '/profile/promocoes?tab=vip', 'https://t.me/grupo777suporte', '#2c274e', '#ffffff', '#291F40', '#ffffff', '#291F40', '<p>1. Introduction</p><p><br></p><p>1.1. Ao usar, visitar e/ou acessar qualquer parte da AGLOW e/ou qualquer subdomínio, site ou aplicativo móvel que possuímos ou operamos (o “Website”) e/ou registrar uma conta no Website, você concorda em estar vinculado a estes Termos e Condições, nossa Política de Privacidade, nossa Política de Cookies e quaisquer outras regras aplicáveis aos nossos produtos de apostas ou jogos disponíveis no Website (juntos, os \"Termos\"), e é considerado como tendo aceitado e entendido todos os Termos.</p><p><br></p><p>1.2. Você deve ler os Termos com atenção. Se não concordar com eles e/ou não puder aceitá-los, não use, visite ou acesse o Website.</p><p><br></p><p>1.3. Estes Termos podem ser alterados por nós de tempos em tempos por qualquer motivo (incluindo conformidade com a legislação aplicável ou requisitos dos reguladores). A versão atual dos Termos estará disponível no Website. Se você continuar a usar o Website após essas alterações entrarem em vigor, você será considerado como tendo aceitado tais alterações aos Termos.</p><p><br></p><p>1.4. A AGLOW é operado pela AGLOW777 N.V., uma empresa registrada sob as leis de Curaçau sob o número de registro 137692.</p><p><br></p><p>1.5. A referência a “você”, “seu”, “cliente”, “usuário” ou “jogador” significa qualquer pessoa que use o Website ou quaisquer serviços disponíveis nele e/ou qualquer cliente registrado do Website.</p><p><br></p><p>1.6. A referência a “jogos” significa Cassino, Cassino ao Vivo, Apostas Esportivas, cartas e outros jogos que possam, de tempos em tempos, tornar-se disponíveis no Website. A AGLOW777 N.V. reserva-se o direito de adicionar e remover Jogos do Website a seu critério.</p><p><br></p><p>2. Sua Conta</p><p><br></p><p>2.1. Requisitos legais</p><p><br></p><p>2.1.1. A referência à “Conta” significa uma conta registrada por você no Website após aceitar e concordar com estes Termos. Ao registrar uma Conta, você declara que tem mais de 18 anos de idade ou a maioridade legal mínima mais alta conforme estipulado na jurisdição de sua residência sob as leis aplicáveis a você. É sua responsabilidade saber se os serviços disponíveis no Website são legais no país de sua residência. Pessoas com menos de 18 anos não estão autorizadas a usar o Website e/ou quaisquer serviços disponíveis nele.</p><p><br></p><p>2.1.2. Você não está autorizado a registrar no Website e usar nossos serviços se for residente de Aruba, Austrália, Bonaire, Curaçau, França, Irã, Iraque, Países Baixos, Saba, Espanha, St Maarten, Statia, EUA ou dependências dos EUA, Reino Unido. Reservamo-nos o direito de recusar clientes de quaisquer outros países além das jurisdições acima mencionadas a nosso critério.</p><p><br></p><p>2.2. Registro de Conta</p><p><br></p><p>2.2.1. Para fazer apostas, jogar jogos e depositar dinheiro, você precisa registrar a Conta no Website.</p><p><br></p><p>2.2.2. Para registrar a Conta, você deve fornecer informações completas e atualizadas, incluindo um número de telefone móvel, endereço de e-mail, nome de usuário, senha e outras informações obrigatórias solicitadas no formulário de registro.</p><p><br></p><p>2.2.3. Ao registrar a Conta no Website, você concorda em especificar seu nome legal. Podemos tomar medidas para verificar a precisão das informações que você fornece. Você não está autorizado a alterar esses dados, mas há casos em que você pode solicitar individualmente a alteração de dados entrando em contato com o suporte ao cliente do Website, como em caso de erro honesto, etc.</p><p><br></p><p>2.2.4. Se você escolher, ou se for fornecido com um nome de usuário, senha ou qualquer outra informação como parte de nossos procedimentos de segurança, você deve tratar essas informações como confidenciais e não deve divulgá-las a terceiros. Não somos responsáveis por qualquer abuso ou uso indevido de sua Conta por terceiros devido à sua divulgação, seja intencional ou acidental, ativa ou passiva, dos detalhes de login a terceiros. Nunca solicitaremos que você revele sua senha e nunca iniciaremos contato com você para pedir os memorizadores associados à sua senha.</p><p><br></p><p>2.2.5. Funcionários, ex-funcionários de prestadores de serviços e/ou pessoas afiliadas não estão autorizados a registrar contas no Website e não podem explorar os serviços e promoções disponíveis nele. As mesmas regras se aplicam aos membros da família dos acima mencionados. A violação desta regra resultará no fechamento permanente da conta e as contas referidas serão consideradas fraudulentas. Qualquer ganho derivado de tais atividades será considerado como perdido pelo titular da conta e apenas o valor depositado será devolvido ao titular da conta.</p><p><br></p><p>2.2.6. Você não pode transferir, vender ou penhorar Sua Conta para outra pessoa. Esta proibição inclui a transferência de quaisquer ativos de valor de qualquer tipo, incluindo, mas não se limitando a, propriedade de contas, ganhos, depósitos, apostas, direitos e/ou reivindicações relacionadas a esses ativos, legais, comerciais ou de qualquer outra forma. A proibição de tais transferências também inclui, mas não se limita a, ônus, penhor, cessão, usufruto, comercialização, corretagem, hipoteca e/ou doação em cooperação com um fiduciário ou qualquer outro terceiro, empresa, pessoa natural ou jurídica, fundação e/ou associação de qualquer forma.</p><p><br></p><p>2.3. Problemas com a Conta</p><p><br></p><p>2.3.1. Se você esquecer sua senha ou achar que alguém conhece detalhes de seus dados pessoais, além de suspeitar que outro usuário está se beneficiando injustamente por meio de trapaça ou conluio, você deve relatar a suspeita para nós.</p><p><br></p><p>2.3.2. Reservamo-nos o direito de declarar qualquer aposta ou transação nula total ou parcialmente se, a nosso critério, considerarmos óbvio que qualquer uma das seguintes circunstâncias tenha ocorrido:</p><p><br></p><p>o titular da Conta ou pessoas associadas ao titular da Conta podem influenciar direta ou indiretamente o resultado de um evento;</p><p><br></p><p>o titular da Conta e/ou pessoas associadas ao titular da Conta estão direta ou indiretamente evitando as regras do Website;</p><p><br></p><p>o resultado de um evento ou a aposta foi direta ou indiretamente afetado por atividade criminosa;</p><p><br></p><p>as odds de um evento foram significativamente alteradas devido a um anúncio público relacionado ao evento;</p><p><br></p><p>apostas foram feitas que não teriam sido aceitas de outra forma, mas foram aceitas durante períodos em que o Website foi afetado por problemas técnicos;</p><p><br></p><p>devido a um erro, como um engano, erro de impressão, erro técnico, erro humano, força maior ou outro, apostas foram oferecidas, feitas e/ou aceitas devido a esse erro.</p><p><br></p><p>2.3.3. Quando fecharmos ou suspendermos uma Conta por qualquer motivo, reservamo-nos o direito de fechar quaisquer futuras Contas que possam ser registradas pela mesma pessoa, dispositivo, endereço ou que possam usar as mesmas carteiras de pagamento ou cartões de crédito e anular/cancelar todas as apostas e transações dessas Contas.</p><p><br></p><p>2.3.4. Oferecemos autenticação de dois fatores (2FA) como proteção adicional contra o uso não autorizado de sua Conta. Você é responsável por manter suas informações de login confidenciais e garantir que não possam ser acessadas por outra pessoa.</p><p><br></p><p>2.4. Ao registrar a Conta no Website, você se compromete, declara e garante que:</p><p><br></p><p>2.4.1. Você tem mais de 18 anos ou a maioridade legal mínima estipulada nas leis da jurisdição aplicável a você e, sob as leis aplicáveis a você, é permitido participar dos Jogos oferecidos no Website.</p><p><br></p><p>2.4.2. Você usará este Website e sua Conta única e exclusivamente para a participação genuína nos Jogos e não para quaisquer operações financeiras ou outras; sua participação nos Jogos será estritamente em sua capacidade pessoal não profissional, apenas para fins recreativos e de entretenimento.</p><p><br></p><p>2.4.3. Você participa dos Jogos em seu próprio nome e não em nome de outra pessoa;</p><p><br></p><p>2.4.4. Você não é residente em Curaçau, França, Irã, Iraque, Países Baixos, Coreia do Norte, Singapura, Espanha, St Maarten, Statia, EUA ou dependências dos EUA, Ucrânia, Reino Unido.</p><p><br></p><p>2.4.5. Todas as informações que você fornecer à SLOTAGLOW777 N.V. são verdadeiras, completas e corretas, e que você deverá nos notificar imediatamente sobre qualquer alteração dessas informações.</p><p><br></p><p>2.4.6. Você é o único responsável por relatar e contabilizar quaisquer impostos aplicáveis a você de acordo com as leis relevantes para quaisquer ganhos que você receba da SLOTAGLOW777 N.V.</p><p><br></p><p>2.4.7. Todo o dinheiro que você deposita em sua Conta não está contaminado com qualquer ilegalidade e, em particular, não origina de qualquer atividade ou fonte ilegal.</p><p><br></p><p>2.4.8. Você entende que, ao participar dos Jogos, você assume o risco de perder o dinheiro depositado em sua Conta.</p><p><br></p><p>2.4.9. Você não deve se envolver em qualquer atividade fraudulenta, colusiva, manipulação ou outra atividade ilegal em relação à sua participação ou à participação de terceiros em qualquer um dos Jogos e não deve usar métodos ou técnicas assistidas por software ou dispositivos de hardware para sua participação em qualquer um dos Jogos. A SLOTAGLOW777 N.V. reserva-se o direito de invalidar ou fechar sua Conta ou invalidar sua participação em um Jogo em caso de tal comportamento.</p><p><br></p><p>2.4.10. Em relação a depósitos e retiradas de fundos, você fornecerá um método de pagamento válido e autorizado em seu nome e que não usará qualquer método de pagamento que não seja de sua própria propriedade. A SLOTAGLOW777 N.V. reserva-se o direito de verificar o método de pagamento e/ou o endereço de e-mail fornecido e de exigir documentos para tal verificação. Além disso, a SLOTAGLOW777 N.V. pode solicitar que você forneça uma identificação válida para verificar sua identidade, se necessário, de acordo com as leis aplicáveis à prevenção de crimes financeiros, lavagem de dinheiro e financiamento do terrorismo.</p><p><br></p><p>3. Depósitos e Retiradas</p><p><br></p><p>3.1. Depósitos</p><p><br></p><p>3.1.1. Quando você faz um depósito em sua Conta, você está confirmando que você é o proprietário dos fundos depositados e que os fundos não são de qualquer fonte ilegal.</p><p><br></p><p>3.1.2. O montante mínimo e máximo que pode ser depositado em sua Conta depende da moeda e do método de depósito utilizado. A SLOTAGLOW777 N.V. pode alterar esses limites a qualquer momento e sem aviso prévio. Se você não tiver certeza sobre os limites, por favor, entre em contato com nosso suporte ao cliente.</p><p><br></p><p>3.1.3. Ao fazer um depósito, você deve garantir que o método de pagamento usado está em seu nome. Qualquer depósito feito através de um método de pagamento que não esteja em seu nome pode ser recusado e retornado.</p><p><br></p><p>3.1.4. Todos os depósitos são processados de acordo com nossos procedimentos e podem levar algum tempo para serem creditados na sua Conta.</p><p><br></p><p>3.2. Retiradas</p><p><br></p><p>3.2.1. Para retirar fundos de sua Conta, você deve solicitar uma retirada através da área de gerenciamento de conta no Website.</p><p><br></p><p>3.2.2. O montante mínimo e máximo que pode ser retirado depende da moeda e do método de retirada utilizado. A AGLOW777 N.V. pode alterar esses limites a qualquer momento e sem aviso prévio. Se você não tiver certeza sobre os limites, por favor, entre em contato com nosso suporte ao cliente.</p><p><br></p><p>3.2.3. Todas as retiradas estão sujeitas a verificação de identidade e podem estar sujeitas a verificações adicionais de segurança. A AGLOW777&nbsp; N.V. pode solicitar documentos adicionais para verificar sua identidade e a origem dos fundos.</p><p><br></p><p>3.2.4. A AGLOW777 N.V. reserva-se o direito de cobrar uma taxa de processamento para retiradas, dependendo do método de retirada e dos valores envolvidos. As taxas aplicáveis serão informadas a você antes de concluir a transação de retirada.</p><p><br></p><p>3.2.5. O tempo necessário para processar uma retirada pode variar dependendo do método de retirada escolhido. Em geral, tentaremos processar todas as retiradas o mais rápido possível.</p><p><br></p><p>4. Uso Responsável</p><p><br></p><p>4.1. Jogar deve ser uma forma de entretenimento e não uma maneira de ganhar dinheiro. Você deve se certificar de que você está jogando de maneira responsável e não gastando mais do que você pode perder.</p><p><br></p><p>4.2. Se você acha que pode ter um problema com o jogo, há ferramentas e recursos disponíveis para ajudar. Recomendamos que você utilize as opções de autoexclusão e limites de depósito disponíveis no Website.</p><p><br></p><p>4.3. Se você deseja se autoexcluir, entre em contato com nosso suporte ao cliente para obter assistência na configuração da autoexclusão.</p><p><br></p><p>5. Encerramento e Suspensão de Conta</p><p><br></p><p>5.1. A AGLOW777 N.V. reserva-se o direito de suspender ou encerrar sua Conta a qualquer momento, a seu exclusivo critério, e sem aviso prévio, se acreditarmos que você violou estes Termos ou se tivermos qualquer outra razão para acreditar que você pode ter se envolvido em atividade fraudulenta, ilegal ou não autorizada.</p><p><br></p><p>5.2. Se sua Conta for encerrada ou suspensa, qualquer saldo remanescente em sua Conta pode ser devolvido a você, menos quaisquer taxas ou encargos aplicáveis, e qualquer saldo remanescente poderá ser perdido a critério da AGLOW777 N.V.</p><p><br></p><p>6.15. O valor máximo diário de ganhos para um Cliente não pode exceder 100.000 Euros ou o equivalente na moeda da sua Conta. O “dia” significa o período entre 00:00 GMT e 23:59 GMT.</p><p><br></p><p>7. Fechamento da Conta</p><p><br></p><p>7.1. Você pode fechar sua Conta a qualquer momento e solicitar a retirada do saldo da Conta, sujeito à dedução das taxas de retirada relevantes. Para fechar sua Conta, você deve primeiro cancelar quaisquer apostas em aberto, se aplicável, e entrar em contato com o suporte ao cliente do Website. O fechamento efetivo da Conta corresponderá à rescisão da SLOTAGLOW777 N.V.. Se o motivo do fechamento da Conta estiver relacionado a preocupações sobre possível adição ao jogo, você deve informar a SLOTAGLOW777 N.V..</p><p><br></p><p>7.2. O método de reembolso será a nosso critério absoluto.</p><p><br></p><p>7.3. A AGLOW777 N.V. reserva-se o direito de fechar sua Conta e reembolsar o saldo “Disponível para retirada”, sujeito à dedução das taxas de retirada relevantes, a critério absoluto da SLOTAGLOW777 N.V. e sem qualquer obrigação de fornecer um motivo ou aviso prévio.</p><p><br></p><p>7.4. A AGLOW777 N.V. reserva-se o direito de cancelar e remover qualquer valor de bônus concedido a você se não for utilizado dentro de 1 mês a partir da data em que foi concedido.</p><p><br></p><p>7.5. A AGLOW777 N.V. reserva-se o direito de recusar uma reivindicação de retirada em caso de fraude, momento em que uma Conta será suspensa e o pagamento não será processado.</p><p><br></p><p>7.6. A AGLOW777 N.V. revisará todas as Contas de jogadores e as classificará a seu critério. Uma vez que um jogador seja classificado como “caçador de bônus” ou “abusador de bônus”, todos os ganhos e bônus serão anulados e a Conta será suspensa e o pagamento não será processado.</p><p><br></p><p>8. Informações Pessoais</p><p><br></p><p>8.1. Cumpriremos as leis de proteção de dados aplicáveis em relação às informações pessoais que você nos fornecer. Suas informações pessoais são processadas de acordo com nossa Política de Privacidade, cuja cópia está disponível clicando aqui.</p><p><br></p><p>9. Jogos Interrompidos e Abortados</p><p><br></p><p>9.1. Atividade Criminosa: Caso seja notada qualquer irregularidade (incluindo suspeita de tentativa de lavagem de dinheiro ou fraude), a AGLOW777 N.V. reserva-se o direito de fechar Contas e/ou relatar atividades criminosas ou suspeitas às autoridades regulatórias ou de aplicação da lei relevantes. Todos os saldos das Contas dos infratores serão bloqueados, retiradas serão anuladas e depósitos e ganhos serão perdidos.</p><p><br></p><p>9.2. Colusão e trapaça: A AGLOW777 N.V. tem o direito de desativar Contas de usuários e confiscar os saldos das Contas (incluindo depósitos e ganhos) se detectar tentativa de obter vantagem por meio da troca de informações sobre suas cartas ou estabelecer um acordo colusivo com outros usuários para obter uma vantagem injusta. Essas vantagens podem consistir em despejo de fichas e transferências, discussão de uma mão durante o jogo, uso múltiplo de uma única Conta, jogo suave. A AGLOW777 N.V. realiza uma rigorosa análise do jogo por meios manuais e automatizados e investiga todas as reclamações relacionadas de usuários. Além disso, a AGLOW777 N.V. realiza análises proativas e aleatórias de jogadas e Contas.</p><p><br></p><p>9.3. Atividade Fraudulenta: Quando a AGLOW777 N.V. detectar atividade fraudulenta, ilegal, desonesta ou imprópria (incluindo o uso de VPN, proxy ou serviço semelhante que mascara ou manipula a identificação de sua localização real, ou fazer apostas, apostas ou jogo de poker por meio de um terceiro ou em nome de um terceiro) no Website, temos o direito de bloquear a Conta do usuário e confiscar todos os saldos da Conta sem notificação prévia. Nesses casos, a SLOTAGLOW777 N.V. reserva-se o direito de relatar a atividade fraudulenta às autoridades regulatórias e de aplicação da lei, incluindo, mas não se limitando a, bancos, empresas de cartões de crédito e/ou qualquer pessoa ou entidade que tenha o direito legal a tais informações, e/ou tomar medidas legais contra o usuário.</p><p><br></p><p>10. Chat ao Vivo</p><p><br></p><p>10.1. Como parte do uso do Website, a AGLOW777 N.V. pode fornecer a você uma funcionalidade de chat, que é moderada por nós e sujeita a controles. Reservamo-nos o direito de revisar o chat e manter um registro de todas as declarações feitas nessa funcionalidade. Seu uso da funcionalidade de chat deve ser para fins recreativos e de socialização, e está sujeito às seguintes regras.</p><p><br></p><p>10.2. Você não deve fazer declarações sexualmente explícitas ou extremamente ofensivas, incluindo expressões de preconceito, racismo, ódio ou profanidade.</p><p><br></p><p>10.3. Você não deve fazer declarações abusivas, difamatórias ou que assediam ou insultam o Website ou a AGLOW777 N.V..</p><p><br></p><p>10.4. Você não deve fazer declarações que anunciem, promovam ou se relacionem com outras entidades online.</p><p><br></p><p>10.5. Você não deve fazer declarações sobre a AGLOW777 N.V., o Website ou quaisquer outros sites da Internet conectados à AGLOW777 N.V. que sejam falsas e/ou maliciosas e/ou prejudiciais à AGLOW777 N.V..</p><p><br></p><p>10.6. Você não deve fazer colusão através dos chats ou chats separados. Qualquer chat suspeito será relatado à autoridade regulatória ou de aplicação da lei relevante.</p><p><br></p><p>10.7. No caso de você violar qualquer uma das disposições acima relacionadas à funcionalidade de chat, a AGLOW777 N.V. terá o direito de remover o chat room ou encerrar imediatamente sua Conta. Após tal rescisão, a AGLOW777 N.V. reembolsará quaisquer fundos que possam estar em sua Conta, além de qualquer valor que possa ser devido a nós naquele momento (se houver).</p><p><br></p><p>11. Jogos Interrompidos e Abortados</p><p><br></p><p>11.1. A AGLOW777 N.V. não é responsável por qualquer inatividade, interrupções do servidor, atraso ou qualquer perturbação técnica ou política ao jogo. Reembolsos podem ser concedidos apenas a critério da AGLOW777 N.V..</p><p><br></p><p>11.2. A SLOTAGLOW777 N.V. não aceita qualquer responsabilidade por danos ou perdas que sejam considerados ou alegados como resultantes de ou em conexão com o Website ou seu conteúdo, incluindo, sem limitação, atrasos ou interrupções na operação ou transmissão, perda ou corrupção de dados, falha na comunicação ou linhas, uso indevido do Website ou seu conteúdo por qualquer pessoa ou erros ou omissões no conteúdo.</p><p><br></p><p>11.3. No caso de um mau funcionamento do sistema do cassino, todas as apostas são nulas.</p><p><br></p><p>11.4. No caso de um Jogo ser iniciado mas abortado devido a uma falha no sistema, a SLOTAGLOW777 N.V. reembolsará o valor apostado no Jogo, creditando-o em sua Conta ou, se a Conta não existir mais, pagando-o de uma forma aprovada; e se você tiver um crédito acumulado no momento em que o Jogo foi abortado, creditará em sua Conta o valor monetário do crédito ou, se a Conta não existir mais, pagará a você de uma forma aprovada.</p><p><br></p><p>12. Deveres</p><p><br></p><p>12.1. A AGLOW777 N.V. reserva-se o direito de ceder ou transferir legalmente seus direitos e obrigações sob os Termos. Você não deve ceder ou transferir seus direitos e obrigações sob estes Termos.</p><p><br></p><p>13. Reclamações</p><p><br></p><p>13.1. Se você tiver uma reclamação, pode enviar um e-mail para o suporte ao cliente do Website em AGLOW777@gmail.com.</p><p><br></p><p>13.2. A AGLOW777 N.V. usará seus melhores esforços para resolver a questão relatada prontamente.</p><p><br></p><p>13.3. Se você tiver uma dúvida sobre qualquer transação, pode entrar em contato com a AGLOW777 N.V. em AGLOW777 @gmail.com com detalhes da dúvida. Revisaremos qualquer transação questionada ou disputada. Nosso julgamento é final.</p><p><br></p><p>14. Acordo e Admissibilidade</p><p><br></p><p>14.1. Estes Termos, a Política de Privacidade, a Política de Cookies e qualquer documento a eles expressamente mencionado e quaisquer diretrizes ou regras postadas no Website constituem o acordo e entendimento completo entre você e a AGLOW777 N.V. com respeito a este Website e, salvo em caso de fraude, substituem todas as comunicações e propostas anteriores ou contemporâneas, sejam eletrônicas, orais ou escritas, entre você e a AGLOW777 N.V. com respeito a este Website.</p><p><br></p><p>14.2. Uma versão impressa destes Termos e de qualquer aviso dado em forma eletrônica será admissível em procedimentos judiciais ou administrativos baseados ou relacionados a estes Termos com o mesmo efeito e sujeita às mesmas condições que outros documentos e registros comerciais gerados e mantidos originalmente em forma impressa.</p><p><br></p><p>14.3. Você deve fornecer um endereço válido de e-mail e outras informações de contato ao criar uma Conta. Você deve manter essas informações atualizadas.</p><p><br></p><p>15. Alterações e Atualizações</p><p><br></p><p>15.1. A AGLOW777 N.V. reserva-se o direito de alterar ou atualizar estes Termos a qualquer momento e sem aviso prévio. As alterações entram em vigor no momento da publicação no Website.</p><p><br></p><p>15.2. Você é responsável por revisar regularmente os Termos para estar ciente de quaisquer alterações. Seu uso contínuo do Website após a publicação das alterações será considerado uma aceitação dessas alterações.</p><p><br></p><p>16. Limitação de Responsabilidade</p><p><br></p><p>16.1. A AGLOW777 N.V. não será responsável por quaisquer danos indiretos, consequenciais ou especiais, ou por quaisquer perdas de lucros, dados ou oportunidades de negócios, mesmo que tenhamos sido avisados da possibilidade de tais danos.</p><p><br></p><p>16.2. Nenhuma disposição destes Termos exclui ou limita nossa responsabilidade por morte ou lesão pessoal resultante de negligência ou qualquer outra responsabilidade que não possa ser excluída ou limitada por lei.</p><p><br></p><p>17. Disposições Específicas de Apostas</p><p><br></p><p>17.1. As apostas são aceitas e os resultados são calculados de acordo com as regras especificadas para cada mercado específico. A AGLOW777 N.V. reserva-se o direito de modificar essas regras e de cancelar apostas em mercados onde as regras especificadas não possam ser aplicadas corretamente.</p><p><br></p><p>17.2. Se um evento for cancelado, adiado ou suspendido, a AGLOW777 N.V. reserva-se o direito de determinar a política de reembolso apropriada, que pode variar dependendo do tipo de evento e das circunstâncias.</p><p><br></p><p>17.3. A AGLOW777&nbsp; N.V. pode definir regras específicas para cada mercado de apostas, e todas as apostas serão processadas de acordo com essas regras. É sua responsabilidade ler e entender as regras antes de fazer uma aposta.</p><p><br></p><p>17.4. Se houver uma disputa sobre o resultado de um evento, a AGLOW777 N.V. pode considerar o resultado oficial divulgado pelas autoridades competentes ou organizações relevantes. Qualquer alteração no resultado após a decisão oficial não será considerada para fins de apostas.</p><p><br></p><p>17.5. A AGLOW777 N.V. reserva-se o direito de encerrar ou suspender mercados e apostas em caso de erros técnicos, problemas com os resultados ou outras circunstâncias imprevistas.</p><p><br></p><p>17.6. A AGLOW777 N.V. pode, a seu critério, limitar o montante de apostas e ganhos por evento ou mercado para garantir a integridade e a justiça das apostas.</p><p><br></p><p>17.7. Se houver uma modificação nas regras de um evento ou mercado, a AGLOW777 N.V. pode atualizar as regras e notificar os clientes sobre tais alterações.</p><p><br></p><p>17.8. A decisão de um mercado é feita assim que for determinada. A AGLOW777 N.V. reserva-se o direito de definir os resultados dos jogos caso um mercado não seja determinado anteriormente na partida. Esta regra aplica-se à duração normal da partida e se não houver condições especificadas na descrição do mercado no Website.</p><p><br></p><p>17.9. Se houver uma disputa sobre o resultado de um evento, a AGLOW777 N.V. pode considerar o resultado oficial divulgado pelas autoridades competentes, organizações esportivas ou ligas relevantes. Qualquer alteração no resultado após a decisão oficial não será considerada para fins de apostas.</p><p><br></p><p>17.10. Se um evento for cancelado, adiado ou suspendido, todas as apostas poderão ser anuladas ou mantidas, dependendo das regras específicas do evento e das decisões tomadas pela AGLOW777 N.V. De maneira geral, apostas em eventos cancelados serão reembolsadas.</p><p><br></p><p>17.11. A AGLOW777 N.V. pode, a seu critério, ajustar os mercados de apostas e reembolsar ou manter apostas conforme as regras e circunstâncias do evento.</p>', 'olaaa', '#413363', '#58418C', '#291F40', '#2c274e', '#ffffff', '#ffffff', '#DABD01', '#ffffff', '#DABD01', '#ffffff', '#', '#ffffff', '#DABD01', '#ffffff', '#DABD01', '#ffffff', '#DABD01', '#', '#', 20.00, 20.00, 20.00, 20.00, 20.00, 20.00, '#ffffff', '#DABD01', '#DABD01', '#ffffff', '#DABD01', '#DABD01', 0.50, '#2b294d', '#2c274e', '0.5', '0.5', '0.5');
INSERT INTO `custom_layouts` (`id`, `font_family_default`, `primary_color`, `title_color`, `text_color`, `sub_text_color`, `placeholder_color`, `background_color_cassino`, `background_base`, `background_base_dark`, `carousel_banners`, `carousel_banners_dark`, `sidebar_color`, `sidebar_color_dark`, `navtop_color`, `navtop_color_dark`, `side_menu`, `side_menu_dark`, `footer_color`, `footer_color_dark`, `border_radius`, `created_at`, `updated_at`, `instagram`, `facebook`, `telegram`, `twitter`, `whastapp`, `youtube`, `search_border_color`, `Border_bottons_and_selected`, `background_bottom_navigation`, `background_bottom_navigation_dark`, `borders_and_dividers_colors`, `search_back`, `color_bt_1`, `color_bt_2`, `color_bt_3`, `color_bt_4`, `bt_1_link`, `bt_2_link`, `bt_3_link`, `bt_4_link`, `bt_5_link`, `value_color_jackpot`, `value_wallet_navtop`, `bonus_color_dep`, `colors_deposit_value`, `color_players`, `modal_termos_register`, `modal_termos_cpf`, `placeholder_background`, `card_transaction`, `back_sub_color`, `item_sub_color`, `text_sub_color`, `title_sub_color`, `botao_deposito_background_nav`, `botao_deposito_text_nav`, `botao_login_background_nav`, `botao_login_text_nav`, `botao_registro_background_nav`, `botao_registro_text_nav`, `botao_login_background_modal`, `botao_login_text_modal`, `botao_registro_background_modal`, `botao_registro_text_modal`, `botao_registro_border_nav`, `botao_login_border_nav`, `botao_deposito_border_nav`, `invert_percentage`, `sepia_percentage`, `saturate_percentage`, `hue_rotate_deg`, `brightness_percentage`, `contrast_percentage`, `botao_deposito_text_dep`, `botao_deposito_background_dep`, `botao_deposito_border_dep`, `botao_deposito_text_saq`, `botao_deposito_background_saq`, `botao_deposito_border_saq`, `text_opacity`, `background_color_category`, `background_color_jackpot`, `text_color_footer`, `opacity_categories`, `opacity_bottom_nav`) VALUES
(1, '\'Roboto Condensed\', sans-serif', '#f7f7f7', '#ffffff', '#ffffff', '#ffffff', '#ffffff', '#252346', '#2c274e', '#2c274e', '#', '#', '#2c274e', '#2c274e', '#2b294d', '#2b294d', '#2c274e', '#3c3467', '#2c274e', '#2c274e', '1.3125rem', '2024-01-01 17:36:03', '2025-03-24 04:09:32', 'https://intagram.com', 'https://facebook.com', 'https://t.me/grupo777suporte', 'https://x.com', 'https://t.me/grupo777suporte', 'https://youtube.com', '#8870B8', '#291F40', '#2c274e', '#2c274e', '#2c274e', '#58418C', '#3E95FE', '#F45C4E', '#ca50f3', '#fbaf01', '/profile/linkconvite', '/profile/promocoes', '/profile/messages', '/profile/promocoes?tab=vip', 'https://t.me/grupo777suporte', '#2c274e', '#ffffff', '#291F40', '#ffffff', '#291F40', '<p>1. Introduction</p><p><br></p><p>1.1. Ao usar, visitar e/ou acessar qualquer parte da AGLOW e/ou qualquer subdomínio, site ou aplicativo móvel que possuímos ou operamos (o “Website”) e/ou registrar uma conta no Website, você concorda em estar vinculado a estes Termos e Condições, nossa Política de Privacidade, nossa Política de Cookies e quaisquer outras regras aplicáveis aos nossos produtos de apostas ou jogos disponíveis no Website (juntos, os \"Termos\"), e é considerado como tendo aceitado e entendido todos os Termos.</p><p><br></p><p>1.2. Você deve ler os Termos com atenção. Se não concordar com eles e/ou não puder aceitá-los, não use, visite ou acesse o Website.</p><p><br></p><p>1.3. Estes Termos podem ser alterados por nós de tempos em tempos por qualquer motivo (incluindo conformidade com a legislação aplicável ou requisitos dos reguladores). A versão atual dos Termos estará disponível no Website. Se você continuar a usar o Website após essas alterações entrarem em vigor, você será considerado como tendo aceitado tais alterações aos Termos.</p><p><br></p><p>1.4. A AGLOW é operado pela AGLOW777 N.V., uma empresa registrada sob as leis de Curaçau sob o número de registro 137692.</p><p><br></p><p>1.5. A referência a “você”, “seu”, “cliente”, “usuário” ou “jogador” significa qualquer pessoa que use o Website ou quaisquer serviços disponíveis nele e/ou qualquer cliente registrado do Website.</p><p><br></p><p>1.6. A referência a “jogos” significa Cassino, Cassino ao Vivo, Apostas Esportivas, cartas e outros jogos que possam, de tempos em tempos, tornar-se disponíveis no Website. A AGLOW777 N.V. reserva-se o direito de adicionar e remover Jogos do Website a seu critério.</p><p><br></p><p>2. Sua Conta</p><p><br></p><p>2.1. Requisitos legais</p><p><br></p><p>2.1.1. A referência à “Conta” significa uma conta registrada por você no Website após aceitar e concordar com estes Termos. Ao registrar uma Conta, você declara que tem mais de 18 anos de idade ou a maioridade legal mínima mais alta conforme estipulado na jurisdição de sua residência sob as leis aplicáveis a você. É sua responsabilidade saber se os serviços disponíveis no Website são legais no país de sua residência. Pessoas com menos de 18 anos não estão autorizadas a usar o Website e/ou quaisquer serviços disponíveis nele.</p><p><br></p><p>2.1.2. Você não está autorizado a registrar no Website e usar nossos serviços se for residente de Aruba, Austrália, Bonaire, Curaçau, França, Irã, Iraque, Países Baixos, Saba, Espanha, St Maarten, Statia, EUA ou dependências dos EUA, Reino Unido. Reservamo-nos o direito de recusar clientes de quaisquer outros países além das jurisdições acima mencionadas a nosso critério.</p><p><br></p><p>2.2. Registro de Conta</p><p><br></p><p>2.2.1. Para fazer apostas, jogar jogos e depositar dinheiro, você precisa registrar a Conta no Website.</p><p><br></p><p>2.2.2. Para registrar a Conta, você deve fornecer informações completas e atualizadas, incluindo um número de telefone móvel, endereço de e-mail, nome de usuário, senha e outras informações obrigatórias solicitadas no formulário de registro.</p><p><br></p><p>2.2.3. Ao registrar a Conta no Website, você concorda em especificar seu nome legal. Podemos tomar medidas para verificar a precisão das informações que você fornece. Você não está autorizado a alterar esses dados, mas há casos em que você pode solicitar individualmente a alteração de dados entrando em contato com o suporte ao cliente do Website, como em caso de erro honesto, etc.</p><p><br></p><p>2.2.4. Se você escolher, ou se for fornecido com um nome de usuário, senha ou qualquer outra informação como parte de nossos procedimentos de segurança, você deve tratar essas informações como confidenciais e não deve divulgá-las a terceiros. Não somos responsáveis por qualquer abuso ou uso indevido de sua Conta por terceiros devido à sua divulgação, seja intencional ou acidental, ativa ou passiva, dos detalhes de login a terceiros. Nunca solicitaremos que você revele sua senha e nunca iniciaremos contato com você para pedir os memorizadores associados à sua senha.</p><p><br></p><p>2.2.5. Funcionários, ex-funcionários de prestadores de serviços e/ou pessoas afiliadas não estão autorizados a registrar contas no Website e não podem explorar os serviços e promoções disponíveis nele. As mesmas regras se aplicam aos membros da família dos acima mencionados. A violação desta regra resultará no fechamento permanente da conta e as contas referidas serão consideradas fraudulentas. Qualquer ganho derivado de tais atividades será considerado como perdido pelo titular da conta e apenas o valor depositado será devolvido ao titular da conta.</p><p><br></p><p>2.2.6. Você não pode transferir, vender ou penhorar Sua Conta para outra pessoa. Esta proibição inclui a transferência de quaisquer ativos de valor de qualquer tipo, incluindo, mas não se limitando a, propriedade de contas, ganhos, depósitos, apostas, direitos e/ou reivindicações relacionadas a esses ativos, legais, comerciais ou de qualquer outra forma. A proibição de tais transferências também inclui, mas não se limita a, ônus, penhor, cessão, usufruto, comercialização, corretagem, hipoteca e/ou doação em cooperação com um fiduciário ou qualquer outro terceiro, empresa, pessoa natural ou jurídica, fundação e/ou associação de qualquer forma.</p><p><br></p><p>2.3. Problemas com a Conta</p><p><br></p><p>2.3.1. Se você esquecer sua senha ou achar que alguém conhece detalhes de seus dados pessoais, além de suspeitar que outro usuário está se beneficiando injustamente por meio de trapaça ou conluio, você deve relatar a suspeita para nós.</p><p><br></p><p>2.3.2. Reservamo-nos o direito de declarar qualquer aposta ou transação nula total ou parcialmente se, a nosso critério, considerarmos óbvio que qualquer uma das seguintes circunstâncias tenha ocorrido:</p><p><br></p><p>o titular da Conta ou pessoas associadas ao titular da Conta podem influenciar direta ou indiretamente o resultado de um evento;</p><p><br></p><p>o titular da Conta e/ou pessoas associadas ao titular da Conta estão direta ou indiretamente evitando as regras do Website;</p><p><br></p><p>o resultado de um evento ou a aposta foi direta ou indiretamente afetado por atividade criminosa;</p><p><br></p><p>as odds de um evento foram significativamente alteradas devido a um anúncio público relacionado ao evento;</p><p><br></p><p>apostas foram feitas que não teriam sido aceitas de outra forma, mas foram aceitas durante períodos em que o Website foi afetado por problemas técnicos;</p><p><br></p><p>devido a um erro, como um engano, erro de impressão, erro técnico, erro humano, força maior ou outro, apostas foram oferecidas, feitas e/ou aceitas devido a esse erro.</p><p><br></p><p>2.3.3. Quando fecharmos ou suspendermos uma Conta por qualquer motivo, reservamo-nos o direito de fechar quaisquer futuras Contas que possam ser registradas pela mesma pessoa, dispositivo, endereço ou que possam usar as mesmas carteiras de pagamento ou cartões de crédito e anular/cancelar todas as apostas e transações dessas Contas.</p><p><br></p><p>2.3.4. Oferecemos autenticação de dois fatores (2FA) como proteção adicional contra o uso não autorizado de sua Conta. Você é responsável por manter suas informações de login confidenciais e garantir que não possam ser acessadas por outra pessoa.</p><p><br></p><p>2.4. Ao registrar a Conta no Website, você se compromete, declara e garante que:</p><p><br></p><p>2.4.1. Você tem mais de 18 anos ou a maioridade legal mínima estipulada nas leis da jurisdição aplicável a você e, sob as leis aplicáveis a você, é permitido participar dos Jogos oferecidos no Website.</p><p><br></p><p>2.4.2. Você usará este Website e sua Conta única e exclusivamente para a participação genuína nos Jogos e não para quaisquer operações financeiras ou outras; sua participação nos Jogos será estritamente em sua capacidade pessoal não profissional, apenas para fins recreativos e de entretenimento.</p><p><br></p><p>2.4.3. Você participa dos Jogos em seu próprio nome e não em nome de outra pessoa;</p><p><br></p><p>2.4.4. Você não é residente em Curaçau, França, Irã, Iraque, Países Baixos, Coreia do Norte, Singapura, Espanha, St Maarten, Statia, EUA ou dependências dos EUA, Ucrânia, Reino Unido.</p><p><br></p><p>2.4.5. Todas as informações que você fornecer à SLOTAGLOW777 N.V. são verdadeiras, completas e corretas, e que você deverá nos notificar imediatamente sobre qualquer alteração dessas informações.</p><p><br></p><p>2.4.6. Você é o único responsável por relatar e contabilizar quaisquer impostos aplicáveis a você de acordo com as leis relevantes para quaisquer ganhos que você receba da SLOTAGLOW777 N.V.</p><p><br></p><p>2.4.7. Todo o dinheiro que você deposita em sua Conta não está contaminado com qualquer ilegalidade e, em particular, não origina de qualquer atividade ou fonte ilegal.</p><p><br></p><p>2.4.8. Você entende que, ao participar dos Jogos, você assume o risco de perder o dinheiro depositado em sua Conta.</p><p><br></p><p>2.4.9. Você não deve se envolver em qualquer atividade fraudulenta, colusiva, manipulação ou outra atividade ilegal em relação à sua participação ou à participação de terceiros em qualquer um dos Jogos e não deve usar métodos ou técnicas assistidas por software ou dispositivos de hardware para sua participação em qualquer um dos Jogos. A SLOTAGLOW777 N.V. reserva-se o direito de invalidar ou fechar sua Conta ou invalidar sua participação em um Jogo em caso de tal comportamento.</p><p><br></p><p>2.4.10. Em relação a depósitos e retiradas de fundos, você fornecerá um método de pagamento válido e autorizado em seu nome e que não usará qualquer método de pagamento que não seja de sua própria propriedade. A SLOTAGLOW777 N.V. reserva-se o direito de verificar o método de pagamento e/ou o endereço de e-mail fornecido e de exigir documentos para tal verificação. Além disso, a SLOTAGLOW777 N.V. pode solicitar que você forneça uma identificação válida para verificar sua identidade, se necessário, de acordo com as leis aplicáveis à prevenção de crimes financeiros, lavagem de dinheiro e financiamento do terrorismo.</p><p><br></p><p>3. Depósitos e Retiradas</p><p><br></p><p>3.1. Depósitos</p><p><br></p><p>3.1.1. Quando você faz um depósito em sua Conta, você está confirmando que você é o proprietário dos fundos depositados e que os fundos não são de qualquer fonte ilegal.</p><p><br></p><p>3.1.2. O montante mínimo e máximo que pode ser depositado em sua Conta depende da moeda e do método de depósito utilizado. A SLOTAGLOW777 N.V. pode alterar esses limites a qualquer momento e sem aviso prévio. Se você não tiver certeza sobre os limites, por favor, entre em contato com nosso suporte ao cliente.</p><p><br></p><p>3.1.3. Ao fazer um depósito, você deve garantir que o método de pagamento usado está em seu nome. Qualquer depósito feito através de um método de pagamento que não esteja em seu nome pode ser recusado e retornado.</p><p><br></p><p>3.1.4. Todos os depósitos são processados de acordo com nossos procedimentos e podem levar algum tempo para serem creditados na sua Conta.</p><p><br></p><p>3.2. Retiradas</p><p><br></p><p>3.2.1. Para retirar fundos de sua Conta, você deve solicitar uma retirada através da área de gerenciamento de conta no Website.</p><p><br></p><p>3.2.2. O montante mínimo e máximo que pode ser retirado depende da moeda e do método de retirada utilizado. A AGLOW777 N.V. pode alterar esses limites a qualquer momento e sem aviso prévio. Se você não tiver certeza sobre os limites, por favor, entre em contato com nosso suporte ao cliente.</p><p><br></p><p>3.2.3. Todas as retiradas estão sujeitas a verificação de identidade e podem estar sujeitas a verificações adicionais de segurança. A AGLOW777&nbsp; N.V. pode solicitar documentos adicionais para verificar sua identidade e a origem dos fundos.</p><p><br></p><p>3.2.4. A AGLOW777 N.V. reserva-se o direito de cobrar uma taxa de processamento para retiradas, dependendo do método de retirada e dos valores envolvidos. As taxas aplicáveis serão informadas a você antes de concluir a transação de retirada.</p><p><br></p><p>3.2.5. O tempo necessário para processar uma retirada pode variar dependendo do método de retirada escolhido. Em geral, tentaremos processar todas as retiradas o mais rápido possível.</p><p><br></p><p>4. Uso Responsável</p><p><br></p><p>4.1. Jogar deve ser uma forma de entretenimento e não uma maneira de ganhar dinheiro. Você deve se certificar de que você está jogando de maneira responsável e não gastando mais do que você pode perder.</p><p><br></p><p>4.2. Se você acha que pode ter um problema com o jogo, há ferramentas e recursos disponíveis para ajudar. Recomendamos que você utilize as opções de autoexclusão e limites de depósito disponíveis no Website.</p><p><br></p><p>4.3. Se você deseja se autoexcluir, entre em contato com nosso suporte ao cliente para obter assistência na configuração da autoexclusão.</p><p><br></p><p>5. Encerramento e Suspensão de Conta</p><p><br></p><p>5.1. A AGLOW777 N.V. reserva-se o direito de suspender ou encerrar sua Conta a qualquer momento, a seu exclusivo critério, e sem aviso prévio, se acreditarmos que você violou estes Termos ou se tivermos qualquer outra razão para acreditar que você pode ter se envolvido em atividade fraudulenta, ilegal ou não autorizada.</p><p><br></p><p>5.2. Se sua Conta for encerrada ou suspensa, qualquer saldo remanescente em sua Conta pode ser devolvido a você, menos quaisquer taxas ou encargos aplicáveis, e qualquer saldo remanescente poderá ser perdido a critério da AGLOW777 N.V.</p><p><br></p><p>6.15. O valor máximo diário de ganhos para um Cliente não pode exceder 100.000 Euros ou o equivalente na moeda da sua Conta. O “dia” significa o período entre 00:00 GMT e 23:59 GMT.</p><p><br></p><p>7. Fechamento da Conta</p><p><br></p><p>7.1. Você pode fechar sua Conta a qualquer momento e solicitar a retirada do saldo da Conta, sujeito à dedução das taxas de retirada relevantes. Para fechar sua Conta, você deve primeiro cancelar quaisquer apostas em aberto, se aplicável, e entrar em contato com o suporte ao cliente do Website. O fechamento efetivo da Conta corresponderá à rescisão da SLOTAGLOW777 N.V.. Se o motivo do fechamento da Conta estiver relacionado a preocupações sobre possível adição ao jogo, você deve informar a SLOTAGLOW777 N.V..</p><p><br></p><p>7.2. O método de reembolso será a nosso critério absoluto.</p><p><br></p><p>7.3. A AGLOW777 N.V. reserva-se o direito de fechar sua Conta e reembolsar o saldo “Disponível para retirada”, sujeito à dedução das taxas de retirada relevantes, a critério absoluto da SLOTAGLOW777 N.V. e sem qualquer obrigação de fornecer um motivo ou aviso prévio.</p><p><br></p><p>7.4. A AGLOW777 N.V. reserva-se o direito de cancelar e remover qualquer valor de bônus concedido a você se não for utilizado dentro de 1 mês a partir da data em que foi concedido.</p><p><br></p><p>7.5. A AGLOW777 N.V. reserva-se o direito de recusar uma reivindicação de retirada em caso de fraude, momento em que uma Conta será suspensa e o pagamento não será processado.</p><p><br></p><p>7.6. A AGLOW777 N.V. revisará todas as Contas de jogadores e as classificará a seu critério. Uma vez que um jogador seja classificado como “caçador de bônus” ou “abusador de bônus”, todos os ganhos e bônus serão anulados e a Conta será suspensa e o pagamento não será processado.</p><p><br></p><p>8. Informações Pessoais</p><p><br></p><p>8.1. Cumpriremos as leis de proteção de dados aplicáveis em relação às informações pessoais que você nos fornecer. Suas informações pessoais são processadas de acordo com nossa Política de Privacidade, cuja cópia está disponível clicando aqui.</p><p><br></p><p>9. Jogos Interrompidos e Abortados</p><p><br></p><p>9.1. Atividade Criminosa: Caso seja notada qualquer irregularidade (incluindo suspeita de tentativa de lavagem de dinheiro ou fraude), a AGLOW777 N.V. reserva-se o direito de fechar Contas e/ou relatar atividades criminosas ou suspeitas às autoridades regulatórias ou de aplicação da lei relevantes. Todos os saldos das Contas dos infratores serão bloqueados, retiradas serão anuladas e depósitos e ganhos serão perdidos.</p><p><br></p><p>9.2. Colusão e trapaça: A AGLOW777 N.V. tem o direito de desativar Contas de usuários e confiscar os saldos das Contas (incluindo depósitos e ganhos) se detectar tentativa de obter vantagem por meio da troca de informações sobre suas cartas ou estabelecer um acordo colusivo com outros usuários para obter uma vantagem injusta. Essas vantagens podem consistir em despejo de fichas e transferências, discussão de uma mão durante o jogo, uso múltiplo de uma única Conta, jogo suave. A AGLOW777 N.V. realiza uma rigorosa análise do jogo por meios manuais e automatizados e investiga todas as reclamações relacionadas de usuários. Além disso, a AGLOW777 N.V. realiza análises proativas e aleatórias de jogadas e Contas.</p><p><br></p><p>9.3. Atividade Fraudulenta: Quando a AGLOW777 N.V. detectar atividade fraudulenta, ilegal, desonesta ou imprópria (incluindo o uso de VPN, proxy ou serviço semelhante que mascara ou manipula a identificação de sua localização real, ou fazer apostas, apostas ou jogo de poker por meio de um terceiro ou em nome de um terceiro) no Website, temos o direito de bloquear a Conta do usuário e confiscar todos os saldos da Conta sem notificação prévia. Nesses casos, a SLOTAGLOW777 N.V. reserva-se o direito de relatar a atividade fraudulenta às autoridades regulatórias e de aplicação da lei, incluindo, mas não se limitando a, bancos, empresas de cartões de crédito e/ou qualquer pessoa ou entidade que tenha o direito legal a tais informações, e/ou tomar medidas legais contra o usuário.</p><p><br></p><p>10. Chat ao Vivo</p><p><br></p><p>10.1. Como parte do uso do Website, a AGLOW777 N.V. pode fornecer a você uma funcionalidade de chat, que é moderada por nós e sujeita a controles. Reservamo-nos o direito de revisar o chat e manter um registro de todas as declarações feitas nessa funcionalidade. Seu uso da funcionalidade de chat deve ser para fins recreativos e de socialização, e está sujeito às seguintes regras.</p><p><br></p><p>10.2. Você não deve fazer declarações sexualmente explícitas ou extremamente ofensivas, incluindo expressões de preconceito, racismo, ódio ou profanidade.</p><p><br></p><p>10.3. Você não deve fazer declarações abusivas, difamatórias ou que assediam ou insultam o Website ou a AGLOW777 N.V..</p><p><br></p><p>10.4. Você não deve fazer declarações que anunciem, promovam ou se relacionem com outras entidades online.</p><p><br></p><p>10.5. Você não deve fazer declarações sobre a AGLOW777 N.V., o Website ou quaisquer outros sites da Internet conectados à AGLOW777 N.V. que sejam falsas e/ou maliciosas e/ou prejudiciais à AGLOW777 N.V..</p><p><br></p><p>10.6. Você não deve fazer colusão através dos chats ou chats separados. Qualquer chat suspeito será relatado à autoridade regulatória ou de aplicação da lei relevante.</p><p><br></p><p>10.7. No caso de você violar qualquer uma das disposições acima relacionadas à funcionalidade de chat, a AGLOW777 N.V. terá o direito de remover o chat room ou encerrar imediatamente sua Conta. Após tal rescisão, a AGLOW777 N.V. reembolsará quaisquer fundos que possam estar em sua Conta, além de qualquer valor que possa ser devido a nós naquele momento (se houver).</p><p><br></p><p>11. Jogos Interrompidos e Abortados</p><p><br></p><p>11.1. A AGLOW777 N.V. não é responsável por qualquer inatividade, interrupções do servidor, atraso ou qualquer perturbação técnica ou política ao jogo. Reembolsos podem ser concedidos apenas a critério da AGLOW777 N.V..</p><p><br></p><p>11.2. A SLOTAGLOW777 N.V. não aceita qualquer responsabilidade por danos ou perdas que sejam considerados ou alegados como resultantes de ou em conexão com o Website ou seu conteúdo, incluindo, sem limitação, atrasos ou interrupções na operação ou transmissão, perda ou corrupção de dados, falha na comunicação ou linhas, uso indevido do Website ou seu conteúdo por qualquer pessoa ou erros ou omissões no conteúdo.</p><p><br></p><p>11.3. No caso de um mau funcionamento do sistema do cassino, todas as apostas são nulas.</p><p><br></p><p>11.4. No caso de um Jogo ser iniciado mas abortado devido a uma falha no sistema, a SLOTAGLOW777 N.V. reembolsará o valor apostado no Jogo, creditando-o em sua Conta ou, se a Conta não existir mais, pagando-o de uma forma aprovada; e se você tiver um crédito acumulado no momento em que o Jogo foi abortado, creditará em sua Conta o valor monetário do crédito ou, se a Conta não existir mais, pagará a você de uma forma aprovada.</p><p><br></p><p>12. Deveres</p><p><br></p><p>12.1. A AGLOW777 N.V. reserva-se o direito de ceder ou transferir legalmente seus direitos e obrigações sob os Termos. Você não deve ceder ou transferir seus direitos e obrigações sob estes Termos.</p><p><br></p><p>13. Reclamações</p><p><br></p><p>13.1. Se você tiver uma reclamação, pode enviar um e-mail para o suporte ao cliente do Website em AGLOW777@gmail.com.</p><p><br></p><p>13.2. A AGLOW777 N.V. usará seus melhores esforços para resolver a questão relatada prontamente.</p><p><br></p><p>13.3. Se você tiver uma dúvida sobre qualquer transação, pode entrar em contato com a AGLOW777 N.V. em AGLOW777 @gmail.com com detalhes da dúvida. Revisaremos qualquer transação questionada ou disputada. Nosso julgamento é final.</p><p><br></p><p>14. Acordo e Admissibilidade</p><p><br></p><p>14.1. Estes Termos, a Política de Privacidade, a Política de Cookies e qualquer documento a eles expressamente mencionado e quaisquer diretrizes ou regras postadas no Website constituem o acordo e entendimento completo entre você e a AGLOW777 N.V. com respeito a este Website e, salvo em caso de fraude, substituem todas as comunicações e propostas anteriores ou contemporâneas, sejam eletrônicas, orais ou escritas, entre você e a AGLOW777 N.V. com respeito a este Website.</p><p><br></p><p>14.2. Uma versão impressa destes Termos e de qualquer aviso dado em forma eletrônica será admissível em procedimentos judiciais ou administrativos baseados ou relacionados a estes Termos com o mesmo efeito e sujeita às mesmas condições que outros documentos e registros comerciais gerados e mantidos originalmente em forma impressa.</p><p><br></p><p>14.3. Você deve fornecer um endereço válido de e-mail e outras informações de contato ao criar uma Conta. Você deve manter essas informações atualizadas.</p><p><br></p><p>15. Alterações e Atualizações</p><p><br></p><p>15.1. A AGLOW777 N.V. reserva-se o direito de alterar ou atualizar estes Termos a qualquer momento e sem aviso prévio. As alterações entram em vigor no momento da publicação no Website.</p><p><br></p><p>15.2. Você é responsável por revisar regularmente os Termos para estar ciente de quaisquer alterações. Seu uso contínuo do Website após a publicação das alterações será considerado uma aceitação dessas alterações.</p><p><br></p><p>16. Limitação de Responsabilidade</p><p><br></p><p>16.1. A AGLOW777 N.V. não será responsável por quaisquer danos indiretos, consequenciais ou especiais, ou por quaisquer perdas de lucros, dados ou oportunidades de negócios, mesmo que tenhamos sido avisados da possibilidade de tais danos.</p><p><br></p><p>16.2. Nenhuma disposição destes Termos exclui ou limita nossa responsabilidade por morte ou lesão pessoal resultante de negligência ou qualquer outra responsabilidade que não possa ser excluída ou limitada por lei.</p><p><br></p><p>17. Disposições Específicas de Apostas</p><p><br></p><p>17.1. As apostas são aceitas e os resultados são calculados de acordo com as regras especificadas para cada mercado específico. A AGLOW777 N.V. reserva-se o direito de modificar essas regras e de cancelar apostas em mercados onde as regras especificadas não possam ser aplicadas corretamente.</p><p><br></p><p>17.2. Se um evento for cancelado, adiado ou suspendido, a AGLOW777 N.V. reserva-se o direito de determinar a política de reembolso apropriada, que pode variar dependendo do tipo de evento e das circunstâncias.</p><p><br></p><p>17.3. A AGLOW777&nbsp; N.V. pode definir regras específicas para cada mercado de apostas, e todas as apostas serão processadas de acordo com essas regras. É sua responsabilidade ler e entender as regras antes de fazer uma aposta.</p><p><br></p><p>17.4. Se houver uma disputa sobre o resultado de um evento, a AGLOW777 N.V. pode considerar o resultado oficial divulgado pelas autoridades competentes ou organizações relevantes. Qualquer alteração no resultado após a decisão oficial não será considerada para fins de apostas.</p><p><br></p><p>17.5. A AGLOW777 N.V. reserva-se o direito de encerrar ou suspender mercados e apostas em caso de erros técnicos, problemas com os resultados ou outras circunstâncias imprevistas.</p><p><br></p><p>17.6. A AGLOW777 N.V. pode, a seu critério, limitar o montante de apostas e ganhos por evento ou mercado para garantir a integridade e a justiça das apostas.</p><p><br></p><p>17.7. Se houver uma modificação nas regras de um evento ou mercado, a AGLOW777 N.V. pode atualizar as regras e notificar os clientes sobre tais alterações.</p><p><br></p><p>17.8. A decisão de um mercado é feita assim que for determinada. A AGLOW777 N.V. reserva-se o direito de definir os resultados dos jogos caso um mercado não seja determinado anteriormente na partida. Esta regra aplica-se à duração normal da partida e se não houver condições especificadas na descrição do mercado no Website.</p><p><br></p><p>17.9. Se houver uma disputa sobre o resultado de um evento, a AGLOW777 N.V. pode considerar o resultado oficial divulgado pelas autoridades competentes, organizações esportivas ou ligas relevantes. Qualquer alteração no resultado após a decisão oficial não será considerada para fins de apostas.</p><p><br></p><p>17.10. Se um evento for cancelado, adiado ou suspendido, todas as apostas poderão ser anuladas ou mantidas, dependendo das regras específicas do evento e das decisões tomadas pela AGLOW777 N.V. De maneira geral, apostas em eventos cancelados serão reembolsadas.</p><p><br></p><p>17.11. A AGLOW777 N.V. pode, a seu critério, ajustar os mercados de apostas e reembolsar ou manter apostas conforme as regras e circunstâncias do evento.</p>', 'olaaa', '#413363', '#58418C', '#291F40', '#2c274e', '#ffffff', '#ffffff', '#DABD01', '#ffffff', '#DABD01', '#ffffff', '#', '#ffffff', '#DABD01', '#ffffff', '#DABD01', '#ffffff', '#DABD01', '#', '#', 20.00, 20.00, 20.00, 20.00, 20.00, 20.00, '#ffffff', '#DABD01', '#DABD01', '#ffffff', '#DABD01', '#DABD01', 0.50, '#2b294d', '#2c274e', '0.5', '0.5', '0.5');

-- --------------------------------------------------------

--
-- Estrutura para tabela `debug`
--

CREATE TABLE `debug` (
  `text` longtext
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `deposits`
--

CREATE TABLE `deposits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment_id` varchar(191) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(20,2) NOT NULL DEFAULT '0.00',
  `type` varchar(191) NOT NULL,
  `proof` varchar(191) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `currency` varchar(50) DEFAULT NULL,
  `symbol` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `deposits`
--

INSERT INTO `deposits` (`id`, `payment_id`, `user_id`, `amount`, `type`, `proof`, `status`, `currency`, `symbol`, `created_at`, `updated_at`) VALUES
(161, 'efc85d75bacc65c67f4a559e93a4jzc90', 1, 10.00, 'pix', NULL, 0, 'BRL', 'R$', '2025-06-17 02:22:59', '2025-06-17 02:22:59'),
(162, 'ed85b7084054221d3fda3633ae9q5emwa', 1, 10.00, 'pix', NULL, 0, 'BRL', 'R$', '2025-06-17 02:24:34', '2025-06-17 02:24:34'),
(163, 'e85c30d85da93e66cf6ae02beec4fwxht', 1, 10.00, 'pix', NULL, 0, 'BRL', 'R$', '2025-06-17 02:29:40', '2025-06-17 02:29:40'),
(164, 'e24da0d80aaf08e4d5b8071ba721ofrv5', 1, 10.00, 'pix', NULL, 0, 'BRL', 'R$', '2025-06-17 02:38:15', '2025-06-17 02:38:15'),
(165, 'e2cddd6378caa68a9e987e6db58eonw6l', 1, 10.00, 'pix', NULL, 0, 'BRL', 'R$', '2025-06-17 02:39:01', '2025-06-17 02:39:01'),
(166, 'e6728a093ed81119a9cbb5053b6qfbxmg', 1, 10.00, 'pix', NULL, 0, 'BRL', 'R$', '2025-06-17 02:48:02', '2025-06-17 02:48:02'),
(167, 'e286c19c84d8bcb54521a3c9a9dbaf345', 1, 10.00, 'pix', NULL, 0, 'BRL', 'R$', '2025-06-17 02:52:19', '2025-06-17 02:52:19'),
(168, 'e5decad96b561cee81819aa3e08c8b2om', 1, 10.00, 'pix', NULL, 0, 'BRL', 'R$', '2025-06-17 02:53:27', '2025-06-17 02:53:27'),
(169, 'e905399600a0b6784cebc6f67d3df6nz7', 1, 10.00, 'pix', NULL, 0, 'BRL', 'R$', '2025-06-17 02:54:30', '2025-06-17 02:54:30'),
(170, 'ea95d143a274de621d6fb41cd69u4xh8q', 1, 10.00, 'pix', NULL, 0, 'BRL', 'R$', '2025-06-17 03:00:29', '2025-06-17 03:00:29'),
(171, 'eee18c8c04d0bc025b7abe3fc8cg9n5pq', 1, 0.10, 'pix', NULL, 0, 'BRL', 'R$', '2025-06-17 03:06:40', '2025-06-17 03:06:40'),
(172, 'e6294a81b7fdde049a17cd26c8bpb5vmq', 1, 0.10, 'pix', NULL, 0, 'BRL', 'R$', '2025-06-17 03:09:43', '2025-06-17 03:09:43'),
(173, 'brmp_6851085985335', 1, 0.10, 'pix', NULL, 0, 'BRL', 'R$', '2025-06-17 03:17:00', '2025-06-17 03:17:00'),
(174, 'brmp_6851088f86eb8', 1, 0.20, 'pix', NULL, 0, 'BRL', 'R$', '2025-06-17 03:17:53', '2025-06-17 03:17:53'),
(175, 'e4e5301696d99fd117474754104uskctj', 1, 0.15, 'pix', NULL, 0, 'BRL', 'R$', '2025-06-17 03:21:07', '2025-06-17 03:21:07'),
(176, 'e87cdfd9610eb23e4597187a0f1lqfjn3', 1, 0.10, 'pix', NULL, 0, 'BRL', 'R$', '2025-06-17 03:24:27', '2025-06-17 03:24:27'),
(177, 'ead95afd246f5b191429b3089bevkbf79', 1, 0.20, 'pix', NULL, 0, 'BRL', 'R$', '2025-06-17 03:28:36', '2025-06-17 03:28:36'),
(178, 'e59b388d602663e9f68c66aa5c20oe6wx', 1, 0.50, 'pix', NULL, 0, 'BRL', 'R$', '2025-06-17 03:32:12', '2025-06-17 03:32:12'),
(179, 'e47bf51eb82fd015ffb9e0508964r713s', 1, 0.10, 'pix', NULL, 0, 'BRL', 'R$', '2025-06-17 03:38:53', '2025-06-17 03:38:53'),
(180, 'e494ac12b648a1368f3a822592b0fc8h9', 1, 0.11, 'pix', NULL, 0, 'BRL', 'R$', '2025-06-17 03:40:45', '2025-06-17 03:40:45'),
(181, 'edfbe47235e3afe48b830957c5atyf59i', 1, 0.10, 'pix', NULL, 0, 'BRL', 'R$', '2025-06-17 03:45:36', '2025-06-17 03:45:36'),
(182, 'e357efc57fc07506e1b175a9e7d2prtye', 1, 0.12, 'pix', NULL, 0, 'BRL', 'R$', '2025-06-17 03:46:41', '2025-06-17 03:46:41'),
(183, '685110823d087', 1, 0.10, 'pix', NULL, 1, 'BRL', 'R$', '2025-06-17 03:51:48', '2025-06-17 03:52:07'),
(184, '685133891d317', 1, 10.00, 'pix', NULL, 0, 'BRL', 'R$', '2025-06-17 06:21:14', '2025-06-17 06:21:14'),
(185, '685134a975a4b', 1, 10.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-06-17 06:26:02', '2025-06-17 06:26:35'),
(186, '6851362a21967', 1, 0.10, 'pix', NULL, 1, 'BRL', 'R$', '2025-06-17 06:32:27', '2025-06-17 06:32:53'),
(187, '6851369b3c0d1', 1, 0.15, 'pix', NULL, 1, 'BRL', 'R$', '2025-06-17 06:34:20', '2025-06-17 06:34:41'),
(188, '685137f66b006', 1, 0.10, 'pix', NULL, 1, 'BRL', 'R$', '2025-06-17 06:40:08', '2025-06-17 06:40:31'),
(189, '68514f37d8638', 1, 0.10, 'pix', NULL, 0, 'BRL', 'R$', '2025-06-17 08:19:21', '2025-06-17 08:19:21');

-- --------------------------------------------------------

--
-- Estrutura para tabela `eventos_plataforma`
--

CREATE TABLE `eventos_plataforma` (
  `id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `descricao` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `caminho` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura para tabela `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `games`
--

CREATE TABLE `games` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `provider_id` int(10) UNSIGNED NOT NULL,
  `game_server_url` varchar(191) DEFAULT 'inativo',
  `game_id` varchar(191) NOT NULL,
  `game_name` varchar(191) NOT NULL,
  `game_code` varchar(191) NOT NULL,
  `game_type` varchar(191) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `cover` varchar(191) DEFAULT NULL,
  `status` varchar(191) NOT NULL DEFAULT '0',
  `technology` varchar(191) DEFAULT 'html5',
  `has_lobby` tinyint(4) NOT NULL DEFAULT '0',
  `is_mobile` tinyint(4) NOT NULL DEFAULT '0',
  `has_freespins` tinyint(4) NOT NULL DEFAULT '0',
  `has_tables` tinyint(4) NOT NULL DEFAULT '0',
  `only_demo` tinyint(4) DEFAULT '0',
  `rtp` bigint(20) NOT NULL DEFAULT '0',
  `distribution` varchar(191) NOT NULL DEFAULT 'play_fiver',
  `views` bigint(20) NOT NULL DEFAULT '0',
  `is_featured` tinyint(4) DEFAULT '0',
  `show_home` tinyint(4) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `original` tinyint(1) NOT NULL DEFAULT '0',
  `is_influencer_mode` tinyint(1) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `games`
--

INSERT INTO `games` (`id`, `provider_id`, `game_server_url`, `game_id`, `game_name`, `game_code`, `game_type`, `description`, `cover`, `status`, `technology`, `has_lobby`, `is_mobile`, `has_freespins`, `has_tables`, `only_demo`, `rtp`, `distribution`, `views`, `is_featured`, `show_home`, `created_at`, `updated_at`, `original`, `is_influencer_mode`) VALUES
(166, 1, 'inativo', '54', 'Captain\'s Bounty', '54', 'Slots', NULL, 'Games/Pgsoft/captains-bounty.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 1, 1, '2025-04-14 18:56:12', '2025-06-17 11:53:50', 0, 0),
(167, 1, 'inativo', '58', 'Vampire\'s Charm', '58', 'Slots', NULL, 'Games/Pgsoft/vampires-charm.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 1, 1, '2025-04-14 18:56:12', '2025-06-17 11:54:49', 0, 0),
(168, 1, 'inativo', '62', 'Gem Saviour Conquest', '62', 'Slots', NULL, 'Games/Pgsoft/gem-saviour-conquest.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 1, 1, '2025-04-14 18:56:12', '2025-06-17 11:55:37', 0, 0),
(169, 1, 'inativo', '65', 'Mahjong Ways', '65', 'Slots', NULL, 'Games/Pgsoft/mahjong-ways.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 1, 1, '2025-04-14 18:56:12', '2025-06-17 11:58:11', 0, 0),
(170, 1, 'inativo', '70', 'Candy Burst', '70', 'Slots', NULL, 'Games/Pgsoft/candy-burst.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 1, 1, '2025-04-14 18:56:12', '2025-06-17 11:59:28', 0, 0),
(171, 1, 'inativo', '74', 'Mahjong Ways 2', '74', 'Slots', NULL, 'Games/Pgsoft/mahjong-ways2.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 1, 1, '2025-04-14 18:56:12', '2025-06-17 11:59:41', 0, 0),
(172, 1, 'inativo', '75', 'Ganesha Fortune', '75', 'Slots', NULL, 'Games/Pgsoft/ganesha-fortune.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 1, 1, '2025-04-14 18:56:12', '2025-06-17 12:00:32', 0, 0),
(173, 1, 'inativo', '82', 'Phoenix Rises', '82', 'Slots', NULL, 'Games/Pgsoft/phoenix-rises.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 1, 1, '2025-04-14 18:56:12', '2025-06-17 12:01:29', 0, 0),
(174, 1, 'inativo', '83', 'Wild Fireworks', '83', 'Slots', NULL, 'Games/Pgsoft/wild-fireworks.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 1, 1, '2025-04-14 18:56:12', '2025-06-17 12:01:57', 0, 0),
(175, 1, 'inativo', '86', 'Galactic Gems', '86', 'Slots', NULL, 'Games/Pgsoft/galactic-gems.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 1, 1, '2025-04-14 18:56:13', '2025-06-17 12:02:27', 0, 0),
(176, 1, 'inativo', '87', 'Treasures of Aztec', '87', 'Slots', NULL, 'Games/Pgsoft/treasures-aztec.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 3, 1, 1, '2025-04-14 18:56:13', '2025-06-17 11:47:13', 0, 0),
(177, 1, 'inativo', '91', 'Guardians of Ice and Fire', '91', 'Slots', NULL, 'Games/Pgsoft/gdn-ice-fire.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 1, 1, '2025-04-14 18:56:13', '2025-06-17 12:03:06', 0, 0),
(178, 1, 'inativo', '94', 'Bali Vacation', '94', 'Slots', NULL, 'Games/Pgsoft/bali-vacation.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 1, 1, '2025-04-14 18:56:13', '2025-06-17 12:03:54', 0, 0),
(179, 1, 'inativo', '95', 'Majestic Treasures', '95', 'Slots', NULL, 'Games/Pgsoft/majestic-ts.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 1, 1, '2025-04-14 18:56:13', '2025-06-17 12:04:28', 0, 0),
(180, 1, 'inativo', '97', 'Jack Frost\'s Winter', '97', 'Slots', NULL, 'Games/Pgsoft/jack-frosts.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 3, 1, 1, '2025-04-14 18:56:13', '2025-06-17 11:48:02', 0, 0),
(181, 1, 'inativo', '100', 'Candy Bonanza', '100', 'Slots', NULL, 'Games/Pgsoft/candy-bonanza.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 1, 1, '2025-04-14 18:56:14', '2025-06-17 12:04:39', 0, 0),
(182, 1, 'inativo', '105', 'Heist Stakes', '105', 'Slots', NULL, 'Games/Pgsoft/heist-stakes.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 1, 1, '2025-04-14 18:56:14', '2025-06-17 12:05:14', 0, 0),
(183, 1, 'inativo', '107', 'Legendary Monkey King', '107', 'Slots', NULL, 'Games/Pgsoft/lgd-monkey-kg.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 3, 1, 1, '2025-04-14 18:56:14', '2025-06-17 11:48:58', 0, 0),
(184, 1, 'inativo', '108', 'Buffalo Win', '108', 'Slots', NULL, 'Games/Pgsoft/buffalo-win.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 1, 1, '2025-04-14 18:56:14', '2025-06-17 12:05:38', 0, 0),
(185, 1, 'inativo', '113', 'Raider Jane\'s Crypt of Fortune', '113', 'Slots', NULL, 'Games/Pgsoft/crypt-fortune.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 1, 1, '2025-04-14 18:56:14', '2025-06-17 12:06:17', 0, 0),
(186, 1, 'inativo', '114', 'Emoji Riches', '114', 'Slots', NULL, 'Games/Pgsoft/emoji-riches.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 1, 1, '2025-04-14 18:56:14', '2025-06-17 12:06:47', 0, 0),
(187, 1, 'inativo', '115', 'Supermarket Spree', '115', 'Slots', NULL, 'Games/Pgsoft/sprmkt-spree.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 1, 1, '2025-04-14 18:56:15', '2025-06-17 12:07:21', 0, 0),
(188, 1, 'inativo', '119', 'Spirited Wonders', '119', 'Slots', NULL, 'Games/Pgsoft/spirit-wonder.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 1, 1, '2025-04-14 18:56:15', '2025-06-17 12:08:33', 0, 0),
(189, 1, 'inativo', '121', 'Destiny of Sun & Moon', '121', 'Slots', NULL, 'Games/Pgsoft/dest-sun-moon.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 1, 1, '2025-04-14 18:56:15', '2025-06-17 12:09:05', 0, 0),
(190, 1, 'inativo', '122', 'Garuda Gems', '122', 'Slots', NULL, 'Games/Pgsoft/garuda-gems.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 1, 1, '2025-04-14 18:56:15', '2025-06-17 12:09:30', 0, 0),
(191, 1, 'inativo', '123', 'Rooster Rumble', '123', 'Slots', NULL, 'Games/Pgsoft/rooster-rbl.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 1, 1, '2025-04-14 18:56:15', '2025-06-17 12:10:13', 0, 0),
(192, 1, 'inativo', '124', 'Battleground Royale', '124', 'Slots', NULL, 'Games/Pgsoft/battleground.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 1, 1, '2025-04-14 18:56:16', '2025-06-17 12:10:41', 0, 0),
(193, 1, 'inativo', '125', 'Butterfly Blossom', '125', 'Slots', NULL, 'Games/Pgsoft/btrfly-blossom.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 1, 1, '2025-04-14 18:56:16', '2025-06-17 12:11:13', 0, 0),
(194, 1, 'inativo', '1312883', 'Prosperity Fortune Tree', '1312883', 'Slots', NULL, 'Games/Pgsoft/prosper-ftree.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 1, 1, '2025-04-14 18:56:16', '2025-06-17 12:12:49', 0, 0),
(195, 1, 'inativo', '1340277', 'Asgardian Rising', '1340277', 'Slots', NULL, 'Games/Pgsoft/asgardian-rs.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 1, 1, '2025-04-14 18:56:16', '2025-06-17 12:14:05', 0, 0),
(196, 1, 'inativo', '1368367', 'Alchemy Gold', '1368367', 'Slots', NULL, 'Games/Pgsoft/alchemy-gold.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 1, 1, '2025-04-14 18:56:17', '2025-06-17 12:14:36', 0, 0),
(197, 1, 'inativo', '1372643', 'Diner Delights', '1372643', 'Slots', NULL, 'Games/Pgsoft/diner-delights.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 3, 1, 1, '2025-04-14 18:56:17', '2025-06-17 11:50:12', 0, 0),
(198, 1, 'inativo', '1418544', 'Bakery Bonanza', '1418544', 'Slots', NULL, 'Games/Pgsoft/bakery-bonanza.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 1, 1, '2025-04-14 18:56:17', '2025-06-17 12:15:25', 0, 0),
(199, 1, 'inativo', '1448762', 'Songkran Splash', '1448762', 'Slots', NULL, 'Games/Pgsoft/songkran-spl.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 1, 1, '2025-04-14 18:56:17', '2025-06-17 12:15:58', 0, 0),
(200, 1, 'inativo', '1473388', 'Cruise Royale', '1473388', 'Slots', NULL, 'Games/Pgsoft/cruise-royale.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 1, 1, '2025-04-14 18:56:17', '2025-06-17 12:17:02', 0, 0),
(201, 1, 'inativo', '1513328', 'Super Golf Drive', '1513328', 'Slots', NULL, 'Games/Pgsoft/spr-golf-drive.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 1, 1, '2025-04-14 18:56:18', '2025-06-17 12:17:38', 0, 0),
(811, 1, 'inativo', '89', 'Lucky Neko', '89', 'Slots', NULL, 'Games/Pgsoft/lucky-neko.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 3, 1, 1, '2025-04-14 18:57:16', '2025-06-17 11:51:03', 0, 0),
(812, 1, 'inativo', '135', 'Wild Bounty Showdown', '135', 'Slots', NULL, 'Games/Pgsoft/wild-bounty-sd.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 1, 1, '2025-04-14 18:57:16', '2025-06-17 12:18:10', 0, 0),
(840, 1, 'inativo', '33', 'Hip Hop Panda', '33', 'Slots', NULL, 'Games/Pgsoft/9873.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 1, 1, '2025-04-14 18:57:20', '2025-06-17 12:18:46', 0, 0),
(841, 1, 'inativo', '35', 'Mr. Hallow-Win!', '35', 'Slots', NULL, 'Games/Pgsoft/9875.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 1, 1, '2025-04-14 18:57:20', '2025-06-17 12:19:23', 0, 0),
(842, 1, 'inativo', '31', 'Baccarat Deluxe', '31', 'Slots', NULL, 'Games/Pgsoft/9872.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 1, 1, '2025-04-14 18:57:20', '2025-06-17 12:20:01', 0, 0),
(843, 1, 'inativo', '127', 'Speed Winner', '127', 'Slots', NULL, 'Games/Pgsoft/9947.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 1, 1, '2025-04-14 18:57:20', '2025-06-17 12:20:48', 0, 0),
(844, 1, 'inativo', '3', 'Fortune Gods', '3', 'Slots', NULL, 'Games/Pgsoft/9862.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 3, 1, 1, '2025-04-14 18:57:20', '2025-06-17 12:24:03', 0, 0),
(845, 1, 'inativo', '1492288', 'Pinata Wins', '1492288', 'Slots', NULL, 'Games/Pgsoft/13182.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 1, 1, '2025-04-14 18:57:21', '2025-06-17 12:24:47', 0, 0),
(846, 1, 'inativo', '37', 'Santas Gift Rush', '37', 'Slots', NULL, 'Games/Pgsoft/9877.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 1, 1, '2025-04-14 18:57:21', '2025-06-17 12:25:24', 0, 0),
(847, 1, 'inativo', '67', 'Shaolin Soccer', '67', 'Slots', NULL, 'Games/Pgsoft/9897.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 1, 1, '2025-04-14 18:57:21', '2025-06-17 12:26:03', 0, 0),
(848, 1, 'inativo', '61', 'Flirting Scholar', '61', 'Slots', NULL, 'Games/Pgsoft/9892.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 1, 1, '2025-04-14 18:57:21', '2025-06-17 12:26:38', 0, 0),
(849, 1, 'inativo', '44', 'Emperor\'s Favour', '44', 'Slots', NULL, 'Games/Pgsoft/9883.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 1, 1, '2025-04-14 18:57:21', '2025-06-17 12:27:17', 0, 0),
(850, 1, 'inativo', '29', 'Dragon Legend', '29', 'Slots', NULL, 'Games/Pgsoft/9871.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 1, 1, '2025-04-14 18:57:21', '2025-06-17 12:28:10', 0, 0),
(851, 1, 'inativo', '85', 'Genie\'s 3 Wishes', '85', 'Slots', NULL, 'Games/Pgsoft/9910.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 1, 1, '2025-04-14 18:57:21', '2025-06-17 12:28:49', 0, 0),
(852, 1, 'inativo', '41', 'Symbols of Egypt', '41', 'Slots', NULL, 'Games/Pgsoft/9881.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 1, 1, '2025-04-14 18:57:22', '2025-06-17 12:29:51', 0, 0),
(853, 1, 'inativo', '90', 'Secrets of Cleopatra', '90', 'Slots', NULL, 'Games/Pgsoft/9915.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 1, 1, '2025-04-14 18:57:22', '2025-06-17 12:30:24', 0, 0),
(854, 1, 'inativo', '59', 'Ninja vs Samurai', '59', 'Slots', NULL, 'Games/Pgsoft/9890.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 1, 1, '2025-04-14 18:57:22', '2025-06-17 12:30:57', 0, 0),
(855, 1, 'inativo', '50', 'Journey To The Wealth', '50', 'Slots', NULL, 'Games/Pgsoft/9885.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 1, 1, '2025-04-14 18:57:22', '2025-06-17 12:31:34', 0, 0),
(856, 1, 'inativo', '24', 'Win Win Won', '24', 'Slots', NULL, 'Games/Pgsoft/9867.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 1, 1, '2025-04-14 18:57:22', '2025-06-17 12:32:33', 0, 0),
(857, 1, 'inativo', '1', 'Honey Trap of Diao Chan', '1', 'Slots', NULL, 'Games/Pgsoft/9860.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 1, 1, '2025-04-14 18:57:22', '2025-06-17 12:33:56', 0, 0),
(858, 1, 'inativo', '7', 'Medusa 1: the Curse of Athena', '7', 'Slots', NULL, 'Games/Pgsoft/9864.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 1, 1, '2025-04-14 18:57:22', '2025-06-17 12:35:58', 0, 0),
(859, 1, 'inativo', '6', 'Medusa 2: the Quest of Perseus', '6', 'Slots', NULL, 'Games/Pgsoft/9863.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 1, 1, '2025-04-14 18:57:23', '2025-06-17 12:37:10', 0, 0),
(860, 1, 'inativo', '18', 'Hood vs Wolf', '18', 'Slots', NULL, 'Games/Pgsoft/9865.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 1, 1, '2025-04-14 18:57:23', '2025-06-17 12:37:47', 0, 0),
(861, 1, 'inativo', '64', 'Muay Thai Champion', '64', 'Slots', NULL, 'Games/Pgsoft/9895.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 1, 1, '2025-04-14 18:57:23', '2025-06-17 12:38:16', 0, 0),
(862, 1, 'inativo', '20', 'Reel Love', '20', 'Slots', NULL, 'Games/Pgsoft/9866.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 1, 1, '2025-04-14 18:57:23', '2025-06-17 12:38:41', 0, 0),
(863, 1, 'inativo', '80', 'Circus Delight', '80', 'Slots', NULL, 'Games/Pgsoft/9906.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 1, 1, '2025-04-14 18:57:23', '2025-06-17 12:39:15', 0, 0),
(864, 1, 'inativo', '38', 'Gem Saviour Sword', '38', 'Slots', NULL, 'Games/Pgsoft/9878.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 1, 1, '2025-04-14 18:57:23', '2025-06-17 12:40:05', 0, 0),
(865, 1, 'inativo', '34', 'Legend of Hou Yi', '34', 'Slots', NULL, 'Games/Pgsoft/9874.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 1, 1, '2025-04-14 18:57:23', '2025-06-17 12:40:57', 0, 0),
(866, 1, 'inativo', '36', 'Prosperity Lion', '36', 'Slots', NULL, 'Games/Pgsoft/9876.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 1, 1, '2025-04-14 18:57:23', '2025-06-17 12:13:13', 0, 0),
(867, 1, 'inativo', '25', 'Plushie Frenzy', '25', 'Slots', NULL, 'Games/Pgsoft/9868.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 1, 1, '2025-04-14 18:57:23', '2025-06-17 12:41:56', 0, 0),
(868, 1, 'inativo', '73', 'Egypts Book of Mystery', '73', 'Slots', NULL, 'Games/Pgsoft/9902.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 1, 1, '2025-04-14 18:57:24', '2025-06-17 12:29:30', 0, 0),
(869, 1, 'inativo', '1489936', 'Ultimate Striker', '1489936', 'Slots', NULL, 'Games/Pgsoft/12567.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 1, 1, '2025-04-14 18:57:24', '2025-06-17 12:44:31', 0, 0),
(870, 1, 'inativo', '1338274', 'Totem Wonders', '1338274', 'Slots', NULL, 'Games/Pgsoft/9954.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 1, 1, '2025-04-14 18:57:24', '2025-06-17 12:45:19', 0, 0),
(871, 3, 'inativo', '12590', 'AVIATOR (Original)', '12590', 'Crash', NULL, 'Games/Spribe/Aviator.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 1, 1, '2025-04-14 18:57:24', '2025-06-17 11:24:38', 0, 0),
(872, 1, 'inativo', '1702123', 'Geisha\'s Revenge', '1702123', 'Slots', NULL, 'Games/Pgsoft/geisha-revenge.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 1, 1, '2025-04-14 18:57:24', '2025-06-17 12:46:57', 0, 0),
(873, 1, 'inativo', '1747549', 'Wings of Iguazu', '1747549', 'Slots', NULL, 'Games/Pgsoft/wings-iguazu.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 3, 1, 1, '2025-04-14 18:57:24', '2025-06-17 11:52:55', 0, 0),
(874, 1, 'inativo', '1755623', 'Museum Mystery', '1755623', 'Slots', NULL, 'Games/Pgsoft/museum-mystery.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 1, 1, '2025-04-14 18:57:24', '2025-06-17 12:48:30', 0, 0),
(875, 1, 'inativo', '1760238', 'Yakuza Honor', '1760238', 'Slots', NULL, 'Games/Pgsoft/yakuza-honor.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 1, 1, '2025-04-14 18:57:25', '2025-06-17 12:49:00', 0, 0),
(876, 1, 'inativo', '1815268', 'Oishi Delights', '1815268', 'Slots', NULL, 'Games/Pgsoft/oishi-delights.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 1, 1, '2025-04-14 18:57:25', '2025-06-17 12:50:29', 0, 0),
(1422, 1, 'inativo', '126', 'Fortune Tiger', '126', 'Slots', NULL, 'Games/Pgsoft/126.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1003136, 1, 1, '2025-04-14 18:59:08', '2025-06-17 11:58:54', 0, 0),
(1081, 1, 'inativo', '104', 'Wild Bandito', '104', 'Slots', NULL, 'Games/Pgsoft/104.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1000301, 1, 1, '2025-04-14 18:58:36', '2025-06-17 11:40:56', 0, 0),
(1423, 1, 'inativo', '98', 'Fortune Ox', '98', 'Slots', NULL, 'Games/Pgsoft/98.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1000305, 1, 1, '2025-04-14 18:59:08', '2025-06-17 11:37:21', 0, 0),
(1424, 1, 'inativo', '68', 'Fortune Mouse', '68', 'Slots', NULL, 'Games/Pgsoft/68.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1000303, 1, 1, '2025-04-14 18:59:08', '2025-06-17 11:24:49', 0, 0),
(1425, 1, 'inativo', '1543462', 'Fortune Rabbit', '1543462', 'Slots', NULL, 'Games/Pgsoft/1543462.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1000306, 1, 1, '2025-04-14 18:59:08', '2025-06-17 11:31:49', 0, 0),
(1426, 1, 'inativo', '69', 'Bikini Paradise', '69', 'Slots', NULL, 'Games/Pgsoft/69.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1000301, 1, 1, '2025-04-14 18:59:08', '2025-06-17 11:41:10', 0, 0),
(1427, 1, 'inativo', '40', 'Jungle Delight', '40', 'Slots', NULL, 'Games/Pgsoft/40.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1000303, 1, 1, '2025-04-14 18:59:08', '2025-06-17 11:37:04', 0, 0),
(1428, 1, 'inativo', '1695365', 'Fortune Dragon', '1695365', 'Slots', NULL, 'Games/Pgsoft/1695365.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1000303, 1, 1, '2025-04-14 18:59:08', '2025-06-17 06:55:07', 0, 0),
(1429, 1, 'inativo', '1738001', 'Chicky Run', '1738001', 'Slots', NULL, 'Games/Pgsoft/1738001.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1000305, 1, 1, '2025-04-14 18:59:08', '2025-06-17 11:36:13', 0, 0),
(1430, 1, 'inativo', '42', 'Ganesha Gold', '42', 'Slots', NULL, 'Games/Pgsoft/42.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1000303, 1, 1, '2025-04-14 18:59:08', '2025-06-17 11:36:33', 0, 0),
(1431, 1, 'inativo', '60', 'Leprechaun Riches', '60', 'Slots', NULL, 'Games/Pgsoft/60.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1000301, 1, 1, '2025-04-14 18:59:08', '2025-06-17 11:41:23', 0, 0),
(1432, 1, 'inativo', '63', 'Dragon Tiger Luck', '63', 'Slots', NULL, 'Games/Pgsoft/63.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1000300, 1, 1, '2025-04-14 18:59:08', '2025-06-17 07:17:33', 0, 0),
(1433, 1, 'inativo', '39', 'Piggy Gold', '39', 'Slots', NULL, 'Games/Pgsoft/piggy-gold.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1000301, 0, 1, '2025-04-14 18:59:08', '2025-06-17 11:42:00', 0, 0),
(1434, 1, 'inativo', '48', 'Double Fortune', '48', 'Slots', NULL, 'Games/Pgsoft/double-fortune.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1000301, 1, 1, '2025-04-14 18:59:08', '2025-06-17 11:42:12', 0, 0),
(1435, 1, 'inativo', '53', 'The Great Icescape', '53', 'Slots', NULL, 'Games/Pgsoft/the-great-icescape.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1000302, 1, 1, '2025-04-14 18:59:08', '2025-06-17 11:37:33', 0, 0),
(1436, 1, 'inativo', '57', 'Dragon Hatch', '57', 'Slots', NULL, 'Games/Pgsoft/dragon-hatch.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1000301, 1, 1, '2025-04-14 18:59:08', '2025-06-17 11:42:23', 0, 0),
(1437, 1, 'inativo', '88', 'Jewels of Prosperity', '88', 'Slots', NULL, 'Games/Pgsoft/jewels-prosper.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1000302, 1, 1, '2025-04-14 18:59:08', '2025-06-17 11:37:44', 0, 0),
(1438, 1, 'inativo', '1402846', 'Midas Fortune', '1402846', 'Slots', NULL, 'Games/Pgsoft/midas-fortune.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1000302, 1, 1, '2025-04-14 18:59:09', '2025-06-17 11:38:02', 0, 0),
(1439, 1, 'inativo', '1451122', 'Dragon Hatch2', '1451122', 'Slots', NULL, 'Games/Pgsoft/dragon-hatch2.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1000302, 1, 1, '2025-04-14 18:59:09', '2025-06-17 11:43:25', 0, 0),
(1440, 1, 'inativo', '1508783', 'Wild Ape', '1508783', 'Slots', NULL, 'Games/Pgsoft/1508783.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1000303, 1, 1, '2025-04-14 18:59:09', '2025-06-17 11:39:20', 0, 0),
(1441, 1, 'inativo', '1623475', 'Anubis Wrath', '1623475', 'Slots', NULL, 'Games/Pgsoft/anubis-wrath.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1000302, 1, 1, '2025-04-14 18:59:09', '2025-06-17 11:44:16', 0, 0),
(1442, 1, 'inativo', '1635221', 'Zombie Outbreak', '1635221', 'Slots', NULL, 'Games/Pgsoft/zombie-outbrk.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1000302, 1, 1, '2025-04-14 18:59:09', '2025-06-17 11:45:23', 0, 0),
(1443, 1, 'inativo', '1682240', 'Cash Mania', '1682240', 'Slots', NULL, 'Games/Pgsoft/cash-mania.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1000301, 1, 1, '2025-04-14 18:59:09', '2025-06-17 11:45:38', 0, 0),
(1445, 1, 'inativo', '1879752', 'Fortune Snake', '1879752', 'Slots', NULL, 'Games/Pgsoft/1879752.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1000305, 1, 1, '2025-04-14 18:59:10', '2025-06-17 11:23:43', 0, 0),
(1446, 1, 'inativo', '1786529', 'Rio Fantasia', '1786529', 'Slots', NULL, 'Games/Pgsoft/1786529.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1000302, 1, 1, '2025-04-14 18:59:10', '2025-06-17 11:46:20', 0, 0),
(1447, 1, 'inativo', '1727711', 'Three Crazy Piggies', '1727711', 'Slots', NULL, 'Games/Pgsoft/1727711.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1000303, 1, 1, '2025-04-14 18:59:10', '2025-06-17 11:40:40', 0, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `games_keys`
--

CREATE TABLE `games_keys` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `playfiver_url` varchar(191) DEFAULT NULL,
  `playfiver_secret` varchar(191) DEFAULT NULL,
  `playfiver_code` varchar(191) DEFAULT NULL,
  `playfiver_token` varchar(191) DEFAULT NULL,
  `saldo_agente` decimal(10,2) NOT NULL DEFAULT '0.00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `games_keys`
--

INSERT INTO `games_keys` (`id`, `created_at`, `updated_at`, `playfiver_url`, `playfiver_secret`, `playfiver_code`, `playfiver_token`, `saldo_agente`) VALUES
(1, '2023-11-30 21:03:08', '2025-06-17 08:54:43', 'https://api.fivergames.com', 'Seu Agent Secret', 'Seu Agent Code', 'Seu Agent Token', 5000000.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `game_favorites`
--

CREATE TABLE `game_favorites` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `game_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Estrutura para tabela `game_likes`
--

CREATE TABLE `game_likes` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `game_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Estrutura para tabela `game_reviews`
--

CREATE TABLE `game_reviews` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `game_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` varchar(191) NOT NULL,
  `rating` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `gateways`
--

CREATE TABLE `gateways` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `suitpay_uri` varchar(191) DEFAULT NULL,
  `suitpay_cliente_id` varchar(191) DEFAULT NULL,
  `suitpay_cliente_secret` varchar(191) DEFAULT NULL,
  `stripe_production` tinyint(4) DEFAULT '0',
  `stripe_public_key` varchar(255) DEFAULT NULL,
  `stripe_secret_key` varchar(255) DEFAULT NULL,
  `stripe_webhook_key` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `public_key` varchar(191) DEFAULT NULL,
  `private_key` varchar(191) DEFAULT NULL,
  `ezzebank_uri` varchar(191) DEFAULT NULL,
  `ezzebank_cliente_id` varchar(191) DEFAULT NULL,
  `ezzebank_cliente_secret` varchar(191) DEFAULT NULL,
  `suitpay_split` varchar(191) NOT NULL,
  `suitpay_split_name` varchar(191) NOT NULL,
  `digitopay_uri` varchar(255) DEFAULT NULL,
  `digitopay_cliente_id` varchar(255) DEFAULT NULL,
  `digitopay_cliente_secret` varchar(255) DEFAULT NULL,
  `bspay_uri` varchar(255) DEFAULT NULL,
  `bspay_cliente_id` varchar(255) DEFAULT NULL,
  `bspay_cliente_secret` varchar(255) DEFAULT NULL,
  `ezze_user` varchar(255) DEFAULT NULL,
  `ezze_senha` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `gateways`
--

INSERT INTO `gateways` (`id`, `suitpay_uri`, `suitpay_cliente_id`, `suitpay_cliente_secret`, `stripe_production`, `stripe_public_key`, `stripe_secret_key`, `stripe_webhook_key`, `created_at`, `updated_at`, `public_key`, `private_key`, `ezzebank_uri`, `ezzebank_cliente_id`, `ezzebank_cliente_secret`, `suitpay_split`, `suitpay_split_name`, `digitopay_uri`, `digitopay_cliente_id`, `digitopay_cliente_secret`, `bspay_uri`, `bspay_cliente_id`, `bspay_cliente_secret`, `ezze_user`, `ezze_senha`) VALUES
(1, '', '', '', 0, NULL, NULL, NULL, '2023-11-30 21:05:51', '2025-06-17 08:57:17', NULL, NULL, '', '', '', '', '', '', '', '', 'https://api.brmasterpay.com.br/v2/', 'Seu CLIENTE ID', 'Seu CLIENTE SECRETO', '', '');

-- --------------------------------------------------------

--
-- Estrutura para tabela `ggds_spin_config`
--

CREATE TABLE `ggds_spin_config` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `prizes` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estrutura para tabela `ggds_spin_runs`
--

CREATE TABLE `ggds_spin_runs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `nonce` varchar(255) NOT NULL,
  `possibilities` text NOT NULL,
  `prize` varchar(191) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estrutura para tabela `ggr_games`
--

CREATE TABLE `ggr_games` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `provider` varchar(191) NOT NULL,
  `game` varchar(191) NOT NULL,
  `balance_bet` decimal(20,2) NOT NULL DEFAULT '0.00',
  `balance_win` decimal(20,2) NOT NULL DEFAULT '0.00',
  `currency` varchar(50) DEFAULT NULL,
  `aggregator` varchar(255) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `ggr_games`
--

INSERT INTO `ggr_games` (`id`, `user_id`, `provider`, `game`, `balance_bet`, `balance_win`, `currency`, `aggregator`, `type`, `created_at`, `updated_at`) VALUES
(1, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-19 19:45:07', '2025-03-19 19:45:07'),
(2, 123, 'PGSOFT', 'fortune-tiger', 0.40, 2.00, 'BRL', 'wordslot', 'loss', '2025-03-19 19:45:07', '2025-03-19 19:45:07'),
(3, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-19 19:45:18', '2025-03-19 19:45:18'),
(4, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.48, 'BRL', 'wordslot', 'loss', '2025-03-19 19:45:18', '2025-03-19 19:45:18'),
(5, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-19 20:19:07', '2025-03-19 20:19:07'),
(6, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.48, 'BRL', 'wordslot', 'loss', '2025-03-19 20:19:07', '2025-03-19 20:19:07'),
(7, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-19 20:19:11', '2025-03-19 20:19:11'),
(8, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.24, 'BRL', 'wordslot', 'loss', '2025-03-19 20:19:11', '2025-03-19 20:19:11'),
(9, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-19 20:19:13', '2025-03-19 20:19:13'),
(10, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-19 20:19:15', '2025-03-19 20:19:15'),
(11, 123, 'PGSOFT', 'fortune-tiger', 0.40, 1.20, 'BRL', 'wordslot', 'loss', '2025-03-19 20:19:15', '2025-03-19 20:19:15'),
(12, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-19 20:19:18', '2025-03-19 20:19:18'),
(13, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.40, 'BRL', 'wordslot', 'loss', '2025-03-19 20:19:18', '2025-03-19 20:19:18'),
(14, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-19 20:19:20', '2025-03-19 20:19:20'),
(15, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-19 20:19:22', '2025-03-19 20:19:22'),
(16, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.64, 'BRL', 'wordslot', 'loss', '2025-03-19 20:19:22', '2025-03-19 20:19:22'),
(17, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-19 20:19:25', '2025-03-19 20:19:25'),
(18, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.40, 'BRL', 'wordslot', 'loss', '2025-03-19 20:19:25', '2025-03-19 20:19:25'),
(19, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-19 20:19:27', '2025-03-19 20:19:27'),
(20, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.64, 'BRL', 'wordslot', 'loss', '2025-03-19 20:19:27', '2025-03-19 20:19:27'),
(21, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-19 20:19:30', '2025-03-19 20:19:30'),
(22, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.64, 'BRL', 'wordslot', 'loss', '2025-03-19 20:19:30', '2025-03-19 20:19:30'),
(23, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-19 20:19:35', '2025-03-19 20:19:35'),
(24, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.40, 'BRL', 'wordslot', 'loss', '2025-03-19 20:19:35', '2025-03-19 20:19:35'),
(25, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-19 20:19:38', '2025-03-19 20:19:38'),
(26, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-19 20:19:40', '2025-03-19 20:19:40'),
(27, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-19 20:19:41', '2025-03-19 20:19:41'),
(28, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.48, 'BRL', 'wordslot', 'loss', '2025-03-19 20:19:41', '2025-03-19 20:19:41'),
(29, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-19 20:19:44', '2025-03-19 20:19:44'),
(30, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.64, 'BRL', 'wordslot', 'loss', '2025-03-19 20:19:44', '2025-03-19 20:19:44'),
(31, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-19 20:19:46', '2025-03-19 20:19:46'),
(32, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.40, 'BRL', 'wordslot', 'loss', '2025-03-19 20:19:46', '2025-03-19 20:19:46'),
(33, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-19 20:19:48', '2025-03-19 20:19:48'),
(34, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.24, 'BRL', 'wordslot', 'loss', '2025-03-19 20:19:48', '2025-03-19 20:19:48'),
(35, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-19 20:19:50', '2025-03-19 20:19:50'),
(36, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-19 20:19:52', '2025-03-19 20:19:52'),
(37, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.64, 'BRL', 'wordslot', 'loss', '2025-03-19 20:19:52', '2025-03-19 20:19:52'),
(38, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-19 20:19:54', '2025-03-19 20:19:54'),
(39, 123, 'PGSOFT', 'fortune-tiger', 0.40, 2.00, 'BRL', 'wordslot', 'loss', '2025-03-19 20:19:54', '2025-03-19 20:19:54'),
(40, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-19 20:19:58', '2025-03-19 20:19:58'),
(41, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.80, 'BRL', 'wordslot', 'loss', '2025-03-19 20:19:58', '2025-03-19 20:19:58'),
(42, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-19 20:20:00', '2025-03-19 20:20:00'),
(43, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.24, 'BRL', 'wordslot', 'loss', '2025-03-19 20:20:00', '2025-03-19 20:20:00'),
(44, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-19 20:20:03', '2025-03-19 20:20:03'),
(45, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-19 20:20:05', '2025-03-19 20:20:05'),
(46, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.24, 'BRL', 'wordslot', 'loss', '2025-03-19 20:20:05', '2025-03-19 20:20:05'),
(47, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-19 20:20:08', '2025-03-19 20:20:08'),
(48, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.40, 'BRL', 'wordslot', 'loss', '2025-03-19 20:20:08', '2025-03-19 20:20:08'),
(49, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-19 20:20:10', '2025-03-19 20:20:10'),
(50, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.24, 'BRL', 'wordslot', 'loss', '2025-03-19 20:20:10', '2025-03-19 20:20:10'),
(51, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-19 20:20:13', '2025-03-19 20:20:13'),
(52, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.40, 'BRL', 'wordslot', 'loss', '2025-03-19 20:20:13', '2025-03-19 20:20:13'),
(53, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-19 20:20:15', '2025-03-19 20:20:15'),
(54, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.24, 'BRL', 'wordslot', 'loss', '2025-03-19 20:20:15', '2025-03-19 20:20:15'),
(55, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-19 20:20:18', '2025-03-19 20:20:18'),
(56, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.24, 'BRL', 'wordslot', 'loss', '2025-03-19 20:20:18', '2025-03-19 20:20:18'),
(57, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-19 20:20:22', '2025-03-19 20:20:22'),
(58, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.24, 'BRL', 'wordslot', 'loss', '2025-03-19 20:20:22', '2025-03-19 20:20:22'),
(59, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-19 20:20:26', '2025-03-19 20:20:26'),
(60, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.40, 'BRL', 'wordslot', 'loss', '2025-03-19 20:20:26', '2025-03-19 20:20:26'),
(61, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-19 20:44:11', '2025-03-19 20:44:11'),
(62, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-19 20:44:33', '2025-03-19 20:44:33'),
(63, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.64, 'BRL', 'wordslot', 'loss', '2025-03-19 20:44:33', '2025-03-19 20:44:33'),
(64, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-19 20:44:37', '2025-03-19 20:44:37'),
(65, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.88, 'BRL', 'wordslot', 'loss', '2025-03-19 20:44:37', '2025-03-19 20:44:37'),
(66, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-19 20:44:39', '2025-03-19 20:44:39'),
(67, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-19 20:44:41', '2025-03-19 20:44:41'),
(68, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.40, 'BRL', 'wordslot', 'loss', '2025-03-19 20:44:41', '2025-03-19 20:44:41'),
(69, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-19 20:44:43', '2025-03-19 20:44:43'),
(70, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.64, 'BRL', 'wordslot', 'loss', '2025-03-19 20:44:43', '2025-03-19 20:44:43'),
(71, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-19 20:53:25', '2025-03-19 20:53:25'),
(72, 123, 'PGSOFT', 'fortune-tiger', 0.40, 1.04, 'BRL', 'wordslot', 'loss', '2025-03-19 20:53:25', '2025-03-19 20:53:25'),
(73, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-19 20:56:19', '2025-03-19 20:56:19'),
(74, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.40, 'BRL', 'wordslot', 'loss', '2025-03-19 20:56:19', '2025-03-19 20:56:19'),
(75, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-19 20:58:26', '2025-03-19 20:58:26'),
(76, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-19 21:39:32', '2025-03-19 21:39:32'),
(77, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.64, 'BRL', 'wordslot', 'loss', '2025-03-19 21:39:32', '2025-03-19 21:39:32'),
(78, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-19 21:41:03', '2025-03-19 21:41:03'),
(79, 123, 'PGSOFT', 'fortune-tiger', 0.40, 20.00, 'BRL', 'wordslot', 'loss', '2025-03-19 21:41:03', '2025-03-19 21:41:03'),
(80, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-19 21:41:08', '2025-03-19 21:41:08'),
(81, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.40, 'BRL', 'wordslot', 'loss', '2025-03-19 21:41:08', '2025-03-19 21:41:08'),
(82, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-19 21:41:14', '2025-03-19 21:41:14'),
(83, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-19 21:41:17', '2025-03-19 21:41:17'),
(84, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.24, 'BRL', 'wordslot', 'loss', '2025-03-19 21:41:17', '2025-03-19 21:41:17'),
(85, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-19 21:41:38', '2025-03-19 21:41:38'),
(86, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.40, 'BRL', 'wordslot', 'loss', '2025-03-19 21:41:38', '2025-03-19 21:41:38'),
(87, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-19 22:25:24', '2025-03-19 22:25:24'),
(88, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.80, 'BRL', 'wordslot', 'loss', '2025-03-19 22:25:24', '2025-03-19 22:25:24'),
(89, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-19 23:23:18', '2025-03-19 23:23:18'),
(90, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.80, 'BRL', 'wordslot', 'loss', '2025-03-19 23:23:18', '2025-03-19 23:23:18'),
(91, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 00:57:17', '2025-03-20 00:57:17'),
(92, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 00:57:23', '2025-03-20 00:57:23'),
(93, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.40, 'BRL', 'wordslot', 'loss', '2025-03-20 00:57:23', '2025-03-20 00:57:23'),
(94, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 00:57:25', '2025-03-20 00:57:25'),
(95, 123, 'PGSOFT', 'fortune-tiger', 0.40, 1.60, 'BRL', 'wordslot', 'loss', '2025-03-20 00:57:25', '2025-03-20 00:57:25'),
(96, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 00:57:28', '2025-03-20 00:57:28'),
(97, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.24, 'BRL', 'wordslot', 'loss', '2025-03-20 00:57:28', '2025-03-20 00:57:28'),
(98, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 00:57:30', '2025-03-20 00:57:30'),
(99, 123, 'PGSOFT', 'wild-bandito', 12.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 15:28:18', '2025-03-20 15:28:18'),
(100, 123, 'PGSOFT', 'wild-bandito', 12.00, 0.60, 'BRL', 'wordslot', 'loss', '2025-03-20 15:28:18', '2025-03-20 15:28:18'),
(101, 123, 'PGSOFT', 'wild-bandito', 12.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 15:28:21', '2025-03-20 15:28:21'),
(102, 123, 'PGSOFT', 'wild-bandito', 12.00, 0.60, 'BRL', 'wordslot', 'loss', '2025-03-20 15:28:21', '2025-03-20 15:28:21'),
(103, 123, 'PGSOFT', 'wild-bandito', 12.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 15:28:24', '2025-03-20 15:28:24'),
(104, 123, 'PGSOFT', 'wild-bandito', 12.00, 0.60, 'BRL', 'wordslot', 'loss', '2025-03-20 15:28:24', '2025-03-20 15:28:24'),
(105, 123, 'PGSOFT', 'wild-bandito', 12.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 15:28:28', '2025-03-20 15:28:28'),
(106, 123, 'PGSOFT', 'wild-bandito', 12.00, 0.60, 'BRL', 'wordslot', 'loss', '2025-03-20 15:28:28', '2025-03-20 15:28:28'),
(107, 123, 'PGSOFT', 'wild-bandito', 12.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 15:28:31', '2025-03-20 15:28:31'),
(108, 123, 'PGSOFT', 'wild-bandito', 12.00, 0.60, 'BRL', 'wordslot', 'loss', '2025-03-20 15:28:32', '2025-03-20 15:28:32'),
(109, 123, 'PGSOFT', 'wild-bandito', 12.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 15:28:35', '2025-03-20 15:28:35'),
(110, 123, 'PGSOFT', 'wild-bandito', 12.00, 0.60, 'BRL', 'wordslot', 'loss', '2025-03-20 15:28:35', '2025-03-20 15:28:35'),
(111, 123, 'PGSOFT', 'wild-bandito', 12.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 15:28:38', '2025-03-20 15:28:38'),
(112, 123, 'PGSOFT', 'wild-bandito', 12.00, 0.60, 'BRL', 'wordslot', 'loss', '2025-03-20 15:28:38', '2025-03-20 15:28:38'),
(113, 123, 'PGSOFT', 'wild-bandito', 12.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 15:28:41', '2025-03-20 15:28:41'),
(114, 123, 'PGSOFT', 'wild-bandito', 12.00, 0.60, 'BRL', 'wordslot', 'loss', '2025-03-20 15:28:41', '2025-03-20 15:28:41'),
(115, 123, 'PGSOFT', 'wild-bandito', 12.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 15:28:44', '2025-03-20 15:28:44'),
(116, 123, 'PGSOFT', 'wild-bandito', 12.00, 0.60, 'BRL', 'wordslot', 'loss', '2025-03-20 15:28:44', '2025-03-20 15:28:44'),
(117, 123, 'PGSOFT', 'wild-bandito', 12.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 15:28:47', '2025-03-20 15:28:47'),
(118, 123, 'PGSOFT', 'wild-bandito', 12.00, 0.60, 'BRL', 'wordslot', 'loss', '2025-03-20 15:28:47', '2025-03-20 15:28:47'),
(119, 123, 'PGSOFT', 'wild-bandito', 12.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 15:28:50', '2025-03-20 15:28:50'),
(120, 123, 'PGSOFT', 'wild-bandito', 12.00, 0.60, 'BRL', 'wordslot', 'loss', '2025-03-20 15:28:50', '2025-03-20 15:28:50'),
(121, 123, 'PGSOFT', 'wild-bandito', 12.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 15:28:53', '2025-03-20 15:28:53'),
(122, 123, 'PGSOFT', 'wild-bandito', 12.00, 0.60, 'BRL', 'wordslot', 'loss', '2025-03-20 15:28:53', '2025-03-20 15:28:53'),
(123, 123, 'PGSOFT', 'wild-bandito', 12.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 15:28:57', '2025-03-20 15:28:57'),
(124, 123, 'PGSOFT', 'wild-bandito', 12.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 15:28:59', '2025-03-20 15:28:59'),
(125, 123, 'PGSOFT', 'wild-bandito', 12.00, 0.60, 'BRL', 'wordslot', 'loss', '2025-03-20 15:28:59', '2025-03-20 15:28:59'),
(126, 123, 'PGSOFT', 'wild-bandito', 12.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 15:29:02', '2025-03-20 15:29:02'),
(127, 123, 'PGSOFT', 'wild-bandito', 12.00, 0.60, 'BRL', 'wordslot', 'loss', '2025-03-20 15:29:02', '2025-03-20 15:29:02'),
(128, 123, 'PGSOFT', 'ultimate-striker', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 15:34:08', '2025-03-20 15:34:08'),
(129, 123, 'PGSOFT', 'ultimate-striker', 0.40, 2.00, 'BRL', 'wordslot', 'loss', '2025-03-20 15:34:08', '2025-03-20 15:34:08'),
(130, 123, 'PGSOFT', 'ultimate-striker', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 15:34:14', '2025-03-20 15:34:14'),
(131, 123, 'PGSOFT', 'ultimate-striker', 0.40, 2.00, 'BRL', 'wordslot', 'loss', '2025-03-20 15:34:14', '2025-03-20 15:34:14'),
(132, 123, 'PGSOFT', 'ultimate-striker', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 15:34:18', '2025-03-20 15:34:18'),
(133, 123, 'PGSOFT', 'ultimate-striker', 0.40, 2.00, 'BRL', 'wordslot', 'loss', '2025-03-20 15:34:18', '2025-03-20 15:34:18'),
(134, 123, 'PGSOFT', 'ultimate-striker', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 15:34:21', '2025-03-20 15:34:21'),
(135, 123, 'PGSOFT', 'ultimate-striker', 0.40, 2.00, 'BRL', 'wordslot', 'loss', '2025-03-20 15:34:21', '2025-03-20 15:34:21'),
(136, 123, 'PGSOFT', 'ultimate-striker', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 15:34:25', '2025-03-20 15:34:25'),
(137, 123, 'PGSOFT', 'ultimate-striker', 0.40, 2.00, 'BRL', 'wordslot', 'loss', '2025-03-20 15:34:25', '2025-03-20 15:34:25'),
(138, 123, 'PGSOFT', 'ultimate-striker', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 15:34:28', '2025-03-20 15:34:28'),
(139, 123, 'PGSOFT', 'ultimate-striker', 0.40, 2.00, 'BRL', 'wordslot', 'loss', '2025-03-20 15:34:28', '2025-03-20 15:34:28'),
(140, 123, 'PGSOFT', 'ultimate-striker', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 15:34:33', '2025-03-20 15:34:33'),
(141, 123, 'PGSOFT', 'ultimate-striker', 0.40, 2.00, 'BRL', 'wordslot', 'loss', '2025-03-20 15:34:33', '2025-03-20 15:34:33'),
(142, 123, 'PGSOFT', 'fortune-dragon', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 15:35:03', '2025-03-20 15:35:03'),
(143, 123, 'PGSOFT', 'fortune-dragon', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 15:35:20', '2025-03-20 15:35:20'),
(144, 123, 'PGSOFT', 'fortune-dragon', 0.40, 0.16, 'BRL', 'wordslot', 'loss', '2025-03-20 15:35:20', '2025-03-20 15:35:20'),
(145, 123, 'PGSOFT', 'fortune-rabbit', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 15:38:01', '2025-03-20 15:38:01'),
(146, 123, 'PGSOFT', 'fortune-rabbit', 0.40, 0.40, 'BRL', 'wordslot', 'loss', '2025-03-20 15:38:01', '2025-03-20 15:38:01'),
(147, 123, 'PGSOFT', 'fortune-rabbit', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 15:38:09', '2025-03-20 15:38:09'),
(148, 123, 'PGSOFT', 'fortune-rabbit', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 15:38:40', '2025-03-20 15:38:40'),
(149, 123, 'PGSOFT', 'fortune-rabbit', 0.40, 0.16, 'BRL', 'wordslot', 'loss', '2025-03-20 15:38:40', '2025-03-20 15:38:40'),
(150, 123, 'PGSOFT', 'fortune-rabbit', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 15:38:47', '2025-03-20 15:38:47'),
(151, 123, 'PGSOFT', 'fortune-rabbit', 0.40, 1.60, 'BRL', 'wordslot', 'loss', '2025-03-20 15:38:47', '2025-03-20 15:38:47'),
(152, 123, 'PGSOFT', 'fortune-mouse', 0.50, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 15:39:39', '2025-03-20 15:39:39'),
(153, 123, 'PGSOFT', 'fortune-mouse', 0.50, 1.50, 'BRL', 'wordslot', 'loss', '2025-03-20 15:39:39', '2025-03-20 15:39:39'),
(154, 123, 'PGSOFT', 'fortune-mouse', 0.50, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 15:39:46', '2025-03-20 15:39:46'),
(155, 123, 'PGSOFT', 'fortune-mouse', 0.50, 0.30, 'BRL', 'wordslot', 'loss', '2025-03-20 15:39:46', '2025-03-20 15:39:46'),
(156, 123, 'PGSOFT', 'fortune-mouse', 0.50, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 15:39:51', '2025-03-20 15:39:51'),
(157, 123, 'PGSOFT', 'fortune-mouse', 0.50, 3.00, 'BRL', 'wordslot', 'loss', '2025-03-20 15:39:51', '2025-03-20 15:39:51'),
(158, 123, 'PGSOFT', 'ninja-raccoon', 18.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 15:40:22', '2025-03-20 15:40:22'),
(159, 123, 'PGSOFT', 'ninja-raccoon', 18.00, 0.60, 'BRL', 'wordslot', 'loss', '2025-03-20 15:40:22', '2025-03-20 15:40:22'),
(160, 123, 'PGSOFT', 'ninja-raccoon', 18.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 15:40:28', '2025-03-20 15:40:28'),
(161, 123, 'PGSOFT', 'ninja-raccoon', 18.00, 0.60, 'BRL', 'wordslot', 'loss', '2025-03-20 15:40:28', '2025-03-20 15:40:28'),
(162, 123, 'PGSOFT', 'ninja-raccoon', 0.90, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 15:40:36', '2025-03-20 15:40:36'),
(163, 123, 'PGSOFT', 'ninja-raccoon', 0.90, 0.03, 'BRL', 'wordslot', 'loss', '2025-03-20 15:40:36', '2025-03-20 15:40:36'),
(164, 123, 'PGSOFT', 'ninja-raccoon', 0.90, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 15:40:40', '2025-03-20 15:40:40'),
(165, 123, 'PGSOFT', 'ninja-raccoon', 0.90, 0.03, 'BRL', 'wordslot', 'loss', '2025-03-20 15:40:40', '2025-03-20 15:40:40'),
(166, 123, 'PGSOFT', 'lucky-clover', 0.60, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 15:41:12', '2025-03-20 15:41:12'),
(167, 123, 'PGSOFT', 'lucky-clover', 0.60, 0.03, 'BRL', 'wordslot', 'loss', '2025-03-20 15:41:12', '2025-03-20 15:41:12'),
(168, 123, 'PGSOFT', 'lucky-clover', 0.60, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 15:41:16', '2025-03-20 15:41:16'),
(169, 123, 'PGSOFT', 'lucky-clover', 0.60, 0.03, 'BRL', 'wordslot', 'loss', '2025-03-20 15:41:16', '2025-03-20 15:41:16'),
(170, 123, 'PGSOFT', 'lucky-clover', 0.60, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 15:41:21', '2025-03-20 15:41:21'),
(171, 123, 'PGSOFT', 'lucky-clover', 0.60, 0.03, 'BRL', 'wordslot', 'loss', '2025-03-20 15:41:21', '2025-03-20 15:41:21'),
(172, 123, 'PGSOFT', 'lucky-clover', 0.60, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 15:41:24', '2025-03-20 15:41:24'),
(173, 123, 'PGSOFT', 'lucky-clover', 0.60, 0.03, 'BRL', 'wordslot', 'loss', '2025-03-20 15:41:24', '2025-03-20 15:41:24'),
(174, 123, 'PGSOFT', 'lucky-clover', 0.60, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 15:41:36', '2025-03-20 15:41:36'),
(175, 123, 'PGSOFT', 'lucky-clover', 0.60, 0.03, 'BRL', 'wordslot', 'loss', '2025-03-20 15:41:36', '2025-03-20 15:41:36'),
(176, 123, 'PGSOFT', 'lucky-clover', 0.60, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 15:41:38', '2025-03-20 15:41:38'),
(177, 123, 'PGSOFT', 'lucky-clover', 0.60, 0.03, 'BRL', 'wordslot', 'loss', '2025-03-20 15:41:38', '2025-03-20 15:41:38'),
(178, 123, 'PGSOFT', 'majestic-ts', 0.60, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 15:48:35', '2025-03-20 15:48:35'),
(179, 123, 'PGSOFT', 'majestic-ts', 0.60, 0.03, 'BRL', 'wordslot', 'loss', '2025-03-20 15:48:35', '2025-03-20 15:48:35'),
(180, 123, 'PGSOFT', 'majestic-ts', 0.60, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 15:48:38', '2025-03-20 15:48:38'),
(181, 123, 'PGSOFT', 'majestic-ts', 0.60, 0.03, 'BRL', 'wordslot', 'loss', '2025-03-20 15:48:38', '2025-03-20 15:48:38'),
(182, 123, 'PGSOFT', 'majestic-ts', 0.60, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 15:48:42', '2025-03-20 15:48:42'),
(183, 123, 'PGSOFT', 'majestic-ts', 0.60, 0.03, 'BRL', 'wordslot', 'loss', '2025-03-20 15:48:42', '2025-03-20 15:48:42'),
(184, 123, 'PGSOFT', 'majestic-ts', 0.60, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 15:48:45', '2025-03-20 15:48:45'),
(185, 123, 'PGSOFT', 'majestic-ts', 0.60, 0.03, 'BRL', 'wordslot', 'loss', '2025-03-20 15:48:45', '2025-03-20 15:48:45'),
(186, 123, 'PGSOFT', 'majestic-ts', 0.60, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 15:48:49', '2025-03-20 15:48:49'),
(187, 123, 'PGSOFT', 'majestic-ts', 0.60, 0.03, 'BRL', 'wordslot', 'loss', '2025-03-20 15:48:49', '2025-03-20 15:48:49'),
(188, 123, 'PGSOFT', 'majestic-ts', 0.60, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 15:48:52', '2025-03-20 15:48:52'),
(189, 123, 'PGSOFT', 'majestic-ts', 0.60, 0.03, 'BRL', 'wordslot', 'loss', '2025-03-20 15:48:52', '2025-03-20 15:48:52'),
(190, 123, 'PGSOFT', 'majestic-ts', 0.60, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 15:48:56', '2025-03-20 15:48:56'),
(191, 123, 'PGSOFT', 'majestic-ts', 0.60, 0.03, 'BRL', 'wordslot', 'loss', '2025-03-20 15:48:56', '2025-03-20 15:48:56'),
(192, 123, 'PGSOFT', 'majestic-ts', 0.60, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 15:48:59', '2025-03-20 15:48:59'),
(193, 123, 'PGSOFT', 'majestic-ts', 0.60, 0.03, 'BRL', 'wordslot', 'loss', '2025-03-20 15:48:59', '2025-03-20 15:48:59'),
(194, 123, 'PGSOFT', 'majestic-ts', 0.60, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 15:49:03', '2025-03-20 15:49:03'),
(195, 123, 'PGSOFT', 'majestic-ts', 0.60, 0.03, 'BRL', 'wordslot', 'loss', '2025-03-20 15:49:03', '2025-03-20 15:49:03'),
(196, 123, 'PGSOFT', 'majestic-ts', 0.60, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 15:49:05', '2025-03-20 15:49:05'),
(197, 123, 'PGSOFT', 'majestic-ts', 0.60, 0.03, 'BRL', 'wordslot', 'loss', '2025-03-20 15:49:05', '2025-03-20 15:49:05'),
(198, 123, 'PGSOFT', 'gdn-ice-fire', 0.60, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 15:50:04', '2025-03-20 15:50:04'),
(199, 123, 'PGSOFT', 'gdn-ice-fire', 0.60, 0.54, 'BRL', 'wordslot', 'loss', '2025-03-20 15:50:04', '2025-03-20 15:50:04'),
(200, 123, 'PGSOFT', 'gdn-ice-fire', 0.60, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 15:50:15', '2025-03-20 15:50:15'),
(201, 123, 'PGSOFT', 'gdn-ice-fire', 0.60, 0.18, 'BRL', 'wordslot', 'loss', '2025-03-20 15:50:15', '2025-03-20 15:50:15'),
(202, 123, 'PGSOFT', 'gdn-ice-fire', 0.60, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 15:50:18', '2025-03-20 15:50:18'),
(203, 123, 'PGSOFT', 'gdn-ice-fire', 0.60, 0.36, 'BRL', 'wordslot', 'loss', '2025-03-20 15:50:18', '2025-03-20 15:50:18'),
(204, 123, 'PGSOFT', 'dragon-tiger-luck', 1.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 15:52:32', '2025-03-20 15:52:32'),
(205, 123, 'PGSOFT', 'dragon-tiger-luck', 1.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 15:52:34', '2025-03-20 15:52:34'),
(206, 123, 'PGSOFT', 'dragon-tiger-luck', 1.00, 2.50, 'BRL', 'wordslot', 'loss', '2025-03-20 15:52:34', '2025-03-20 15:52:34'),
(207, 123, 'PGSOFT', 'dragon-tiger-luck', 1.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 15:52:39', '2025-03-20 15:52:39'),
(208, 123, 'PGSOFT', 'dragon-tiger-luck', 1.00, 2.50, 'BRL', 'wordslot', 'loss', '2025-03-20 15:52:39', '2025-03-20 15:52:39'),
(209, 123, 'PGSOFT', 'dragon-tiger-luck', 1.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 15:52:42', '2025-03-20 15:52:42'),
(210, 123, 'PGSOFT', 'dragon-tiger-luck', 1.00, 2.50, 'BRL', 'wordslot', 'loss', '2025-03-20 15:52:42', '2025-03-20 15:52:42'),
(211, 123, 'PGSOFT', 'dragon-tiger-luck', 1.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 15:52:45', '2025-03-20 15:52:45'),
(212, 123, 'PGSOFT', 'dragon-tiger-luck', 1.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 15:52:47', '2025-03-20 15:52:47'),
(213, 123, 'PGSOFT', 'dragon-tiger-luck', 1.00, 2.50, 'BRL', 'wordslot', 'loss', '2025-03-20 15:52:47', '2025-03-20 15:52:47'),
(214, 123, 'PGSOFT', 'three-cz-pigs', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 16:08:37', '2025-03-20 16:08:37'),
(215, 123, 'PGSOFT', 'dragon-tiger-luck', 1.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 16:33:32', '2025-03-20 16:33:32'),
(216, 123, 'PGSOFT', 'rise-apollo', 0.60, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 16:34:53', '2025-03-20 16:34:53'),
(217, 123, 'PGSOFT', 'gdn-ice-fire', 0.60, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 16:35:59', '2025-03-20 16:35:59'),
(218, 123, 'PGSOFT', 'gdn-ice-fire', 0.60, 0.09, 'BRL', 'wordslot', 'loss', '2025-03-20 16:35:59', '2025-03-20 16:35:59'),
(219, 123, 'PGSOFT', 'gdn-ice-fire', 0.60, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 16:36:02', '2025-03-20 16:36:02'),
(220, 123, 'PGSOFT', 'gdn-ice-fire', 0.60, 0.11, 'BRL', 'wordslot', 'loss', '2025-03-20 16:36:02', '2025-03-20 16:36:02'),
(221, 123, 'PGSOFT', 'majestic-ts', 12.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 16:36:19', '2025-03-20 16:36:19'),
(222, 123, 'PGSOFT', 'majestic-ts', 12.00, 0.60, 'BRL', 'wordslot', 'loss', '2025-03-20 16:36:19', '2025-03-20 16:36:19'),
(223, 123, 'PGSOFT', 'majestic-ts', 12.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 16:36:22', '2025-03-20 16:36:22'),
(224, 123, 'PGSOFT', 'majestic-ts', 12.00, 0.60, 'BRL', 'wordslot', 'loss', '2025-03-20 16:36:22', '2025-03-20 16:36:22'),
(225, 123, 'PGSOFT', 'majestic-ts', 12.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 16:36:26', '2025-03-20 16:36:26'),
(226, 123, 'PGSOFT', 'majestic-ts', 12.00, 0.60, 'BRL', 'wordslot', 'loss', '2025-03-20 16:36:26', '2025-03-20 16:36:26'),
(227, 123, 'PGSOFT', 'majestic-ts', 12.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 16:36:29', '2025-03-20 16:36:29'),
(228, 123, 'PGSOFT', 'majestic-ts', 12.00, 0.60, 'BRL', 'wordslot', 'loss', '2025-03-20 16:36:29', '2025-03-20 16:36:29'),
(229, 123, 'PGSOFT', 'lucky-clover', 0.60, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 16:40:36', '2025-03-20 16:40:36'),
(230, 123, 'PGSOFT', 'lucky-clover', 0.60, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 16:40:43', '2025-03-20 16:40:43'),
(231, 123, 'PGSOFT', 'ninja-raccoon', 0.90, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 16:45:24', '2025-03-20 16:45:24'),
(232, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 16:45:45', '2025-03-20 16:45:45'),
(233, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.64, 'BRL', 'wordslot', 'loss', '2025-03-20 16:45:45', '2025-03-20 16:45:45'),
(234, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 16:45:52', '2025-03-20 16:45:52'),
(235, 123, 'PGSOFT', 'fortune-ox', 0.50, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 16:46:13', '2025-03-20 16:46:13'),
(236, 123, 'PGSOFT', 'fortune-ox', 0.50, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 16:46:21', '2025-03-20 16:46:21'),
(237, 123, 'PGSOFT', 'fortune-ox', 0.50, 10.00, 'BRL', 'wordslot', 'loss', '2025-03-20 16:46:21', '2025-03-20 16:46:21'),
(238, 123, 'PGSOFT', 'fortune-mouse', 0.50, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 16:46:41', '2025-03-20 16:46:41'),
(239, 123, 'PGSOFT', 'fortune-mouse', 0.50, 3.00, 'BRL', 'wordslot', 'loss', '2025-03-20 16:46:41', '2025-03-20 16:46:41'),
(240, 123, 'PGSOFT', 'fortune-rabbit', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 16:47:37', '2025-03-20 16:47:37'),
(241, 123, 'PGSOFT', 'fortune-rabbit', 0.40, 0.24, 'BRL', 'wordslot', 'loss', '2025-03-20 16:47:37', '2025-03-20 16:47:37'),
(242, 123, 'PGSOFT', 'fortune-dragon', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 16:48:00', '2025-03-20 16:48:00'),
(243, 123, 'PGSOFT', 'fortune-dragon', 0.40, 2.00, 'BRL', 'wordslot', 'loss', '2025-03-20 16:48:00', '2025-03-20 16:48:00'),
(244, 123, 'PGSOFT', 'fortune-dragon', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 16:48:07', '2025-03-20 16:48:07'),
(245, 123, 'PGSOFT', 'fortune-dragon', 0.40, 2.00, 'BRL', 'wordslot', 'loss', '2025-03-20 16:48:07', '2025-03-20 16:48:07'),
(246, 123, 'PGSOFT', 'ultimate-striker', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 16:49:39', '2025-03-20 16:49:39'),
(247, 123, 'PGSOFT', 'wild-bandito', 0.60, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 16:53:20', '2025-03-20 16:53:20'),
(248, 123, 'PGSOFT', 'wild-bandito', 0.60, 0.03, 'BRL', 'wordslot', 'loss', '2025-03-20 16:53:20', '2025-03-20 16:53:20'),
(249, 123, 'PGSOFT', 'wild-bandito', 0.60, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 16:53:23', '2025-03-20 16:53:23'),
(250, 123, 'PGSOFT', 'wild-bandito', 0.60, 0.03, 'BRL', 'wordslot', 'loss', '2025-03-20 16:53:23', '2025-03-20 16:53:23'),
(251, 123, 'PGSOFT', 'wild-bandito', 0.60, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 16:53:26', '2025-03-20 16:53:26'),
(252, 123, 'PGSOFT', 'wild-bandito', 0.60, 0.03, 'BRL', 'wordslot', 'loss', '2025-03-20 16:53:26', '2025-03-20 16:53:26'),
(253, 123, 'PGSOFT', 'wild-bandito', 0.60, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 16:53:58', '2025-03-20 16:53:58'),
(254, 123, 'PGSOFT', 'wild-bandito', 0.60, 0.03, 'BRL', 'wordslot', 'loss', '2025-03-20 16:53:58', '2025-03-20 16:53:58'),
(255, 123, 'PGSOFT', 'wild-bandito', 0.60, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 16:54:02', '2025-03-20 16:54:02'),
(256, 123, 'PGSOFT', 'wild-bandito', 0.60, 0.03, 'BRL', 'wordslot', 'loss', '2025-03-20 16:54:02', '2025-03-20 16:54:02'),
(257, 123, 'PGSOFT', 'wild-bandito', 0.60, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 16:54:05', '2025-03-20 16:54:05'),
(258, 123, 'PGSOFT', 'wild-bandito', 0.60, 0.03, 'BRL', 'wordslot', 'loss', '2025-03-20 16:54:05', '2025-03-20 16:54:05'),
(259, 123, 'PGSOFT', 'cash-mania', 0.50, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 16:56:01', '2025-03-20 16:56:01'),
(260, 123, 'PGSOFT', 'cash-mania', 0.50, 4.50, 'BRL', 'wordslot', 'loss', '2025-03-20 16:56:01', '2025-03-20 16:56:01'),
(261, 123, 'PGSOFT', 'cash-mania', 0.50, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 16:56:10', '2025-03-20 16:56:10'),
(262, 123, 'PGSOFT', 'cash-mania', 0.50, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 16:56:44', '2025-03-20 16:56:44'),
(263, 123, 'PGSOFT', 'cash-mania', 0.50, 0.90, 'BRL', 'wordslot', 'loss', '2025-03-20 16:56:44', '2025-03-20 16:56:44'),
(264, 123, 'PGSOFT', 'cash-mania', 0.50, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 16:56:49', '2025-03-20 16:56:49'),
(265, 123, 'PGSOFT', 'cash-mania', 0.50, 45.00, 'BRL', 'wordslot', 'loss', '2025-03-20 16:56:49', '2025-03-20 16:56:49'),
(266, 123, 'PGSOFT', 'ultimate-striker', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:36:12', '2025-03-20 17:36:12'),
(267, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:49:25', '2025-03-20 17:49:25'),
(268, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.48, 'BRL', 'wordslot', 'loss', '2025-03-20 17:49:25', '2025-03-20 17:49:25'),
(269, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:49:41', '2025-03-20 17:49:41'),
(270, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:49:46', '2025-03-20 17:49:46'),
(271, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.24, 'BRL', 'wordslot', 'loss', '2025-03-20 17:49:46', '2025-03-20 17:49:46'),
(272, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:49:52', '2025-03-20 17:49:52'),
(273, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:49:56', '2025-03-20 17:49:56'),
(274, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.80, 'BRL', 'wordslot', 'loss', '2025-03-20 17:49:56', '2025-03-20 17:49:56'),
(275, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:49:57', '2025-03-20 17:49:57'),
(276, 123, 'PGSOFT', 'fortune-tiger', 0.40, 2.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:49:57', '2025-03-20 17:49:57'),
(277, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:50:03', '2025-03-20 17:50:03'),
(278, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.80, 'BRL', 'wordslot', 'loss', '2025-03-20 17:50:03', '2025-03-20 17:50:03'),
(279, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:50:04', '2025-03-20 17:50:04'),
(280, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.80, 'BRL', 'wordslot', 'loss', '2025-03-20 17:50:04', '2025-03-20 17:50:04'),
(281, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:50:07', '2025-03-20 17:50:07'),
(282, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.80, 'BRL', 'wordslot', 'loss', '2025-03-20 17:50:07', '2025-03-20 17:50:07'),
(283, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:50:10', '2025-03-20 17:50:10'),
(284, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.40, 'BRL', 'wordslot', 'loss', '2025-03-20 17:50:10', '2025-03-20 17:50:10'),
(285, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:50:26', '2025-03-20 17:50:26'),
(286, 123, 'PGSOFT', 'fortune-tiger', 0.40, 9.04, 'BRL', 'wordslot', 'loss', '2025-03-20 17:50:26', '2025-03-20 17:50:26'),
(287, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:50:44', '2025-03-20 17:50:44'),
(288, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:50:48', '2025-03-20 17:50:48'),
(289, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:50:50', '2025-03-20 17:50:50'),
(290, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.24, 'BRL', 'wordslot', 'loss', '2025-03-20 17:50:50', '2025-03-20 17:50:50'),
(291, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:50:51', '2025-03-20 17:50:51'),
(292, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.40, 'BRL', 'wordslot', 'loss', '2025-03-20 17:50:51', '2025-03-20 17:50:51'),
(293, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:50:56', '2025-03-20 17:50:56'),
(294, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:51:00', '2025-03-20 17:51:00'),
(295, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.24, 'BRL', 'wordslot', 'loss', '2025-03-20 17:51:00', '2025-03-20 17:51:00'),
(296, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:51:06', '2025-03-20 17:51:06'),
(297, 144, 'PGSOFT', 'fortune-tiger', 0.40, 10.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:51:06', '2025-03-20 17:51:06'),
(298, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:51:10', '2025-03-20 17:51:10'),
(299, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.24, 'BRL', 'wordslot', 'loss', '2025-03-20 17:51:10', '2025-03-20 17:51:10'),
(300, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:51:13', '2025-03-20 17:51:13'),
(301, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:51:19', '2025-03-20 17:51:19'),
(302, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:51:21', '2025-03-20 17:51:21'),
(303, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.24, 'BRL', 'wordslot', 'loss', '2025-03-20 17:51:21', '2025-03-20 17:51:21'),
(304, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:51:35', '2025-03-20 17:51:35'),
(305, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.40, 'BRL', 'wordslot', 'loss', '2025-03-20 17:51:35', '2025-03-20 17:51:35'),
(306, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:51:37', '2025-03-20 17:51:37'),
(307, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:51:39', '2025-03-20 17:51:39'),
(308, 123, 'PGSOFT', 'fortune-tiger', 0.40, 1.92, 'BRL', 'wordslot', 'loss', '2025-03-20 17:51:39', '2025-03-20 17:51:39'),
(309, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:51:40', '2025-03-20 17:51:40'),
(310, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.40, 'BRL', 'wordslot', 'loss', '2025-03-20 17:51:40', '2025-03-20 17:51:40'),
(311, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:51:42', '2025-03-20 17:51:42'),
(312, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.24, 'BRL', 'wordslot', 'loss', '2025-03-20 17:51:42', '2025-03-20 17:51:42'),
(313, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:51:44', '2025-03-20 17:51:44'),
(314, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.24, 'BRL', 'wordslot', 'loss', '2025-03-20 17:51:44', '2025-03-20 17:51:44'),
(315, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:51:47', '2025-03-20 17:51:47'),
(316, 123, 'PGSOFT', 'fortune-tiger', 0.40, 8.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:51:47', '2025-03-20 17:51:47'),
(317, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:51:48', '2025-03-20 17:51:48'),
(318, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.24, 'BRL', 'wordslot', 'loss', '2025-03-20 17:51:48', '2025-03-20 17:51:48'),
(319, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:51:53', '2025-03-20 17:51:53'),
(320, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:52:21', '2025-03-20 17:52:21'),
(321, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:52:25', '2025-03-20 17:52:25'),
(322, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.40, 'BRL', 'wordslot', 'loss', '2025-03-20 17:52:25', '2025-03-20 17:52:25'),
(323, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:52:28', '2025-03-20 17:52:28'),
(324, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:52:29', '2025-03-20 17:52:29'),
(325, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.40, 'BRL', 'wordslot', 'loss', '2025-03-20 17:52:29', '2025-03-20 17:52:29'),
(326, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:52:33', '2025-03-20 17:52:33'),
(327, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:52:34', '2025-03-20 17:52:34'),
(328, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.80, 'BRL', 'wordslot', 'loss', '2025-03-20 17:52:34', '2025-03-20 17:52:34'),
(329, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:52:35', '2025-03-20 17:52:35'),
(330, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:52:37', '2025-03-20 17:52:37'),
(331, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:52:40', '2025-03-20 17:52:40'),
(332, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.24, 'BRL', 'wordslot', 'loss', '2025-03-20 17:52:40', '2025-03-20 17:52:40'),
(333, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:52:47', '2025-03-20 17:52:47'),
(334, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:52:47', '2025-03-20 17:52:47'),
(335, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:52:53', '2025-03-20 17:52:53'),
(336, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.24, 'BRL', 'wordslot', 'loss', '2025-03-20 17:52:53', '2025-03-20 17:52:53'),
(337, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:53:00', '2025-03-20 17:53:00'),
(338, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.40, 'BRL', 'wordslot', 'loss', '2025-03-20 17:53:00', '2025-03-20 17:53:00'),
(339, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:53:04', '2025-03-20 17:53:04'),
(340, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:53:05', '2025-03-20 17:53:05'),
(341, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.40, 'BRL', 'wordslot', 'loss', '2025-03-20 17:53:05', '2025-03-20 17:53:05'),
(342, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:53:08', '2025-03-20 17:53:08'),
(343, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.64, 'BRL', 'wordslot', 'loss', '2025-03-20 17:53:08', '2025-03-20 17:53:08'),
(344, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:53:09', '2025-03-20 17:53:09'),
(345, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:53:12', '2025-03-20 17:53:12'),
(346, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.24, 'BRL', 'wordslot', 'loss', '2025-03-20 17:53:12', '2025-03-20 17:53:12'),
(347, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:53:16', '2025-03-20 17:53:16'),
(348, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.48, 'BRL', 'wordslot', 'loss', '2025-03-20 17:53:16', '2025-03-20 17:53:16'),
(349, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:53:21', '2025-03-20 17:53:21'),
(350, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.80, 'BRL', 'wordslot', 'loss', '2025-03-20 17:53:21', '2025-03-20 17:53:21'),
(351, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:53:50', '2025-03-20 17:53:50'),
(352, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.40, 'BRL', 'wordslot', 'loss', '2025-03-20 17:53:50', '2025-03-20 17:53:50'),
(353, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:53:54', '2025-03-20 17:53:54'),
(354, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.80, 'BRL', 'wordslot', 'loss', '2025-03-20 17:53:54', '2025-03-20 17:53:54'),
(355, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:53:56', '2025-03-20 17:53:56'),
(356, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.40, 'BRL', 'wordslot', 'loss', '2025-03-20 17:53:56', '2025-03-20 17:53:56'),
(357, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:53:58', '2025-03-20 17:53:58'),
(358, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.40, 'BRL', 'wordslot', 'loss', '2025-03-20 17:53:58', '2025-03-20 17:53:58'),
(359, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:53:59', '2025-03-20 17:53:59'),
(360, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.40, 'BRL', 'wordslot', 'loss', '2025-03-20 17:53:59', '2025-03-20 17:53:59'),
(361, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:54:02', '2025-03-20 17:54:02'),
(362, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.80, 'BRL', 'wordslot', 'loss', '2025-03-20 17:54:02', '2025-03-20 17:54:02'),
(363, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:54:03', '2025-03-20 17:54:03'),
(364, 144, 'PGSOFT', 'fortune-tiger', 0.40, 2.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:54:03', '2025-03-20 17:54:03'),
(365, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:54:04', '2025-03-20 17:54:04'),
(366, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.24, 'BRL', 'wordslot', 'loss', '2025-03-20 17:54:04', '2025-03-20 17:54:04'),
(367, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:54:08', '2025-03-20 17:54:08'),
(368, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.40, 'BRL', 'wordslot', 'loss', '2025-03-20 17:54:08', '2025-03-20 17:54:08'),
(369, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:54:10', '2025-03-20 17:54:10'),
(370, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:54:11', '2025-03-20 17:54:11'),
(371, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:54:15', '2025-03-20 17:54:15'),
(372, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:54:15', '2025-03-20 17:54:15'),
(373, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:54:18', '2025-03-20 17:54:18'),
(374, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.24, 'BRL', 'wordslot', 'loss', '2025-03-20 17:54:18', '2025-03-20 17:54:18'),
(375, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:54:19', '2025-03-20 17:54:19'),
(376, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:54:21', '2025-03-20 17:54:21'),
(377, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.64, 'BRL', 'wordslot', 'loss', '2025-03-20 17:54:21', '2025-03-20 17:54:21'),
(378, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:54:23', '2025-03-20 17:54:23'),
(379, 144, 'PGSOFT', 'fortune-tiger', 0.40, 2.24, 'BRL', 'wordslot', 'loss', '2025-03-20 17:54:23', '2025-03-20 17:54:23'),
(380, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:54:24', '2025-03-20 17:54:24'),
(381, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:54:28', '2025-03-20 17:54:28'),
(382, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.80, 'BRL', 'wordslot', 'loss', '2025-03-20 17:54:28', '2025-03-20 17:54:28'),
(383, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:54:31', '2025-03-20 17:54:31'),
(384, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.64, 'BRL', 'wordslot', 'loss', '2025-03-20 17:54:31', '2025-03-20 17:54:31'),
(385, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:54:31', '2025-03-20 17:54:31'),
(386, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:54:33', '2025-03-20 17:54:33'),
(387, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.40, 'BRL', 'wordslot', 'loss', '2025-03-20 17:54:33', '2025-03-20 17:54:33'),
(388, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:54:35', '2025-03-20 17:54:35'),
(389, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:54:36', '2025-03-20 17:54:36'),
(390, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.24, 'BRL', 'wordslot', 'loss', '2025-03-20 17:54:36', '2025-03-20 17:54:36'),
(391, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:54:38', '2025-03-20 17:54:38'),
(392, 123, 'PGSOFT', 'fortune-tiger', 0.40, 8.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:54:38', '2025-03-20 17:54:38'),
(393, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:54:38', '2025-03-20 17:54:38'),
(394, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:54:42', '2025-03-20 17:54:42'),
(395, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:54:46', '2025-03-20 17:54:46'),
(396, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.48, 'BRL', 'wordslot', 'loss', '2025-03-20 17:54:46', '2025-03-20 17:54:46'),
(397, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:54:57', '2025-03-20 17:54:57'),
(398, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.24, 'BRL', 'wordslot', 'loss', '2025-03-20 17:54:57', '2025-03-20 17:54:57'),
(399, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:55:20', '2025-03-20 17:55:20'),
(400, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:55:22', '2025-03-20 17:55:22'),
(401, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:55:25', '2025-03-20 17:55:25'),
(402, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:55:27', '2025-03-20 17:55:27'),
(403, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:55:30', '2025-03-20 17:55:30'),
(404, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:55:32', '2025-03-20 17:55:32'),
(405, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:55:34', '2025-03-20 17:55:34'),
(406, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:55:35', '2025-03-20 17:55:35'),
(407, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:55:39', '2025-03-20 17:55:39'),
(408, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.64, 'BRL', 'wordslot', 'loss', '2025-03-20 17:55:39', '2025-03-20 17:55:39'),
(409, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:55:39', '2025-03-20 17:55:39');
INSERT INTO `ggr_games` (`id`, `user_id`, `provider`, `game`, `balance_bet`, `balance_win`, `currency`, `aggregator`, `type`, `created_at`, `updated_at`) VALUES
(410, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:55:42', '2025-03-20 17:55:42'),
(411, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:55:43', '2025-03-20 17:55:43'),
(412, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:55:45', '2025-03-20 17:55:45'),
(413, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:55:46', '2025-03-20 17:55:46'),
(414, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:55:47', '2025-03-20 17:55:47'),
(415, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:55:49', '2025-03-20 17:55:49'),
(416, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:55:51', '2025-03-20 17:55:51'),
(417, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:55:52', '2025-03-20 17:55:52'),
(418, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:55:56', '2025-03-20 17:55:56'),
(419, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:55:56', '2025-03-20 17:55:56'),
(420, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:55:59', '2025-03-20 17:55:59'),
(421, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:55:59', '2025-03-20 17:55:59'),
(422, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:56:01', '2025-03-20 17:56:01'),
(423, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:56:02', '2025-03-20 17:56:02'),
(424, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:56:05', '2025-03-20 17:56:05'),
(425, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:56:05', '2025-03-20 17:56:05'),
(426, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:56:08', '2025-03-20 17:56:08'),
(427, 144, 'PGSOFT', 'fortune-tiger', 0.40, 1.12, 'BRL', 'wordslot', 'loss', '2025-03-20 17:56:08', '2025-03-20 17:56:08'),
(428, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:56:11', '2025-03-20 17:56:11'),
(429, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:56:11', '2025-03-20 17:56:11'),
(430, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:56:13', '2025-03-20 17:56:13'),
(431, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:56:14', '2025-03-20 17:56:14'),
(432, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:56:16', '2025-03-20 17:56:16'),
(433, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:56:18', '2025-03-20 17:56:18'),
(434, 144, 'PGSOFT', 'fortune-tiger', 0.40, 10.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:56:18', '2025-03-20 17:56:18'),
(435, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:56:19', '2025-03-20 17:56:19'),
(436, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:57:17', '2025-03-20 17:57:17'),
(437, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:57:20', '2025-03-20 17:57:20'),
(438, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:57:24', '2025-03-20 17:57:24'),
(439, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:57:29', '2025-03-20 17:57:29'),
(440, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:57:33', '2025-03-20 17:57:33'),
(441, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:57:36', '2025-03-20 17:57:36'),
(442, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:57:40', '2025-03-20 17:57:40'),
(443, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:57:44', '2025-03-20 17:57:44'),
(444, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:57:45', '2025-03-20 17:57:45'),
(445, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:57:47', '2025-03-20 17:57:47'),
(446, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:57:47', '2025-03-20 17:57:47'),
(447, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:57:49', '2025-03-20 17:57:49'),
(448, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:57:51', '2025-03-20 17:57:51'),
(449, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:57:51', '2025-03-20 17:57:51'),
(450, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:57:52', '2025-03-20 17:57:52'),
(451, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.48, 'BRL', 'wordslot', 'loss', '2025-03-20 17:57:52', '2025-03-20 17:57:52'),
(452, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:57:54', '2025-03-20 17:57:54'),
(453, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:57:58', '2025-03-20 17:57:58'),
(454, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:58:03', '2025-03-20 17:58:03'),
(455, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:58:03', '2025-03-20 17:58:03'),
(456, 123, 'PGSOFT', 'fortune-tiger', 0.40, 2.40, 'BRL', 'wordslot', 'loss', '2025-03-20 17:58:03', '2025-03-20 17:58:03'),
(457, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:58:06', '2025-03-20 17:58:06'),
(458, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:58:09', '2025-03-20 17:58:09'),
(459, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:58:11', '2025-03-20 17:58:11'),
(460, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:58:12', '2025-03-20 17:58:12'),
(461, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:58:13', '2025-03-20 17:58:13'),
(462, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:58:15', '2025-03-20 17:58:15'),
(463, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:58:15', '2025-03-20 17:58:15'),
(464, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:58:19', '2025-03-20 17:58:19'),
(465, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:58:22', '2025-03-20 17:58:22'),
(466, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:58:22', '2025-03-20 17:58:22'),
(467, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:58:26', '2025-03-20 17:58:26'),
(468, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:58:28', '2025-03-20 17:58:28'),
(469, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:58:29', '2025-03-20 17:58:29'),
(470, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:58:30', '2025-03-20 17:58:30'),
(471, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:59:03', '2025-03-20 17:59:03'),
(472, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:59:05', '2025-03-20 17:59:05'),
(473, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:59:06', '2025-03-20 17:59:06'),
(474, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:59:07', '2025-03-20 17:59:07'),
(475, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:59:08', '2025-03-20 17:59:08'),
(476, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:59:09', '2025-03-20 17:59:09'),
(477, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:59:10', '2025-03-20 17:59:10'),
(478, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:59:11', '2025-03-20 17:59:11'),
(479, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:59:13', '2025-03-20 17:59:13'),
(480, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:59:14', '2025-03-20 17:59:14'),
(481, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:59:16', '2025-03-20 17:59:16'),
(482, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:59:16', '2025-03-20 17:59:16'),
(483, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:59:19', '2025-03-20 17:59:19'),
(484, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:59:20', '2025-03-20 17:59:20'),
(485, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:59:21', '2025-03-20 17:59:21'),
(486, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:59:23', '2025-03-20 17:59:23'),
(487, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.40, 'BRL', 'wordslot', 'loss', '2025-03-20 17:59:23', '2025-03-20 17:59:23'),
(488, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:59:23', '2025-03-20 17:59:23'),
(489, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:59:25', '2025-03-20 17:59:25'),
(490, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:59:27', '2025-03-20 17:59:27'),
(491, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:59:29', '2025-03-20 17:59:29'),
(492, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:59:31', '2025-03-20 17:59:31'),
(493, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:59:33', '2025-03-20 17:59:33'),
(494, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:59:35', '2025-03-20 17:59:35'),
(495, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:59:36', '2025-03-20 17:59:36'),
(496, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:59:36', '2025-03-20 17:59:36'),
(497, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:59:38', '2025-03-20 17:59:38'),
(498, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:59:39', '2025-03-20 17:59:39'),
(499, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.24, 'BRL', 'wordslot', 'loss', '2025-03-20 17:59:39', '2025-03-20 17:59:39'),
(500, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:59:40', '2025-03-20 17:59:40'),
(501, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:59:41', '2025-03-20 17:59:41'),
(502, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:59:42', '2025-03-20 17:59:42'),
(503, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.24, 'BRL', 'wordslot', 'loss', '2025-03-20 17:59:42', '2025-03-20 17:59:42'),
(504, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:59:43', '2025-03-20 17:59:43'),
(505, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:59:44', '2025-03-20 17:59:44'),
(506, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:59:45', '2025-03-20 17:59:45'),
(507, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:59:47', '2025-03-20 17:59:47'),
(508, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:59:47', '2025-03-20 17:59:47'),
(509, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:59:49', '2025-03-20 17:59:49'),
(510, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:59:51', '2025-03-20 17:59:51'),
(511, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.96, 'BRL', 'wordslot', 'loss', '2025-03-20 17:59:51', '2025-03-20 17:59:51'),
(512, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:59:52', '2025-03-20 17:59:52'),
(513, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:59:53', '2025-03-20 17:59:53'),
(514, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:59:55', '2025-03-20 17:59:55'),
(515, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:59:56', '2025-03-20 17:59:56'),
(516, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:59:57', '2025-03-20 17:59:57'),
(517, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 17:59:57', '2025-03-20 17:59:57'),
(518, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:00:00', '2025-03-20 18:00:00'),
(519, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:00:03', '2025-03-20 18:00:03'),
(520, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:00:04', '2025-03-20 18:00:04'),
(521, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:00:06', '2025-03-20 18:00:06'),
(522, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:00:07', '2025-03-20 18:00:07'),
(523, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:00:12', '2025-03-20 18:00:12'),
(524, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:00:15', '2025-03-20 18:00:15'),
(525, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:00:15', '2025-03-20 18:00:15'),
(526, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.72, 'BRL', 'wordslot', 'loss', '2025-03-20 18:00:15', '2025-03-20 18:00:15'),
(527, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:00:18', '2025-03-20 18:00:18'),
(528, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:00:21', '2025-03-20 18:00:21'),
(529, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:00:22', '2025-03-20 18:00:22'),
(530, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:00:24', '2025-03-20 18:00:24'),
(531, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:00:27', '2025-03-20 18:00:27'),
(532, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:00:29', '2025-03-20 18:00:29'),
(533, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:00:31', '2025-03-20 18:00:31'),
(534, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:00:33', '2025-03-20 18:00:33'),
(535, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:00:35', '2025-03-20 18:00:35'),
(536, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:00:40', '2025-03-20 18:00:40'),
(537, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:00:42', '2025-03-20 18:00:42'),
(538, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:00:44', '2025-03-20 18:00:44'),
(539, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:00:46', '2025-03-20 18:00:46'),
(540, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:00:48', '2025-03-20 18:00:48'),
(541, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:00:51', '2025-03-20 18:00:51'),
(542, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:00:56', '2025-03-20 18:00:56'),
(543, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:00:58', '2025-03-20 18:00:58'),
(544, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:01:00', '2025-03-20 18:01:00'),
(545, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:01:03', '2025-03-20 18:01:03'),
(546, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:01:05', '2025-03-20 18:01:05'),
(547, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:01:14', '2025-03-20 18:01:14'),
(548, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:01:16', '2025-03-20 18:01:16'),
(549, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:01:21', '2025-03-20 18:01:21'),
(550, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:01:23', '2025-03-20 18:01:23'),
(551, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:01:24', '2025-03-20 18:01:24'),
(552, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:01:25', '2025-03-20 18:01:25'),
(553, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:01:26', '2025-03-20 18:01:26'),
(554, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:01:27', '2025-03-20 18:01:27'),
(555, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:01:27', '2025-03-20 18:01:27'),
(556, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:01:29', '2025-03-20 18:01:29'),
(557, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:01:30', '2025-03-20 18:01:30'),
(558, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:01:31', '2025-03-20 18:01:31'),
(559, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:01:32', '2025-03-20 18:01:32'),
(560, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:01:36', '2025-03-20 18:01:36'),
(561, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:01:36', '2025-03-20 18:01:36'),
(562, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:01:38', '2025-03-20 18:01:38'),
(563, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:01:38', '2025-03-20 18:01:38'),
(564, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:01:40', '2025-03-20 18:01:40'),
(565, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:01:42', '2025-03-20 18:01:42'),
(566, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:01:42', '2025-03-20 18:01:42'),
(567, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:01:44', '2025-03-20 18:01:44'),
(568, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:01:45', '2025-03-20 18:01:45'),
(569, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.40, 'BRL', 'wordslot', 'loss', '2025-03-20 18:01:45', '2025-03-20 18:01:45'),
(570, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:01:46', '2025-03-20 18:01:46'),
(571, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:01:48', '2025-03-20 18:01:48'),
(572, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:01:48', '2025-03-20 18:01:48'),
(573, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:01:50', '2025-03-20 18:01:50'),
(574, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.40, 'BRL', 'wordslot', 'loss', '2025-03-20 18:01:50', '2025-03-20 18:01:50'),
(575, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:01:50', '2025-03-20 18:01:50'),
(576, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:01:54', '2025-03-20 18:01:54'),
(577, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:01:55', '2025-03-20 18:01:55'),
(578, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:01:57', '2025-03-20 18:01:57'),
(579, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:01:58', '2025-03-20 18:01:58'),
(580, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:02:01', '2025-03-20 18:02:01'),
(581, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:02:01', '2025-03-20 18:02:01'),
(582, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:02:03', '2025-03-20 18:02:03'),
(583, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:02:04', '2025-03-20 18:02:04'),
(584, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:02:06', '2025-03-20 18:02:06'),
(585, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:02:06', '2025-03-20 18:02:06'),
(586, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:02:08', '2025-03-20 18:02:08'),
(587, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.24, 'BRL', 'wordslot', 'loss', '2025-03-20 18:02:08', '2025-03-20 18:02:08'),
(588, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:02:11', '2025-03-20 18:02:11'),
(589, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:02:11', '2025-03-20 18:02:11'),
(590, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:02:13', '2025-03-20 18:02:13'),
(591, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:02:14', '2025-03-20 18:02:14'),
(592, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:02:15', '2025-03-20 18:02:15'),
(593, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:02:17', '2025-03-20 18:02:17'),
(594, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:02:17', '2025-03-20 18:02:17'),
(595, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:02:19', '2025-03-20 18:02:19'),
(596, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:02:21', '2025-03-20 18:02:21'),
(597, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:02:22', '2025-03-20 18:02:22'),
(598, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:02:22', '2025-03-20 18:02:22'),
(599, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:02:25', '2025-03-20 18:02:25'),
(600, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:02:26', '2025-03-20 18:02:26'),
(601, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:02:27', '2025-03-20 18:02:27'),
(602, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:02:28', '2025-03-20 18:02:28'),
(603, 144, 'PGSOFT', 'fortune-tiger', 0.40, 1.60, 'BRL', 'wordslot', 'loss', '2025-03-20 18:02:28', '2025-03-20 18:02:28'),
(604, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:02:30', '2025-03-20 18:02:30'),
(605, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:02:32', '2025-03-20 18:02:32'),
(606, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:02:32', '2025-03-20 18:02:32'),
(607, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:02:34', '2025-03-20 18:02:34'),
(608, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:02:35', '2025-03-20 18:02:35'),
(609, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:02:37', '2025-03-20 18:02:37'),
(610, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:02:37', '2025-03-20 18:02:37'),
(611, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:02:40', '2025-03-20 18:02:40'),
(612, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:02:40', '2025-03-20 18:02:40'),
(613, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:02:43', '2025-03-20 18:02:43'),
(614, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:02:44', '2025-03-20 18:02:44'),
(615, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:02:46', '2025-03-20 18:02:46'),
(616, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:02:48', '2025-03-20 18:02:48'),
(617, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:02:51', '2025-03-20 18:02:51'),
(618, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:02:53', '2025-03-20 18:02:53'),
(619, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:02:55', '2025-03-20 18:02:55'),
(620, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:02:56', '2025-03-20 18:02:56'),
(621, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:02:58', '2025-03-20 18:02:58'),
(622, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:02:59', '2025-03-20 18:02:59'),
(623, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:03:01', '2025-03-20 18:03:01'),
(624, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.40, 'BRL', 'wordslot', 'loss', '2025-03-20 18:03:01', '2025-03-20 18:03:01'),
(625, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:03:04', '2025-03-20 18:03:04'),
(626, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:03:06', '2025-03-20 18:03:06'),
(627, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:03:08', '2025-03-20 18:03:08'),
(628, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:03:10', '2025-03-20 18:03:10'),
(629, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:03:12', '2025-03-20 18:03:12'),
(630, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.24, 'BRL', 'wordslot', 'loss', '2025-03-20 18:03:12', '2025-03-20 18:03:12'),
(631, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:03:15', '2025-03-20 18:03:15'),
(632, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:03:17', '2025-03-20 18:03:17'),
(633, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:03:19', '2025-03-20 18:03:19'),
(634, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:03:25', '2025-03-20 18:03:25'),
(635, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:03:30', '2025-03-20 18:03:30'),
(636, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:03:33', '2025-03-20 18:03:33'),
(637, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:03:35', '2025-03-20 18:03:35'),
(638, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:03:37', '2025-03-20 18:03:37'),
(639, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:03:39', '2025-03-20 18:03:39'),
(640, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:03:44', '2025-03-20 18:03:44'),
(641, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:04:05', '2025-03-20 18:04:05'),
(642, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:04:08', '2025-03-20 18:04:08'),
(643, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:04:10', '2025-03-20 18:04:10'),
(644, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:04:15', '2025-03-20 18:04:15'),
(645, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:04:17', '2025-03-20 18:04:17'),
(646, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:04:19', '2025-03-20 18:04:19'),
(647, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:04:24', '2025-03-20 18:04:24'),
(648, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:04:26', '2025-03-20 18:04:26'),
(649, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:04:28', '2025-03-20 18:04:28'),
(650, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:04:30', '2025-03-20 18:04:30'),
(651, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:04:32', '2025-03-20 18:04:32'),
(652, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:04:34', '2025-03-20 18:04:34'),
(653, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:04:36', '2025-03-20 18:04:36'),
(654, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:04:38', '2025-03-20 18:04:38'),
(655, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:04:40', '2025-03-20 18:04:40'),
(656, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:04:42', '2025-03-20 18:04:42'),
(657, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:05:04', '2025-03-20 18:05:04'),
(658, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:05:06', '2025-03-20 18:05:06'),
(659, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:05:08', '2025-03-20 18:05:08'),
(660, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:05:10', '2025-03-20 18:05:10'),
(661, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:05:12', '2025-03-20 18:05:12'),
(662, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:05:13', '2025-03-20 18:05:13'),
(663, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:05:14', '2025-03-20 18:05:14'),
(664, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:05:18', '2025-03-20 18:05:18'),
(665, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:05:19', '2025-03-20 18:05:19'),
(666, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:05:21', '2025-03-20 18:05:21'),
(667, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:05:21', '2025-03-20 18:05:21'),
(668, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:05:23', '2025-03-20 18:05:23'),
(669, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:05:24', '2025-03-20 18:05:24'),
(670, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:05:25', '2025-03-20 18:05:25'),
(671, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:05:28', '2025-03-20 18:05:28'),
(672, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:05:29', '2025-03-20 18:05:29'),
(673, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:05:32', '2025-03-20 18:05:32'),
(674, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:05:32', '2025-03-20 18:05:32'),
(675, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:05:34', '2025-03-20 18:05:34'),
(676, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:05:36', '2025-03-20 18:05:36'),
(677, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:05:36', '2025-03-20 18:05:36'),
(678, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:05:39', '2025-03-20 18:05:39'),
(679, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:05:39', '2025-03-20 18:05:39'),
(680, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:05:41', '2025-03-20 18:05:41'),
(681, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:05:42', '2025-03-20 18:05:42'),
(682, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:05:43', '2025-03-20 18:05:43'),
(683, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:05:47', '2025-03-20 18:05:47'),
(684, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:05:47', '2025-03-20 18:05:47'),
(685, 144, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 18:05:54', '2025-03-20 18:05:54'),
(686, 145, 'PGSOFT', 'lucky-clover', 12.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 19:08:10', '2025-03-20 19:08:10'),
(687, 145, 'PGSOFT', 'lucky-clover', 12.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 19:08:14', '2025-03-20 19:08:14'),
(688, 145, 'PGSOFT', 'lucky-clover', 12.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 19:08:17', '2025-03-20 19:08:17'),
(689, 145, 'PGSOFT', 'lucky-clover', 12.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 19:08:20', '2025-03-20 19:08:20'),
(690, 145, 'PGSOFT', 'lucky-clover', 12.00, 0.60, 'BRL', 'wordslot', 'loss', '2025-03-20 19:08:20', '2025-03-20 19:08:20'),
(691, 145, 'PGSOFT', 'lucky-clover', 12.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 19:08:24', '2025-03-20 19:08:24'),
(692, 145, 'PGSOFT', 'lucky-clover', 12.00, 0.60, 'BRL', 'wordslot', 'loss', '2025-03-20 19:08:24', '2025-03-20 19:08:24'),
(693, 145, 'PGSOFT', 'lucky-clover', 3.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 19:08:30', '2025-03-20 19:08:30'),
(694, 145, 'PGSOFT', 'lucky-clover', 3.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 19:08:34', '2025-03-20 19:08:34'),
(695, 145, 'PGSOFT', 'lucky-clover', 3.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 19:08:37', '2025-03-20 19:08:37'),
(696, 145, 'PGSOFT', 'lucky-clover', 3.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 19:08:40', '2025-03-20 19:08:40'),
(697, 145, 'PGSOFT', 'lucky-clover', 3.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 19:08:43', '2025-03-20 19:08:43'),
(698, 145, 'PGSOFT', 'lucky-clover', 3.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 19:08:46', '2025-03-20 19:08:46'),
(699, 145, 'PGSOFT', 'lucky-clover', 3.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 19:08:49', '2025-03-20 19:08:49'),
(700, 145, 'PGSOFT', 'lucky-clover', 3.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 19:08:52', '2025-03-20 19:08:52'),
(701, 145, 'PGSOFT', 'lucky-clover', 3.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 19:08:55', '2025-03-20 19:08:55'),
(702, 123, 'PGSOFT', 'ultimate-striker', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 19:08:57', '2025-03-20 19:08:57'),
(703, 123, 'PGSOFT', 'ultimate-striker', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 19:09:00', '2025-03-20 19:09:00'),
(704, 145, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 19:10:14', '2025-03-20 19:10:14'),
(705, 145, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 19:10:20', '2025-03-20 19:10:20'),
(706, 145, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 19:10:23', '2025-03-20 19:10:23'),
(707, 145, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 19:10:27', '2025-03-20 19:10:27'),
(708, 145, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 19:10:31', '2025-03-20 19:10:31'),
(709, 145, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 19:10:35', '2025-03-20 19:10:35'),
(710, 145, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 19:10:38', '2025-03-20 19:10:38'),
(711, 145, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 19:10:44', '2025-03-20 19:10:44'),
(712, 145, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 19:10:48', '2025-03-20 19:10:48'),
(713, 145, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 19:10:51', '2025-03-20 19:10:51'),
(714, 145, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 19:10:54', '2025-03-20 19:10:54'),
(715, 145, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 19:10:59', '2025-03-20 19:10:59'),
(716, 145, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 19:11:02', '2025-03-20 19:11:02'),
(717, 145, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 19:11:05', '2025-03-20 19:11:05'),
(718, 145, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 19:11:09', '2025-03-20 19:11:09'),
(719, 145, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 19:11:12', '2025-03-20 19:11:12'),
(720, 145, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 19:11:17', '2025-03-20 19:11:17'),
(721, 145, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 19:11:21', '2025-03-20 19:11:21'),
(722, 145, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 19:11:24', '2025-03-20 19:11:24'),
(723, 145, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 19:11:28', '2025-03-20 19:11:28'),
(724, 145, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 19:11:31', '2025-03-20 19:11:31'),
(725, 145, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 19:11:34', '2025-03-20 19:11:34'),
(726, 145, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 19:11:39', '2025-03-20 19:11:39'),
(727, 145, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 19:11:42', '2025-03-20 19:11:42'),
(728, 145, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 19:11:46', '2025-03-20 19:11:46'),
(729, 145, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 19:11:49', '2025-03-20 19:11:49'),
(730, 145, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 19:11:53', '2025-03-20 19:11:53'),
(731, 145, 'PGSOFT', 'wild-bandito', 12.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 19:12:45', '2025-03-20 19:12:45'),
(732, 145, 'PGSOFT', 'wild-bandito', 12.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 19:12:48', '2025-03-20 19:12:48'),
(733, 145, 'PGSOFT', 'wild-bandito', 12.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 19:12:50', '2025-03-20 19:12:50'),
(734, 145, 'PGSOFT', 'wild-bandito', 12.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 19:12:52', '2025-03-20 19:12:52'),
(735, 145, 'PGSOFT', 'wild-bandito', 12.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 19:12:54', '2025-03-20 19:12:54'),
(736, 145, 'PGSOFT', 'wild-bandito', 3.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 19:12:57', '2025-03-20 19:12:57'),
(737, 145, 'PGSOFT', 'wild-bandito', 3.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 19:13:00', '2025-03-20 19:13:00'),
(738, 145, 'PGSOFT', 'wild-bandito', 3.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 19:13:02', '2025-03-20 19:13:02'),
(739, 145, 'PGSOFT', 'wild-bandito', 3.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 19:14:55', '2025-03-20 19:14:55'),
(740, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 21:17:28', '2025-03-20 21:17:28'),
(741, 123, 'PGSOFT', 'wild-bandito', 0.60, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 21:19:43', '2025-03-20 21:19:43'),
(742, 123, 'PGSOFT', 'wild-bandito', 0.60, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 21:19:51', '2025-03-20 21:19:51'),
(743, 123, 'PGSOFT', 'ultimate-striker', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 21:20:11', '2025-03-20 21:20:11'),
(744, 123, 'PGSOFT', 'fortune-ox', 0.50, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 21:21:14', '2025-03-20 21:21:14'),
(745, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 21:24:51', '2025-03-20 21:24:51'),
(746, 123, 'PGSOFT', 'wild-bandito', 12.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 21:53:43', '2025-03-20 21:53:43'),
(747, 123, 'PGSOFT', 'fortune-rabbit', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 22:06:27', '2025-03-20 22:06:27'),
(748, 123, 'PGSOFT', 'wild-bandito', 12.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 22:06:47', '2025-03-20 22:06:47'),
(749, 123, 'PGSOFT', 'wild-bandito', 12.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 22:06:52', '2025-03-20 22:06:52'),
(750, 123, 'PGSOFT', 'ninja-raccoon', 1.80, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 22:07:30', '2025-03-20 22:07:30'),
(751, 123, 'PGSOFT', 'ninja-raccoon', 1.80, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 22:07:33', '2025-03-20 22:07:33'),
(752, 123, 'PGSOFT', 'fortune-rabbit', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 22:21:43', '2025-03-20 22:21:43'),
(753, 123, 'PGSOFT', 'fortune-ox', 0.50, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 22:23:05', '2025-03-20 22:23:05'),
(754, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 22:23:34', '2025-03-20 22:23:34'),
(755, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 22:23:37', '2025-03-20 22:23:37'),
(756, 123, 'PGSOFT', 'wild-bandito', 12.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 22:24:11', '2025-03-20 22:24:11'),
(757, 146, 'PGSOFT', 'fortune-rabbit', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 23:01:27', '2025-03-20 23:01:27'),
(758, 146, 'PGSOFT', 'fortune-rabbit', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 23:01:34', '2025-03-20 23:01:34'),
(759, 146, 'PGSOFT', 'fortune-rabbit', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 23:01:37', '2025-03-20 23:01:37'),
(760, 146, 'PGSOFT', 'fortune-rabbit', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 23:01:39', '2025-03-20 23:01:39'),
(761, 146, 'PGSOFT', 'fortune-rabbit', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 23:01:41', '2025-03-20 23:01:41'),
(762, 146, 'PGSOFT', 'fortune-rabbit', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 23:01:43', '2025-03-20 23:01:43'),
(763, 146, 'PGSOFT', 'fortune-rabbit', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 23:01:45', '2025-03-20 23:01:45'),
(764, 146, 'PGSOFT', 'fortune-rabbit', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 23:01:46', '2025-03-20 23:01:46'),
(765, 146, 'PGSOFT', 'fortune-rabbit', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 23:01:48', '2025-03-20 23:01:48'),
(766, 146, 'PGSOFT', 'fortune-rabbit', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 23:01:51', '2025-03-20 23:01:51'),
(767, 146, 'PGSOFT', 'fortune-rabbit', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 23:01:53', '2025-03-20 23:01:53'),
(768, 146, 'PGSOFT', 'fortune-rabbit', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 23:01:55', '2025-03-20 23:01:55'),
(769, 146, 'PGSOFT', 'fortune-rabbit', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 23:01:57', '2025-03-20 23:01:57'),
(770, 146, 'PGSOFT', 'fortune-rabbit', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 23:02:04', '2025-03-20 23:02:04'),
(771, 146, 'PGSOFT', 'fortune-rabbit', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 23:02:06', '2025-03-20 23:02:06'),
(772, 146, 'PGSOFT', 'fortune-rabbit', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 23:02:08', '2025-03-20 23:02:08'),
(773, 146, 'PGSOFT', 'fortune-rabbit', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 23:02:10', '2025-03-20 23:02:10'),
(774, 146, 'PGSOFT', 'fortune-rabbit', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 23:02:12', '2025-03-20 23:02:12'),
(775, 146, 'PGSOFT', 'fortune-rabbit', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 23:02:14', '2025-03-20 23:02:14'),
(776, 146, 'PGSOFT', 'fortune-rabbit', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 23:02:16', '2025-03-20 23:02:16'),
(777, 146, 'PGSOFT', 'fortune-rabbit', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 23:02:18', '2025-03-20 23:02:18'),
(778, 146, 'PGSOFT', 'fortune-rabbit', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 23:02:20', '2025-03-20 23:02:20'),
(779, 146, 'PGSOFT', 'fortune-rabbit', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 23:02:22', '2025-03-20 23:02:22'),
(780, 146, 'PGSOFT', 'fortune-rabbit', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 23:02:24', '2025-03-20 23:02:24'),
(781, 146, 'PGSOFT', 'fortune-rabbit', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 23:02:26', '2025-03-20 23:02:26'),
(782, 146, 'PGSOFT', 'fortune-rabbit', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 23:02:28', '2025-03-20 23:02:28'),
(783, 146, 'PGSOFT', 'fortune-rabbit', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 23:02:30', '2025-03-20 23:02:30'),
(784, 146, 'PGSOFT', 'fortune-rabbit', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 23:02:36', '2025-03-20 23:02:36'),
(785, 146, 'PGSOFT', 'fortune-rabbit', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 23:02:37', '2025-03-20 23:02:37'),
(786, 146, 'PGSOFT', 'fortune-rabbit', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 23:02:40', '2025-03-20 23:02:40'),
(787, 146, 'PGSOFT', 'fortune-rabbit', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 23:02:42', '2025-03-20 23:02:42'),
(788, 146, 'PGSOFT', 'fortune-rabbit', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 23:02:44', '2025-03-20 23:02:44'),
(789, 146, 'PGSOFT', 'fortune-rabbit', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 23:02:46', '2025-03-20 23:02:46'),
(790, 146, 'PGSOFT', 'fortune-rabbit', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 23:02:52', '2025-03-20 23:02:52'),
(791, 146, 'PGSOFT', 'fortune-rabbit', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 23:02:54', '2025-03-20 23:02:54'),
(792, 146, 'PGSOFT', 'fortune-rabbit', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 23:02:56', '2025-03-20 23:02:56'),
(793, 146, 'PGSOFT', 'fortune-rabbit', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 23:02:58', '2025-03-20 23:02:58'),
(794, 146, 'PGSOFT', 'fortune-rabbit', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 23:03:00', '2025-03-20 23:03:00'),
(795, 146, 'PGSOFT', 'fortune-rabbit', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 23:03:02', '2025-03-20 23:03:02'),
(796, 146, 'PGSOFT', 'fortune-rabbit', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 23:03:04', '2025-03-20 23:03:04'),
(797, 146, 'PGSOFT', 'fortune-rabbit', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 23:03:06', '2025-03-20 23:03:06'),
(798, 146, 'PGSOFT', 'fortune-rabbit', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 23:03:20', '2025-03-20 23:03:20'),
(799, 146, 'PGSOFT', 'ninja-raccoon', 18.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 23:03:49', '2025-03-20 23:03:49'),
(800, 146, 'PGSOFT', 'ninja-raccoon', 18.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 23:03:52', '2025-03-20 23:03:52'),
(801, 146, 'PGSOFT', 'ninja-raccoon', 18.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 23:03:59', '2025-03-20 23:03:59'),
(802, 146, 'PGSOFT', 'ninja-raccoon', 18.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 23:04:01', '2025-03-20 23:04:01'),
(803, 146, 'PGSOFT', 'ninja-raccoon', 18.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 23:04:02', '2025-03-20 23:04:02'),
(804, 146, 'PGSOFT', 'ninja-raccoon', 18.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 23:04:04', '2025-03-20 23:04:04'),
(805, 146, 'PGSOFT', 'ninja-raccoon', 18.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 23:04:20', '2025-03-20 23:04:20'),
(806, 146, 'PGSOFT', 'ninja-raccoon', 18.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 23:04:22', '2025-03-20 23:04:22'),
(807, 146, 'PGSOFT', 'ninja-raccoon', 18.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 23:04:23', '2025-03-20 23:04:23'),
(808, 146, 'PGSOFT', 'ninja-raccoon', 18.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 23:04:25', '2025-03-20 23:04:25'),
(809, 146, 'PGSOFT', 'ninja-raccoon', 18.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 23:04:26', '2025-03-20 23:04:26'),
(810, 146, 'PGSOFT', 'ninja-raccoon', 18.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 23:04:28', '2025-03-20 23:04:28'),
(811, 146, 'PGSOFT', 'ninja-raccoon', 18.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 23:04:29', '2025-03-20 23:04:29'),
(812, 146, 'PGSOFT', 'ninja-raccoon', 18.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 23:04:31', '2025-03-20 23:04:31'),
(813, 146, 'PGSOFT', 'ninja-raccoon', 18.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 23:04:32', '2025-03-20 23:04:32'),
(814, 146, 'PGSOFT', 'ninja-raccoon', 18.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 23:04:34', '2025-03-20 23:04:34'),
(815, 146, 'PGSOFT', 'ninja-raccoon', 18.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 23:04:36', '2025-03-20 23:04:36'),
(816, 146, 'PGSOFT', 'ninja-raccoon', 18.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 23:04:37', '2025-03-20 23:04:37'),
(817, 146, 'PGSOFT', 'ninja-raccoon', 18.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 23:04:39', '2025-03-20 23:04:39');
INSERT INTO `ggr_games` (`id`, `user_id`, `provider`, `game`, `balance_bet`, `balance_win`, `currency`, `aggregator`, `type`, `created_at`, `updated_at`) VALUES
(818, 146, 'PGSOFT', 'ninja-raccoon', 18.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 23:04:40', '2025-03-20 23:04:40'),
(819, 146, 'PGSOFT', 'ninja-raccoon', 18.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 23:04:42', '2025-03-20 23:04:42'),
(820, 146, 'PGSOFT', 'ninja-raccoon', 18.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 23:04:44', '2025-03-20 23:04:44'),
(821, 146, 'PGSOFT', 'ninja-raccoon', 18.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-20 23:04:45', '2025-03-20 23:04:45'),
(822, 147, 'PGSOFT', 'fortune-ox', 0.50, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-21 00:14:54', '2025-03-21 00:14:54'),
(823, 147, 'PGSOFT', 'fortune-ox', 0.50, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-21 00:14:57', '2025-03-21 00:14:57'),
(824, 147, 'PGSOFT', 'fortune-ox', 0.50, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-21 00:14:59', '2025-03-21 00:14:59'),
(825, 147, 'PGSOFT', 'fortune-ox', 0.50, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-21 00:15:01', '2025-03-21 00:15:01'),
(826, 147, 'PGSOFT', 'fortune-ox', 0.50, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-21 00:15:03', '2025-03-21 00:15:03'),
(827, 147, 'PGSOFT', 'fortune-ox', 0.50, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-21 00:15:04', '2025-03-21 00:15:04'),
(828, 147, 'PGSOFT', 'fortune-ox', 15.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-21 00:15:07', '2025-03-21 00:15:07'),
(829, 147, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-21 00:15:53', '2025-03-21 00:15:53'),
(830, 147, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-21 00:15:55', '2025-03-21 00:15:55'),
(831, 147, 'PGSOFT', 'fortune-tiger', 0.40, 0.24, 'BRL', 'wordslot', 'loss', '2025-03-21 00:15:55', '2025-03-21 00:15:55'),
(832, 147, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-21 00:16:03', '2025-03-21 00:16:03'),
(833, 147, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-21 00:16:07', '2025-03-21 00:16:07'),
(834, 123, 'PGSOFT', 'ultimate-striker', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-21 02:04:40', '2025-03-21 02:04:40'),
(835, 123, 'PGSOFT', 'ultimate-striker', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-21 02:04:55', '2025-03-21 02:04:55'),
(836, 123, 'PGSOFT', 'wild-bandito', 12.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-21 02:06:09', '2025-03-21 02:06:09'),
(837, 123, 'PGSOFT', 'fortune-ox', 0.50, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-21 02:06:49', '2025-03-21 02:06:49'),
(838, 123, 'PGSOFT', 'fortune-ox', 0.50, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-21 02:06:52', '2025-03-21 02:06:52'),
(839, 123, 'PGSOFT', 'ninja-raccoon', 0.90, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-21 02:11:09', '2025-03-21 02:11:09'),
(840, 123, 'PGSOFT', 'cash-mania', 0.50, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-21 02:13:53', '2025-03-21 02:13:53'),
(841, 123, 'PGSOFT', 'cash-mania', 0.50, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-21 02:13:56', '2025-03-21 02:13:56'),
(842, 123, 'PGSOFT', 'cash-mania', 0.50, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-21 02:14:42', '2025-03-21 02:14:42'),
(843, 123, 'PGSOFT', 'treasures-aztec', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-21 02:20:43', '2025-03-21 02:20:43'),
(844, 123, 'PGSOFT', 'treasures-aztec', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-21 02:25:03', '2025-03-21 02:25:03'),
(845, 123, 'PGSOFT', 'treasures-aztec', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-21 02:25:06', '2025-03-21 02:25:06'),
(846, 123, 'PGSOFT', 'treasures-aztec', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-21 02:25:07', '2025-03-21 02:25:07'),
(847, 123, 'PGSOFT', 'treasures-aztec', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-21 02:25:09', '2025-03-21 02:25:09'),
(848, 123, 'PGSOFT', 'treasures-aztec', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-21 02:25:11', '2025-03-21 02:25:11'),
(849, 123, 'PGSOFT', 'thai-river', 12.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-21 02:26:51', '2025-03-21 02:26:51'),
(850, 123, 'PGSOFT', 'thai-river', 12.00, 4.80, 'BRL', 'wordslot', 'loss', '2025-03-21 02:26:51', '2025-03-21 02:26:51'),
(851, 123, 'PGSOFT', 'thai-river', 12.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-21 02:26:56', '2025-03-21 02:26:56'),
(852, 123, 'PGSOFT', 'thai-river', 12.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-21 02:27:02', '2025-03-21 02:27:02'),
(853, 123, 'PGSOFT', 'thai-river', 12.00, 2.40, 'BRL', 'wordslot', 'loss', '2025-03-21 02:27:02', '2025-03-21 02:27:02'),
(854, 123, 'PGSOFT', 'thai-river', 12.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-21 02:27:06', '2025-03-21 02:27:06'),
(855, 123, 'PGSOFT', 'fortune-rabbit', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-21 03:59:40', '2025-03-21 03:59:40'),
(856, 123, 'PGSOFT', 'wild-bandito', 12.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-21 04:01:07', '2025-03-21 04:01:07'),
(857, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-21 04:06:52', '2025-03-21 04:06:52'),
(858, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-21 04:06:55', '2025-03-21 04:06:55'),
(859, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-21 04:06:58', '2025-03-21 04:06:58'),
(860, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-21 04:07:00', '2025-03-21 04:07:00'),
(861, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-21 04:07:02', '2025-03-21 04:07:02'),
(862, 123, 'PGSOFT', 'fortune-ox', 0.50, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-21 04:07:43', '2025-03-21 04:07:43'),
(863, 123, 'PGSOFT', 'fortune-ox', 0.50, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-21 04:07:45', '2025-03-21 04:07:45'),
(864, 123, 'PGSOFT', 'fortune-rabbit', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-21 04:08:17', '2025-03-21 04:08:17'),
(865, 123, 'PGSOFT', 'fortune-rabbit', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-21 04:08:20', '2025-03-21 04:08:20'),
(866, 123, 'PGSOFT', 'fortune-rabbit', 0.40, 0.48, 'BRL', 'wordslot', 'loss', '2025-03-21 04:08:20', '2025-03-21 04:08:20'),
(867, 123, 'PGSOFT', 'fortune-rabbit', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-21 04:08:23', '2025-03-21 04:08:23'),
(868, 123, 'PGSOFT', 'fortune-rabbit', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-21 04:08:24', '2025-03-21 04:08:24'),
(869, 123, 'PGSOFT', 'fortune-rabbit', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-21 04:08:26', '2025-03-21 04:08:26'),
(870, 123, 'PGSOFT', 'fortune-rabbit', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-21 04:08:27', '2025-03-21 04:08:27'),
(871, 123, 'PGSOFT', 'fortune-rabbit', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-21 04:08:28', '2025-03-21 04:08:28'),
(872, 123, 'PGSOFT', 'fortune-rabbit', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-21 04:08:30', '2025-03-21 04:08:30'),
(873, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-21 20:47:19', '2025-03-21 20:47:19'),
(874, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-21 20:49:05', '2025-03-21 20:49:05'),
(875, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-22 00:03:50', '2025-03-22 00:03:50'),
(876, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.72, 'BRL', 'wordslot', 'loss', '2025-03-22 00:03:50', '2025-03-22 00:03:50'),
(877, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-22 00:04:03', '2025-03-22 00:04:03'),
(878, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-22 00:04:15', '2025-03-22 00:04:15'),
(879, 123, 'PGSOFT', 'fortune-ox', 0.50, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-22 00:10:09', '2025-03-22 00:10:09'),
(880, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-22 00:25:54', '2025-03-22 00:25:54'),
(881, 123, 'PGSOFT', 'wild-bandito', 12.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-22 00:27:17', '2025-03-22 00:27:17'),
(882, 123, 'PGSOFT', 'cash-mania', 0.50, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-22 00:28:42', '2025-03-22 00:28:42'),
(883, 123, 'PGSOFT', 'cash-mania', 0.50, 9.00, 'BRL', 'wordslot', 'loss', '2025-03-22 00:28:42', '2025-03-22 00:28:42'),
(884, 123, 'PGSOFT', 'cash-mania', 0.50, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-22 00:28:54', '2025-03-22 00:28:54'),
(885, 123, 'PGSOFT', 'fortune-ox', 0.50, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-22 00:55:31', '2025-03-22 00:55:31'),
(886, 151, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-22 10:48:49', '2025-03-22 10:48:49'),
(887, 151, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-22 10:48:52', '2025-03-22 10:48:52'),
(888, 151, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-22 10:49:03', '2025-03-22 10:49:03'),
(889, 151, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-22 10:49:05', '2025-03-22 10:49:05'),
(890, 151, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-22 10:49:07', '2025-03-22 10:49:07'),
(891, 151, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-22 10:49:13', '2025-03-22 10:49:13'),
(892, 151, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-22 10:49:17', '2025-03-22 10:49:17'),
(893, 151, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-22 10:49:19', '2025-03-22 10:49:19'),
(894, 151, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-22 10:49:24', '2025-03-22 10:49:24'),
(895, 151, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-22 10:49:26', '2025-03-22 10:49:26'),
(896, 151, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-22 10:49:29', '2025-03-22 10:49:29'),
(897, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-22 10:49:35', '2025-03-22 10:49:35'),
(898, 151, 'PGSOFT', 'ultimate-striker', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-22 10:50:33', '2025-03-22 10:50:33'),
(899, 151, 'PGSOFT', 'ultimate-striker', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-22 10:50:37', '2025-03-22 10:50:37'),
(900, 151, 'PGSOFT', 'ultimate-striker', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-22 10:50:53', '2025-03-22 10:50:53'),
(901, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-22 10:51:57', '2025-03-22 10:51:57'),
(902, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-22 10:52:01', '2025-03-22 10:52:01'),
(903, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-22 10:52:12', '2025-03-22 10:52:12'),
(904, 123, 'PGSOFT', 'fortune-tiger', 1.20, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-22 10:52:22', '2025-03-22 10:52:22'),
(905, 123, 'PGSOFT', 'fortune-tiger', 1.20, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-22 10:52:27', '2025-03-22 10:52:27'),
(906, 123, 'PGSOFT', 'fortune-tiger', 1.20, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-22 10:52:31', '2025-03-22 10:52:31'),
(907, 123, 'PGSOFT', 'fortune-tiger', 1.20, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-22 10:52:32', '2025-03-22 10:52:32'),
(908, 151, 'PGSOFT', 'ninja-raccoon', 0.90, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-22 10:52:34', '2025-03-22 10:52:34'),
(909, 123, 'PGSOFT', 'fortune-tiger', 1.20, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-22 10:52:34', '2025-03-22 10:52:34'),
(910, 123, 'PGSOFT', 'fortune-tiger', 1.20, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-22 10:52:36', '2025-03-22 10:52:36'),
(911, 151, 'PGSOFT', 'ninja-raccoon', 0.90, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-22 10:52:38', '2025-03-22 10:52:38'),
(912, 123, 'PGSOFT', 'fortune-tiger', 1.20, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-22 10:52:39', '2025-03-22 10:52:39'),
(913, 151, 'PGSOFT', 'ninja-raccoon', 0.90, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-22 10:52:41', '2025-03-22 10:52:41'),
(914, 123, 'PGSOFT', 'fortune-tiger', 1.20, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-22 10:52:41', '2025-03-22 10:52:41'),
(915, 123, 'PGSOFT', 'fortune-tiger', 1.20, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-22 10:52:43', '2025-03-22 10:52:43'),
(916, 123, 'PGSOFT', 'fortune-tiger', 1.20, 1.92, 'BRL', 'wordslot', 'loss', '2025-03-22 10:52:43', '2025-03-22 10:52:43'),
(917, 151, 'PGSOFT', 'ninja-raccoon', 0.90, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-22 10:52:44', '2025-03-22 10:52:44'),
(918, 123, 'PGSOFT', 'fortune-tiger', 1.20, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-22 10:52:47', '2025-03-22 10:52:47'),
(919, 123, 'PGSOFT', 'fortune-tiger', 1.20, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-22 10:52:50', '2025-03-22 10:52:50'),
(920, 123, 'PGSOFT', 'fortune-tiger', 1.20, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-22 10:52:52', '2025-03-22 10:52:52'),
(921, 123, 'PGSOFT', 'fortune-tiger', 1.20, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-22 10:52:54', '2025-03-22 10:52:54'),
(922, 123, 'PGSOFT', 'fortune-tiger', 1.20, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-22 10:52:56', '2025-03-22 10:52:56'),
(923, 123, 'PGSOFT', 'fortune-tiger', 12.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-22 10:53:02', '2025-03-22 10:53:02'),
(924, 123, 'PGSOFT', 'fortune-tiger', 12.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-22 10:53:04', '2025-03-22 10:53:04'),
(925, 123, 'PGSOFT', 'fortune-tiger', 12.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-22 10:53:06', '2025-03-22 10:53:06'),
(926, 123, 'PGSOFT', 'fortune-tiger', 12.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-22 10:53:09', '2025-03-22 10:53:09'),
(927, 123, 'PGSOFT', 'fortune-tiger', 12.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-22 10:53:10', '2025-03-22 10:53:10'),
(928, 123, 'PGSOFT', 'fortune-tiger', 12.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-22 10:53:13', '2025-03-22 10:53:13'),
(929, 123, 'PGSOFT', 'fortune-tiger', 12.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-22 10:53:17', '2025-03-22 10:53:17'),
(930, 123, 'PGSOFT', 'fortune-tiger', 12.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-22 10:53:19', '2025-03-22 10:53:19'),
(931, 123, 'PGSOFT', 'fortune-tiger', 12.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-22 10:53:21', '2025-03-22 10:53:21'),
(932, 123, 'PGSOFT', 'fortune-tiger', 12.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-22 10:53:24', '2025-03-22 10:53:24'),
(933, 123, 'PGSOFT', 'fortune-tiger', 12.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-22 10:53:25', '2025-03-22 10:53:25'),
(934, 123, 'PGSOFT', 'fortune-tiger', 12.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-22 10:53:27', '2025-03-22 10:53:27'),
(935, 123, 'PGSOFT', 'fortune-tiger', 12.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-22 10:53:29', '2025-03-22 10:53:29'),
(936, 123, 'PGSOFT', 'fortune-tiger', 12.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-22 10:53:37', '2025-03-22 10:53:37'),
(937, 123, 'PGSOFT', 'fortune-tiger', 12.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-22 10:53:37', '2025-03-22 10:53:37'),
(938, 123, 'PGSOFT', 'fortune-tiger', 12.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-22 10:53:45', '2025-03-22 10:53:45'),
(939, 123, 'PGSOFT', 'fortune-tiger', 12.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-22 10:53:53', '2025-03-22 10:53:53'),
(940, 123, 'PGSOFT', 'fortune-tiger', 15.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-25 00:43:46', '2025-03-25 00:43:46'),
(941, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-25 00:44:37', '2025-03-25 00:44:37'),
(942, 123, 'PGSOFT', 'fortune-tiger', 0.40, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-25 00:45:41', '2025-03-25 00:45:41'),
(943, 123, 'PGSOFT', 'fortune-tiger', 500.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-25 00:45:52', '2025-03-25 00:45:52'),
(944, 123, 'PGSOFT', 'fortune-tiger', 40.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-03-25 05:18:09', '2025-03-25 05:18:09'),
(945, 160, 'BOOONGO', 'sum_of_egypt', 2.00, 0.00, 'BRL', 'wordslot', 'loss', '2025-04-16 12:53:38', '2025-04-16 12:53:38'),
(946, 160, 'BOOONGO', 'sum_of_egypt', 2.00, 1.00, 'BRL', 'wordslot', 'loss', '2025-04-16 12:53:38', '2025-04-16 12:53:38'),
(947, 160, 'BOOONGO', 'sum_of_egypt', 2.00, 100000.00, 'BRL', 'apidacasa', 'win', '2025-04-16 12:53:59', '2025-04-16 12:53:59');

-- --------------------------------------------------------

--
-- Estrutura para tabela `ggr_games_drakon`
--

CREATE TABLE `ggr_games_drakon` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `provider` varchar(255) NOT NULL,
  `game` varchar(255) NOT NULL,
  `balance_bet` decimal(15,2) NOT NULL,
  `balance_win` decimal(15,2) NOT NULL,
  `currency` varchar(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura para tabela `ggr_games_fivers`
--

CREATE TABLE `ggr_games_fivers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `provider` varchar(191) NOT NULL,
  `game` varchar(191) NOT NULL,
  `balance_bet` decimal(20,2) NOT NULL DEFAULT '0.00',
  `balance_win` decimal(20,2) NOT NULL DEFAULT '0.00',
  `currency` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `ggr_games_world_slots`
--

CREATE TABLE `ggr_games_world_slots` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `provider` varchar(191) NOT NULL,
  `game` varchar(191) NOT NULL,
  `balance_bet` decimal(20,2) NOT NULL DEFAULT '0.00',
  `balance_win` decimal(20,2) NOT NULL DEFAULT '0.00',
  `currency` varchar(50) NOT NULL DEFAULT 'BRL',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `likes`
--

CREATE TABLE `likes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `liked_user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Estrutura para tabela `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0000_00_00_000000_create_websockets_statistics_entries_table', 1),
(2, '2014_10_12_000000_create_users_table', 1),
(3, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(15, '2023_10_30_034921_create_settings_table', 6),
(7, '2023_11_03_205251_create_sport_categories_table', 1),
(8, '2023_11_03_205252_create_sports_table', 1),
(10, '2023_11_04_001342_create_sport_events_table', 2),
(11, '2023_11_04_213841_add_fields_to_users_table', 3),
(12, '2023_11_07_202919_create_currencies_table', 4),
(13, '2023_11_07_210310_create_wallets_table', 5),
(16, '2023_11_07_214236_create_withdrawals_table', 7),
(17, '2023_11_07_214240_create_deposits_table', 7),
(18, '2023_11_07_214244_create_orders_table', 7),
(19, '2023_11_07_214708_create_suit_pay_payments_table', 7),
(20, '2023_11_07_215204_create_notifications_table', 8),
(21, '2023_11_07_202919_create_currency_alloweds_table', 9),
(22, '2023_11_11_205824_create_casino_categories_table', 9),
(23, '2023_11_11_205834_create_casino_providers_table', 9),
(24, '2023_11_11_205938_create_casino_games_slotgrators_table', 9),
(25, '2023_11_11_210018_create_casino_games_kscinuses_table', 9),
(26, '2023_11_12_225424_create_transactions_table', 10),
(27, '2023_11_12_225431_create_affiliate_histories_table', 10),
(28, '2023_11_12_234643_add_field_to_wallet_table', 11),
(29, '2023_11_14_203632_create_likes_table', 12),
(30, '2023_09_27_214903_create_wallet_changes_table', 13),
(31, '2023_11_16_155140_create_permission_tables', 14),
(32, '2023_11_17_012533_add_language_to_users_table', 15),
(33, '2023_11_22_171616_create_football_leagues_table', 16),
(34, '2023_11_22_175530_create_football_venues_table', 17),
(35, '2023_11_22_175547_create_football_teams_table', 17),
(36, '2023_11_23_143637_create_football_events_table', 18),
(38, '2023_11_29_134520_create_sport_bets_table', 19),
(39, '2023_11_29_135451_create_sport_bets_odds_table', 19),
(40, '2023_11_30_195548_create_gateways_table', 20),
(41, '2023_11_30_195557_create_games_keys_table', 20),
(42, '2023_11_30_195609_create_setting_mails_table', 20),
(43, '2023_10_08_111755_add_fields_to_game_exclusives_table', 20),
(44, '2023_10_07_183921_create_game_exclusives_table', 21),
(45, '2023_10_11_144956_create_system_wallets_table', 22),
(46, '2023_12_18_172721_create_banners_table', 23),
(47, '2023_12_20_135908_create_casino_games_salsas_table', 24),
(48, '2023_12_23_224032_create_fivers_providers_table', 25),
(49, '2023_12_23_224105_create_fivers_games_table', 25),
(50, '2023_12_31_121453_create_custom_layouts_table', 26),
(51, '2024_01_01_193712_create_g_g_r_games_fivers_table', 27),
(52, '2024_01_14_155144_create_missions_table', 28),
(53, '2024_01_14_155150_create_mission_users_table', 28),
(54, '2024_01_19_120728_create_ka_gamings_table', 29),
(55, '2024_01_19_170650_create_categories_table', 30),
(56, '2024_01_19_170657_create_providers_table', 30),
(57, '2024_01_19_170658_create_games_table', 31),
(58, '2023_10_07_183920_create_categories_table', 32),
(59, '2023_10_07_183921_create_providers_table', 33),
(60, '2023_10_07_183922_create_games_table', 34),
(61, '2024_01_20_144529_create_category_games_table', 35),
(62, '2024_01_20_182155_add_vibra_to_games_keys_table', 36),
(63, '2024_01_21_173742_create_game_favorites_table', 37),
(64, '2024_01_21_173752_create_game_likes_table', 37),
(65, '2024_01_21_173803_create_game_reviews_table', 37),
(66, '2024_01_11_231932_create_vibra_casino_games_table', 38),
(69, '2024_01_28_194456_add_vip_to_wallet_table', 40),
(68, '2024_01_28_194645_create_vips_table', 39),
(70, '2024_01_28_231843_create_vip_users_table', 41),
(71, '2024_01_29_102939_add_paid_to_limits_table', 41),
(72, '2024_01_10_001705_create_sub_affiliates_table', 42),
(73, '2024_01_30_120547_create_affiliate_withdraws_table', 43),
(74, '2024_02_09_233936_add_worldslot_to_games_keys_table', 44),
(75, '2024_02_10_191215_add_disable_spin_to_settings_table', 45),
(76, '2024_02_17_210822_add_games2_to_games_keys_table', 46),
(78, '2024_02_20_004853_add_sub_to_settings_table', 47),
(79, '2024_02_24_121146_add_header_to_custom_layouts_table', 48),
(80, '2024_02_26_144235_create_ggr_games_world_slots_table', 49),
(81, '2024_03_01_172613_add_evergame_to_games_keys_table', 50),
(82, '2024_03_03_201700_add_venixkey_to_games_keys_table', 51),
(83, '2024_03_08_201557_add_play_gaming_to_games_keys_table', 52),
(84, '2024_03_21_154342_add_headerbody_to_custom_layouts_table', 53),
(85, '2024_03_21_154342_add_headerbody_to_custom_layouts_table', 54),
(86, '2024_03_21_223739_add_sharkpay_to_gateways_table', 55),
(87, '2024_03_21_230017_add_reference_to_transactions_table', 56),
(88, '2024_03_24_125025_add_rollver_protection_to_settings_table', 57),
(89, '2024_03_24_134101_add_accept_bonus_to_transactions_table', 58),
(90, '2024_03_24_172243_add_receita_to_affiliate_histories_table', 59),
(91, '2024_03_26_161932_add_baseline_column_to_settings_table', 60),
(92, '2024_03_26_234226_add_playigaming_column_to_games_key_table', 61),
(93, '2024_03_25_231103_add_mercado_pago_column_to_gateways_table', 62),
(94, '2024_03_30_215051_add_social_to_custom_layouts_table', 63),
(98, '2024_03_30_225900_create_digito_pay_payments_table', 66),
(96, '2024_03_30_225929_add_digitopay_to_gateways_table', 64),
(97, '2024_03_31_124211_add_digitopay_to_settings_table', 65),
(99, '2024_04_02_140932_add_default_gateway_to_settings_table', 67),
(100, '2024_03_08_201557_add_imperium_games_to_games_keys_table', 68);

-- --------------------------------------------------------

--
-- Estrutura para tabela `missions`
--

CREATE TABLE `missions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `challenge_name` varchar(191) NOT NULL,
  `challenge_description` text NOT NULL,
  `challenge_rules` text NOT NULL,
  `challenge_type` varchar(20) NOT NULL DEFAULT 'game',
  `challenge_link` varchar(191) DEFAULT NULL,
  `challenge_start_date` datetime NOT NULL,
  `challenge_end_date` datetime NOT NULL,
  `challenge_bonus` decimal(20,2) NOT NULL DEFAULT '0.00',
  `challenge_total` bigint(20) NOT NULL DEFAULT '1',
  `challenge_currency` varchar(5) NOT NULL,
  `challenge_provider` varchar(50) DEFAULT NULL,
  `challenge_gameid` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `recargas_cumulativas` decimal(10,2) DEFAULT '0.00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `mission_deposit`
--

CREATE TABLE `mission_deposit` (
  `id` bigint(20) NOT NULL,
  `bonus_amount` decimal(10,2) DEFAULT NULL,
  `description` text,
  `name_mission` varchar(255) DEFAULT NULL,
  `deposit_acumulated_necessario` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `mission_deposit`
--

INSERT INTO `mission_deposit` (`id`, `bonus_amount`, `description`, `name_mission`, `deposit_acumulated_necessario`, `created_at`, `updated_at`) VALUES
(1, 10.00, NULL, 'Recarga cumulativa: 1000', 1000.00, '2024-08-15 05:57:39', '2024-10-19 19:46:59'),
(2, 50.00, NULL, 'Recarga Acumulativa: 5000', 5000.00, '2024-08-15 06:29:46', '2024-10-19 19:47:17'),
(3, 250.00, NULL, 'Recarga Acumulativa: 25000', 25000.00, '2024-08-15 06:46:57', '2024-10-19 19:47:35'),
(4, 500.00, NULL, 'Recarga Acumulativa: 50000', 50000.00, '2024-08-21 06:08:56', '2024-10-19 19:47:54'),
(5, 1000.00, NULL, 'Recarga Acumulativa: 100000', 100000.00, '2024-08-21 06:09:18', '2024-10-19 19:48:35');

-- --------------------------------------------------------

--
-- Estrutura para tabela `mission_deposit_user`
--

CREATE TABLE `mission_deposit_user` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `mission_deposit_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `wallet_bonus` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `mission_deposit_user`
--

INSERT INTO `mission_deposit_user` (`id`, `user_id`, `mission_deposit_id`, `status`, `wallet_bonus`, `created_at`, `updated_at`) VALUES
(114, 1, 1, '0', NULL, '2024-08-28 06:48:38', '2024-08-28 06:48:38'),
(115, 1, 2, '0', NULL, '2024-08-28 06:48:38', '2024-08-28 06:48:38'),
(116, 1, 3, '0', NULL, '2024-08-28 06:48:38', '2024-08-28 06:48:38'),
(117, 1, 4, '0', NULL, '2024-08-28 06:48:38', '2024-08-28 06:48:38'),
(118, 1, 5, '0', NULL, '2024-08-28 06:48:38', '2024-08-28 06:48:38'),
(119, 17484599, 1, '0', 10.00, '2024-08-29 01:49:05', '2024-08-29 01:49:05'),
(120, 17484599, 2, '0', 50.00, '2024-08-29 01:49:05', '2024-08-29 01:49:05'),
(121, 17484599, 3, '0', 250.00, '2024-08-29 01:49:05', '2024-08-29 01:49:05'),
(122, 17484599, 4, '0', 500.00, '2024-08-29 01:49:05', '2024-08-29 01:49:05'),
(123, 17484599, 5, '0', 1000.00, '2024-08-29 01:49:05', '2024-08-29 01:49:05'),
(124, 17484600, 1, '0', 10.00, '2024-08-29 04:03:39', '2024-08-29 04:03:39'),
(125, 17484600, 2, '0', 50.00, '2024-08-29 04:03:39', '2024-08-29 04:03:39'),
(126, 17484600, 3, '0', 250.00, '2024-08-29 04:03:39', '2024-08-29 04:03:39'),
(127, 17484600, 4, '0', 500.00, '2024-08-29 04:03:39', '2024-08-29 04:03:39'),
(128, 17484600, 5, '0', 1000.00, '2024-08-29 04:03:39', '2024-08-29 04:03:39'),
(129, 17484601, 1, '0', 10.00, '2024-08-29 04:30:37', '2024-08-29 04:30:37'),
(130, 17484601, 2, '0', 50.00, '2024-08-29 04:30:37', '2024-08-29 04:30:37'),
(131, 17484601, 3, '0', 250.00, '2024-08-29 04:30:37', '2024-08-29 04:30:37'),
(132, 17484601, 4, '0', 500.00, '2024-08-29 04:30:37', '2024-08-29 04:30:37'),
(133, 17484601, 5, '0', 1000.00, '2024-08-29 04:30:37', '2024-08-29 04:30:37'),
(134, 17484602, 1, '0', 10.00, '2024-08-29 21:22:37', '2024-08-29 21:22:37'),
(135, 17484602, 2, '0', 50.00, '2024-08-29 21:22:37', '2024-08-29 21:22:37'),
(136, 17484602, 3, '0', 250.00, '2024-08-29 21:22:37', '2024-08-29 21:22:37'),
(137, 17484602, 4, '0', 500.00, '2024-08-29 21:22:37', '2024-08-29 21:22:37'),
(138, 17484602, 5, '0', 1000.00, '2024-08-29 21:22:37', '2024-08-29 21:22:37'),
(139, 17484603, 1, '0', 10.00, '2024-09-02 18:34:46', '2024-09-02 18:34:46'),
(140, 17484603, 2, '0', 50.00, '2024-09-02 18:34:46', '2024-09-02 18:34:46'),
(141, 17484603, 3, '0', 250.00, '2024-09-02 18:34:46', '2024-09-02 18:34:46'),
(142, 17484603, 4, '0', 500.00, '2024-09-02 18:34:46', '2024-09-02 18:34:46'),
(143, 17484603, 5, '0', 1000.00, '2024-09-02 18:34:46', '2024-09-02 18:34:46'),
(144, 17484604, 1, '0', 10.00, '2024-09-02 18:35:46', '2024-09-02 18:35:46'),
(145, 17484604, 2, '0', 50.00, '2024-09-02 18:35:46', '2024-09-02 18:35:46'),
(146, 17484604, 3, '0', 250.00, '2024-09-02 18:35:46', '2024-09-02 18:35:46'),
(147, 17484604, 4, '0', 500.00, '2024-09-02 18:35:46', '2024-09-02 18:35:46'),
(148, 17484604, 5, '0', 1000.00, '2024-09-02 18:35:46', '2024-09-02 18:35:46'),
(149, 17484605, 1, '0', 10.00, '2024-09-02 18:58:54', '2024-09-02 18:58:54'),
(150, 17484605, 2, '0', 50.00, '2024-09-02 18:58:54', '2024-09-02 18:58:54'),
(151, 17484605, 3, '0', 250.00, '2024-09-02 18:58:54', '2024-09-02 18:58:54'),
(152, 17484605, 4, '0', 500.00, '2024-09-02 18:58:54', '2024-09-02 18:58:54'),
(153, 17484605, 5, '0', 1000.00, '2024-09-02 18:58:54', '2024-09-02 18:58:54'),
(154, 17484606, 1, '0', 10.00, '2024-09-02 19:56:34', '2024-09-02 19:56:34'),
(155, 17484606, 2, '0', 50.00, '2024-09-02 19:56:34', '2024-09-02 19:56:34'),
(156, 17484606, 3, '0', 250.00, '2024-09-02 19:56:34', '2024-09-02 19:56:34'),
(157, 17484606, 4, '0', 500.00, '2024-09-02 19:56:34', '2024-09-02 19:56:34'),
(158, 17484606, 5, '0', 1000.00, '2024-09-02 19:56:34', '2024-09-02 19:56:34'),
(159, 17484607, 1, '0', 10.00, '2024-09-02 20:00:42', '2024-09-02 20:00:42'),
(160, 17484607, 2, '0', 50.00, '2024-09-02 20:00:42', '2024-09-02 20:00:42'),
(161, 17484607, 3, '0', 250.00, '2024-09-02 20:00:42', '2024-09-02 20:00:42'),
(162, 17484607, 4, '0', 500.00, '2024-09-02 20:00:42', '2024-09-02 20:00:42'),
(163, 17484607, 5, '0', 1000.00, '2024-09-02 20:00:42', '2024-09-02 20:00:42'),
(164, 17484608, 1, '0', 10.00, '2024-09-06 05:57:07', '2024-09-06 05:57:07'),
(165, 17484608, 2, '0', 50.00, '2024-09-06 05:57:07', '2024-09-06 05:57:07'),
(166, 17484608, 3, '0', 250.00, '2024-09-06 05:57:07', '2024-09-06 05:57:07'),
(167, 17484608, 4, '0', 500.00, '2024-09-06 05:57:07', '2024-09-06 05:57:07'),
(168, 17484608, 5, '0', 1000.00, '2024-09-06 05:57:07', '2024-09-06 05:57:07'),
(169, 17484609, 1, '0', 10.00, '2024-09-06 05:58:25', '2024-09-06 05:58:25'),
(170, 17484609, 2, '0', 50.00, '2024-09-06 05:58:25', '2024-09-06 05:58:25'),
(171, 17484609, 3, '0', 250.00, '2024-09-06 05:58:25', '2024-09-06 05:58:25'),
(172, 17484609, 4, '0', 500.00, '2024-09-06 05:58:25', '2024-09-06 05:58:25'),
(173, 17484609, 5, '0', 1000.00, '2024-09-06 05:58:25', '2024-09-06 05:58:25'),
(174, 17484611, 1, '0', 10.00, '2024-09-17 07:25:27', '2024-09-17 07:25:27'),
(175, 17484611, 2, '0', 50.00, '2024-09-17 07:25:27', '2024-09-17 07:25:27'),
(176, 17484611, 3, '0', 250.00, '2024-09-17 07:25:27', '2024-09-17 07:25:27'),
(177, 17484611, 4, '0', 500.00, '2024-09-17 07:25:27', '2024-09-17 07:25:27'),
(178, 17484611, 5, '0', 1000.00, '2024-09-17 07:25:27', '2024-09-17 07:25:27'),
(179, 17484612, 1, '0', 10.00, '2024-09-17 07:27:13', '2024-09-17 07:27:13'),
(180, 17484612, 2, '0', 50.00, '2024-09-17 07:27:13', '2024-09-17 07:27:13'),
(181, 17484612, 3, '0', 250.00, '2024-09-17 07:27:13', '2024-09-17 07:27:13'),
(182, 17484612, 4, '0', 500.00, '2024-09-17 07:27:13', '2024-09-17 07:27:13'),
(183, 17484612, 5, '0', 1000.00, '2024-09-17 07:27:13', '2024-09-17 07:27:13'),
(184, 17484613, 1, '0', 10.00, '2024-09-17 07:28:50', '2024-09-17 07:28:50'),
(185, 17484613, 2, '0', 50.00, '2024-09-17 07:28:50', '2024-09-17 07:28:50'),
(186, 17484613, 3, '0', 250.00, '2024-09-17 07:28:50', '2024-09-17 07:28:50'),
(187, 17484613, 4, '0', 500.00, '2024-09-17 07:28:50', '2024-09-17 07:28:50'),
(188, 17484613, 5, '0', 1000.00, '2024-09-17 07:28:50', '2024-09-17 07:28:50'),
(189, 17484614, 1, '0', 10.00, '2024-09-24 04:59:36', '2024-09-24 04:59:36'),
(190, 17484614, 2, '0', 50.00, '2024-09-24 04:59:36', '2024-09-24 04:59:36'),
(191, 17484614, 3, '0', 250.00, '2024-09-24 04:59:36', '2024-09-24 04:59:36'),
(192, 17484614, 4, '0', 500.00, '2024-09-24 04:59:36', '2024-09-24 04:59:36'),
(193, 17484614, 5, '0', 1000.00, '2024-09-24 04:59:36', '2024-09-24 04:59:36'),
(194, 17484615, 1, '0', 10.00, '2024-09-24 05:00:44', '2024-09-24 05:00:44'),
(195, 17484615, 2, '0', 50.00, '2024-09-24 05:00:44', '2024-09-24 05:00:44'),
(196, 17484615, 3, '0', 250.00, '2024-09-24 05:00:44', '2024-09-24 05:00:44'),
(197, 17484615, 4, '0', 500.00, '2024-09-24 05:00:44', '2024-09-24 05:00:44'),
(198, 17484615, 5, '0', 1000.00, '2024-09-24 05:00:44', '2024-09-24 05:00:44'),
(199, 17484616, 1, '0', 10.00, '2024-09-24 05:52:30', '2024-09-24 05:52:30'),
(200, 17484616, 2, '0', 50.00, '2024-09-24 05:52:30', '2024-09-24 05:52:30'),
(201, 17484616, 3, '0', 250.00, '2024-09-24 05:52:30', '2024-09-24 05:52:30'),
(202, 17484616, 4, '0', 500.00, '2024-09-24 05:52:30', '2024-09-24 05:52:30'),
(203, 17484616, 5, '0', 1000.00, '2024-09-24 05:52:30', '2024-09-24 05:52:30'),
(204, 17484617, 1, '0', 10.00, '2024-09-24 14:10:16', '2024-09-24 14:10:16'),
(205, 17484617, 2, '0', 50.00, '2024-09-24 14:10:16', '2024-09-24 14:10:16'),
(206, 17484617, 3, '0', 250.00, '2024-09-24 14:10:16', '2024-09-24 14:10:16'),
(207, 17484617, 4, '0', 500.00, '2024-09-24 14:10:16', '2024-09-24 14:10:16'),
(208, 17484617, 5, '0', 1000.00, '2024-09-24 14:10:16', '2024-09-24 14:10:16'),
(209, 17484618, 1, '0', 10.00, '2024-09-24 17:21:27', '2024-09-24 17:21:27'),
(210, 17484618, 2, '0', 50.00, '2024-09-24 17:21:27', '2024-09-24 17:21:27'),
(211, 17484618, 3, '0', 250.00, '2024-09-24 17:21:27', '2024-09-24 17:21:27'),
(212, 17484618, 4, '0', 500.00, '2024-09-24 17:21:27', '2024-09-24 17:21:27'),
(213, 17484618, 5, '0', 1000.00, '2024-09-24 17:21:27', '2024-09-24 17:21:27'),
(214, 17484619, 1, '0', 10.00, '2024-09-25 12:42:56', '2024-09-25 12:42:56'),
(215, 17484619, 2, '0', 50.00, '2024-09-25 12:42:56', '2024-09-25 12:42:56'),
(216, 17484619, 3, '0', 250.00, '2024-09-25 12:42:56', '2024-09-25 12:42:56'),
(217, 17484619, 4, '0', 500.00, '2024-09-25 12:42:56', '2024-09-25 12:42:56'),
(218, 17484619, 5, '0', 1000.00, '2024-09-25 12:42:56', '2024-09-25 12:42:56'),
(219, 17484620, 1, '0', 10.00, '2024-09-26 10:35:07', '2024-09-26 10:35:07'),
(220, 17484620, 2, '0', 50.00, '2024-09-26 10:35:07', '2024-09-26 10:35:07'),
(221, 17484620, 3, '0', 250.00, '2024-09-26 10:35:07', '2024-09-26 10:35:07'),
(222, 17484620, 4, '0', 500.00, '2024-09-26 10:35:07', '2024-09-26 10:35:07'),
(223, 17484620, 5, '0', 1000.00, '2024-09-26 10:35:07', '2024-09-26 10:35:07'),
(224, 17484621, 1, '0', 10.00, '2024-09-29 17:09:40', '2024-09-29 17:09:40'),
(225, 17484621, 2, '0', 50.00, '2024-09-29 17:09:40', '2024-09-29 17:09:40'),
(226, 17484621, 3, '0', 250.00, '2024-09-29 17:09:40', '2024-09-29 17:09:40'),
(227, 17484621, 4, '0', 500.00, '2024-09-29 17:09:40', '2024-09-29 17:09:40'),
(228, 17484621, 5, '0', 1000.00, '2024-09-29 17:09:40', '2024-09-29 17:09:40'),
(229, 17484622, 1, '0', 10.00, '2024-09-30 07:58:45', '2024-09-30 07:58:45'),
(230, 17484622, 2, '0', 50.00, '2024-09-30 07:58:45', '2024-09-30 07:58:45'),
(231, 17484622, 3, '0', 250.00, '2024-09-30 07:58:45', '2024-09-30 07:58:45'),
(232, 17484622, 4, '0', 500.00, '2024-09-30 07:58:45', '2024-09-30 07:58:45'),
(233, 17484622, 5, '0', 1000.00, '2024-09-30 07:58:45', '2024-09-30 07:58:45'),
(234, 17484623, 1, '0', 10.00, '2024-10-01 01:09:19', '2024-10-01 01:09:19'),
(235, 17484623, 2, '0', 50.00, '2024-10-01 01:09:19', '2024-10-01 01:09:19'),
(236, 17484623, 3, '0', 250.00, '2024-10-01 01:09:19', '2024-10-01 01:09:19'),
(237, 17484623, 4, '0', 500.00, '2024-10-01 01:09:19', '2024-10-01 01:09:19'),
(238, 17484623, 5, '0', 1000.00, '2024-10-01 01:09:19', '2024-10-01 01:09:19'),
(239, 17484624, 1, '0', 10.00, '2024-10-01 22:34:47', '2024-10-01 22:34:47'),
(240, 17484624, 2, '0', 50.00, '2024-10-01 22:34:47', '2024-10-01 22:34:47'),
(241, 17484624, 3, '0', 250.00, '2024-10-01 22:34:47', '2024-10-01 22:34:47'),
(242, 17484624, 4, '0', 500.00, '2024-10-01 22:34:47', '2024-10-01 22:34:47'),
(243, 17484624, 5, '0', 1000.00, '2024-10-01 22:34:47', '2024-10-01 22:34:47'),
(244, 17484625, 1, '0', 10.00, '2024-10-05 16:26:30', '2024-10-05 16:26:30'),
(245, 17484625, 2, '0', 50.00, '2024-10-05 16:26:30', '2024-10-05 16:26:30'),
(246, 17484625, 3, '0', 250.00, '2024-10-05 16:26:30', '2024-10-05 16:26:30'),
(247, 17484625, 4, '0', 500.00, '2024-10-05 16:26:30', '2024-10-05 16:26:30'),
(248, 17484625, 5, '0', 1000.00, '2024-10-05 16:26:30', '2024-10-05 16:26:30'),
(249, 17484626, 1, '0', 10.00, '2024-10-06 08:08:10', '2024-10-06 08:08:10'),
(250, 17484626, 2, '0', 50.00, '2024-10-06 08:08:10', '2024-10-06 08:08:10'),
(251, 17484626, 3, '0', 250.00, '2024-10-06 08:08:10', '2024-10-06 08:08:10'),
(252, 17484626, 4, '0', 500.00, '2024-10-06 08:08:10', '2024-10-06 08:08:10'),
(253, 17484626, 5, '0', 1000.00, '2024-10-06 08:08:10', '2024-10-06 08:08:10'),
(254, 17484627, 1, '0', 10.00, '2024-10-06 18:13:13', '2024-10-06 18:13:13'),
(255, 17484627, 2, '0', 50.00, '2024-10-06 18:13:13', '2024-10-06 18:13:13'),
(256, 17484627, 3, '0', 250.00, '2024-10-06 18:13:13', '2024-10-06 18:13:13'),
(257, 17484627, 4, '0', 500.00, '2024-10-06 18:13:13', '2024-10-06 18:13:13'),
(258, 17484627, 5, '0', 1000.00, '2024-10-06 18:13:13', '2024-10-06 18:13:13'),
(259, 17484628, 1, '0', 10.00, '2024-10-06 23:06:42', '2024-10-06 23:06:42'),
(260, 17484628, 2, '0', 50.00, '2024-10-06 23:06:42', '2024-10-06 23:06:42'),
(261, 17484628, 3, '0', 250.00, '2024-10-06 23:06:42', '2024-10-06 23:06:42'),
(262, 17484628, 4, '0', 500.00, '2024-10-06 23:06:42', '2024-10-06 23:06:42'),
(263, 17484628, 5, '0', 1000.00, '2024-10-06 23:06:42', '2024-10-06 23:06:42'),
(264, 17484629, 1, '0', 10.00, '2024-10-07 19:58:49', '2024-10-07 19:58:49'),
(265, 17484629, 2, '0', 50.00, '2024-10-07 19:58:49', '2024-10-07 19:58:49'),
(266, 17484629, 3, '0', 250.00, '2024-10-07 19:58:49', '2024-10-07 19:58:49'),
(267, 17484629, 4, '0', 500.00, '2024-10-07 19:58:49', '2024-10-07 19:58:49'),
(268, 17484629, 5, '0', 1000.00, '2024-10-07 19:58:49', '2024-10-07 19:58:49'),
(269, 17484630, 1, '0', 10.00, '2024-10-08 02:21:49', '2024-10-08 02:21:49'),
(270, 17484630, 2, '0', 50.00, '2024-10-08 02:21:49', '2024-10-08 02:21:49'),
(271, 17484630, 3, '0', 250.00, '2024-10-08 02:21:49', '2024-10-08 02:21:49'),
(272, 17484630, 4, '0', 500.00, '2024-10-08 02:21:49', '2024-10-08 02:21:49'),
(273, 17484630, 5, '0', 1000.00, '2024-10-08 02:21:49', '2024-10-08 02:21:49'),
(274, 17484631, 1, '0', 10.00, '2024-10-08 11:59:06', '2024-10-08 11:59:06'),
(275, 17484631, 2, '0', 50.00, '2024-10-08 11:59:06', '2024-10-08 11:59:06'),
(276, 17484631, 3, '0', 250.00, '2024-10-08 11:59:06', '2024-10-08 11:59:06'),
(277, 17484631, 4, '0', 500.00, '2024-10-08 11:59:06', '2024-10-08 11:59:06'),
(278, 17484631, 5, '0', 1000.00, '2024-10-08 11:59:06', '2024-10-08 11:59:06'),
(279, 17484632, 1, '0', 10.00, '2024-10-10 02:55:59', '2024-10-10 02:55:59'),
(280, 17484632, 2, '0', 50.00, '2024-10-10 02:55:59', '2024-10-10 02:55:59'),
(281, 17484632, 3, '0', 250.00, '2024-10-10 02:55:59', '2024-10-10 02:55:59'),
(282, 17484632, 4, '0', 500.00, '2024-10-10 02:55:59', '2024-10-10 02:55:59'),
(283, 17484632, 5, '0', 1000.00, '2024-10-10 02:55:59', '2024-10-10 02:55:59'),
(284, 17484633, 1, '0', 10.00, '2024-10-10 03:21:43', '2024-10-10 03:21:43'),
(285, 17484633, 2, '0', 50.00, '2024-10-10 03:21:43', '2024-10-10 03:21:43'),
(286, 17484633, 3, '0', 250.00, '2024-10-10 03:21:43', '2024-10-10 03:21:43'),
(287, 17484633, 4, '0', 500.00, '2024-10-10 03:21:43', '2024-10-10 03:21:43'),
(288, 17484633, 5, '0', 1000.00, '2024-10-10 03:21:43', '2024-10-10 03:21:43'),
(289, 17484634, 1, '0', 10.00, '2024-10-10 03:22:55', '2024-10-10 03:22:55'),
(290, 17484634, 2, '0', 50.00, '2024-10-10 03:22:55', '2024-10-10 03:22:55'),
(291, 17484634, 3, '0', 250.00, '2024-10-10 03:22:55', '2024-10-10 03:22:55'),
(292, 17484634, 4, '0', 500.00, '2024-10-10 03:22:55', '2024-10-10 03:22:55'),
(293, 17484634, 5, '0', 1000.00, '2024-10-10 03:22:55', '2024-10-10 03:22:55'),
(294, 17484635, 1, '0', 10.00, '2024-10-10 03:25:37', '2024-10-10 03:25:37'),
(295, 17484635, 2, '0', 50.00, '2024-10-10 03:25:37', '2024-10-10 03:25:37'),
(296, 17484635, 3, '0', 250.00, '2024-10-10 03:25:37', '2024-10-10 03:25:37'),
(297, 17484635, 4, '0', 500.00, '2024-10-10 03:25:37', '2024-10-10 03:25:37'),
(298, 17484635, 5, '0', 1000.00, '2024-10-10 03:25:37', '2024-10-10 03:25:37'),
(299, 17484636, 1, '0', 10.00, '2024-10-14 00:31:22', '2024-10-14 00:31:22'),
(300, 17484636, 2, '0', 50.00, '2024-10-14 00:31:22', '2024-10-14 00:31:22'),
(301, 17484636, 3, '0', 250.00, '2024-10-14 00:31:22', '2024-10-14 00:31:22'),
(302, 17484636, 4, '0', 500.00, '2024-10-14 00:31:22', '2024-10-14 00:31:22'),
(303, 17484636, 5, '0', 1000.00, '2024-10-14 00:31:22', '2024-10-14 00:31:22'),
(304, 17484637, 1, '0', 10.00, '2024-10-14 00:39:16', '2024-10-14 00:39:16'),
(305, 17484637, 2, '0', 50.00, '2024-10-14 00:39:16', '2024-10-14 00:39:16'),
(306, 17484637, 3, '0', 250.00, '2024-10-14 00:39:16', '2024-10-14 00:39:16'),
(307, 17484637, 4, '0', 500.00, '2024-10-14 00:39:16', '2024-10-14 00:39:16'),
(308, 17484637, 5, '0', 1000.00, '2024-10-14 00:39:16', '2024-10-14 00:39:16'),
(309, 17484638, 1, '0', 10.00, '2024-10-14 07:41:08', '2024-10-14 07:41:08'),
(310, 17484638, 2, '0', 50.00, '2024-10-14 07:41:08', '2024-10-14 07:41:08'),
(311, 17484638, 3, '0', 250.00, '2024-10-14 07:41:08', '2024-10-14 07:41:08'),
(312, 17484638, 4, '0', 500.00, '2024-10-14 07:41:08', '2024-10-14 07:41:08'),
(313, 17484638, 5, '0', 1000.00, '2024-10-14 07:41:08', '2024-10-14 07:41:08'),
(314, 17484639, 1, '0', 10.00, '2024-10-14 14:52:10', '2024-10-14 14:52:10'),
(315, 17484639, 2, '0', 50.00, '2024-10-14 14:52:10', '2024-10-14 14:52:10'),
(316, 17484639, 3, '0', 250.00, '2024-10-14 14:52:10', '2024-10-14 14:52:10'),
(317, 17484639, 4, '0', 500.00, '2024-10-14 14:52:10', '2024-10-14 14:52:10'),
(318, 17484639, 5, '0', 1000.00, '2024-10-14 14:52:10', '2024-10-14 14:52:10'),
(319, 17484640, 1, '0', 10.00, '2024-10-17 06:14:01', '2024-10-17 06:14:01'),
(320, 17484640, 2, '0', 50.00, '2024-10-17 06:14:01', '2024-10-17 06:14:01'),
(321, 17484640, 3, '0', 250.00, '2024-10-17 06:14:01', '2024-10-17 06:14:01'),
(322, 17484640, 4, '0', 500.00, '2024-10-17 06:14:01', '2024-10-17 06:14:01'),
(323, 17484640, 5, '0', 1000.00, '2024-10-17 06:14:01', '2024-10-17 06:14:01'),
(324, 17484641, 1, '0', 10.00, '2024-10-17 07:21:55', '2024-10-17 07:21:55'),
(325, 17484641, 2, '0', 50.00, '2024-10-17 07:21:55', '2024-10-17 07:21:55'),
(326, 17484641, 3, '0', 250.00, '2024-10-17 07:21:55', '2024-10-17 07:21:55'),
(327, 17484641, 4, '0', 500.00, '2024-10-17 07:21:55', '2024-10-17 07:21:55'),
(328, 17484641, 5, '0', 1000.00, '2024-10-17 07:21:55', '2024-10-17 07:21:55'),
(329, 17484642, 1, '0', 10.00, '2024-10-17 07:24:15', '2024-10-17 07:24:15'),
(330, 17484642, 2, '0', 50.00, '2024-10-17 07:24:15', '2024-10-17 07:24:15'),
(331, 17484642, 3, '0', 250.00, '2024-10-17 07:24:15', '2024-10-17 07:24:15'),
(332, 17484642, 4, '0', 500.00, '2024-10-17 07:24:15', '2024-10-17 07:24:15'),
(333, 17484642, 5, '0', 1000.00, '2024-10-17 07:24:15', '2024-10-17 07:24:15'),
(334, 17484643, 1, '0', 10.00, '2024-10-17 07:26:01', '2024-10-17 07:26:01'),
(335, 17484643, 2, '0', 50.00, '2024-10-17 07:26:01', '2024-10-17 07:26:01'),
(336, 17484643, 3, '0', 250.00, '2024-10-17 07:26:01', '2024-10-17 07:26:01'),
(337, 17484643, 4, '0', 500.00, '2024-10-17 07:26:01', '2024-10-17 07:26:01'),
(338, 17484643, 5, '0', 1000.00, '2024-10-17 07:26:01', '2024-10-17 07:26:01'),
(339, 17484644, 1, '0', 10.00, '2024-10-21 02:24:47', '2024-10-21 02:24:47'),
(340, 17484644, 2, '0', 50.00, '2024-10-21 02:24:47', '2024-10-21 02:24:47'),
(341, 17484644, 3, '0', 250.00, '2024-10-21 02:24:47', '2024-10-21 02:24:47'),
(342, 17484644, 4, '0', 500.00, '2024-10-21 02:24:47', '2024-10-21 02:24:47'),
(343, 17484644, 5, '0', 1000.00, '2024-10-21 02:24:47', '2024-10-21 02:24:47'),
(344, 17484645, 1, '0', 10.00, '2024-10-22 06:38:57', '2024-10-22 06:38:57'),
(345, 17484645, 2, '0', 50.00, '2024-10-22 06:38:57', '2024-10-22 06:38:57'),
(346, 17484645, 3, '0', 250.00, '2024-10-22 06:38:57', '2024-10-22 06:38:57'),
(347, 17484645, 4, '0', 500.00, '2024-10-22 06:38:57', '2024-10-22 06:38:57'),
(348, 17484645, 5, '0', 1000.00, '2024-10-22 06:38:57', '2024-10-22 06:38:57'),
(349, 17484646, 1, '0', 10.00, '2024-10-23 18:30:03', '2024-10-23 18:30:03'),
(350, 17484646, 2, '0', 50.00, '2024-10-23 18:30:03', '2024-10-23 18:30:03'),
(351, 17484646, 3, '0', 250.00, '2024-10-23 18:30:03', '2024-10-23 18:30:03'),
(352, 17484646, 4, '0', 500.00, '2024-10-23 18:30:03', '2024-10-23 18:30:03'),
(353, 17484646, 5, '0', 1000.00, '2024-10-23 18:30:03', '2024-10-23 18:30:03'),
(354, 17484647, 1, '0', 10.00, '2024-10-23 21:16:24', '2024-10-23 21:16:24'),
(355, 17484647, 2, '0', 50.00, '2024-10-23 21:16:24', '2024-10-23 21:16:24'),
(356, 17484647, 3, '0', 250.00, '2024-10-23 21:16:24', '2024-10-23 21:16:24'),
(357, 17484647, 4, '0', 500.00, '2024-10-23 21:16:24', '2024-10-23 21:16:24'),
(358, 17484647, 5, '0', 1000.00, '2024-10-23 21:16:24', '2024-10-23 21:16:24'),
(359, 17484648, 1, '0', 10.00, '2024-10-23 22:11:32', '2024-10-23 22:11:32'),
(360, 17484648, 2, '0', 50.00, '2024-10-23 22:11:32', '2024-10-23 22:11:32'),
(361, 17484648, 3, '0', 250.00, '2024-10-23 22:11:32', '2024-10-23 22:11:32'),
(362, 17484648, 4, '0', 500.00, '2024-10-23 22:11:32', '2024-10-23 22:11:32'),
(363, 17484648, 5, '0', 1000.00, '2024-10-23 22:11:32', '2024-10-23 22:11:32'),
(364, 17484649, 1, '0', 10.00, '2024-10-31 05:09:45', '2024-10-31 05:09:45'),
(365, 17484649, 2, '0', 50.00, '2024-10-31 05:09:45', '2024-10-31 05:09:45'),
(366, 17484649, 3, '0', 250.00, '2024-10-31 05:09:45', '2024-10-31 05:09:45'),
(367, 17484649, 4, '0', 500.00, '2024-10-31 05:09:45', '2024-10-31 05:09:45'),
(368, 17484649, 5, '0', 1000.00, '2024-10-31 05:09:45', '2024-10-31 05:09:45'),
(369, 17484650, 1, '0', 10.00, '2024-10-31 05:10:44', '2024-10-31 05:10:44'),
(370, 17484650, 2, '0', 50.00, '2024-10-31 05:10:44', '2024-10-31 05:10:44'),
(371, 17484650, 3, '0', 250.00, '2024-10-31 05:10:44', '2024-10-31 05:10:44'),
(372, 17484650, 4, '0', 500.00, '2024-10-31 05:10:44', '2024-10-31 05:10:44'),
(373, 17484650, 5, '0', 1000.00, '2024-10-31 05:10:44', '2024-10-31 05:10:44'),
(374, 17484651, 1, '0', 10.00, '2024-10-31 05:13:38', '2024-10-31 05:13:38'),
(375, 17484651, 2, '0', 50.00, '2024-10-31 05:13:38', '2024-10-31 05:13:38'),
(376, 17484651, 3, '0', 250.00, '2024-10-31 05:13:38', '2024-10-31 05:13:38'),
(377, 17484651, 4, '0', 500.00, '2024-10-31 05:13:38', '2024-10-31 05:13:38'),
(378, 17484651, 5, '0', 1000.00, '2024-10-31 05:13:38', '2024-10-31 05:13:38'),
(379, 17484652, 1, '0', 10.00, '2024-11-01 02:56:26', '2024-11-01 02:56:26'),
(380, 17484652, 2, '0', 50.00, '2024-11-01 02:56:26', '2024-11-01 02:56:26'),
(381, 17484652, 3, '0', 250.00, '2024-11-01 02:56:26', '2024-11-01 02:56:26'),
(382, 17484652, 4, '0', 500.00, '2024-11-01 02:56:26', '2024-11-01 02:56:26'),
(383, 17484652, 5, '0', 1000.00, '2024-11-01 02:56:26', '2024-11-01 02:56:26'),
(384, 17484653, 1, '0', 10.00, '2024-11-02 02:11:44', '2024-11-02 02:11:44'),
(385, 17484653, 2, '0', 50.00, '2024-11-02 02:11:44', '2024-11-02 02:11:44'),
(386, 17484653, 3, '0', 250.00, '2024-11-02 02:11:44', '2024-11-02 02:11:44'),
(387, 17484653, 4, '0', 500.00, '2024-11-02 02:11:44', '2024-11-02 02:11:44'),
(388, 17484653, 5, '0', 1000.00, '2024-11-02 02:11:44', '2024-11-02 02:11:44'),
(389, 17484654, 1, '0', 10.00, '2024-11-26 22:24:39', '2024-11-26 22:24:39'),
(390, 17484654, 2, '0', 50.00, '2024-11-26 22:24:39', '2024-11-26 22:24:39'),
(391, 17484654, 3, '0', 250.00, '2024-11-26 22:24:39', '2024-11-26 22:24:39'),
(392, 17484654, 4, '0', 500.00, '2024-11-26 22:24:39', '2024-11-26 22:24:39'),
(393, 17484654, 5, '0', 1000.00, '2024-11-26 22:24:39', '2024-11-26 22:24:39'),
(394, 17484655, 1, '0', 10.00, '2024-11-30 01:38:05', '2024-11-30 01:38:05'),
(395, 17484655, 2, '0', 50.00, '2024-11-30 01:38:05', '2024-11-30 01:38:05'),
(396, 17484655, 3, '0', 250.00, '2024-11-30 01:38:05', '2024-11-30 01:38:05'),
(397, 17484655, 4, '0', 500.00, '2024-11-30 01:38:05', '2024-11-30 01:38:05'),
(398, 17484655, 5, '0', 1000.00, '2024-11-30 01:38:05', '2024-11-30 01:38:05'),
(399, 17484656, 1, '0', 10.00, '2024-11-30 01:44:12', '2024-11-30 01:44:12'),
(400, 17484656, 2, '0', 50.00, '2024-11-30 01:44:12', '2024-11-30 01:44:12'),
(401, 17484656, 3, '0', 250.00, '2024-11-30 01:44:12', '2024-11-30 01:44:12'),
(402, 17484656, 4, '0', 500.00, '2024-11-30 01:44:12', '2024-11-30 01:44:12'),
(403, 17484656, 5, '0', 1000.00, '2024-11-30 01:44:12', '2024-11-30 01:44:12'),
(404, 17484657, 1, '0', 10.00, '2024-11-30 23:23:32', '2024-11-30 23:23:32'),
(405, 17484657, 2, '0', 50.00, '2024-11-30 23:23:32', '2024-11-30 23:23:32'),
(406, 17484657, 3, '0', 250.00, '2024-11-30 23:23:32', '2024-11-30 23:23:32'),
(407, 17484657, 4, '0', 500.00, '2024-11-30 23:23:32', '2024-11-30 23:23:32'),
(408, 17484657, 5, '0', 1000.00, '2024-11-30 23:23:32', '2024-11-30 23:23:32'),
(409, 17484658, 1, '0', 10.00, '2024-12-01 14:42:11', '2024-12-01 14:42:11'),
(410, 17484658, 2, '0', 50.00, '2024-12-01 14:42:11', '2024-12-01 14:42:11'),
(411, 17484658, 3, '0', 250.00, '2024-12-01 14:42:11', '2024-12-01 14:42:11'),
(412, 17484658, 4, '0', 500.00, '2024-12-01 14:42:11', '2024-12-01 14:42:11'),
(413, 17484658, 5, '0', 1000.00, '2024-12-01 14:42:11', '2024-12-01 14:42:11'),
(414, 17484659, 1, '0', 10.00, '2024-12-01 15:54:52', '2024-12-01 15:54:52'),
(415, 17484659, 2, '0', 50.00, '2024-12-01 15:54:52', '2024-12-01 15:54:52'),
(416, 17484659, 3, '0', 250.00, '2024-12-01 15:54:52', '2024-12-01 15:54:52'),
(417, 17484659, 4, '0', 500.00, '2024-12-01 15:54:52', '2024-12-01 15:54:52'),
(418, 17484659, 5, '0', 1000.00, '2024-12-01 15:54:52', '2024-12-01 15:54:52'),
(419, 17484660, 1, '0', 10.00, '2024-12-01 16:10:40', '2024-12-01 16:10:40'),
(420, 17484660, 2, '0', 50.00, '2024-12-01 16:10:40', '2024-12-01 16:10:40'),
(421, 17484660, 3, '0', 250.00, '2024-12-01 16:10:40', '2024-12-01 16:10:40'),
(422, 17484660, 4, '0', 500.00, '2024-12-01 16:10:40', '2024-12-01 16:10:40'),
(423, 17484660, 5, '0', 1000.00, '2024-12-01 16:10:40', '2024-12-01 16:10:40'),
(424, 17484661, 1, '0', 10.00, '2024-12-01 18:18:50', '2024-12-01 18:18:50'),
(425, 17484661, 2, '0', 50.00, '2024-12-01 18:18:50', '2024-12-01 18:18:50'),
(426, 17484661, 3, '0', 250.00, '2024-12-01 18:18:50', '2024-12-01 18:18:50'),
(427, 17484661, 4, '0', 500.00, '2024-12-01 18:18:50', '2024-12-01 18:18:50'),
(428, 17484661, 5, '0', 1000.00, '2024-12-01 18:18:50', '2024-12-01 18:18:50'),
(429, 17484662, 1, '0', 10.00, '2024-12-01 18:56:29', '2024-12-01 18:56:29'),
(430, 17484662, 2, '0', 50.00, '2024-12-01 18:56:29', '2024-12-01 18:56:29'),
(431, 17484662, 3, '0', 250.00, '2024-12-01 18:56:29', '2024-12-01 18:56:29'),
(432, 17484662, 4, '0', 500.00, '2024-12-01 18:56:29', '2024-12-01 18:56:29'),
(433, 17484662, 5, '0', 1000.00, '2024-12-01 18:56:29', '2024-12-01 18:56:29'),
(434, 17484663, 1, '0', 10.00, '2024-12-01 19:03:24', '2024-12-01 19:03:24'),
(435, 17484663, 2, '0', 50.00, '2024-12-01 19:03:24', '2024-12-01 19:03:24'),
(436, 17484663, 3, '0', 250.00, '2024-12-01 19:03:24', '2024-12-01 19:03:24'),
(437, 17484663, 4, '0', 500.00, '2024-12-01 19:03:24', '2024-12-01 19:03:24'),
(438, 17484663, 5, '0', 1000.00, '2024-12-01 19:03:24', '2024-12-01 19:03:24'),
(439, 17484664, 1, '0', 10.00, '2024-12-02 03:28:45', '2024-12-02 03:28:45'),
(440, 17484664, 2, '0', 50.00, '2024-12-02 03:28:45', '2024-12-02 03:28:45'),
(441, 17484664, 3, '0', 250.00, '2024-12-02 03:28:45', '2024-12-02 03:28:45'),
(442, 17484664, 4, '0', 500.00, '2024-12-02 03:28:45', '2024-12-02 03:28:45'),
(443, 17484664, 5, '0', 1000.00, '2024-12-02 03:28:45', '2024-12-02 03:28:45'),
(444, 17484665, 1, '0', 10.00, '2024-12-02 03:37:24', '2024-12-02 03:37:24'),
(445, 17484665, 2, '0', 50.00, '2024-12-02 03:37:24', '2024-12-02 03:37:24'),
(446, 17484665, 3, '0', 250.00, '2024-12-02 03:37:24', '2024-12-02 03:37:24'),
(447, 17484665, 4, '0', 500.00, '2024-12-02 03:37:24', '2024-12-02 03:37:24'),
(448, 17484665, 5, '0', 1000.00, '2024-12-02 03:37:24', '2024-12-02 03:37:24'),
(449, 17484666, 1, '0', 10.00, '2024-12-02 14:02:20', '2024-12-02 14:02:20'),
(450, 17484666, 2, '0', 50.00, '2024-12-02 14:02:20', '2024-12-02 14:02:20'),
(451, 17484666, 3, '0', 250.00, '2024-12-02 14:02:20', '2024-12-02 14:02:20'),
(452, 17484666, 4, '0', 500.00, '2024-12-02 14:02:20', '2024-12-02 14:02:20'),
(453, 17484666, 5, '0', 1000.00, '2024-12-02 14:02:20', '2024-12-02 14:02:20'),
(454, 17484667, 1, '0', 10.00, '2024-12-02 15:26:49', '2024-12-02 15:26:49'),
(455, 17484667, 2, '0', 50.00, '2024-12-02 15:26:49', '2024-12-02 15:26:49'),
(456, 17484667, 3, '0', 250.00, '2024-12-02 15:26:49', '2024-12-02 15:26:49'),
(457, 17484667, 4, '0', 500.00, '2024-12-02 15:26:49', '2024-12-02 15:26:49'),
(458, 17484667, 5, '0', 1000.00, '2024-12-02 15:26:49', '2024-12-02 15:26:49'),
(459, 17484668, 1, '0', 10.00, '2024-12-02 21:22:52', '2024-12-02 21:22:52'),
(460, 17484668, 2, '0', 50.00, '2024-12-02 21:22:53', '2024-12-02 21:22:53'),
(461, 17484668, 3, '0', 250.00, '2024-12-02 21:22:53', '2024-12-02 21:22:53'),
(462, 17484668, 4, '0', 500.00, '2024-12-02 21:22:53', '2024-12-02 21:22:53'),
(463, 17484668, 5, '0', 1000.00, '2024-12-02 21:22:53', '2024-12-02 21:22:53'),
(464, 17484669, 1, '0', 10.00, '2024-12-02 23:40:27', '2024-12-02 23:40:27'),
(465, 17484669, 2, '0', 50.00, '2024-12-02 23:40:27', '2024-12-02 23:40:27'),
(466, 17484669, 3, '0', 250.00, '2024-12-02 23:40:27', '2024-12-02 23:40:27'),
(467, 17484669, 4, '0', 500.00, '2024-12-02 23:40:27', '2024-12-02 23:40:27'),
(468, 17484669, 5, '0', 1000.00, '2024-12-02 23:40:27', '2024-12-02 23:40:27'),
(469, 17484670, 1, '0', 10.00, '2024-12-03 23:04:51', '2024-12-03 23:04:51'),
(470, 17484670, 2, '0', 50.00, '2024-12-03 23:04:51', '2024-12-03 23:04:51'),
(471, 17484670, 3, '0', 250.00, '2024-12-03 23:04:51', '2024-12-03 23:04:51'),
(472, 17484670, 4, '0', 500.00, '2024-12-03 23:04:51', '2024-12-03 23:04:51'),
(473, 17484670, 5, '0', 1000.00, '2024-12-03 23:04:51', '2024-12-03 23:04:51'),
(474, 17484671, 1, '0', 10.00, '2024-12-06 17:10:55', '2024-12-06 17:10:55'),
(475, 17484671, 2, '0', 50.00, '2024-12-06 17:10:55', '2024-12-06 17:10:55'),
(476, 17484671, 3, '0', 250.00, '2024-12-06 17:10:55', '2024-12-06 17:10:55'),
(477, 17484671, 4, '0', 500.00, '2024-12-06 17:10:55', '2024-12-06 17:10:55'),
(478, 17484671, 5, '0', 1000.00, '2024-12-06 17:10:55', '2024-12-06 17:10:55'),
(479, 17484672, 1, '0', 10.00, '2024-12-07 02:49:50', '2024-12-07 02:49:50'),
(480, 17484672, 2, '0', 50.00, '2024-12-07 02:49:50', '2024-12-07 02:49:50'),
(481, 17484672, 3, '0', 250.00, '2024-12-07 02:49:50', '2024-12-07 02:49:50'),
(482, 17484672, 4, '0', 500.00, '2024-12-07 02:49:50', '2024-12-07 02:49:50'),
(483, 17484672, 5, '0', 1000.00, '2024-12-07 02:49:50', '2024-12-07 02:49:50'),
(484, 17484673, 1, '0', 10.00, '2024-12-07 18:09:24', '2024-12-07 18:09:24'),
(485, 17484673, 2, '0', 50.00, '2024-12-07 18:09:24', '2024-12-07 18:09:24'),
(486, 17484673, 3, '0', 250.00, '2024-12-07 18:09:24', '2024-12-07 18:09:24'),
(487, 17484673, 4, '0', 500.00, '2024-12-07 18:09:24', '2024-12-07 18:09:24'),
(488, 17484673, 5, '0', 1000.00, '2024-12-07 18:09:24', '2024-12-07 18:09:24'),
(489, 17484674, 1, '0', 10.00, '2024-12-10 20:55:25', '2024-12-10 20:55:25'),
(490, 17484674, 2, '0', 50.00, '2024-12-10 20:55:25', '2024-12-10 20:55:25'),
(491, 17484674, 3, '0', 250.00, '2024-12-10 20:55:25', '2024-12-10 20:55:25'),
(492, 17484674, 4, '0', 500.00, '2024-12-10 20:55:25', '2024-12-10 20:55:25'),
(493, 17484674, 5, '0', 1000.00, '2024-12-10 20:55:25', '2024-12-10 20:55:25'),
(494, 17484675, 1, '0', 10.00, '2024-12-10 20:57:26', '2024-12-10 20:57:26'),
(495, 17484675, 2, '0', 50.00, '2024-12-10 20:57:26', '2024-12-10 20:57:26'),
(496, 17484675, 3, '0', 250.00, '2024-12-10 20:57:26', '2024-12-10 20:57:26'),
(497, 17484675, 4, '0', 500.00, '2024-12-10 20:57:26', '2024-12-10 20:57:26'),
(498, 17484675, 5, '0', 1000.00, '2024-12-10 20:57:26', '2024-12-10 20:57:26'),
(499, 17484676, 1, '0', 10.00, '2024-12-12 00:44:18', '2024-12-12 00:44:18'),
(500, 17484676, 2, '0', 50.00, '2024-12-12 00:44:18', '2024-12-12 00:44:18'),
(501, 17484676, 3, '0', 250.00, '2024-12-12 00:44:18', '2024-12-12 00:44:18'),
(502, 17484676, 4, '0', 500.00, '2024-12-12 00:44:18', '2024-12-12 00:44:18'),
(503, 17484676, 5, '0', 1000.00, '2024-12-12 00:44:18', '2024-12-12 00:44:18'),
(504, 17484677, 1, '0', 10.00, '2024-12-12 00:53:46', '2024-12-12 00:53:46'),
(505, 17484677, 2, '0', 50.00, '2024-12-12 00:53:46', '2024-12-12 00:53:46'),
(506, 17484677, 3, '0', 250.00, '2024-12-12 00:53:46', '2024-12-12 00:53:46'),
(507, 17484677, 4, '0', 500.00, '2024-12-12 00:53:46', '2024-12-12 00:53:46'),
(508, 17484677, 5, '0', 1000.00, '2024-12-12 00:53:46', '2024-12-12 00:53:46'),
(509, 17484678, 1, '0', 10.00, '2024-12-12 01:04:06', '2024-12-12 01:04:06'),
(510, 17484678, 2, '0', 50.00, '2024-12-12 01:04:06', '2024-12-12 01:04:06'),
(511, 17484678, 3, '0', 250.00, '2024-12-12 01:04:06', '2024-12-12 01:04:06'),
(512, 17484678, 4, '0', 500.00, '2024-12-12 01:04:06', '2024-12-12 01:04:06'),
(513, 17484678, 5, '0', 1000.00, '2024-12-12 01:04:06', '2024-12-12 01:04:06'),
(514, 17484679, 1, '0', 10.00, '2024-12-12 01:05:38', '2024-12-12 01:05:38'),
(515, 17484679, 2, '0', 50.00, '2024-12-12 01:05:38', '2024-12-12 01:05:38'),
(516, 17484679, 3, '0', 250.00, '2024-12-12 01:05:38', '2024-12-12 01:05:38'),
(517, 17484679, 4, '0', 500.00, '2024-12-12 01:05:38', '2024-12-12 01:05:38'),
(518, 17484679, 5, '0', 1000.00, '2024-12-12 01:05:38', '2024-12-12 01:05:38'),
(519, 17484680, 1, '0', 10.00, '2024-12-12 01:11:50', '2024-12-12 01:11:50'),
(520, 17484680, 2, '0', 50.00, '2024-12-12 01:11:50', '2024-12-12 01:11:50'),
(521, 17484680, 3, '0', 250.00, '2024-12-12 01:11:50', '2024-12-12 01:11:50'),
(522, 17484680, 4, '0', 500.00, '2024-12-12 01:11:50', '2024-12-12 01:11:50'),
(523, 17484680, 5, '0', 1000.00, '2024-12-12 01:11:50', '2024-12-12 01:11:50'),
(524, 17484681, 1, '0', 10.00, '2024-12-12 01:13:59', '2024-12-12 01:13:59'),
(525, 17484681, 2, '0', 50.00, '2024-12-12 01:13:59', '2024-12-12 01:13:59'),
(526, 17484681, 3, '0', 250.00, '2024-12-12 01:13:59', '2024-12-12 01:13:59'),
(527, 17484681, 4, '0', 500.00, '2024-12-12 01:13:59', '2024-12-12 01:13:59'),
(528, 17484681, 5, '0', 1000.00, '2024-12-12 01:13:59', '2024-12-12 01:13:59'),
(529, 17484682, 1, '0', 10.00, '2024-12-12 01:19:41', '2024-12-12 01:19:41'),
(530, 17484682, 2, '0', 50.00, '2024-12-12 01:19:41', '2024-12-12 01:19:41'),
(531, 17484682, 3, '0', 250.00, '2024-12-12 01:19:41', '2024-12-12 01:19:41'),
(532, 17484682, 4, '0', 500.00, '2024-12-12 01:19:41', '2024-12-12 01:19:41'),
(533, 17484682, 5, '0', 1000.00, '2024-12-12 01:19:41', '2024-12-12 01:19:41'),
(534, 17484683, 1, '0', 10.00, '2024-12-12 01:22:22', '2024-12-12 01:22:22'),
(535, 17484683, 2, '0', 50.00, '2024-12-12 01:22:22', '2024-12-12 01:22:22'),
(536, 17484683, 3, '0', 250.00, '2024-12-12 01:22:22', '2024-12-12 01:22:22'),
(537, 17484683, 4, '0', 500.00, '2024-12-12 01:22:22', '2024-12-12 01:22:22'),
(538, 17484683, 5, '0', 1000.00, '2024-12-12 01:22:22', '2024-12-12 01:22:22'),
(539, 17484684, 1, '0', 10.00, '2024-12-12 01:22:32', '2024-12-12 01:22:32'),
(540, 17484684, 2, '0', 50.00, '2024-12-12 01:22:32', '2024-12-12 01:22:32'),
(541, 17484684, 3, '0', 250.00, '2024-12-12 01:22:32', '2024-12-12 01:22:32'),
(542, 17484684, 4, '0', 500.00, '2024-12-12 01:22:32', '2024-12-12 01:22:32'),
(543, 17484684, 5, '0', 1000.00, '2024-12-12 01:22:32', '2024-12-12 01:22:32'),
(544, 17484685, 1, '0', 10.00, '2024-12-12 01:25:21', '2024-12-12 01:25:21'),
(545, 17484685, 2, '0', 50.00, '2024-12-12 01:25:21', '2024-12-12 01:25:21'),
(546, 17484685, 3, '0', 250.00, '2024-12-12 01:25:21', '2024-12-12 01:25:21'),
(547, 17484685, 4, '0', 500.00, '2024-12-12 01:25:21', '2024-12-12 01:25:21'),
(548, 17484685, 5, '0', 1000.00, '2024-12-12 01:25:21', '2024-12-12 01:25:21'),
(549, 17484686, 1, '0', 10.00, '2024-12-12 01:25:51', '2024-12-12 01:25:51'),
(550, 17484686, 2, '0', 50.00, '2024-12-12 01:25:51', '2024-12-12 01:25:51'),
(551, 17484686, 3, '0', 250.00, '2024-12-12 01:25:51', '2024-12-12 01:25:51'),
(552, 17484686, 4, '0', 500.00, '2024-12-12 01:25:51', '2024-12-12 01:25:51'),
(553, 17484686, 5, '0', 1000.00, '2024-12-12 01:25:51', '2024-12-12 01:25:51'),
(554, 17484687, 1, '0', 10.00, '2024-12-12 01:26:10', '2024-12-12 01:26:10'),
(555, 17484687, 2, '0', 50.00, '2024-12-12 01:26:10', '2024-12-12 01:26:10'),
(556, 17484687, 3, '0', 250.00, '2024-12-12 01:26:10', '2024-12-12 01:26:10'),
(557, 17484687, 4, '0', 500.00, '2024-12-12 01:26:10', '2024-12-12 01:26:10'),
(558, 17484687, 5, '0', 1000.00, '2024-12-12 01:26:10', '2024-12-12 01:26:10'),
(559, 17484688, 1, '0', 10.00, '2024-12-12 01:29:13', '2024-12-12 01:29:13'),
(560, 17484688, 2, '0', 50.00, '2024-12-12 01:29:13', '2024-12-12 01:29:13'),
(561, 17484688, 3, '0', 250.00, '2024-12-12 01:29:13', '2024-12-12 01:29:13'),
(562, 17484688, 4, '0', 500.00, '2024-12-12 01:29:13', '2024-12-12 01:29:13'),
(563, 17484688, 5, '0', 1000.00, '2024-12-12 01:29:13', '2024-12-12 01:29:13'),
(564, 17484689, 1, '0', 10.00, '2024-12-12 01:32:34', '2024-12-12 01:32:34'),
(565, 17484689, 2, '0', 50.00, '2024-12-12 01:32:34', '2024-12-12 01:32:34'),
(566, 17484689, 3, '0', 250.00, '2024-12-12 01:32:34', '2024-12-12 01:32:34'),
(567, 17484689, 4, '0', 500.00, '2024-12-12 01:32:34', '2024-12-12 01:32:34'),
(568, 17484689, 5, '0', 1000.00, '2024-12-12 01:32:34', '2024-12-12 01:32:34'),
(569, 17484690, 1, '0', 10.00, '2024-12-12 01:32:55', '2024-12-12 01:32:55'),
(570, 17484690, 2, '0', 50.00, '2024-12-12 01:32:55', '2024-12-12 01:32:55'),
(571, 17484690, 3, '0', 250.00, '2024-12-12 01:32:55', '2024-12-12 01:32:55'),
(572, 17484690, 4, '0', 500.00, '2024-12-12 01:32:55', '2024-12-12 01:32:55'),
(573, 17484690, 5, '0', 1000.00, '2024-12-12 01:32:55', '2024-12-12 01:32:55'),
(574, 17484691, 1, '0', 10.00, '2024-12-12 01:33:15', '2024-12-12 01:33:15'),
(575, 17484691, 2, '0', 50.00, '2024-12-12 01:33:15', '2024-12-12 01:33:15'),
(576, 17484691, 3, '0', 250.00, '2024-12-12 01:33:15', '2024-12-12 01:33:15'),
(577, 17484691, 4, '0', 500.00, '2024-12-12 01:33:15', '2024-12-12 01:33:15'),
(578, 17484691, 5, '0', 1000.00, '2024-12-12 01:33:15', '2024-12-12 01:33:15'),
(579, 17484692, 1, '0', 10.00, '2024-12-12 01:34:57', '2024-12-12 01:34:57'),
(580, 17484692, 2, '0', 50.00, '2024-12-12 01:34:57', '2024-12-12 01:34:57'),
(581, 17484692, 3, '0', 250.00, '2024-12-12 01:34:57', '2024-12-12 01:34:57'),
(582, 17484692, 4, '0', 500.00, '2024-12-12 01:34:57', '2024-12-12 01:34:57'),
(583, 17484692, 5, '0', 1000.00, '2024-12-12 01:34:57', '2024-12-12 01:34:57'),
(584, 17484693, 1, '0', 10.00, '2024-12-12 01:36:42', '2024-12-12 01:36:42'),
(585, 17484693, 2, '0', 50.00, '2024-12-12 01:36:42', '2024-12-12 01:36:42'),
(586, 17484693, 3, '0', 250.00, '2024-12-12 01:36:42', '2024-12-12 01:36:42'),
(587, 17484693, 4, '0', 500.00, '2024-12-12 01:36:42', '2024-12-12 01:36:42'),
(588, 17484693, 5, '0', 1000.00, '2024-12-12 01:36:43', '2024-12-12 01:36:43'),
(589, 17484694, 1, '0', 10.00, '2024-12-12 01:38:25', '2024-12-12 01:38:25'),
(590, 17484694, 2, '0', 50.00, '2024-12-12 01:38:25', '2024-12-12 01:38:25'),
(591, 17484694, 3, '0', 250.00, '2024-12-12 01:38:25', '2024-12-12 01:38:25'),
(592, 17484694, 4, '0', 500.00, '2024-12-12 01:38:25', '2024-12-12 01:38:25'),
(593, 17484694, 5, '0', 1000.00, '2024-12-12 01:38:25', '2024-12-12 01:38:25'),
(594, 17484695, 1, '0', 10.00, '2024-12-12 01:38:29', '2024-12-12 01:38:29'),
(595, 17484695, 2, '0', 50.00, '2024-12-12 01:38:29', '2024-12-12 01:38:29'),
(596, 17484695, 3, '0', 250.00, '2024-12-12 01:38:29', '2024-12-12 01:38:29'),
(597, 17484695, 4, '0', 500.00, '2024-12-12 01:38:29', '2024-12-12 01:38:29'),
(598, 17484695, 5, '0', 1000.00, '2024-12-12 01:38:29', '2024-12-12 01:38:29'),
(599, 17484696, 1, '0', 10.00, '2024-12-12 01:38:41', '2024-12-12 01:38:41'),
(600, 17484696, 2, '0', 50.00, '2024-12-12 01:38:41', '2024-12-12 01:38:41'),
(601, 17484696, 3, '0', 250.00, '2024-12-12 01:38:41', '2024-12-12 01:38:41'),
(602, 17484696, 4, '0', 500.00, '2024-12-12 01:38:41', '2024-12-12 01:38:41'),
(603, 17484696, 5, '0', 1000.00, '2024-12-12 01:38:41', '2024-12-12 01:38:41'),
(604, 17484697, 1, '0', 10.00, '2024-12-12 01:39:41', '2024-12-12 01:39:41'),
(605, 17484697, 2, '0', 50.00, '2024-12-12 01:39:41', '2024-12-12 01:39:41'),
(606, 17484697, 3, '0', 250.00, '2024-12-12 01:39:41', '2024-12-12 01:39:41'),
(607, 17484697, 4, '0', 500.00, '2024-12-12 01:39:41', '2024-12-12 01:39:41'),
(608, 17484697, 5, '0', 1000.00, '2024-12-12 01:39:41', '2024-12-12 01:39:41'),
(609, 17484698, 1, '0', 10.00, '2024-12-12 01:43:29', '2024-12-12 01:43:29'),
(610, 17484698, 2, '0', 50.00, '2024-12-12 01:43:29', '2024-12-12 01:43:29'),
(611, 17484698, 3, '0', 250.00, '2024-12-12 01:43:29', '2024-12-12 01:43:29'),
(612, 17484698, 4, '0', 500.00, '2024-12-12 01:43:29', '2024-12-12 01:43:29'),
(613, 17484698, 5, '0', 1000.00, '2024-12-12 01:43:29', '2024-12-12 01:43:29'),
(614, 17484699, 1, '0', 10.00, '2024-12-12 01:45:19', '2024-12-12 01:45:19'),
(615, 17484699, 2, '0', 50.00, '2024-12-12 01:45:19', '2024-12-12 01:45:19'),
(616, 17484699, 3, '0', 250.00, '2024-12-12 01:45:19', '2024-12-12 01:45:19'),
(617, 17484699, 4, '0', 500.00, '2024-12-12 01:45:19', '2024-12-12 01:45:19'),
(618, 17484699, 5, '0', 1000.00, '2024-12-12 01:45:19', '2024-12-12 01:45:19'),
(619, 17484700, 1, '0', 10.00, '2024-12-12 01:45:39', '2024-12-12 01:45:39'),
(620, 17484700, 2, '0', 50.00, '2024-12-12 01:45:39', '2024-12-12 01:45:39'),
(621, 17484700, 3, '0', 250.00, '2024-12-12 01:45:39', '2024-12-12 01:45:39'),
(622, 17484700, 4, '0', 500.00, '2024-12-12 01:45:39', '2024-12-12 01:45:39'),
(623, 17484700, 5, '0', 1000.00, '2024-12-12 01:45:39', '2024-12-12 01:45:39'),
(624, 17484701, 1, '0', 10.00, '2024-12-12 01:47:11', '2024-12-12 01:47:11'),
(625, 17484701, 2, '0', 50.00, '2024-12-12 01:47:11', '2024-12-12 01:47:11'),
(626, 17484701, 3, '0', 250.00, '2024-12-12 01:47:11', '2024-12-12 01:47:11'),
(627, 17484701, 4, '0', 500.00, '2024-12-12 01:47:11', '2024-12-12 01:47:11'),
(628, 17484701, 5, '0', 1000.00, '2024-12-12 01:47:11', '2024-12-12 01:47:11'),
(629, 17484702, 1, '0', 10.00, '2024-12-12 01:49:43', '2024-12-12 01:49:43'),
(630, 17484702, 2, '0', 50.00, '2024-12-12 01:49:43', '2024-12-12 01:49:43'),
(631, 17484702, 3, '0', 250.00, '2024-12-12 01:49:43', '2024-12-12 01:49:43'),
(632, 17484702, 4, '0', 500.00, '2024-12-12 01:49:43', '2024-12-12 01:49:43'),
(633, 17484702, 5, '0', 1000.00, '2024-12-12 01:49:43', '2024-12-12 01:49:43'),
(634, 17484703, 1, '0', 10.00, '2024-12-12 01:52:52', '2024-12-12 01:52:52'),
(635, 17484703, 2, '0', 50.00, '2024-12-12 01:52:52', '2024-12-12 01:52:52'),
(636, 17484703, 3, '0', 250.00, '2024-12-12 01:52:52', '2024-12-12 01:52:52'),
(637, 17484703, 4, '0', 500.00, '2024-12-12 01:52:52', '2024-12-12 01:52:52'),
(638, 17484703, 5, '0', 1000.00, '2024-12-12 01:52:52', '2024-12-12 01:52:52'),
(639, 17484704, 1, '0', 10.00, '2024-12-12 02:59:14', '2024-12-12 02:59:14'),
(640, 17484704, 2, '0', 50.00, '2024-12-12 02:59:14', '2024-12-12 02:59:14'),
(641, 17484704, 3, '0', 250.00, '2024-12-12 02:59:14', '2024-12-12 02:59:14'),
(642, 17484704, 4, '0', 500.00, '2024-12-12 02:59:14', '2024-12-12 02:59:14'),
(643, 17484704, 5, '0', 1000.00, '2024-12-12 02:59:14', '2024-12-12 02:59:14'),
(644, 17484705, 1, '0', 10.00, '2024-12-12 03:00:53', '2024-12-12 03:00:53'),
(645, 17484705, 2, '0', 50.00, '2024-12-12 03:00:53', '2024-12-12 03:00:53'),
(646, 17484705, 3, '0', 250.00, '2024-12-12 03:00:53', '2024-12-12 03:00:53'),
(647, 17484705, 4, '0', 500.00, '2024-12-12 03:00:53', '2024-12-12 03:00:53'),
(648, 17484705, 5, '0', 1000.00, '2024-12-12 03:00:53', '2024-12-12 03:00:53'),
(649, 17484706, 1, '0', 10.00, '2024-12-12 03:02:46', '2024-12-12 03:02:46'),
(650, 17484706, 2, '0', 50.00, '2024-12-12 03:02:46', '2024-12-12 03:02:46'),
(651, 17484706, 3, '0', 250.00, '2024-12-12 03:02:46', '2024-12-12 03:02:46'),
(652, 17484706, 4, '0', 500.00, '2024-12-12 03:02:46', '2024-12-12 03:02:46'),
(653, 17484706, 5, '0', 1000.00, '2024-12-12 03:02:46', '2024-12-12 03:02:46'),
(654, 17484707, 1, '0', 10.00, '2024-12-12 03:06:31', '2024-12-12 03:06:31'),
(655, 17484707, 2, '0', 50.00, '2024-12-12 03:06:31', '2024-12-12 03:06:31'),
(656, 17484707, 3, '0', 250.00, '2024-12-12 03:06:31', '2024-12-12 03:06:31'),
(657, 17484707, 4, '0', 500.00, '2024-12-12 03:06:31', '2024-12-12 03:06:31'),
(658, 17484707, 5, '0', 1000.00, '2024-12-12 03:06:31', '2024-12-12 03:06:31'),
(659, 17484708, 1, '0', 10.00, '2024-12-12 03:10:12', '2024-12-12 03:10:12'),
(660, 17484708, 2, '0', 50.00, '2024-12-12 03:10:12', '2024-12-12 03:10:12'),
(661, 17484708, 3, '0', 250.00, '2024-12-12 03:10:12', '2024-12-12 03:10:12'),
(662, 17484708, 4, '0', 500.00, '2024-12-12 03:10:12', '2024-12-12 03:10:12'),
(663, 17484708, 5, '0', 1000.00, '2024-12-12 03:10:12', '2024-12-12 03:10:12'),
(664, 17484709, 1, '0', 10.00, '2024-12-12 04:43:57', '2024-12-12 04:43:57'),
(665, 17484709, 2, '0', 50.00, '2024-12-12 04:43:57', '2024-12-12 04:43:57'),
(666, 17484709, 3, '0', 250.00, '2024-12-12 04:43:57', '2024-12-12 04:43:57'),
(667, 17484709, 4, '0', 500.00, '2024-12-12 04:43:57', '2024-12-12 04:43:57'),
(668, 17484709, 5, '0', 1000.00, '2024-12-12 04:43:57', '2024-12-12 04:43:57'),
(669, 17484710, 1, '0', 10.00, '2024-12-12 04:45:15', '2024-12-12 04:45:15'),
(670, 17484710, 2, '0', 50.00, '2024-12-12 04:45:15', '2024-12-12 04:45:15'),
(671, 17484710, 3, '0', 250.00, '2024-12-12 04:45:15', '2024-12-12 04:45:15'),
(672, 17484710, 4, '0', 500.00, '2024-12-12 04:45:15', '2024-12-12 04:45:15'),
(673, 17484710, 5, '0', 1000.00, '2024-12-12 04:45:15', '2024-12-12 04:45:15'),
(674, 17484711, 1, '0', 10.00, '2024-12-12 04:47:58', '2024-12-12 04:47:58'),
(675, 17484711, 2, '0', 50.00, '2024-12-12 04:47:58', '2024-12-12 04:47:58'),
(676, 17484711, 3, '0', 250.00, '2024-12-12 04:47:58', '2024-12-12 04:47:58'),
(677, 17484711, 4, '0', 500.00, '2024-12-12 04:47:58', '2024-12-12 04:47:58'),
(678, 17484711, 5, '0', 1000.00, '2024-12-12 04:47:58', '2024-12-12 04:47:58'),
(679, 17484712, 1, '0', 10.00, '2024-12-12 04:49:24', '2024-12-12 04:49:24'),
(680, 17484712, 2, '0', 50.00, '2024-12-12 04:49:24', '2024-12-12 04:49:24'),
(681, 17484712, 3, '0', 250.00, '2024-12-12 04:49:24', '2024-12-12 04:49:24'),
(682, 17484712, 4, '0', 500.00, '2024-12-12 04:49:24', '2024-12-12 04:49:24'),
(683, 17484712, 5, '0', 1000.00, '2024-12-12 04:49:24', '2024-12-12 04:49:24'),
(684, 17484713, 1, '0', 10.00, '2024-12-12 04:50:21', '2024-12-12 04:50:21'),
(685, 17484713, 2, '0', 50.00, '2024-12-12 04:50:21', '2024-12-12 04:50:21'),
(686, 17484713, 3, '0', 250.00, '2024-12-12 04:50:21', '2024-12-12 04:50:21'),
(687, 17484713, 4, '0', 500.00, '2024-12-12 04:50:21', '2024-12-12 04:50:21'),
(688, 17484713, 5, '0', 1000.00, '2024-12-12 04:50:21', '2024-12-12 04:50:21'),
(689, 17484714, 1, '0', 10.00, '2024-12-12 04:51:17', '2024-12-12 04:51:17'),
(690, 17484714, 2, '0', 50.00, '2024-12-12 04:51:17', '2024-12-12 04:51:17'),
(691, 17484714, 3, '0', 250.00, '2024-12-12 04:51:17', '2024-12-12 04:51:17'),
(692, 17484714, 4, '0', 500.00, '2024-12-12 04:51:17', '2024-12-12 04:51:17'),
(693, 17484714, 5, '0', 1000.00, '2024-12-12 04:51:17', '2024-12-12 04:51:17'),
(694, 17484715, 1, '0', 10.00, '2024-12-12 04:53:33', '2024-12-12 04:53:33'),
(695, 17484715, 2, '0', 50.00, '2024-12-12 04:53:33', '2024-12-12 04:53:33'),
(696, 17484715, 3, '0', 250.00, '2024-12-12 04:53:33', '2024-12-12 04:53:33'),
(697, 17484715, 4, '0', 500.00, '2024-12-12 04:53:33', '2024-12-12 04:53:33'),
(698, 17484715, 5, '0', 1000.00, '2024-12-12 04:53:33', '2024-12-12 04:53:33'),
(699, 17484716, 1, '0', 10.00, '2024-12-12 04:54:09', '2024-12-12 04:54:09'),
(700, 17484716, 2, '0', 50.00, '2024-12-12 04:54:09', '2024-12-12 04:54:09'),
(701, 17484716, 3, '0', 250.00, '2024-12-12 04:54:09', '2024-12-12 04:54:09'),
(702, 17484716, 4, '0', 500.00, '2024-12-12 04:54:09', '2024-12-12 04:54:09'),
(703, 17484716, 5, '0', 1000.00, '2024-12-12 04:54:09', '2024-12-12 04:54:09'),
(704, 17484717, 1, '0', 10.00, '2024-12-12 04:56:19', '2024-12-12 04:56:19'),
(705, 17484717, 2, '0', 50.00, '2024-12-12 04:56:19', '2024-12-12 04:56:19'),
(706, 17484717, 3, '0', 250.00, '2024-12-12 04:56:19', '2024-12-12 04:56:19'),
(707, 17484717, 4, '0', 500.00, '2024-12-12 04:56:19', '2024-12-12 04:56:19'),
(708, 17484717, 5, '0', 1000.00, '2024-12-12 04:56:19', '2024-12-12 04:56:19'),
(709, 17484718, 1, '0', 10.00, '2024-12-12 18:15:21', '2024-12-12 18:15:21'),
(710, 17484718, 2, '0', 50.00, '2024-12-12 18:15:21', '2024-12-12 18:15:21'),
(711, 17484718, 3, '0', 250.00, '2024-12-12 18:15:21', '2024-12-12 18:15:21'),
(712, 17484718, 4, '0', 500.00, '2024-12-12 18:15:21', '2024-12-12 18:15:21'),
(713, 17484718, 5, '0', 1000.00, '2024-12-12 18:15:21', '2024-12-12 18:15:21'),
(714, 17484719, 1, '0', 10.00, '2024-12-12 18:15:23', '2024-12-12 18:15:23'),
(715, 17484719, 2, '0', 50.00, '2024-12-12 18:15:23', '2024-12-12 18:15:23'),
(716, 17484719, 3, '0', 250.00, '2024-12-12 18:15:23', '2024-12-12 18:15:23'),
(717, 17484719, 4, '0', 500.00, '2024-12-12 18:15:23', '2024-12-12 18:15:23'),
(718, 17484719, 5, '0', 1000.00, '2024-12-12 18:15:23', '2024-12-12 18:15:23'),
(719, 17484720, 1, '0', 10.00, '2024-12-12 18:20:11', '2024-12-12 18:20:11'),
(720, 17484720, 2, '0', 50.00, '2024-12-12 18:20:11', '2024-12-12 18:20:11'),
(721, 17484720, 3, '0', 250.00, '2024-12-12 18:20:11', '2024-12-12 18:20:11'),
(722, 17484720, 4, '0', 500.00, '2024-12-12 18:20:11', '2024-12-12 18:20:11'),
(723, 17484720, 5, '0', 1000.00, '2024-12-12 18:20:11', '2024-12-12 18:20:11'),
(724, 17484721, 1, '0', 10.00, '2024-12-12 18:25:51', '2024-12-12 18:25:51'),
(725, 17484721, 2, '0', 50.00, '2024-12-12 18:25:51', '2024-12-12 18:25:51'),
(726, 17484721, 3, '0', 250.00, '2024-12-12 18:25:51', '2024-12-12 18:25:51'),
(727, 17484721, 4, '0', 500.00, '2024-12-12 18:25:51', '2024-12-12 18:25:51'),
(728, 17484721, 5, '0', 1000.00, '2024-12-12 18:25:51', '2024-12-12 18:25:51'),
(729, 17484722, 1, '0', 10.00, '2024-12-12 18:31:36', '2024-12-12 18:31:36'),
(730, 17484722, 2, '0', 50.00, '2024-12-12 18:31:36', '2024-12-12 18:31:36'),
(731, 17484722, 3, '0', 250.00, '2024-12-12 18:31:36', '2024-12-12 18:31:36'),
(732, 17484722, 4, '0', 500.00, '2024-12-12 18:31:36', '2024-12-12 18:31:36'),
(733, 17484722, 5, '0', 1000.00, '2024-12-12 18:31:36', '2024-12-12 18:31:36'),
(734, 17484723, 1, '0', 10.00, '2024-12-12 18:37:52', '2024-12-12 18:37:52'),
(735, 17484723, 2, '0', 50.00, '2024-12-12 18:37:52', '2024-12-12 18:37:52'),
(736, 17484723, 3, '0', 250.00, '2024-12-12 18:37:52', '2024-12-12 18:37:52'),
(737, 17484723, 4, '0', 500.00, '2024-12-12 18:37:52', '2024-12-12 18:37:52'),
(738, 17484723, 5, '0', 1000.00, '2024-12-12 18:37:52', '2024-12-12 18:37:52'),
(739, 17484724, 1, '0', 10.00, '2024-12-12 18:38:19', '2024-12-12 18:38:19'),
(740, 17484724, 2, '0', 50.00, '2024-12-12 18:38:19', '2024-12-12 18:38:19'),
(741, 17484724, 3, '0', 250.00, '2024-12-12 18:38:19', '2024-12-12 18:38:19'),
(742, 17484724, 4, '0', 500.00, '2024-12-12 18:38:19', '2024-12-12 18:38:19'),
(743, 17484724, 5, '0', 1000.00, '2024-12-12 18:38:19', '2024-12-12 18:38:19'),
(744, 17484725, 1, '0', 10.00, '2024-12-12 18:39:39', '2024-12-12 18:39:39'),
(745, 17484725, 2, '0', 50.00, '2024-12-12 18:39:39', '2024-12-12 18:39:39'),
(746, 17484725, 3, '0', 250.00, '2024-12-12 18:39:39', '2024-12-12 18:39:39'),
(747, 17484725, 4, '0', 500.00, '2024-12-12 18:39:39', '2024-12-12 18:39:39'),
(748, 17484725, 5, '0', 1000.00, '2024-12-12 18:39:39', '2024-12-12 18:39:39'),
(749, 17484726, 1, '0', 10.00, '2024-12-12 19:43:50', '2024-12-12 19:43:50'),
(750, 17484726, 2, '0', 50.00, '2024-12-12 19:43:50', '2024-12-12 19:43:50'),
(751, 17484726, 3, '0', 250.00, '2024-12-12 19:43:50', '2024-12-12 19:43:50'),
(752, 17484726, 4, '0', 500.00, '2024-12-12 19:43:50', '2024-12-12 19:43:50'),
(753, 17484726, 5, '0', 1000.00, '2024-12-12 19:43:50', '2024-12-12 19:43:50'),
(754, 17484727, 1, '0', 10.00, '2024-12-13 03:31:11', '2024-12-13 03:31:11'),
(755, 17484727, 2, '0', 50.00, '2024-12-13 03:31:11', '2024-12-13 03:31:11'),
(756, 17484727, 3, '0', 250.00, '2024-12-13 03:31:11', '2024-12-13 03:31:11'),
(757, 17484727, 4, '0', 500.00, '2024-12-13 03:31:11', '2024-12-13 03:31:11'),
(758, 17484727, 5, '0', 1000.00, '2024-12-13 03:31:11', '2024-12-13 03:31:11'),
(759, 17484728, 1, '0', 10.00, '2024-12-13 04:00:01', '2024-12-13 04:00:01'),
(760, 17484728, 2, '0', 50.00, '2024-12-13 04:00:01', '2024-12-13 04:00:01'),
(761, 17484728, 3, '0', 250.00, '2024-12-13 04:00:01', '2024-12-13 04:00:01'),
(762, 17484728, 4, '0', 500.00, '2024-12-13 04:00:01', '2024-12-13 04:00:01');
INSERT INTO `mission_deposit_user` (`id`, `user_id`, `mission_deposit_id`, `status`, `wallet_bonus`, `created_at`, `updated_at`) VALUES
(763, 17484728, 5, '0', 1000.00, '2024-12-13 04:00:01', '2024-12-13 04:00:01'),
(764, 17484729, 1, '0', 10.00, '2024-12-13 04:01:25', '2024-12-13 04:01:25'),
(765, 17484729, 2, '0', 50.00, '2024-12-13 04:01:25', '2024-12-13 04:01:25'),
(766, 17484729, 3, '0', 250.00, '2024-12-13 04:01:25', '2024-12-13 04:01:25'),
(767, 17484729, 4, '0', 500.00, '2024-12-13 04:01:25', '2024-12-13 04:01:25'),
(768, 17484729, 5, '0', 1000.00, '2024-12-13 04:01:25', '2024-12-13 04:01:25'),
(769, 17484730, 1, '0', 10.00, '2024-12-13 04:07:54', '2024-12-13 04:07:54'),
(770, 17484730, 2, '0', 50.00, '2024-12-13 04:07:54', '2024-12-13 04:07:54'),
(771, 17484730, 3, '0', 250.00, '2024-12-13 04:07:54', '2024-12-13 04:07:54'),
(772, 17484730, 4, '0', 500.00, '2024-12-13 04:07:54', '2024-12-13 04:07:54'),
(773, 17484730, 5, '0', 1000.00, '2024-12-13 04:07:54', '2024-12-13 04:07:54'),
(774, 17484731, 1, '0', 10.00, '2024-12-13 10:51:59', '2024-12-13 10:51:59'),
(775, 17484731, 2, '0', 50.00, '2024-12-13 10:51:59', '2024-12-13 10:51:59'),
(776, 17484731, 3, '0', 250.00, '2024-12-13 10:51:59', '2024-12-13 10:51:59'),
(777, 17484731, 4, '0', 500.00, '2024-12-13 10:51:59', '2024-12-13 10:51:59'),
(778, 17484731, 5, '0', 1000.00, '2024-12-13 10:51:59', '2024-12-13 10:51:59'),
(779, 17484732, 1, '0', 10.00, '2024-12-15 02:05:31', '2024-12-15 02:05:31'),
(780, 17484732, 2, '0', 50.00, '2024-12-15 02:05:31', '2024-12-15 02:05:31'),
(781, 17484732, 3, '0', 250.00, '2024-12-15 02:05:31', '2024-12-15 02:05:31'),
(782, 17484732, 4, '0', 500.00, '2024-12-15 02:05:31', '2024-12-15 02:05:31'),
(783, 17484732, 5, '0', 1000.00, '2024-12-15 02:05:31', '2024-12-15 02:05:31'),
(784, 17484733, 1, '0', 10.00, '2024-12-15 14:08:28', '2024-12-15 14:08:28'),
(785, 17484733, 2, '0', 50.00, '2024-12-15 14:08:28', '2024-12-15 14:08:28'),
(786, 17484733, 3, '0', 250.00, '2024-12-15 14:08:28', '2024-12-15 14:08:28'),
(787, 17484733, 4, '0', 500.00, '2024-12-15 14:08:28', '2024-12-15 14:08:28'),
(788, 17484733, 5, '0', 1000.00, '2024-12-15 14:08:28', '2024-12-15 14:08:28'),
(789, 17484734, 1, '0', 10.00, '2024-12-15 17:18:15', '2024-12-15 17:18:15'),
(790, 17484734, 2, '0', 50.00, '2024-12-15 17:18:15', '2024-12-15 17:18:15'),
(791, 17484734, 3, '0', 250.00, '2024-12-15 17:18:15', '2024-12-15 17:18:15'),
(792, 17484734, 4, '0', 500.00, '2024-12-15 17:18:15', '2024-12-15 17:18:15'),
(793, 17484734, 5, '0', 1000.00, '2024-12-15 17:18:15', '2024-12-15 17:18:15'),
(794, 17484735, 1, '0', 10.00, '2024-12-15 17:25:15', '2024-12-15 17:25:15'),
(795, 17484735, 2, '0', 50.00, '2024-12-15 17:25:15', '2024-12-15 17:25:15'),
(796, 17484735, 3, '0', 250.00, '2024-12-15 17:25:15', '2024-12-15 17:25:15'),
(797, 17484735, 4, '0', 500.00, '2024-12-15 17:25:15', '2024-12-15 17:25:15'),
(798, 17484735, 5, '0', 1000.00, '2024-12-15 17:25:15', '2024-12-15 17:25:15'),
(799, 2, 1, '0', 10.00, '2024-12-17 01:04:00', '2024-12-17 01:04:00'),
(800, 2, 2, '0', 50.00, '2024-12-17 01:04:00', '2024-12-17 01:04:00'),
(801, 2, 3, '0', 250.00, '2024-12-17 01:04:00', '2024-12-17 01:04:00'),
(802, 2, 4, '0', 500.00, '2024-12-17 01:04:00', '2024-12-17 01:04:00'),
(803, 2, 5, '0', 1000.00, '2024-12-17 01:04:00', '2024-12-17 01:04:00'),
(804, 3, 1, '0', 10.00, '2024-12-17 01:27:03', '2024-12-17 01:27:03'),
(805, 3, 2, '0', 50.00, '2024-12-17 01:27:03', '2024-12-17 01:27:03'),
(806, 3, 3, '0', 250.00, '2024-12-17 01:27:03', '2024-12-17 01:27:03'),
(807, 3, 4, '0', 500.00, '2024-12-17 01:27:03', '2024-12-17 01:27:03'),
(808, 3, 5, '0', 1000.00, '2024-12-17 01:27:03', '2024-12-17 01:27:03'),
(809, 4, 1, '0', 10.00, '2024-12-17 13:16:32', '2024-12-17 13:16:32'),
(810, 4, 2, '0', 50.00, '2024-12-17 13:16:32', '2024-12-17 13:16:32'),
(811, 4, 3, '0', 250.00, '2024-12-17 13:16:32', '2024-12-17 13:16:32'),
(812, 4, 4, '0', 500.00, '2024-12-17 13:16:32', '2024-12-17 13:16:32'),
(813, 4, 5, '0', 1000.00, '2024-12-17 13:16:32', '2024-12-17 13:16:32'),
(814, 5, 1, '0', 10.00, '2024-12-17 14:14:21', '2024-12-17 14:14:21'),
(815, 5, 2, '0', 50.00, '2024-12-17 14:14:21', '2024-12-17 14:14:21'),
(816, 5, 3, '0', 250.00, '2024-12-17 14:14:21', '2024-12-17 14:14:21'),
(817, 5, 4, '0', 500.00, '2024-12-17 14:14:21', '2024-12-17 14:14:21'),
(818, 5, 5, '0', 1000.00, '2024-12-17 14:14:21', '2024-12-17 14:14:21'),
(819, 6, 1, '0', 10.00, '2024-12-17 14:25:13', '2024-12-17 14:25:13'),
(820, 6, 2, '0', 50.00, '2024-12-17 14:25:13', '2024-12-17 14:25:13'),
(821, 6, 3, '0', 250.00, '2024-12-17 14:25:13', '2024-12-17 14:25:13'),
(822, 6, 4, '0', 500.00, '2024-12-17 14:25:13', '2024-12-17 14:25:13'),
(823, 6, 5, '0', 1000.00, '2024-12-17 14:25:13', '2024-12-17 14:25:13'),
(824, 7, 1, '0', 10.00, '2024-12-18 13:01:16', '2024-12-18 13:01:16'),
(825, 7, 2, '0', 50.00, '2024-12-18 13:01:16', '2024-12-18 13:01:16'),
(826, 7, 3, '0', 250.00, '2024-12-18 13:01:16', '2024-12-18 13:01:16'),
(827, 7, 4, '0', 500.00, '2024-12-18 13:01:16', '2024-12-18 13:01:16'),
(828, 7, 5, '0', 1000.00, '2024-12-18 13:01:16', '2024-12-18 13:01:16'),
(829, 8, 1, '0', 10.00, '2024-12-18 13:04:21', '2024-12-18 13:04:21'),
(830, 8, 2, '0', 50.00, '2024-12-18 13:04:21', '2024-12-18 13:04:21'),
(831, 8, 3, '0', 250.00, '2024-12-18 13:04:21', '2024-12-18 13:04:21'),
(832, 8, 4, '0', 500.00, '2024-12-18 13:04:21', '2024-12-18 13:04:21'),
(833, 8, 5, '0', 1000.00, '2024-12-18 13:04:21', '2024-12-18 13:04:21'),
(834, 9, 1, '0', 10.00, '2024-12-18 13:06:40', '2024-12-18 13:06:40'),
(835, 9, 2, '0', 50.00, '2024-12-18 13:06:40', '2024-12-18 13:06:40'),
(836, 9, 3, '0', 250.00, '2024-12-18 13:06:40', '2024-12-18 13:06:40'),
(837, 9, 4, '0', 500.00, '2024-12-18 13:06:40', '2024-12-18 13:06:40'),
(838, 9, 5, '0', 1000.00, '2024-12-18 13:06:40', '2024-12-18 13:06:40'),
(839, 10, 1, '0', 10.00, '2024-12-18 13:32:41', '2024-12-18 13:32:41'),
(840, 10, 2, '0', 50.00, '2024-12-18 13:32:41', '2024-12-18 13:32:41'),
(841, 10, 3, '0', 250.00, '2024-12-18 13:32:41', '2024-12-18 13:32:41'),
(842, 10, 4, '0', 500.00, '2024-12-18 13:32:41', '2024-12-18 13:32:41'),
(843, 10, 5, '0', 1000.00, '2024-12-18 13:32:41', '2024-12-18 13:32:41'),
(844, 11, 1, '0', 10.00, '2024-12-18 13:48:08', '2024-12-18 13:48:08'),
(845, 11, 2, '0', 50.00, '2024-12-18 13:48:08', '2024-12-18 13:48:08'),
(846, 11, 3, '0', 250.00, '2024-12-18 13:48:08', '2024-12-18 13:48:08'),
(847, 11, 4, '0', 500.00, '2024-12-18 13:48:08', '2024-12-18 13:48:08'),
(848, 11, 5, '0', 1000.00, '2024-12-18 13:48:08', '2024-12-18 13:48:08'),
(849, 12, 1, '0', 10.00, '2024-12-27 19:05:28', '2024-12-27 19:05:28'),
(850, 12, 2, '0', 50.00, '2024-12-27 19:05:28', '2024-12-27 19:05:28'),
(851, 12, 3, '0', 250.00, '2024-12-27 19:05:28', '2024-12-27 19:05:28'),
(852, 12, 4, '0', 500.00, '2024-12-27 19:05:28', '2024-12-27 19:05:28'),
(853, 12, 5, '0', 1000.00, '2024-12-27 19:05:28', '2024-12-27 19:05:28'),
(854, 13, 1, '0', 10.00, '2024-12-27 19:08:39', '2024-12-27 19:08:39'),
(855, 13, 2, '0', 50.00, '2024-12-27 19:08:39', '2024-12-27 19:08:39'),
(856, 13, 3, '0', 250.00, '2024-12-27 19:08:39', '2024-12-27 19:08:39'),
(857, 13, 4, '0', 500.00, '2024-12-27 19:08:39', '2024-12-27 19:08:39'),
(858, 13, 5, '0', 1000.00, '2024-12-27 19:08:39', '2024-12-27 19:08:39'),
(859, 14, 1, '0', 10.00, '2024-12-27 21:11:19', '2024-12-27 21:11:19'),
(860, 14, 2, '0', 50.00, '2024-12-27 21:11:19', '2024-12-27 21:11:19'),
(861, 14, 3, '0', 250.00, '2024-12-27 21:11:19', '2024-12-27 21:11:19'),
(862, 14, 4, '0', 500.00, '2024-12-27 21:11:19', '2024-12-27 21:11:19'),
(863, 14, 5, '0', 1000.00, '2024-12-27 21:11:19', '2024-12-27 21:11:19'),
(864, 15, 1, '0', 10.00, '2024-12-27 21:11:31', '2024-12-27 21:11:31'),
(865, 15, 2, '0', 50.00, '2024-12-27 21:11:31', '2024-12-27 21:11:31'),
(866, 15, 3, '0', 250.00, '2024-12-27 21:11:31', '2024-12-27 21:11:31'),
(867, 15, 4, '0', 500.00, '2024-12-27 21:11:31', '2024-12-27 21:11:31'),
(868, 15, 5, '0', 1000.00, '2024-12-27 21:11:31', '2024-12-27 21:11:31'),
(869, 16, 1, '0', 10.00, '2024-12-27 21:23:30', '2024-12-27 21:23:30'),
(870, 16, 2, '0', 50.00, '2024-12-27 21:23:30', '2024-12-27 21:23:30'),
(871, 16, 3, '0', 250.00, '2024-12-27 21:23:30', '2024-12-27 21:23:30'),
(872, 16, 4, '0', 500.00, '2024-12-27 21:23:30', '2024-12-27 21:23:30'),
(873, 16, 5, '0', 1000.00, '2024-12-27 21:23:30', '2024-12-27 21:23:30'),
(874, 17, 1, '0', 10.00, '2024-12-27 21:35:43', '2024-12-27 21:35:43'),
(875, 17, 2, '0', 50.00, '2024-12-27 21:35:43', '2024-12-27 21:35:43'),
(876, 17, 3, '0', 250.00, '2024-12-27 21:35:43', '2024-12-27 21:35:43'),
(877, 17, 4, '0', 500.00, '2024-12-27 21:35:43', '2024-12-27 21:35:43'),
(878, 17, 5, '0', 1000.00, '2024-12-27 21:35:43', '2024-12-27 21:35:43'),
(879, 18, 1, '0', 10.00, '2024-12-27 21:52:25', '2024-12-27 21:52:25'),
(880, 18, 2, '0', 50.00, '2024-12-27 21:52:25', '2024-12-27 21:52:25'),
(881, 18, 3, '0', 250.00, '2024-12-27 21:52:25', '2024-12-27 21:52:25'),
(882, 18, 4, '0', 500.00, '2024-12-27 21:52:25', '2024-12-27 21:52:25'),
(883, 18, 5, '0', 1000.00, '2024-12-27 21:52:25', '2024-12-27 21:52:25'),
(884, 19, 1, '0', 10.00, '2024-12-27 22:00:11', '2024-12-27 22:00:11'),
(885, 19, 2, '0', 50.00, '2024-12-27 22:00:11', '2024-12-27 22:00:11'),
(886, 19, 3, '0', 250.00, '2024-12-27 22:00:11', '2024-12-27 22:00:11'),
(887, 19, 4, '0', 500.00, '2024-12-27 22:00:11', '2024-12-27 22:00:11'),
(888, 19, 5, '0', 1000.00, '2024-12-27 22:00:11', '2024-12-27 22:00:11'),
(889, 20, 1, '0', 10.00, '2024-12-27 22:02:57', '2024-12-27 22:02:57'),
(890, 20, 2, '0', 50.00, '2024-12-27 22:02:57', '2024-12-27 22:02:57'),
(891, 20, 3, '0', 250.00, '2024-12-27 22:02:57', '2024-12-27 22:02:57'),
(892, 20, 4, '0', 500.00, '2024-12-27 22:02:57', '2024-12-27 22:02:57'),
(893, 20, 5, '0', 1000.00, '2024-12-27 22:02:57', '2024-12-27 22:02:57'),
(894, 21, 1, '0', 10.00, '2024-12-27 22:37:14', '2024-12-27 22:37:14'),
(895, 21, 2, '0', 50.00, '2024-12-27 22:37:14', '2024-12-27 22:37:14'),
(896, 21, 3, '0', 250.00, '2024-12-27 22:37:14', '2024-12-27 22:37:14'),
(897, 21, 4, '0', 500.00, '2024-12-27 22:37:14', '2024-12-27 22:37:14'),
(898, 21, 5, '0', 1000.00, '2024-12-27 22:37:14', '2024-12-27 22:37:14'),
(899, 22, 1, '0', 10.00, '2024-12-27 23:01:14', '2024-12-27 23:01:14'),
(900, 22, 2, '0', 50.00, '2024-12-27 23:01:14', '2024-12-27 23:01:14'),
(901, 22, 3, '0', 250.00, '2024-12-27 23:01:14', '2024-12-27 23:01:14'),
(902, 22, 4, '0', 500.00, '2024-12-27 23:01:14', '2024-12-27 23:01:14'),
(903, 22, 5, '0', 1000.00, '2024-12-27 23:01:14', '2024-12-27 23:01:14'),
(904, 23, 1, '0', 10.00, '2024-12-27 23:55:21', '2024-12-27 23:55:21'),
(905, 23, 2, '0', 50.00, '2024-12-27 23:55:21', '2024-12-27 23:55:21'),
(906, 23, 3, '0', 250.00, '2024-12-27 23:55:21', '2024-12-27 23:55:21'),
(907, 23, 4, '0', 500.00, '2024-12-27 23:55:21', '2024-12-27 23:55:21'),
(908, 23, 5, '0', 1000.00, '2024-12-27 23:55:21', '2024-12-27 23:55:21'),
(909, 24, 1, '0', 10.00, '2024-12-27 23:56:07', '2024-12-27 23:56:07'),
(910, 24, 2, '0', 50.00, '2024-12-27 23:56:07', '2024-12-27 23:56:07'),
(911, 24, 3, '0', 250.00, '2024-12-27 23:56:07', '2024-12-27 23:56:07'),
(912, 24, 4, '0', 500.00, '2024-12-27 23:56:07', '2024-12-27 23:56:07'),
(913, 24, 5, '0', 1000.00, '2024-12-27 23:56:07', '2024-12-27 23:56:07'),
(914, 25, 1, '0', 10.00, '2024-12-27 23:56:18', '2024-12-27 23:56:18'),
(915, 25, 2, '0', 50.00, '2024-12-27 23:56:18', '2024-12-27 23:56:18'),
(916, 25, 3, '0', 250.00, '2024-12-27 23:56:18', '2024-12-27 23:56:18'),
(917, 25, 4, '0', 500.00, '2024-12-27 23:56:18', '2024-12-27 23:56:18'),
(918, 25, 5, '0', 1000.00, '2024-12-27 23:56:18', '2024-12-27 23:56:18'),
(919, 26, 1, '0', 10.00, '2024-12-28 00:04:01', '2024-12-28 00:04:01'),
(920, 26, 2, '0', 50.00, '2024-12-28 00:04:01', '2024-12-28 00:04:01'),
(921, 26, 3, '0', 250.00, '2024-12-28 00:04:01', '2024-12-28 00:04:01'),
(922, 26, 4, '0', 500.00, '2024-12-28 00:04:01', '2024-12-28 00:04:01'),
(923, 26, 5, '0', 1000.00, '2024-12-28 00:04:01', '2024-12-28 00:04:01'),
(924, 27, 1, '0', 10.00, '2024-12-28 02:04:36', '2024-12-28 02:04:36'),
(925, 27, 2, '0', 50.00, '2024-12-28 02:04:36', '2024-12-28 02:04:36'),
(926, 27, 3, '0', 250.00, '2024-12-28 02:04:36', '2024-12-28 02:04:36'),
(927, 27, 4, '0', 500.00, '2024-12-28 02:04:36', '2024-12-28 02:04:36'),
(928, 27, 5, '0', 1000.00, '2024-12-28 02:04:36', '2024-12-28 02:04:36'),
(929, 28, 1, '0', 10.00, '2024-12-28 02:57:25', '2024-12-28 02:57:25'),
(930, 28, 2, '0', 50.00, '2024-12-28 02:57:25', '2024-12-28 02:57:25'),
(931, 28, 3, '0', 250.00, '2024-12-28 02:57:25', '2024-12-28 02:57:25'),
(932, 28, 4, '0', 500.00, '2024-12-28 02:57:25', '2024-12-28 02:57:25'),
(933, 28, 5, '0', 1000.00, '2024-12-28 02:57:25', '2024-12-28 02:57:25'),
(934, 29, 1, '0', 10.00, '2024-12-28 03:05:22', '2024-12-28 03:05:22'),
(935, 29, 2, '0', 50.00, '2024-12-28 03:05:22', '2024-12-28 03:05:22'),
(936, 29, 3, '0', 250.00, '2024-12-28 03:05:22', '2024-12-28 03:05:22'),
(937, 29, 4, '0', 500.00, '2024-12-28 03:05:22', '2024-12-28 03:05:22'),
(938, 29, 5, '0', 1000.00, '2024-12-28 03:05:22', '2024-12-28 03:05:22'),
(939, 30, 1, '0', 10.00, '2024-12-28 04:35:57', '2024-12-28 04:35:57'),
(940, 30, 2, '0', 50.00, '2024-12-28 04:35:57', '2024-12-28 04:35:57'),
(941, 30, 3, '0', 250.00, '2024-12-28 04:35:57', '2024-12-28 04:35:57'),
(942, 30, 4, '0', 500.00, '2024-12-28 04:35:57', '2024-12-28 04:35:57'),
(943, 30, 5, '0', 1000.00, '2024-12-28 04:35:57', '2024-12-28 04:35:57'),
(944, 31, 1, '0', 10.00, '2024-12-28 10:59:52', '2024-12-28 10:59:52'),
(945, 31, 2, '0', 50.00, '2024-12-28 10:59:52', '2024-12-28 10:59:52'),
(946, 31, 3, '0', 250.00, '2024-12-28 10:59:52', '2024-12-28 10:59:52'),
(947, 31, 4, '0', 500.00, '2024-12-28 10:59:52', '2024-12-28 10:59:52'),
(948, 31, 5, '0', 1000.00, '2024-12-28 10:59:52', '2024-12-28 10:59:52'),
(949, 32, 1, '0', 10.00, '2024-12-28 14:04:53', '2024-12-28 14:04:53'),
(950, 32, 2, '0', 50.00, '2024-12-28 14:04:53', '2024-12-28 14:04:53'),
(951, 32, 3, '0', 250.00, '2024-12-28 14:04:53', '2024-12-28 14:04:53'),
(952, 32, 4, '0', 500.00, '2024-12-28 14:04:53', '2024-12-28 14:04:53'),
(953, 32, 5, '0', 1000.00, '2024-12-28 14:04:53', '2024-12-28 14:04:53'),
(954, 33, 1, '0', 10.00, '2024-12-28 15:03:07', '2024-12-28 15:03:07'),
(955, 33, 2, '0', 50.00, '2024-12-28 15:03:07', '2024-12-28 15:03:07'),
(956, 33, 3, '0', 250.00, '2024-12-28 15:03:07', '2024-12-28 15:03:07'),
(957, 33, 4, '0', 500.00, '2024-12-28 15:03:07', '2024-12-28 15:03:07'),
(958, 33, 5, '0', 1000.00, '2024-12-28 15:03:07', '2024-12-28 15:03:07'),
(959, 34, 1, '0', 10.00, '2024-12-28 15:08:44', '2024-12-28 15:08:44'),
(960, 34, 2, '0', 50.00, '2024-12-28 15:08:44', '2024-12-28 15:08:44'),
(961, 34, 3, '0', 250.00, '2024-12-28 15:08:44', '2024-12-28 15:08:44'),
(962, 34, 4, '0', 500.00, '2024-12-28 15:08:44', '2024-12-28 15:08:44'),
(963, 34, 5, '0', 1000.00, '2024-12-28 15:08:44', '2024-12-28 15:08:44'),
(964, 35, 1, '0', 10.00, '2024-12-28 15:50:37', '2024-12-28 15:50:37'),
(965, 35, 2, '0', 50.00, '2024-12-28 15:50:37', '2024-12-28 15:50:37'),
(966, 35, 3, '0', 250.00, '2024-12-28 15:50:37', '2024-12-28 15:50:37'),
(967, 35, 4, '0', 500.00, '2024-12-28 15:50:37', '2024-12-28 15:50:37'),
(968, 35, 5, '0', 1000.00, '2024-12-28 15:50:37', '2024-12-28 15:50:37'),
(969, 36, 1, '0', 10.00, '2024-12-28 15:52:22', '2024-12-28 15:52:22'),
(970, 36, 2, '0', 50.00, '2024-12-28 15:52:22', '2024-12-28 15:52:22'),
(971, 36, 3, '0', 250.00, '2024-12-28 15:52:22', '2024-12-28 15:52:22'),
(972, 36, 4, '0', 500.00, '2024-12-28 15:52:22', '2024-12-28 15:52:22'),
(973, 36, 5, '0', 1000.00, '2024-12-28 15:52:22', '2024-12-28 15:52:22'),
(974, 37, 1, '0', 10.00, '2024-12-28 17:07:42', '2024-12-28 17:07:42'),
(975, 37, 2, '0', 50.00, '2024-12-28 17:07:42', '2024-12-28 17:07:42'),
(976, 37, 3, '0', 250.00, '2024-12-28 17:07:42', '2024-12-28 17:07:42'),
(977, 37, 4, '0', 500.00, '2024-12-28 17:07:42', '2024-12-28 17:07:42'),
(978, 37, 5, '0', 1000.00, '2024-12-28 17:07:42', '2024-12-28 17:07:42'),
(979, 38, 1, '0', 10.00, '2024-12-28 17:27:31', '2024-12-28 17:27:31'),
(980, 38, 2, '0', 50.00, '2024-12-28 17:27:31', '2024-12-28 17:27:31'),
(981, 38, 3, '0', 250.00, '2024-12-28 17:27:31', '2024-12-28 17:27:31'),
(982, 38, 4, '0', 500.00, '2024-12-28 17:27:31', '2024-12-28 17:27:31'),
(983, 38, 5, '0', 1000.00, '2024-12-28 17:27:31', '2024-12-28 17:27:31'),
(984, 39, 1, '0', 10.00, '2024-12-28 18:12:23', '2024-12-28 18:12:23'),
(985, 39, 2, '0', 50.00, '2024-12-28 18:12:23', '2024-12-28 18:12:23'),
(986, 39, 3, '0', 250.00, '2024-12-28 18:12:23', '2024-12-28 18:12:23'),
(987, 39, 4, '0', 500.00, '2024-12-28 18:12:23', '2024-12-28 18:12:23'),
(988, 39, 5, '0', 1000.00, '2024-12-28 18:12:23', '2024-12-28 18:12:23'),
(989, 40, 1, '0', 10.00, '2024-12-28 19:27:11', '2024-12-28 19:27:11'),
(990, 40, 2, '0', 50.00, '2024-12-28 19:27:11', '2024-12-28 19:27:11'),
(991, 40, 3, '0', 250.00, '2024-12-28 19:27:11', '2024-12-28 19:27:11'),
(992, 40, 4, '0', 500.00, '2024-12-28 19:27:11', '2024-12-28 19:27:11'),
(993, 40, 5, '0', 1000.00, '2024-12-28 19:27:11', '2024-12-28 19:27:11'),
(994, 41, 1, '0', 10.00, '2024-12-28 20:04:47', '2024-12-28 20:04:47'),
(995, 41, 2, '0', 50.00, '2024-12-28 20:04:47', '2024-12-28 20:04:47'),
(996, 41, 3, '0', 250.00, '2024-12-28 20:04:47', '2024-12-28 20:04:47'),
(997, 41, 4, '0', 500.00, '2024-12-28 20:04:47', '2024-12-28 20:04:47'),
(998, 41, 5, '0', 1000.00, '2024-12-28 20:04:47', '2024-12-28 20:04:47'),
(999, 42, 1, '0', 10.00, '2024-12-29 00:31:34', '2024-12-29 00:31:34'),
(1000, 42, 2, '0', 50.00, '2024-12-29 00:31:34', '2024-12-29 00:31:34'),
(1001, 42, 3, '0', 250.00, '2024-12-29 00:31:34', '2024-12-29 00:31:34'),
(1002, 42, 4, '0', 500.00, '2024-12-29 00:31:34', '2024-12-29 00:31:34'),
(1003, 42, 5, '0', 1000.00, '2024-12-29 00:31:34', '2024-12-29 00:31:34'),
(1004, 43, 1, '0', 10.00, '2024-12-29 01:06:04', '2024-12-29 01:06:04'),
(1005, 43, 2, '0', 50.00, '2024-12-29 01:06:04', '2024-12-29 01:06:04'),
(1006, 43, 3, '0', 250.00, '2024-12-29 01:06:04', '2024-12-29 01:06:04'),
(1007, 43, 4, '0', 500.00, '2024-12-29 01:06:04', '2024-12-29 01:06:04'),
(1008, 43, 5, '0', 1000.00, '2024-12-29 01:06:04', '2024-12-29 01:06:04'),
(1009, 44, 1, '0', 10.00, '2024-12-29 01:08:19', '2024-12-29 01:08:19'),
(1010, 44, 2, '0', 50.00, '2024-12-29 01:08:19', '2024-12-29 01:08:19'),
(1011, 44, 3, '0', 250.00, '2024-12-29 01:08:19', '2024-12-29 01:08:19'),
(1012, 44, 4, '0', 500.00, '2024-12-29 01:08:19', '2024-12-29 01:08:19'),
(1013, 44, 5, '0', 1000.00, '2024-12-29 01:08:19', '2024-12-29 01:08:19'),
(1014, 45, 1, '0', 10.00, '2024-12-29 02:19:46', '2024-12-29 02:19:46'),
(1015, 45, 2, '0', 50.00, '2024-12-29 02:19:46', '2024-12-29 02:19:46'),
(1016, 45, 3, '0', 250.00, '2024-12-29 02:19:46', '2024-12-29 02:19:46'),
(1017, 45, 4, '0', 500.00, '2024-12-29 02:19:46', '2024-12-29 02:19:46'),
(1018, 45, 5, '0', 1000.00, '2024-12-29 02:19:46', '2024-12-29 02:19:46'),
(1019, 46, 1, '0', 10.00, '2024-12-29 02:39:47', '2024-12-29 02:39:47'),
(1020, 46, 2, '0', 50.00, '2024-12-29 02:39:47', '2024-12-29 02:39:47'),
(1021, 46, 3, '0', 250.00, '2024-12-29 02:39:47', '2024-12-29 02:39:47'),
(1022, 46, 4, '0', 500.00, '2024-12-29 02:39:47', '2024-12-29 02:39:47'),
(1023, 46, 5, '0', 1000.00, '2024-12-29 02:39:47', '2024-12-29 02:39:47'),
(1024, 47, 1, '0', 10.00, '2024-12-29 04:44:43', '2024-12-29 04:44:43'),
(1025, 47, 2, '0', 50.00, '2024-12-29 04:44:43', '2024-12-29 04:44:43'),
(1026, 47, 3, '0', 250.00, '2024-12-29 04:44:43', '2024-12-29 04:44:43'),
(1027, 47, 4, '0', 500.00, '2024-12-29 04:44:43', '2024-12-29 04:44:43'),
(1028, 47, 5, '0', 1000.00, '2024-12-29 04:44:43', '2024-12-29 04:44:43'),
(1029, 48, 1, '0', 10.00, '2024-12-29 09:04:37', '2024-12-29 09:04:37'),
(1030, 48, 2, '0', 50.00, '2024-12-29 09:04:37', '2024-12-29 09:04:37'),
(1031, 48, 3, '0', 250.00, '2024-12-29 09:04:37', '2024-12-29 09:04:37'),
(1032, 48, 4, '0', 500.00, '2024-12-29 09:04:37', '2024-12-29 09:04:37'),
(1033, 48, 5, '0', 1000.00, '2024-12-29 09:04:37', '2024-12-29 09:04:37'),
(1034, 49, 1, '0', 10.00, '2024-12-29 09:38:59', '2024-12-29 09:38:59'),
(1035, 49, 2, '0', 50.00, '2024-12-29 09:38:59', '2024-12-29 09:38:59'),
(1036, 49, 3, '0', 250.00, '2024-12-29 09:38:59', '2024-12-29 09:38:59'),
(1037, 49, 4, '0', 500.00, '2024-12-29 09:38:59', '2024-12-29 09:38:59'),
(1038, 49, 5, '0', 1000.00, '2024-12-29 09:38:59', '2024-12-29 09:38:59'),
(1039, 50, 1, '0', 10.00, '2024-12-29 10:45:21', '2024-12-29 10:45:21'),
(1040, 50, 2, '0', 50.00, '2024-12-29 10:45:21', '2024-12-29 10:45:21'),
(1041, 50, 3, '0', 250.00, '2024-12-29 10:45:21', '2024-12-29 10:45:21'),
(1042, 50, 4, '0', 500.00, '2024-12-29 10:45:21', '2024-12-29 10:45:21'),
(1043, 50, 5, '0', 1000.00, '2024-12-29 10:45:21', '2024-12-29 10:45:21'),
(1044, 51, 1, '0', 10.00, '2024-12-29 12:31:35', '2024-12-29 12:31:35'),
(1045, 51, 2, '0', 50.00, '2024-12-29 12:31:35', '2024-12-29 12:31:35'),
(1046, 51, 3, '0', 250.00, '2024-12-29 12:31:35', '2024-12-29 12:31:35'),
(1047, 51, 4, '0', 500.00, '2024-12-29 12:31:35', '2024-12-29 12:31:35'),
(1048, 51, 5, '0', 1000.00, '2024-12-29 12:31:35', '2024-12-29 12:31:35'),
(1049, 52, 1, '0', 10.00, '2024-12-29 13:52:00', '2024-12-29 13:52:00'),
(1050, 52, 2, '0', 50.00, '2024-12-29 13:52:00', '2024-12-29 13:52:00'),
(1051, 52, 3, '0', 250.00, '2024-12-29 13:52:00', '2024-12-29 13:52:00'),
(1052, 52, 4, '0', 500.00, '2024-12-29 13:52:00', '2024-12-29 13:52:00'),
(1053, 52, 5, '0', 1000.00, '2024-12-29 13:52:00', '2024-12-29 13:52:00'),
(1054, 53, 1, '0', 10.00, '2024-12-29 15:16:45', '2024-12-29 15:16:45'),
(1055, 53, 2, '0', 50.00, '2024-12-29 15:16:45', '2024-12-29 15:16:45'),
(1056, 53, 3, '0', 250.00, '2024-12-29 15:16:45', '2024-12-29 15:16:45'),
(1057, 53, 4, '0', 500.00, '2024-12-29 15:16:45', '2024-12-29 15:16:45'),
(1058, 53, 5, '0', 1000.00, '2024-12-29 15:16:45', '2024-12-29 15:16:45'),
(1059, 54, 1, '0', 10.00, '2024-12-29 19:46:24', '2024-12-29 19:46:24'),
(1060, 54, 2, '0', 50.00, '2024-12-29 19:46:24', '2024-12-29 19:46:24'),
(1061, 54, 3, '0', 250.00, '2024-12-29 19:46:24', '2024-12-29 19:46:24'),
(1062, 54, 4, '0', 500.00, '2024-12-29 19:46:24', '2024-12-29 19:46:24'),
(1063, 54, 5, '0', 1000.00, '2024-12-29 19:46:24', '2024-12-29 19:46:24'),
(1064, 55, 1, '0', 10.00, '2024-12-29 20:28:01', '2024-12-29 20:28:01'),
(1065, 55, 2, '0', 50.00, '2024-12-29 20:28:01', '2024-12-29 20:28:01'),
(1066, 55, 3, '0', 250.00, '2024-12-29 20:28:01', '2024-12-29 20:28:01'),
(1067, 55, 4, '0', 500.00, '2024-12-29 20:28:01', '2024-12-29 20:28:01'),
(1068, 55, 5, '0', 1000.00, '2024-12-29 20:28:01', '2024-12-29 20:28:01'),
(1069, 56, 1, '0', 10.00, '2024-12-29 20:40:23', '2024-12-29 20:40:23'),
(1070, 56, 2, '0', 50.00, '2024-12-29 20:40:23', '2024-12-29 20:40:23'),
(1071, 56, 3, '0', 250.00, '2024-12-29 20:40:23', '2024-12-29 20:40:23'),
(1072, 56, 4, '0', 500.00, '2024-12-29 20:40:23', '2024-12-29 20:40:23'),
(1073, 56, 5, '0', 1000.00, '2024-12-29 20:40:23', '2024-12-29 20:40:23'),
(1074, 57, 1, '0', 10.00, '2024-12-29 20:51:16', '2024-12-29 20:51:16'),
(1075, 57, 2, '0', 50.00, '2024-12-29 20:51:16', '2024-12-29 20:51:16'),
(1076, 57, 3, '0', 250.00, '2024-12-29 20:51:16', '2024-12-29 20:51:16'),
(1077, 57, 4, '0', 500.00, '2024-12-29 20:51:16', '2024-12-29 20:51:16'),
(1078, 57, 5, '0', 1000.00, '2024-12-29 20:51:16', '2024-12-29 20:51:16'),
(1079, 58, 1, '0', 10.00, '2024-12-29 21:05:00', '2024-12-29 21:05:00'),
(1080, 58, 2, '0', 50.00, '2024-12-29 21:05:00', '2024-12-29 21:05:00'),
(1081, 58, 3, '0', 250.00, '2024-12-29 21:05:00', '2024-12-29 21:05:00'),
(1082, 58, 4, '0', 500.00, '2024-12-29 21:05:00', '2024-12-29 21:05:00'),
(1083, 58, 5, '0', 1000.00, '2024-12-29 21:05:00', '2024-12-29 21:05:00'),
(1084, 59, 1, '0', 10.00, '2024-12-29 21:19:53', '2024-12-29 21:19:53'),
(1085, 59, 2, '0', 50.00, '2024-12-29 21:19:53', '2024-12-29 21:19:53'),
(1086, 59, 3, '0', 250.00, '2024-12-29 21:19:53', '2024-12-29 21:19:53'),
(1087, 59, 4, '0', 500.00, '2024-12-29 21:19:53', '2024-12-29 21:19:53'),
(1088, 59, 5, '0', 1000.00, '2024-12-29 21:19:53', '2024-12-29 21:19:53'),
(1089, 60, 1, '0', 10.00, '2024-12-29 22:20:50', '2024-12-29 22:20:50'),
(1090, 60, 2, '0', 50.00, '2024-12-29 22:20:50', '2024-12-29 22:20:50'),
(1091, 60, 3, '0', 250.00, '2024-12-29 22:20:50', '2024-12-29 22:20:50'),
(1092, 60, 4, '0', 500.00, '2024-12-29 22:20:50', '2024-12-29 22:20:50'),
(1093, 60, 5, '0', 1000.00, '2024-12-29 22:20:50', '2024-12-29 22:20:50'),
(1094, 61, 1, '0', 10.00, '2024-12-30 00:59:36', '2024-12-30 00:59:36'),
(1095, 61, 2, '0', 50.00, '2024-12-30 00:59:36', '2024-12-30 00:59:36'),
(1096, 61, 3, '0', 250.00, '2024-12-30 00:59:36', '2024-12-30 00:59:36'),
(1097, 61, 4, '0', 500.00, '2024-12-30 00:59:36', '2024-12-30 00:59:36'),
(1098, 61, 5, '0', 1000.00, '2024-12-30 00:59:36', '2024-12-30 00:59:36'),
(1099, 62, 1, '0', 10.00, '2024-12-30 01:53:12', '2024-12-30 01:53:12'),
(1100, 62, 2, '0', 50.00, '2024-12-30 01:53:12', '2024-12-30 01:53:12'),
(1101, 62, 3, '0', 250.00, '2024-12-30 01:53:12', '2024-12-30 01:53:12'),
(1102, 62, 4, '0', 500.00, '2024-12-30 01:53:12', '2024-12-30 01:53:12'),
(1103, 62, 5, '0', 1000.00, '2024-12-30 01:53:12', '2024-12-30 01:53:12'),
(1104, 63, 1, '0', 10.00, '2024-12-30 01:54:58', '2024-12-30 01:54:58'),
(1105, 63, 2, '0', 50.00, '2024-12-30 01:54:58', '2024-12-30 01:54:58'),
(1106, 63, 3, '0', 250.00, '2024-12-30 01:54:58', '2024-12-30 01:54:58'),
(1107, 63, 4, '0', 500.00, '2024-12-30 01:54:58', '2024-12-30 01:54:58'),
(1108, 63, 5, '0', 1000.00, '2024-12-30 01:54:58', '2024-12-30 01:54:58'),
(1109, 64, 1, '0', 10.00, '2024-12-30 14:38:29', '2024-12-30 14:38:29'),
(1110, 64, 2, '0', 50.00, '2024-12-30 14:38:29', '2024-12-30 14:38:29'),
(1111, 64, 3, '0', 250.00, '2024-12-30 14:38:29', '2024-12-30 14:38:29'),
(1112, 64, 4, '0', 500.00, '2024-12-30 14:38:29', '2024-12-30 14:38:29'),
(1113, 64, 5, '0', 1000.00, '2024-12-30 14:38:29', '2024-12-30 14:38:29'),
(1114, 65, 1, '0', 10.00, '2024-12-30 15:50:30', '2024-12-30 15:50:30'),
(1115, 65, 2, '0', 50.00, '2024-12-30 15:50:30', '2024-12-30 15:50:30'),
(1116, 65, 3, '0', 250.00, '2024-12-30 15:50:30', '2024-12-30 15:50:30'),
(1117, 65, 4, '0', 500.00, '2024-12-30 15:50:30', '2024-12-30 15:50:30'),
(1118, 65, 5, '0', 1000.00, '2024-12-30 15:50:30', '2024-12-30 15:50:30'),
(1119, 66, 1, '0', 10.00, '2024-12-30 16:39:40', '2024-12-30 16:39:40'),
(1120, 66, 2, '0', 50.00, '2024-12-30 16:39:40', '2024-12-30 16:39:40'),
(1121, 66, 3, '0', 250.00, '2024-12-30 16:39:40', '2024-12-30 16:39:40'),
(1122, 66, 4, '0', 500.00, '2024-12-30 16:39:40', '2024-12-30 16:39:40'),
(1123, 66, 5, '0', 1000.00, '2024-12-30 16:39:40', '2024-12-30 16:39:40'),
(1124, 67, 1, '0', 10.00, '2024-12-30 18:03:50', '2024-12-30 18:03:50'),
(1125, 67, 2, '0', 50.00, '2024-12-30 18:03:50', '2024-12-30 18:03:50'),
(1126, 67, 3, '0', 250.00, '2024-12-30 18:03:50', '2024-12-30 18:03:50'),
(1127, 67, 4, '0', 500.00, '2024-12-30 18:03:50', '2024-12-30 18:03:50'),
(1128, 67, 5, '0', 1000.00, '2024-12-30 18:03:50', '2024-12-30 18:03:50'),
(1129, 68, 1, '0', 10.00, '2024-12-30 19:08:59', '2024-12-30 19:08:59'),
(1130, 68, 2, '0', 50.00, '2024-12-30 19:08:59', '2024-12-30 19:08:59'),
(1131, 68, 3, '0', 250.00, '2024-12-30 19:08:59', '2024-12-30 19:08:59'),
(1132, 68, 4, '0', 500.00, '2024-12-30 19:08:59', '2024-12-30 19:08:59'),
(1133, 68, 5, '0', 1000.00, '2024-12-30 19:08:59', '2024-12-30 19:08:59'),
(1134, 69, 1, '0', 10.00, '2024-12-30 19:27:55', '2024-12-30 19:27:55'),
(1135, 69, 2, '0', 50.00, '2024-12-30 19:27:55', '2024-12-30 19:27:55'),
(1136, 69, 3, '0', 250.00, '2024-12-30 19:27:55', '2024-12-30 19:27:55'),
(1137, 69, 4, '0', 500.00, '2024-12-30 19:27:55', '2024-12-30 19:27:55'),
(1138, 69, 5, '0', 1000.00, '2024-12-30 19:27:55', '2024-12-30 19:27:55'),
(1139, 70, 1, '0', 10.00, '2024-12-30 19:32:19', '2024-12-30 19:32:19'),
(1140, 70, 2, '0', 50.00, '2024-12-30 19:32:19', '2024-12-30 19:32:19'),
(1141, 70, 3, '0', 250.00, '2024-12-30 19:32:19', '2024-12-30 19:32:19'),
(1142, 70, 4, '0', 500.00, '2024-12-30 19:32:19', '2024-12-30 19:32:19'),
(1143, 70, 5, '0', 1000.00, '2024-12-30 19:32:19', '2024-12-30 19:32:19'),
(1144, 71, 1, '0', 10.00, '2024-12-30 21:06:45', '2024-12-30 21:06:45'),
(1145, 71, 2, '0', 50.00, '2024-12-30 21:06:45', '2024-12-30 21:06:45'),
(1146, 71, 3, '0', 250.00, '2024-12-30 21:06:45', '2024-12-30 21:06:45'),
(1147, 71, 4, '0', 500.00, '2024-12-30 21:06:45', '2024-12-30 21:06:45'),
(1148, 71, 5, '0', 1000.00, '2024-12-30 21:06:45', '2024-12-30 21:06:45'),
(1149, 72, 1, '0', 10.00, '2024-12-30 21:25:04', '2024-12-30 21:25:04'),
(1150, 72, 2, '0', 50.00, '2024-12-30 21:25:04', '2024-12-30 21:25:04'),
(1151, 72, 3, '0', 250.00, '2024-12-30 21:25:04', '2024-12-30 21:25:04'),
(1152, 72, 4, '0', 500.00, '2024-12-30 21:25:04', '2024-12-30 21:25:04'),
(1153, 72, 5, '0', 1000.00, '2024-12-30 21:25:04', '2024-12-30 21:25:04'),
(1154, 73, 1, '0', 10.00, '2024-12-30 21:52:41', '2024-12-30 21:52:41'),
(1155, 73, 2, '0', 50.00, '2024-12-30 21:52:41', '2024-12-30 21:52:41'),
(1156, 73, 3, '0', 250.00, '2024-12-30 21:52:41', '2024-12-30 21:52:41'),
(1157, 73, 4, '0', 500.00, '2024-12-30 21:52:41', '2024-12-30 21:52:41'),
(1158, 73, 5, '0', 1000.00, '2024-12-30 21:52:41', '2024-12-30 21:52:41'),
(1159, 74, 1, '0', 10.00, '2024-12-31 01:10:00', '2024-12-31 01:10:00'),
(1160, 74, 2, '0', 50.00, '2024-12-31 01:10:00', '2024-12-31 01:10:00'),
(1161, 74, 3, '0', 250.00, '2024-12-31 01:10:00', '2024-12-31 01:10:00'),
(1162, 74, 4, '0', 500.00, '2024-12-31 01:10:00', '2024-12-31 01:10:00'),
(1163, 74, 5, '0', 1000.00, '2024-12-31 01:10:00', '2024-12-31 01:10:00'),
(1164, 75, 1, '0', 10.00, '2024-12-31 01:35:41', '2024-12-31 01:35:41'),
(1165, 75, 2, '0', 50.00, '2024-12-31 01:35:41', '2024-12-31 01:35:41'),
(1166, 75, 3, '0', 250.00, '2024-12-31 01:35:41', '2024-12-31 01:35:41'),
(1167, 75, 4, '0', 500.00, '2024-12-31 01:35:41', '2024-12-31 01:35:41'),
(1168, 75, 5, '0', 1000.00, '2024-12-31 01:35:41', '2024-12-31 01:35:41'),
(1169, 76, 1, '0', 10.00, '2024-12-31 01:46:39', '2024-12-31 01:46:39'),
(1170, 76, 2, '0', 50.00, '2024-12-31 01:46:39', '2024-12-31 01:46:39'),
(1171, 76, 3, '0', 250.00, '2024-12-31 01:46:39', '2024-12-31 01:46:39'),
(1172, 76, 4, '0', 500.00, '2024-12-31 01:46:39', '2024-12-31 01:46:39'),
(1173, 76, 5, '0', 1000.00, '2024-12-31 01:46:39', '2024-12-31 01:46:39'),
(1174, 77, 1, '0', 10.00, '2024-12-31 02:18:50', '2024-12-31 02:18:50'),
(1175, 77, 2, '0', 50.00, '2024-12-31 02:18:50', '2024-12-31 02:18:50'),
(1176, 77, 3, '0', 250.00, '2024-12-31 02:18:50', '2024-12-31 02:18:50'),
(1177, 77, 4, '0', 500.00, '2024-12-31 02:18:50', '2024-12-31 02:18:50'),
(1178, 77, 5, '0', 1000.00, '2024-12-31 02:18:50', '2024-12-31 02:18:50'),
(1179, 78, 1, '0', 10.00, '2024-12-31 08:34:19', '2024-12-31 08:34:19'),
(1180, 78, 2, '0', 50.00, '2024-12-31 08:34:19', '2024-12-31 08:34:19'),
(1181, 78, 3, '0', 250.00, '2024-12-31 08:34:19', '2024-12-31 08:34:19'),
(1182, 78, 4, '0', 500.00, '2024-12-31 08:34:19', '2024-12-31 08:34:19'),
(1183, 78, 5, '0', 1000.00, '2024-12-31 08:34:19', '2024-12-31 08:34:19'),
(1184, 79, 1, '0', 10.00, '2024-12-31 10:53:09', '2024-12-31 10:53:09'),
(1185, 79, 2, '0', 50.00, '2024-12-31 10:53:09', '2024-12-31 10:53:09'),
(1186, 79, 3, '0', 250.00, '2024-12-31 10:53:09', '2024-12-31 10:53:09'),
(1187, 79, 4, '0', 500.00, '2024-12-31 10:53:09', '2024-12-31 10:53:09'),
(1188, 79, 5, '0', 1000.00, '2024-12-31 10:53:09', '2024-12-31 10:53:09'),
(1189, 80, 1, '0', 10.00, '2024-12-31 11:12:26', '2024-12-31 11:12:26'),
(1190, 80, 2, '0', 50.00, '2024-12-31 11:12:26', '2024-12-31 11:12:26'),
(1191, 80, 3, '0', 250.00, '2024-12-31 11:12:26', '2024-12-31 11:12:26'),
(1192, 80, 4, '0', 500.00, '2024-12-31 11:12:26', '2024-12-31 11:12:26'),
(1193, 80, 5, '0', 1000.00, '2024-12-31 11:12:26', '2024-12-31 11:12:26'),
(1194, 81, 1, '0', 10.00, '2024-12-31 11:21:24', '2024-12-31 11:21:24'),
(1195, 81, 2, '0', 50.00, '2024-12-31 11:21:24', '2024-12-31 11:21:24'),
(1196, 81, 3, '0', 250.00, '2024-12-31 11:21:24', '2024-12-31 11:21:24'),
(1197, 81, 4, '0', 500.00, '2024-12-31 11:21:24', '2024-12-31 11:21:24'),
(1198, 81, 5, '0', 1000.00, '2024-12-31 11:21:24', '2024-12-31 11:21:24'),
(1199, 82, 1, '0', 10.00, '2024-12-31 13:06:58', '2024-12-31 13:06:58'),
(1200, 82, 2, '0', 50.00, '2024-12-31 13:06:58', '2024-12-31 13:06:58'),
(1201, 82, 3, '0', 250.00, '2024-12-31 13:06:58', '2024-12-31 13:06:58'),
(1202, 82, 4, '0', 500.00, '2024-12-31 13:06:58', '2024-12-31 13:06:58'),
(1203, 82, 5, '0', 1000.00, '2024-12-31 13:06:58', '2024-12-31 13:06:58'),
(1204, 83, 1, '0', 10.00, '2024-12-31 17:13:29', '2024-12-31 17:13:29'),
(1205, 83, 2, '0', 50.00, '2024-12-31 17:13:29', '2024-12-31 17:13:29'),
(1206, 83, 3, '0', 250.00, '2024-12-31 17:13:29', '2024-12-31 17:13:29'),
(1207, 83, 4, '0', 500.00, '2024-12-31 17:13:29', '2024-12-31 17:13:29'),
(1208, 83, 5, '0', 1000.00, '2024-12-31 17:13:29', '2024-12-31 17:13:29'),
(1209, 84, 1, '0', 10.00, '2024-12-31 20:23:55', '2024-12-31 20:23:55'),
(1210, 84, 2, '0', 50.00, '2024-12-31 20:23:55', '2024-12-31 20:23:55'),
(1211, 84, 3, '0', 250.00, '2024-12-31 20:23:55', '2024-12-31 20:23:55'),
(1212, 84, 4, '0', 500.00, '2024-12-31 20:23:55', '2024-12-31 20:23:55'),
(1213, 84, 5, '0', 1000.00, '2024-12-31 20:23:55', '2024-12-31 20:23:55'),
(1214, 85, 1, '0', 10.00, '2024-12-31 22:09:20', '2024-12-31 22:09:20'),
(1215, 85, 2, '0', 50.00, '2024-12-31 22:09:20', '2024-12-31 22:09:20'),
(1216, 85, 3, '0', 250.00, '2024-12-31 22:09:20', '2024-12-31 22:09:20'),
(1217, 85, 4, '0', 500.00, '2024-12-31 22:09:20', '2024-12-31 22:09:20'),
(1218, 85, 5, '0', 1000.00, '2024-12-31 22:09:20', '2024-12-31 22:09:20'),
(1219, 86, 1, '0', 10.00, '2025-01-01 19:34:03', '2025-01-01 19:34:03'),
(1220, 86, 2, '0', 50.00, '2025-01-01 19:34:03', '2025-01-01 19:34:03'),
(1221, 86, 3, '0', 250.00, '2025-01-01 19:34:03', '2025-01-01 19:34:03'),
(1222, 86, 4, '0', 500.00, '2025-01-01 19:34:03', '2025-01-01 19:34:03'),
(1223, 86, 5, '0', 1000.00, '2025-01-01 19:34:03', '2025-01-01 19:34:03'),
(1224, 87, 1, '0', 10.00, '2025-01-02 02:57:52', '2025-01-02 02:57:52'),
(1225, 87, 2, '0', 50.00, '2025-01-02 02:57:52', '2025-01-02 02:57:52'),
(1226, 87, 3, '0', 250.00, '2025-01-02 02:57:52', '2025-01-02 02:57:52'),
(1227, 87, 4, '0', 500.00, '2025-01-02 02:57:52', '2025-01-02 02:57:52'),
(1228, 87, 5, '0', 1000.00, '2025-01-02 02:57:52', '2025-01-02 02:57:52'),
(1229, 88, 1, '0', 10.00, '2025-01-02 06:35:17', '2025-01-02 06:35:17'),
(1230, 88, 2, '0', 50.00, '2025-01-02 06:35:17', '2025-01-02 06:35:17'),
(1231, 88, 3, '0', 250.00, '2025-01-02 06:35:17', '2025-01-02 06:35:17'),
(1232, 88, 4, '0', 500.00, '2025-01-02 06:35:17', '2025-01-02 06:35:17'),
(1233, 88, 5, '0', 1000.00, '2025-01-02 06:35:17', '2025-01-02 06:35:17'),
(1234, 89, 1, '0', 10.00, '2025-01-02 13:02:54', '2025-01-02 13:02:54'),
(1235, 89, 2, '0', 50.00, '2025-01-02 13:02:54', '2025-01-02 13:02:54'),
(1236, 89, 3, '0', 250.00, '2025-01-02 13:02:54', '2025-01-02 13:02:54'),
(1237, 89, 4, '0', 500.00, '2025-01-02 13:02:54', '2025-01-02 13:02:54'),
(1238, 89, 5, '0', 1000.00, '2025-01-02 13:02:54', '2025-01-02 13:02:54'),
(1239, 90, 1, '0', 10.00, '2025-01-02 22:41:18', '2025-01-02 22:41:18'),
(1240, 90, 2, '0', 50.00, '2025-01-02 22:41:18', '2025-01-02 22:41:18'),
(1241, 90, 3, '0', 250.00, '2025-01-02 22:41:18', '2025-01-02 22:41:18'),
(1242, 90, 4, '0', 500.00, '2025-01-02 22:41:18', '2025-01-02 22:41:18'),
(1243, 90, 5, '0', 1000.00, '2025-01-02 22:41:18', '2025-01-02 22:41:18'),
(1244, 91, 1, '0', 10.00, '2025-01-02 22:55:43', '2025-01-02 22:55:43'),
(1245, 91, 2, '0', 50.00, '2025-01-02 22:55:43', '2025-01-02 22:55:43'),
(1246, 91, 3, '0', 250.00, '2025-01-02 22:55:43', '2025-01-02 22:55:43'),
(1247, 91, 4, '0', 500.00, '2025-01-02 22:55:43', '2025-01-02 22:55:43'),
(1248, 91, 5, '0', 1000.00, '2025-01-02 22:55:43', '2025-01-02 22:55:43'),
(1249, 92, 1, '0', 10.00, '2025-01-02 23:22:58', '2025-01-02 23:22:58'),
(1250, 92, 2, '0', 50.00, '2025-01-02 23:22:58', '2025-01-02 23:22:58'),
(1251, 92, 3, '0', 250.00, '2025-01-02 23:22:58', '2025-01-02 23:22:58'),
(1252, 92, 4, '0', 500.00, '2025-01-02 23:22:58', '2025-01-02 23:22:58'),
(1253, 92, 5, '0', 1000.00, '2025-01-02 23:22:58', '2025-01-02 23:22:58'),
(1254, 93, 1, '0', 10.00, '2025-01-03 22:11:37', '2025-01-03 22:11:37'),
(1255, 93, 2, '0', 50.00, '2025-01-03 22:11:37', '2025-01-03 22:11:37'),
(1256, 93, 3, '0', 250.00, '2025-01-03 22:11:37', '2025-01-03 22:11:37'),
(1257, 93, 4, '0', 500.00, '2025-01-03 22:11:37', '2025-01-03 22:11:37'),
(1258, 93, 5, '0', 1000.00, '2025-01-03 22:11:37', '2025-01-03 22:11:37'),
(1259, 94, 1, '1', 10.00, '2025-01-15 00:41:27', '2025-01-22 02:30:42'),
(1260, 94, 2, '0', 50.00, '2025-01-15 00:41:27', '2025-01-15 00:41:27'),
(1261, 94, 3, '0', 250.00, '2025-01-15 00:41:27', '2025-01-15 00:41:27'),
(1262, 94, 4, '0', 500.00, '2025-01-15 00:41:27', '2025-01-15 00:41:27'),
(1263, 94, 5, '0', 1000.00, '2025-01-15 00:41:27', '2025-01-15 00:41:27'),
(1264, 95, 1, '0', 10.00, '2025-01-16 03:16:39', '2025-01-16 03:16:39'),
(1265, 95, 2, '0', 50.00, '2025-01-16 03:16:39', '2025-01-16 03:16:39'),
(1266, 95, 3, '0', 250.00, '2025-01-16 03:16:39', '2025-01-16 03:16:39'),
(1267, 95, 4, '0', 500.00, '2025-01-16 03:16:39', '2025-01-16 03:16:39'),
(1268, 95, 5, '0', 1000.00, '2025-01-16 03:16:39', '2025-01-16 03:16:39'),
(1269, 96, 1, '0', 10.00, '2025-01-16 15:34:05', '2025-01-16 15:34:05'),
(1270, 96, 2, '0', 50.00, '2025-01-16 15:34:05', '2025-01-16 15:34:05'),
(1271, 96, 3, '0', 250.00, '2025-01-16 15:34:05', '2025-01-16 15:34:05'),
(1272, 96, 4, '0', 500.00, '2025-01-16 15:34:05', '2025-01-16 15:34:05'),
(1273, 96, 5, '0', 1000.00, '2025-01-16 15:34:05', '2025-01-16 15:34:05'),
(1274, 97, 1, '0', 10.00, '2025-01-17 19:27:34', '2025-01-17 19:27:34'),
(1275, 97, 2, '0', 50.00, '2025-01-17 19:27:34', '2025-01-17 19:27:34'),
(1276, 97, 3, '0', 250.00, '2025-01-17 19:27:34', '2025-01-17 19:27:34'),
(1277, 97, 4, '0', 500.00, '2025-01-17 19:27:34', '2025-01-17 19:27:34'),
(1278, 97, 5, '0', 1000.00, '2025-01-17 19:27:34', '2025-01-17 19:27:34'),
(1279, 98, 1, '0', 10.00, '2025-01-18 01:26:31', '2025-01-18 01:26:31'),
(1280, 98, 2, '0', 50.00, '2025-01-18 01:26:31', '2025-01-18 01:26:31'),
(1281, 98, 3, '0', 250.00, '2025-01-18 01:26:31', '2025-01-18 01:26:31'),
(1282, 98, 4, '0', 500.00, '2025-01-18 01:26:31', '2025-01-18 01:26:31'),
(1283, 98, 5, '0', 1000.00, '2025-01-18 01:26:31', '2025-01-18 01:26:31'),
(1284, 99, 1, '0', 10.00, '2025-01-20 19:14:13', '2025-01-20 19:14:13'),
(1285, 99, 2, '0', 50.00, '2025-01-20 19:14:13', '2025-01-20 19:14:13'),
(1286, 99, 3, '0', 250.00, '2025-01-20 19:14:13', '2025-01-20 19:14:13'),
(1287, 99, 4, '0', 500.00, '2025-01-20 19:14:13', '2025-01-20 19:14:13'),
(1288, 99, 5, '0', 1000.00, '2025-01-20 19:14:13', '2025-01-20 19:14:13'),
(1289, 100, 1, '0', 10.00, '2025-01-22 12:23:31', '2025-01-22 12:23:31'),
(1290, 100, 2, '0', 50.00, '2025-01-22 12:23:31', '2025-01-22 12:23:31'),
(1291, 100, 3, '0', 250.00, '2025-01-22 12:23:31', '2025-01-22 12:23:31'),
(1292, 100, 4, '0', 500.00, '2025-01-22 12:23:31', '2025-01-22 12:23:31'),
(1293, 100, 5, '0', 1000.00, '2025-01-22 12:23:31', '2025-01-22 12:23:31'),
(1294, 101, 1, '0', 10.00, '2025-01-22 13:02:38', '2025-01-22 13:02:38'),
(1295, 101, 2, '0', 50.00, '2025-01-22 13:02:38', '2025-01-22 13:02:38'),
(1296, 101, 3, '0', 250.00, '2025-01-22 13:02:38', '2025-01-22 13:02:38'),
(1297, 101, 4, '0', 500.00, '2025-01-22 13:02:38', '2025-01-22 13:02:38'),
(1298, 101, 5, '0', 1000.00, '2025-01-22 13:02:38', '2025-01-22 13:02:38'),
(1299, 102, 1, '0', 10.00, '2025-01-22 13:33:38', '2025-01-22 13:33:38'),
(1300, 102, 2, '0', 50.00, '2025-01-22 13:33:38', '2025-01-22 13:33:38'),
(1301, 102, 3, '0', 250.00, '2025-01-22 13:33:39', '2025-01-22 13:33:39'),
(1302, 102, 4, '0', 500.00, '2025-01-22 13:33:39', '2025-01-22 13:33:39'),
(1303, 102, 5, '0', 1000.00, '2025-01-22 13:33:39', '2025-01-22 13:33:39'),
(1304, 103, 1, '0', 10.00, '2025-01-23 04:01:44', '2025-01-23 04:01:44'),
(1305, 103, 2, '0', 50.00, '2025-01-23 04:01:44', '2025-01-23 04:01:44'),
(1306, 103, 3, '0', 250.00, '2025-01-23 04:01:44', '2025-01-23 04:01:44'),
(1307, 103, 4, '0', 500.00, '2025-01-23 04:01:44', '2025-01-23 04:01:44'),
(1308, 103, 5, '0', 1000.00, '2025-01-23 04:01:44', '2025-01-23 04:01:44'),
(1309, 104, 1, '0', 10.00, '2025-01-24 00:36:39', '2025-01-24 00:36:39'),
(1310, 104, 2, '0', 50.00, '2025-01-24 00:36:39', '2025-01-24 00:36:39'),
(1311, 104, 3, '0', 250.00, '2025-01-24 00:36:39', '2025-01-24 00:36:39'),
(1312, 104, 4, '0', 500.00, '2025-01-24 00:36:39', '2025-01-24 00:36:39'),
(1313, 104, 5, '0', 1000.00, '2025-01-24 00:36:39', '2025-01-24 00:36:39'),
(1314, 105, 1, '0', 10.00, '2025-01-24 16:51:22', '2025-01-24 16:51:22'),
(1315, 105, 2, '0', 50.00, '2025-01-24 16:51:22', '2025-01-24 16:51:22'),
(1316, 105, 3, '0', 250.00, '2025-01-24 16:51:22', '2025-01-24 16:51:22'),
(1317, 105, 4, '0', 500.00, '2025-01-24 16:51:22', '2025-01-24 16:51:22'),
(1318, 105, 5, '0', 1000.00, '2025-01-24 16:51:22', '2025-01-24 16:51:22'),
(1319, 106, 1, '0', 10.00, '2025-01-25 16:50:11', '2025-01-25 16:50:11'),
(1320, 106, 2, '0', 50.00, '2025-01-25 16:50:11', '2025-01-25 16:50:11'),
(1321, 106, 3, '0', 250.00, '2025-01-25 16:50:11', '2025-01-25 16:50:11'),
(1322, 106, 4, '0', 500.00, '2025-01-25 16:50:11', '2025-01-25 16:50:11'),
(1323, 106, 5, '0', 1000.00, '2025-01-25 16:50:11', '2025-01-25 16:50:11'),
(1324, 107, 1, '0', 10.00, '2025-01-25 18:23:43', '2025-01-25 18:23:43'),
(1325, 107, 2, '0', 50.00, '2025-01-25 18:23:43', '2025-01-25 18:23:43'),
(1326, 107, 3, '0', 250.00, '2025-01-25 18:23:43', '2025-01-25 18:23:43'),
(1327, 107, 4, '0', 500.00, '2025-01-25 18:23:43', '2025-01-25 18:23:43'),
(1328, 107, 5, '0', 1000.00, '2025-01-25 18:23:43', '2025-01-25 18:23:43'),
(1329, 108, 1, '0', 10.00, '2025-01-26 08:31:41', '2025-01-26 08:31:41'),
(1330, 108, 2, '0', 50.00, '2025-01-26 08:31:41', '2025-01-26 08:31:41'),
(1331, 108, 3, '0', 250.00, '2025-01-26 08:31:41', '2025-01-26 08:31:41'),
(1332, 108, 4, '0', 500.00, '2025-01-26 08:31:41', '2025-01-26 08:31:41'),
(1333, 108, 5, '0', 1000.00, '2025-01-26 08:31:41', '2025-01-26 08:31:41'),
(1334, 109, 1, '0', 10.00, '2025-01-26 14:00:57', '2025-01-26 14:00:57'),
(1335, 109, 2, '0', 50.00, '2025-01-26 14:00:57', '2025-01-26 14:00:57'),
(1336, 109, 3, '0', 250.00, '2025-01-26 14:00:57', '2025-01-26 14:00:57'),
(1337, 109, 4, '0', 500.00, '2025-01-26 14:00:57', '2025-01-26 14:00:57'),
(1338, 109, 5, '0', 1000.00, '2025-01-26 14:00:57', '2025-01-26 14:00:57'),
(1339, 110, 1, '0', 10.00, '2025-01-26 19:08:50', '2025-01-26 19:08:50'),
(1340, 110, 2, '0', 50.00, '2025-01-26 19:08:50', '2025-01-26 19:08:50'),
(1341, 110, 3, '0', 250.00, '2025-01-26 19:08:50', '2025-01-26 19:08:50'),
(1342, 110, 4, '0', 500.00, '2025-01-26 19:08:50', '2025-01-26 19:08:50'),
(1343, 110, 5, '0', 1000.00, '2025-01-26 19:08:50', '2025-01-26 19:08:50'),
(1344, 111, 1, '0', 10.00, '2025-01-26 21:12:57', '2025-01-26 21:12:57'),
(1345, 111, 2, '0', 50.00, '2025-01-26 21:12:57', '2025-01-26 21:12:57'),
(1346, 111, 3, '0', 250.00, '2025-01-26 21:12:57', '2025-01-26 21:12:57'),
(1347, 111, 4, '0', 500.00, '2025-01-26 21:12:57', '2025-01-26 21:12:57'),
(1348, 111, 5, '0', 1000.00, '2025-01-26 21:12:57', '2025-01-26 21:12:57'),
(1349, 112, 1, '0', 10.00, '2025-01-27 19:41:57', '2025-01-27 19:41:57'),
(1350, 112, 2, '0', 50.00, '2025-01-27 19:41:57', '2025-01-27 19:41:57'),
(1351, 112, 3, '0', 250.00, '2025-01-27 19:41:57', '2025-01-27 19:41:57'),
(1352, 112, 4, '0', 500.00, '2025-01-27 19:41:57', '2025-01-27 19:41:57'),
(1353, 112, 5, '0', 1000.00, '2025-01-27 19:41:57', '2025-01-27 19:41:57'),
(1354, 113, 1, '0', 10.00, '2025-01-28 00:28:53', '2025-01-28 00:28:53'),
(1355, 113, 2, '0', 50.00, '2025-01-28 00:28:53', '2025-01-28 00:28:53'),
(1356, 113, 3, '0', 250.00, '2025-01-28 00:28:53', '2025-01-28 00:28:53'),
(1357, 113, 4, '0', 500.00, '2025-01-28 00:28:53', '2025-01-28 00:28:53'),
(1358, 113, 5, '0', 1000.00, '2025-01-28 00:28:53', '2025-01-28 00:28:53'),
(1359, 114, 1, '0', 10.00, '2025-01-28 01:22:34', '2025-01-28 01:22:34'),
(1360, 114, 2, '0', 50.00, '2025-01-28 01:22:34', '2025-01-28 01:22:34'),
(1361, 114, 3, '0', 250.00, '2025-01-28 01:22:34', '2025-01-28 01:22:34'),
(1362, 114, 4, '0', 500.00, '2025-01-28 01:22:34', '2025-01-28 01:22:34'),
(1363, 114, 5, '0', 1000.00, '2025-01-28 01:22:34', '2025-01-28 01:22:34'),
(1364, 115, 1, '0', 10.00, '2025-02-02 23:16:01', '2025-02-02 23:16:01'),
(1365, 115, 2, '0', 50.00, '2025-02-02 23:16:01', '2025-02-02 23:16:01'),
(1366, 115, 3, '0', 250.00, '2025-02-02 23:16:01', '2025-02-02 23:16:01'),
(1367, 115, 4, '0', 500.00, '2025-02-02 23:16:01', '2025-02-02 23:16:01'),
(1368, 115, 5, '0', 1000.00, '2025-02-02 23:16:01', '2025-02-02 23:16:01'),
(1369, 116, 1, '0', 10.00, '2025-02-03 20:18:23', '2025-02-03 20:18:23'),
(1370, 116, 2, '0', 50.00, '2025-02-03 20:18:23', '2025-02-03 20:18:23'),
(1371, 116, 3, '0', 250.00, '2025-02-03 20:18:23', '2025-02-03 20:18:23'),
(1372, 116, 4, '0', 500.00, '2025-02-03 20:18:23', '2025-02-03 20:18:23'),
(1373, 116, 5, '0', 1000.00, '2025-02-03 20:18:23', '2025-02-03 20:18:23'),
(1374, 117, 1, '0', 10.00, '2025-02-03 20:19:54', '2025-02-03 20:19:54'),
(1375, 117, 2, '0', 50.00, '2025-02-03 20:19:54', '2025-02-03 20:19:54'),
(1376, 117, 3, '0', 250.00, '2025-02-03 20:19:54', '2025-02-03 20:19:54'),
(1377, 117, 4, '0', 500.00, '2025-02-03 20:19:54', '2025-02-03 20:19:54'),
(1378, 117, 5, '0', 1000.00, '2025-02-03 20:19:54', '2025-02-03 20:19:54'),
(1379, 118, 1, '0', 10.00, '2025-02-03 22:49:17', '2025-02-03 22:49:17'),
(1380, 118, 2, '0', 50.00, '2025-02-03 22:49:17', '2025-02-03 22:49:17'),
(1381, 118, 3, '0', 250.00, '2025-02-03 22:49:17', '2025-02-03 22:49:17'),
(1382, 118, 4, '0', 500.00, '2025-02-03 22:49:17', '2025-02-03 22:49:17'),
(1383, 118, 5, '0', 1000.00, '2025-02-03 22:49:17', '2025-02-03 22:49:17'),
(1384, 119, 1, '0', 10.00, '2025-02-04 01:39:55', '2025-02-04 01:39:55'),
(1385, 119, 2, '0', 50.00, '2025-02-04 01:39:55', '2025-02-04 01:39:55'),
(1386, 119, 3, '0', 250.00, '2025-02-04 01:39:55', '2025-02-04 01:39:55'),
(1387, 119, 4, '0', 500.00, '2025-02-04 01:39:55', '2025-02-04 01:39:55'),
(1388, 119, 5, '0', 1000.00, '2025-02-04 01:39:55', '2025-02-04 01:39:55'),
(1389, 120, 1, '0', 10.00, '2025-02-04 17:26:15', '2025-02-04 17:26:15'),
(1390, 120, 2, '0', 50.00, '2025-02-04 17:26:15', '2025-02-04 17:26:15'),
(1391, 120, 3, '0', 250.00, '2025-02-04 17:26:15', '2025-02-04 17:26:15'),
(1392, 120, 4, '0', 500.00, '2025-02-04 17:26:15', '2025-02-04 17:26:15'),
(1393, 120, 5, '0', 1000.00, '2025-02-04 17:26:15', '2025-02-04 17:26:15'),
(1394, 121, 1, '0', 10.00, '2025-02-04 17:31:22', '2025-02-04 17:31:22'),
(1395, 121, 2, '0', 50.00, '2025-02-04 17:31:22', '2025-02-04 17:31:22'),
(1396, 121, 3, '0', 250.00, '2025-02-04 17:31:22', '2025-02-04 17:31:22'),
(1397, 121, 4, '0', 500.00, '2025-02-04 17:31:22', '2025-02-04 17:31:22'),
(1398, 121, 5, '0', 1000.00, '2025-02-04 17:31:22', '2025-02-04 17:31:22'),
(1399, 122, 1, '0', 10.00, '2025-02-08 05:33:41', '2025-02-08 05:33:41'),
(1400, 122, 2, '0', 50.00, '2025-02-08 05:33:41', '2025-02-08 05:33:41'),
(1401, 122, 3, '0', 250.00, '2025-02-08 05:33:41', '2025-02-08 05:33:41'),
(1402, 122, 4, '0', 500.00, '2025-02-08 05:33:41', '2025-02-08 05:33:41'),
(1403, 122, 5, '0', 1000.00, '2025-02-08 05:33:41', '2025-02-08 05:33:41'),
(1404, 123, 1, '0', 10.00, '2025-02-11 12:40:50', '2025-02-11 12:40:50'),
(1405, 123, 2, '0', 50.00, '2025-02-11 12:40:50', '2025-02-11 12:40:50'),
(1406, 123, 3, '0', 250.00, '2025-02-11 12:40:50', '2025-02-11 12:40:50'),
(1407, 123, 4, '0', 500.00, '2025-02-11 12:40:50', '2025-02-11 12:40:50'),
(1408, 123, 5, '0', 1000.00, '2025-02-11 12:40:50', '2025-02-11 12:40:50'),
(1409, 124, 1, '0', 10.00, '2025-02-13 20:46:02', '2025-02-13 20:46:02'),
(1410, 124, 2, '0', 50.00, '2025-02-13 20:46:02', '2025-02-13 20:46:02'),
(1411, 124, 3, '0', 250.00, '2025-02-13 20:46:02', '2025-02-13 20:46:02'),
(1412, 124, 4, '0', 500.00, '2025-02-13 20:46:02', '2025-02-13 20:46:02'),
(1413, 124, 5, '0', 1000.00, '2025-02-13 20:46:02', '2025-02-13 20:46:02'),
(1414, 125, 1, '0', 10.00, '2025-02-13 22:44:19', '2025-02-13 22:44:19'),
(1415, 125, 2, '0', 50.00, '2025-02-13 22:44:19', '2025-02-13 22:44:19'),
(1416, 125, 3, '0', 250.00, '2025-02-13 22:44:19', '2025-02-13 22:44:19'),
(1417, 125, 4, '0', 500.00, '2025-02-13 22:44:19', '2025-02-13 22:44:19'),
(1418, 125, 5, '0', 1000.00, '2025-02-13 22:44:19', '2025-02-13 22:44:19'),
(1419, 126, 1, '0', 10.00, '2025-02-13 23:28:30', '2025-02-13 23:28:30'),
(1420, 126, 2, '0', 50.00, '2025-02-13 23:28:30', '2025-02-13 23:28:30'),
(1421, 126, 3, '0', 250.00, '2025-02-13 23:28:30', '2025-02-13 23:28:30'),
(1422, 126, 4, '0', 500.00, '2025-02-13 23:28:30', '2025-02-13 23:28:30'),
(1423, 126, 5, '0', 1000.00, '2025-02-13 23:28:30', '2025-02-13 23:28:30'),
(1424, 127, 1, '0', 10.00, '2025-02-17 20:27:09', '2025-02-17 20:27:09'),
(1425, 127, 2, '0', 50.00, '2025-02-17 20:27:09', '2025-02-17 20:27:09'),
(1426, 127, 3, '0', 250.00, '2025-02-17 20:27:10', '2025-02-17 20:27:10'),
(1427, 127, 4, '0', 500.00, '2025-02-17 20:27:10', '2025-02-17 20:27:10'),
(1428, 127, 5, '0', 1000.00, '2025-02-17 20:27:10', '2025-02-17 20:27:10'),
(1429, 128, 1, '0', 10.00, '2025-02-17 20:33:22', '2025-02-17 20:33:22'),
(1430, 128, 2, '0', 50.00, '2025-02-17 20:33:22', '2025-02-17 20:33:22'),
(1431, 128, 3, '0', 250.00, '2025-02-17 20:33:22', '2025-02-17 20:33:22'),
(1432, 128, 4, '0', 500.00, '2025-02-17 20:33:22', '2025-02-17 20:33:22'),
(1433, 128, 5, '0', 1000.00, '2025-02-17 20:33:22', '2025-02-17 20:33:22'),
(1434, 129, 1, '0', 10.00, '2025-02-17 20:34:13', '2025-02-17 20:34:13'),
(1435, 129, 2, '0', 50.00, '2025-02-17 20:34:13', '2025-02-17 20:34:13'),
(1436, 129, 3, '0', 250.00, '2025-02-17 20:34:13', '2025-02-17 20:34:13'),
(1437, 129, 4, '0', 500.00, '2025-02-17 20:34:13', '2025-02-17 20:34:13'),
(1438, 129, 5, '0', 1000.00, '2025-02-17 20:34:13', '2025-02-17 20:34:13'),
(1439, 130, 1, '0', 10.00, '2025-02-17 22:23:32', '2025-02-17 22:23:32'),
(1440, 130, 2, '0', 50.00, '2025-02-17 22:23:32', '2025-02-17 22:23:32'),
(1441, 130, 3, '0', 250.00, '2025-02-17 22:23:32', '2025-02-17 22:23:32'),
(1442, 130, 4, '0', 500.00, '2025-02-17 22:23:32', '2025-02-17 22:23:32'),
(1443, 130, 5, '0', 1000.00, '2025-02-17 22:23:32', '2025-02-17 22:23:32'),
(1444, 131, 1, '0', 10.00, '2025-02-17 22:30:29', '2025-02-17 22:30:29'),
(1445, 131, 2, '0', 50.00, '2025-02-17 22:30:29', '2025-02-17 22:30:29'),
(1446, 131, 3, '0', 250.00, '2025-02-17 22:30:29', '2025-02-17 22:30:29'),
(1447, 131, 4, '0', 500.00, '2025-02-17 22:30:29', '2025-02-17 22:30:29'),
(1448, 131, 5, '0', 1000.00, '2025-02-17 22:30:29', '2025-02-17 22:30:29'),
(1449, 132, 1, '0', 10.00, '2025-02-18 06:52:36', '2025-02-18 06:52:36'),
(1450, 132, 2, '0', 50.00, '2025-02-18 06:52:36', '2025-02-18 06:52:36'),
(1451, 132, 3, '0', 250.00, '2025-02-18 06:52:36', '2025-02-18 06:52:36'),
(1452, 132, 4, '0', 500.00, '2025-02-18 06:52:36', '2025-02-18 06:52:36'),
(1453, 132, 5, '0', 1000.00, '2025-02-18 06:52:36', '2025-02-18 06:52:36'),
(1454, 133, 1, '0', 10.00, '2025-02-18 07:28:29', '2025-02-18 07:28:29'),
(1455, 133, 2, '0', 50.00, '2025-02-18 07:28:29', '2025-02-18 07:28:29');
INSERT INTO `mission_deposit_user` (`id`, `user_id`, `mission_deposit_id`, `status`, `wallet_bonus`, `created_at`, `updated_at`) VALUES
(1456, 133, 3, '0', 250.00, '2025-02-18 07:28:29', '2025-02-18 07:28:29'),
(1457, 133, 4, '0', 500.00, '2025-02-18 07:28:29', '2025-02-18 07:28:29'),
(1458, 133, 5, '0', 1000.00, '2025-02-18 07:28:29', '2025-02-18 07:28:29'),
(1459, 134, 1, '0', 10.00, '2025-02-18 10:17:14', '2025-02-18 10:17:14'),
(1460, 134, 2, '0', 50.00, '2025-02-18 10:17:14', '2025-02-18 10:17:14'),
(1461, 134, 3, '0', 250.00, '2025-02-18 10:17:14', '2025-02-18 10:17:14'),
(1462, 134, 4, '0', 500.00, '2025-02-18 10:17:14', '2025-02-18 10:17:14'),
(1463, 134, 5, '0', 1000.00, '2025-02-18 10:17:14', '2025-02-18 10:17:14'),
(1464, 135, 1, '0', 10.00, '2025-02-18 12:18:31', '2025-02-18 12:18:31'),
(1465, 135, 2, '0', 50.00, '2025-02-18 12:18:31', '2025-02-18 12:18:31'),
(1466, 135, 3, '0', 250.00, '2025-02-18 12:18:31', '2025-02-18 12:18:31'),
(1467, 135, 4, '0', 500.00, '2025-02-18 12:18:31', '2025-02-18 12:18:31'),
(1468, 135, 5, '0', 1000.00, '2025-02-18 12:18:31', '2025-02-18 12:18:31'),
(1469, 136, 1, '0', 10.00, '2025-02-18 17:56:16', '2025-02-18 17:56:16'),
(1470, 136, 2, '0', 50.00, '2025-02-18 17:56:16', '2025-02-18 17:56:16'),
(1471, 136, 3, '0', 250.00, '2025-02-18 17:56:16', '2025-02-18 17:56:16'),
(1472, 136, 4, '0', 500.00, '2025-02-18 17:56:16', '2025-02-18 17:56:16'),
(1473, 136, 5, '0', 1000.00, '2025-02-18 17:56:16', '2025-02-18 17:56:16'),
(1474, 137, 1, '0', 10.00, '2025-02-18 23:50:35', '2025-02-18 23:50:35'),
(1475, 137, 2, '0', 50.00, '2025-02-18 23:50:35', '2025-02-18 23:50:35'),
(1476, 137, 3, '0', 250.00, '2025-02-18 23:50:35', '2025-02-18 23:50:35'),
(1477, 137, 4, '0', 500.00, '2025-02-18 23:50:35', '2025-02-18 23:50:35'),
(1478, 137, 5, '0', 1000.00, '2025-02-18 23:50:35', '2025-02-18 23:50:35'),
(1479, 138, 1, '0', 10.00, '2025-02-20 17:56:09', '2025-02-20 17:56:09'),
(1480, 138, 2, '0', 50.00, '2025-02-20 17:56:09', '2025-02-20 17:56:09'),
(1481, 138, 3, '0', 250.00, '2025-02-20 17:56:10', '2025-02-20 17:56:10'),
(1482, 138, 4, '0', 500.00, '2025-02-20 17:56:10', '2025-02-20 17:56:10'),
(1483, 138, 5, '0', 1000.00, '2025-02-20 17:56:10', '2025-02-20 17:56:10'),
(1484, 139, 1, '0', 10.00, '2025-02-20 23:31:42', '2025-02-20 23:31:42'),
(1485, 139, 2, '0', 50.00, '2025-02-20 23:31:42', '2025-02-20 23:31:42'),
(1486, 139, 3, '0', 250.00, '2025-02-20 23:31:42', '2025-02-20 23:31:42'),
(1487, 139, 4, '0', 500.00, '2025-02-20 23:31:42', '2025-02-20 23:31:42'),
(1488, 139, 5, '0', 1000.00, '2025-02-20 23:31:42', '2025-02-20 23:31:42'),
(1489, 140, 1, '0', 10.00, '2025-03-09 18:39:06', '2025-03-09 18:39:06'),
(1490, 140, 2, '0', 50.00, '2025-03-09 18:39:06', '2025-03-09 18:39:06'),
(1491, 140, 3, '0', 250.00, '2025-03-09 18:39:06', '2025-03-09 18:39:06'),
(1492, 140, 4, '0', 500.00, '2025-03-09 18:39:06', '2025-03-09 18:39:06'),
(1493, 140, 5, '0', 1000.00, '2025-03-09 18:39:06', '2025-03-09 18:39:06'),
(1494, 141, 1, '0', 10.00, '2025-03-14 02:58:18', '2025-03-14 02:58:18'),
(1495, 141, 2, '0', 50.00, '2025-03-14 02:58:18', '2025-03-14 02:58:18'),
(1496, 141, 3, '0', 250.00, '2025-03-14 02:58:18', '2025-03-14 02:58:18'),
(1497, 141, 4, '0', 500.00, '2025-03-14 02:58:18', '2025-03-14 02:58:18'),
(1498, 141, 5, '0', 1000.00, '2025-03-14 02:58:18', '2025-03-14 02:58:18'),
(1499, 142, 1, '0', 10.00, '2025-03-14 21:50:26', '2025-03-14 21:50:26'),
(1500, 142, 2, '0', 50.00, '2025-03-14 21:50:26', '2025-03-14 21:50:26'),
(1501, 142, 3, '0', 250.00, '2025-03-14 21:50:26', '2025-03-14 21:50:26'),
(1502, 142, 4, '0', 500.00, '2025-03-14 21:50:26', '2025-03-14 21:50:26'),
(1503, 142, 5, '0', 1000.00, '2025-03-14 21:50:26', '2025-03-14 21:50:26'),
(1504, 143, 1, '0', 10.00, '2025-03-19 23:35:33', '2025-03-19 23:35:33'),
(1505, 143, 2, '0', 50.00, '2025-03-19 23:35:33', '2025-03-19 23:35:33'),
(1506, 143, 3, '0', 250.00, '2025-03-19 23:35:33', '2025-03-19 23:35:33'),
(1507, 143, 4, '0', 500.00, '2025-03-19 23:35:33', '2025-03-19 23:35:33'),
(1508, 143, 5, '0', 1000.00, '2025-03-19 23:35:33', '2025-03-19 23:35:33'),
(1509, 144, 1, '0', 10.00, '2025-03-20 17:47:40', '2025-03-20 17:47:40'),
(1510, 144, 2, '0', 50.00, '2025-03-20 17:47:40', '2025-03-20 17:47:40'),
(1511, 144, 3, '0', 250.00, '2025-03-20 17:47:40', '2025-03-20 17:47:40'),
(1512, 144, 4, '0', 500.00, '2025-03-20 17:47:40', '2025-03-20 17:47:40'),
(1513, 144, 5, '0', 1000.00, '2025-03-20 17:47:40', '2025-03-20 17:47:40'),
(1514, 145, 1, '0', 10.00, '2025-03-20 19:02:17', '2025-03-20 19:02:17'),
(1515, 145, 2, '0', 50.00, '2025-03-20 19:02:17', '2025-03-20 19:02:17'),
(1516, 145, 3, '0', 250.00, '2025-03-20 19:02:17', '2025-03-20 19:02:17'),
(1517, 145, 4, '0', 500.00, '2025-03-20 19:02:17', '2025-03-20 19:02:17'),
(1518, 145, 5, '0', 1000.00, '2025-03-20 19:02:17', '2025-03-20 19:02:17'),
(1519, 146, 1, '0', 10.00, '2025-03-20 22:58:51', '2025-03-20 22:58:51'),
(1520, 146, 2, '0', 50.00, '2025-03-20 22:58:51', '2025-03-20 22:58:51'),
(1521, 146, 3, '0', 250.00, '2025-03-20 22:58:51', '2025-03-20 22:58:51'),
(1522, 146, 4, '0', 500.00, '2025-03-20 22:58:51', '2025-03-20 22:58:51'),
(1523, 146, 5, '0', 1000.00, '2025-03-20 22:58:51', '2025-03-20 22:58:51'),
(1524, 147, 1, '0', 10.00, '2025-03-21 00:10:18', '2025-03-21 00:10:18'),
(1525, 147, 2, '0', 50.00, '2025-03-21 00:10:18', '2025-03-21 00:10:18'),
(1526, 147, 3, '0', 250.00, '2025-03-21 00:10:18', '2025-03-21 00:10:18'),
(1527, 147, 4, '0', 500.00, '2025-03-21 00:10:18', '2025-03-21 00:10:18'),
(1528, 147, 5, '0', 1000.00, '2025-03-21 00:10:18', '2025-03-21 00:10:18'),
(1529, 148, 1, '0', 10.00, '2025-03-21 17:35:08', '2025-03-21 17:35:08'),
(1530, 148, 2, '0', 50.00, '2025-03-21 17:35:08', '2025-03-21 17:35:08'),
(1531, 148, 3, '0', 250.00, '2025-03-21 17:35:08', '2025-03-21 17:35:08'),
(1532, 148, 4, '0', 500.00, '2025-03-21 17:35:08', '2025-03-21 17:35:08'),
(1533, 148, 5, '0', 1000.00, '2025-03-21 17:35:08', '2025-03-21 17:35:08'),
(1534, 149, 1, '0', 10.00, '2025-03-21 19:29:27', '2025-03-21 19:29:27'),
(1535, 149, 2, '0', 50.00, '2025-03-21 19:29:27', '2025-03-21 19:29:27'),
(1536, 149, 3, '0', 250.00, '2025-03-21 19:29:27', '2025-03-21 19:29:27'),
(1537, 149, 4, '0', 500.00, '2025-03-21 19:29:27', '2025-03-21 19:29:27'),
(1538, 149, 5, '0', 1000.00, '2025-03-21 19:29:27', '2025-03-21 19:29:27'),
(1539, 150, 1, '0', 10.00, '2025-03-22 00:27:18', '2025-03-22 00:27:18'),
(1540, 150, 2, '0', 50.00, '2025-03-22 00:27:18', '2025-03-22 00:27:18'),
(1541, 150, 3, '0', 250.00, '2025-03-22 00:27:18', '2025-03-22 00:27:18'),
(1542, 150, 4, '0', 500.00, '2025-03-22 00:27:18', '2025-03-22 00:27:18'),
(1543, 150, 5, '0', 1000.00, '2025-03-22 00:27:18', '2025-03-22 00:27:18'),
(1544, 151, 1, '0', 10.00, '2025-03-22 10:35:45', '2025-03-22 10:35:45'),
(1545, 151, 2, '0', 50.00, '2025-03-22 10:35:45', '2025-03-22 10:35:45'),
(1546, 151, 3, '0', 250.00, '2025-03-22 10:35:45', '2025-03-22 10:35:45'),
(1547, 151, 4, '0', 500.00, '2025-03-22 10:35:45', '2025-03-22 10:35:45'),
(1548, 151, 5, '0', 1000.00, '2025-03-22 10:35:45', '2025-03-22 10:35:45'),
(1549, 152, 1, '0', 10.00, '2025-03-22 14:58:54', '2025-03-22 14:58:54'),
(1550, 152, 2, '0', 50.00, '2025-03-22 14:58:54', '2025-03-22 14:58:54'),
(1551, 152, 3, '0', 250.00, '2025-03-22 14:58:54', '2025-03-22 14:58:54'),
(1552, 152, 4, '0', 500.00, '2025-03-22 14:58:54', '2025-03-22 14:58:54'),
(1553, 152, 5, '0', 1000.00, '2025-03-22 14:58:54', '2025-03-22 14:58:54'),
(1554, 153, 1, '0', 10.00, '2025-03-23 22:00:41', '2025-03-23 22:00:41'),
(1555, 153, 2, '0', 50.00, '2025-03-23 22:00:41', '2025-03-23 22:00:41'),
(1556, 153, 3, '0', 250.00, '2025-03-23 22:00:41', '2025-03-23 22:00:41'),
(1557, 153, 4, '0', 500.00, '2025-03-23 22:00:41', '2025-03-23 22:00:41'),
(1558, 153, 5, '0', 1000.00, '2025-03-23 22:00:41', '2025-03-23 22:00:41'),
(1559, 154, 1, '0', 10.00, '2025-03-24 15:07:56', '2025-03-24 15:07:56'),
(1560, 154, 2, '0', 50.00, '2025-03-24 15:07:56', '2025-03-24 15:07:56'),
(1561, 154, 3, '0', 250.00, '2025-03-24 15:07:56', '2025-03-24 15:07:56'),
(1562, 154, 4, '0', 500.00, '2025-03-24 15:07:56', '2025-03-24 15:07:56'),
(1563, 154, 5, '0', 1000.00, '2025-03-24 15:07:56', '2025-03-24 15:07:56'),
(1564, 155, 1, '0', 10.00, '2025-03-25 02:10:58', '2025-03-25 02:10:58'),
(1565, 155, 2, '0', 50.00, '2025-03-25 02:10:58', '2025-03-25 02:10:58'),
(1566, 155, 3, '0', 250.00, '2025-03-25 02:10:58', '2025-03-25 02:10:58'),
(1567, 155, 4, '0', 500.00, '2025-03-25 02:10:58', '2025-03-25 02:10:58'),
(1568, 155, 5, '0', 1000.00, '2025-03-25 02:10:58', '2025-03-25 02:10:58'),
(1569, 156, 1, '0', 10.00, '2025-03-27 22:07:32', '2025-03-27 22:07:32'),
(1570, 156, 2, '0', 50.00, '2025-03-27 22:07:32', '2025-03-27 22:07:32'),
(1571, 156, 3, '0', 250.00, '2025-03-27 22:07:32', '2025-03-27 22:07:32'),
(1572, 156, 4, '0', 500.00, '2025-03-27 22:07:32', '2025-03-27 22:07:32'),
(1573, 156, 5, '0', 1000.00, '2025-03-27 22:07:32', '2025-03-27 22:07:32'),
(1574, 157, 1, '0', 10.00, '2025-03-29 19:41:11', '2025-03-29 19:41:11'),
(1575, 157, 2, '0', 50.00, '2025-03-29 19:41:11', '2025-03-29 19:41:11'),
(1576, 157, 3, '0', 250.00, '2025-03-29 19:41:11', '2025-03-29 19:41:11'),
(1577, 157, 4, '0', 500.00, '2025-03-29 19:41:11', '2025-03-29 19:41:11'),
(1578, 157, 5, '0', 1000.00, '2025-03-29 19:41:11', '2025-03-29 19:41:11'),
(1579, 158, 1, '0', 10.00, '2025-03-30 02:04:33', '2025-03-30 02:04:33'),
(1580, 158, 2, '0', 50.00, '2025-03-30 02:04:33', '2025-03-30 02:04:33'),
(1581, 158, 3, '0', 250.00, '2025-03-30 02:04:33', '2025-03-30 02:04:33'),
(1582, 158, 4, '0', 500.00, '2025-03-30 02:04:33', '2025-03-30 02:04:33'),
(1583, 158, 5, '0', 1000.00, '2025-03-30 02:04:33', '2025-03-30 02:04:33'),
(1584, 159, 1, '0', 10.00, '2025-04-01 16:48:15', '2025-04-01 16:48:15'),
(1585, 159, 2, '0', 50.00, '2025-04-01 16:48:15', '2025-04-01 16:48:15'),
(1586, 159, 3, '0', 250.00, '2025-04-01 16:48:15', '2025-04-01 16:48:15'),
(1587, 159, 4, '0', 500.00, '2025-04-01 16:48:15', '2025-04-01 16:48:15'),
(1588, 159, 5, '0', 1000.00, '2025-04-01 16:48:15', '2025-04-01 16:48:15'),
(1589, 160, 1, '0', 10.00, '2025-04-03 14:28:18', '2025-04-03 14:28:18'),
(1590, 160, 2, '0', 50.00, '2025-04-03 14:28:18', '2025-04-03 14:28:18'),
(1591, 160, 3, '0', 250.00, '2025-04-03 14:28:18', '2025-04-03 14:28:18'),
(1592, 160, 4, '0', 500.00, '2025-04-03 14:28:18', '2025-04-03 14:28:18'),
(1593, 160, 5, '0', 1000.00, '2025-04-03 14:28:18', '2025-04-03 14:28:18'),
(1594, 161, 1, '0', 10.00, '2025-04-06 14:26:19', '2025-04-06 14:26:19'),
(1595, 161, 2, '0', 50.00, '2025-04-06 14:26:19', '2025-04-06 14:26:19'),
(1596, 161, 3, '0', 250.00, '2025-04-06 14:26:19', '2025-04-06 14:26:19'),
(1597, 161, 4, '0', 500.00, '2025-04-06 14:26:19', '2025-04-06 14:26:19'),
(1598, 161, 5, '0', 1000.00, '2025-04-06 14:26:19', '2025-04-06 14:26:19'),
(1599, 162, 1, '0', 10.00, '2025-04-06 14:39:54', '2025-04-06 14:39:54'),
(1600, 162, 2, '0', 50.00, '2025-04-06 14:39:54', '2025-04-06 14:39:54'),
(1601, 162, 3, '0', 250.00, '2025-04-06 14:39:54', '2025-04-06 14:39:54'),
(1602, 162, 4, '0', 500.00, '2025-04-06 14:39:54', '2025-04-06 14:39:54'),
(1603, 162, 5, '0', 1000.00, '2025-04-06 14:39:54', '2025-04-06 14:39:54'),
(1604, 163, 1, '0', 10.00, '2025-04-06 14:49:39', '2025-04-06 14:49:39'),
(1605, 163, 2, '0', 50.00, '2025-04-06 14:49:39', '2025-04-06 14:49:39'),
(1606, 163, 3, '0', 250.00, '2025-04-06 14:49:39', '2025-04-06 14:49:39'),
(1607, 163, 4, '0', 500.00, '2025-04-06 14:49:39', '2025-04-06 14:49:39'),
(1608, 163, 5, '0', 1000.00, '2025-04-06 14:49:39', '2025-04-06 14:49:39'),
(1609, 164, 1, '0', 10.00, '2025-04-07 12:03:05', '2025-04-07 12:03:05'),
(1610, 164, 2, '0', 50.00, '2025-04-07 12:03:05', '2025-04-07 12:03:05'),
(1611, 164, 3, '0', 250.00, '2025-04-07 12:03:05', '2025-04-07 12:03:05'),
(1612, 164, 4, '0', 500.00, '2025-04-07 12:03:05', '2025-04-07 12:03:05'),
(1613, 164, 5, '0', 1000.00, '2025-04-07 12:03:05', '2025-04-07 12:03:05'),
(1614, 165, 1, '0', 10.00, '2025-04-10 00:11:12', '2025-04-10 00:11:12'),
(1615, 165, 2, '0', 50.00, '2025-04-10 00:11:12', '2025-04-10 00:11:12'),
(1616, 165, 3, '0', 250.00, '2025-04-10 00:11:12', '2025-04-10 00:11:12'),
(1617, 165, 4, '0', 500.00, '2025-04-10 00:11:12', '2025-04-10 00:11:12'),
(1618, 165, 5, '0', 1000.00, '2025-04-10 00:11:12', '2025-04-10 00:11:12'),
(1619, 166, 1, '0', 10.00, '2025-04-10 11:34:38', '2025-04-10 11:34:38'),
(1620, 166, 2, '0', 50.00, '2025-04-10 11:34:38', '2025-04-10 11:34:38'),
(1621, 166, 3, '0', 250.00, '2025-04-10 11:34:38', '2025-04-10 11:34:38'),
(1622, 166, 4, '0', 500.00, '2025-04-10 11:34:38', '2025-04-10 11:34:38'),
(1623, 166, 5, '0', 1000.00, '2025-04-10 11:34:38', '2025-04-10 11:34:38'),
(1624, 167, 1, '0', 10.00, '2025-04-14 14:26:32', '2025-04-14 14:26:32'),
(1625, 167, 2, '0', 50.00, '2025-04-14 14:26:32', '2025-04-14 14:26:32'),
(1626, 167, 3, '0', 250.00, '2025-04-14 14:26:32', '2025-04-14 14:26:32'),
(1627, 167, 4, '0', 500.00, '2025-04-14 14:26:32', '2025-04-14 14:26:32'),
(1628, 167, 5, '0', 1000.00, '2025-04-14 14:26:32', '2025-04-14 14:26:32'),
(1629, 168, 1, '0', 10.00, '2025-04-14 18:06:18', '2025-04-14 18:06:18'),
(1630, 168, 2, '0', 50.00, '2025-04-14 18:06:18', '2025-04-14 18:06:18'),
(1631, 168, 3, '0', 250.00, '2025-04-14 18:06:18', '2025-04-14 18:06:18'),
(1632, 168, 4, '0', 500.00, '2025-04-14 18:06:18', '2025-04-14 18:06:18'),
(1633, 168, 5, '0', 1000.00, '2025-04-14 18:06:18', '2025-04-14 18:06:18'),
(1634, 169, 1, '0', 10.00, '2025-04-16 10:54:12', '2025-04-16 10:54:12'),
(1635, 169, 2, '0', 50.00, '2025-04-16 10:54:12', '2025-04-16 10:54:12'),
(1636, 169, 3, '0', 250.00, '2025-04-16 10:54:12', '2025-04-16 10:54:12'),
(1637, 169, 4, '0', 500.00, '2025-04-16 10:54:12', '2025-04-16 10:54:12'),
(1638, 169, 5, '0', 1000.00, '2025-04-16 10:54:12', '2025-04-16 10:54:12');

-- --------------------------------------------------------

--
-- Estrutura para tabela `mission_users`
--

CREATE TABLE `mission_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `mission_id` int(10) UNSIGNED NOT NULL,
  `rounds` bigint(20) DEFAULT '0',
  `rewards` decimal(10,2) DEFAULT '0.00',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `wallet_mission` decimal(10,2) NOT NULL DEFAULT '0.00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Estrutura para tabela `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estrutura para tabela `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

--
-- Despejando dados para a tabela `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 170),
(2, 'App\\Models\\User', 171),
(2, 'App\\Models\\User', 172),
(2, 'App\\Models\\User', 173),
(2, 'App\\Models\\User', 174),
(2, 'App\\Models\\User', 175),
(2, 'App\\Models\\User', 176),
(2, 'App\\Models\\User', 177),
(2, 'App\\Models\\User', 178),
(2, 'App\\Models\\User', 179),
(2, 'App\\Models\\User', 180),
(2, 'App\\Models\\User', 181),
(2, 'App\\Models\\User', 182),
(2, 'App\\Models\\User', 183),
(2, 'App\\Models\\User', 184),
(2, 'App\\Models\\User', 185),
(2, 'App\\Models\\User', 186),
(2, 'App\\Models\\User', 187),
(2, 'App\\Models\\User', 17484566),
(2, 'App\\Models\\User', 17484567),
(2, 'App\\Models\\User', 17484568),
(2, 'App\\Models\\User', 17484569),
(2, 'App\\Models\\User', 17484570),
(2, 'App\\Models\\User', 17484571),
(2, 'App\\Models\\User', 17484572),
(2, 'App\\Models\\User', 17484573),
(2, 'App\\Models\\User', 17484574),
(2, 'App\\Models\\User', 17484575),
(2, 'App\\Models\\User', 17484576),
(2, 'App\\Models\\User', 17484577),
(2, 'App\\Models\\User', 17484578),
(2, 'App\\Models\\User', 17484579),
(2, 'App\\Models\\User', 17484580),
(2, 'App\\Models\\User', 17484581),
(2, 'App\\Models\\User', 17484582),
(2, 'App\\Models\\User', 17484583),
(2, 'App\\Models\\User', 17484584),
(2, 'App\\Models\\User', 17484585),
(2, 'App\\Models\\User', 17484586),
(2, 'App\\Models\\User', 17484587),
(2, 'App\\Models\\User', 17484588),
(2, 'App\\Models\\User', 17484589),
(2, 'App\\Models\\User', 17484590),
(2, 'App\\Models\\User', 17484591),
(2, 'App\\Models\\User', 17484592),
(2, 'App\\Models\\User', 17484593),
(2, 'App\\Models\\User', 17484594),
(2, 'App\\Models\\User', 17484595),
(2, 'App\\Models\\User', 17484596),
(2, 'App\\Models\\User', 17484597),
(2, 'App\\Models\\User', 17484598),
(2, 'App\\Models\\User', 17484599),
(2, 'App\\Models\\User', 17484600),
(2, 'App\\Models\\User', 17484601),
(2, 'App\\Models\\User', 17484602),
(2, 'App\\Models\\User', 17484603),
(2, 'App\\Models\\User', 17484604),
(2, 'App\\Models\\User', 17484605),
(2, 'App\\Models\\User', 17484606),
(2, 'App\\Models\\User', 17484607),
(2, 'App\\Models\\User', 17484608),
(2, 'App\\Models\\User', 17484609),
(2, 'App\\Models\\User', 17484611),
(2, 'App\\Models\\User', 17484612),
(2, 'App\\Models\\User', 17484613),
(2, 'App\\Models\\User', 17484614),
(2, 'App\\Models\\User', 17484615),
(2, 'App\\Models\\User', 17484616),
(2, 'App\\Models\\User', 17484617),
(2, 'App\\Models\\User', 17484618),
(2, 'App\\Models\\User', 17484619),
(2, 'App\\Models\\User', 17484620),
(2, 'App\\Models\\User', 17484621),
(2, 'App\\Models\\User', 17484622),
(2, 'App\\Models\\User', 17484623),
(2, 'App\\Models\\User', 17484624),
(2, 'App\\Models\\User', 17484625),
(2, 'App\\Models\\User', 17484626),
(2, 'App\\Models\\User', 17484627),
(2, 'App\\Models\\User', 17484628),
(2, 'App\\Models\\User', 17484629),
(2, 'App\\Models\\User', 17484630),
(2, 'App\\Models\\User', 17484631),
(2, 'App\\Models\\User', 17484632),
(2, 'App\\Models\\User', 17484633),
(2, 'App\\Models\\User', 17484634),
(2, 'App\\Models\\User', 17484635),
(2, 'App\\Models\\User', 17484636),
(2, 'App\\Models\\User', 17484637),
(2, 'App\\Models\\User', 17484638),
(2, 'App\\Models\\User', 17484639),
(2, 'App\\Models\\User', 17484645),
(2, 'App\\Models\\User', 17484646),
(2, 'App\\Models\\User', 17484647),
(2, 'App\\Models\\User', 17484648),
(2, 'App\\Models\\User', 17484653),
(2, 'App\\Models\\User', 17484654),
(2, 'App\\Models\\User', 17484656),
(2, 'App\\Models\\User', 17484657),
(2, 'App\\Models\\User', 17484658),
(2, 'App\\Models\\User', 17484659),
(2, 'App\\Models\\User', 17484660),
(2, 'App\\Models\\User', 17484661),
(2, 'App\\Models\\User', 17484662),
(2, 'App\\Models\\User', 17484663),
(2, 'App\\Models\\User', 17484664),
(2, 'App\\Models\\User', 17484665),
(2, 'App\\Models\\User', 17484666),
(2, 'App\\Models\\User', 17484667),
(2, 'App\\Models\\User', 17484668),
(2, 'App\\Models\\User', 17484669),
(2, 'App\\Models\\User', 17484670),
(2, 'App\\Models\\User', 17484671),
(2, 'App\\Models\\User', 17484672),
(2, 'App\\Models\\User', 17484673),
(2, 'App\\Models\\User', 17484674),
(2, 'App\\Models\\User', 17484675),
(2, 'App\\Models\\User', 17484676),
(2, 'App\\Models\\User', 17484677),
(2, 'App\\Models\\User', 17484678),
(2, 'App\\Models\\User', 17484679),
(2, 'App\\Models\\User', 17484680),
(2, 'App\\Models\\User', 17484681),
(2, 'App\\Models\\User', 17484682),
(2, 'App\\Models\\User', 17484683),
(2, 'App\\Models\\User', 17484684),
(2, 'App\\Models\\User', 17484685),
(2, 'App\\Models\\User', 17484686),
(2, 'App\\Models\\User', 17484687),
(2, 'App\\Models\\User', 17484688),
(2, 'App\\Models\\User', 17484689),
(2, 'App\\Models\\User', 17484690),
(2, 'App\\Models\\User', 17484691),
(2, 'App\\Models\\User', 17484692),
(2, 'App\\Models\\User', 17484693),
(2, 'App\\Models\\User', 17484694),
(2, 'App\\Models\\User', 17484695),
(2, 'App\\Models\\User', 17484696),
(2, 'App\\Models\\User', 17484697),
(2, 'App\\Models\\User', 17484698),
(2, 'App\\Models\\User', 17484699),
(2, 'App\\Models\\User', 17484700),
(2, 'App\\Models\\User', 17484701),
(2, 'App\\Models\\User', 17484702),
(2, 'App\\Models\\User', 17484703),
(2, 'App\\Models\\User', 17484704),
(2, 'App\\Models\\User', 17484705),
(2, 'App\\Models\\User', 17484706),
(2, 'App\\Models\\User', 17484707),
(2, 'App\\Models\\User', 17484708),
(2, 'App\\Models\\User', 17484709),
(2, 'App\\Models\\User', 17484710),
(2, 'App\\Models\\User', 17484711),
(2, 'App\\Models\\User', 17484712),
(2, 'App\\Models\\User', 17484713),
(2, 'App\\Models\\User', 17484714),
(2, 'App\\Models\\User', 17484715),
(2, 'App\\Models\\User', 17484716),
(2, 'App\\Models\\User', 17484717),
(2, 'App\\Models\\User', 17484718),
(2, 'App\\Models\\User', 17484719),
(2, 'App\\Models\\User', 17484720),
(2, 'App\\Models\\User', 17484721),
(2, 'App\\Models\\User', 17484722),
(2, 'App\\Models\\User', 17484723),
(2, 'App\\Models\\User', 17484724),
(2, 'App\\Models\\User', 17484725),
(2, 'App\\Models\\User', 17484726),
(2, 'App\\Models\\User', 17484727),
(2, 'App\\Models\\User', 17484728),
(2, 'App\\Models\\User', 17484729),
(2, 'App\\Models\\User', 17484730),
(2, 'App\\Models\\User', 17484731),
(2, 'App\\Models\\User', 17484732),
(2, 'App\\Models\\User', 17484733),
(2, 'App\\Models\\User', 17484734),
(2, 'App\\Models\\User', 17484735);

-- --------------------------------------------------------

--
-- Estrutura para tabela `music`
--

CREATE TABLE `music` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `music`
--

INSERT INTO `music` (`id`, `name`, `path`, `created_at`, `updated_at`) VALUES
(3, 'Yesterday', 'music/01J4E2WSHNF1TQMZG55XZKWDMG.mp3', '2024-08-04 06:58:08', '2024-08-04 06:58:08'),
(4, 'See You Again', 'music/01J4E2X8PZBBV30W782F1P7518.mp3', '2024-08-04 06:58:24', '2024-08-04 06:58:24'),
(5, 'Without You', 'music/01J4E2XRSTXVYT4ZXV7Z0AX12W.mp3', '2024-08-04 06:58:40', '2024-08-04 06:58:40'),
(6, 'Will Smith 9. Live It Up', 'music/01J4E2YZYVG89TZZN56XKEYJ9P.mp3', '2024-08-04 06:59:20', '2024-08-04 06:59:20'),
(7, 'Waiting For Love', 'music/01J4E300WNHP4S2CGTY6CTTBJS.mp3', '2024-08-04 06:59:54', '2024-08-04 06:59:54'),
(8, 'Wait Wait Wait', 'music/01J4E30FP0QWCKJRVX8HXZJXS5.mp3', '2024-08-04 07:00:09', '2024-08-04 07:00:09');

-- --------------------------------------------------------

--
-- Estrutura para tabela `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(191) NOT NULL,
  `notifiable_type` varchar(191) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `session_id` varchar(191) DEFAULT NULL,
  `transaction_id` varchar(191) DEFAULT NULL,
  `game` varchar(191) NOT NULL,
  `game_uuid` varchar(191) NOT NULL,
  `type` varchar(50) NOT NULL,
  `type_money` varchar(50) NOT NULL,
  `amount` decimal(20,2) NOT NULL DEFAULT '0.00',
  `providers` varchar(191) NOT NULL,
  `refunded` tinyint(4) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `round_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `hash` varchar(191) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `session_id`, `transaction_id`, `game`, `game_uuid`, `type`, `type_money`, `amount`, `providers`, `refunded`, `status`, `round_id`, `created_at`, `updated_at`, `hash`) VALUES
(1, 1, '1f0431e3-2422-6342-a5fa-ee2d912f905d', '1f0431e3-2422-6694-82e6-ee2d912f905d', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance', 0.10, 'play_fiver', 0, 1, '1f0431e3-2422-6342-a5fa-ee2d912f905d', '2025-06-06 18:35:42', '2025-06-06 18:35:42', ''),
(2, 1, '1f0431e3-48d2-6b24-af73-ee2d912f905d', '1f0431e3-48d2-6f70-8f92-ee2d912f905d', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance', 0.10, 'play_fiver', 0, 1, '1f0431e3-48d2-6b24-af73-ee2d912f905d', '2025-06-06 18:35:46', '2025-06-06 18:35:46', ''),
(3, 1, '68435f40d1e4b', '1f0431e3-d839-6088-8dd9-e6b8437e66fc', '126', '126', 'bet', 'balance', 3.60, 'play_fiver', 0, 1, '68435f40d1e4b', '2025-06-06 18:36:01', '2025-06-06 18:36:01', ''),
(4, 1, '68435f432df09', '1f0431e3-ee6d-6a8e-ae16-4e9bf73392c0', '126', '126', 'bet', 'balance', 3.60, 'play_fiver', 0, 1, '68435f432df09', '2025-06-06 18:36:03', '2025-06-06 18:36:03', ''),
(5, 1, '68435f4668354', '1f0431e4-0d50-6906-91bb-dae18f2aa637', '126', '126', 'bet', 'balance', 3.60, 'play_fiver', 0, 1, '68435f4668354', '2025-06-06 18:36:06', '2025-06-06 18:36:06', ''),
(6, 1, '68435f4959cf8', '1f0431e4-295c-6ce4-a847-e6b8437e66fc', '126', '126', 'win', 'balance', 2.16, 'play_fiver', 0, 1, '68435f4959cf8', '2025-06-06 18:36:09', '2025-06-06 18:36:09', ''),
(7, 1, '68435f4c7230d', '1f0431e4-46ec-6dae-8f68-22b87edd58a7', '126', '126', 'bet', 'balance', 3.60, 'play_fiver', 0, 1, '68435f4c7230d', '2025-06-06 18:36:12', '2025-06-06 18:36:12', ''),
(8, 1, '68435f4fa4747', '1f0431e4-657f-6b0e-998b-f6e433fede60', '126', '126', 'bet', 'balance', 3.60, 'play_fiver', 0, 1, '68435f4fa4747', '2025-06-06 18:36:16', '2025-06-06 18:36:16', ''),
(9, 1, '68435f5527bad', '1f0431e4-99d8-6e00-9ac2-e2703d31f0fd', '126', '126', 'win', 'balance', 0.72, 'play_fiver', 0, 1, '68435f5527bad', '2025-06-06 18:36:21', '2025-06-06 18:36:21', ''),
(10, 1, '68435f5899d2f', '1f0431e4-baea-609e-9516-d63c6a6136a5', '126', '126', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, '68435f5899d2f', '2025-06-06 18:36:24', '2025-06-06 18:36:24', ''),
(11, 1, '68435f5b975c4', '1f0431e4-d76d-69f0-9d8f-e2bf4074ce98', '126', '126', 'win', 'balance', 2.40, 'play_fiver', 0, 1, '68435f5b975c4', '2025-06-06 18:36:27', '2025-06-06 18:36:27', ''),
(12, 1, '68435f616d30b', '1f0431e5-0f00-65a2-a2b3-6681e3332357', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '68435f616d30b', '2025-06-06 18:36:33', '2025-06-06 18:36:33', ''),
(13, 1, '68435f649527c', '1f0431e5-2d2c-63a0-9719-22b87edd58a7', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '68435f649527c', '2025-06-06 18:36:36', '2025-06-06 18:36:36', ''),
(14, 1, '68435f6889992', '1f0431e5-52de-64ea-a60f-228cbd8d484a', '126', '126', 'win', 'balance', 0.24, 'play_fiver', 0, 1, '68435f6889992', '2025-06-06 18:36:41', '2025-06-06 18:36:41', ''),
(15, 1, '68435f6c63623', '1f0431e5-7785-6c26-a5d3-da124b9c4409', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '68435f6c63623', '2025-06-06 18:36:44', '2025-06-06 18:36:44', ''),
(16, 1, '68435f6f15893', '1f0431e5-9117-681a-aeb2-f6e433fede60', '126', '126', 'win', 'balance', 0.64, 'play_fiver', 0, 1, '68435f6f15893', '2025-06-06 18:36:47', '2025-06-06 18:36:47', ''),
(17, 1, '68435f72e90d3', '1f0431e5-b5f6-6e06-aa61-b2e836c049f4', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '68435f72e90d3', '2025-06-06 18:36:51', '2025-06-06 18:36:51', ''),
(18, 1, '68435f7529781', '1f0431e5-cb17-645c-a810-5ae6411d63a6', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '68435f7529781', '2025-06-06 18:36:53', '2025-06-06 18:36:53', ''),
(19, 1, '68435f77eb7f5', '1f0431e5-e5be-65da-9bd9-1efb86efc924', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '68435f77eb7f5', '2025-06-06 18:36:56', '2025-06-06 18:36:56', ''),
(20, 1, '68435f7911b08', '1f0431e5-f04f-618e-8ba5-3aaa00e494f3', '126', '126', 'win', 'balance', 0.24, 'play_fiver', 0, 1, '68435f7911b08', '2025-06-06 18:36:57', '2025-06-06 18:36:57', ''),
(21, 1, '68435f7a63bfe', '1f0431e5-fd0d-61c8-8fb2-765f180db08a', '126', '126', 'win', 'balance', 0.64, 'play_fiver', 0, 1, '68435f7a63bfe', '2025-06-06 18:36:58', '2025-06-06 18:36:58', ''),
(22, 1, '68435f7d25282', '1f0431e6-1737-665c-9603-f6e433fede60', '126', '126', 'win', 'balance', 0.64, 'play_fiver', 0, 1, '68435f7d25282', '2025-06-06 18:37:01', '2025-06-06 18:37:01', ''),
(23, 1, '68435f7f84486', '1f0431e6-2e01-677a-9389-dae18f2aa637', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '68435f7f84486', '2025-06-06 18:37:03', '2025-06-06 18:37:03', ''),
(24, 1, '68435f8052fb6', '1f0431e6-359d-6dee-8def-1e7571edf72f', '126', '126', 'win', 'balance', 0.40, 'play_fiver', 0, 1, '68435f8052fb6', '2025-06-06 18:37:04', '2025-06-06 18:37:04', ''),
(25, 1, '68435f82413ed', '1f0431e6-47ff-650a-9cc2-e2bf4074ce98', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '68435f82413ed', '2025-06-06 18:37:06', '2025-06-06 18:37:06', ''),
(26, 1, '68435f8376ebb', '1f0431e6-53a1-6778-b520-328aa15d337c', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '68435f8376ebb', '2025-06-06 18:37:07', '2025-06-06 18:37:07', ''),
(27, 1, '68435f8441167', '1f0431e6-5b10-68c4-86ab-aac61d1e2e1e', '126', '126', 'win', 'balance', 0.24, 'play_fiver', 0, 1, '68435f8441167', '2025-06-06 18:37:08', '2025-06-06 18:37:08', ''),
(28, 1, '68435f85c9111', '1f0431e6-69e9-6c06-8779-4e9bf73392c0', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '68435f85c9111', '2025-06-06 18:37:11', '2025-06-06 18:37:11', ''),
(29, 1, '68435f8791c77', '1f0431e6-7ad3-6b02-8e34-d63c6a6136a5', '126', '126', 'win', 'balance', 0.24, 'play_fiver', 0, 1, '68435f8791c77', '2025-06-06 18:37:11', '2025-06-06 18:37:11', ''),
(30, 1, '68435f89b489f', '1f0431e6-8f42-6188-8795-5a0fc5bf20dd', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '68435f89b489f', '2025-06-06 18:37:13', '2025-06-06 18:37:13', ''),
(31, 1, '68435f8a82096', '1f0431e6-96d2-6790-9189-1e6973c023fd', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '68435f8a82096', '2025-06-06 18:37:14', '2025-06-06 18:37:14', ''),
(32, 1, '68435f8be81da', '1f0431e6-a458-6ac2-8e51-aac61d1e2e1e', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '68435f8be81da', '2025-06-06 18:37:16', '2025-06-06 18:37:16', ''),
(33, 1, '68435f8cd2b2c', '1f0431e6-ad0b-6e62-96c1-4e9bf73392c0', '126', '126', 'win', 'balance', 0.24, 'play_fiver', 0, 1, '68435f8cd2b2c', '2025-06-06 18:37:17', '2025-06-06 18:37:17', ''),
(34, 1, '68435f8f0f00f', '1f0431e6-c203-62e8-83ab-667b4ff0f25a', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '68435f8f0f00f', '2025-06-06 18:37:19', '2025-06-06 18:37:19', ''),
(35, 1, '68435f92d4f1e', '1f0431e6-e65a-6ce0-8a0b-e2a9163e5c4b', '126', '126', 'win', 'balance', 1.04, 'play_fiver', 0, 1, '68435f92d4f1e', '2025-06-06 18:37:23', '2025-06-06 18:37:23', ''),
(36, 1, '68435f950d736', '1f0431e6-fb2c-61c8-a963-5ae6411d63a6', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '68435f950d736', '2025-06-06 18:37:25', '2025-06-06 18:37:25', ''),
(37, 1, '68435f95f20f9', '1f0431e7-041a-62f8-8526-22b87edd58a7', '126', '126', 'win', 'balance', 0.24, 'play_fiver', 0, 1, '68435f95f20f9', '2025-06-06 18:37:26', '2025-06-06 18:37:26', ''),
(38, 1, '68435f97ea0b8', '1f0431e7-16dc-6d78-b17c-1e6973c023fd', '126', '126', 'win', 'balance', 0.24, 'play_fiver', 0, 1, '68435f97ea0b8', '2025-06-06 18:37:28', '2025-06-06 18:37:28', ''),
(39, 1, '68435f99ae538', '1f0431e7-279a-676e-9e87-f6e433fede60', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '68435f99ae538', '2025-06-06 18:37:30', '2025-06-06 18:37:30', ''),
(40, 1, '68435f9b5ad6d', '1f0431e7-376a-6676-b828-b2e836c049f4', '126', '126', 'win', 'balance', 0.40, 'play_fiver', 0, 1, '68435f9b5ad6d', '2025-06-06 18:37:31', '2025-06-06 18:37:31', ''),
(41, 1, '68435f9d3b1e0', '1f0431e7-4940-603a-a7e3-e2bf4074ce98', '126', '126', 'win', 'balance', 2.00, 'play_fiver', 0, 1, '68435f9d3b1e0', '2025-06-06 18:37:33', '2025-06-06 18:37:33', ''),
(42, 1, '68435fa1b91a5', '1f0431e7-7451-67a6-ac66-e2bf4074ce98', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '68435fa1b91a5', '2025-06-06 18:37:38', '2025-06-06 18:37:38', ''),
(43, 1, '68435fa31d459', '1f0431e7-814d-6fae-89a8-1e7571edf72f', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '68435fa31d459', '2025-06-06 18:37:39', '2025-06-06 18:37:39', ''),
(44, 1, '68435fa3ea3b0', '1f0431e7-894f-6928-b6be-4ecf18e5b6d3', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '68435fa3ea3b0', '2025-06-06 18:37:41', '2025-06-06 18:37:41', ''),
(45, 1, '684c453c404fc', '1f0486c0-5fd3-68aa-ab44-6edee4b2bab3', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '684c453c404fc', '2025-06-13 12:35:24', '2025-06-13 12:35:24', ''),
(46, 1, '684c453ee0370', '1f0486c0-7925-6614-a5a6-1edb7b144137', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '684c453ee0370', '2025-06-13 12:35:27', '2025-06-13 12:35:27', ''),
(47, 1, '684c454139cd1', '1f0486c0-8f41-6772-a60f-5ed0cbf952d3', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '684c454139cd1', '2025-06-13 12:35:29', '2025-06-13 12:35:29', ''),
(48, 1, '684c4543e6cee', '1f0486c0-a916-659e-a6f5-025ff25f5c27', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '684c4543e6cee', '2025-06-13 12:35:32', '2025-06-13 12:35:32', ''),
(49, 1, '684c4544c7b20', '1f0486c0-b168-69fe-a55c-66f97ebaeb04', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '684c4544c7b20', '2025-06-13 12:35:33', '2025-06-13 12:35:33', ''),
(50, 1, '684c4545efb78', '1f0486c0-bc82-63e4-842b-2a81a1a6d8d6', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '684c4545efb78', '2025-06-13 12:35:34', '2025-06-13 12:35:34', ''),
(51, 1, '684c4546a3f23', '1f0486c0-c315-6f26-9324-aa80e0536efb', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '684c4546a3f23', '2025-06-13 12:35:35', '2025-06-13 12:35:35', ''),
(52, 1, '684c4547ebac6', '1f0486c0-cf6c-6a04-98e3-1eabfc4a3ae2', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '684c4547ebac6', '2025-06-13 12:35:36', '2025-06-13 12:35:36', ''),
(53, 1, '684c4548a71a8', '1f0486c0-d648-656c-9dd7-b20e8acf8980', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '684c4548a71a8', '2025-06-13 12:35:36', '2025-06-13 12:35:36', ''),
(54, 1, '684c4549d3e1e', '1f0486c0-e191-687e-9e79-1e734d641e48', '126', '126', 'win', 'balance_withdrawal', 0.64, 'play_fiver', 0, 1, '684c4549d3e1e', '2025-06-13 12:35:38', '2025-06-13 12:35:38', ''),
(55, 1, '684c454c28b6e', '1f0486c0-f77e-610a-9273-121dc3752918', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '684c454c28b6e', '2025-06-13 12:35:40', '2025-06-13 12:35:40', ''),
(56, 1, '684c454d71712', '1f0486c1-03de-6c4c-a719-52ecbd7a697b', '126', '126', 'win', 'balance_withdrawal', 0.64, 'play_fiver', 0, 1, '684c454d71712', '2025-06-13 12:35:41', '2025-06-13 12:35:41', ''),
(57, 1, '684c454f8bc0d', '1f0486c1-17f8-6ade-91ef-aa80e0536efb', '126', '126', 'win', 'balance_withdrawal', 0.64, 'play_fiver', 0, 1, '684c454f8bc0d', '2025-06-13 12:35:43', '2025-06-13 12:35:43', ''),
(58, 1, '684c45521025a', '1f0486c1-2fc0-6d38-a7ef-9abc0a71858e', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '684c45521025a', '2025-06-13 12:35:46', '2025-06-13 12:35:46', ''),
(59, 1, '684c4552ab85a', '1f0486c1-35d2-6956-8f66-1e70033eb5a8', '126', '126', 'win', 'balance_withdrawal', 0.24, 'play_fiver', 0, 1, '684c4552ab85a', '2025-06-13 12:35:46', '2025-06-13 12:35:46', ''),
(60, 1, '684c4554141fc', '1f0486c1-42fb-66aa-a506-92ea73247c12', '126', '126', 'win', 'balance_withdrawal', 0.24, 'play_fiver', 0, 1, '684c4554141fc', '2025-06-13 12:35:48', '2025-06-13 12:35:48', ''),
(61, 1, '684c455568b86', '1f0486c1-4fd2-6c7a-8ba7-7e56e4575664', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '684c455568b86', '2025-06-13 12:35:49', '2025-06-13 12:35:49', ''),
(62, 1, '684c4556d4cd6', '1f0486c1-5d95-602e-aa1d-d6eecd655302', '126', '126', 'win', 'balance_withdrawal', 0.48, 'play_fiver', 0, 1, '684c4556d4cd6', '2025-06-13 12:35:51', '2025-06-13 12:35:51', ''),
(63, 1, '684c4558ea6dd', '1f0486c1-7180-616a-8f68-2284d5130d55', '126', '126', 'win', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '684c4558ea6dd', '2025-06-13 12:35:53', '2025-06-13 12:35:53', ''),
(64, 1, '684c455b8a3b7', '1f0486c1-8a5a-6578-a447-de1e95f7ed62', '126', '126', 'win', 'balance_withdrawal', 0.64, 'play_fiver', 0, 1, '684c455b8a3b7', '2025-06-13 12:35:56', '2025-06-13 12:35:56', ''),
(65, 1, '684c455e62af8', '1f0486c1-a56b-616e-a94c-b20e8acf8980', '126', '126', 'win', 'balance_withdrawal', 2.00, 'play_fiver', 0, 1, '684c455e62af8', '2025-06-13 12:35:58', '2025-06-13 12:35:58', ''),
(66, 1, '684c4560f0558', '1f0486c1-be06-66f6-9918-8eab83a2dc16', '126', '126', 'win', 'balance_withdrawal', 2.64, 'play_fiver', 0, 1, '684c4560f0558', '2025-06-13 12:36:01', '2025-06-13 12:36:01', ''),
(67, 1, '684c4563e9ea0', '1f0486c1-da62-666a-9366-7e56e4575664', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '684c4563e9ea0', '2025-06-13 12:36:04', '2025-06-13 12:36:04', ''),
(68, 1, '684c4565285ab', '1f0486c1-e5e5-69ec-8a16-d6eecd655302', '126', '126', 'win', 'balance_withdrawal', 1.28, 'play_fiver', 0, 1, '684c4565285ab', '2025-06-13 12:36:06', '2025-06-13 12:36:06', ''),
(69, 1, '684c4566ccb9c', '1f0486c1-f5da-6bf4-bfe7-2af6a30eb705', '126', '126', 'win', 'balance_withdrawal', 3.84, 'play_fiver', 0, 1, '684c4566ccb9c', '2025-06-13 12:36:07', '2025-06-13 12:36:07', ''),
(70, 1, '1f0486c3-2fe8-6f66-b394-2284d5130d55', '1f0486c3-2fe9-62b8-8907-2284d5130d55', 'vs5luckytig', 'vs5luckytig', 'win', 'balance_withdrawal', 0.60, 'play_fiver', 0, 1, '1f0486c3-2fe8-6f66-b394-2284d5130d55', '2025-06-13 12:36:41', '2025-06-13 12:36:41', ''),
(71, 1, '1f0486c3-a006-61c2-abb6-2284d5130d55', '1f0486c3-a006-6686-9881-2284d5130d55', 'vs5luckytig', 'vs5luckytig', 'win', 'balance_withdrawal', 1.80, 'play_fiver', 0, 1, '1f0486c3-a006-61c2-abb6-2284d5130d55', '2025-06-13 12:36:52', '2025-06-13 12:36:52', ''),
(72, 1, '1f0486c3-c42e-6450-91bb-66632e2d6360', '1f0486c3-c42e-6b76-8061-66632e2d6360', 'vs5luckytig', 'vs5luckytig', 'win', 'balance_withdrawal', 1.60, 'play_fiver', 0, 1, '1f0486c3-c42e-6450-91bb-66632e2d6360', '2025-06-13 12:36:56', '2025-06-13 12:36:56', ''),
(73, 1, '1f0486c3-e2ed-6698-ae26-b20e8acf8980', '1f0486c3-e2ed-6c60-80b3-b20e8acf8980', 'vs5luckytig', 'vs5luckytig', 'win', 'balance_withdrawal', 0.60, 'play_fiver', 0, 1, '1f0486c3-e2ed-6698-ae26-b20e8acf8980', '2025-06-13 12:36:58', '2025-06-13 12:36:58', ''),
(74, 1, '1f0486c3-fc73-643c-a14c-121dc3752918', '1f0486c3-fc73-6900-8fb7-121dc3752918', 'vs5luckytig', 'vs5luckytig', 'win', 'balance_withdrawal', 1.80, 'play_fiver', 0, 1, '1f0486c3-fc73-643c-a14c-121dc3752918', '2025-06-13 12:37:01', '2025-06-13 12:37:01', ''),
(75, 1, '1f0486c4-0f76-64f8-8ff6-de1e95f7ed62', '1f0486c4-0f76-6872-8e7b-de1e95f7ed62', 'vs5luckytig', 'vs5luckytig', 'win', 'balance_withdrawal', 3.00, 'play_fiver', 0, 1, '1f0486c4-0f76-64f8-8ff6-de1e95f7ed62', '2025-06-13 12:37:03', '2025-06-13 12:37:03', ''),
(76, 1, '1f0486c4-1b12-6690-8e42-1edb7b144137', '1f0486c4-1b12-69ce-83a9-1edb7b144137', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance_withdrawal', 1.00, 'play_fiver', 0, 1, '1f0486c4-1b12-6690-8e42-1edb7b144137', '2025-06-13 12:37:04', '2025-06-13 12:37:04', ''),
(77, 1, '1f0486c4-37ba-6126-821c-b20e8acf8980', '1f0486c4-37ba-6590-976e-b20e8acf8980', 'vs5luckytig', 'vs5luckytig', 'win', 'balance_withdrawal', 1.00, 'play_fiver', 0, 1, '1f0486c4-37ba-6126-821c-b20e8acf8980', '2025-06-13 12:37:07', '2025-06-13 12:37:07', ''),
(78, 1, '1f0486c4-446d-6742-9274-5ed0cbf952d3', '1f0486c4-446d-6a94-9462-5ed0cbf952d3', 'vs5luckytig', 'vs5luckytig', 'win', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '1f0486c4-446d-6742-9274-5ed0cbf952d3', '2025-06-13 12:37:09', '2025-06-13 12:37:09', ''),
(79, 1, '1f0486c4-5aee-600c-9be6-121dc3752918', '1f0486c4-5aee-64e4-9573-121dc3752918', 'vs5luckytig', 'vs5luckytig', 'win', 'balance_withdrawal', 1.80, 'play_fiver', 0, 1, '1f0486c4-5aee-600c-9be6-121dc3752918', '2025-06-13 12:37:11', '2025-06-13 12:37:11', ''),
(80, 1, '1f0486c4-6aa0-69d2-ad1f-de1e95f7ed62', '1f0486c4-6aa0-6d1a-a02f-de1e95f7ed62', 'vs5luckytig', 'vs5luckytig', 'win', 'balance_withdrawal', 2.00, 'play_fiver', 0, 1, '1f0486c4-6aa0-69d2-ad1f-de1e95f7ed62', '2025-06-13 12:37:13', '2025-06-13 12:37:13', ''),
(81, 1, '1f0486c4-7b49-6086-a749-aa80e0536efb', '1f0486c4-7b49-67e8-a918-aa80e0536efb', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance_withdrawal', 1.00, 'play_fiver', 0, 1, '1f0486c4-7b49-6086-a749-aa80e0536efb', '2025-06-13 12:37:14', '2025-06-13 12:37:14', ''),
(82, 1, '1f0486c4-8e5c-68d0-8b9d-1eabfc4a3ae2', '1f0486c4-8e5c-6efc-b900-1eabfc4a3ae2', 'vs5luckytig', 'vs5luckytig', 'win', 'balance_withdrawal', 11.00, 'play_fiver', 0, 1, '1f0486c4-8e5c-68d0-8b9d-1eabfc4a3ae2', '2025-06-13 12:37:16', '2025-06-13 12:37:16', ''),
(83, 1, '1f0486c4-ca5c-64a2-a6f4-5ed0cbf952d3', '1f0486c4-ca5c-6808-ae89-5ed0cbf952d3', 'vs5luckytig', 'vs5luckytig', 'win', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '1f0486c4-ca5c-64a2-a6f4-5ed0cbf952d3', '2025-06-13 12:37:23', '2025-06-13 12:37:23', ''),
(84, 1, '1f0486c4-d825-6c8c-ac92-eaca1a71a078', '1f0486c4-d826-631c-837a-eaca1a71a078', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance_withdrawal', 1.00, 'play_fiver', 0, 1, '1f0486c4-d825-6c8c-ac92-eaca1a71a078', '2025-06-13 12:37:24', '2025-06-13 12:37:24', ''),
(85, 1, '1f0486c4-e435-682e-9bb9-6edee4b2bab3', '1f0486c4-e436-61d4-8e05-6edee4b2bab3', 'vs5luckytig', 'vs5luckytig', 'win', 'balance_withdrawal', 0.60, 'play_fiver', 0, 1, '1f0486c4-e435-682e-9bb9-6edee4b2bab3', '2025-06-13 12:37:26', '2025-06-13 12:37:26', ''),
(86, 1, '1f0486c4-f370-6aa0-8690-66632e2d6360', '1f0486c4-f371-614e-ab99-66632e2d6360', 'vs5luckytig', 'vs5luckytig', 'win', 'balance_withdrawal', 0.60, 'play_fiver', 0, 1, '1f0486c4-f370-6aa0-8690-66632e2d6360', '2025-06-13 12:37:27', '2025-06-13 12:37:27', ''),
(87, 1, '1f0486c5-043b-6808-ae5e-1edb7b144137', '1f0486c5-043b-6c68-9299-1edb7b144137', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance_withdrawal', 1.00, 'play_fiver', 0, 1, '1f0486c5-043b-6808-ae5e-1edb7b144137', '2025-06-13 12:37:29', '2025-06-13 12:37:29', ''),
(88, 1, '1f0486c5-0e22-6e3e-808f-16ad70b11b94', '1f0486c5-0e23-617c-ba15-16ad70b11b94', 'vs5luckytig', 'vs5luckytig', 'win', 'balance_withdrawal', 0.60, 'play_fiver', 0, 1, '1f0486c5-0e22-6e3e-808f-16ad70b11b94', '2025-06-13 12:37:30', '2025-06-13 12:37:30', ''),
(89, 1, '1f0486c5-19f7-6552-8bf1-5ed0cbf952d3', '1f0486c5-19f7-68a4-a753-5ed0cbf952d3', 'vs5luckytig', 'vs5luckytig', 'win', 'balance_withdrawal', 11.00, 'play_fiver', 0, 1, '1f0486c5-19f7-6552-8bf1-5ed0cbf952d3', '2025-06-13 12:37:31', '2025-06-13 12:37:31', ''),
(90, 1, '1f0486c5-2e5f-6ecc-9549-fabb057dd3bc', '1f0486c5-2e60-62f0-ad20-fabb057dd3bc', 'vs5luckytig', 'vs5luckytig', 'win', 'balance_withdrawal', 4.00, 'play_fiver', 0, 1, '1f0486c5-2e5f-6ecc-9549-fabb057dd3bc', '2025-06-13 12:37:33', '2025-06-13 12:37:33', ''),
(91, 1, '1f0486c5-3965-6574-b12a-025ff25f5c27', '1f0486c5-3965-68ee-9f11-025ff25f5c27', 'vs5luckytig', 'vs5luckytig', 'win', 'balance_withdrawal', 5.00, 'play_fiver', 0, 1, '1f0486c5-3965-6574-b12a-025ff25f5c27', '2025-06-13 12:37:34', '2025-06-13 12:37:34', ''),
(92, 1, '1f0486c5-4a42-68ec-a134-7e56e4575664', '1f0486c5-4a42-6db0-898a-7e56e4575664', 'vs5luckytig', 'vs5luckytig', 'win', 'balance_withdrawal', 1.00, 'play_fiver', 0, 1, '1f0486c5-4a42-68ec-a134-7e56e4575664', '2025-06-13 12:37:36', '2025-06-13 12:37:36', ''),
(93, 1, '1f0486c5-61f6-6178-a9f2-56f9c98367eb', '1f0486c5-61f6-64e8-8a0a-56f9c98367eb', 'vs5luckytig', 'vs5luckytig', 'win', 'balance_withdrawal', 4.00, 'play_fiver', 0, 1, '1f0486c5-61f6-6178-a9f2-56f9c98367eb', '2025-06-13 12:37:38', '2025-06-13 12:37:38', ''),
(94, 1, '1f0486c5-706b-6942-8fa5-9ae10065e0ad', '1f0486c5-706c-6040-b595-9ae10065e0ad', 'vs5luckytig', 'vs5luckytig', 'win', 'balance_withdrawal', 5.60, 'play_fiver', 0, 1, '1f0486c5-706b-6942-8fa5-9ae10065e0ad', '2025-06-13 12:37:40', '2025-06-13 12:37:40', ''),
(95, 1, '1f0486c5-893f-600e-805e-7a0dc77b0dc2', '1f0486c5-893f-6374-94cd-7a0dc77b0dc2', 'vs5luckytig', 'vs5luckytig', 'win', 'balance_withdrawal', 20.00, 'play_fiver', 0, 1, '1f0486c5-893f-600e-805e-7a0dc77b0dc2', '2025-06-13 12:37:43', '2025-06-13 12:37:43', ''),
(96, 1, '1f0486c5-d673-6564-9d54-66f97ebaeb04', '1f0486c5-d673-6bf4-974a-66f97ebaeb04', 'vs5luckytig', 'vs5luckytig', 'win', 'balance_withdrawal', 2.40, 'play_fiver', 0, 1, '1f0486c5-d673-6564-9d54-66f97ebaeb04', '2025-06-13 12:37:51', '2025-06-13 12:37:51', ''),
(97, 1, '1f0486c5-ef4a-6632-a8ba-36790834873f', '1f0486c5-ef4a-6c4a-8b7e-36790834873f', 'vs5luckytig', 'vs5luckytig', 'win', 'balance_withdrawal', 0.60, 'play_fiver', 0, 1, '1f0486c5-ef4a-6632-a8ba-36790834873f', '2025-06-13 12:37:53', '2025-06-13 12:37:53', ''),
(98, 1, '1f0486c5-fc8e-6d02-8fbe-9abc0a71858e', '1f0486c5-fc8f-66f8-ba84-9abc0a71858e', 'vs5luckytig', 'vs5luckytig', 'win', 'balance_withdrawal', 1.00, 'play_fiver', 0, 1, '1f0486c5-fc8e-6d02-8fbe-9abc0a71858e', '2025-06-13 12:37:55', '2025-06-13 12:37:55', ''),
(99, 1, '1f0486c6-0db5-6a40-9181-eaca1a71a078', '1f0486c6-0db5-6d92-9420-eaca1a71a078', 'vs5luckytig', 'vs5luckytig', 'win', 'balance_withdrawal', 0.60, 'play_fiver', 0, 1, '1f0486c6-0db5-6a40-9181-eaca1a71a078', '2025-06-13 12:37:56', '2025-06-13 12:37:56', ''),
(100, 1, '1f0486c6-19f5-6af8-a8cf-8a27626f8675', '1f0486c6-19f5-6e4a-a6ef-8a27626f8675', 'vs5luckytig', 'vs5luckytig', 'win', 'balance_withdrawal', 1.60, 'play_fiver', 0, 1, '1f0486c6-19f5-6af8-a8cf-8a27626f8675', '2025-06-13 12:37:58', '2025-06-13 12:37:58', ''),
(101, 1, '1f0486c6-2873-6cd8-8d21-66632e2d6360', '1f0486c6-2874-6016-82b2-66632e2d6360', 'vs5luckytig', 'vs5luckytig', 'win', 'balance_withdrawal', 0.60, 'play_fiver', 0, 1, '1f0486c6-2873-6cd8-8d21-66632e2d6360', '2025-06-13 12:37:59', '2025-06-13 12:37:59', ''),
(102, 1, '1f0486c6-3613-60aa-a2f8-1eabfc4a3ae2', '1f0486c6-3613-63f2-b6f3-1eabfc4a3ae2', 'vs5luckytig', 'vs5luckytig', 'win', 'balance_withdrawal', 2.00, 'play_fiver', 0, 1, '1f0486c6-3613-60aa-a2f8-1eabfc4a3ae2', '2025-06-13 12:38:01', '2025-06-13 12:38:01', ''),
(103, 1, '1f0486c6-4962-6002-8569-8eab83a2dc16', '1f0486c6-4962-6354-9265-8eab83a2dc16', 'vs5luckytig', 'vs5luckytig', 'win', 'balance_withdrawal', 1.00, 'play_fiver', 0, 1, '1f0486c6-4962-6002-8569-8eab83a2dc16', '2025-06-13 12:38:03', '2025-06-13 12:38:03', ''),
(104, 1, '1f0486c6-5fc0-631c-b27e-2a81a1a6d8d6', '1f0486c6-5fc0-6a10-aba3-2a81a1a6d8d6', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance_withdrawal', 1.00, 'play_fiver', 0, 1, '1f0486c6-5fc0-631c-b27e-2a81a1a6d8d6', '2025-06-13 12:38:06', '2025-06-13 12:38:06', ''),
(105, 1, '1f0486c6-74d8-64c0-ab1d-9ae10065e0ad', '1f0486c6-74d8-6b0a-8552-9ae10065e0ad', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance_withdrawal', 1.00, 'play_fiver', 0, 1, '1f0486c6-74d8-64c0-ab1d-9ae10065e0ad', '2025-06-13 12:38:07', '2025-06-13 12:38:07', ''),
(106, 1, '1f0486c6-7f06-65c8-b765-9abc0a71858e', '1f0486c6-7f06-691a-ae81-9abc0a71858e', 'vs5luckytig', 'vs5luckytig', 'win', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '1f0486c6-7f06-65c8-b765-9abc0a71858e', '2025-06-13 12:38:08', '2025-06-13 12:38:08', ''),
(107, 1, '1f0486c6-9635-6ba4-b08b-92ea73247c12', '1f0486c6-9636-605e-8000-92ea73247c12', 'vs5luckytig', 'vs5luckytig', 'win', 'balance_withdrawal', 5.00, 'play_fiver', 0, 1, '1f0486c6-9635-6ba4-b08b-92ea73247c12', '2025-06-13 12:38:11', '2025-06-13 12:38:11', ''),
(108, 1, '1f0486c6-a83b-6f1a-a35e-66632e2d6360', '1f0486c6-a83c-6280-ab31-66632e2d6360', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance_withdrawal', 1.00, 'play_fiver', 0, 1, '1f0486c6-a83b-6f1a-a35e-66632e2d6360', '2025-06-13 12:38:13', '2025-06-13 12:38:13', ''),
(109, 1, '1f0486c6-d078-6316-b15f-dacc96ae6ae5', '1f0486c6-d078-665e-ab3e-dacc96ae6ae5', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance_withdrawal', 1.00, 'play_fiver', 0, 1, '1f0486c6-d078-6316-b15f-dacc96ae6ae5', '2025-06-13 12:38:17', '2025-06-13 12:38:17', ''),
(110, 1, '1f0486c6-da5e-675e-a825-b20e8acf8980', '1f0486c6-da5e-6c2c-9cd1-b20e8acf8980', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance_withdrawal', 1.00, 'play_fiver', 0, 1, '1f0486c6-da5e-675e-a825-b20e8acf8980', '2025-06-13 12:38:18', '2025-06-13 12:38:18', ''),
(111, 1, '1f0486c6-e4cb-6c28-8fa4-5ed0cbf952d3', '1f0486c6-e4cc-62ae-bd18-5ed0cbf952d3', 'vs5luckytig', 'vs5luckytig', 'win', 'balance_withdrawal', 1.60, 'play_fiver', 0, 1, '1f0486c6-e4cb-6c28-8fa4-5ed0cbf952d3', '2025-06-13 12:38:19', '2025-06-13 12:38:19', ''),
(112, 1, '1f0486c6-fc31-63fe-988f-fabb057dd3bc', '1f0486c6-fc31-6868-9850-fabb057dd3bc', 'vs5luckytig', 'vs5luckytig', 'win', 'balance_withdrawal', 2.00, 'play_fiver', 0, 1, '1f0486c6-fc31-63fe-988f-fabb057dd3bc', '2025-06-13 12:38:22', '2025-06-13 12:38:22', ''),
(113, 1, '1f0486c7-1135-643a-a7a9-520cc9cd5d5f', '1f0486c7-1135-67d2-9fa8-520cc9cd5d5f', 'vs5luckytig', 'vs5luckytig', 'win', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '1f0486c7-1135-643a-a7a9-520cc9cd5d5f', '2025-06-13 12:38:24', '2025-06-13 12:38:24', ''),
(114, 1, '1f0486c7-1f81-6b10-9f04-7e56e4575664', '1f0486c7-1f81-6eda-bed9-7e56e4575664', 'vs5luckytig', 'vs5luckytig', 'win', 'balance_withdrawal', 0.60, 'play_fiver', 0, 1, '1f0486c7-1f81-6b10-9f04-7e56e4575664', '2025-06-13 12:38:25', '2025-06-13 12:38:25', ''),
(115, 1, '1f0486c7-2dd2-6250-aa01-36790834873f', '1f0486c7-2dd2-6886-9507-36790834873f', 'vs5luckytig', 'vs5luckytig', 'win', 'balance_withdrawal', 3.00, 'play_fiver', 0, 1, '1f0486c7-2dd2-6250-aa01-36790834873f', '2025-06-13 12:38:27', '2025-06-13 12:38:27', ''),
(116, 1, '1f0486c7-3d3b-6caa-a0c9-7a0dc77b0dc2', '1f0486c7-3d3b-6ff2-a8ed-7a0dc77b0dc2', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance_withdrawal', 1.00, 'play_fiver', 0, 1, '1f0486c7-3d3b-6caa-a0c9-7a0dc77b0dc2', '2025-06-13 12:38:28', '2025-06-13 12:38:28', ''),
(117, 1, '1f0486c7-47c4-676c-b2c9-6edee4b2bab3', '1f0486c7-47c4-6adc-92c3-6edee4b2bab3', 'vs5luckytig', 'vs5luckytig', 'win', 'balance_withdrawal', 4.00, 'play_fiver', 0, 1, '1f0486c7-47c4-676c-b2c9-6edee4b2bab3', '2025-06-13 12:38:29', '2025-06-13 12:38:29', ''),
(118, 1, '1f0486c7-5bad-6b8e-980b-66632e2d6360', '1f0486c7-5bad-6fd0-bac9-66632e2d6360', 'vs5luckytig', 'vs5luckytig', 'win', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '1f0486c7-5bad-6b8e-980b-66632e2d6360', '2025-06-13 12:38:31', '2025-06-13 12:38:31', ''),
(119, 1, '1f0486c7-7186-6ca8-917e-56f9c98367eb', '1f0486c7-7187-605e-bf7c-56f9c98367eb', 'vs5luckytig', 'vs5luckytig', 'win', 'balance_withdrawal', 15.60, 'play_fiver', 0, 1, '1f0486c7-7186-6ca8-917e-56f9c98367eb', '2025-06-13 12:38:34', '2025-06-13 12:38:34', ''),
(120, 1, '1f0486c7-f201-6cd4-a449-de1e95f7ed62', '1f0486c7-f202-6012-82c8-de1e95f7ed62', 'vs5luckytig', 'vs5luckytig', 'win', 'balance_withdrawal', 100.00, 'play_fiver', 0, 1, '1f0486c7-f201-6cd4-a449-de1e95f7ed62', '2025-06-13 12:38:47', '2025-06-13 12:38:47', ''),
(121, 1, '1f0486c8-0a26-6512-947c-d6eecd655302', '1f0486c8-0a26-6850-ad31-d6eecd655302', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance_withdrawal', 25.00, 'play_fiver', 0, 1, '1f0486c8-0a26-6512-947c-d6eecd655302', '2025-06-13 12:38:51', '2025-06-13 12:38:51', ''),
(122, 1, '1f0486c8-1b2c-6fc8-b049-7a0dc77b0dc2', '1f0486c8-1b2d-636a-8e4f-7a0dc77b0dc2', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance_withdrawal', 25.00, 'play_fiver', 0, 1, '1f0486c8-1b2c-6fc8-b049-7a0dc77b0dc2', '2025-06-13 12:38:52', '2025-06-13 12:38:52', ''),
(123, 1, '1f0486c8-2bde-675e-ac1e-a2dac94d7ff7', '1f0486c8-2bde-6dc6-aca2-a2dac94d7ff7', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance_withdrawal', 25.00, 'play_fiver', 0, 1, '1f0486c8-2bde-675e-ac1e-a2dac94d7ff7', '2025-06-13 12:38:54', '2025-06-13 12:38:54', ''),
(124, 1, '1f0486c8-4444-6b2c-9b93-3a3928c9c016', '1f0486c8-4444-6e88-bc40-3a3928c9c016', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance_withdrawal', 25.00, 'play_fiver', 0, 1, '1f0486c8-4444-6b2c-9b93-3a3928c9c016', '2025-06-13 12:38:56', '2025-06-13 12:38:56', ''),
(125, 1, '1f0486c8-4f02-6000-9850-1eabfc4a3ae2', '1f0486c8-4f02-6352-a923-1eabfc4a3ae2', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance_withdrawal', 25.00, 'play_fiver', 0, 1, '1f0486c8-4f02-6000-9850-1eabfc4a3ae2', '2025-06-13 12:38:57', '2025-06-13 12:38:57', ''),
(126, 1, '1f0486c8-593c-6e12-9cdf-d6eecd655302', '1f0486c8-593d-6146-b999-d6eecd655302', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance_withdrawal', 25.00, 'play_fiver', 0, 1, '1f0486c8-593c-6e12-9cdf-d6eecd655302', '2025-06-13 12:38:58', '2025-06-13 12:38:58', ''),
(127, 1, '1f0486c8-63d7-65ac-8523-a22146b415ec', '1f0486c8-63d7-68fe-bd3e-a22146b415ec', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance_withdrawal', 25.00, 'play_fiver', 0, 1, '1f0486c8-63d7-65ac-8523-a22146b415ec', '2025-06-13 12:38:59', '2025-06-13 12:38:59', ''),
(128, 1, '1f0486c8-7124-6246-b48c-fabb057dd3bc', '1f0486c8-7124-670a-a8ca-fabb057dd3bc', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance_withdrawal', 25.00, 'play_fiver', 0, 1, '1f0486c8-7124-6246-b48c-fabb057dd3bc', '2025-06-13 12:39:01', '2025-06-13 12:39:01', ''),
(129, 1, '1f0486ca-f227-6530-bb3e-b20e8acf8980', '1f0486ca-f227-68be-bf34-b20e8acf8980', 'vs20hburnhs', 'vs20hburnhs', 'bet', 'balance_withdrawal', 1.00, 'play_fiver', 0, 1, '1f0486ca-f227-6530-bb3e-b20e8acf8980', '2025-06-13 12:40:08', '2025-06-13 12:40:08', ''),
(130, 1, '1f0486cb-0f99-656e-9b55-8eab83a2dc16', '1f0486cb-0f99-68e8-b46b-8eab83a2dc16', 'vs20hburnhs', 'vs20hburnhs', 'bet', 'balance_withdrawal', 1.00, 'play_fiver', 0, 1, '1f0486cb-0f99-656e-9b55-8eab83a2dc16', '2025-06-13 12:40:11', '2025-06-13 12:40:11', ''),
(131, 1, '1f0486cb-2dcb-6348-8d42-de1e95f7ed62', '1f0486cb-2dcb-66ae-86fe-de1e95f7ed62', 'vs20hburnhs', 'vs20hburnhs', 'bet', 'balance_withdrawal', 1.00, 'play_fiver', 0, 1, '1f0486cb-2dcb-6348-8d42-de1e95f7ed62', '2025-06-13 12:40:14', '2025-06-13 12:40:14', ''),
(132, 1, '1f0486cd-535b-60e8-b7f0-5ed0cbf952d3', '1f0486cd-535b-657a-85f1-5ed0cbf952d3', 'vs20hburnhs', 'vs20hburnhs', 'bet', 'balance_withdrawal', 1.00, 'play_fiver', 0, 1, '1f0486cd-535b-60e8-b7f0-5ed0cbf952d3', '2025-06-13 12:41:12', '2025-06-13 12:41:12', ''),
(133, 1, '1f0486cd-7c66-623a-b207-8a27626f8675', '1f0486cd-7c66-65aa-9a81-8a27626f8675', 'vs20hburnhs', 'vs20hburnhs', 'bet', 'balance_withdrawal', 1.00, 'play_fiver', 0, 1, '1f0486cd-7c66-623a-b207-8a27626f8675', '2025-06-13 12:41:16', '2025-06-13 12:41:16', ''),
(134, 1, '1f0486cd-9cd7-67d0-8db7-1eabfc4a3ae2', '1f0486cd-9cd7-6dfc-b37d-1eabfc4a3ae2', 'vs20hburnhs', 'vs20hburnhs', 'bet', 'balance_withdrawal', 1.00, 'play_fiver', 0, 1, '1f0486cd-9cd7-67d0-8db7-1eabfc4a3ae2', '2025-06-13 12:41:20', '2025-06-13 12:41:20', ''),
(135, 1, '1f0486cd-ab6c-6872-9462-dacc96ae6ae5', '1f0486cd-ab6c-6bb0-9c3a-dacc96ae6ae5', 'vs20hburnhs', 'vs20hburnhs', 'win', 'balance_withdrawal', 0.65, 'play_fiver', 0, 1, '1f0486cd-ab6c-6872-9462-dacc96ae6ae5', '2025-06-13 12:41:21', '2025-06-13 12:41:21', ''),
(136, 1, '1f0486cd-dda1-6310-9182-a2dac94d7ff7', '1f0486cd-dda1-6676-bb4c-a2dac94d7ff7', 'vs20hburnhs', 'vs20hburnhs', 'bet', 'balance_withdrawal', 1.00, 'play_fiver', 0, 1, '1f0486cd-dda1-6310-9182-a2dac94d7ff7', '2025-06-13 12:41:26', '2025-06-13 12:41:26', ''),
(137, 1, '1f0486cd-f579-67c6-9123-3a3928c9c016', '1f0486cd-f579-6ee2-92f1-3a3928c9c016', 'vs20hburnhs', 'vs20hburnhs', 'win', 'balance_withdrawal', 1.00, 'play_fiver', 0, 1, '1f0486cd-f579-67c6-9123-3a3928c9c016', '2025-06-13 12:41:29', '2025-06-13 12:41:29', ''),
(138, 1, '1f0486ce-0fe4-637c-bfc4-56f9c98367eb', '1f0486ce-0fe4-6764-ad30-56f9c98367eb', 'vs20hburnhs', 'vs20hburnhs', 'bet', 'balance_withdrawal', 1.00, 'play_fiver', 0, 1, '1f0486ce-0fe4-637c-bfc4-56f9c98367eb', '2025-06-13 12:41:31', '2025-06-13 12:41:31', ''),
(139, 1, '1f0486ce-233a-6bec-a461-1e734d641e48', '1f0486ce-233a-6f2a-ad75-1e734d641e48', 'vs20hburnhs', 'vs20hburnhs', 'bet', 'balance_withdrawal', 1.00, 'play_fiver', 0, 1, '1f0486ce-233a-6bec-a461-1e734d641e48', '2025-06-13 12:41:33', '2025-06-13 12:41:33', ''),
(140, 1, '1f0486ce-373e-6fd0-95e7-52ecbd7a697b', '1f0486ce-373f-63cc-875b-52ecbd7a697b', 'vs20hburnhs', 'vs20hburnhs', 'bet', 'balance_withdrawal', 1.00, 'play_fiver', 0, 1, '1f0486ce-373e-6fd0-95e7-52ecbd7a697b', '2025-06-13 12:41:36', '2025-06-13 12:41:36', ''),
(141, 1, '1f0486ce-456e-62e0-9474-56f9c98367eb', '1f0486ce-456e-679a-9d59-56f9c98367eb', 'vs20hburnhs', 'vs20hburnhs', 'bet', 'balance_withdrawal', 1.00, 'play_fiver', 0, 1, '1f0486ce-456e-62e0-9474-56f9c98367eb', '2025-06-13 12:41:37', '2025-06-13 12:41:37', '');

-- --------------------------------------------------------

--
-- Estrutura para tabela `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

--
-- Despejando dados para a tabela `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'games-exclusive-edit', 'web', '2023-10-12 16:23:45', '2023-10-12 18:12:28'),
(2, 'games-exclusive-view', 'web', '2023-10-12 16:23:56', '2023-10-12 18:11:25'),
(3, 'games-exclusive-create', 'web', '2023-10-12 16:25:06', '2023-10-12 18:11:10'),
(4, 'admin-view', 'web', '2023-10-12 17:56:35', '2023-10-12 17:56:35'),
(5, 'admin-create', 'web', '2023-10-12 18:56:02', '2023-10-12 18:56:02'),
(6, 'admin-edit', 'web', '2023-10-12 18:56:27', '2023-10-12 18:56:27'),
(7, 'admin-delete', 'web', '2023-10-12 18:56:55', '2023-10-12 18:56:55'),
(8, 'category-view', 'web', '2023-10-12 19:01:31', '2023-10-12 19:01:31'),
(9, 'category-create', 'web', '2023-10-12 19:01:46', '2023-10-12 19:01:46'),
(10, 'category-edit', 'web', '2023-10-12 19:01:59', '2023-10-12 19:01:59'),
(11, 'category-delete', 'web', '2023-10-12 19:02:09', '2023-10-12 19:02:09'),
(12, 'game-view', 'web', '2023-10-12 19:02:27', '2023-10-12 19:02:27'),
(13, 'game-create', 'web', '2023-10-12 19:02:36', '2023-10-12 19:02:36'),
(14, 'game-edit', 'web', '2023-10-12 19:02:44', '2023-10-12 19:02:44'),
(15, 'game-delete', 'web', '2023-10-12 19:02:54', '2023-10-12 19:02:54'),
(16, 'wallet-view', 'web', '2023-10-12 19:05:49', '2023-10-12 19:05:49'),
(17, 'wallet-create', 'web', '2023-10-12 19:06:01', '2023-10-12 19:06:01'),
(18, 'wallet-edit', 'web', '2023-10-12 19:06:11', '2023-10-12 19:06:11'),
(19, 'wallet-delete', 'web', '2023-10-12 19:06:18', '2023-10-12 19:06:18'),
(20, 'deposit-view', 'web', '2023-10-12 19:06:44', '2023-10-12 19:06:44'),
(21, 'deposit-create', 'web', '2023-10-12 19:06:56', '2023-10-12 19:06:56'),
(22, 'deposit-edit', 'web', '2023-10-12 19:07:05', '2023-10-12 19:07:05'),
(23, 'deposit-update', 'web', '2023-10-12 19:08:00', '2023-10-12 19:08:00'),
(24, 'deposit-delete', 'web', '2023-10-12 19:08:11', '2023-10-12 19:08:11'),
(25, 'withdrawal-view', 'web', '2023-10-12 19:09:31', '2023-10-12 19:09:31'),
(26, 'withdrawal-create', 'web', '2023-10-12 19:09:40', '2023-10-12 19:09:40'),
(27, 'withdrawal-edit', 'web', '2023-10-12 19:09:51', '2023-10-12 19:09:51'),
(28, 'withdrawal-update', 'web', '2023-10-12 19:10:00', '2023-10-12 19:10:00'),
(29, 'withdrawal-delete', 'web', '2023-10-12 19:10:09', '2023-10-12 19:10:09'),
(30, 'order-view', 'web', '2023-10-12 19:12:36', '2023-10-12 19:12:36'),
(31, 'order-create', 'web', '2023-10-12 19:12:47', '2023-10-12 19:12:47'),
(32, 'order-edit', 'web', '2023-10-12 19:12:56', '2023-10-12 19:12:56'),
(33, 'order-update', 'web', '2023-10-12 19:13:06', '2023-10-12 19:13:06'),
(34, 'order-delete', 'web', '2023-10-12 19:13:19', '2023-10-12 19:13:19'),
(35, 'admin-menu-view', 'web', '2023-10-12 20:26:06', '2023-10-12 20:26:06'),
(36, 'setting-view', 'web', '2023-10-12 21:25:46', '2023-10-12 21:25:46'),
(37, 'setting-create', 'web', '2023-10-12 21:25:57', '2023-10-12 21:25:57'),
(38, 'setting-edit', 'web', '2023-10-12 21:26:06', '2023-10-12 21:26:06'),
(39, 'setting-update', 'web', '2023-10-12 21:26:19', '2023-10-12 21:26:19'),
(40, 'setting-delete', 'web', '2023-10-12 21:26:33', '2023-10-12 21:26:33');

-- --------------------------------------------------------

--
-- Estrutura para tabela `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `post_notifications`
--

CREATE TABLE `post_notifications` (
  `id` int(11) NOT NULL,
  `imagem` varchar(255) DEFAULT NULL,
  `titulo` varchar(255) NOT NULL,
  `message` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `post_notifications`
--

INSERT INTO `post_notifications` (`id`, `imagem`, `titulo`, `message`, `created_at`, `updated_at`) VALUES
(2, '01JME5E05S1V2KF0B6MVY9H38W.png', 'Seja muito bem vindo em nossa plataforma...', 'Seja muito bem-vindo à nossa plataforma! Estamos empolgados em tê-lo conosco e ansiosos para ajudá-lo a explorar todos os recursos e possibilidades que oferecemos. Nossa equipe está à disposição para garantir que sua experiência seja a melhor possível. ', '2024-08-21 07:33:27', '2025-02-19 03:53:55'),
(3, '01JME5H3GZNDQFYFQATWDT9YG8.png', 'Você pode ganhar 10$ por cada depósito do seu indicado...', 'Bem-vindo a bordo!  copere conosco e ganhe porcentagens de ganhos superiores de 100 mil', '2024-08-21 07:34:25', '2025-02-19 03:55:20');

-- --------------------------------------------------------

--
-- Estrutura para tabela `providers`
--

CREATE TABLE `providers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cover` varchar(255) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `rtp` bigint(20) DEFAULT '90',
  `views` bigint(20) DEFAULT '1',
  `distribution` varchar(50) DEFAULT 'play_fiver',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `providers`
--

INSERT INTO `providers` (`id`, `cover`, `code`, `name`, `status`, `rtp`, `views`, `distribution`, `created_at`, `updated_at`) VALUES
(1, 'Provedores/PGSOFT.webp', 'PGSOFT', 'PGSOFT', 1, 80, 1, 'fivergames', '2025-04-14 18:55:52', '2025-06-17 06:54:24'),
(18, 'Provedores/PGSOFT.webp', 'PGSOFT', 'PGSoft FiverGames', 1, 0, 0, 'fivergames', '2025-04-14 18:55:54', '2025-06-17 06:54:46');

-- --------------------------------------------------------

--
-- Estrutura para tabela `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

--
-- Despejando dados para a tabela `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'web', '2023-10-12 16:20:41', '2023-10-12 16:20:41'),
(2, 'afiliado', 'web', '2023-10-12 16:21:08', '2023-10-12 16:21:08');

-- --------------------------------------------------------

--
-- Estrutura para tabela `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estrutura para tabela `sen_saques`
--

CREATE TABLE `sen_saques` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `valid_saque` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `sen_saques`
--

INSERT INTO `sen_saques` (`id`, `user_id`, `valid_saque`, `created_at`, `updated_at`) VALUES
(56, 1, '$2y$10$.fmm2hrLG1PCMNYudLWqQ..rZK027znWfZHs08mVtA.ZO8q1WCHR2', '2025-06-17 07:25:27', '2025-06-17 07:25:27');

-- --------------------------------------------------------

--
-- Estrutura para tabela `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `software_name` varchar(255) DEFAULT NULL,
  `software_description` text,
  `software_favicon` varchar(255) DEFAULT NULL,
  `software_logo_white` varchar(255) DEFAULT NULL,
  `software_logo_black` varchar(255) DEFAULT NULL,
  `software_background` varchar(255) DEFAULT NULL,
  `currency_code` varchar(191) NOT NULL DEFAULT 'BRL',
  `decimal_format` varchar(20) NOT NULL DEFAULT 'dot',
  `currency_position` varchar(20) NOT NULL DEFAULT 'left',
  `revshare_percentage` bigint(20) DEFAULT '20',
  `ngr_percent` bigint(20) DEFAULT '20',
  `soccer_percentage` bigint(20) DEFAULT '30',
  `prefix` varchar(191) NOT NULL DEFAULT 'R$',
  `storage` varchar(191) NOT NULL DEFAULT 'local',
  `initial_bonus` bigint(20) DEFAULT '0',
  `min_deposit` decimal(10,2) DEFAULT '20.00',
  `max_deposit` decimal(10,2) DEFAULT '0.00',
  `min_withdrawal` decimal(10,2) DEFAULT '20.00',
  `max_withdrawal` decimal(10,2) DEFAULT '0.00',
  `rollover` bigint(20) DEFAULT '10',
  `rollover_deposit` bigint(20) DEFAULT '1',
  `suitpay_is_enable` tinyint(4) DEFAULT '1',
  `stripe_is_enable` tinyint(4) DEFAULT '1',
  `bspay_is_enable` tinyint(4) DEFAULT '0',
  `sharkpay_is_enable` tinyint(4) DEFAULT '1',
  `turn_on_football` tinyint(4) DEFAULT '1',
  `revshare_reverse` tinyint(1) DEFAULT '1',
  `bonus_vip` bigint(20) DEFAULT '100',
  `activate_vip_bonus` tinyint(1) DEFAULT '1',
  `updated_at` timestamp NULL DEFAULT NULL,
  `image_jackpot` varchar(255) DEFAULT NULL,
  `maintenance_mode` tinyint(4) DEFAULT '0',
  `withdrawal_limit` bigint(20) DEFAULT NULL,
  `withdrawal_period` varchar(30) DEFAULT NULL,
  `disable_spin` tinyint(1) NOT NULL DEFAULT '0',
  `perc_sub_lv1` bigint(20) NOT NULL DEFAULT '4',
  `perc_sub_lv2` bigint(20) NOT NULL DEFAULT '2',
  `perc_sub_lv3` bigint(20) NOT NULL DEFAULT '3',
  `disable_rollover` tinyint(4) DEFAULT '0',
  `rollover_protection` bigint(20) NOT NULL DEFAULT '1',
  `cpa_baseline` decimal(10,2) DEFAULT NULL,
  `cpa_value` decimal(10,2) DEFAULT NULL,
  `cpa_percentage_baseline` varchar(14) DEFAULT NULL,
  `cpa_percentage_n1` varchar(14) DEFAULT NULL,
  `cpa_percentage_n2` varchar(14) DEFAULT NULL,
  `ezzepay_is_enable` tinyint(4) DEFAULT '0',
  `digitopay_is_enable` tinyint(4) NOT NULL DEFAULT '0',
  `default_gateway` varchar(191) NOT NULL DEFAULT 'digitopay',
  `image_cassino_sidebar` varchar(255) DEFAULT NULL,
  `image_favoritos_sidebar` varchar(255) DEFAULT NULL,
  `image_wallet_sidebar` varchar(255) DEFAULT NULL,
  `image_suporte_sidebar` varchar(255) DEFAULT NULL,
  `image_promotions_sidebar` varchar(255) DEFAULT NULL,
  `image_indique_sidebar` varchar(255) DEFAULT NULL,
  `image_home_bottom` varchar(255) DEFAULT NULL,
  `image_cassino_bottom` varchar(255) DEFAULT NULL,
  `image_deposito_bottom` varchar(255) DEFAULT NULL,
  `image_convidar_bottom` varchar(255) DEFAULT NULL,
  `image_wallet_bottom` varchar(255) DEFAULT NULL,
  `image_user_nav` varchar(255) DEFAULT NULL,
  `image_home_sidebar` varchar(255) DEFAULT NULL,
  `image_menu_nav` varchar(255) NOT NULL,
  `message_home_page` varchar(255) DEFAULT NULL,
  `valor_por_bau` decimal(10,0) DEFAULT NULL,
  `deposito_minimo_bau` decimal(10,0) DEFAULT NULL,
  `cirus_baseline` decimal(20,2) NOT NULL DEFAULT '20.00',
  `cirus_aposta` decimal(20,2) NOT NULL DEFAULT '20.00',
  `cirus_valor` decimal(20,2) NOT NULL DEFAULT '20.00',
  `icon_bt_1` varchar(255) DEFAULT NULL,
  `icon_bt_2` varchar(255) DEFAULT NULL,
  `icon_bt_3` varchar(255) DEFAULT NULL,
  `icon_bt_4` varchar(255) DEFAULT NULL,
  `icon_bt_5` varchar(255) DEFAULT NULL,
  `name_bt_1` varchar(255) DEFAULT NULL,
  `name_bt_2` varchar(255) DEFAULT NULL,
  `name_bt_3` varchar(255) DEFAULT NULL,
  `name_bt_4` varchar(255) DEFAULT NULL,
  `img_bg_1` varchar(255) DEFAULT NULL,
  `icon_bt_6` varchar(255) DEFAULT NULL,
  `icon_bt_7` varchar(255) DEFAULT NULL,
  `icon_bt_8` varchar(255) DEFAULT NULL,
  `icon_wt_1` varchar(255) DEFAULT NULL,
  `icon_wt_2` varchar(255) DEFAULT NULL,
  `icon_wt_3` varchar(255) DEFAULT NULL,
  `icon_wt_4` varchar(255) DEFAULT NULL,
  `icon_wt_5` varchar(255) DEFAULT NULL,
  `saldo_ini` decimal(10,2) DEFAULT NULL,
  `ezzebank_is_enable` tinyint(4) NOT NULL DEFAULT '0',
  `modal_pop_up` text NOT NULL,
  `img_modal_pop` varchar(255) DEFAULT NULL,
  `modal_active` tinyint(4) NOT NULL DEFAULT '0',
  `icon_wt_6` varchar(255) DEFAULT NULL,
  `icon_wt_7` varchar(255) DEFAULT NULL,
  `icon_wt_8` varchar(255) DEFAULT NULL,
  `software_loading` varchar(255) DEFAULT NULL,
  `image_home_bottom_hover` varchar(255) DEFAULT NULL,
  `image_cassino_bottom_hover` varchar(255) DEFAULT NULL,
  `image_deposito_bottom_hover` varchar(255) DEFAULT NULL,
  `image_convidar_bottom_hover` varchar(255) DEFAULT NULL,
  `image_wallet_bottom_hover` varchar(255) DEFAULT NULL,
  `icon_wt_9` varchar(255) DEFAULT NULL,
  `background_perfil_top` varchar(255) DEFAULT NULL,
  `sub_background_perfil_top` varchar(255) DEFAULT NULL,
  `icon_wt_10` varchar(255) DEFAULT NULL,
  `collum_games` varchar(255) NOT NULL DEFAULT '3',
  `disable_rollover_cadastro` tinyint(4) NOT NULL DEFAULT '0',
  `rollover_cadastro` bigint(20) DEFAULT NULL,
  `disable_deposit_min` tinyint(4) NOT NULL DEFAULT '0',
  `deposit_min_saque` decimal(10,2) NOT NULL DEFAULT '20.00',
  `icon_nav_bottom_left` varchar(255) DEFAULT NULL,
  `icon_nav_bottom_right` varchar(255) DEFAULT NULL,
  `icon_bottom_right` varchar(255) DEFAULT NULL,
  `icon_bottom_left` varchar(255) DEFAULT NULL,
  `icon_wt_11` varchar(255) NOT NULL,
  `icon_wt_12` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `settings`
--

INSERT INTO `settings` (`id`, `software_name`, `software_description`, `software_favicon`, `software_logo_white`, `software_logo_black`, `software_background`, `currency_code`, `decimal_format`, `currency_position`, `revshare_percentage`, `ngr_percent`, `soccer_percentage`, `prefix`, `storage`, `initial_bonus`, `min_deposit`, `max_deposit`, `min_withdrawal`, `max_withdrawal`, `rollover`, `rollover_deposit`, `suitpay_is_enable`, `stripe_is_enable`, `bspay_is_enable`, `sharkpay_is_enable`, `turn_on_football`, `revshare_reverse`, `bonus_vip`, `activate_vip_bonus`, `updated_at`, `image_jackpot`, `maintenance_mode`, `withdrawal_limit`, `withdrawal_period`, `disable_spin`, `perc_sub_lv1`, `perc_sub_lv2`, `perc_sub_lv3`, `disable_rollover`, `rollover_protection`, `cpa_baseline`, `cpa_value`, `cpa_percentage_baseline`, `cpa_percentage_n1`, `cpa_percentage_n2`, `ezzepay_is_enable`, `digitopay_is_enable`, `default_gateway`, `image_cassino_sidebar`, `image_favoritos_sidebar`, `image_wallet_sidebar`, `image_suporte_sidebar`, `image_promotions_sidebar`, `image_indique_sidebar`, `image_home_bottom`, `image_cassino_bottom`, `image_deposito_bottom`, `image_convidar_bottom`, `image_wallet_bottom`, `image_user_nav`, `image_home_sidebar`, `image_menu_nav`, `message_home_page`, `valor_por_bau`, `deposito_minimo_bau`, `cirus_baseline`, `cirus_aposta`, `cirus_valor`, `icon_bt_1`, `icon_bt_2`, `icon_bt_3`, `icon_bt_4`, `icon_bt_5`, `name_bt_1`, `name_bt_2`, `name_bt_3`, `name_bt_4`, `img_bg_1`, `icon_bt_6`, `icon_bt_7`, `icon_bt_8`, `icon_wt_1`, `icon_wt_2`, `icon_wt_3`, `icon_wt_4`, `icon_wt_5`, `saldo_ini`, `ezzebank_is_enable`, `modal_pop_up`, `img_modal_pop`, `modal_active`, `icon_wt_6`, `icon_wt_7`, `icon_wt_8`, `software_loading`, `image_home_bottom_hover`, `image_cassino_bottom_hover`, `image_deposito_bottom_hover`, `image_convidar_bottom_hover`, `image_wallet_bottom_hover`, `icon_wt_9`, `background_perfil_top`, `sub_background_perfil_top`, `icon_wt_10`, `collum_games`, `disable_rollover_cadastro`, `rollover_cadastro`, `disable_deposit_min`, `deposit_min_saque`, `icon_nav_bottom_left`, `icon_nav_bottom_right`, `icon_bottom_right`, `icon_bottom_left`, `icon_wt_11`, `icon_wt_12`) VALUES
(1, 'OndaGames Chinesa', 'A Plataforma é uma das mais renomadas empresas internacionais de operação de cassino online, oferecendo uma ampla variedade de jogos empolgantes,slots, pesca,   e muito mais. Estamos autorizados e regulamentados pelo governo de Curaçao, operando com a licença número Antillephone emitida para a 8048/JAZ. Passamos por todas as verificações', 'uploads/0Nrw17y58MFq2LfkxBX93qItnfz62aL061y7ukN8.png', 'uploads/1fDEBTWPsWJxihixvPAx0CQp6ebCRJgkOrUqpqnZ.png', 'uploads/GzskVI6W5ZsLmgF4db6Ze4KJi5UdpfGWHpssRfMA.png', '[]', 'BRL', 'dot', 'left', 0, 0, 30, 'R$', 'local', 0, 1.00, 5000.00, 0.10, 100000.00, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, '2025-06-17 08:46:09', '[]', 0, 1, 'daily', 0, 0, 0, 3, 0, 0, 0.00, 0.00, '0', '0', '0', 0, 0, 'bspay', 'uploads/9bWM9v18lbZDkhA5TzZaueDCN1y7tkbBWFKlrexR.png', '[]', '[]', 'uploads/tuXjot3sQj1rKYLu5pXo9YYcpbNaDAIVHPYwvJLK.png', 'uploads/1d8JBwgZKuurFiL7oruIpeVMBz8DHKFYuadhrdPX.png', 'uploads/U3pL0KWhJAUpNIyqMtcdMQ05sgmezinrXrSmBwDu.png', 'uploads/qdhMwEvq7Yq8i2yD1ndILmHC36h68VsbiYupJs1j.svg', 'uploads/ospfdCHkBD8IdbTLmiexUq5Wa2xcLtk1XELNiUB1.svg', 'uploads/7L2a2dZIJcA9kuz95tJ3csSYPZNSj6Vck3vN9vrn.svg', 'uploads/fHzJGn1PHpbdQDS6LieufUsmTeW5ug7o0tHzHqGN.svg', 'uploads/9EZXSfzqH2mZlltRq6mgMqju2ApLSkBV6BjT8Gtn.svg', 'uploads/2gG8djPHVaT6XIJp3b6eP8BEPsBnXr9s6qaSwlKt.png', 'uploads/iD1OmGAmetuS2vGWLn0gjglv6KhYnxeHm5tbqpxp.png', 'uploads/ofUYJv7r45o70XU7KLe6rs3DEJon8ElZ3LaPv2GL.svg', 'Descubra a maior rede de cassinos do mundo, onde prêmios abundantes e bônus incríveis esperam por você, além de um exclusivo sistema de baú repleto de surpresas!', 10, 40, 20.00, 20.00, 10.00, 'uploads/eWpQcgZGkbwrhrNfpW1BepDOrXEWzuh5BNV9HG4z.avif', 'uploads/P1XArH6s5KrOeeMcWgPRA8uQVQTme3zUaXSWI9pV.avif', 'uploads/f9T4FvH6AErXT6r6KLEOONqIz2DdjARvrEX6CXVL.avif', 'uploads/r5KZk1fSozvUAqydbCMjTFv7P8wVoxFS6RBoshlR.avif', 'uploads/IePIzRTDliX5izCkc9WEh6vEFWcQRv8Rs97Co7qH.gif', 'Agente', 'Promoção', 'Suporte ', 'VIP', '[]', 'uploads/ROAldU1n2TmQU2lHLZqryVFpyD7iboKo0Bi7FHqV.png', 'uploads/ZFixOMo4Kc8Vrl3rwdpOKcxDiqoUOv3skvmsrHoU.png', 'uploads/xgqf3MLF4tmK0WyVLfLsXx6i8KW5yCF4lGHCAQDH.png', 'uploads/Qiyn9YlysjqJM5U17RMOLD695PRVAdQTJ7XgJ8O9.svg', 'uploads/2oVzoknteK3xHq5YuUrPMZkFhPoLQDBXNdOUxs83.png', 'uploads/rJdeUxgW6bY7qKYb3ku6RhTRao5UJvfISIRfIVM4.png', 'uploads/J8ocr83jzVldYFkRkq8rRmpcUIq83jlaWUNTxhHJ.svg', 'uploads/Y6hZFJd1dIByO1nmVwSOzUbgjCTY7ifUMqeLZYMT.png', 0.00, 0, '<p><strong><em>🔥Bônus de Afiliado - Siga a Página Inicial🔥</em></strong></p><p>👍Convide um amigo e ganhe $10!<br>👍Site oficial<br>🎁Agente- Ganhe facilmente R$150.000 aqui!<br>🧧Basta se cadastrar como membro, e encaminhar o link&nbsp; com um clique; Recomende 1 pessoa recompensa: R$10; recomende 10 pessoas recompensa: R$100; até R$150.000. Quanto mais amigos você compartilhar, mais recompensas você ganha.</p>', '[]', 0, 'uploads/Bc1Wqa9x6jtnf1AVf5B7frPcdJNYkvW0TkdfWq06.png', 'uploads/CDG2tTQpHH8KcbE4CwmZRoNKSeeAPuEY77WlngtA.png', 'uploads/JZRM5vhj39h9cvgJfu0Dx3Ya5VnAAIoIzXR1qhK7.png', 'uploads/8NA5ECVploDZfLwnGgU7laUCPlFW6EBY3Yp6OwRz.png', 'uploads/vBoHY3owgwzCW31ezuONE8aVZfkkFr6fAAZA2B87.svg', 'uploads/vrIDdiLW7gNNVeFnzfBDIVmAyuVvFl3EtQ83ZT0Y.svg', 'uploads/H6IUPuiUEUNTISAD3nkgc5A1SDGU8dqS2AbWFUOo.svg', 'uploads/1WkYasTrG4PdEm5hKJm9IRsyN6pXdQWnt20akdwS.svg', 'uploads/plNldCNUtyK0ItPfLJPeyaGV1CuJTzLk90zxI5uI.svg', 'uploads/cGrpmlvN14RcMGkTLSl6IGOshvYOxrax4BpdEWdr.png', '[]', '[]', 'uploads/QM2IQ543MZ0Kv1NYfv9klTXH2fZw3L8h4Q5P7Ozk.png', '4', 0, 10, 1, 20.00, '[]', '[]', '[]', '[]', 'uploads/0L9SBgPB2joXntkYO435y1riw1XrFKudHTRGLeHV.png', 'uploads/ewEFTyFOjNme1LOI9v1fCcY3lRJRZMqCeBPJst9e.png');

-- --------------------------------------------------------

--
-- Estrutura para tabela `setting_mails`
--

CREATE TABLE `setting_mails` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `software_smtp_type` varchar(30) DEFAULT NULL,
  `software_smtp_mail_host` varchar(100) DEFAULT NULL,
  `software_smtp_mail_port` varchar(30) DEFAULT NULL,
  `software_smtp_mail_username` varchar(191) DEFAULT NULL,
  `software_smtp_mail_password` varchar(100) DEFAULT NULL,
  `software_smtp_mail_encryption` varchar(30) DEFAULT NULL,
  `software_smtp_mail_from_address` varchar(191) DEFAULT NULL,
  `software_smtp_mail_from_name` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `setting_mails`
--

INSERT INTO `setting_mails` (`id`, `software_smtp_type`, `software_smtp_mail_host`, `software_smtp_mail_port`, `software_smtp_mail_username`, `software_smtp_mail_password`, `software_smtp_mail_encryption`, `software_smtp_mail_from_address`, `software_smtp_mail_from_name`, `created_at`, `updated_at`) VALUES
(1, '', '', '', '', '', '', '', '', '2024-03-16 16:32:46', '2024-08-28 01:35:14');

-- --------------------------------------------------------

--
-- Estrutura para tabela `slider_texts`
--

CREATE TABLE `slider_texts` (
  `id` int(11) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `slider_texts`
--

INSERT INTO `slider_texts` (`id`, `message`, `created_at`, `updated_at`) VALUES
(1, '🔥Convide um amigo e ganhe 10$💰', '2024-08-19 19:07:33', '2025-03-23 00:55:48'),
(3, 'I Você ganha convidando e jogando!', '2025-02-17 19:48:49', '2025-02-17 23:49:06');

-- --------------------------------------------------------

--
-- Estrutura para tabela `sub_affiliates`
--

CREATE TABLE `sub_affiliates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `affiliate_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `status` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Estrutura para tabela `suit_pay_payments`
--

CREATE TABLE `suit_pay_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment_id` varchar(191) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `withdrawal_id` bigint(20) UNSIGNED NOT NULL,
  `pix_key` varchar(191) DEFAULT NULL,
  `pix_type` varchar(50) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `observation` text,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `system_wallets`
--

CREATE TABLE `system_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `label` char(32) NOT NULL,
  `balance` decimal(27,12) NOT NULL DEFAULT '0.000000000000',
  `balance_min` decimal(27,12) NOT NULL DEFAULT '10000.100000000000',
  `pay_upto_percentage` decimal(4,2) NOT NULL DEFAULT '45.00',
  `mode` enum('balance_min','percentage') NOT NULL DEFAULT 'percentage',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 ROW_FORMAT=FIXED;

--
-- Despejando dados para a tabela `system_wallets`
--

INSERT INTO `system_wallets` (`id`, `label`, `balance`, `balance_min`, `pay_upto_percentage`, `mode`, `created_at`, `updated_at`) VALUES
(1, 'system', 261.800000000000, 10000.100000000000, 45.00, 'percentage', '2023-10-11 16:11:15', '2023-10-16 18:42:00');

-- --------------------------------------------------------

--
-- Estrutura para tabela `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment_id` varchar(100) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `payment_method` varchar(191) DEFAULT NULL,
  `price` decimal(20,2) NOT NULL DEFAULT '0.00',
  `currency` varchar(20) NOT NULL DEFAULT 'usd',
  `status` tinyint(4) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `reference` varchar(191) DEFAULT NULL,
  `accept_bonus` tinyint(1) NOT NULL DEFAULT '1',
  `token` varchar(32) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `transactions`
--

INSERT INTO `transactions` (`id`, `payment_id`, `user_id`, `payment_method`, `price`, `currency`, `status`, `created_at`, `updated_at`, `reference`, `accept_bonus`, `token`) VALUES
(1, 'efc85d75bacc65c67f4a559e93a4jzc90', 1, 'pix', 10.00, 'BRL', 0, '2025-06-17 02:22:59', '2025-06-17 02:22:59', NULL, 1, '8d20ff58e063ae9b74f46e89e6b8bf4a'),
(2, 'ed85b7084054221d3fda3633ae9q5emwa', 1, 'pix', 10.00, 'BRL', 0, '2025-06-17 02:24:34', '2025-06-17 02:24:34', NULL, 1, 'ac7a502d53243278c397df3c2e300612'),
(3, 'e85c30d85da93e66cf6ae02beec4fwxht', 1, 'pix', 10.00, 'BRL', 0, '2025-06-17 02:29:40', '2025-06-17 02:29:40', NULL, 1, '5c83348b6009df55ff609c887675a338'),
(4, 'e24da0d80aaf08e4d5b8071ba721ofrv5', 1, 'pix', 10.00, 'BRL', 0, '2025-06-17 02:38:15', '2025-06-17 02:38:15', NULL, 1, '11f72d7020c9aa49fc31e7ac3d267a65'),
(5, 'e2cddd6378caa68a9e987e6db58eonw6l', 1, 'pix', 10.00, 'BRL', 0, '2025-06-17 02:39:01', '2025-06-17 02:39:01', NULL, 1, 'e10bdeae84ab2c66832490c8f942c7e8'),
(6, 'e6728a093ed81119a9cbb5053b6qfbxmg', 1, 'pix', 10.00, 'BRL', 0, '2025-06-17 02:48:02', '2025-06-17 02:48:02', NULL, 1, '3d87b5f95bd229e5d507503e65a04ab2'),
(7, 'e286c19c84d8bcb54521a3c9a9dbaf345', 1, 'pix', 10.00, 'BRL', 0, '2025-06-17 02:52:19', '2025-06-17 02:52:19', NULL, 1, '38310355fd181f8263619e48c08af615'),
(8, 'e5decad96b561cee81819aa3e08c8b2om', 1, 'pix', 10.00, 'BRL', 0, '2025-06-17 02:53:27', '2025-06-17 02:53:27', NULL, 1, 'e30b7eb0fc21d8d639f6c08856cec924'),
(9, 'e905399600a0b6784cebc6f67d3df6nz7', 1, 'pix', 10.00, 'BRL', 0, '2025-06-17 02:54:30', '2025-06-17 02:54:30', NULL, 1, '98fd2567abb95b256abe8eee79dfded5'),
(10, 'ea95d143a274de621d6fb41cd69u4xh8q', 1, 'pix', 10.00, 'BRL', 0, '2025-06-17 03:00:29', '2025-06-17 03:00:29', NULL, 1, '5848b9a19152785aa3e9eef54af258ea'),
(11, 'eee18c8c04d0bc025b7abe3fc8cg9n5pq', 1, 'pix', 0.10, 'BRL', 0, '2025-06-17 03:06:40', '2025-06-17 03:06:40', NULL, 1, 'bbd14cde018c5456591f612dbe788922'),
(12, 'e6294a81b7fdde049a17cd26c8bpb5vmq', 1, 'pix', 0.10, 'BRL', 0, '2025-06-17 03:09:43', '2025-06-17 03:09:43', NULL, 1, '657f9c985adf19d1c2d387548364bf01'),
(13, 'brmp_6851085985335', 1, 'pix', 0.10, 'BRL', 0, '2025-06-17 03:17:00', '2025-06-17 03:17:00', NULL, 1, 'da22d1937319fb3ad580c348a8bab8cc'),
(14, 'brmp_6851088f86eb8', 1, 'pix', 0.20, 'BRL', 0, '2025-06-17 03:17:53', '2025-06-17 03:17:53', NULL, 1, 'dae5de31232e1c6fd17cb3c56623bcd2'),
(15, 'e4e5301696d99fd117474754104uskctj', 1, 'pix', 0.15, 'BRL', 0, '2025-06-17 03:21:07', '2025-06-17 03:21:07', NULL, 1, '2f75b9616ffd04d25c832da0a2f7d54b'),
(16, 'e87cdfd9610eb23e4597187a0f1lqfjn3', 1, 'pix', 0.10, 'BRL', 0, '2025-06-17 03:24:27', '2025-06-17 03:24:27', NULL, 1, '12ead3f55421c44f236a2f949fcd0287'),
(17, 'ead95afd246f5b191429b3089bevkbf79', 1, 'pix', 0.20, 'BRL', 0, '2025-06-17 03:28:36', '2025-06-17 03:28:36', NULL, 1, '4e83a1cbbb763885d3f6dc03fb38a4d0'),
(18, 'e59b388d602663e9f68c66aa5c20oe6wx', 1, 'pix', 0.50, 'BRL', 0, '2025-06-17 03:32:12', '2025-06-17 03:32:12', NULL, 1, 'e544669be03dd68c44d674cb4dbda5f0'),
(19, 'e47bf51eb82fd015ffb9e0508964r713s', 1, 'pix', 0.10, 'BRL', 0, '2025-06-17 03:38:53', '2025-06-17 03:38:53', NULL, 1, '0be95f0b0b376f51174698aa060fda53'),
(20, 'e494ac12b648a1368f3a822592b0fc8h9', 1, 'pix', 0.11, 'BRL', 0, '2025-06-17 03:40:45', '2025-06-17 03:40:45', NULL, 1, '45651cfce707503d79dd41d2b4465269'),
(21, 'edfbe47235e3afe48b830957c5atyf59i', 1, 'pix', 0.10, 'BRL', 0, '2025-06-17 03:45:36', '2025-06-17 03:45:36', '68510f0e85b72', 1, 'dc32757d339041122894995c217f7da3'),
(22, 'e357efc57fc07506e1b175a9e7d2prtye', 1, 'pix', 0.12, 'BRL', 0, '2025-06-17 03:46:41', '2025-06-17 03:46:41', NULL, 1, '127a25447d4a00365722f5ff050a8b68'),
(23, '685110823d087', 1, 'pix', 0.10, 'BRL', 1, '2025-06-17 03:51:48', '2025-06-17 03:52:07', NULL, 1, '6a445e0b45a263057a01a2f1d22f5348'),
(24, '685133891d317', 1, 'pix', 10.00, 'BRL', 0, '2025-06-17 06:21:14', '2025-06-17 06:21:14', NULL, 1, '4de02500ea1a8347f2d58aabac53e88d'),
(25, '685134a975a4b', 1, 'pix', 10.00, 'BRL', 1, '2025-06-17 06:26:02', '2025-06-17 06:26:35', NULL, 1, '0b2f69ff76e094505d09be0d376c5db3'),
(26, '6851362a21967', 1, 'pix', 0.10, 'BRL', 1, '2025-06-17 06:32:27', '2025-06-17 06:32:53', NULL, 1, '1582bb3bd18beafb13e2a734cd2df476'),
(27, '6851369b3c0d1', 1, 'pix', 0.15, 'BRL', 1, '2025-06-17 06:34:20', '2025-06-17 06:34:41', NULL, 1, 'c15c94997a26615e19461ee5634a6d0c'),
(28, '685137f66b006', 1, 'pix', 0.10, 'BRL', 1, '2025-06-17 06:40:08', '2025-06-17 06:40:31', NULL, 1, '8e84f071dfc021e65f45482f4f2357ac'),
(29, '68514f37d8638', 1, 'pix', 0.10, 'BRL', 0, '2025-06-17 08:19:21', '2025-06-17 08:19:21', NULL, 1, 'fd5a2b17f44d6f8b0442d24bc61d7c33');

-- --------------------------------------------------------

--
-- Estrutura para tabela `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `oauth_id` varchar(191) DEFAULT NULL,
  `oauth_type` varchar(191) DEFAULT NULL,
  `avatar` varchar(191) DEFAULT 'uploads/bored_ape.png',
  `last_name` varchar(191) DEFAULT NULL,
  `cpf` varchar(20) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `logged_in` tinyint(4) NOT NULL DEFAULT '0',
  `banned` tinyint(4) NOT NULL DEFAULT '0',
  `inviter` int(11) DEFAULT NULL,
  `inviter_code` varchar(25) DEFAULT NULL,
  `affiliate_revenue_share` bigint(20) NOT NULL DEFAULT '2',
  `affiliate_revenue_share_fake` bigint(20) DEFAULT NULL,
  `affiliate_cpa` decimal(20,2) NOT NULL DEFAULT '10.00',
  `affiliate_bau_baseline` decimal(20,2) NOT NULL DEFAULT '20.00',
  `affiliate_bau_value` decimal(20,2) NOT NULL DEFAULT '20.00',
  `affiliate_bau_aposta` decimal(20,2) NOT NULL DEFAULT '20.00',
  `affiliate_baseline` decimal(20,2) NOT NULL DEFAULT '40.00',
  `is_demo_agent` tinyint(4) NOT NULL DEFAULT '0',
  `status` varchar(50) NOT NULL DEFAULT 'active',
  `language` varchar(191) NOT NULL DEFAULT 'pt_BR',
  `role_id` int(11) DEFAULT '3',
  `influencer_mode` tinyint(4) NOT NULL DEFAULT '0',
  `facebook_id` varchar(191) NOT NULL,
  `whatsapp_id` varchar(191) NOT NULL,
  `telegram_id` varchar(191) NOT NULL,
  `aniversario` varchar(191) NOT NULL,
  `utilizou_bonus_cadastro` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `oauth_id`, `oauth_type`, `avatar`, `last_name`, `cpf`, `phone`, `logged_in`, `banned`, `inviter`, `inviter_code`, `affiliate_revenue_share`, `affiliate_revenue_share_fake`, `affiliate_cpa`, `affiliate_bau_baseline`, `affiliate_bau_value`, `affiliate_bau_aposta`, `affiliate_baseline`, `is_demo_agent`, `status`, `language`, `role_id`, `influencer_mode`, `facebook_id`, `whatsapp_id`, `telegram_id`, `aniversario`, `utilizou_bonus_cadastro`) VALUES
(1, 'admin', 'ondagames@hotmail.com', NULL, '$2y$10$R8Og5ccYm1Uu599USAGv/uBHUYSIdmjdkdfg7GYfRetto5MpykgW.', 'XZU4JIG58ELNuFiysQwMY6lmbUOY9kzd1LV1CScwPkEGkE0INSwTe6lDx8wl', '2023-11-07 22:15:13', '2025-04-21 00:56:42', NULL, NULL, 'uploads/DfruePLVywlMdODCBE1qfCMqYmHRvclfIGGdNFpn.jpg', NULL, '213.209.940-59', '400028922', 0, 0, NULL, 'SV5PVHU9UH', 12, 1, 10.00, 20.00, 20.00, 20.00, 40.00, 0, 'active', 'pt_BR', 1, 1, '', '', '', '', 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `vips`
--

CREATE TABLE `vips` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bet_symbol` varchar(255) NOT NULL,
  `bet_level` bigint(20) NOT NULL DEFAULT '1',
  `bet_required` bigint(20) DEFAULT NULL,
  `bet_period` varchar(191) DEFAULT NULL,
  `bet_bonus` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `vips`
--

INSERT INTO `vips` (`id`, `bet_symbol`, `bet_level`, `bet_required`, `bet_period`, `bet_bonus`, `created_at`, `updated_at`) VALUES
(7, '01J3FPQDA60S47G47M4TGQCW9V.png', 2, 1000, NULL, 5, '2024-07-23 11:48:16', '2024-07-23 11:48:16'),
(6, '01J3FPPWWR1XY0M7H9T1Z4EJHF.png', 1, 500, NULL, 2, '2024-07-23 11:47:59', '2024-07-23 11:47:59'),
(8, '01J3FPQYYV5WH02YK9ZZ29TM2H.png', 3, 2000, NULL, 15, '2024-07-23 11:48:34', '2024-07-23 11:48:34'),
(9, '01J3FPS6E1CHPBT0G9XK3APQAP.png', 4, 5000, NULL, 20, '2024-07-23 11:49:14', '2024-07-23 11:49:14'),
(10, '01J3FPSSFSXBNVPXX724Y6EYK5.png', 5, 10000, NULL, 30, '2024-07-23 11:49:34', '2024-07-23 11:49:34'),
(11, '01J3FPTC37N4RHTR26AKTW29S6.png', 6, 25000, NULL, 50, '2024-07-23 11:49:53', '2024-07-23 11:49:53'),
(12, '01J3FPTVE860R6EST315TJKNJ7.png', 7, 50000, NULL, 100, '2024-07-23 11:50:09', '2024-07-23 11:50:09'),
(13, '01J3FPVMX8W8N50M6J1DN4M3Y4.png', 8, 100000, NULL, 150, '2024-07-23 11:50:35', '2024-07-23 11:50:35');

-- --------------------------------------------------------

--
-- Estrutura para tabela `vip_users`
--

CREATE TABLE `vip_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `vip_id` int(10) UNSIGNED NOT NULL,
  `level` bigint(20) NOT NULL,
  `points` bigint(20) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 ROW_FORMAT=FIXED;

--
-- Despejando dados para a tabela `vip_users`
--

INSERT INTO `vip_users` (`id`, `user_id`, `vip_id`, `level`, `points`, `status`, `created_at`, `updated_at`) VALUES
(1, 123, 6, 1, 0, 1, '2025-03-22 00:26:35', '2025-03-22 00:26:35'),
(2, 123, 7, 2, 0, 1, '2025-03-30 15:38:33', '2025-03-30 15:38:33'),
(3, 123, 8, 3, 0, 1, '2025-03-30 15:38:33', '2025-03-30 15:38:33'),
(4, 123, 9, 4, 0, 1, '2025-03-30 15:38:33', '2025-03-30 15:38:33'),
(5, 123, 10, 5, 0, 1, '2025-03-30 15:38:33', '2025-03-30 15:38:33'),
(6, 123, 11, 6, 0, 1, '2025-03-30 15:38:33', '2025-03-30 15:38:33'),
(7, 123, 12, 7, 0, 1, '2025-03-30 15:38:33', '2025-03-30 15:38:33'),
(8, 1, 6, 1, 0, 1, '2025-06-17 07:25:05', '2025-06-17 07:25:05');

-- --------------------------------------------------------

--
-- Estrutura para tabela `wallets`
--

CREATE TABLE `wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `currency` varchar(20) NOT NULL,
  `symbol` varchar(5) NOT NULL,
  `balance` decimal(20,2) NOT NULL DEFAULT '0.00',
  `balance_bonus_rollover` decimal(10,2) DEFAULT '0.00',
  `balance_deposit_rollover` decimal(10,2) DEFAULT '0.00',
  `balance_withdrawal` decimal(10,2) DEFAULT '0.00',
  `balance_bonus` decimal(20,2) NOT NULL DEFAULT '0.00',
  `balance_cryptocurrency` decimal(20,8) NOT NULL DEFAULT '0.00000000',
  `balance_demo` decimal(20,8) DEFAULT '1.00000000',
  `refer_rewards` decimal(20,2) NOT NULL DEFAULT '0.00',
  `hide_balance` tinyint(1) NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total_bet` decimal(20,2) NOT NULL DEFAULT '0.00',
  `total_won` bigint(20) NOT NULL DEFAULT '0',
  `total_lose` bigint(20) NOT NULL DEFAULT '0',
  `last_won` bigint(20) NOT NULL DEFAULT '0',
  `last_lose` bigint(20) NOT NULL DEFAULT '0',
  `vip_level` bigint(20) DEFAULT '0',
  `vip_points` bigint(20) DEFAULT '0',
  `vip_wallet` decimal(20,2) DEFAULT '0.00',
  `mission_deposit_wallet` decimal(20,2) NOT NULL DEFAULT '0.00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `wallets`
--

INSERT INTO `wallets` (`id`, `user_id`, `currency`, `symbol`, `balance`, `balance_bonus_rollover`, `balance_deposit_rollover`, `balance_withdrawal`, `balance_bonus`, `balance_cryptocurrency`, `balance_demo`, `refer_rewards`, `hide_balance`, `active`, `created_at`, `updated_at`, `total_bet`, `total_won`, `total_lose`, `last_won`, `last_lose`, `vip_level`, `vip_points`, `vip_wallet`, `mission_deposit_wallet`) VALUES
(1, 1, 'BRL', 'R$', 0.25, 0.00, 10.45, 4.90, 0.00, 0.00000000, 1.00000000, 0.00, 0, 1, '2024-12-17 01:04:00', '2025-06-17 08:56:01', 0.00, 0, 0, 0, 0, 1, 0, 0.00, 0.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `wallet_changes`
--

CREATE TABLE `wallet_changes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reason` varchar(100) DEFAULT NULL,
  `change` varchar(50) DEFAULT NULL,
  `value_bonus` decimal(20,2) NOT NULL DEFAULT '0.00',
  `value_total` decimal(20,2) NOT NULL DEFAULT '0.00',
  `value_roi` decimal(20,2) NOT NULL DEFAULT '0.00',
  `value_entry` decimal(20,2) NOT NULL DEFAULT '0.00',
  `refer_rewards` decimal(20,2) NOT NULL DEFAULT '0.00',
  `game` varchar(191) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `websockets_statistics_entries`
--

CREATE TABLE `websockets_statistics_entries` (
  `id` int(10) UNSIGNED NOT NULL,
  `app_id` varchar(191) NOT NULL,
  `peak_connection_count` int(11) NOT NULL,
  `websocket_message_count` int(11) NOT NULL,
  `api_message_count` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `withdrawals`
--

CREATE TABLE `withdrawals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment_id` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(20,2) NOT NULL DEFAULT '0.00',
  `type` varchar(191) DEFAULT NULL,
  `proof` varchar(191) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `cpf` varchar(14) DEFAULT NULL,
  `pix_key` varchar(191) DEFAULT NULL,
  `pix_type` varchar(191) DEFAULT NULL,
  `bank_info` text,
  `currency` varchar(50) DEFAULT NULL,
  `symbol` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `account_withdraws`
--
ALTER TABLE `account_withdraws`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `affiliate_histories`
--
ALTER TABLE `affiliate_histories`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `affiliate_histories_user_id_index` (`user_id`) USING BTREE,
  ADD KEY `affiliate_histories_inviter_index` (`inviter`) USING BTREE;

--
-- Índices de tabela `affiliate_withdraws`
--
ALTER TABLE `affiliate_withdraws`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `affiliate_withdraws_user_id_foreign` (`user_id`) USING BTREE;

--
-- Índices de tabela `aprove_save_settings`
--
ALTER TABLE `aprove_save_settings`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `aprove_withdrawals`
--
ALTER TABLE `aprove_withdrawals`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `baus`
--
ALTER TABLE `baus`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `bs_pay_payments`
--
ALTER TABLE `bs_pay_payments`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `casino_categories_slug_unique` (`slug`) USING BTREE;

--
-- Índices de tabela `category_game`
--
ALTER TABLE `category_game`
  ADD KEY `category_games_category_id_foreign` (`category_id`) USING BTREE,
  ADD KEY `category_games_game_id_foreign` (`game_id`) USING BTREE;

--
-- Índices de tabela `configs_playfiver`
--
ALTER TABLE `configs_playfiver`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `currency_alloweds`
--
ALTER TABLE `currency_alloweds`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `currency_alloweds_currency_id_foreign` (`currency_id`) USING BTREE;

--
-- Índices de tabela `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `deposits_user_id_foreign` (`user_id`) USING BTREE;

--
-- Índices de tabela `eventos_plataforma`
--
ALTER TABLE `eventos_plataforma`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`) USING BTREE;

--
-- Índices de tabela `games`
--
ALTER TABLE `games`
  ADD PRIMARY KEY (`id`),
  ADD KEY `games_provider_id_index` (`provider_id`),
  ADD KEY `games_game_code_index` (`game_code`);

--
-- Índices de tabela `games_keys`
--
ALTER TABLE `games_keys`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `game_favorites`
--
ALTER TABLE `game_favorites`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `game_favorites_user_id_game_id_unique` (`user_id`,`game_id`) USING BTREE,
  ADD KEY `game_favorites_game_id_foreign` (`game_id`) USING BTREE;

--
-- Índices de tabela `game_likes`
--
ALTER TABLE `game_likes`
  ADD UNIQUE KEY `game_likes_user_id_game_id_unique` (`user_id`,`game_id`) USING BTREE,
  ADD KEY `game_likes_game_id_foreign` (`game_id`) USING BTREE;

--
-- Índices de tabela `game_reviews`
--
ALTER TABLE `game_reviews`
  ADD UNIQUE KEY `game_reviews_user_id_game_id_unique` (`user_id`,`game_id`) USING BTREE,
  ADD KEY `game_reviews_game_id_foreign` (`game_id`) USING BTREE;

--
-- Índices de tabela `gateways`
--
ALTER TABLE `gateways`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `ggds_spin_config`
--
ALTER TABLE `ggds_spin_config`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `ggds_spin_runs`
--
ALTER TABLE `ggds_spin_runs`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `ggr_games`
--
ALTER TABLE `ggr_games`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `ggr_games_fivers_user_id_index` (`user_id`) USING BTREE;

--
-- Índices de tabela `ggr_games_drakon`
--
ALTER TABLE `ggr_games_drakon`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `ggr_games_world_slots`
--
ALTER TABLE `ggr_games_world_slots`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `ggr_games_world_slots_user_id_index` (`user_id`) USING BTREE;

--
-- Índices de tabela `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `likes_user_id_foreign` (`user_id`) USING BTREE,
  ADD KEY `likes_liked_user_id_foreign` (`liked_user_id`) USING BTREE;

--
-- Índices de tabela `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `missions`
--
ALTER TABLE `missions`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `mission_deposit`
--
ALTER TABLE `mission_deposit`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `mission_deposit_user`
--
ALTER TABLE `mission_deposit_user`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `mission_users`
--
ALTER TABLE `mission_users`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `mission_users_user_id_index` (`user_id`) USING BTREE,
  ADD KEY `mission_users_mission_id_index` (`mission_id`) USING BTREE;

--
-- Índices de tabela `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`) USING BTREE,
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`) USING BTREE;

--
-- Índices de tabela `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`) USING BTREE,
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`) USING BTREE;

--
-- Índices de tabela `music`
--
ALTER TABLE `music`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`) USING BTREE;

--
-- Índices de tabela `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `orders_user_id_foreign` (`user_id`) USING BTREE;

--
-- Índices de tabela `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`) USING BTREE;

--
-- Índices de tabela `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`) USING BTREE;

--
-- Índices de tabela `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`) USING BTREE,
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`) USING BTREE;

--
-- Índices de tabela `post_notifications`
--
ALTER TABLE `post_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `providers`
--
ALTER TABLE `providers`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`) USING BTREE;

--
-- Índices de tabela `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`) USING BTREE,
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`) USING BTREE;

--
-- Índices de tabela `sen_saques`
--
ALTER TABLE `sen_saques`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `setting_mails`
--
ALTER TABLE `setting_mails`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `slider_texts`
--
ALTER TABLE `slider_texts`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `sub_affiliates`
--
ALTER TABLE `sub_affiliates`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `sub_affiliates_affiliate_id_index` (`affiliate_id`) USING BTREE,
  ADD KEY `sub_affiliates_user_id_index` (`user_id`) USING BTREE;

--
-- Índices de tabela `suit_pay_payments`
--
ALTER TABLE `suit_pay_payments`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `suit_pay_payments_user_id_foreign` (`user_id`) USING BTREE,
  ADD KEY `suit_pay_payments_withdrawal_id_foreign` (`withdrawal_id`) USING BTREE;

--
-- Índices de tabela `system_wallets`
--
ALTER TABLE `system_wallets`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `transactions_user_id_index` (`user_id`) USING BTREE;

--
-- Índices de tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `users_email_unique` (`email`) USING BTREE;

--
-- Índices de tabela `vips`
--
ALTER TABLE `vips`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `vip_users`
--
ALTER TABLE `vip_users`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `vip_users_user_id_index` (`user_id`) USING BTREE,
  ADD KEY `vip_users_vip_id_index` (`vip_id`) USING BTREE;

--
-- Índices de tabela `wallets`
--
ALTER TABLE `wallets`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `wallets_user_id_index` (`user_id`) USING BTREE;

--
-- Índices de tabela `wallet_changes`
--
ALTER TABLE `wallet_changes`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `wallet_changes_user_id_foreign` (`user_id`) USING BTREE;

--
-- Índices de tabela `websockets_statistics_entries`
--
ALTER TABLE `websockets_statistics_entries`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `withdrawals`
--
ALTER TABLE `withdrawals`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `withdrawals_user_id_foreign` (`user_id`) USING BTREE;

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `account_withdraws`
--
ALTER TABLE `account_withdraws`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de tabela `affiliate_histories`
--
ALTER TABLE `affiliate_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT de tabela `affiliate_withdraws`
--
ALTER TABLE `affiliate_withdraws`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `aprove_withdrawals`
--
ALTER TABLE `aprove_withdrawals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT de tabela `baus`
--
ALTER TABLE `baus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT de tabela `bs_pay_payments`
--
ALTER TABLE `bs_pay_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT de tabela `configs_playfiver`
--
ALTER TABLE `configs_playfiver`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de tabela `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT de tabela `currency_alloweds`
--
ALTER TABLE `currency_alloweds`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=190;

--
-- AUTO_INCREMENT de tabela `eventos_plataforma`
--
ALTER TABLE `eventos_plataforma`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `games`
--
ALTER TABLE `games`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1449;

--
-- AUTO_INCREMENT de tabela `games_keys`
--
ALTER TABLE `games_keys`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `game_favorites`
--
ALTER TABLE `game_favorites`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `gateways`
--
ALTER TABLE `gateways`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `ggds_spin_config`
--
ALTER TABLE `ggds_spin_config`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `ggds_spin_runs`
--
ALTER TABLE `ggds_spin_runs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `ggr_games`
--
ALTER TABLE `ggr_games`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=948;

--
-- AUTO_INCREMENT de tabela `ggr_games_drakon`
--
ALTER TABLE `ggr_games_drakon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `ggr_games_world_slots`
--
ALTER TABLE `ggr_games_world_slots`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `likes`
--
ALTER TABLE `likes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT de tabela `missions`
--
ALTER TABLE `missions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `mission_deposit`
--
ALTER TABLE `mission_deposit`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `mission_deposit_user`
--
ALTER TABLE `mission_deposit_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1639;

--
-- AUTO_INCREMENT de tabela `mission_users`
--
ALTER TABLE `mission_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `music`
--
ALTER TABLE `music`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- AUTO_INCREMENT de tabela `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT de tabela `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `post_notifications`
--
ALTER TABLE `post_notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `providers`
--
ALTER TABLE `providers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de tabela `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `sen_saques`
--
ALTER TABLE `sen_saques`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT de tabela `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `setting_mails`
--
ALTER TABLE `setting_mails`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `slider_texts`
--
ALTER TABLE `slider_texts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `sub_affiliates`
--
ALTER TABLE `sub_affiliates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `suit_pay_payments`
--
ALTER TABLE `suit_pay_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `system_wallets`
--
ALTER TABLE `system_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=170;

--
-- AUTO_INCREMENT de tabela `vips`
--
ALTER TABLE `vips`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de tabela `vip_users`
--
ALTER TABLE `vip_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `wallets`
--
ALTER TABLE `wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=169;

--
-- AUTO_INCREMENT de tabela `wallet_changes`
--
ALTER TABLE `wallet_changes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `websockets_statistics_entries`
--
ALTER TABLE `websockets_statistics_entries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `withdrawals`
--
ALTER TABLE `withdrawals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
