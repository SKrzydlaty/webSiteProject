
-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user`
--

CREATE TABLE `user` (
  `ID_USER_PK` int(4) NOT NULL,
  `USER_LOGIN` varchar(20) COLLATE utf8_bin NOT NULL,
  `USER_PASS` varchar(160) COLLATE utf8_bin NOT NULL,
  `USER_SALT` varchar(3) COLLATE utf8_bin NOT NULL,
  `USER_NAME` varchar(20) COLLATE utf8_bin NOT NULL,
  `USER_SURNAME` varchar(20) COLLATE utf8_bin NOT NULL,
  `USER_PESEL` varchar(11) COLLATE utf8_bin NOT NULL,
  `USER_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Zrzut danych tabeli `user`
--

INSERT INTO `user` (`ID_USER_PK`, `USER_LOGIN`, `USER_PASS`, `USER_SALT`, `USER_NAME`, `USER_SURNAME`, `USER_PESEL`, `USER_TIME`) VALUES
(111, 'nel', '3972a849e8f9e4e929d5541f1787ea2832449e65', '928', 'Nel', 'Rawlison', '11122233344', '2016-12-09 09:19:46'),
(112, 'test', '92a59d0ce73073868624e2181aadab0d0cf5026f', '759', 'Test', 'Test', '12332112332', '2016-12-10 11:16:30'),
(117, 'ola', '3e960ce09ebc0120f4ffe68a06d0317285bda170', '904', 'aaa', 'aaaaaa', '12345612331', '2016-12-17 21:43:29'),
(119, 'quake', '807252f8685e3dfb8fa3a196fe9cb5c67edb8200', '710', 'quake', 'quake', '5555555555', '2016-12-17 21:58:33'),
(120, 'air', 'eab3edeafc3c2b93e9548cb21822365f6c2a2737', '351', 'Air', 'Air', '22222222222', '2016-12-22 19:56:30'),
(121, 'jan', 'aa143b6b32bfe6472b5397eae8c42584a5f1c30a', '343', 'Jan', 'Kowalski', '88888888888', '2016-12-28 12:01:49');

--
-- Wyzwalacze `user`
--
DELIMITER $$
CREATE TRIGGER `after_delete_user` AFTER DELETE ON `user` FOR EACH ROW INSERT INTO arch_users (PersonID,NAME,SURNAME)
VALUES (OLD.ID_USER_PK,OLD.USER_NAME,OLD.USER_SURNAME)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_insert_user` BEFORE INSERT ON `user` FOR EACH ROW if lower(new.user_login) <> new.user_login 
then set new.user_login=lower(new.user_login);
end if
$$
DELIMITER ;
