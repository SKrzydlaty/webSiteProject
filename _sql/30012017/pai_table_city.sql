
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
(1, 'Andrychow'),
(2, 'Kalwaria Zebrzydowska'),
(3, 'Krakow'),
(4, 'Wadowice'),
(5, 'Zywiec');
