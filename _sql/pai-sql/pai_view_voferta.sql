
-- --------------------------------------------------------

--
-- Struktura widoku `voferta`
--
DROP TABLE IF EXISTS `voferta`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `voferta`  AS  select `user`.`USER_NAME` AS `user_name`,`user`.`USER_SURNAME` AS `user_surname`,`type`.`TYPE_TITLE` AS `type_title`,`property`.`PROPERTY_TITLE` AS `property_title`,`space`.`SPACE_HECTARE` AS `space_hectare`,`space`.`SPACE_M2` AS `space_m2`,`space`.`SPACE_INT_FLATS` AS `space_int_flats`,`property`.`PROPERTY_PRICE` AS `PROPERTY_PRICE`,`localization`.`LOCALIZATION_POSTAL_CODE` AS `localization_postal_code`,`city`.`city_title` AS `city_title`,`localization`.`LOCALIZATION_STREET` AS `localization_street`,`localization`.`LOCALIZATION_STREET_NUMBER` AS `localization_street_number` from (((((`user` join `type`) join `space`) join `property`) join `localization`) join `city`) where ((`property`.`ID_LOCALIZATION_FK` = `localization`.`ID_LOCALIZATION_PK`) and (`localization`.`ID_CITY_FK` = `city`.`id_city_pk`) and (`property`.`ID_SPACE_FK` = `space`.`ID_SPACE_PK`) and (`property`.`ID_TYPE_FK` = `type`.`ID_TYPE_PK`) and (`property`.`ID_USER_FK` = `user`.`ID_USER_PK`)) order by `user`.`USER_NAME`,`user`.`USER_SURNAME` ;
