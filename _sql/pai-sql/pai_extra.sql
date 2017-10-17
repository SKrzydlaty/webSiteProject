
--
-- Indeksy dla zrzutów tabel
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`ID_ADDRESS_PK`),
  ADD KEY `ID_CITY_FK` (`ID_CITY_FK`),
  ADD KEY `ID_USER_FK` (`ID_USER_FK`);

--
-- Indexes for table `buy`
--
ALTER TABLE `buy`
  ADD PRIMARY KEY (`ID_BUY_PK`),
  ADD KEY `ID_property_FK` (`ID_PROPERTY_FK`),
  ADD KEY `ID_user_FK2` (`ID_USER_FK`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id_city_pk`),
  ADD UNIQUE KEY `city_title` (`city_title`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`ID_CONTACT_PK`),
  ADD KEY `ID_user_FK3` (`ID_USER_FK`);

--
-- Indexes for table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`ID_IMAGE_PK`),
  ADD KEY `ID_property_FK2` (`ID_PROPERTY_FK`);

--
-- Indexes for table `localization`
--
ALTER TABLE `localization`
  ADD PRIMARY KEY (`ID_LOCALIZATION_PK`),
  ADD KEY `ID_CITY_FK2` (`ID_CITY_FK`);

--
-- Indexes for table `logtable`
--
ALTER TABLE `logtable`
  ADD PRIMARY KEY (`id_logtable`);

--
-- Indexes for table `property`
--
ALTER TABLE `property`
  ADD PRIMARY KEY (`ID_PROPERTY_PK`),
  ADD UNIQUE KEY `PROPERTY_TITLE` (`PROPERTY_TITLE`),
  ADD KEY `ID_space_FK` (`ID_SPACE_FK`),
  ADD KEY `ID_localization_FK2` (`ID_LOCALIZATION_FK`),
  ADD KEY `ID_type_FK2` (`ID_TYPE_FK`),
  ADD KEY `ID_user_FK4` (`ID_USER_FK`);

--
-- Indexes for table `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`ID_SESSION_PK`),
  ADD KEY `ID_USER_FK` (`ID_USER_FK`);

--
-- Indexes for table `space`
--
ALTER TABLE `space`
  ADD PRIMARY KEY (`ID_SPACE_PK`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`ID_TYPE_PK`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID_USER_PK`),
  ADD UNIQUE KEY `USER_LOGIN` (`USER_LOGIN`),
  ADD UNIQUE KEY `USER_NAME` (`USER_NAME`),
  ADD UNIQUE KEY `USER_SURNAME` (`USER_SURNAME`),
  ADD UNIQUE KEY `USER_PESEL` (`USER_PESEL`);

--
-- Indexes for table `visit`
--
ALTER TABLE `visit`
  ADD PRIMARY KEY (`id_visit_pk`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `address`
--
ALTER TABLE `address`
  MODIFY `ID_ADDRESS_PK` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT dla tabeli `buy`
--
ALTER TABLE `buy`
  MODIFY `ID_BUY_PK` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT dla tabeli `city`
--
ALTER TABLE `city`
  MODIFY `id_city_pk` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT dla tabeli `contact`
--
ALTER TABLE `contact`
  MODIFY `ID_CONTACT_PK` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;
--
-- AUTO_INCREMENT dla tabeli `image`
--
ALTER TABLE `image`
  MODIFY `ID_IMAGE_PK` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT dla tabeli `localization`
--
ALTER TABLE `localization`
  MODIFY `ID_LOCALIZATION_PK` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;
--
-- AUTO_INCREMENT dla tabeli `logtable`
--
ALTER TABLE `logtable`
  MODIFY `id_logtable` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=297;
--
-- AUTO_INCREMENT dla tabeli `property`
--
ALTER TABLE `property`
  MODIFY `ID_PROPERTY_PK` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT dla tabeli `session`
--
ALTER TABLE `session`
  MODIFY `ID_SESSION_PK` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;
--
-- AUTO_INCREMENT dla tabeli `space`
--
ALTER TABLE `space`
  MODIFY `ID_SPACE_PK` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT dla tabeli `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT dla tabeli `type`
--
ALTER TABLE `type`
  MODIFY `ID_TYPE_PK` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT dla tabeli `user`
--
ALTER TABLE `user`
  MODIFY `ID_USER_PK` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;
--
-- AUTO_INCREMENT dla tabeli `visit`
--
ALTER TABLE `visit`
  MODIFY `id_visit_pk` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `ID_CITY_FK` FOREIGN KEY (`ID_CITY_FK`) REFERENCES `city` (`id_city_pk`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ID_USER_FK` FOREIGN KEY (`ID_USER_FK`) REFERENCES `user` (`ID_USER_PK`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `buy`
--
ALTER TABLE `buy`
  ADD CONSTRAINT `ID_property_FK` FOREIGN KEY (`ID_PROPERTY_FK`) REFERENCES `property` (`ID_PROPERTY_PK`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ID_user_FK2` FOREIGN KEY (`ID_USER_FK`) REFERENCES `user` (`ID_USER_PK`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `contact`
--
ALTER TABLE `contact`
  ADD CONSTRAINT `ID_user_FK3` FOREIGN KEY (`ID_USER_FK`) REFERENCES `user` (`ID_USER_PK`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `image`
--
ALTER TABLE `image`
  ADD CONSTRAINT `ID_property_FK2` FOREIGN KEY (`ID_PROPERTY_FK`) REFERENCES `property` (`ID_PROPERTY_PK`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `localization`
--
ALTER TABLE `localization`
  ADD CONSTRAINT `ID_CITY_FK2` FOREIGN KEY (`ID_CITY_FK`) REFERENCES `city` (`id_city_pk`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `property`
--
ALTER TABLE `property`
  ADD CONSTRAINT `ID_localization_FK` FOREIGN KEY (`ID_LOCALIZATION_FK`) REFERENCES `localization` (`ID_LOCALIZATION_PK`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ID_localization_FK2` FOREIGN KEY (`ID_LOCALIZATION_FK`) REFERENCES `localization` (`ID_LOCALIZATION_PK`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ID_space_FK` FOREIGN KEY (`ID_SPACE_FK`) REFERENCES `space` (`ID_SPACE_PK`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ID_type_FK` FOREIGN KEY (`ID_TYPE_FK`) REFERENCES `type` (`ID_TYPE_PK`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ID_type_FK2` FOREIGN KEY (`ID_TYPE_FK`) REFERENCES `type` (`ID_TYPE_PK`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ID_user_FK4` FOREIGN KEY (`ID_USER_FK`) REFERENCES `user` (`ID_USER_PK`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `session`
--
ALTER TABLE `session`
  ADD CONSTRAINT `session_ibfk_1` FOREIGN KEY (`ID_USER_FK`) REFERENCES `user` (`ID_USER_PK`) ON DELETE CASCADE ON UPDATE CASCADE;
