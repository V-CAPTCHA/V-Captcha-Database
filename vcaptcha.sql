-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Generation Time: Apr 04, 2022 at 06:03 PM
-- Server version: 8.0.26
-- PHP Version: 8.0.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vcaptcha`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int NOT NULL COMMENT 'รหัสประจำตัวผู้ดูแลระบบ',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'อีเมลล์ผู้ดูแลระบบ',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'รหัสผ่านผู้ดูแลระบบ',
  `first_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'ชื่อผู้ดูแลระบบ',
  `last_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'นามสกุลผู้ดูแลระบบ',
  `role` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'admin' COMMENT 'ตำแหน่งผู้ดูแลระบบ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci COMMENT='ผู้ดูแลระบบ';

-- --------------------------------------------------------

--
-- Table structure for table `authen_action`
--

CREATE TABLE `authen_action` (
  `action_id` int NOT NULL COMMENT 'รหัสข้อมูล dataset ที่ใช้ในการยืนยันตัวตน',
  `dataset_id` int NOT NULL COMMENT 'รูปที่ประกอบคำถามสำหรับยืนยันตัวตน',
  `action_reply` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'คำตอบของผู้ใช้ที่ใช้ยืนยันตัวตน',
  `action_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'วันและเวลาที่เริ่มการยืนยันตัวตน',
  `action_end` datetime DEFAULT NULL COMMENT 'วันและเวลาที่สิ้นสุดการยืนยันตัวตน',
  `action_checked` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'สถานะความถูกต้องของการยืนยันตัวตน',
  `action_valid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'none_checked' COMMENT 'สถานะการเช็คของการยืนยันตัวตน',
  `action_ip` varchar(50) NOT NULL COMMENT 'หมายเลข IP ของผู้ที่ยืนยันตัวตน',
  `key_value` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'รหัสแคปช่าคีย์'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='การยืนยันตัวตน ';

-- --------------------------------------------------------

--
-- Table structure for table `captcha_key`
--

CREATE TABLE `captcha_key` (
  `key_id` int NOT NULL COMMENT 'รหัสประจำตัวของแคปช่าคีย์',
  `key_name` varchar(50) NOT NULL COMMENT 'ชื่อของแคปช่าคีย์',
  `creation_date` date NOT NULL COMMENT 'วันที่สร้างแคปช่าคีย์',
  `domain` varchar(50) NOT NULL COMMENT 'โดเมนที่ใช้งานแคปช่าคีย์',
  `key_value` varchar(50) NOT NULL COMMENT 'รหัสแคปช่าคีย์',
  `user_id` int NOT NULL COMMENT 'รหัสประจำตัวของผู้ใช้งาน	'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='ข้อมูลแคปช่าคีย์';

-- --------------------------------------------------------

--
-- Table structure for table `dataset`
--

CREATE TABLE `dataset` (
  `dataset_id` int NOT NULL COMMENT 'รหัสข้อมูล dataset ที่ใช้ในการยืนยันตัวตน',
  `dataset_img` varchar(50) NOT NULL COMMENT 'รูปที่ประกอบคำถามสำหรับยืนยันตัวตน',
  `dataset_question` text NOT NULL COMMENT 'คำถามสำหรับยืนยันตัวตน',
  `dataset_reply` text NOT NULL COMMENT 'คำตอบสำหรับยืนยันตัวตน'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='ข้อมูลสำหรับใช้ยืนยันตัวตน ';

--
-- Dumping data for table `dataset`
--

INSERT INTO `dataset` (`dataset_id`, `dataset_img`, `dataset_question`, `dataset_reply`) VALUES
(38, 'e9ac6643468e40e06f45b5c414630e77.jpg', 'ตัวอะไรเกาะอยู่บนกิ่งไม้', 'นก,นด,เบิร์ด,เบิด,bird'),
(39, '82753d99ef54a0ee2aac1df5e75929c8.jpg', 'ผู้ชายกำลังนั่งอยู่บนอะไร', 'เก้าอี้,เก้าอี้สีขาว,เกาอี,เก้าอี,9 อี้'),
(40, 'bf56c08c6f864af5fbff6bd778d5ee80.jpg', 'หมากำลังลากอะไร', 'เลื่อน,เลือน,ที่นั่ง,คน,เจ้าของ'),
(41, '96c0573ef5bf9bfb57e7cd666fd058ea.jpg', 'เสาในรูปเขียนว่าอะไร', 'แปซิฟิก,แปซิฟิด,แปซิบฟิก,แพซิฟิก,แปสิฟิก'),
(42, 'ce908a00bdd018a20550c910d7758b2d.jpg', 'อะไรกำลังเกาะที่คอผู้หญิง', 'ผีเสื้อ,บัตเตอร์ฟาย,butterfly,Butterfly,แมลง'),
(43, '5de2260d2536b1a20f0a3466d39ea55b.jpg', 'นกกำลังเกาะอยู่บนอะไร', 'กิ่งไม้,ต้นไม้,แท่งไม้,ไม้,ก้านไม้'),
(44, '73a8698849af7825fd35c24aeb2c2fe8.jpg', 'มีคนกี่คนยืนอยู่', '3,Three,three,3 คน,สาม'),
(45, '5d22d85bfe666acbb78bcbaed0ba485d.jpg', 'ผู้ชายใส่อะไรที่ข้อมือ', 'นาฬิกา,นาฬิกาข้อมือ,Watch,นาริกา,นาลิกา'),
(46, '7b327265d50c39f630b623033922eb10.jpg', 'มีคนใส่แว่นในรูปกี่คน', '2,สองคน,2 คน,สอง'),
(47, 'e0212d263a97f952388e8f51600bd5ce.jpg', 'ผู้หญิงถ่ายรูปหน้าอะไร', 'กระจก,มิลเลอร์,Mirror,mirror,กระจกเงา'),
(48, '1e82a748b3164153a80cb0f3fd09ab70.jpg', 'บ้านในรูปอาศัยได้หรือไม่', 'ได้,อยู่ได้,อาศัยได้,อยู่อาศัยได้'),
(49, '8fc51b3d15812a0dea4bce45fc1d3bce.jpg', 'คนในรูปกำลังเล่นมือถือหรือไม่', 'ไม่,ไม่เล่น,ไม่เล่นอยู่,เล่นคอมอยู่,ไม่เล่นมือถือ'),
(50, 'd8f6d2704c6b695c433a299c89c71446.jpg', 'ในรูปเป็นคำว่าอะไร', 'เลิฟ,เลิป,แอลโอวีอี,Love'),
(51, 'c541b2e636fb6c3389bbd4d5587e14c2.jpg', 'ในรูปมีบรรไดหรือไม่', 'มี,มีบรรได,บรรได'),
(52, '7b629dd84921d961bc0127c11cb0d3f1.jpg', 'รถกำลังแล่นอยู่หรือไม่', 'ไม่,ไม่แล่น,ไม่แล่นอยู่,จอดอยู่,หยุด'),
(53, '7128e04181d42994876c9185490e220f.jpg', 'หมาในรูปใส่เสื้อสีอะไร', 'เหลือง,yellow,เหลิง,เลิง,สีเหลือง'),
(54, '425d5ed7eef565039076498cc6d05f37.jpg', 'ผู้ชายซ้ายมือใส่เสื้อสีอะไร', 'บลู,น้ำเงิน,สีน้ำเงิน,ฟ้า,สีฟ้า'),
(55, 'a72761a3f46c0d19ea4561a29aab96b5.jpg', 'บ้านหลังนี้อยู่อาศัยได้หรือไม่', 'ไม่ได้,อยู่ไม่ได้,อยู่อาศัยไม่ได้,ไม่'),
(56, 'aca4eb81d1d80160b4261fbfb634ec99.jpg', 'ในรูปมีสิ่งมีชีวิตหรือไม่', 'ไม่มี,ไม่มีสิ่งมีชีวิต,ไม่,ไม่ใช่');

-- --------------------------------------------------------

--
-- Table structure for table `dataset_creator`
--

CREATE TABLE `dataset_creator` (
  `creator_id` int NOT NULL COMMENT 'รหัสประจำตัวของการสร้างคีย์คำถาม',
  `dataset_id` int NOT NULL COMMENT 'รหัสประจำตัวของคำถาม',
  `admin_id` int NOT NULL COMMENT 'รหัสประจำตัวของผู้ดูแลระบบ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int NOT NULL COMMENT 'รหัสประจำตัวของผู้ใช้งาน',
  `email` varchar(50) NOT NULL COMMENT 'อีเมลล์ของผู้ใช้งาน',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'รหัสผ่านของผู้ใช้งาน',
  `first_name` varchar(50) NOT NULL COMMENT 'ชื่อของผู้ใช้งาน',
  `last_name` varchar(50) NOT NULL COMMENT 'นามสกุลของผู้ใช้งาน'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='ผู้ใช้';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `authen_action`
--
ALTER TABLE `authen_action`
  ADD PRIMARY KEY (`action_id`),
  ADD KEY `key_value` (`key_value`),
  ADD KEY `dataset_id_2` (`dataset_id`),
  ADD KEY `dataset_id` (`dataset_id`) USING BTREE;

--
-- Indexes for table `captcha_key`
--
ALTER TABLE `captcha_key`
  ADD PRIMARY KEY (`key_id`),
  ADD KEY `key_value` (`key_value`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `dataset`
--
ALTER TABLE `dataset`
  ADD PRIMARY KEY (`dataset_id`);

--
-- Indexes for table `dataset_creator`
--
ALTER TABLE `dataset_creator`
  ADD PRIMARY KEY (`creator_id`) USING BTREE COMMENT 'ข้อมูลการสร้างคำถาม',
  ADD KEY `admin_id` (`admin_id`),
  ADD KEY `dataset_id` (`dataset_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int NOT NULL AUTO_INCREMENT COMMENT 'รหัสประจำตัวผู้ดูแลระบบ';

