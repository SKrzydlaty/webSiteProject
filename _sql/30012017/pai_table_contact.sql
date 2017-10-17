
-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `contact`
--

CREATE TABLE `contact` (
  `ID_CONTACT_PK` int(4) NOT NULL,
  `ID_USER_FK` int(4) NOT NULL,
  `CONTACT_EMAIL` varchar(30) COLLATE utf8_bin NOT NULL,
  `CONTACT_PHONE` varchar(11) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Zrzut danych tabeli `contact`
--

INSERT INTO `contact` (`ID_CONTACT_PK`, `ID_USER_FK`, `CONTACT_EMAIL`, `CONTACT_PHONE`) VALUES
(60, 3, 'nel@o2.pl', '123-123-123'),
(61, 2, 'test@o2.pl', '321-321-312'),
(80, 4, 'kowalski@o2.pl', '788-888-777'),
(81, 1, 'admin@mail.pl', '555-555-555');
