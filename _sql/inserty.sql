INSERT INTO 'city' ('id_city_pk', 'city_title') VALUES
(1, 'Andrychów'),
(2, 'Kalwaria Zebrzydowska'),
(3, 'Kraków'),
(4, 'Wadowice'),
(5, 'Zywiec');

INSERT INTO address (`ID_ADDRESS_PK`, `ID_CITY_FK`, `ID_USER_FK`, `ADDRESS_STREET`, `ADDRESS_STREET_NUMBER`, `ADDRESS_POSTAL_CODE`) VALUES
(1, 1,1, 'Krakowska', '1', '34-120'),
(2, 2,2, 'Kolejowa', '2', '34-100'),
(3, 4,3, 'Lwowska', '4', '34-100'),
(4, 5,4, 'Andersa', '5', '34-300');

INSERT INTO 'user_type' ('id_usertype_pk', 'usertype_name') VALUES (NULL, 'administrator'), (NULL, 'user');

INSERT INTO 'type' ('ID_TYPE_PK', 'TYPE_TITLE') VALUES
(1, 'Domy'),
(2, 'Dzialki'),
(3, 'Lokale uzytkowe'),
(4, 'Mieszkania');

