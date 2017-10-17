
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
(7, 112, 0, '2017-01-30 16:02:45'),
(8, 2, 0, '2017-01-30 18:52:59'),
(9, 3, 1, '2017-01-30 20:20:27');
