-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 25, 2024 at 08:10 AM
-- Server version: 8.2.0
-- PHP Version: 8.2.0

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `oims`
--
CREATE DATABASE IF NOT EXISTS `oims` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `oims`;

-- --------------------------------------------------------

--
-- Table structure for table `tb_administration_mode`
--

DROP TABLE IF EXISTS `tb_administration_mode`;
CREATE TABLE IF NOT EXISTS `tb_administration_mode` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `mode_name` varchar(100) DEFAULT NULL,
  `description` text,
  `entry_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `last_modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `entered_by` int UNSIGNED DEFAULT NULL,
  `modified_by` int UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entered_by` (`entered_by`),
  KEY `modified_by` (`modified_by`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_administration_mode`
--

INSERT INTO `tb_administration_mode` (`id`, `mode_name`, `description`, `entry_date`, `last_modified`, `entered_by`, `modified_by`) VALUES
(1, 'Intramuscular (IM)', 'Injection into a muscle, typically the deltoid (upper arm) or the anterolateral thigh in infants.', '2024-09-25 02:34:40', '2024-09-25 02:34:40', 1, 1),
(2, 'Subcutaneous (SC)', 'Injection into the fatty layer just under the skin, usually in the upper arm or thigh.', '2024-09-25 02:35:12', '2024-09-25 02:35:12', 1, 1),
(3, 'Intradermal (ID)', 'Injection into the dermal layer, just beneath the surface of the skin, often administered in the forearm.', '2024-09-25 02:35:42', '2024-09-25 02:35:42', 1, 1),
(4, 'Oral (PO)', 'Vaccine is administered by mouth, either in liquid form or as a tablet.', '2024-09-25 02:36:06', '2024-09-25 02:36:06', 1, 1),
(5, 'Intranasal (IN)', 'The vaccine is sprayed or delivered into the nasal passages.', '2024-09-25 02:36:31', '2024-09-25 02:36:31', 1, 1),
(6, 'Intravenous (IV)', 'Administration directly into a vein, though this mode is extremely rare for vaccines and more common for therapeutic treatments.', '2024-09-25 02:37:04', '2024-09-25 02:37:04', 1, 1),
(7, 'Percutaneous (PC)', 'The vaccine is administered through the skin using devices like a jet injector or needle-free applicator.', '2024-09-25 02:37:29', '2024-09-25 02:37:29', 1, 1),
(8, 'Sublingual/Buccal', 'Administered under the tongue (sublingual) or inside the cheek (buccal). This method is not commonly used for vaccines but may be explored in research or experimental settings.', '2024-09-25 02:37:55', '2024-09-25 02:37:55', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_administration_site`
--

DROP TABLE IF EXISTS `tb_administration_site`;
CREATE TABLE IF NOT EXISTS `tb_administration_site` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `site_name` varchar(200) NOT NULL,
  `description` text,
  `entry_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `last_modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `entered_by` int UNSIGNED DEFAULT NULL,
  `modified_by` int UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `site_name` (`site_name`),
  KEY `entered_by` (`entered_by`),
  KEY `modified_by` (`modified_by`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_administration_site`
--

INSERT INTO `tb_administration_site` (`id`, `site_name`, `description`, `entry_date`, `last_modified`, `entered_by`, `modified_by`) VALUES
(3, 'Deltoid Muscle (Upper Arm)', NULL, '2024-09-25 02:27:48', '2024-09-25 02:27:48', 1, 1),
(4, 'Anterolateral Thigh Muscle', NULL, '2024-09-25 02:28:09', '2024-09-25 02:28:09', 1, 1),
(5, 'Gluteus Muscle (Buttocks)', NULL, '2024-09-25 02:28:26', '2024-09-25 02:28:26', 1, 1),
(6, 'Vastus Lateralis Muscle (Thigh)', NULL, '2024-09-25 02:28:42', '2024-09-25 02:28:42', 1, 1),
(7, 'Subcutaneous Tissue (Upper Arm or Thigh)', NULL, '2024-09-25 02:28:55', '2024-09-25 02:28:55', 1, 1),
(8, 'Forearm (Intradermal Injection)', NULL, '2024-09-25 02:29:14', '2024-09-25 02:29:14', 1, 1),
(9, 'Nasal (Intranasal Administration)', NULL, '2024-09-25 02:29:32', '2024-09-25 02:29:32', 1, 1),
(10, 'Oral (Oral Administration)', NULL, '2024-09-25 02:29:50', '2024-09-25 02:29:50', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_child`
--

DROP TABLE IF EXISTS `tb_child`;
CREATE TABLE IF NOT EXISTS `tb_child` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gender` enum('Male','Female') DEFAULT NULL,
  `guardian_name` varchar(255) DEFAULT NULL,
  `guardian_contact` varchar(20) DEFAULT NULL,
  `address` text,
  `entry_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `last_modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `entered_by` int UNSIGNED DEFAULT NULL,
  `modified_by` int UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entered_by` (`entered_by`),
  KEY `modified_by` (`modified_by`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_employee`
--

DROP TABLE IF EXISTS `tb_employee`;
CREATE TABLE IF NOT EXISTS `tb_employee` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `employee_number` varchar(30) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `other_name` varchar(100) DEFAULT NULL,
  `job_tile` varchar(50) NOT NULL,
  `pri_phone_no` varchar(25) NOT NULL,
  `alt_phone_no` varchar(25) DEFAULT NULL,
  `personal_email` varchar(50) DEFAULT NULL,
  `official_email` varchar(50) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `hire_date` date DEFAULT NULL,
  `current_status` enum('On Probation','Active','On Leave','Transferred','Suspended','Terminated','Resigned') NOT NULL,
  `tin_number` varchar(50) DEFAULT NULL,
  `nssf_number` varchar(50) DEFAULT NULL,
  `salary_amount` decimal(15,2) DEFAULT '0.00',
  `employement_type` enum('Intern/Trainee','Permanent','On Contract') DEFAULT NULL,
  `work_schedule` enum('Part Time','Full Time') DEFAULT NULL,
  `sex` enum('Male','Female') DEFAULT NULL,
  `entry_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `last_modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `entered_by` int UNSIGNED DEFAULT NULL,
  `modified_by` int UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `employee_number` (`employee_number`),
  KEY `entered_by` (`entered_by`),
  KEY `modified_by` (`modified_by`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_immunisation`
--

DROP TABLE IF EXISTS `tb_immunisation`;
CREATE TABLE IF NOT EXISTS `tb_immunisation` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `vaccination_date` date NOT NULL,
  `child_id` int UNSIGNED DEFAULT NULL,
  `vaccine_id` int UNSIGNED DEFAULT NULL,
  `dose_cycle` enum('1st','2nd','3rd','4th','5th','6th','7th','8th','9th','10th') DEFAULT NULL,
  `next_vaccination_date` date DEFAULT NULL,
  `administered_by` int UNSIGNED DEFAULT NULL,
  `remarks` text,
  `entry_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `last_modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `entered_by` int UNSIGNED DEFAULT NULL,
  `modified_by` int UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `child_id` (`child_id`),
  KEY `vaccine_id` (`vaccine_id`),
  KEY `administered_by` (`administered_by`),
  KEY `entered_by` (`entered_by`),
  KEY `modified_by` (`modified_by`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_system_user`
--

DROP TABLE IF EXISTS `tb_system_user`;
CREATE TABLE IF NOT EXISTS `tb_system_user` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `user_password` varchar(255) DEFAULT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `activation_state` enum('Y','N') DEFAULT 'N',
  `user_profile` longtext,
  `user_role_id` int DEFAULT NULL,
  `entry_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `last_modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_role_id` (`user_role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_system_user`
--

INSERT INTO `tb_system_user` (`id`, `username`, `user_password`, `user_email`, `activation_state`, `user_profile`, `user_role_id`, `entry_date`, `last_modified`) VALUES
(1, 'robinah.nakitto', '940ba7431d289f62c784042ee7d5a575', 'robinahnakitto98@gmail.com', 'Y', NULL, -1, '2024-09-25 00:57:02', '2024-09-25 00:57:02');

-- --------------------------------------------------------

--
-- Table structure for table `tb_unit_of_measure`
--

DROP TABLE IF EXISTS `tb_unit_of_measure`;
CREATE TABLE IF NOT EXISTS `tb_unit_of_measure` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `uom_full_name` varchar(100) NOT NULL,
  `short_form` varchar(5) NOT NULL,
  `description` text,
  `entry_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `last_modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `entered_by` int UNSIGNED DEFAULT NULL,
  `modified_by` int UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uom_full_name` (`uom_full_name`),
  KEY `entered_by` (`entered_by`),
  KEY `modified_by` (`modified_by`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_unit_of_measure`
--

INSERT INTO `tb_unit_of_measure` (`id`, `uom_full_name`, `short_form`, `description`, `entry_date`, `last_modified`, `entered_by`, `modified_by`) VALUES
(1, 'Milliliters', 'mL', 'The volume of liquid vaccine administered, typically used for injectable vaccines.', '2024-09-25 03:15:05', '2024-09-25 03:15:05', 1, 1),
(2, 'Micrograms', 'µg', 'The amount of antigen or active substance present in the vaccine. Often used to indicate the quantity of a specific component of the vaccine.', '2024-09-25 03:15:40', '2024-09-25 03:15:40', 1, 1),
(3, 'International Units', 'IU', 'A unit used to measure the potency or biological activity of certain vaccines, especially those with biological substances like toxins or antitoxins.', '2024-09-25 03:16:11', '2024-09-25 03:16:11', 1, 1),
(4, 'Colony-Forming Units', 'CFU', 'A unit used to measure the number of viable bacteria or fungi in vaccines that contain live organisms.', '2024-09-25 03:16:40', '2024-09-25 03:16:40', 1, 1),
(5, 'Plaque-Forming Units', 'PFU', 'A measure of the number of infectious virus particles in a vaccine, used for live viral vaccines.', '2024-09-25 03:17:10', '2024-09-25 03:17:10', 1, 1),
(6, 'Flocculation Units', 'Lf', 'A unit used to measure the potency of toxoid vaccines, particularly for vaccines like diphtheria and tetanus.', '2024-09-25 03:17:37', '2024-09-25 03:17:37', 1, 1),
(7, 'Antigen Units', 'AU', 'A measurement of the amount of antigen in the vaccine, often used for allergenic extracts or vaccines that have specific antigen components.', '2024-09-25 03:18:12', '2024-09-25 03:18:12', 1, 1),
(8, 'Viral Particles', 'vp', 'The number of viral particles in a dose of the vaccine, commonly used for vaccines involving viral vectors or gene therapy.', '2024-09-25 03:19:29', '2024-09-25 03:19:29', 1, 1),
(9, 'Foci-Forming Units', 'FFU', 'Similar to PFU, this unit is used to quantify infectious viral particles based on their ability to form foci (clusters) in cell cultures.', '2024-09-25 03:20:19', '2024-09-25 03:20:19', 1, 1),
(10, 'Doses', 'DS', 'Refers to a single administration of a vaccine, often used when no specific volume or weight measurement is emphasized.', '2024-09-25 03:21:31', '2024-09-25 03:21:31', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_user_role`
--

DROP TABLE IF EXISTS `tb_user_role`;
CREATE TABLE IF NOT EXISTS `tb_user_role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) NOT NULL,
  `entry_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `last_modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `role_name` (`role_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_user_role`
--

INSERT INTO `tb_user_role` (`id`, `role_name`, `entry_date`, `last_modified`) VALUES
(-2, 'Anonymous', '2024-09-25 00:21:55', '2024-09-25 00:21:55'),
(-1, 'Administrator', '2024-09-24 23:06:12', '2024-09-24 23:40:51');

-- --------------------------------------------------------

--
-- Table structure for table `tb_user_role_permission`
--

DROP TABLE IF EXISTS `tb_user_role_permission`;
CREATE TABLE IF NOT EXISTS `tb_user_role_permission` (
  `id` int NOT NULL,
  `object_name` varchar(255) NOT NULL,
  `permission` int NOT NULL,
  `entry_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `last_modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`object_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_user_role_permission`
--

INSERT INTO `tb_user_role_permission` (`id`, `object_name`, `permission`, `entry_date`, `last_modified`) VALUES
(-2, '{E3E59D36-9427-4D87-8FA6-E770E7AD1B74}tb_administration_site', 0, '2024-09-25 00:21:55', '2024-09-25 00:21:55'),
(-2, '{E3E59D36-9427-4D87-8FA6-E770E7AD1B74}tb_child', 0, '2024-09-25 00:21:55', '2024-09-25 00:21:55'),
(-2, '{E3E59D36-9427-4D87-8FA6-E770E7AD1B74}tb_system_user', 0, '2024-09-25 00:21:55', '2024-09-25 00:21:55'),
(-2, '{E3E59D36-9427-4D87-8FA6-E770E7AD1B74}tb_user_role', 0, '2024-09-25 00:21:55', '2024-09-25 00:21:55'),
(-2, '{E3E59D36-9427-4D87-8FA6-E770E7AD1B74}tb_user_role_permission', 0, '2024-09-25 00:21:55', '2024-09-25 00:21:55');

-- --------------------------------------------------------

--
-- Table structure for table `tb_vaccine`
--

DROP TABLE IF EXISTS `tb_vaccine`;
CREATE TABLE IF NOT EXISTS `tb_vaccine` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `vaccine_name` varchar(255) DEFAULT NULL,
  `vaccine_code` varchar(10) DEFAULT NULL,
  `description` text,
  `dose_required` float DEFAULT NULL,
  `dose_required_uom` int UNSIGNED DEFAULT NULL,
  `admin_mode_id` int UNSIGNED DEFAULT NULL,
  `admin_site_id` int UNSIGNED DEFAULT NULL,
  `vaccine_form_id` int UNSIGNED DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `target_group` enum('Babies','Children','Youths','Adults','Elderly') DEFAULT NULL,
  `storage_condition` varchar(255) DEFAULT NULL,
  `entry_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `last_modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `entered_by` int UNSIGNED DEFAULT NULL,
  `modified_by` int UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `vaccine_name` (`vaccine_name`),
  KEY `dose_required_uom` (`dose_required_uom`),
  KEY `admin_mode_id` (`admin_mode_id`),
  KEY `admin_site_id` (`admin_site_id`),
  KEY `vaccine_form_id` (`vaccine_form_id`),
  KEY `entered_by` (`entered_by`),
  KEY `modified_by` (`modified_by`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_vaccine_form`
--

DROP TABLE IF EXISTS `tb_vaccine_form`;
CREATE TABLE IF NOT EXISTS `tb_vaccine_form` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `form_name` varchar(100) NOT NULL,
  `description` text,
  `entry_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `last_modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `entered_by` int UNSIGNED DEFAULT NULL,
  `modified_by` int UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `form_name` (`form_name`),
  KEY `entered_by` (`entered_by`),
  KEY `modified_by` (`modified_by`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_vaccine_form`
--

INSERT INTO `tb_vaccine_form` (`id`, `form_name`, `description`, `entry_date`, `last_modified`, `entered_by`, `modified_by`) VALUES
(1, 'Liquid', 'The most common form, where the vaccine is in liquid solution ready for injection, oral, or nasal administration.', '2024-09-25 03:09:44', '2024-09-25 03:09:44', 1, 1),
(2, 'Lyophilized (Freeze-Dried) Powder', 'The vaccine is provided in powder form and requires reconstitution with a liquid diluent before administration. Common for vaccines that need long-term stability.', '2024-09-25 03:10:20', '2024-09-25 03:10:20', 1, 1),
(3, 'Suspension', 'A liquid form where vaccine particles are suspended in a fluid, but not fully dissolved. Requires shaking before use to ensure an even distribution of the vaccine.', '2024-09-25 03:10:57', '2024-09-25 03:10:57', 1, 1),
(4, 'Emulsion', 'A mixture of two liquids that typically don’t mix (e.g., oil and water). Emulsion forms may be used for adjuvant-based vaccines to enhance the immune response.', '2024-09-25 03:11:24', '2024-09-25 03:11:24', 1, 1),
(5, 'Tablet', 'A solid, oral form of vaccine, often used for oral administration. Not commonly used but explored for ease of distribution and storage.', '2024-09-25 03:11:43', '2024-09-25 03:11:43', 1, 1),
(6, 'Capsule', 'Another solid form for oral administration, where the vaccine is enclosed in a dissolvable capsule. This is primarily used for certain bacterial vaccines.', '2024-09-25 03:12:06', '2024-09-25 03:12:06', 1, 1),
(7, 'Patch (Transdermal)', 'A newer form being researched, where a patch is applied to the skin to deliver the vaccine through the skin surface without a traditional needle injection.', '2024-09-25 03:12:27', '2024-09-25 03:12:27', 1, 1),
(8, 'Spray', 'Delivered as a mist, often intranasal, allowing the vaccine to be absorbed through the mucous membranes.', '2024-09-25 03:12:51', '2024-09-25 03:12:51', 1, 1),
(9, 'Gel or Paste', 'This form is used in experimental and veterinary vaccines, where the vaccine is suspended in a gel or paste for easy application.', '2024-09-25 03:13:15', '2024-09-25 03:13:15', 1, 1);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_administration_mode`
--
ALTER TABLE `tb_administration_mode`
  ADD CONSTRAINT `tb_administration_mode_ibfk_1` FOREIGN KEY (`entered_by`) REFERENCES `tb_system_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_administration_mode_ibfk_2` FOREIGN KEY (`modified_by`) REFERENCES `tb_system_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_administration_site`
--
ALTER TABLE `tb_administration_site`
  ADD CONSTRAINT `tb_administration_site_ibfk_1` FOREIGN KEY (`entered_by`) REFERENCES `tb_system_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_administration_site_ibfk_2` FOREIGN KEY (`modified_by`) REFERENCES `tb_system_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_child`
--
ALTER TABLE `tb_child`
  ADD CONSTRAINT `tb_child_ibfk_1` FOREIGN KEY (`entered_by`) REFERENCES `tb_system_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_child_ibfk_2` FOREIGN KEY (`modified_by`) REFERENCES `tb_system_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_employee`
--
ALTER TABLE `tb_employee`
  ADD CONSTRAINT `tb_employee_ibfk_1` FOREIGN KEY (`entered_by`) REFERENCES `tb_system_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_employee_ibfk_2` FOREIGN KEY (`modified_by`) REFERENCES `tb_system_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_immunisation`
--
ALTER TABLE `tb_immunisation`
  ADD CONSTRAINT `tb_immunisation_ibfk_1` FOREIGN KEY (`child_id`) REFERENCES `tb_child` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_immunisation_ibfk_2` FOREIGN KEY (`vaccine_id`) REFERENCES `tb_vaccine` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_immunisation_ibfk_3` FOREIGN KEY (`administered_by`) REFERENCES `tb_employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_immunisation_ibfk_4` FOREIGN KEY (`entered_by`) REFERENCES `tb_system_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_immunisation_ibfk_5` FOREIGN KEY (`modified_by`) REFERENCES `tb_system_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_system_user`
--
ALTER TABLE `tb_system_user`
  ADD CONSTRAINT `tb_system_user_ibfk_1` FOREIGN KEY (`user_role_id`) REFERENCES `tb_user_role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_unit_of_measure`
--
ALTER TABLE `tb_unit_of_measure`
  ADD CONSTRAINT `tb_unit_of_measure_ibfk_1` FOREIGN KEY (`entered_by`) REFERENCES `tb_system_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_unit_of_measure_ibfk_2` FOREIGN KEY (`modified_by`) REFERENCES `tb_system_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_vaccine`
--
ALTER TABLE `tb_vaccine`
  ADD CONSTRAINT `tb_vaccine_ibfk_1` FOREIGN KEY (`dose_required_uom`) REFERENCES `tb_unit_of_measure` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_vaccine_ibfk_2` FOREIGN KEY (`admin_mode_id`) REFERENCES `tb_administration_mode` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_vaccine_ibfk_3` FOREIGN KEY (`admin_site_id`) REFERENCES `tb_administration_site` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_vaccine_ibfk_4` FOREIGN KEY (`vaccine_form_id`) REFERENCES `tb_vaccine_form` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_vaccine_ibfk_5` FOREIGN KEY (`entered_by`) REFERENCES `tb_system_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_vaccine_ibfk_6` FOREIGN KEY (`modified_by`) REFERENCES `tb_system_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_vaccine_form`
--
ALTER TABLE `tb_vaccine_form`
  ADD CONSTRAINT `tb_vaccine_form_ibfk_1` FOREIGN KEY (`entered_by`) REFERENCES `tb_system_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_vaccine_form_ibfk_2` FOREIGN KEY (`modified_by`) REFERENCES `tb_system_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
SET FOREIGN_KEY_CHECKS=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