--
-- AUTO_INCREMENT for table `authen_action`
--
ALTER TABLE `authen_action`
  MODIFY `action_id` int NOT NULL AUTO_INCREMENT COMMENT 'รหัสข้อมูล dataset ที่ใช้ในการยืนยันตัวตน';

--
-- AUTO_INCREMENT for table `captcha_key`
--
ALTER TABLE `captcha_key`
  MODIFY `key_id` int NOT NULL AUTO_INCREMENT COMMENT 'รหัสประจำตัวของแคปช่าคีย์';

--
-- AUTO_INCREMENT for table `dataset`
--
ALTER TABLE `dataset`
  MODIFY `dataset_id` int NOT NULL AUTO_INCREMENT COMMENT 'รหัสข้อมูล dataset ที่ใช้ในการยืนยันตัวตน', AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `dataset_creator`
--
ALTER TABLE `dataset_creator`
  MODIFY `creator_id` int NOT NULL AUTO_INCREMENT COMMENT 'รหัสประจำตัวของการสร้างคีย์คำถาม';

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT COMMENT 'รหัสประจำตัวของผู้ใช้งาน';

--
-- Constraints for dumped tables
--

--
-- Constraints for table `authen_action`
--
ALTER TABLE `authen_action`
  ADD CONSTRAINT `authen_action_ibfk_1` FOREIGN KEY (`dataset_id`) REFERENCES `dataset` (`dataset_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `authen_action_ibfk_2` FOREIGN KEY (`key_value`) REFERENCES `captcha_key` (`key_value`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `captcha_key`
--
ALTER TABLE `captcha_key`
  ADD CONSTRAINT `captcha_key_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `dataset_creator`
--
ALTER TABLE `dataset_creator`
  ADD CONSTRAINT `dataset_creator_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `dataset_creator_ibfk_2` FOREIGN KEY (`dataset_id`) REFERENCES `dataset` (`dataset_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
