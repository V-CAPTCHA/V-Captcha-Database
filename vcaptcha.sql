-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Generation Time: Feb 17, 2022 at 11:42 AM
-- Server version: 8.0.26
-- PHP Version: 7.4.20

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
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT 'อีเมลล์ผู้ดูแลระบบ',
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'รหัสผ่านผู้ดูแลระบบ',
  `first_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT 'ชื่อผู้ดูแลระบบ',
  `last_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT 'นามสกุลผู้ดูแลระบบ',
  `role` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'admin' COMMENT 'ตำแหน่งผู้ดูแลระบบ'
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
  MODIFY `dataset_id` int NOT NULL AUTO_INCREMENT COMMENT 'รหัสข้อมูล dataset ที่ใช้ในการยืนยันตัวตน';

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
