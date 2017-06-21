-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Июн 21 2017 г., 19:21
-- Версия сервера: 10.1.9-MariaDB
-- Версия PHP: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `movies`
--

-- --------------------------------------------------------

--
-- Структура таблицы `connect`
--

CREATE TABLE `connect` (
  `id_user` tinyint(3) UNSIGNED DEFAULT NULL,
  `session` varchar(32) NOT NULL,
  `token` varchar(32) NOT NULL,
  `id` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `connect`
--

INSERT INTO `connect` (`id_user`, `session`, `token`, `id`) VALUES
(2, 'j32y5hnd8e37lrmoyhbv5nh32fcjaloj', 'fh8aomdmr7k2oxgd4iy0v6tobvyb7dlc', 3),
(1, 'jpko9myyos6cuvioj7xg9zasqanandvx', 't5csh0gwidy2y7h744e4ufmbf0cs3xgm', 4),
(1, 'si509cmhfba48h12c6xwbaxg0zztn665', 'f2we59laam59tw2wtpjvp61fwrz9ow5t', 7),
(1, 'ukom4tufiq0fchi1mafy78wdlhksvc9f', 'nnsh6cnftdkvltmxuslrq8v2g5k18j7l', 8),
(3, '59ogowcm6vn2ivjx19gi8c56khano8rj', '76qlttxqebinwraorgwqjrmuzn7dlpni', 10),
(1, 'xphs0d5xc1gn1x7gcyv7jg7v1k3vkgk8', 'wsrmvn9yefc63ad5yy3851twbnimttkf', 12);

-- --------------------------------------------------------

--
-- Структура таблицы `film`
--

CREATE TABLE `film` (
  `id_film` tinyint(3) UNSIGNED NOT NULL,
  `name` varchar(300) NOT NULL,
  `video` varchar(500) NOT NULL,
  `photo` varchar(500) NOT NULL,
  `storyline` text NOT NULL,
  `id_genre` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `film`
--

INSERT INTO `film` (`id_film`, `name`, `video`, `photo`, `storyline`, `id_genre`) VALUES
(1, 'Batman v Superman: Dawn of Justice', 'https://www.youtube.com/embed/IwfUnkBfdZ4', 'img/batman-v-superman.jpg', 'Following his titanic struggle against General Zod, Metropolis has been razed to the ground and Superman is the most controversial figure in the world. While for many he is still an emblem of hope, a growing number of people consider him a threat to humanity, seeking justice for the chaos he has brought to Earth. As far as Bruce Wayne is concerned, Superman is clearly a danger to society. He fears for the future of the world with such a reckless power left ungoverned, and so he dons his mask and cape to right Superman''s wrongs. The rivalry between them is furious, fueled by bitterness and vengeance, and nothing can dissuade them from waging this war. However, a dark new threat arises in the form of a third man: one who has a power greater than either of them to endanger the world and cause total destruction!', 2),
(2, 'Deadpool', 'https://www.youtube.com/embed/ONHBaC-pfsk', 'img/deadpool.jpg', 'This is the origin story of former Special Forces operative turned mercenary Wade Wilson, who after being subjected to a rogue experiment that leaves him with accelerated healing powers, adopts the alter ego Deadpool. Armed with his new abilities and a dark, twisted sense of humor, Deadpool hunts down the man who nearly destroyed his life. ', 4),
(3, 'X-Men: Apocalypse', 'https://www.youtube.com/embed/PfBVIHgQbYk', 'img/X-Men.jpg', 'Since the dawn of civilization, he was worshiped as a god. Apocalypse, the first and most powerful mutant from Marvel''s X-Men universe, amassed the powers of many other mutants, becoming immortal and invincible. Upon awakening after thousands of years, he is disillusioned with the world as he finds it and recruits a team of powerful mutants, including a disheartened Magneto, to cleanse mankind and create a new world order, over which he will reign. As the fate of the Earth hangs in the balance, Raven with the help of Professor X must lead a team of young X-Men to stop their greatest nemesis and save mankind from complete destruction.  ', 2),
(4, 'Brooklyn', 'https://www.youtube.com/embed/15syDwC000k', 'img/Brooklyn.jpg', 'In late 1951, Eilis Lacey, a young Irish girl, emigrates to Brooklyn. Sponsored by Father Flood, a priest from her native town Enniscorthy, she is assured to find a full-time job there. But the early days are tough, seasickness being soon replaced by loneliness and homesickness, two feelings all the more acutely felt by Eilis for having had to leave behind her widowed mother and her dear sister Rose. She nevertheless little by little manages to find her footing by adapting to her job as a salesgirl, by studying bookkeeping at Brooklyn College as well as with a little help from both Father Flood and Mrs. Kehoe, the owner of the boarding school she now lives in. And not only does graduation follow but love shows its face in Tony, an Italian-American plumber, full of adoration and respect for her. They end up marrying, although keeping the thing secret. It is at that point that tragedy strikes: Rose suddenly dies. Which incites Eilis to return to Enniscorthy, in order to share her sorrow...  ', 5),
(5, 'Captain America: Civil War', 'https://www.youtube.com/embed/uVdV-lxRPFo', 'img/captain_america.jpg', 'After another incident involving the Avengers results in collateral damage, political pressure mounts to install a system of accountability, headed by a governing body to oversee and direct the team. The new status quo fractures the Avengers, resulting in two camps, one led by Steve Rogers and his desire for the Avengers to remain free to defend humanity without government interference, and the other following Tony Stark''s surprising decision to support government oversight and accountability.', 2),
(6, 'The Revenant', 'https://www.youtube.com/embed/QRfj1VCg16Y', 'img/Revenant.png', 'While exploring the uncharted wilderness in 1823, legendary frontiersman Hugh Glass sustains injuries from a brutal bear attack. When his hunting team leaves him for dead, Glass must utilize his survival skills to find a way back home while avoiding natives on their own hunt. Grief-stricken and fueled by vengeance, Glass treks through the wintry terrain to track down John Fitzgerald, the former confidant who betrayed and abandoned him. ', 5),
(7, 'Zootopia', 'https://www.youtube.com/embed/Y0c3nKWhlIA', 'img/zootopia.jpg', 'From the largest elephant to the smallest shrew, the city of Zootopia is a mammal metropolis where various animals live and thrive. When Judy Hopps becomes the first rabbit to join the police force, she quickly learns how tough it is to enforce the law. Determined to prove herself, Judy jumps at the opportunity to solve a mysterious case. Unfortunately, that means working with Nick Wilde, a wily fox who makes her job even harder.  ', 6);

-- --------------------------------------------------------

--
-- Структура таблицы `genre`
--

CREATE TABLE `genre` (
  `id_genre` tinyint(3) UNSIGNED NOT NULL,
  `genre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `genre`
--

INSERT INTO `genre` (`id_genre`, `genre`) VALUES
(1, 'Action '),
(2, 'Adventure '),
(3, 'Fantasy '),
(4, 'Comedy'),
(5, 'Drama'),
(6, 'Animation');

-- --------------------------------------------------------

--
-- Структура таблицы `person`
--

CREATE TABLE `person` (
  `id_person` tinyint(3) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `person`
--

INSERT INTO `person` (`id_person`, `name`) VALUES
(1, 'Zack Snyder '),
(2, 'Chris Terrio '),
(3, 'David S. Goyer '),
(4, 'Ben Affleck '),
(5, 'Henry Cavill '),
(6, 'Amy Adams'),
(7, 'Tim Miller'),
(8, 'Rhett Reese'),
(9, 'Paul Wernick'),
(10, 'Ryan Reynolds'),
(11, 'Morena Baccarin'),
(12, 'T.J. Miller'),
(13, 'Bryan Singer'),
(14, 'Simon Kinberg'),
(15, 'Sophie Turner'),
(16, 'Jennifer Lawrence'),
(17, 'Olivia Munn '),
(18, 'John Crowley'),
(19, 'Nick Hornby'),
(20, 'Colm Tóibín'),
(21, 'Saoirse Ronan'),
(22, 'Emory Cohen'),
(23, 'Domhnall Gleeson'),
(24, 'Anthony Russo'),
(25, 'Joe Russo'),
(26, 'Christopher Markus'),
(27, 'Stephen McFeely'),
(28, 'Chris Evans'),
(29, 'Robert Downey Jr.'),
(30, 'Scarlett Johansson'),
(31, 'Alejandro G. Iñárritu'),
(32, 'Mark L. Smith'),
(33, 'Alejandro G. Iñárritu'),
(34, 'Leonardo DiCaprio'),
(35, 'Tom Hardy'),
(36, 'Will Poulter '),
(37, 'Byron Howard'),
(38, 'Rich Moore'),
(40, 'Jared Bush'),
(41, 'Ginnifer Goodwin'),
(42, 'Jason Bateman'),
(43, 'Idris Elba');

-- --------------------------------------------------------

--
-- Структура таблицы `schedule`
--

CREATE TABLE `schedule` (
  `id_schedule` tinyint(3) UNSIGNED NOT NULL,
  `id_film` tinyint(3) UNSIGNED DEFAULT NULL,
  `time` datetime NOT NULL,
  `price` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `schedule`
--

INSERT INTO `schedule` (`id_schedule`, `id_film`, `time`, `price`) VALUES
(1, 1, '2016-05-17 10:00:00', 50),
(2, 1, '2016-05-18 13:00:00', 100),
(3, 1, '2016-05-20 18:00:00', 100),
(4, 1, '2016-05-21 21:00:00', 100),
(5, 2, '2016-05-19 10:00:00', 100),
(6, 2, '2016-05-22 13:00:00', 100),
(8, 3, '2016-05-17 13:00:00', 100),
(9, 3, '2016-05-20 10:00:00', 100),
(10, 3, '2016-05-21 10:00:00', 100),
(11, 3, '2016-05-23 10:00:00', 100),
(12, 4, '2016-05-17 16:00:00', 100),
(13, 4, '2016-05-19 13:00:00', 100),
(14, 4, '2016-05-20 13:00:00', 100),
(15, 4, '2016-05-22 10:00:00', 100),
(16, 4, '2016-05-23 13:00:00', 100),
(17, 5, '2016-05-18 10:00:00', 100),
(18, 5, '2016-05-20 21:00:00', 100),
(19, 5, '2016-05-21 13:00:00', 100),
(20, 5, '2016-05-22 16:00:00', 100),
(21, 6, '2016-05-17 20:00:00', 100),
(22, 6, '2016-05-18 16:00:00', 100),
(23, 6, '2016-05-19 16:00:00', 100),
(24, 6, '2016-05-21 16:00:00', 100),
(25, 6, '2016-05-23 16:00:00', 100),
(26, 7, '2016-05-18 21:00:00', 100),
(27, 7, '2016-05-19 19:00:00', 100),
(28, 7, '2016-05-22 20:00:00', 100),
(30, 3, '2016-05-23 21:00:00', 100);

-- --------------------------------------------------------

--
-- Структура таблицы `status`
--

CREATE TABLE `status` (
  `id_status` tinyint(3) UNSIGNED NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `status`
--

INSERT INTO `status` (`id_status`, `status`) VALUES
(1, 'Director'),
(2, 'Writer'),
(3, 'Actor');

-- --------------------------------------------------------

--
-- Структура таблицы `ticket`
--

CREATE TABLE `ticket` (
  `id_ticket` tinyint(3) UNSIGNED NOT NULL,
  `id_user` tinyint(3) UNSIGNED DEFAULT NULL,
  `id_film` tinyint(3) UNSIGNED DEFAULT NULL,
  `id_schedule` tinyint(3) UNSIGNED DEFAULT NULL,
  `num_row` int(2) UNSIGNED DEFAULT NULL,
  `num_seat` int(2) UNSIGNED DEFAULT NULL,
  `buyer_name` varchar(100) DEFAULT NULL,
  `buyer_email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ticket`
--

INSERT INTO `ticket` (`id_ticket`, `id_user`, `id_film`, `id_schedule`, `num_row`, `num_seat`, `buyer_name`, `buyer_email`) VALUES
(1, 1, 1, 4, 4, 5, NULL, NULL),
(2, 1, 1, 4, 3, 7, NULL, NULL),
(3, NULL, NULL, 1, 5, 5, '1', '1'),
(4, NULL, NULL, 1, 5, 6, '1', '1'),
(5, NULL, NULL, 8, 1, 3, '123', 'user@domain.com'),
(6, NULL, NULL, 8, 1, 4, '123', 'user@domain.com'),
(7, NULL, NULL, 8, 1, 5, '123', 'user@domain.com'),
(8, NULL, NULL, 8, 1, 6, '123', 'user@domain.com'),
(9, NULL, NULL, 8, 1, 7, '123', 'user@domain.com'),
(10, NULL, NULL, 8, 1, 8, '123', 'user@domain.com'),
(11, NULL, NULL, 8, 6, 3, '2', 'user@domain.com'),
(12, NULL, NULL, 8, 6, 4, '2', 'user@domain.com'),
(13, NULL, NULL, 8, 6, 5, '2', 'user@domain.com'),
(14, NULL, NULL, 8, 6, 6, '2', 'user@domain.com'),
(15, NULL, NULL, 8, 6, 7, '2', 'user@domain.com'),
(16, NULL, NULL, 8, 6, 8, '2', 'user@domain.com'),
(17, NULL, NULL, 8, 4, 3, '3', 'user@domain.com'),
(18, NULL, NULL, 8, 4, 4, '3', 'user@domain.com'),
(19, NULL, NULL, 8, 4, 5, '3', 'user@domain.com'),
(20, NULL, NULL, 8, 4, 6, '3', 'user@domain.com'),
(21, NULL, NULL, 8, 4, 7, '3', 'user@domain.com'),
(22, NULL, NULL, 8, 4, 8, '3', 'user@domain.com'),
(23, NULL, NULL, 12, 4, 5, '4', 'user@domain.com'),
(24, NULL, NULL, 12, 4, 6, '4', 'user@domain.com'),
(25, NULL, NULL, 21, 4, 5, '5', 'user@domain.com'),
(26, NULL, NULL, 21, 4, 6, '5', 'user@domain.com'),
(27, NULL, NULL, 12, 5, 8, '1', '1@1.com'),
(28, NULL, NULL, 12, 5, 9, '1', '1@1.com'),
(29, NULL, NULL, 17, 2, 5, '1', '2'),
(30, NULL, NULL, 17, 2, 6, '1', '2'),
(31, NULL, NULL, 17, 2, 7, '1', '2'),
(32, NULL, NULL, 17, 5, 5, '1', '2'),
(33, NULL, NULL, 17, 5, 6, '1', '2'),
(34, NULL, NULL, 12, 5, 4, 'anna', 'anna@mail.ru'),
(35, NULL, NULL, 12, 5, 5, 'anna', 'anna@mail.ru'),
(36, NULL, NULL, 12, 5, 6, 'anna', 'anna@mail.ru'),
(37, NULL, NULL, 1, 3, 5, '45', '45'),
(38, NULL, NULL, 1, 3, 6, '45', '45'),
(39, NULL, NULL, 1, 7, 5, 'web', 'web@web.com'),
(40, NULL, NULL, 1, 7, 6, 'web', 'web@web.com'),
(41, NULL, NULL, 12, 6, 6, 'Anna', 'volkova.annie@gmail.com'),
(42, NULL, NULL, 12, 6, 7, 'Anna', 'volkova.annie@gmail.com'),
(43, NULL, NULL, 12, 6, 8, 'Anna', 'volkova.annie@gmail.com'),
(44, NULL, NULL, 21, 4, 2, 'arty', 'shercat@mail.ru'),
(45, NULL, NULL, 21, 1, 6, 'arty', 'shercat@mail.ru'),
(46, NULL, NULL, 21, 3, 7, 'arty', 'shercat@mail.ru'),
(47, NULL, NULL, 21, 3, 8, 'arty', 'shercat@mail.ru'),
(48, NULL, NULL, 1, 4, 5, '1', '1'),
(49, NULL, NULL, 1, 4, 6, '1', '1'),
(50, NULL, NULL, 1, 4, 7, '1', '1'),
(51, NULL, NULL, 1, 2, 3, 'dgf', 'fgdfg'),
(52, NULL, NULL, 1, 2, 4, 'dgf', 'fgdfg'),
(53, NULL, NULL, 15, 5, 4, '1', '1'),
(54, NULL, NULL, 15, 5, 5, '1', '1');

-- --------------------------------------------------------

--
-- Структура таблицы `tmp_film`
--

CREATE TABLE `tmp_film` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `id_film` tinyint(3) UNSIGNED DEFAULT NULL,
  `id_person` tinyint(3) UNSIGNED DEFAULT NULL,
  `id_status` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `tmp_film`
--

INSERT INTO `tmp_film` (`id`, `id_film`, `id_person`, `id_status`) VALUES
(1, 1, 1, 1),
(2, 1, 2, 2),
(3, 1, 3, 2),
(4, 1, 4, 3),
(5, 1, 5, 3),
(6, 1, 6, 3),
(7, 2, 7, 1),
(8, 2, 8, 2),
(9, 2, 9, 2),
(10, 2, 10, 3),
(11, 2, 11, 3),
(12, 2, 12, 3),
(13, 3, 13, 1),
(14, 3, 14, 2),
(15, 3, 13, 2),
(16, 3, 15, 3),
(17, 3, 16, 3),
(18, 3, 17, 3),
(19, 4, 18, 1),
(20, 4, 19, 2),
(21, 4, 20, 2),
(22, 4, 21, 3),
(23, 4, 22, 3),
(24, 4, 23, 3),
(25, 5, 24, 1),
(26, 5, 25, 2),
(27, 5, 26, 2),
(28, 5, 27, 3),
(29, 5, 28, 3),
(30, 5, 29, 3),
(32, 6, 31, 1),
(33, 6, 32, 2),
(34, 6, 33, 2),
(35, 6, 34, 3),
(36, 6, 35, 3),
(37, 6, 36, 3),
(38, 7, 37, 1),
(39, 7, 38, 1),
(40, 7, 37, 2),
(41, 7, 40, 2),
(42, 7, 41, 3),
(43, 7, 42, 3),
(44, 7, 43, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `tmp_ticket`
--

CREATE TABLE `tmp_ticket` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `id_user` tinyint(3) UNSIGNED DEFAULT NULL,
  `id_ticket` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `login` varchar(30) NOT NULL,
  `pass` varchar(32) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `login`, `pass`, `email`) VALUES
(1, '123', '202cb962ac59075b964b07152d234b70', 'user@domain.com'),
(2, '1', 'c4ca4238a0b923820dcc509a6f75849b', ''),
(3, 'katya', '8222b2cdb187cda9453352082cf37cea', ''),
(4, '1234', '81dc9bdb52d04dc20036dbd8313ed055', '');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `connect`
--
ALTER TABLE `connect`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`);

--
-- Индексы таблицы `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`id_film`),
  ADD KEY `id_actor` (`id_genre`),
  ADD KEY `id_genre` (`id_genre`),
  ADD KEY `id_genre_2` (`id_genre`),
  ADD KEY `id_film` (`id_film`);

--
-- Индексы таблицы `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`id_genre`);

--
-- Индексы таблицы `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`id_person`),
  ADD KEY `id_actor` (`id_person`),
  ADD KEY `id_actor_2` (`id_person`),
  ADD KEY `id_actor_3` (`id_person`);

--
-- Индексы таблицы `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`id_schedule`),
  ADD KEY `id_schedule` (`id_schedule`),
  ADD KEY `id_film` (`id_film`);

