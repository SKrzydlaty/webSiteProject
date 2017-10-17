
-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `arch_users`
--

CREATE TABLE `arch_users` (
  `PersonID` int(4) DEFAULT NULL,
  `NAME` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `SURNAME` varchar(20) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Zrzut danych tabeli `arch_users`
--

INSERT INTO `arch_users` (`PersonID`, `NAME`, `SURNAME`) VALUES
(4, '', ''),
(7, 'a', 'b'),
(12, 'a', 'b'),
(1, 'Jan', 'Kowalski'),
(2, 'Ela', 'Kowalska'),
(3, 'Ala', 'Nowak'),
(5, '', ''),
(19, 'a', 'b'),
(20, 'Ula', 'PiÄ™kna'),
(22, 'J', 'K'),
(30, 'Kasia2', 'A2'),
(31, 'zxc', 'zxc'),
(33, 'p', 'p'),
(35, 'v', 'v'),
(36, 'v', 'v'),
(32, 'zxc', 'zxc'),
(34, 'p', 'p'),
(37, 'R', 'R'),
(24, 'krzy_s12@wp.pl', 'b'),
(39, 'aae', 'aae'),
(40, 'aa', 'aa'),
(28, 'Ola', 'M'),
(29, 'Kasia', 'A'),
(41, 'aa', 'aa'),
(25, 'Madzia', 'Niebieska'),
(54, 'y', 'y'),
(23, 'aA', 'Aa'),
(76, 'Kasia', 'nn'),
(85, 'bn', 'bn'),
(87, 'ty', 'ty'),
(88, 'sad', 'sad'),
(92, 'Klara', 'Lipiec'),
(100, 'Asia', 'N'),
(101, 'Basia', 'O'),
(104, '', ''),
(86, 'test', 'test'),
(91, 'Krzysztof', 'Stuglik'),
(107, 'A', 'B'),
(102, 'qwerty', 'asd'),
(103, 'Jan', 'Kowalski'),
(108, 'James', 'Bond'),
(109, 'Sherlock', 'Holmes'),
(110, 'Koala', 'MiÅ›'),
(113, 'Ultras', 'Super'),
(114, 'a', 'a'),
(116, 'zxczxc', 'zxczxc'),
(117, 'aaa', 'aaaaaa'),
(119, 'quake', 'quake'),
(120, 'Air', 'Air'),
(121, 'Jan', 'Kowalski');
