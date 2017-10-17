
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
(15, 1, 'Brzozowa', '34', '10-150'),
(16, 1, 'a', '1', '1'),
(27, 2, 'q', '1', '1'),
(28, 2, 'q', '1', '1'),
(29, 2, 'q', '1', '1'),
(30, 2, 'q', '1', '1'),
(31, 2, 'q', '1', '1'),
(32, 2, 'q', '1', '1'),
(33, 2, 'q', '1', '1'),
(34, 4, 'q', '1', '1'),
(35, 4, 'q', '1', '1'),
(36, 5, 'LegionÃ³w', '12', '34-120'),
(37, 3, 'asddasd', '23', '1234'),
(38, 5, 'PowstaÅ„cÃ³w', '1', '11-111'),
(39, 5, 'Nowa', '123', '22-222'),
(40, 6, 'Krakowskie PrzedmieÅ›cie', '5', '00-001'),
(41, 6, 'nieznana', '56', '01-002'),
(42, 5, 'Krakowska', '55', '12-222'),
(43, 7, 'Gorska', '1', '12-321'),
(44, 1, 'Karmelicka', '121', '30-130'),
(45, 6, 'kiczowata', '45', '12-555'),
(46, 6, 'nieznanam', '56', '67-333');
