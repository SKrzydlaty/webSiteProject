
-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `logtable`
--

CREATE TABLE `logtable` (
  `id_logtable` int(4) NOT NULL,
  `logtable_ip` varchar(39) COLLATE utf8_bin NOT NULL,
  `logtable_web` varchar(200) COLLATE utf8_bin NOT NULL,
  `logtable_name` varchar(20) COLLATE utf8_bin NOT NULL,
  `logtable_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `logtable_result` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Zrzut danych tabeli `logtable`
--

INSERT INTO `logtable` (`id_logtable`, `logtable_ip`, `logtable_web`, `logtable_name`, `logtable_time`, `logtable_result`) VALUES
(261, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-29 09:08:42', 1),
(262, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-29 09:46:13', 1),
(263, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-29 10:26:15', 1),
(264, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-29 10:37:38', 1),
(265, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-29 12:36:31', 1),
(266, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-29 13:05:16', 1),
(267, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-29 13:27:08', 1),
(268, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-29 13:50:58', 1),
(269, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-29 15:39:02', 1),
(270, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-29 15:49:11', 1),
(271, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-29 16:15:04', 1),
(272, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-29 16:15:24', 1),
(273, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-29 16:25:29', 1),
(274, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-29 16:36:12', 1),
(275, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-29 16:48:57', 1),
(276, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-29 17:28:20', 1),
(277, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-29 17:42:57', 1),
(278, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-29 17:53:50', 1),
(279, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-29 18:27:53', 1),
(280, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-29 21:04:28', 1),
(281, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-29 21:16:22', 1),
(282, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-29 21:26:44', 1),
(283, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-29 21:59:51', 1),
(284, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-29 22:10:12', 1),
(285, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-29 22:28:26', 1),
(286, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-29 22:47:59', 1),
(287, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-29 22:59:56', 1),
(288, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-29 23:10:13', 1),
(289, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-29 23:26:22', 1),
(290, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-29 23:36:30', 1),
(291, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-30 11:42:39', 1),
(292, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-30 11:53:43', 1),
(293, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-30 12:04:53', 1),
(294, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-30 12:18:48', 1),
(295, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-30 12:31:51', 1),
(296, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-30 12:32:12', 1),
(297, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-30 15:17:02', 1),
(298, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-30 16:02:44', 1),
(299, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-30 17:42:41', 1),
(300, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-30 17:44:35', 1),
(301, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-30 18:05:53', 1),
(302, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-30 18:20:13', 1),
(303, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-30 18:23:30', 1),
(304, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-30 18:32:59', 1),
(305, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-30 18:41:44', 1),
(306, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-30 18:52:59', 1),
(307, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-30 19:06:04', 1),
(308, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-30 19:20:35', 1),
(309, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-30 19:26:52', 1),
(310, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-30 19:47:18', 1),
(311, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-30 20:01:12', 1),
(312, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'test', '2017-01-30 20:07:30', 1),
(313, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', 'nel', '2017-01-30 20:20:27', 1);
