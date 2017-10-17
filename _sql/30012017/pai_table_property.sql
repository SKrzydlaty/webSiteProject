
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
(48, 65, 57, 4, 2, 'Lokal uzytkowy1', '300000.00', 'Lokal uzytkowy nr 1', '2017-01-30 20:08:38');
