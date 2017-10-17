
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
(22, 36, 1, 2, 111, 'Sprzedam', '100000.00', 'CoÅ› na sprzedaÅ¼', '2016-12-30 15:23:11'),
(24, 38, 1, 3, 111, 'Oferta Warszawa', '500000.00', 'nad czym sie tu zastanawiac', '2017-01-10 20:08:14'),
(25, 39, 1, 1, 111, 'Coś w łodzi', '200000.00', 'AAA', '2017-01-28 20:40:04'),
(26, 40, 1, 2, 111, 'Super oferta', '450000.00', 'tylko brac', '2017-01-10 20:31:59'),
(27, 41, 1, 1, 111, 'CCC', '1000000.00', 'c', '2017-01-10 20:33:42'),
(28, 42, 1, 3, 111, 'Taka oferta', '300000.00', 'tekst', '2017-01-11 14:43:38'),
(29, 43, 1, 1, 111, 'Dom w górach', '400000.00', 'Dom w gorach jest', '2017-01-28 20:40:33'),
(30, 44, 1, 2, 111, 'Oferta z Krakowa', '220000.00', 'To mieszkanie jest w Krakowie', '2017-01-13 10:59:26'),
(31, 45, 1, 3, 111, 'Kiczowata', '800000.00', 'kiczowata oferata', '2017-01-13 11:02:01'),
(32, 46, 1, 2, 111, 'ABC', '888888.00', 'ACVs', '2017-01-13 11:06:02');
