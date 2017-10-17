
-- --------------------------------------------------------

--
-- Struktura widoku `vuser`
--
DROP TABLE IF EXISTS `vuser`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vuser`  AS  select `user`.`USER_NAME` AS `user_name`,`user`.`USER_SURNAME` AS `user_surname`,`contact`.`CONTACT_PHONE` AS `contact_phone`,`contact`.`CONTACT_EMAIL` AS `contact_email`,`address`.`ADDRESS_POSTAL_CODE` AS `address_postal_code`,`city`.`city_title` AS `city_title`,`address`.`ADDRESS_STREET` AS `address_street`,`address`.`ADDRESS_STREET_NUMBER` AS `address_street_number` from (((`user` join `contact`) join `address`) join `city`) where ((`contact`.`ID_USER_FK` = `user`.`ID_USER_PK`) and (`address`.`ID_CITY_FK` = `city`.`id_city_pk`)) order by `user`.`USER_NAME`,`user`.`USER_SURNAME` ;
