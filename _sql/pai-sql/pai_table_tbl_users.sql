
-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `tbl_users`
--

CREATE TABLE `tbl_users` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(25) COLLATE utf8_bin NOT NULL,
  `user_email` varchar(60) COLLATE utf8_bin NOT NULL,
  `user_password` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Zrzut danych tabeli `tbl_users`
--

INSERT INTO `tbl_users` (`user_id`, `user_name`, `user_email`, `user_password`) VALUES
(47, 'ad', 'asd', 'asd'),
(48, 'ASD', 'qw@q.pl', '12'),
(49, 'qwerty', 'qw@q.pl', '12'),
(50, '123', 'qw@q.pl', '12');
