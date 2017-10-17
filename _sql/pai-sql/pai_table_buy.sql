
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

--
-- Zrzut danych tabeli `buy`
--

INSERT INTO `buy` (`ID_BUY_PK`, `ID_PROPERTY_FK`, `ID_USER_FK`, `BUY_TIME`) VALUES
(9, 26, 112, '2017-01-30 12:22:03');
