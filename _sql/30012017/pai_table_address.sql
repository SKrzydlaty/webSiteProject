
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

--
-- Zrzut danych tabeli `address`
--

INSERT INTO `address` (`ID_ADDRESS_PK`, `ID_CITY_FK`, `ID_USER_FK`, `ADDRESS_STREET`, `ADDRESS_STREET_NUMBER`, `ADDRESS_POSTAL_CODE`) VALUES
(1, 1, 1, 'Krakowska', '1', '34-120'),
(2, 2, 2, 'Kolejowa', '2', '34-100'),
(3, 4, 3, 'Lwowska', '4', '34-100'),
(4, 5, 4, 'Andersa', '5', '34-300');
