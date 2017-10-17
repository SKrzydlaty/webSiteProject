
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
(65, 1, 'Krakowska', '22', '34-120');
