
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
(110, 3, 6224, 'f36a0716bac0f78e6b0c6252ea7a658adc129674bf354e1fc02d7d41c787941f', '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', '2017-01-30 20:20:27');
