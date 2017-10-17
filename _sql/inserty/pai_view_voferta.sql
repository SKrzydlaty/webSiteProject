
-- --------------------------------------------------------

--
-- Struktura widoku `voferta`
--
DROP TABLE IF EXISTS `voferta`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `voferta`  AS  select `u`.`USER_NAME` AS `user_name`,`u`.`USER_SURNAME` AS `user_surname`,`t`.`TYPE_TITLE` AS `type_title`,`p`.`PROPERTY_TITLE` AS `property_title`,`s`.`SPACE_HECTARE` AS `space_hectare`,`s`.`SPACE_M2` AS `space_m2`,`s`.`SPACE_INT_FLATS` AS `space_int_flats`,`p`.`PROPERTY_PRICE` AS `property_price`,`l`.`LOCALIZATION_POSTAL_CODE` AS `localization_postal_code`,`c`.`city_title` AS `city_title`,`l`.`LOCALIZATION_STREET` AS `localization_street`,`l`.`LOCALIZATION_STREET_NUMBER` AS `localization_street_number` from (((((`user` `u` join `type` `t`) join `property` `p`) join `space` `s`) join `localization` `l`) join `city` `c`) where ((`p`.`ID_LOCALIZATION_FK` = `l`.`ID_LOCALIZATION_PK`) and (`p`.`ID_SPACE_FK` = `s`.`ID_SPACE_PK`) and (`p`.`ID_TYPE_FK` = `t`.`ID_TYPE_PK`) and (`p`.`ID_USER_FK` = `u`.`ID_USER_PK`) and (`l`.`ID_CITY_FK` = `c`.`id_city_pk`)) ;
