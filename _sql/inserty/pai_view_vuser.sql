
-- --------------------------------------------------------

--
-- Struktura widoku `vuser`
--
DROP TABLE IF EXISTS `vuser`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vuser`  AS  select `u`.`USER_NAME` AS `user_name`,`u`.`USER_SURNAME` AS `user_surname`,`c`.`CONTACT_PHONE` AS `contact_phone`,`c`.`CONTACT_EMAIL` AS `contact_email` from (`user` `u` join `contact` `c`) where (`c`.`ID_USER_FK` = `u`.`ID_USER_PK`) ;
