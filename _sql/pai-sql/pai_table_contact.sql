
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
(60, 111, 'nel@o2.pl', '123-123-123'),
(61, 112, 'test@o2.pl', '321-321-312'),
(66, 117, 'kretka@o.pl', '999-999-999'),
(67, 117, 'kretka@o.pl', ''),
(68, 119, 'quake@o2.pl', '999-999-999'),
(69, 120, 'air@e.com', '555-555-555'),
(70, 121, '123@wp.pl', '555-555-555');
