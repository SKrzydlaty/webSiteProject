
-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `image`
--

CREATE TABLE `image` (
  `ID_IMAGE_PK` int(4) NOT NULL,
  `ID_PROPERTY_FK` int(4) NOT NULL,
  `IMAGE_FILE` varchar(100) COLLATE utf8_bin NOT NULL,
  `IMAGE_TITLE` varchar(50) COLLATE utf8_bin NOT NULL,
  `IMAGE_SIZE` float(10,2) NOT NULL,
  `IMAGE_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Zrzut danych tabeli `image`
--

INSERT INTO `image` (`ID_IMAGE_PK`, `ID_PROPERTY_FK`, `IMAGE_FILE`, `IMAGE_TITLE`, `IMAGE_SIZE`, `IMAGE_TIME`) VALUES
(7, 30, '_img/_property/mieszkania_02.jpg', 'mieszkania_02.jpg', 43.15, '2017-01-30 12:02:51');
