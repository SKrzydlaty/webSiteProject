
-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user`
--

CREATE TABLE `user` (
  `ID_USER_PK` int(4) NOT NULL,
  `ID_USERTYPE_FK` int(4) NOT NULL DEFAULT '2',
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

INSERT INTO `user` (`ID_USER_PK`, `ID_USERTYPE_FK`, `USER_LOGIN`, `USER_PASS`, `USER_SALT`, `USER_NAME`, `USER_SURNAME`, `USER_PESEL`, `USER_TIME`) VALUES
(1, 1, 'admin', 'c07895d564c812ae10dfbcfc5185c086dc3e3115', '446', 'Krzysztof', 'Stuglik', '93999999999', '2017-01-30 17:19:00'),
(2, 2, 'test', '92a59d0ce73073868624e2181aadab0d0cf5026f', '759', 'Test', 'Test', '12332112332', '2016-12-10 11:16:30'),
(3, 2, 'nel', '3972a849e8f9e4e929d5541f1787ea2832449e65', '928', 'Nel', 'Rawlison', '11122233344', '2016-12-09 09:19:46'),
(4, 2, 'kowalski', 'ec3a0047dfbeb2857007ed01f9d4a1e2d9577186', '840', 'Jan', 'Kowalski', '98765432100', '2017-01-30 17:16:05');

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
