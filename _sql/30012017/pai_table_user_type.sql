
-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user_type`
--

CREATE TABLE `user_type` (
  `id_usertype_pk` int(4) NOT NULL,
  `usertype_name` varchar(20) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Zrzut danych tabeli `user_type`
--

INSERT INTO `user_type` (`id_usertype_pk`, `usertype_name`) VALUES
(1, 'administrator'),
(2, 'user');
