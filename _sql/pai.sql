-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Czas generowania: 27 Gru 2016, 23:59
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

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
(116, 'zxczxc', 'zxczxc');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `buy`
--

CREATE TABLE `buy` (
  `ID_BUY_PK` int(4) NOT NULL,
  `ID_PROPERTY_FK` int(4) NOT NULL,
  `ID_USER_FK` int(4) NOT NULL,
  `BUY_COUNTER` int(2) NOT NULL,
  `BUY_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `BUY_PRICE_SUMMARY` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `city`
--

CREATE TABLE `city` (
  `id_city_pk` int(4) NOT NULL,
  `city_title` varchar(20) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Zrzut danych tabeli `city`
--

INSERT INTO `city` (`id_city_pk`, `city_title`) VALUES
(5, 'Andrychów'),
(3, 'Bielsko-Biała'),
(4, 'Kalwaria Zebrzydowsk'),
(1, 'Kraków'),
(2, 'Wadowice');

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
(60, 111, 'nel@o2.pl', '123-123-123'),
(61, 112, 'test@o2.pl', '321-321-312'),
(66, 117, 'kretka@o.pl', '999-999-999'),
(67, 117, 'kretka@o.pl', ''),
(68, 119, 'quake@o2.pl', '999-999-999'),
(69, 120, 'air@e.com', '555-555-555');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `image`
--

CREATE TABLE `image` (
  `ID_IMAGE_PK` int(4) NOT NULL,
  `ID_PROPERTY_FK` int(4) NOT NULL,
  `IMAGE_FILE` varchar(100) COLLATE utf8_bin NOT NULL,
  `IMAGE_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `IMAGE_SIZE` decimal(3,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `list_of_users`
--
CREATE TABLE `list_of_users` (
`user_name` varchar(20)
,`user_surname` varchar(20)
,`localization_postal_code` varchar(6)
,`city_title` varchar(20)
,`LOCALIZATION_STREET` varchar(30)
,`LOCALIZATION_STREET_NUMBER` varchar(5)
);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `localization`
--

CREATE TABLE `localization` (
  `ID_LOCALIZATION_PK` int(4) NOT NULL,
  `ID_CITY_FK` int(4) NOT NULL,
  `LOCALIZATION_STREET` varchar(30) COLLATE utf8_bin NOT NULL,
  `LOCALIZATION_STREET_NUMBER` varchar(5) COLLATE utf8_bin NOT NULL,
  `LOCALIZATION_POSTAL_CODE` varchar(6) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Zrzut danych tabeli `localization`
--

INSERT INTO `localization` (`ID_LOCALIZATION_PK`, `ID_CITY_FK`, `LOCALIZATION_STREET`, `LOCALIZATION_STREET_NUMBER`, `LOCALIZATION_POSTAL_CODE`) VALUES
(1, 1, 'Centralna', '1', '11-111'),
(2, 2, 'Centralna', '2', '22-222'),
(3, 3, 'Centralna', '3', '33-333'),
(4, 4, 'Centralna', '4', '44-444'),
(5, 5, 'Centralna', '5', '55-555');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Zrzut danych tabeli `logtable`
--

INSERT INTO `logtable` (`id_logtable`, `logtable_ip`, `logtable_web`, `logtable_name`, `logtable_time`, `logtable_result`) VALUES
(112, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'nel', '2016-12-17 16:43:27', 1),
(114, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'nel', '2016-12-17 16:44:38', 1),
(115, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'nel', '2016-12-17 16:44:52', 1),
(116, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'nel', '2016-12-17 16:47:58', 1),
(117, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'nel', '2016-12-17 16:48:53', 1),
(118, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'nel', '2016-12-17 16:51:33', 1),
(119, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'nel', '2016-12-17 16:51:55', 1),
(120, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'nel', '2016-12-17 16:52:54', 1),
(121, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'nel', '2016-12-17 16:54:27', 1),
(122, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'nel', '2016-12-17 16:55:07', 1),
(123, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'nel', '2016-12-17 16:55:30', 1),
(124, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'nel', '2016-12-17 16:58:15', 1),
(125, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'nel', '2016-12-17 16:59:07', 1),
(129, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'nel', '2016-12-17 17:48:59', 1),
(130, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'nel', '2016-12-17 17:59:07', 1),
(131, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'nel', '2016-12-17 18:01:37', 1),
(132, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2016-12-17 18:01:45', 1),
(133, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'nel', '2016-12-17 18:11:58', 1),
(134, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'nel', '2016-12-17 18:19:04', 1),
(135, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'super', '2016-12-17 19:06:45', 1),
(136, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2016-12-17 20:18:49', 1),
(137, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'quake', '2016-12-17 21:59:33', 1),
(138, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'quake', '2016-12-17 21:59:45', 1),
(139, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'nel', '2016-12-21 15:12:14', 1),
(140, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'nel', '2016-12-22 21:40:02', 1),
(141, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'nel', '2016-12-22 21:41:08', 1),
(142, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'nel', '2016-12-22 21:42:48', 1),
(143, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'qw@q.pl', '2016-12-22 21:48:24', 0),
(144, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'nel', '2016-12-25 10:12:18', 1),
(145, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'nel', '2016-12-25 14:38:45', 1),
(146, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'nel', '2016-12-25 14:39:05', 1),
(147, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'nel', '2016-12-25 14:41:35', 1),
(148, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', ' '''';!--"<XSS>=&{()}', '2016-12-25 14:43:57', 0),
(149, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'qw@q.pl', '2016-12-25 14:49:28', 0),
(150, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'nel', '2016-12-25 15:22:22', 1),
(151, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'nel', '2016-12-25 20:31:48', 1),
(152, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'nel', '2016-12-25 21:10:20', 1),
(153, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'nel', '2016-12-25 21:18:44', 1),
(154, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'nel', '2016-12-25 21:49:38', 1),
(155, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'nel', '2016-12-25 22:05:55', 1),
(156, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'nel', '2016-12-25 22:10:44', 1),
(157, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'nel', '2016-12-25 22:11:08', 1),
(158, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'nel', '2016-12-25 22:11:39', 1),
(159, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'nel', '2016-12-25 22:12:02', 1),
(160, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'nel', '2016-12-25 22:15:39', 1),
(161, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'nel', '2016-12-25 22:16:17', 1),
(162, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2016-12-25 22:17:09', 1),
(163, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2016-12-25 22:18:05', 1),
(164, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2016-12-25 22:18:47', 1),
(165, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2016-12-25 22:20:34', 1),
(166, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2016-12-25 22:20:54', 1),
(167, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2016-12-25 22:21:10', 1),
(168, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2016-12-25 22:22:34', 1),
(169, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'nel', '2016-12-25 22:22:40', 1),
(170, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2016-12-25 22:43:52', 1);

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
(1, 5, 2, 3, 111, 'Działka pod lasem', '500000.00', 'Bardzo dobry wybór, wszędzie dookoła są lasy, jest to miejsce urzekające swym widokiem.', '2016-12-14 16:38:41'),
(2, 4, 1, 1, 112, 'Piękny Dom', '620000.00', 'Wspaniały wybór!', '2016-12-14 16:41:22');

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
(12, 112, 4081, '00e7eb8c78e9a03019fd1ef73cc293106e701102beffc73d35fb8df0eccc7a7f', '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', '2016-12-25 22:43:52');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `space`
--

CREATE TABLE `space` (
  `ID_SPACE_PK` int(4) NOT NULL,
  `SPACE_HECTARE` decimal(6,2) NOT NULL,
  `SPACE_M2` decimal(6,2) NOT NULL,
  `SPACE_int_FLATS` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Zrzut danych tabeli `space`
--

INSERT INTO `space` (`ID_SPACE_PK`, `SPACE_HECTARE`, `SPACE_M2`, `SPACE_int_FLATS`) VALUES
(1, '0.00', '140.00', 7),
(2, '3.00', '0.00', 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `tbl_users`
--

CREATE TABLE `tbl_users` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(25) COLLATE utf8_bin NOT NULL,
  `user_email` varchar(60) COLLATE utf8_bin NOT NULL,
  `user_password` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Zrzut danych tabeli `tbl_users`
--

INSERT INTO `tbl_users` (`user_id`, `user_name`, `user_email`, `user_password`) VALUES
(47, 'ad', 'asd', 'asd'),
(48, 'ASD', 'qw@q.pl', '12'),
(49, 'qwerty', 'qw@q.pl', '12'),
(50, '123', 'qw@q.pl', '12');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `type`
--

CREATE TABLE `type` (
  `ID_TYPE_PK` int(4) NOT NULL,
  `TYPE_TITLE` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `type`
--

INSERT INTO `type` (`ID_TYPE_PK`, `TYPE_TITLE`) VALUES
(1, 'Domy'),
(2, 'Mieszkania'),
(3, 'Działki'),
(4, 'Pow użytkowe');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user`
--

CREATE TABLE `user` (
  `ID_USER_PK` int(4) NOT NULL,
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

INSERT INTO `user` (`ID_USER_PK`, `USER_LOGIN`, `USER_PASS`, `USER_SALT`, `USER_NAME`, `USER_SURNAME`, `USER_PESEL`, `USER_TIME`) VALUES
(111, 'nel', '3972a849e8f9e4e929d5541f1787ea2832449e65', '928', 'Nel', 'Rawlison', '11122233344', '2016-12-09 09:19:46'),
(112, 'test', '92a59d0ce73073868624e2181aadab0d0cf5026f', '759', 'Test', 'Test', '12332112332', '2016-12-10 11:16:30'),
(117, 'ola', '3e960ce09ebc0120f4ffe68a06d0317285bda170', '904', 'aaa', 'aaaaaa', '12345612331', '2016-12-17 21:43:29'),
(119, 'quake', '807252f8685e3dfb8fa3a196fe9cb5c67edb8200', '710', 'quake', 'quake', '5555555555', '2016-12-17 21:58:33'),
(120, 'air', 'eab3edeafc3c2b93e9548cb21822365f6c2a2737', '351', 'Air', 'Air', '22222222222', '2016-12-22 19:56:30');

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
(1, 112, 0, '2016-12-17 18:01:45'),
(2, 111, 0, '2016-12-17 18:19:04'),
(3, 113, 1, '2016-12-17 19:06:45'),
(4, 119, 1, '2016-12-17 21:59:45'),
(5, 0, 1, '2016-12-22 21:41:09');

-- --------------------------------------------------------

--
-- Struktura widoku `list_of_users`
--
DROP TABLE IF EXISTS `list_of_users`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `list_of_users`  AS  select `user`.`USER_NAME` AS `user_name`,`user`.`USER_SURNAME` AS `user_surname`,`localization`.`LOCALIZATION_POSTAL_CODE` AS `localization_postal_code`,`city`.`city_title` AS `city_title`,`localization`.`LOCALIZATION_STREET` AS `LOCALIZATION_STREET`,`localization`.`LOCALIZATION_STREET_NUMBER` AS `LOCALIZATION_STREET_NUMBER` from (((`user` join `property`) join `city`) join `localization`) where ((`localization`.`ID_CITY_FK` = `city`.`id_city_pk`) and (`property`.`ID_LOCALIZATION_FK` = `localization`.`ID_LOCALIZATION_PK`)) ;

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
  ADD KEY `ID_user_FK3` (`ID_USER_FK`);

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
  ADD PRIMARY KEY (`ID_SPACE_PK`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`user_id`);

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
  ADD UNIQUE KEY `USER_PESEL` (`USER_PESEL`);

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
  MODIFY `ID_ADDRESS_PK` int(4) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `buy`
--
ALTER TABLE `buy`
  MODIFY `ID_BUY_PK` int(4) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `city`
--
ALTER TABLE `city`
  MODIFY `id_city_pk` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT dla tabeli `contact`
--
ALTER TABLE `contact`
  MODIFY `ID_CONTACT_PK` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;
--
-- AUTO_INCREMENT dla tabeli `image`
--
ALTER TABLE `image`
  MODIFY `ID_IMAGE_PK` int(4) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `localization`
--
ALTER TABLE `localization`
  MODIFY `ID_LOCALIZATION_PK` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT dla tabeli `logtable`
--
ALTER TABLE `logtable`
  MODIFY `id_logtable` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=171;
--
-- AUTO_INCREMENT dla tabeli `property`
--
ALTER TABLE `property`
  MODIFY `ID_PROPERTY_PK` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT dla tabeli `session`
--
ALTER TABLE `session`
  MODIFY `ID_SESSION_PK` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT dla tabeli `space`
--
ALTER TABLE `space`
  MODIFY `ID_SPACE_PK` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT dla tabeli `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT dla tabeli `type`
--
ALTER TABLE `type`
  MODIFY `ID_TYPE_PK` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT dla tabeli `user`
--
ALTER TABLE `user`
  MODIFY `ID_USER_PK` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;
--
-- AUTO_INCREMENT dla tabeli `visit`
--
ALTER TABLE `visit`
  MODIFY `id_visit_pk` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `ID_CITY_FK` FOREIGN KEY (`ID_CITY_FK`) REFERENCES `city` (`id_city_pk`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ID_USER_FK` FOREIGN KEY (`ID_USER_FK`) REFERENCES `user` (`ID_USER_PK`) ON DELETE CASCADE ON UPDATE CASCADE;

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
  ADD CONSTRAINT `ID_user_FK3` FOREIGN KEY (`ID_USER_FK`) REFERENCES `user` (`ID_USER_PK`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `image`
--
ALTER TABLE `image`
  ADD CONSTRAINT `ID_property_FK2` FOREIGN KEY (`ID_PROPERTY_FK`) REFERENCES `property` (`ID_PROPERTY_PK`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `localization`
--
ALTER TABLE `localization`
  ADD CONSTRAINT `ID_CITY_FK2` FOREIGN KEY (`ID_CITY_FK`) REFERENCES `city` (`id_city_pk`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `property`
--
ALTER TABLE `property`
  ADD CONSTRAINT `ID_localization_FK` FOREIGN KEY (`ID_LOCALIZATION_FK`) REFERENCES `localization` (`ID_LOCALIZATION_PK`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ID_localization_FK2` FOREIGN KEY (`ID_LOCALIZATION_FK`) REFERENCES `localization` (`ID_LOCALIZATION_PK`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ID_space_FK` FOREIGN KEY (`ID_SPACE_FK`) REFERENCES `space` (`ID_SPACE_PK`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ID_type_FK` FOREIGN KEY (`ID_TYPE_FK`) REFERENCES `type` (`ID_TYPE_PK`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ID_type_FK2` FOREIGN KEY (`ID_TYPE_FK`) REFERENCES `type` (`ID_TYPE_PK`) ON DELETE CASCADE ON UPDATE CASCADE,
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

DELIMITER ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

delimiter |

drop function if exists ile_ofert |
create function ile_ofert (nr int) returns int
begin
declare zm int;
select count(*) into zm from property where id_type_fk=nr;
return zm;
end |

delimiter ;