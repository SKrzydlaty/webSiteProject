
-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `city`
--

CREATE TABLE `city` (
  `id_city_pk` int(4) NOT NULL,
  `city_title` varchar(30) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Zrzut danych tabeli `city`
--

INSERT INTO `city` (`id_city_pk`, `city_title`) VALUES
(5, 'Andrychow'),
(3, 'Bielsko-Biala'),
(4, 'Kalwaria Zebrzydowska'),
(1, 'Krakow'),
(2, 'Wadowice'),
(6, 'Warszawa'),
(7, 'Zywiec');
