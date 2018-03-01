-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2017-09-15 01:35:54
-- 服务器版本： 5.7.14
-- PHP Version: 7.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ktv`
--

-- --------------------------------------------------------

--
-- 表的结构 `fangjian`
--

CREATE TABLE `fangjian` (
  `id` int(10) NOT NULL,
  `num` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fangjian`
--

INSERT INTO `fangjian` (`id`, `num`) VALUES
(1, '12345678');

-- --------------------------------------------------------

--
-- 表的结构 `geshou`
--

CREATE TABLE `geshou` (
  `id` int(12) NOT NULL,
  `name` varchar(20) NOT NULL,
  `num` int(20) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `lanmuid` int(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `geshou`
--

INSERT INTO `geshou` (`id`, `name`, `num`, `img`, `lanmuid`) VALUES
(1, '好妹妹乐队', 382, '/static/img/zuhe0.jpg', 1),
(2, 'Beyongd', 123, '/static/img/zuhe1.jpg', 1),
(3, '五月天', 456, '/static/img/zuhe2.jpg', 1),
(4, 'TFBoys', 455, '/static/img/zuhe3.jpg', 1),
(5, '南拳妈妈', 334, '/static/img/zuhe4.jpg', 1),
(6, '苏打绿', 231, '/static/img/zuhe5.jpg', 1),
(7, '逃跑计划', 666, '/static/img/zuhe6.jpg', 1),
(8, 'GALA', 321, '/static/img/zuhe7.jpg', 1),
(9, '牛奶咖啡', 222, '/static/img/zuhe8.jpg', 1);

-- --------------------------------------------------------

--
-- 表的结构 `lanmu`
--

CREATE TABLE `lanmu` (
  `id` int(12) NOT NULL,
  `lanmu` char(50) NOT NULL,
  `img` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `lanmu`
--

INSERT INTO `lanmu` (`id`, `lanmu`, `img`) VALUES
(1, '内地偶像组合', '/static/img/pic_03.jpg'),
(2, '内地男歌手', '/static/img/pic_07.jpg'),
(3, '港台歌手', '/static/img/pic_09.jpg'),
(4, '日韩女歌手', '/static/img/pic_11.jpg'),
(5, '内地女歌手', '/static/img/pic_16.jpg'),
(6, '青春偶像歌手', '/static/img/pic_18.jpg');

-- --------------------------------------------------------

--
-- 表的结构 `pindao`
--

CREATE TABLE `pindao` (
  `id` int(10) NOT NULL,
  `pindao` char(20) NOT NULL,
  `url` varchar(100) NOT NULL,
  `img` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `pindao`
--

INSERT INTO `pindao` (`id`, `pindao`, `url`, `img`) VALUES
(1, '点歌', '#/song', '/static/img/index_diange.png'),
(2, '游戏', '#/game', '/static/img/index_game.png'),
(3, '商店', '#/store', '/static/img/index_store.png'),
(4, '我的', '#/me', '/static/img/index_main.png');

-- --------------------------------------------------------

--
-- 表的结构 `shop`
--

CREATE TABLE `shop` (
  `id` int(12) NOT NULL,
  `name` char(50) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `danwei` char(15) DEFAULT NULL,
  `storeid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `shop`
--

INSERT INTO `shop` (`id`, `name`, `price`, `img`, `danwei`, `storeid`) VALUES
(1, 'HELMSAN啤酒', 8.6, '/static/img/1.png', '瓶', 1),
(2, 'SNUEDAN啤酒', 9.8, '/static/img/2.png', '瓶', 1),
(3, 'MSAN啤酒', 9.8, '/static/img/3.png', '瓶', 1),
(4, 'MUIC', 2.8, '/static/img/4.png', '袋', 2),
(5, 'MUIC', 9.8, '/static/img/5.png', '袋', 2);

-- --------------------------------------------------------

--
-- 表的结构 `shopingform`
--

CREATE TABLE `shopingform` (
  `id` int(12) NOT NULL,
  `name` varchar(100) NOT NULL,
  `img` varchar(255) NOT NULL,
  `price` int(12) NOT NULL,
  `num` int(12) DEFAULT NULL,
  `fangjian` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `shopingform`
--

INSERT INTO `shopingform` (`id`, `name`, `img`, `price`, `num`, `fangjian`) VALUES
(1, 'HELMSAN啤酒', '/static/img/1.png', 9, 3, '12345678'),
(2, 'SNUEDAN啤酒', '/static/img/2.png', 10, 2, '12345678');

-- --------------------------------------------------------

--
-- 表的结构 `song`
--

CREATE TABLE `song` (
  `id` int(12) NOT NULL,
  `name` char(100) NOT NULL,
  `time` char(20) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `lrc` text NOT NULL,
  `geshouid` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `song`
--

INSERT INTO `song` (`id`, `name`, `time`, `url`, `lrc`, `geshouid`) VALUES
(1, '啊，朋友再见', '05:02', '/static/audio/蒋明,冬子,刘东明 - 啊朋友 再见.mp3', '/static/lrc/蒋明,冬子,刘东明 - 啊朋友 再见.lrc', 1),
(2, 're create', '03:40', '/static/audio/澤野弘之 - gravityWall.mp3', '/static/lrc/澤野弘之 - gravityWall.lrc', 1);

-- --------------------------------------------------------

--
-- 表的结构 `store`
--

CREATE TABLE `store` (
  `id` int(10) NOT NULL,
  `name` char(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `store`
--

INSERT INTO `store` (`id`, `name`) VALUES
(1, '酒水'),
(2, '零食');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `fangjian`
--
ALTER TABLE `fangjian`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `geshou`
--
ALTER TABLE `geshou`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lanmu`
--
ALTER TABLE `lanmu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pindao`
--
ALTER TABLE `pindao`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop`
--
ALTER TABLE `shop`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shopingform`
--
ALTER TABLE `shopingform`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `song`
--
ALTER TABLE `song`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `store`
--
ALTER TABLE `store`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `fangjian`
--
ALTER TABLE `fangjian`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `geshou`
--
ALTER TABLE `geshou`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- 使用表AUTO_INCREMENT `lanmu`
--
ALTER TABLE `lanmu`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- 使用表AUTO_INCREMENT `pindao`
--
ALTER TABLE `pindao`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- 使用表AUTO_INCREMENT `shop`
--
ALTER TABLE `shop`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- 使用表AUTO_INCREMENT `shopingform`
--
ALTER TABLE `shopingform`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `song`
--
ALTER TABLE `song`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `store`
--
ALTER TABLE `store`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
