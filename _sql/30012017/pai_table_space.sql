
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
(57, 2, '0.00', '116.00', 2, '2017-01-30 20:08:38');
