
-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `visit`
--

CREATE TABLE `visit` (
  `id_visit_pk` int(4) NOT NULL,
  `id_user_fk` int(4) NOT NULL,
  `visit_cnt` int(2) NOT NULL,
  `visit_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Zrzut danych tabeli `visit`
--

INSERT INTO `visit` (`id_visit_pk`, `id_user_fk`, `visit_cnt`, `visit_time`) VALUES
(1, 112, 0, '2016-12-17 18:01:45'),
(2, 111, 0, '2016-12-17 18:19:04'),
(3, 113, 0, '2016-12-17 19:06:45'),
(4, 119, 0, '2016-12-17 21:59:45'),
(5, 0, 0, '2016-12-22 21:41:09'),
(6, 121, 0, '2016-12-28 12:02:08');
