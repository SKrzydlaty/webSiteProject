
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
(29, 48, '_upload/powuz_01.jpg', 'powuz_01.jpg', 218.16, '2017-01-30 20:08:38'),
(30, 48, '_upload/powuz_02.jpg', 'powuz_02.jpg', 186.75, '2017-01-30 20:08:38');
