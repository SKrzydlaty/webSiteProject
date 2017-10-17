
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
