-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Czas generowania: 15 Lut 2017, 14:22
-- Wersja serwera: 10.1.16-MariaDB
-- Wersja PHP: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `pai`
--

DELIMITER $$
--
-- Procedury
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `dodaj` ()  NO SQL
SELECT "hello from proc"$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `puser` (IN `uId` INT)  NO SQL
SELECT `user_name`,`user_surname` FROM user where id_user_pk = uId$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `address`
--

CREATE TABLE `address` (
  `ID_ADDRESS_PK` int(4) NOT NULL,
  `ID_CITY_FK` int(4) NOT NULL,
  `ID_USER_FK` int(4) NOT NULL,
  `ADDRESS_STREET` varchar(30) COLLATE utf8_bin NOT NULL,
  `ADDRESS_STREET_NUMBER` varchar(5) COLLATE utf8_bin NOT NULL,
  `ADDRESS_POSTAL_CODE` varchar(6) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin
PARTITION BY RANGE (ID_ADDRESS_PK)
(
PARTITION p0 VALUES LESS THAN (100)ENGINE=InnoDB,
PARTITION p1 VALUES LESS THAN (200)ENGINE=InnoDB,
PARTITION p2 VALUES LESS THAN (300)ENGINE=InnoDB,
PARTITION p3 VALUES LESS THAN MAXVALUEENGINE=InnoDB
)
);

--
-- Zrzut danych tabeli `address`
--

INSERT INTO `address` (`ID_ADDRESS_PK`, `ID_CITY_FK`, `ID_USER_FK`, `ADDRESS_STREET`, `ADDRESS_STREET_NUMBER`, `ADDRESS_POSTAL_CODE`) VALUES
(1, 1, 1, 'Krakowska', '1', '34-120'),
(2, 2, 2, 'Kolejowa', '2', '34-100'),
(3, 4, 3, 'Lwowska', '4', '34-100'),
(4, 5, 4, 'Andersa', '5', '34-300');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `arch_users`
--

