
--
-- Zrzut danych tabeli `property`
--

INSERT INTO `property` (`ID_PROPERTY_PK`, `ID_LOCALIZATION_FK`, `ID_SPACE_FK`, `ID_TYPE_FK`, `ID_USER_FK`, `PROPERTY_TITLE`, `PROPERTY_PRICE`, `PROPERTY_DESCRIPTION`, `PROPERTY_TIME`) VALUES
(1, 74, 66, 3, 2, 'Lokal użytkowy1', '300000.00', 'Ten lokal użytkowy zlokalizowany jest w bardzo dobrze dostępnym miejscu, blisko centrum. Jest w bardzo dobrym stanie, pomieści spokojnie 20 osób.', '2017-02-17 14:37:59'),
(4, 82, 74, 1, 3, 'Dom w Andrychowie', '420000.00', 'To jest przepiękny dom w miejscowości Andrychów, położonej niedaleko Wadowic.', '2017-02-17 14:37:59'),
(5, 83, 75, 4, 2, 'Mieszkanie Kraków', '432000.00', 'To jest dwu pokojowe mieszkanie', '2017-02-18 13:15:46'),
(11, 89, 81, 2, 1, 'Działka w Inwałdzie', '150000.00', 'Działka w Inwałdzie', '2017-02-18 14:04:44');
