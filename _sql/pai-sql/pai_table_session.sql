
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
