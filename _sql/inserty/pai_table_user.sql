
--
-- Zrzut danych tabeli `user`
--

INSERT INTO `user` (`ID_USER_PK`, `ID_USERTYPE_FK`, `USER_LOGIN`, `USER_PASS`, `USER_SALT`, `USER_NAME`, `USER_SURNAME`, `USER_PESEL`, `USER_TIME`) VALUES
(1, 1, 'admin', 'c07895d564c812ae10dfbcfc5185c086dc3e3115', '446', 'Krzysztof', 'Stuglik', '93999999999', '2017-01-30 17:19:00'),
(2, 2, 'test', '92a59d0ce73073868624e2181aadab0d0cf5026f', '759', 'Test', 'Test', '12332112332', '2016-12-10 11:16:30'),
(3, 2, 'nel', '3972a849e8f9e4e929d5541f1787ea2832449e65', '928', 'Nel', 'Rawlison', '11122233344', '2016-12-09 09:19:46'),
(4, 2, 'kowalski', 'ec3a0047dfbeb2857007ed01f9d4a1e2d9577186', '840', 'Jan', 'Kowalski', '98765432100', '2017-01-30 17:16:05'),
(41, 2, 'chmura', 'fe71cb4fea5582707f00f2dbb8a18a9d1cdf0e8a', '700', 'Aleksandra', 'Chmura', '95959595959', '2017-02-06 17:02:08'),
(43, 2, 'wysocka', '6272f1e154b3cea5354168746ebef47da5977257', '13', 'Anna', 'Wysocka', '97979797977', '2017-02-06 22:41:31'),
(47, 2, 'miki', '2a877bde29b8afde8530e45a96e67c4857f95aef', '431', 'Myszka', 'Miki', '12345678910', '2017-02-07 08:24:46'),
(48, 2, 'eliza', '8881704b7e78b63238db8c7f9a8ed7080e6a6764', '234', 'Eliza', 'Orzeszkowa', '93052405220', '2017-02-16 16:06:35'),
(49, 2, 'donald', '26c674d7753d7fbfbb0099233df171b0bf51d0c7', '929', 'Kaczor', 'Donald', '93081004416', '2017-02-16 16:32:51'),
(50, 2, 'ikea', '9a056afb0ded1282f7eded54aab0978b2738a333', '628', 'Ikea', 'Ikea', '90121203316', '2017-02-16 17:02:02');