--
-- Индексы таблицы `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id_status`),
  ADD KEY `id_status` (`id_status`);

--
-- Индексы таблицы `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`id_ticket`),
  ADD KEY `id_film` (`id_film`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_schedule` (`id_schedule`),
  ADD KEY `num_row` (`num_row`,`num_seat`);

--
-- Индексы таблицы `tmp_film`
--
ALTER TABLE `tmp_film`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_film` (`id_film`),
  ADD KEY `id_person` (`id_person`),
  ADD KEY `id_status` (`id_status`),
  ADD KEY `id_film_2` (`id_film`),
  ADD KEY `id_person_2` (`id_person`),
  ADD KEY `id_status_2` (`id_status`);

--
-- Индексы таблицы `tmp_ticket`
--
ALTER TABLE `tmp_ticket`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_ticket` (`id_ticket`),
  ADD KEY `id_user_2` (`id_user`),
  ADD KEY `id_ticket_2` (`id_ticket`),
  ADD KEY `id` (`id`),
  ADD KEY `id_user_3` (`id_user`),
  ADD KEY `id_ticket_3` (`id_ticket`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `connect`
--
ALTER TABLE `connect`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT для таблицы `film`
--
ALTER TABLE `film`
  MODIFY `id_film` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT для таблицы `genre`
--
ALTER TABLE `genre`
  MODIFY `id_genre` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT для таблицы `person`
--
ALTER TABLE `person`
  MODIFY `id_person` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT для таблицы `schedule`
--
ALTER TABLE `schedule`
  MODIFY `id_schedule` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT для таблицы `status`
--
ALTER TABLE `status`
  MODIFY `id_status` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `ticket`
--
ALTER TABLE `ticket`
  MODIFY `id_ticket` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;
--
-- AUTO_INCREMENT для таблицы `tmp_film`
--
ALTER TABLE `tmp_film`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
--
-- AUTO_INCREMENT для таблицы `tmp_ticket`
--
ALTER TABLE `tmp_ticket`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `connect`
--
ALTER TABLE `connect`
  ADD CONSTRAINT `connect_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `film`
--
ALTER TABLE `film`
  ADD CONSTRAINT `film_ibfk_1` FOREIGN KEY (`id_genre`) REFERENCES `genre` (`id_genre`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `schedule`
--
ALTER TABLE `schedule`
  ADD CONSTRAINT `schedule_ibfk_1` FOREIGN KEY (`id_film`) REFERENCES `film` (`id_film`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `ticket_ibfk_4` FOREIGN KEY (`id_schedule`) REFERENCES `schedule` (`id_schedule`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `tmp_film`
--
ALTER TABLE `tmp_film`
  ADD CONSTRAINT `tmp_film_ibfk_1` FOREIGN KEY (`id_person`) REFERENCES `person` (`id_person`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tmp_film_ibfk_2` FOREIGN KEY (`id_status`) REFERENCES `status` (`id_status`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tmp_film_ibfk_3` FOREIGN KEY (`id_film`) REFERENCES `film` (`id_film`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `tmp_ticket`
--
ALTER TABLE `tmp_ticket`
  ADD CONSTRAINT `tmp_ticket_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tmp_ticket_ibfk_2` FOREIGN KEY (`id_ticket`) REFERENCES `ticket` (`id_ticket`) ON DELETE SET NULL ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