CREATE TABLE `arch_users` (
  `PersonID` int(4) DEFAULT NULL,
  `NAME` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `SURNAME` varchar(20) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Zrzut danych tabeli `arch_users`
--

INSERT INTO `arch_users` (`PersonID`, `NAME`, `SURNAME`) VALUES
(4, '', ''),
(7, 'a', 'b'),
(12, 'a', 'b'),
(1, 'Jan', 'Kowalski'),
(2, 'Ela', 'Kowalska'),
(3, 'Ala', 'Nowak'),
(5, '', ''),
(19, 'a', 'b'),
(20, 'Ula', 'PiÄ™kna'),
(22, 'J', 'K'),
(30, 'Kasia2', 'A2'),
(31, 'zxc', 'zxc'),
(33, 'p', 'p'),
(35, 'v', 'v'),
(36, 'v', 'v'),
(32, 'zxc', 'zxc'),
(34, 'p', 'p'),
(37, 'R', 'R'),
(24, 'krzy_s12@wp.pl', 'b'),
(39, 'aae', 'aae'),
(40, 'aa', 'aa'),
(28, 'Ola', 'M'),
(29, 'Kasia', 'A'),
(41, 'aa', 'aa'),
(25, 'Madzia', 'Niebieska'),
(54, 'y', 'y'),
(23, 'aA', 'Aa'),
(76, 'Kasia', 'nn'),
(85, 'bn', 'bn'),
(87, 'ty', 'ty'),
(88, 'sad', 'sad'),
(92, 'Klara', 'Lipiec'),
(100, 'Asia', 'N'),
(101, 'Basia', 'O'),
(104, '', ''),
(86, 'test', 'test'),
(91, 'Krzysztof', 'Stuglik'),
(107, 'A', 'B'),
(102, 'qwerty', 'asd'),
(103, 'Jan', 'Kowalski'),
(108, 'James', 'Bond'),
(109, 'Sherlock', 'Holmes'),
(110, 'Koala', 'MiÅ›'),
(113, 'Ultras', 'Super'),
(114, 'a', 'a'),
(116, 'zxczxc', 'zxczxc'),
(117, 'aaa', 'aaaaaa'),
(119, 'quake', 'quake'),
(120, 'Air', 'Air'),
(121, 'Jan', 'Kowalski'),
(40, 'Aleksandra', 'Chmura'),
(44, 'aa', 'aa'),
(48, 'Adam', 'Malysz'),
(49, 'imie', 'nazwisko'),
(59, 'imie', 'nazwisko');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `buy`
--

CREATE TABLE `buy` (
  `ID_BUY_PK` int(4) NOT NULL,
  `ID_PROPERTY_FK` int(4) NOT NULL,
  `ID_USER_FK` int(4) NOT NULL,
  `BUY_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `city`
--

CREATE TABLE `city` (
  `id_city_pk` int(4) NOT NULL,
  `city_title` varchar(30) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Zrzut danych tabeli `city`
--

INSERT INTO `city` (`id_city_pk`, `city_title`) VALUES
(1, 'Andrychow'),
(11, 'AndrychÃ³w'),
(2, 'Kalwaria Zebrzydowska'),
(3, 'Krakow'),
(4, 'Wadowice'),
(5, 'Zywiec');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `contact`
--

CREATE TABLE `contact` (
  `ID_CONTACT_PK` int(4) NOT NULL,
  `ID_USER_FK` int(4) NOT NULL,
  `CONTACT_EMAIL` varchar(30) COLLATE utf8_bin NOT NULL,
  `CONTACT_PHONE` varchar(11) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Zrzut danych tabeli `contact`
--

INSERT INTO `contact` (`ID_CONTACT_PK`, `ID_USER_FK`, `CONTACT_EMAIL`, `CONTACT_PHONE`) VALUES
(60, 3, 'nel@o2.pl', '123-123-123'),
(61, 2, 'test@o2.pl', '321-321-312'),
(80, 4, 'kowalski@o2.pl', '788-888-777'),
(81, 1, 'admin@mail.pl', '555-555-555'),
(103, 41, 'chmura@o2.pl', '444-444-444'),
(105, 43, 'wysocka@wp.pl', '433-334-434'),
(109, 47, 'miki@o2.pl', '112-222-222');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `image`
--

CREATE TABLE `image` (
  `ID_IMAGE_PK` int(4) NOT NULL,
  `ID_PROPERTY_FK` int(4) NOT NULL,
  `IMAGE_FILE` varchar(100) COLLATE utf8_bin NOT NULL,
  `IMAGE_TITLE` varchar(50) COLLATE utf8_bin NOT NULL,
  `IMAGE_SIZE` float(10,2) NOT NULL,
  `IMAGE_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Zrzut danych tabeli `image`
--

INSERT INTO `image` (`ID_IMAGE_PK`, `ID_PROPERTY_FK`, `IMAGE_FILE`, `IMAGE_TITLE`, `IMAGE_SIZE`, `IMAGE_TIME`) VALUES
(1, 1, '_upload/powuz_01.jpg', 'powuz_01.jpg', 218.16, '2017-02-13 10:10:57'),
(2, 1, '_upload/powuz_02.jpg', 'powuz_02.jpg', 186.75, '2017-02-13 10:10:58'),
(3, 4, '_upload/dom_04kopia.jpg', 'dom_04kopia.jpg', 301.75, '2017-02-15 11:16:09'),
(4, 4, '_upload/dom_04.jpg', 'dom_04.jpg', 301.75, '2017-02-15 11:16:09');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `localization`
--

CREATE TABLE `localization` (
  `ID_LOCALIZATION_PK` int(4) NOT NULL,
  `ID_CITY_FK` int(4) NOT NULL,
  `LOCALIZATION_STREET` varchar(30) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `LOCALIZATION_STREET_NUMBER` varchar(5) COLLATE utf8_bin NOT NULL,
  `LOCALIZATION_POSTAL_CODE` varchar(6) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Zrzut danych tabeli `localization`
--

INSERT INTO `localization` (`ID_LOCALIZATION_PK`, `ID_CITY_FK`, `LOCALIZATION_STREET`, `LOCALIZATION_STREET_NUMBER`, `LOCALIZATION_POSTAL_CODE`) VALUES
(65, 1, 'Krakowska', '22', '34-120'),
(66, 3, 'Karmelicka', '12', '00-000'),
(73, 4, 'Lwowska', '11', '12-345'),
(74, 4, 'Lwowska', '12', '12-122'),
(82, 0, 'KotarbiÅ„skiego', '8a', '34-120');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `logtable`
--

CREATE TABLE `logtable` (
  `id_logtable` int(4) NOT NULL,
  `logtable_ip` varchar(39) COLLATE utf8_bin NOT NULL,
  `logtable_web` varchar(200) COLLATE utf8_bin NOT NULL,
  `logtable_name` varchar(20) COLLATE utf8_bin NOT NULL,
  `logtable_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `logtable_result` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin
PARTITION BY RANGE (id_logtable)
(
PARTITION p0 VALUES LESS THAN (100)ENGINE=InnoDB,
PARTITION p1 VALUES LESS THAN (200)ENGINE=InnoDB,
PARTITION p2 VALUES LESS THAN (300)ENGINE=InnoDB,
PARTITION p3 VALUES LESS THAN MAXVALUEENGINE=InnoDB
)
);

--
-- Zrzut danych tabeli `logtable`
--

INSERT INTO `logtable` (`id_logtable`, `logtable_ip`, `logtable_web`, `logtable_name`, `logtable_time`, `logtable_result`) VALUES
(261, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-29 09:08:42', 1),
(262, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-29 09:46:13', 1),
(263, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-29 10:26:15', 1),
(264, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-29 10:37:38', 1),
(265, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-29 12:36:31', 1),
(266, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-29 13:05:16', 1),
(267, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-29 13:27:08', 1),
(268, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-29 13:50:58', 1),
(269, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-29 15:39:02', 1),
(270, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-29 15:49:11', 1),
(271, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-29 16:15:04', 1),
(272, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-29 16:15:24', 1),
(273, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-29 16:25:29', 1),
(274, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-29 16:36:12', 1),
(275, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-29 16:48:57', 1),
(276, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-29 17:28:20', 1),
(277, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-29 17:42:57', 1),
(278, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-29 17:53:50', 1),
(279, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-29 18:27:53', 1),
(280, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-29 21:04:28', 1),
(281, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-29 21:16:22', 1),
(282, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-29 21:26:44', 1),
(283, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-29 21:59:51', 1),
(284, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-29 22:10:12', 1),
(285, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-29 22:28:26', 1),
(286, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-29 22:47:59', 1),
(287, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-29 22:59:56', 1),
(288, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-29 23:10:13', 1),
(289, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-29 23:26:22', 1),
(290, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-29 23:36:30', 1),
(291, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-30 11:42:39', 1),
(292, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-30 11:53:43', 1),
(293, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-30 12:04:53', 1),
(294, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-30 12:18:48', 1),
(295, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-30 12:31:51', 1),
(296, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-30 12:32:12', 1),
(297, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-30 15:17:02', 1),
(298, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-30 16:02:44', 1),
(299, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-30 17:42:41', 1),
(300, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-30 17:44:35', 1),
(301, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-30 18:05:53', 1),
(302, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-30 18:20:13', 1),
(303, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-30 18:23:30', 1),
(304, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-30 18:32:59', 1),
(305, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-30 18:41:44', 1),
(306, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-30 18:52:59', 1),
(307, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-30 19:06:04', 1),
(308, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-30 19:20:35', 1),
(309, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-30 19:26:52', 1),
(310, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-30 19:47:18', 1),
(311, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-30 20:01:12', 1),
(312, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-30 20:07:30', 1),
(313, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'nel', '2017-01-30 20:20:27', 1),
(314, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-02-06 00:18:58', 1),
(315, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-02-06 00:29:09', 1),
(316, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-02-06 00:39:33', 1),
(317, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-02-06 00:57:47', 1),
(318, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'admin', '2017-02-06 00:58:02', 1),
(319, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'admin', '2017-02-06 00:59:10', 1),
(320, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'admin', '2017-02-06 01:04:44', 1),
(321, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'admin', '2017-02-06 01:07:12', 1),
(322, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'admin', '2017-02-06 01:08:57', 1),
(323, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-02-06 01:10:27', 1),
(324, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'nel', '2017-02-06 01:10:58', 1),
(325, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'nel', '2017-02-06 01:11:48', 1),
(326, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'nel', '2017-02-06 01:12:18', 1),
(327, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'nel', '2017-02-06 01:13:03', 1),
(328, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'nel', '2017-02-06 01:13:43', 1),
(329, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'nel', '2017-02-06 01:14:01', 1),
(330, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'nel', '2017-02-06 01:16:29', 1),
(331, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'nel', '2017-02-06 01:17:30', 1),
(332, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'nel', '2017-02-06 01:18:18', 1),
(333, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'nel', '2017-02-06 01:21:45', 1),
(334, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'nel', '2017-02-06 01:22:59', 1),
(335, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'nel', '2017-02-06 01:23:56', 1),
(336, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'nel', '2017-02-06 01:26:10', 1),
(337, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'nel', '2017-02-06 01:31:20', 1),
(338, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'admin', '2017-02-06 01:35:00', 1),
(339, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'admin', '2017-02-06 01:45:10', 1),
(340, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'admin', '2017-02-06 02:11:57', 1),
(341, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'admin', '2017-02-06 02:30:47', 1),
(342, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'admin', '2017-02-06 03:04:53', 1),
(343, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'admin', '2017-02-06 03:16:01', 1),
(344, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'admin', '2017-02-06 03:26:21', 1),
(345, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'admin', '2017-02-06 03:37:23', 1),
(346, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'admin', '2017-02-06 03:47:32', 1),
(347, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'admin', '2017-02-06 03:51:27', 1),
(348, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'admin', '2017-02-06 04:01:54', 1),
(349, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'admin', '2017-02-06 04:05:50', 1),
(350, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'admin', '2017-02-06 09:09:03', 1),
(351, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-02-06 09:10:12', 1),
(352, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-02-06 14:26:16', 1),
(353, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'nel', '2017-02-06 23:21:37', 1),
(354, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'nel', '2017-02-06 23:32:22', 1),
(355, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'admin', '2017-02-07 08:27:42', 1),
(356, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'admin', '2017-02-07 08:41:55', 1),
(357, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'admin', '2017-02-07 08:56:54', 1),
(358, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'admin', '2017-02-07 09:16:18', 1),
(359, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'admin', '2017-02-07 09:17:44', 1),
(360, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-02-07 09:30:20', 1),
(361, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-02-07 09:41:22', 1),
(362, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'nel', '2017-02-07 09:53:40', 1),
(363, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'admin', '2017-02-12 12:59:42', 1),
(364, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-02-12 15:50:31', 1),
(365, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-02-12 16:14:06', 1),
(366, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-02-12 16:25:07', 1),
(367, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-02-12 16:36:27', 1),
(368, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-02-12 16:48:40', 1),
(369, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-02-12 16:59:36', 1),
(370, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-02-12 17:10:40', 1),
(371, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-02-12 18:40:34', 1),
(372, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-02-12 18:51:56', 1),
(373, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-02-12 19:02:18', 1),
(374, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-02-12 19:13:07', 1),
(375, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-02-12 19:28:09', 1),
(376, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-02-12 19:38:14', 1),
(377, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-02-12 19:48:40', 1),
(378, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-02-12 19:58:46', 1),
(379, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-02-12 20:09:52', 1),
(380, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-02-13 10:06:15', 1),
(381, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'admin', '2017-02-13 10:16:57', 1),
(382, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-02-13 10:27:05', 1),
(383, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-02-14 08:08:59', 1),
(384, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-02-14 08:19:47', 1),
(385, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-02-14 08:30:05', 1),
(386, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-02-14 08:40:29', 1),
(387, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-02-14 08:52:12', 1),
(388, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'malysz', '2017-02-14 09:04:47', 1),
(389, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'admin', '2017-02-14 10:35:00', 1),
(390, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'admin', '2017-02-14 12:53:02', 1),
(391, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'login', '2017-02-15 08:26:58', 1),
(392, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'jerzy', '2017-02-15 08:38:33', 0),
(393, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'nel', '2017-02-15 09:46:30', 1),
(394, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'nel', '2017-02-15 10:05:41', 1),
(395, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'nel', '2017-02-15 10:47:04', 1),
(396, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'nel', '2017-02-15 10:58:17', 1),
(397, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'nel', '2017-02-15 11:09:12', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `property`
--

CREATE TABLE `property` (
  `ID_PROPERTY_PK` int(4) NOT NULL,
  `ID_LOCALIZATION_FK` int(4) NOT NULL,
  `ID_SPACE_FK` int(4) NOT NULL,
  `ID_TYPE_FK` int(4) NOT NULL,
  `ID_USER_FK` int(4) NOT NULL,
  `PROPERTY_TITLE` varchar(20) COLLATE utf8_bin NOT NULL,
  `PROPERTY_PRICE` decimal(12,2) NOT NULL,
  `PROPERTY_DESCRIPTION` longtext COLLATE utf8_bin NOT NULL,
  `PROPERTY_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Zrzut danych tabeli `property`
--

INSERT INTO `property` (`ID_PROPERTY_PK`, `ID_LOCALIZATION_FK`, `ID_SPACE_FK`, `ID_TYPE_FK`, `ID_USER_FK`, `PROPERTY_TITLE`, `PROPERTY_PRICE`, `PROPERTY_DESCRIPTION`, `PROPERTY_TIME`) VALUES
(1, 74, 66, 3, 2, 'Lokal uzytkowy1', '300000.00', 'Ten lokal uzytkowy zlokalizowany jest w bardzo dobrze dostepnym miejscu, blisko centrum miasta.', '2017-02-13 10:12:09'),
(4, 82, 74, 1, 3, 'Dom w Andrychowie', '420000.00', 'to jest jakis tekst', '2017-02-15 11:16:09');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `session`
--

CREATE TABLE `session` (
  `ID_SESSION_PK` int(4) NOT NULL,
  `ID_USER_FK` int(4) NOT NULL,
  `SESSION_TOKEN` int(4) NOT NULL,
  `SESSION_ID` varchar(64) CHARACTER SET utf8 NOT NULL,
  `SESSION_IP` varchar(39) COLLATE utf8_bin NOT NULL,
  `SESSION_WEB` varchar(200) COLLATE utf8_bin NOT NULL,
  `SESSION_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Zrzut danych tabeli `session`
--

INSERT INTO `session` (`ID_SESSION_PK`, `ID_USER_FK`, `SESSION_TOKEN`, `SESSION_ID`, `SESSION_IP`, `SESSION_WEB`, `SESSION_TIME`) VALUES
(6, 3, 3620, 'c7bf67c9d95ff4044dc6caff10477ba724973a615e50f87db82b6758006e3f78', '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', '2017-02-15 11:09:12');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `space`
--

CREATE TABLE `space` (
  `ID_SPACE_PK` int(4) NOT NULL,
  `ID_USER_FK` int(4) NOT NULL,
  `SPACE_HECTARE` decimal(6,2) NOT NULL,
  `SPACE_M2` decimal(6,2) NOT NULL,
  `SPACE_INT_FLATS` int(3) NOT NULL,
  `SPACE_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Zrzut danych tabeli `space`
--

INSERT INTO `space` (`ID_SPACE_PK`, `ID_USER_FK`, `SPACE_HECTARE`, `SPACE_M2`, `SPACE_INT_FLATS`, `SPACE_TIME`) VALUES
(57, 2, '0.00', '116.00', 2, '2017-01-30 20:08:38'),
(58, 2, '0.00', '40.00', 2, '2017-02-06 14:29:52'),
(65, 3, '0.00', '283.00', 7, '2017-02-06 23:38:12'),
(66, 2, '0.00', '120.00', 2, '2017-02-13 10:10:57'),
(74, 3, '0.00', '265.00', 7, '2017-02-15 11:16:09');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `type`
--

CREATE TABLE `type` (
  `ID_TYPE_PK` int(4) NOT NULL,
  `TYPE_TITLE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `type`
--

INSERT INTO `type` (`ID_TYPE_PK`, `TYPE_TITLE`) VALUES
(1, 'Domy'),
(2, 'Dzialki'),
(3, 'Lokale uzytkowe'),
(4, 'Mieszkania');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user`
--

CREATE TABLE `user` (
  `ID_USER_PK` int(4) NOT NULL,
  `ID_USERTYPE_FK` int(4) NOT NULL DEFAULT '2',
  `USER_LOGIN` varchar(20) COLLATE utf8_bin NOT NULL,
  `USER_PASS` varchar(160) COLLATE utf8_bin NOT NULL,
  `USER_SALT` varchar(3) COLLATE utf8_bin NOT NULL,
  `USER_NAME` varchar(20) COLLATE utf8_bin NOT NULL,
  `USER_SURNAME` varchar(20) COLLATE utf8_bin NOT NULL,
  `USER_PESEL` varchar(11) COLLATE utf8_bin NOT NULL,
  `USER_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Zrzut danych tabeli `user`
--

INSERT INTO `user` (`ID_USER_PK`, `ID_USERTYPE_FK`, `USER_LOGIN`, `USER_PASS`, `USER_SALT`, `USER_NAME`, `USER_SURNAME`, `USER_PESEL`, `USER_TIME`) VALUES
(1, 1, 'admin', 'c07895d564c812ae10dfbcfc5185c086dc3e3115', '446', 'Krzysztof', 'Stuglik', '93999999999', '2017-01-30 17:19:00'),
(2, 2, 'test', '92a59d0ce73073868624e2181aadab0d0cf5026f', '759', 'Test', 'Test', '12332112332', '2016-12-10 11:16:30'),
(3, 2, 'nel', '3972a849e8f9e4e929d5541f1787ea2832449e65', '928', 'Nel', 'Rawlison', '11122233344', '2016-12-09 09:19:46'),
(4, 2, 'kowalski', 'ec3a0047dfbeb2857007ed01f9d4a1e2d9577186', '840', 'Jan', 'Kowalski', '98765432100', '2017-01-30 17:16:05'),
(41, 2, 'chmura', 'fe71cb4fea5582707f00f2dbb8a18a9d1cdf0e8a', '700', 'Aleksandra', 'Chmura', '95959595959', '2017-02-06 17:02:08'),
(43, 2, 'wysocka', '6272f1e154b3cea5354168746ebef47da5977257', '13', 'Anna', 'Wysocka', '97979797977', '2017-02-06 22:41:31'),
(47, 2, 'miki', '2a877bde29b8afde8530e45a96e67c4857f95aef', '431', 'Myszka', 'Miki', '12345678910', '2017-02-07 08:24:46');

--
-- Wyzwalacze `user`
--
DELIMITER $$
CREATE TRIGGER `after_delete_user` AFTER DELETE ON `user` FOR EACH ROW INSERT INTO arch_users (PersonID,NAME,SURNAME)
VALUES (OLD.ID_USER_PK,OLD.USER_NAME,OLD.USER_SURNAME)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_insert_user` BEFORE INSERT ON `user` FOR EACH ROW if lower(new.user_login) <> new.user_login 
then set new.user_login=lower(new.user_login);
end if
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user_type`
--

CREATE TABLE `user_type` (
  `id_usertype_pk` int(4) NOT NULL,
  `usertype_name` varchar(20) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Zrzut danych tabeli `user_type`
--

INSERT INTO `user_type` (`id_usertype_pk`, `usertype_name`) VALUES
(1, 'administrator'),
(2, 'user');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `visit`
--

CREATE TABLE `visit` (
  `id_visit_pk` int(4) NOT NULL,
  `id_user_fk` int(4) NOT NULL,
  `visit_cnt` int(2) NOT NULL,
  `visit_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Zrzut danych tabeli `visit`
--

INSERT INTO `visit` (`id_visit_pk`, `id_user_fk`, `visit_cnt`, `visit_time`) VALUES
(7, 112, 0, '2017-01-30 16:02:45'),
(8, 2, 0, '2017-01-30 18:52:59'),
(9, 3, 15, '2017-02-15 11:09:12'),
(10, 1, 24, '2017-02-14 12:53:02'),
(11, 48, 1, '2017-02-14 09:04:47'),
(12, 59, 1, '2017-02-15 08:26:58');

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `voferta`
--
CREATE TABLE `voferta` (
`user_name` varchar(20)
,`user_surname` varchar(20)
,`type_title` varchar(30)
,`property_title` varchar(20)
,`space_hectare` decimal(6,2)
,`space_m2` decimal(6,2)
,`space_int_flats` int(3)
,`property_price` decimal(12,2)
,`localization_postal_code` varchar(6)
,`city_title` varchar(30)
,`localization_street` varchar(30)
,`localization_street_number` varchar(5)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `vuser`
--
CREATE TABLE `vuser` (
`user_name` varchar(20)
,`user_surname` varchar(20)
,`contact_phone` varchar(11)
,`contact_email` varchar(30)
);

-- --------------------------------------------------------

--
-- Struktura widoku `voferta`
--
DROP TABLE IF EXISTS `voferta`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `voferta`  AS  select `u`.`USER_NAME` AS `user_name`,`u`.`USER_SURNAME` AS `user_surname`,`t`.`TYPE_TITLE` AS `type_title`,`p`.`PROPERTY_TITLE` AS `property_title`,`s`.`SPACE_HECTARE` AS `space_hectare`,`s`.`SPACE_M2` AS `space_m2`,`s`.`SPACE_INT_FLATS` AS `space_int_flats`,`p`.`PROPERTY_PRICE` AS `property_price`,`l`.`LOCALIZATION_POSTAL_CODE` AS `localization_postal_code`,`c`.`city_title` AS `city_title`,`l`.`LOCALIZATION_STREET` AS `localization_street`,`l`.`LOCALIZATION_STREET_NUMBER` AS `localization_street_number` from (((((`user` `u` join `type` `t`) join `property` `p`) join `space` `s`) join `localization` `l`) join `city` `c`) where ((`p`.`ID_LOCALIZATION_FK` = `l`.`ID_LOCALIZATION_PK`) and (`p`.`ID_SPACE_FK` = `s`.`ID_SPACE_PK`) and (`p`.`ID_TYPE_FK` = `t`.`ID_TYPE_PK`) and (`p`.`ID_USER_FK` = `u`.`ID_USER_PK`) and (`l`.`ID_CITY_FK` = `c`.`id_city_pk`)) ;

-- --------------------------------------------------------

--
-- Struktura widoku `vuser`
--
DROP TABLE IF EXISTS `vuser`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vuser`  AS  select `u`.`USER_NAME` AS `user_name`,`u`.`USER_SURNAME` AS `user_surname`,`c`.`CONTACT_PHONE` AS `contact_phone`,`c`.`CONTACT_EMAIL` AS `contact_email` from (`user` `u` join `contact` `c`) where (`c`.`ID_USER_FK` = `u`.`ID_USER_PK`) ;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`ID_ADDRESS_PK`),
  ADD KEY `ID_CITY_FK` (`ID_CITY_FK`),
  ADD KEY `ID_USER_FK` (`ID_USER_FK`);

--
-- Indexes for table `buy`
--
ALTER TABLE `buy`
  ADD PRIMARY KEY (`ID_BUY_PK`),
  ADD KEY `ID_property_FK` (`ID_PROPERTY_FK`),
  ADD KEY `ID_user_FK2` (`ID_USER_FK`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id_city_pk`),
  ADD UNIQUE KEY `city_title` (`city_title`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`ID_CONTACT_PK`),
  ADD UNIQUE KEY `ID_USER_FK` (`ID_USER_FK`),
  ADD UNIQUE KEY `CONTACT_EMAIL` (`CONTACT_EMAIL`),
  ADD UNIQUE KEY `CONTACT_PHONE` (`CONTACT_PHONE`);

--
-- Indexes for table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`ID_IMAGE_PK`),
  ADD KEY `ID_property_FK2` (`ID_PROPERTY_FK`);

--
-- Indexes for table `localization`
--
ALTER TABLE `localization`
  ADD PRIMARY KEY (`ID_LOCALIZATION_PK`),
  ADD KEY `ID_CITY_FK2` (`ID_CITY_FK`);

--
-- Indexes for table `logtable`
--
ALTER TABLE `logtable`
  ADD PRIMARY KEY (`id_logtable`);

--
-- Indexes for table `property`
--
ALTER TABLE `property`
  ADD PRIMARY KEY (`ID_PROPERTY_PK`),
  ADD UNIQUE KEY `PROPERTY_TITLE` (`PROPERTY_TITLE`),
  ADD KEY `ID_space_FK` (`ID_SPACE_FK`),
  ADD KEY `ID_localization_FK2` (`ID_LOCALIZATION_FK`),
  ADD KEY `ID_type_FK2` (`ID_TYPE_FK`),
  ADD KEY `ID_user_FK4` (`ID_USER_FK`);

--
-- Indexes for table `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`ID_SESSION_PK`),
  ADD KEY `ID_USER_FK` (`ID_USER_FK`);

--
-- Indexes for table `space`
--
ALTER TABLE `space`
  ADD PRIMARY KEY (`ID_SPACE_PK`),
  ADD KEY `ID_USER_FK` (`ID_USER_FK`);

--
-- Indexes for table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`ID_TYPE_PK`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID_USER_PK`),
  ADD UNIQUE KEY `USER_LOGIN` (`USER_LOGIN`),
  ADD UNIQUE KEY `USER_NAME` (`USER_NAME`),
  ADD UNIQUE KEY `USER_SURNAME` (`USER_SURNAME`),
  ADD UNIQUE KEY `USER_PESEL` (`USER_PESEL`),
  ADD KEY `id_usertype_fk` (`ID_USERTYPE_FK`);

--
-- Indexes for table `user_type`
--
ALTER TABLE `user_type`
  ADD PRIMARY KEY (`id_usertype_pk`),
  ADD UNIQUE KEY `usertype_name` (`usertype_name`);

--
-- Indexes for table `visit`
--
ALTER TABLE `visit`
  ADD PRIMARY KEY (`id_visit_pk`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `address`
--
ALTER TABLE `address`
  MODIFY `ID_ADDRESS_PK` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT dla tabeli `buy`
--
ALTER TABLE `buy`
  MODIFY `ID_BUY_PK` int(4) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `city`
--
ALTER TABLE `city`
  MODIFY `id_city_pk` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT dla tabeli `contact`
--
ALTER TABLE `contact`
  MODIFY `ID_CONTACT_PK` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;
--
-- AUTO_INCREMENT dla tabeli `image`
--
ALTER TABLE `image`
  MODIFY `ID_IMAGE_PK` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT dla tabeli `localization`
--
ALTER TABLE `localization`
  MODIFY `ID_LOCALIZATION_PK` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;
--
-- AUTO_INCREMENT dla tabeli `logtable`
--
ALTER TABLE `logtable`
  MODIFY `id_logtable` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=398;
--
-- AUTO_INCREMENT dla tabeli `property`
--
ALTER TABLE `property`
  MODIFY `ID_PROPERTY_PK` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT dla tabeli `session`
--
ALTER TABLE `session`
  MODIFY `ID_SESSION_PK` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT dla tabeli `space`
--
ALTER TABLE `space`
  MODIFY `ID_SPACE_PK` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;
--
-- AUTO_INCREMENT dla tabeli `type`
--
ALTER TABLE `type`
  MODIFY `ID_TYPE_PK` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT dla tabeli `user`
--
ALTER TABLE `user`
  MODIFY `ID_USER_PK` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;
--
-- AUTO_INCREMENT dla tabeli `user_type`
--
ALTER TABLE `user_type`
  MODIFY `id_usertype_pk` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT dla tabeli `visit`
--
ALTER TABLE `visit`
  MODIFY `id_visit_pk` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `buy`
--
ALTER TABLE `buy`
  ADD CONSTRAINT `ID_property_FK` FOREIGN KEY (`ID_PROPERTY_FK`) REFERENCES `property` (`ID_PROPERTY_PK`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ID_user_FK2` FOREIGN KEY (`ID_USER_FK`) REFERENCES `user` (`ID_USER_PK`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `contact`
--
ALTER TABLE `contact`
  ADD CONSTRAINT `contact_ibfk_1` FOREIGN KEY (`ID_USER_FK`) REFERENCES `user` (`ID_USER_PK`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `image`
--
ALTER TABLE `image`
  ADD CONSTRAINT `ID_property_FK2` FOREIGN KEY (`ID_PROPERTY_FK`) REFERENCES `property` (`ID_PROPERTY_PK`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `property`
--
ALTER TABLE `property`
  ADD CONSTRAINT `ID_localization_FK` FOREIGN KEY (`ID_LOCALIZATION_FK`) REFERENCES `localization` (`ID_LOCALIZATION_PK`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ID_space_FK` FOREIGN KEY (`ID_SPACE_FK`) REFERENCES `space` (`ID_SPACE_PK`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ID_type_FK` FOREIGN KEY (`ID_TYPE_FK`) REFERENCES `type` (`ID_TYPE_PK`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ID_user_FK4` FOREIGN KEY (`ID_USER_FK`) REFERENCES `user` (`ID_USER_PK`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `session`
--
ALTER TABLE `session`
  ADD CONSTRAINT `session_ibfk_1` FOREIGN KEY (`ID_USER_FK`) REFERENCES `user` (`ID_USER_PK`) ON DELETE CASCADE ON UPDATE CASCADE;

DELIMITER $$
--
-- Zdarzenia
--
CREATE DEFINER=`root`@`localhost` EVENT `e_store_ts` ON SCHEDULE EVERY 10 SECOND STARTS '2016-10-25 10:27:16' ON COMPLETION NOT PRESERVE ENABLE DO INSERT INTO myschema.mytable VALUES (UNIX_TIMESTAMP())$$

CREATE DEFINER=`root`@`localhost` EVENT `resetCounter` ON SCHEDULE EVERY 1 DAY STARTS '2016-12-11 20:00:00' ON COMPLETION NOT PRESERVE ENABLE DO update visit set visit_cnt = 0 where minute(timediff(VISIT_TIME,now())) > 5$$

CREATE DEFINER=`root`@`localhost` EVENT `resetLogtable` ON SCHEDULE EVERY 1 DAY STARTS '2016-12-17 00:06:00' ON COMPLETION NOT PRESERVE ENABLE DO DELETE from logtable WHERE datediff(now(), logtable_time) > 1$$

CREATE DEFINER=`root`@`localhost` EVENT `resetSession` ON SCHEDULE EVERY 5 MINUTE STARTS '2016-12-29 11:32:00' ON COMPLETION NOT PRESERVE ENABLE DO delete from session where minute(timediff(SESSION_TIME,now())) > 10$$

DELIMITER ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
