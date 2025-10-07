-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 07, 2025 at 02:44 PM
-- Server version: 5.7.23-23
-- PHP Version: 8.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `getdemo_pricecut`
--

-- --------------------------------------------------------

--
-- Table structure for table `area-masters`
--

CREATE TABLE `area-masters` (
  `areaId` int(11) NOT NULL,
  `areaName` text,
  `areastateId` int(11) DEFAULT NULL,
  `areacityId` int(11) DEFAULT NULL,
  `iStatus` int(11) DEFAULT '1',
  `isDelete` int(11) DEFAULT '0',
  `created_at` text,
  `updated_at` text,
  `strIP` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `area-masters`
--

INSERT INTO `area-masters` (`areaId`, `areaName`, `areastateId`, `areacityId`, `iStatus`, `isDelete`, `created_at`, `updated_at`, `strIP`) VALUES
(1, 'new_narol', 5, 33, 1, 0, '2024-12-03 18:16:09', '2024-12-03 18:37:26', '127.0.0.1'),
(9, 'test', 10, 43, 1, 0, '2024-12-10 10:06:40', '2024-12-10 10:07:18', '103.1.100.226'),
(11, 'test', 5, 41, 1, 0, '2025-01-16 11:27:12', '2025-01-16 11:27:12', '103.1.100.226');

-- --------------------------------------------------------

--
-- Table structure for table `base_url`
--

CREATE TABLE `base_url` (
  `id` int(11) NOT NULL,
  `URL` varchar(100) NOT NULL,
  `min_withdraw_amount` varchar(11) DEFAULT NULL,
  `iStatus` int(11) NOT NULL DEFAULT '1',
  `isDelete` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `base_url`
--

INSERT INTO `base_url` (`id`, `URL`, `min_withdraw_amount`, `iStatus`, `isDelete`, `created_at`, `updated_at`) VALUES
(2, 'https://myqrgenie.com/qrcode_process/', '1000', 1, 0, '2025-05-05 12:34:26', '2025-05-05 12:34:26');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `expiration` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `career-masters`
--

CREATE TABLE `career-masters` (
  `iCareerInquiryId` int(11) NOT NULL,
  `strName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `strGender` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `strLocation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `strPhone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `strEmail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iJobId` int(11) DEFAULT '0',
  `strResumeCV` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional_information` text COLLATE utf8mb4_unicode_ci,
  `iPriorExperience` int(11) NOT NULL DEFAULT '0' COMMENT '0=no , 1=yes',
  `strReferencePersonName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `strReferencePersonEmail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iStatus` int(11) NOT NULL DEFAULT '1',
  `isDelete` int(11) NOT NULL DEFAULT '0',
  `strIP` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Categories`
--

CREATE TABLE `Categories` (
  `Categories_id` int(11) NOT NULL,
  `Category_name` varchar(50) DEFAULT NULL,
  `Categories_slug` varchar(50) DEFAULT NULL,
  `isequence` int(11) NOT NULL DEFAULT '0',
  `Categories_icon` varchar(255) DEFAULT NULL,
  `iStatus` int(11) DEFAULT '1',
  `isDelete` int(11) DEFAULT '0',
  `strIP` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `Categories_img` varchar(45) DEFAULT NULL,
  `display_homepage` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Categories`
--

INSERT INTO `Categories` (`Categories_id`, `Category_name`, `Categories_slug`, `isequence`, `Categories_icon`, `iStatus`, `isDelete`, `strIP`, `created_at`, `updated_at`, `Categories_img`, `display_homepage`) VALUES
(33, 'Beauty & Spas', 'beauty-&-spas', 2, '1738072758_28012025192918.png', 1, 0, '103.1.100.226', '2025-01-27 10:27:37', '2025-01-28 13:59:18', '1738072758_28012025192918.png', 1),
(34, 'Things To Do', 'things-to-do', 6, '1738072665_28012025192745.png', 1, 0, '103.1.100.226', '2025-01-27 10:28:25', '2025-01-28 13:57:45', '1738072665_28012025192745.png', 1),
(35, 'Auto & Home', 'auto-&-home', 5, '1738072489_28012025192449.png', 1, 0, '103.1.100.226', '2025-01-27 10:29:34', '2025-01-28 13:54:49', '1738072489_28012025192449.png', 1),
(36, 'Food & Drink', 'food-&-drink', 1, '1738071608_28012025191008.png', 1, 0, '103.1.100.226', '2025-01-27 10:30:47', '2025-01-28 13:40:08', '1738071608_28012025191008.png', 1),
(37, 'Gifts', 'gifts', 3, '1738070836_28012025185716.png', 1, 0, '103.1.100.226', '2025-01-27 10:31:50', '2025-01-28 13:27:16', '1738070836_28012025185716.png', 1),
(38, 'Travel', 'travel', 4, '1738071160_28012025190240.png', 1, 0, '103.1.100.226', '2025-01-27 10:33:20', '2025-01-28 13:32:40', '1738071160_28012025190240.png', 1);

-- --------------------------------------------------------

--
-- Table structure for table `city-masters`
--

CREATE TABLE `city-masters` (
  `cityId` int(11) NOT NULL,
  `stateMasterStateId` int(11) DEFAULT NULL,
  `cityName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iStatus` int(11) NOT NULL DEFAULT '1',
  `isDelete` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `strIP` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `city-masters`
--

INSERT INTO `city-masters` (`cityId`, `stateMasterStateId`, `cityName`, `iStatus`, `isDelete`, `created_at`, `updated_at`, `strIP`) VALUES
(33, 5, 'surat', 1, 0, NULL, NULL, NULL),
(36, 3, 'Bangalore', 1, 0, NULL, '2025-01-11 12:37:40', '103.1.100.226'),
(39, 10, 'basti', 1, 0, '2024-12-03 11:55:50', '2024-12-03 11:55:50', '127.0.0.1'),
(41, 5, 'Ahmedabad', 1, 0, '2024-12-09 12:17:28', '2024-12-09 12:17:28', '103.1.100.226'),
(43, 10, 'patana', 1, 0, '2024-12-10 04:35:34', '2024-12-10 04:35:34', '103.1.100.226'),
(45, 5, 'Baroda', 1, 0, '2024-12-24 06:03:39', '2024-12-24 06:03:39', '72.135.136.9'),
(48, 12, 'test', 1, 0, '2025-01-13 05:30:40', '2025-01-13 05:30:40', '103.1.100.226'),
(49, 10, 'Aurangabad', 1, 0, '2025-01-17 05:41:14', '2025-01-17 05:41:14', '103.1.100.226'),
(50, 57, 'Mumbai', 1, 0, '2025-01-17 09:49:51', '2025-02-13 10:27:57', '103.1.100.226');

-- --------------------------------------------------------

--
-- Table structure for table `cms`
--

CREATE TABLE `cms` (
  `id` int(11) NOT NULL,
  `strTitle` text,
  `strDescription` text,
  `slugname` varchar(255) DEFAULT NULL,
  `iStatus` int(11) NOT NULL DEFAULT '1',
  `isDelete` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `strIP` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cms`
--

INSERT INTO `cms` (`id`, `strTitle`, `strDescription`, `slugname`, `iStatus`, `isDelete`, `created_at`, `updated_at`, `strIP`) VALUES
(1, 'Terms & Conditions', '<h4>&nbsp;</h4><p><strong>Effective Date: 16/06/25&nbsp;</strong></p><p>Our website and services are subject to the Terms and Conditions listed below, which you agree to obey and be bound by. Please take the time to read them. You should not use our website if you do not agree to these Terms.&nbsp;<br>&nbsp;</p><h4><strong>1. Acceptance of Terms&nbsp;</strong></h4><p>By using our site, you acknowledge that you have read, understood, and accepted these Terms. These Terms apply to all users, whether they are looking around, signing up, or posting deals.&nbsp;</p><h4><strong>2. User Eligibility</strong>&nbsp;</h4><p>People over the age of 18 are welcome to use our services. You guarantee to meet this criterion by using Deallio. This service is not intended for those under the age of 18.&nbsp;</p><h4><strong>3. Account Creation &amp; Security&nbsp;</strong></h4><ul><li>You may create an account or continue as a guest to use our services.&nbsp;</li><li>When signing up, you agree to provide accurate and up-to-date information.&nbsp;&nbsp;</li><li>You are responsible for keeping your login details and account activity confidential.&nbsp;</li><li>If you do not keep your account information secure, we will not be liable for any resulting loss or harm.<br>&nbsp;</li></ul><h4><strong>4. Use of Our Website&nbsp;</strong></h4><p>We anticipate that all users will conduct themselves in a manner that is both respectful and legal when utilising Deallio. You acknowledge that you will not:</p><ul><li>Violate any local, national, or international law.&nbsp;</li><li>Attempt to obtain unauthorised access to any portion of our platform.&nbsp;&nbsp;</li><li>Post or transmit malicious software, spam, or misleading content.&nbsp;</li><li>Interfere with the performance or functionality of our site.<br>&nbsp;</li></ul><h4><strong>5. Intellectual Property Rights&nbsp;</strong></h4><p>All content on our platform including our logo, design, text, graphics, and software is the intellectual property of Deallio or licensed to us. You may not copy, distribute, modify, or reuse any content without our written permission.&nbsp;</p><h4><strong>6. Limitation of Liability&nbsp;</strong></h4><p>While we attempt to provide a reputable and user-friendly platform, we cannot be held responsible for&nbsp;&nbsp;</p><ul><li>Any third-party errors, inaccuracies, or expired deals.&nbsp;</li><li>Service disruptions, technical issues, or inaccuracies.&nbsp;</li><li>Loss or damage incurred while using or purchasing from our website.&nbsp;&nbsp;</li><li>Use our platform at your own discretion and risk.&nbsp;<br>&nbsp;</li></ul><h4><strong>7. Third-Party Services&nbsp;</strong></h4><p>Our platform may incorporate third-party content, offers, or services. You must obey their own guidelines for them. We cannot be held responsible for third-party providers\' content, actions, or services because we do not control or support them.&nbsp;</p><h4><strong>8. Termination of Accounts&nbsp;</strong></h4><p>We reserve the right to suspend or terminate your access to our platform at any time, without notice, if you:&nbsp;</p><ul><li>Violate these Terms.&nbsp;</li><li>Engage in fraudulent, abusive, or illegal activity.&nbsp;</li><li>Misuse the platform in any way.&nbsp;<br>&nbsp;</li></ul><h4><strong>9. Governing Law &amp; Jurisdiction</strong>&nbsp;</h4><p>The laws of India govern and clarify these Terms. Only the courts in [Insert City, India] shall have jurisdiction over any disputes regarding how to utilise our website.&nbsp;</p><h4><strong>10. Modification of Terms&nbsp;</strong></h4><p>These Terms may vary from time to time. This page will be updated with a new date when the changes take effect. Your continued use of Deallio after any modifications constitutes your acceptance of the revised Terms.&nbsp;</p><p><strong>If you have any questions about our Terms &amp; Conditions, please reach out to us at:&nbsp;</strong><br><strong>[info@deallios.in]&nbsp;</strong></p>', 'Terms-Conditions', 1, 0, NULL, '2025-07-25 06:10:04', '103.1.100.226'),
(2, 'Additional Consideration', '<p>&nbsp;</p><p><strong>What’s Available Now and What’s Coming Next</strong>&nbsp;</p><p>We\'re making a flexible, easy-to-use platform at Deallio that will grow as your needs do. At this stage, we\'re keeping things simple and smooth, but we\'re also setting the stage for future improvements. This is a list of what you can get now and what you can expect in the future.&nbsp;</p><h4><strong>Account Creation</strong>&nbsp;</h4><p><strong>Yes, Users Can Create Accounts</strong>&nbsp;<br>Registered users can sign up for a free Deallio account, allowing them to:&nbsp;</p><ul><li>Browse and grab available deals&nbsp;</li><li>Access coupon codes and promotional offers&nbsp;</li><li>Track their redeemed deals using generated QR codes&nbsp;</li></ul><p>Whether you register or continue as a guest, you’ll still enjoy full access to all deals, but signing up makes it easier to manage and revisit your activity.&nbsp;</p><h4><strong>Newsletter Plans</strong>&nbsp;</h4><p><strong>Not Yet But Stay Tuned</strong>&nbsp;<br>We’re not currently offering a newsletter, but it’s on our radar for <strong>Stage 2 of development</strong>. When launched, the newsletter will include:&nbsp;</p><ul><li>New and popular deals&nbsp;&nbsp;</li><li>Exclusive partner offers&nbsp;&nbsp;</li><li>Smart savings tips&nbsp;&nbsp;</li><li>Platform feature updates&nbsp;&nbsp;</li></ul><p>The frequency and content will change dependent on user preferences and comments.</p><h4><strong>User Reviews &amp; Testimonials</strong>&nbsp;</h4><p>Before adding user-generated content like reviews or comments, we\'re focussing on making sure users have a great experience. We don\'t show reviews or customer stories right now, but we\'re always listening to make Deallio better for everyone.&nbsp;</p><h4><strong>Language Support</strong>&nbsp;</h4><p><strong>Single-Language for Now</strong>&nbsp;<br>Deallio only works with English right now. As our number of users grows, we\'ll look into adding support for multiple languages so that deals can be seen by more people.&nbsp;</p><h4><strong>Looking Ahead</strong>&nbsp;</h4><p>Deallio is being developed with scalability in mind. As more users and businesses join the platform, you can expect:&nbsp;</p><ul><li>A richer feature set for both users and vendors&nbsp;</li><li>Smarter personalization&nbsp;</li><li>Dedicated tools for partners and advertisers&nbsp;</li><li>Better accessibility options&nbsp;</li></ul><p>Your feedback is welcome as we continue to evolve. Deallio is more than a deals platform it’s a space where your everyday spending meets smarter savings.&nbsp;</p>', 'Additional-Consideration', 1, 0, NULL, '2025-06-16 13:30:23', '103.1.100.226');

-- --------------------------------------------------------

--
-- Table structure for table `contactus-masters`
--

CREATE TABLE `contactus-masters` (
  `iContactId` int(11) NOT NULL,
  `strFirstName` varchar(255) DEFAULT NULL,
  `strLastName` varchar(255) DEFAULT NULL,
  `strEmail` varchar(255) DEFAULT NULL,
  `strPhone` varchar(255) DEFAULT NULL,
  `strMessage` text,
  `iStatus` int(11) NOT NULL DEFAULT '1',
  `isDelete` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `strIP` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Customer`
--

CREATE TABLE `Customer` (
  `customer_id` int(11) NOT NULL,
  `Customer_GUID` varchar(255) DEFAULT NULL,
  `Customer_name` varchar(50) DEFAULT NULL,
  `Customer_email` varchar(50) DEFAULT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `Customer_phone` bigint(20) DEFAULT NULL,
  `Customer_city` int(11) DEFAULT NULL,
  `Customer_state` int(11) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `iStatus` int(11) DEFAULT '1',
  `isDelete` int(11) DEFAULT '0',
  `strIP` text,
  `Customer_address` varchar(50) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `confirm_password` varchar(100) DEFAULT NULL,
  `otp` int(11) DEFAULT NULL,
  `expiry_time` datetime DEFAULT NULL,
  `isOtpVerified` int(11) DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `Customer_img` varchar(100) DEFAULT NULL,
  `is_changepasswordfirsttime` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Customer`
--

INSERT INTO `Customer` (`customer_id`, `Customer_GUID`, `Customer_name`, `Customer_email`, `ip_address`, `Customer_phone`, `Customer_city`, `Customer_state`, `latitude`, `longitude`, `created_at`, `updated_at`, `iStatus`, `isDelete`, `strIP`, `Customer_address`, `password`, `confirm_password`, `otp`, `expiry_time`, `isOtpVerified`, `last_login`, `Customer_img`, `is_changepasswordfirsttime`) VALUES
(7, NULL, 'divya', 'divya@gmail.com', NULL, 9898789066, 5, 44, NULL, NULL, '2025-01-21 13:59:30', '2025-01-21 14:07:40', 1, 0, '103.1.100.226', 'narol', '$2y$12$NJJM2l5qtFmBEKTlIaoCa.k8/IMTNkH1om5H7CsAJhNzZWj476FSu', '$2y$12$2jiFrQ8JlsW.IyGIQqjJOO1ziikv.UT0VaZQMggKDjWf1Fb3gR/mu', 421803, '2025-01-21 19:32:30', 1, NULL, '1737468460_21012025193740.jpg', NULL),
(10, '1d8f1c8b-308b-4d72-b888-a7c765614254', 'uri', 'ai.dev.laravel11@gmail.com', NULL, 9898789061, 5, 44, NULL, NULL, '2025-01-24 05:34:04', '2025-01-28 09:08:16', 1, 0, '103.1.100.226', 'narol', '$2y$12$I2fxE2Msp0BFz9L6R7ogFu.6PgxDhuu0zITvyLasZvEuHzrLvIUW6', '$2y$12$2IdGJhnwma.b0Z8yMDVU2eVaEcKIILGbrQppx9pldr2U1aiD3DKVC', 4299, '2025-01-28 12:30:52', NULL, NULL, '1738046768_28012025121608.png', 1),
(12, 'd5755b1a-567e-4bfc-8a74-cdebe729d560', 'Parth Vaishnav', 'dev3.apolloinfotech@gmail.com', NULL, 8460139822, NULL, NULL, NULL, NULL, '2025-01-24 05:47:45', '2025-01-28 12:38:17', 1, 0, '103.1.100.226', 'Vastral', '$2y$12$r.UjMc3Y8.DcKx/MarzLq.DOGQ.eEH/8YPSquFAM0cufN57RAZNdq', '$2y$12$P0wOSv9eQPHOpiOiwsytM.Ph3/e1DIQDf6vDGczt88dotH27wq9eq', 6925, '2025-01-28 16:30:11', 1, NULL, '1738063756_28012025165916.png', NULL),
(13, '8ac2ddf0-db90-477c-941f-014108b77e91', 'Tarang', 'parthv246@gmail.com', NULL, 8200279516, NULL, NULL, NULL, NULL, '2025-01-24 17:54:04', '2025-04-07 10:13:01', 1, 0, '42.106.8.75', 'Mahadev Nagar, Vastral', '$2y$12$9yYWUaeiH3aEJB0/.I3sAueJW42g2i.Nc1WL9b3Qh3eCN6E3xzfQW', '$2y$12$yjT0jV4LdNjnNmVyS3Omv.xg08EHBirhbjV27qRVQRMuT7I8smtAi', 2704, '2025-01-28 12:13:13', 1, NULL, '1744020781_07042025154301.jpg', 1),
(14, 'ef68395a-d3df-4dea-a683-44c3005265db', 'parth02', 'admin@admin.com', NULL, 9898510948, NULL, NULL, NULL, NULL, '2025-03-19 17:24:05', '2025-03-19 17:24:05', 1, 0, '42.106.17.113', '105 somnath Apartment', '$2y$12$cZYT4wnUsKYpg/jRbwmH5eYfvO.flkCIPR4dBbTkv37dqpQCtawHK', '$2y$12$598kVKbcZvJfbTOlsLQ2JOZOvapXFQ19n/arsoZF7g8DDRD8xUdge', 339214, '2025-03-19 23:04:04', NULL, NULL, NULL, NULL),
(15, 'c4c9937f-8902-4cd1-9bd2-585824bb6581', 'Nisha', 'ai.dev.laravel11@gmail.com', NULL, 7486984607, NULL, NULL, NULL, NULL, '2025-04-04 06:32:00', '2025-07-25 06:36:51', 1, 0, '103.1.100.226', 'Bhairavnath', '$2y$12$bp1u6/raYohtwv5tesreg.k/79q99yHbBL9hWAHVsWiPjBekUGB.W', '$2y$12$MgCSfjzaUNmq0vCDbg/bheOPPGloOO2NW2nEStwwkHqzSBuZ8i1Py', 9415, '2025-07-25 12:13:32', 1, NULL, NULL, NULL),
(16, '4e869264-38d4-4476-87b9-8cdb0ddb6087', 'Apollo123', 'ai.dev.laravel12@gmail.com', NULL, 9898448253, NULL, NULL, NULL, NULL, '2025-05-05 07:05:19', '2025-05-05 07:05:19', 1, 0, '103.1.100.226', 'isanpur', '$2y$12$WNoD.WKuKE.Lg7jPIpbVv.siVVwzInJeEwytw4gBrdCjwLfWDmWeW', '$2y$12$KJY7qjET25EW0AafIMZMjunnDcLwqZqKlf0rQqu0TPE0Qm5OSqV/G', 382185, '2025-05-05 12:45:18', NULL, NULL, NULL, NULL),
(18, '7e4fcbb3-e1d2-40a4-9c60-2e1239bc5bd0', 'Pooja', 'poojamp1497@gmail.com', NULL, 9081811314, NULL, NULL, NULL, NULL, '2025-06-11 05:13:09', '2025-06-11 05:15:48', 1, 0, '103.1.100.226', 'zxcdwfd', '$2y$12$rvi24oSGq.Mb.WiN6PNxxuCNYDsq6PJFyu3JH4lGswoAH93jaaBpe', '$2y$12$AF22z9UVH/u8F8l6Io6fX.RUNF4L6J82C4GOL7E1oLl9TbVJQzSvG', 975137, '2025-06-11 10:53:09', 1, NULL, NULL, NULL),
(19, 'd5cd83b1-b977-44e5-ab88-83a3caf94b06', 'harshita', 'vasaniharshita59@gmail.com', NULL, 6354744741, NULL, NULL, '23.0225', '72.5714', '2025-06-18 13:40:19', '2025-07-28 05:06:47', 1, 0, '103.1.100.226', 'Bhairvnath', '$2y$12$SjJ6VJ5qgTMedKUDk56/huhAEHWrOfygXOW6N2knvfl/GDXo7Iziy', '$2y$12$D7iewEhNIfsfM6r0sOv0h.xqr8aMbszi0UjRheE1LbFKllhicZBoG', 1903, '2025-07-28 10:45:36', 1, NULL, '1750755605_24062025143005.jpg', 1),
(20, 'bf10bdba-2b23-4836-b2a9-fe52bb90b0ec', 'Krunal', 'shahkrunal83@gmail.com', NULL, 9824773136, NULL, NULL, '22.9956', '72.5962', '2025-06-19 11:19:50', '2025-06-19 11:20:38', 1, 0, '103.1.100.226', 'Bhairavnath corss road maninagar', '$2y$12$r8iOelwQZNPSJeAITQ0.E.PO70lTBEKP8qzB1Jbwdz5WnrbuXHesG', '$2y$12$E0xjL5RKNTvz8jD1NOToVe.eHTPYqa0wgwSy9bXRUXVzEYMF0irl.', 633269, '2025-06-19 16:59:50', 1, NULL, NULL, NULL),
(21, '16f4e469-01d8-42ca-8287-17b08dc819cf', 'nisha', 'ai.dev.laravel102@gmail.com', NULL, 1234567852, NULL, NULL, NULL, NULL, '2025-07-25 13:43:14', '2025-07-25 13:43:14', 1, 0, '103.1.100.226', 'vastarl', '$2y$12$9Tbn/MddRn0uzC3X.mFPO.TTq9JUvzSlb/jwgWJl1QQx9u665C0Eu', '$2y$12$kJAHWog2ra4zW8lTinWpUukzZaxY3ujbg/AGUb08PSNO2P9rMU/fu', 938201, '2025-07-25 19:23:14', NULL, NULL, NULL, NULL),
(22, '9645e68b-ae16-4b86-a13f-6c9183636675', 'mihir', 'dev2.apolloinfotech@gmail.com', NULL, 1254987652, NULL, NULL, NULL, NULL, '2025-07-25 13:50:29', '2025-07-25 13:51:33', 1, 0, '103.1.100.226', 'vastarl', '$2y$12$7GkW4M6rMxBU32JtPfpsH.nxOHqp5m0xgkeCHtvzWbkqqB6EUz2.O', '$2y$12$kKs9/AJSsIPDtJTneVebNOJF2PfxJxO71X4ENuPBPSenMKZRep4Te', 806194, '2025-07-25 19:30:28', 1, NULL, NULL, NULL),
(23, 'a71bffb5-6054-484d-8ddc-3d1c9a28be91', 'nisha', 'ai.dev.laravel10@gmail.com', '103.1.100.226', 1452369788, NULL, NULL, NULL, NULL, '2025-07-25 13:58:02', '2025-07-25 13:58:25', 1, 0, '103.1.100.226', 'Bhairvnath', '$2y$12$I604LJmwI.C9ZHKfgpsHd.zaEucVRJyfm8NgEv0sHaKPqQ63ax6Te', '$2y$12$jbp6ASdv.w6fGk7mi..8J.aC335dQUhuQLSBTUY637KgYjmjt3bJi', 581048, '2025-07-25 19:38:01', 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Customer_Review`
--

CREATE TABLE `Customer_Review` (
  `Customer_Review_id` int(11) NOT NULL,
  `review` int(11) DEFAULT '0',
  `customer_id` text,
  `deal_id` int(11) DEFAULT '0',
  `vendor_id` int(11) DEFAULT '0',
  `iStatus` int(11) DEFAULT '1',
  `isDelete` int(11) DEFAULT '0',
  `strIP` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Customer_Review`
--

INSERT INTO `Customer_Review` (`Customer_Review_id`, `review`, `customer_id`, `deal_id`, `vendor_id`, `iStatus`, `isDelete`, `strIP`, `created_at`, `updated_at`) VALUES
(1, 5, '8ac2ddf0-db90-477c-941f-014108b77e91', 2, 57, 1, 0, '103.1.100.226', '2025-04-07 13:20:04', '2025-04-07 13:20:04'),
(2, 5, '8ac2ddf0-db90-477c-941f-014108b77e91', 1, 58, 1, 0, '103.1.100.226', '2025-04-07 13:33:04', '2025-04-07 13:33:04'),
(3, 3, 'd5755b1a-567e-4bfc-8a74-cdebe729d560', 1, 57, 1, 0, '103.1.100.226', '2025-04-07 13:37:53', '2025-04-07 13:37:53'),
(4, 5, '3b43a6a2-13e2-49f1-9f4f-5a16247a2053', 55, 78, 1, 0, '103.1.100.226', '2025-05-06 09:52:59', '2025-05-06 09:52:59'),
(5, 2, 'd5cd83b1-b977-44e5-ab88-83a3caf94b06', 2, 57, 1, 0, '103.1.100.226', '2025-06-24 07:27:19', '2025-06-24 07:27:19');

-- --------------------------------------------------------

--
-- Table structure for table `Dealmultiimage`
--

CREATE TABLE `Dealmultiimage` (
  `Dealimage_id` int(11) NOT NULL,
  `photo` text,
  `deal_id` int(11) DEFAULT NULL,
  `Image_type` int(11) DEFAULT NULL COMMENT '0=Self,1=Bank,2=AI',
  `imagebank_id` int(11) DEFAULT NULL,
  `strIP` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_primary` int(11) DEFAULT '0',
  `iStatus` int(11) DEFAULT '1',
  `isDelete` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Dealmultiimage`
--

INSERT INTO `Dealmultiimage` (`Dealimage_id`, `photo`, `deal_id`, `Image_type`, `imagebank_id`, `strIP`, `created_at`, `updated_at`, `is_primary`, `iStatus`, `isDelete`) VALUES
(1, '1736577710_png.png', 1, 0, NULL, '103.1.100.226', '2025-01-11 06:41:50', '2025-01-11 06:41:50', 1, 1, 0),
(3, '1736577711_png.png', 1, 0, NULL, '103.1.100.226', '2025-01-11 06:41:51', '2025-01-11 06:41:51', 1, 1, 0),
(5, '1736577929_logo.png', 1, 0, NULL, '103.1.100.226', '2025-01-11 06:45:29', '2025-01-11 06:45:29', 1, 1, 0),
(6, '1736586083_room-3.jpg', 2, 0, NULL, '103.1.100.226', '2025-01-11 09:01:23', '2025-01-11 09:01:23', 1, 1, 0),
(7, '1736586083_room-2.jpg', 2, 0, NULL, '103.1.100.226', '2025-01-11 09:01:23', '2025-01-11 09:01:23', 0, 1, 0),
(8, '1736586083_room-1.jpg', 2, 0, NULL, '103.1.100.226', '2025-01-11 09:01:23', '2025-01-11 09:01:23', 0, 1, 0),
(9, '1736597489_banner.jpg', 3, 0, NULL, '103.1.100.226', '2025-01-11 12:11:29', '2025-01-11 12:11:29', 1, 1, 0),
(10, '1736597489_banner2.webp', 3, 0, NULL, '103.1.100.226', '2025-01-11 12:11:29', '2025-01-11 12:11:29', 0, 1, 0),
(11, '1736597489_about2.jpg', 3, 0, NULL, '103.1.100.226', '2025-01-11 12:11:29', '2025-01-11 12:11:29', 0, 1, 0),
(12, '1736597489_image1.jpg', 3, 0, NULL, '103.1.100.226', '2025-01-11 12:11:29', '2025-01-11 12:11:29', 0, 1, 0),
(13, '1736597489_room-3.jpg', 3, 0, NULL, '103.1.100.226', '2025-01-11 12:11:29', '2025-01-11 12:11:29', 0, 1, 0),
(14, '1736597489_room-2.jpg', 3, 0, NULL, '103.1.100.226', '2025-01-11 12:11:29', '2025-01-11 12:11:29', 0, 1, 0),
(15, '1736597489_room-1.jpg', 3, 0, NULL, '103.1.100.226', '2025-01-11 12:11:29', '2025-01-11 12:11:29', 0, 1, 0),
(16, '1736598051_rediculous-fast-food-with-pizza-burritos-fried-chicken-french-fries-burgers-other-fast-food_268722-1653.avif', 4, 0, NULL, '103.1.100.226', '2025-01-11 12:20:51', '2025-01-11 12:20:51', 1, 1, 0),
(17, '1736598443_Savage.webp', 5, 0, NULL, '103.1.100.226', '2025-01-11 12:27:23', '2025-01-11 12:27:23', 1, 1, 0),
(18, '1736598443_photo-1593487568720-92097fb460fb.jpeg', 5, 0, NULL, '103.1.100.226', '2025-01-11 12:27:23', '2025-01-11 12:27:23', 0, 1, 0),
(19, '1736599324_amazon-sale-offers-today-best-mobile-phones-from-apple-samsung-oppo-realme-oneplus-and-more.webp', 6, 0, NULL, '103.1.100.226', '2025-01-11 12:42:04', '2025-01-11 12:42:04', 1, 1, 0),
(20, '1736599589_best-deals-power-banks-featured-1200x900.png', 7, 0, NULL, '103.1.100.226', '2025-01-11 12:46:29', '2025-01-11 12:46:29', 1, 1, 0),
(21, '1736599665_best-deals-power-banks-featured-1200x900.png', 7, 0, NULL, '103.1.100.226', '2025-01-11 12:47:45', '2025-01-11 12:47:45', 1, 1, 0),
(22, '1736600909_effective-cosmetic-marketing-strategies-for-brands-01.jpg', 8, 0, NULL, '103.1.100.226', '2025-01-11 13:08:29', '2025-01-11 13:08:29', 1, 1, 0),
(23, '1736602841_how-often-do-kids-need-a-teeth-cleaning.jpg', 9, 0, NULL, '103.1.100.226', '2025-01-11 13:40:41', '2025-01-11 13:40:41', 1, 1, 0),
(24, '1736603037_t1024x619.webp', 10, 0, NULL, '103.1.100.226', '2025-01-11 13:43:57', '2025-01-11 13:43:57', 1, 1, 0),
(25, '1737450207_video-2.jpg', 32, 0, NULL, '103.1.100.226', '2025-01-21 09:03:27', '2025-01-21 09:03:27', 1, 1, 0),
(26, '1737450207_about2.jpg', 32, 0, NULL, '103.1.100.226', '2025-01-21 09:03:27', '2025-01-21 09:03:27', 0, 1, 0),
(27, '1737450222_video-2.jpg', 32, 0, NULL, '103.1.100.226', '2025-01-21 09:03:42', '2025-01-21 09:03:42', 1, 1, 0),
(28, '1737450222_about2.jpg', 32, 0, NULL, '103.1.100.226', '2025-01-21 09:03:42', '2025-01-21 09:03:42', 0, 1, 0),
(30, '1737613916_ded82e01f2fedd62f1dad258350c803e.jpg', 39, 0, NULL, '103.1.100.226', '2025-01-23 06:31:56', '2025-01-23 06:31:56', 1, 1, 0),
(37, '1738213369_download_(21)-transformed.jpeg', 44, 0, NULL, '103.1.100.226', '2025-01-30 05:02:49', '2025-01-30 05:02:49', 1, 1, 0),
(38, '1738213369_Mystical-MidEvil-Waterfall-Fantasy-Castle-In-The-Mist-61701803-1.png', 44, 0, NULL, '103.1.100.226', '2025-01-30 05:02:49', '2025-01-30 05:02:49', 0, 1, 0),
(39, '1738213369_Fantasy-Castle-Scenic-Waterfall-Painting-50568270-1-1.png', 44, 0, NULL, '103.1.100.226', '2025-01-30 05:02:49', '2025-01-30 05:02:49', 0, 1, 0),
(40, '1738213376_download_(21)-transformed.jpeg', 44, 0, NULL, '103.1.100.226', '2025-01-30 05:02:56', '2025-01-30 05:02:56', 1, 1, 0),
(41, '1738213376_Mystical-MidEvil-Waterfall-Fantasy-Castle-In-The-Mist-61701803-1.png', 44, 0, NULL, '103.1.100.226', '2025-01-30 05:02:56', '2025-01-30 05:02:56', 0, 1, 0),
(42, '1738213376_Fantasy-Castle-Scenic-Waterfall-Painting-50568270-1-1.png', 44, 0, NULL, '103.1.100.226', '2025-01-30 05:02:56', '2025-01-30 05:02:56', 0, 1, 0),
(43, '1738213383_download_(21)-transformed.jpeg', 44, 0, NULL, '103.1.100.226', '2025-01-30 05:03:03', '2025-01-30 05:03:03', 1, 1, 0),
(44, '1738213383_Mystical-MidEvil-Waterfall-Fantasy-Castle-In-The-Mist-61701803-1.png', 44, 0, NULL, '103.1.100.226', '2025-01-30 05:03:03', '2025-01-30 05:03:03', 0, 1, 0),
(45, '1738213383_Fantasy-Castle-Scenic-Waterfall-Painting-50568270-1-1.png', 44, 0, NULL, '103.1.100.226', '2025-01-30 05:03:03', '2025-01-30 05:03:03', 0, 1, 0),
(47, '1738581974_Fantasy-Castle-Scenic-Waterfall-Painting-50568270-1-1.png', 46, 0, NULL, '103.1.100.226', '2025-02-03 11:26:14', '2025-02-03 11:26:14', 1, 1, 0),
(48, '1738581974_photo-1524338198850-8a2ff63aaceb.jpeg', 46, 0, NULL, '103.1.100.226', '2025-02-03 11:26:14', '2025-02-03 11:26:14', 0, 1, 0),
(49, '1738581974_download (21).jpeg', 46, 0, NULL, '103.1.100.226', '2025-02-03 11:26:14', '2025-02-03 11:26:14', 0, 1, 0),
(50, '1738581974_Fantasy-Castle-Scenic-Waterfall-Painting-50568270-1-1.png', 46, 0, NULL, '103.1.100.226', '2025-02-03 11:26:14', '2025-02-03 11:26:14', 1, 1, 0),
(51, '1738581974_photo-1524338198850-8a2ff63aaceb.jpeg', 46, 0, NULL, '103.1.100.226', '2025-02-03 11:26:14', '2025-02-03 11:26:14', 0, 1, 0),
(52, '1738581974_download (21).jpeg', 46, 0, NULL, '103.1.100.226', '2025-02-03 11:26:14', '2025-02-03 11:26:14', 0, 1, 0),
(53, '1738581983_Fantasy-Castle-Scenic-Waterfall-Painting-50568270-1-1.png', 46, 0, NULL, '103.1.100.226', '2025-02-03 11:26:23', '2025-02-03 11:26:23', 1, 1, 0),
(54, '1738581983_photo-1524338198850-8a2ff63aaceb.jpeg', 46, 0, NULL, '103.1.100.226', '2025-02-03 11:26:23', '2025-02-03 11:26:23', 0, 1, 0),
(55, '1738581983_download (21).jpeg', 46, 0, NULL, '103.1.100.226', '2025-02-03 11:26:23', '2025-02-03 11:26:23', 0, 1, 0),
(56, '1738581986_Fantasy-Castle-Scenic-Waterfall-Painting-50568270-1-1.png', 46, 0, NULL, '103.1.100.226', '2025-02-03 11:26:26', '2025-02-03 11:26:26', 1, 1, 0),
(57, '1738581986_photo-1524338198850-8a2ff63aaceb.jpeg', 46, 0, NULL, '103.1.100.226', '2025-02-03 11:26:26', '2025-02-03 11:26:26', 0, 1, 0),
(58, '1738581986_download (21).jpeg', 46, 0, NULL, '103.1.100.226', '2025-02-03 11:26:26', '2025-02-03 11:26:26', 0, 1, 0),
(59, '1738658413_New Project.jpg', 47, 0, NULL, '103.1.100.226', '2025-02-04 08:40:13', '2025-02-04 08:40:13', 1, 1, 0),
(61, '1741332831_1741330731_ai.png', 31, 2, NULL, '103.1.100.226', '2025-03-07 07:33:51', '2025-03-07 07:33:51', 0, 1, 0),
(65, '1742447760_about1.jpg', 49, 0, NULL, '103.1.100.226', '2025-03-20 05:16:00', '2025-03-20 05:16:00', 1, 1, 0),
(66, '1742447760_1742447633_ai.png', 49, 2, NULL, '103.1.100.226', '2025-03-20 05:16:00', '2025-03-20 05:16:00', 0, 1, 0),
(67, '1737009432_16012025120712.jpg', 49, 1, 20, '103.1.100.226', '2025-03-20 05:16:00', '2025-03-20 05:16:00', 0, 1, 0),
(68, '1734950994_23122024161954.jpg', 51, 1, 14, '103.1.100.226', '2025-04-04 06:18:27', '2025-04-04 06:18:27', 0, 1, 0),
(74, '1735562066_30122024180426.jpg', 55, 1, 17, '103.1.100.226', '2025-05-06 09:13:41', '2025-05-06 09:13:41', 0, 1, 0),
(77, '1737009432_16012025120712.jpg', 55, 1, 20, '103.1.100.226', '2025-06-26 10:28:36', '2025-06-26 10:28:36', 0, 1, 0),
(78, '1751361982_pizza.jpeg', 61, 0, NULL, '103.1.100.226', '2025-07-01 09:26:22', '2025-07-01 09:26:22', 1, 1, 0),
(79, '1751362932_store.jpg', 62, 0, NULL, '103.1.100.226', '2025-07-01 09:42:12', '2025-07-01 09:42:12', 1, 1, 0),
(80, '1751363055_alcohol.png', 63, 0, NULL, '103.1.100.226', '2025-07-01 09:44:15', '2025-07-01 09:44:15', 1, 1, 0),
(81, '1751363288_bar1.jpg', 64, 0, NULL, '103.1.100.226', '2025-07-01 09:48:08', '2025-07-01 09:48:08', 1, 1, 0),
(82, '1751365036_cafe.jpeg', 65, 0, NULL, '103.1.100.226', '2025-07-01 10:17:16', '2025-07-01 10:17:16', 1, 1, 0),
(83, '1751365242_skin.jpeg', 66, 0, NULL, '103.1.100.226', '2025-07-01 10:20:42', '2025-07-01 10:20:42', 1, 1, 0),
(84, '1751365462_hair.jpeg', 67, 0, NULL, '103.1.100.226', '2025-07-01 10:24:22', '2025-07-01 10:24:22', 1, 1, 0),
(85, '1751365680_salon.jpg', 68, 0, NULL, '103.1.100.226', '2025-07-01 10:28:00', '2025-07-01 10:28:00', 1, 1, 0),
(86, '1751365841_hairspa.jpg', 69, 0, NULL, '103.1.100.226', '2025-07-01 10:30:41', '2025-07-01 10:30:41', 1, 1, 0),
(87, '1751366050_nails.jpeg', 70, 0, NULL, '103.1.100.226', '2025-07-01 10:34:10', '2025-07-01 10:34:10', 1, 1, 0),
(88, '1751366338_kids.jpg', 71, 0, NULL, '103.1.100.226', '2025-07-01 10:38:58', '2025-07-01 10:38:58', 1, 1, 0),
(89, '1751366619_fun.jpg', 72, 0, NULL, '103.1.100.226', '2025-07-01 10:43:39', '2025-07-01 10:43:39', 1, 1, 0),
(90, '1751366808_tours.jpg', 73, 0, NULL, '103.1.100.226', '2025-07-01 10:46:48', '2025-07-01 10:46:48', 1, 1, 0),
(91, '1751367033_events.jpg', 74, 0, NULL, '103.1.100.226', '2025-07-01 10:50:33', '2025-07-01 10:50:33', 1, 1, 0),
(92, '1751367248_sports.jpg', 75, 0, NULL, '103.1.100.226', '2025-07-01 10:54:08', '2025-07-01 10:54:08', 1, 1, 0),
(93, '1751368532_oilchange.jpg', 76, 0, NULL, '103.1.100.226', '2025-07-01 11:15:32', '2025-07-01 11:15:32', 1, 1, 0),
(94, '1751368765_tops.jpg', 77, 0, NULL, '103.1.100.226', '2025-07-01 11:19:25', '2025-07-01 11:19:25', 1, 1, 0),
(95, '1751368972_phone.jpg', 78, 0, NULL, '103.1.100.226', '2025-07-01 11:22:52', '2025-07-01 11:22:52', 1, 1, 0),
(96, '1751369246_travels.png', 79, 0, NULL, '103.1.100.226', '2025-07-01 11:27:26', '2025-07-01 11:27:26', 1, 1, 0),
(97, '1751369884_velentinecafe.jpeg', 80, 0, NULL, '103.1.100.226', '2025-07-01 11:38:04', '2025-07-01 11:38:04', 1, 1, 0),
(98, '1751375789_velentinecafe.jpeg', 81, 0, NULL, '103.1.100.226', '2025-07-01 13:16:29', '2025-07-01 13:16:29', 1, 1, 0),
(99, '1751376458_spa2.jpg', 82, 0, NULL, '103.1.100.226', '2025-07-01 13:27:38', '2025-07-01 13:27:38', 1, 1, 0),
(101, '1752062190_register_bg.jpg', 83, 0, NULL, '103.1.100.226', '2025-07-09 11:56:30', '2025-07-09 11:56:30', 1, 1, 0),
(102, '1752821309_women2.jpeg', 84, 0, NULL, '103.1.100.226', '2025-07-18 06:48:29', '2025-07-18 06:48:29', 1, 1, 0),
(103, '1752821309_1752821298_ai.png', 84, 2, NULL, '103.1.100.226', '2025-07-18 06:48:29', '2025-07-18 06:48:29', 0, 1, 0),
(104, '1735562066_30122024180426.jpg', 84, 1, 17, '103.1.100.226', '2025-07-18 06:48:29', '2025-07-18 06:48:29', 0, 1, 0),
(105, '1753274487_Screenshot from 2025-07-23 16-58-56.png', 55, 0, NULL, '103.1.100.226', '2025-07-23 12:41:27', '2025-07-23 12:41:27', 0, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `DealOption`
--

CREATE TABLE `DealOption` (
  `deal_option_id` int(11) NOT NULL,
  `option_title` varchar(255) DEFAULT NULL,
  `regular_price` int(11) DEFAULT NULL,
  `pricecut_price` int(11) DEFAULT NULL,
  `monthly_voucher_cap` int(11) DEFAULT NULL,
  `item_sold` int(100) DEFAULT NULL,
  `deal_id` int(11) DEFAULT NULL,
  `iStatus` varchar(45) DEFAULT '1',
  `isDelete` varchar(45) DEFAULT '0',
  `strIP` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `DealOption`
--

INSERT INTO `DealOption` (`deal_option_id`, `option_title`, `regular_price`, `pricecut_price`, `monthly_voucher_cap`, `item_sold`, `deal_id`, `iStatus`, `isDelete`, `strIP`, `created_at`, `updated_at`) VALUES
(1, 'Zomto 10% off', 1200, 1000, 50, NULL, 1, '1', '0', '103.1.100.226', '2025-01-11 06:40:32', '2025-01-11 06:44:53'),
(2, 'Zomoto 20% off', 1200, 1000, 50, NULL, 1, '1', '0', '103.1.100.226', '2025-01-11 06:40:54', '2025-01-11 06:40:54'),
(3, 'DELUX HOTEL', 1099, 599, 50, NULL, 2, '1', '0', '103.1.100.226', '2025-01-11 08:59:39', '2025-01-11 08:59:39'),
(4, 'NON-AC ROOM', 599, 299, 100, NULL, 2, '1', '0', '103.1.100.226', '2025-01-11 08:59:55', '2025-01-11 08:59:55'),
(5, 'Standard Room', 1999, 1299, 500, NULL, 3, '1', '0', '103.1.100.226', '2025-01-11 12:09:13', '2025-01-11 12:09:13'),
(6, 'Deluxe Room', 2999, 2099, 100, NULL, 3, '1', '0', '103.1.100.226', '2025-01-11 12:09:48', '2025-01-11 12:09:48'),
(7, 'Presidential Suite', 3999, 2999, 150, NULL, 3, '1', '0', '103.1.100.226', '2025-01-11 12:10:14', '2025-01-11 12:10:14'),
(8, 'Classic Burger Meal', 399, 299, 5000, NULL, 4, '1', '0', '103.1.100.226', '2025-01-11 12:19:19', '2025-01-11 12:19:19'),
(9, 'Pizza Mania Combo', 599, 499, 1000, NULL, 4, '1', '0', '103.1.100.226', '2025-01-11 12:19:35', '2025-01-11 12:19:35'),
(10, 'Street Food Fiesta Box', 299, 199, 500, NULL, 4, '1', '0', '103.1.100.226', '2025-01-11 12:20:04', '2025-01-11 12:20:04'),
(11, 'Eternal Bloom (50ml)', 1699, 1499, 500, NULL, 5, '1', '0', '103.1.100.226', '2025-01-11 12:24:38', '2025-01-11 12:24:38'),
(12, 'Midnight Oud (100ml)', 2799, 2299, 100, NULL, 5, '1', '0', '103.1.100.226', '2025-01-11 12:25:07', '2025-01-11 12:25:07'),
(13, 'Citrus Fresh Splash (75ml)', 999, 599, 500, NULL, 5, '1', '0', '103.1.100.226', '2025-01-11 12:25:43', '2025-01-11 12:25:43'),
(14, 'Galaxy X10 Pro', 32999, 24999, 5000, NULL, 6, '1', '0', '103.1.100.226', '2025-01-11 12:39:49', '2025-01-11 12:39:49'),
(15, 'iPhone 14 Mini', 64900, 58499, 500, NULL, 6, '1', '0', '103.1.100.226', '2025-01-11 12:40:40', '2025-01-11 12:40:40'),
(16, 'Redmi Note 13 Max', 18999, 14999, 500, NULL, 6, '1', '0', '103.1.100.226', '2025-01-11 12:41:09', '2025-01-11 12:41:09'),
(17, 'PowerBank Pro 10000mAh', 1499, 999, 500, NULL, 7, '1', '0', '103.1.100.226', '2025-01-11 12:44:39', '2025-01-11 12:44:39'),
(18, 'MaxCharge 20000mAh', 2499, 1799, 50, NULL, 7, '1', '0', '103.1.100.226', '2025-01-11 12:45:05', '2025-01-11 12:45:05'),
(19, 'TurboCharge 30000mAh', 3999, 2999, 1000, NULL, 7, '1', '0', '103.1.100.226', '2025-01-11 12:45:28', '2025-01-11 12:45:28'),
(20, 'Radiance Boost Liquid Foundation (30ml)', 1799, 1199, 500, NULL, 8, '1', '0', '103.1.100.226', '2025-01-11 13:06:25', '2025-01-11 13:06:25'),
(21, 'Velvet Matte Lipstick Duo', 1199, 799, 1000, NULL, 8, '1', '0', '103.1.100.226', '2025-01-11 13:06:48', '2025-01-11 13:06:48'),
(22, 'GlowGlam Highlighter Palette', 2299, 1499, 1000, NULL, 8, '1', '0', '103.1.100.226', '2025-01-11 13:07:21', '2025-01-11 13:07:21'),
(23, 'complete teeth cleaning and whitening package', 599, 499, 1000, NULL, 9, '1', '0', '103.1.100.226', '2025-01-11 13:39:59', '2025-01-11 13:39:59'),
(24, 'Skilled stylists give the client new style with cuts to create a fresh look', 5999, 4999, 100, NULL, 10, '1', '0', '103.1.100.226', '2025-01-11 13:42:59', '2025-01-11 13:42:59'),
(25, 'FREE LUNCH WITH HOTEL BOOKING', 1999, 1099, 50, NULL, 32, '1', '0', '103.1.100.226', '2025-01-21 09:02:21', '2025-01-21 09:02:21'),
(29, 'winter wear', 999, 799, 50, NULL, 39, '1', '0', '103.1.100.226', '2025-01-23 06:21:36', '2025-01-23 06:21:36'),
(31, 'test', 2000, 1500, 500, NULL, 44, '1', '0', '103.1.100.226', '2025-01-30 05:02:18', '2025-01-30 05:02:18'),
(33, 'test', 2000, 1500, 500, NULL, 46, '1', '0', '103.1.100.226', '2025-02-03 11:25:40', '2025-02-03 11:25:40'),
(34, 'test2', 5000, 2500, 50, NULL, 47, '1', '0', '103.1.100.226', '2025-02-04 08:39:50', '2025-02-04 08:40:00'),
(36, 'test', 199, 100, 50, NULL, 49, '1', '0', '103.1.100.226', '2025-03-20 05:13:03', '2025-03-20 05:13:03'),
(37, 'BOGO OFFER', 1500, 1099, 50, NULL, 51, '1', '0', '103.1.100.226', '2025-04-04 06:18:17', '2025-04-04 06:18:17'),
(40, 'clothes', 1000, 950, 500, NULL, 55, '1', '0', '103.1.100.226', '2025-05-06 09:11:09', '2025-05-06 09:11:39'),
(41, 'pizaa', 220, 200, 100, NULL, 61, '1', '0', '103.1.100.226', '2025-07-01 09:24:34', '2025-07-01 09:24:34'),
(42, 'hair remove', 150, 120, 100, NULL, 67, '1', '0', '103.1.100.226', '2025-07-01 10:23:18', '2025-07-01 10:23:18'),
(43, 'hair cutting', 500, 450, 500, NULL, 68, '1', '0', '103.1.100.226', '2025-07-01 10:27:43', '2025-07-01 10:27:43'),
(44, 'hair spa', 4000, 3000, 500, NULL, 69, '1', '0', '103.1.100.226', '2025-07-01 10:29:38', '2025-07-01 10:29:38'),
(45, 'Nail Extention', 1000, 800, 400, NULL, 70, '1', '0', '103.1.100.226', '2025-07-01 10:33:56', '2025-07-01 10:33:56'),
(46, 'kids', 500, 400, 200, NULL, 71, '1', '0', '103.1.100.226', '2025-07-01 10:37:11', '2025-07-01 10:37:11'),
(47, 'tours', 9000, 8000, 300, NULL, 73, '1', '0', '103.1.100.226', '2025-07-01 10:46:29', '2025-07-01 10:46:29'),
(48, 'Club', 500, 400, 1000, NULL, 74, '1', '0', '103.1.100.226', '2025-07-01 10:50:16', '2025-07-01 10:50:16'),
(49, 'oil test', 800, 600, 700, NULL, 76, '1', '0', '103.1.100.226', '2025-07-01 11:15:07', '2025-07-01 11:15:07'),
(50, 'top', 900, 800, 1000, NULL, 77, '1', '0', '103.1.100.226', '2025-07-01 11:18:06', '2025-07-01 11:18:06'),
(51, 'phone', 100000, 90000, 1000, NULL, 78, '1', '0', '103.1.100.226', '2025-07-01 11:22:34', '2025-07-01 11:22:34'),
(52, 'travel', 9000, 8000, 100, NULL, 79, '1', '0', '103.1.100.226', '2025-07-01 11:27:10', '2025-07-01 11:27:10'),
(53, 'cafe', 1500, 1000, 8, NULL, 80, '1', '0', '103.1.100.226', '2025-07-01 11:37:42', '2025-07-01 11:37:42'),
(54, 'test', 1200, 1000, 50, NULL, 84, '1', '0', '103.1.100.226', '2025-07-18 06:47:27', '2025-07-18 06:47:27'),
(55, 'fdfgdfg', 150, 599, 10, NULL, 55, '1', '0', '103.1.100.226', '2025-07-23 05:45:48', '2025-07-23 05:45:48'),
(56, '50% off', 2000, 1200, 50, NULL, 55, '1', '0', '103.1.100.226', '2025-07-23 05:52:53', '2025-07-23 05:52:53'),
(57, 'dsffdsf', 1666, 299, 10, NULL, 55, '1', '0', '103.1.100.226', '2025-07-23 05:59:57', '2025-07-23 05:59:57'),
(58, 'fdsfsdf', 500, 599, 50, NULL, 55, '1', '0', '103.1.100.226', '2025-07-23 06:11:29', '2025-07-23 06:11:29'),
(59, '10 % off', 1200, 100, 40, NULL, 86, '1', '0', '103.1.100.226', '2025-07-23 06:15:26', '2025-07-23 06:15:52'),
(60, 'trngvnc', 500, 450, 10, NULL, 85, '1', '0', '103.1.100.226', '2025-07-23 06:25:15', '2025-07-23 06:25:15');

-- --------------------------------------------------------

--
-- Table structure for table `Deals`
--

CREATE TABLE `Deals` (
  `Deals_id` int(11) NOT NULL,
  `GUID` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `deal_description` text,
  `deal_address` varchar(255) DEFAULT NULL,
  `deal_state_id` int(11) DEFAULT NULL,
  `deal_city_id` int(11) DEFAULT NULL,
  `deal_category_id` int(11) DEFAULT NULL,
  `deal_sub_category_id` int(11) DEFAULT NULL,
  `display_start_date` date DEFAULT NULL,
  `display_end_date` date DEFAULT NULL,
  `offer_start_date` date DEFAULT NULL,
  `offer_end_date` date DEFAULT NULL,
  `deals_slug` varchar(255) DEFAULT NULL,
  `main_title` varchar(255) DEFAULT NULL,
  `Map_link` text,
  `vendorid` int(255) DEFAULT NULL,
  `business_desc` text,
  `business_website` varchar(255) DEFAULT NULL,
  `business_type` varchar(255) DEFAULT NULL,
  `Is_publish` int(255) NOT NULL DEFAULT '0',
  `iStatus` int(11) DEFAULT '1',
  `isDelete` int(11) DEFAULT '0',
  `strIP` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Deals`
--

INSERT INTO `Deals` (`Deals_id`, `GUID`, `user_id`, `deal_description`, `deal_address`, `deal_state_id`, `deal_city_id`, `deal_category_id`, `deal_sub_category_id`, `display_start_date`, `display_end_date`, `offer_start_date`, `offer_end_date`, `deals_slug`, `main_title`, `Map_link`, `vendorid`, `business_desc`, `business_website`, `business_type`, `Is_publish`, `iStatus`, `isDelete`, `strIP`, `created_at`, `updated_at`) VALUES
(1, '73c2b274-7e8f-4d20-9f4f-89d8e6d9064d', 1, 'Zomoto 10% off', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'zomoto-10%-off', 'Zomoto 10% Off', NULL, 58, '<p>Food factory</p>', 'www.com', 'Food factory', 1, 1, 0, '103.1.100.226', '2025-01-11 06:40:09', '2025-07-25 09:01:37'),
(2, 'd423d605-d5c7-42d9-b887-588f5a438d0b', 1, 'Niagara Falls, Ontario: Panoramic Views of the Falls near Vegas-Style Casinos and Water ParksAt Niagara Falls, water thunders downward from a height of nearly 200 feet, crashing onto craggy boulders below. The falls straddle the border between Canada and the United States, but the Canadian side of the Niagara River is universally hailed as the finest vantage point to take in all three of Niagara Falls\' photogenic brinks: American, Bridal Veil, and Horseshoe Falls.Hornblower cruises ferry raincoat-clad passengers around the base of the falls from April to October, depending on the river\'s ice conditions. Year-round, Journey Behind the Falls grants a glimpse behind the curtain of Horseshoe Falls—visitors board an elevator that descends 150 feet into the bedrock, then stand at an observation deck steps from the cascading water. A 10-minute walk from the falls is the neon-lit Clifton Hill neighborhood. Its Fallsview Boulevard has plenty of Vegas-style kitsch, including glitzy casinos and indoor wasster parks.', NULL, NULL, NULL, 38, 35, '2025-01-17', '2025-01-31', '2025-01-18', '2025-01-26', 'falt-90%-off-on-selected-new-hotel', 'Falt 90% Off On Selected New Hotel', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3671.41721847043!2d72.53958741080432!3d23.045160815397992!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x395e84bd0bffdef3%3A0x30a7a05a505bc00b!2sHelmet%20Cross%20Roads%2C%20University%20Area%2C%20Ahmedabad%2C%20Gujarat%20380009!5e0!3m2!1sen!2sin!4v1737743220757!5m2!1sen!2sin\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>', 57, '<p>Sfsf</p>', 'apolloinfotech.com', 'Web Designer', 1, 1, 0, '103.1.100.226', '2025-01-11 08:54:35', '2025-07-25 09:29:30'),
(3, 'e6acfaac-0ea3-4aed-bded-cfa7a9f5ecc8', 1, 'Hotel Features &amp; AmenitiesPrime Location: Just minutes away from popular attractions, restaurants, and shopping districts.On-Site Dining: Enjoy a variety of cuisines at our award-winning restaurant, or unwind with cocktails at the rooftop bar.Spa &amp; Wellness Center: Rejuvenate with a relaxing massage, sauna, or fitness session in our state-of-the-art gym.Business Center: Equipped with high-speed internet, meeting rooms, and audiovisual facilities for corporate guests.Family-Friendly Services: Dedicated play areas for kids and babysitting services available upon request.24/7 Concierge: Personalized assistance for tours, transport, and special requests.', NULL, NULL, NULL, NULL, NULL, '2025-01-25', '2025-01-25', '2025-01-25', '2025-01-25', 'hotel-booking-deal', 'Hotel Booking Deal', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3672.761482746921!2d72.59354567456437!3d22.995796779192514!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x395e8f5855555537%3A0xa2b102d6c37aeeb6!2sApollo%20Infotech%20-%20Best%20Website%20Development%20Ahmedabad%20%7C%20Website%20Design%20Ahmedabad%20%7C%20SEO%20Company%20Ahmedabad!5e0!3m2!1sen!2sin!4v1737795088278!5m2!1sen!2sin\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>', 59, '<p>Experience unparalleled comfort and elegance at <strong>Luxury Stay Hotel</strong>, where modern amenities meet timeless hospitality. Perfectly located in the bustling heart of the city, our hotel offers breathtaking city views, luxurious rooms, and world-class facilities, making it the ideal choice for business travelers, couples, and families alike.</p>', 'apolloinfotech.com', 'Hotel Booking', 1, 1, 0, '103.1.100.226', '2025-01-11 12:08:47', '2025-07-25 09:02:18'),
(4, '460b58f4-8bd3-45d2-b5ba-eda4a9e067d8', 1, 'Savor the Flavors – Delicious Meals at Unbeatable Prices!Whether you\'re craving classic comfort food, exotic dishes, or a hearty family meal, our exclusive Taste Fest Combo Deals have something for everyone. Perfect for dine-in, takeaway, or delivery, these deals are crafted to satisfy your cravings while being easy on your wallet.', NULL, NULL, NULL, 36, 42, NULL, NULL, NULL, NULL, 'taste-fest-combo-deals', 'Taste Fest Combo Deals', NULL, 59, '<h3><strong>Delivery and Ordering Details</strong></h3><ul><li><strong>Order Timing:</strong> 11:00 AM – 11:00 PM</li><li><strong>Delivery Charges:</strong> ₹50 (Free for orders above ₹499)</li><li><strong>Payment Options:</strong> Cash on Delivery, UPI, Debit/Credit Cards</li></ul>', 'foodahemedabad.com', 'Food Company Partner', 1, 1, 0, '103.1.100.226', '2025-01-11 12:18:58', '2025-07-25 09:42:30'),
(5, '965e577b-8af7-4638-934f-0cc35d36ee30', 1, 'Discover Your Signature Scent – Irresistible Deals on Premium PerfumesElevate your everyday style with our exclusive perfume deals. Whether you prefer floral, woody, or citrusy fragrances, our curated selection offers something for everyone. Perfect as a gift or an indulgence for yourself, these perfumes promise to leave a lasting impression.', NULL, NULL, NULL, 37, 33, NULL, NULL, NULL, NULL, 'luxury-fragrance-deals', 'Luxury Fragrance Deals', NULL, 59, '<ul><li>Authentic, long-lasting fragrances.</li><li>Luxurious packaging, perfect for gifting.</li><li>Free shipping on orders above ₹999.</li></ul>', 'ahemdabadperfume.com', 'Perfum Shop', 1, 1, 0, '103.1.100.226', '2025-01-11 12:24:04', '2025-07-25 09:42:42'),
(6, '46b7dfba-26f1-4770-b6a3-0453fa0720ba', 1, 'Unbeatable Deals on the Latest Smartphones – Upgrade Your Mobile Today!Looking for the best smartphone at the best price? Our Mega Smartphone Fest offers exclusive discounts on top brands and the latest models. Whether you need a feature-packed flagship or a budget-friendly device, we’ve got you covered.', NULL, NULL, NULL, 37, 33, NULL, NULL, NULL, NULL, 'mega-smartphone-fest', 'Mega Smartphone Fest', NULL, 57, '<h3><br></h3><ul><li>100% Genuine Products</li><li>Manufacturer’s Warranty Included</li><li>Free Shipping on Orders Above ₹10,000</li></ul>', 'flipkart.com', 'Mobile Shop', 1, 1, 0, '103.1.100.226', '2025-01-11 12:39:26', '2025-07-25 09:33:41'),
(7, '80251042-c52a-49ce-ab1e-62be87fb90e4', 1, 'Portable Power Banks at Incredible PricesNever run out of battery with our Power Boost Deals! Choose from our range of high-capacity, fast-charging power banks to keep your devices powered up on the go. Lightweight, durable, and packed with the latest technology, these power banks are perfect for travelers, professionals, and everyday use.', NULL, NULL, NULL, 34, 48, NULL, NULL, NULL, NULL, 'power-boost-deals-–-stay-charged,-anywhere!', 'Power Boost Deals – Stay Charged, Anywhere!', NULL, 57, '<ul><li>Latest fast-charging technology.</li><li>Lightweight, durable, and portable designs.</li><li>Free shipping on orders above ₹1,000.</li><li>1-year manufacturer’s warranty included.</li></ul>', 'Ptronpowerbank.com', 'Power Bank Company', 1, 1, 0, '103.1.100.226', '2025-01-11 12:44:16', '2025-07-25 09:33:59'),
(8, '950d4aab-0dd2-48ee-b19a-abf697e031c3', 1, 'Premium Beauty Products at Unbeatable PricesUnleash your inner beauty with our handpicked range of cosmetics. From long-lasting lipsticks to radiant foundations, our products are designed to make you look and feel your best. Perfect for every skin type and occasion, these deals are too good to miss!', NULL, NULL, NULL, 33, 37, NULL, NULL, NULL, NULL, 'glow-up-with-our-exclusive-cosmetic-deals', 'Glow Up With Our Exclusive Cosmetic Deals', NULL, 60, '<ul><li>High-quality, skin-friendly products.</li><li>Cruelty-free and dermatologically tested.</li><li>Free shipping on orders above ₹1,000.</li></ul>', 'sugercosmetic.com', 'Cosmetic', 1, 1, 0, '103.1.100.226', '2025-01-11 13:04:58', '2025-07-25 09:47:51'),
(9, '2ad10a60-bab2-42cc-915e-47707d990346', 1, 'Promotional value expires 120 days after purchase. Amount paid never expires. Not valid for clients active within the past 12 month(s). 24-hour cancellation notice required. Appointment required. Must sign waiver. Consultation required before service. If you are ineligible, a refund will be provided. Appointment subject to availability. The appointment can be rescheduled once within the cancellation period. The dental cleaning session is limited to 40-minutes only. The in-office whitening session is limited to a one-time 15-minute session only. $20 materials fee must be paid at time at time of appointment, cash only. Complete cleaning not applicable for client/individual who requires more than 40 minutes of scaling due to specific oral health condition. For teeth whitening: Not all clients are suitable for procedure and results may vary.&nbsp;For Restrictions Apply options: Limit 1 per person, may buy 1 additional as gift(s).&nbsp;Merchant is solely responsible to purchasers for the care and quality of the advertised goods and services. Learn about&nbsp;Strike-Through Pricing and Savings', NULL, NULL, NULL, 35, 52, NULL, NULL, NULL, NULL, 'teeth-cleaning-and-whitening-package-at-woodbine-dental-hygiene-clinic-(c$370-value)', 'Teeth Cleaning And Whitening Package At Woodbine Dental Hygiene Clinic (C$370 Value)', NULL, 60, '<h4>The Deal</h4><p>C$139 for a complete teeth cleaning and whitening package (C$370 value)</p><ul><li>Exam (a C$90 value)</li><li>Polishing (a C$30 value)</li><li>Cleaning (a C$150 value)</li><li>Wicked white whitening treatment (a C$100 value)</li></ul>', 'vrajdentalcare.com', 'Dental Cleaning', 1, 1, 0, '103.1.100.226', '2025-01-11 13:39:11', '2025-07-25 09:48:04'),
(10, '31d16fbb-2d87-4b9a-925f-3bf448cda371', 1, 'Promotional value expires 180 days after purchase. Amount paid never expires. Appointment required, contact by phone at +1 905 604 7873. May be repurchased every 30 days. Limit 3 per person. Merchant is solely responsible to purchasers for the care and quality of the advertised goods and services. Learn about&nbsp;Strike-Through Pricing and Savings', NULL, 5, 41, 33, 32, NULL, NULL, '2025-01-01', '2025-01-10', 'up-to-49%-off-on-salon---women\'s-haircut-at-pure-self-salon-n-spa', 'Up To 49% Off On Salon - Women\'s Haircut At Pure Self Salon N Spa', NULL, 60, '<p>Choice of Haircut or Haircut with Deep Conditioning, Blowout &amp; Style</p><p>Please see the below image for estimated lengths of short, medium, and long hair.</p>', 'Hairsaloon.com', 'Hair Saloon', 1, 1, 0, '103.1.100.226', '2025-01-11 13:42:41', '2025-07-25 09:03:15'),
(11, 'ceeffff2-bc68-4ec9-9b97-6a3032794845', 1, '{ !! $Deals->deal_description !! }', NULL, NULL, NULL, 35, 52, NULL, NULL, NULL, NULL, 'test', 'Test', NULL, 61, NULL, NULL, NULL, 0, 1, 0, '103.1.100.226', '2025-01-13 07:08:00', '2025-07-25 09:03:47'),
(12, 'b553ede6-6f9a-4af4-8a3b-5a4237ce35a5', 1, 'test', NULL, NULL, NULL, 35, 52, NULL, NULL, NULL, NULL, 'test', 'Test', NULL, 61, NULL, NULL, NULL, 0, 1, 0, '103.1.100.226', '2025-01-13 07:08:17', '2025-07-25 09:03:53'),
(26, '8bae55f0-1fa6-4d59-9e91-9844e824cd47', 1, '50% off winter clothes', NULL, NULL, NULL, 37, 33, NULL, NULL, NULL, NULL, '50%-off-winter-clothes', '50% Off Winter Clothes', NULL, 62, NULL, NULL, NULL, 0, 1, 0, '103.1.100.226', '2025-01-17 08:53:00', '2025-07-25 09:04:16'),
(32, 'ddb17246-4a96-481b-b8fd-21416644248a', 1, 'Welcome to Grand Oasis HotelEscape to the tranquil comfort of the Grand Oasis Hotel, where luxury meets convenience in the heart of the city. Our state-of-the-art amenities and unparalleled service ensure a stay like no other. Whether you\'re here for business, leisure, or a romantic getaway, the Grand Oasis offers a wide range of services tailored to meet all your needs.Room Features:Deluxe King Suite: Spacious, elegantly furnished, with a stunning city view. Enjoy a king-size bed, smart TV, and a marble ensuite bathroom.Standard Double Room: A perfect option for both business travelers and tourists. Includes free high-speed Wi-Fi, a work desk, and plush bedding for a restful night.Executive Penthouse: Indulge in the ultimate luxury with panoramic views, a private terrace, and exclusive access to our executive lounge.Hotel Amenities:24/7 Concierge Service: Need recommendations or assistance? Our concierge is available round-the-clock to cater to your needs.Spa &amp; Wellness Center: Relax and rejuvenate with a variety of spa treatments, including massages, facials, and wellness therapies.On-site Restaurant: Savor international cuisine at our restaurant, where gourmet dishes are prepared using the freshest local ingredients.Infinity Pool: Take a dip in our outdoor pool with stunning views of the city skyline.Location: Located just 5 minutes from the central business district and 15 minutes from the nearest airport, the Grand Oasis is ideally positioned for both work and leisure. Enjoy easy access to shopping malls, historic landmarks, and vibrant nightlife.Special Offers:Book 3 nights and get the 4th night free.Early bird special: 10% off on bookings made 30 days in advance.Experience the best in hospitality at the Grand Oasis Hotel—where your comfort is our priority.', NULL, NULL, NULL, 38, 50, '2025-01-21', '2025-02-28', '2025-02-01', '2025-02-28', 'flat-100rs-off-next-hotel-booking', 'Flat 100Rs Off Next Hotel Booking', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3672.761482746921!2d72.59354567456437!3d22.995796779192514!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x395e8f5855555537%3A0xa2b102d6c37aeeb6!2sApollo%20Infotech%20-%20Best%20Website%20Development%20Ahmedabad%20%7C%20Website%20Design%20Ahmedabad%20%7C%20SEO%20Company%20Ahmedabad!5e0!3m2!1sen!2sin!4v1737794741953!5m2!1sen!2sin\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>', 57, '<p><strong>Welcome to the Luxuria Grand Hotel</strong></p><p>Nestled in the heart of the city’s vibrant downtown district, the <strong>Luxuria Grand Hotel</strong> offers an exquisite blend of luxury, comfort, and sophistication. Whether you\'re traveling for business or pleasure, our hotel provides an exceptional experience with its world-class amenities and unmatched service.</p>', 'Swiggy.com', 'Hotel Booking', 1, 1, 0, '103.1.100.226', '2025-01-21 09:01:37', '2025-07-25 09:00:19'),
(33, 'ce5c0e3c-dadc-481c-8466-66b47d2c8626', 1, 'DADADAd', NULL, NULL, NULL, 33, 32, '2025-01-22', '2025-01-25', '2025-01-23', '2025-01-24', 'okldkiadi', 'Okldkiadi', 'fHNASFKKAISI', 57, NULL, NULL, NULL, 0, 1, 0, '103.1.100.226', '2025-01-22 10:01:03', '2025-07-25 09:00:28'),
(39, 'd1606c64-f559-4f9c-884e-b5d04a1d6c53', 1, '\"Winter Wonders Await! ❄️ Shop the Zudio Winter Sale and enjoy stylish warmth at unbeatable prices. Jackets, sweaters, and more starting at just ₹499! Hurry, offers valid till stocks last!\"', NULL, NULL, NULL, 37, 33, '2025-01-23', '2025-01-31', '2025-02-01', '2025-02-28', 'zudio-sale-50%-off-on-winter-wear', 'Zudio Sale 50% Off On Winter Wear', 'https://maps.app.goo.gl/Adp8ECduNYDqhuvz5', 57, '<p>daada</p>', 'seoindia.com', 'Web Designer', 1, 1, 0, '103.1.100.226', '2025-01-23 06:21:14', '2025-07-25 09:35:44'),
(44, 'bddd1bae-b40a-4435-a057-413e7fbfb5fd', NULL, '<p>test</p>', NULL, NULL, NULL, NULL, NULL, '2025-01-25', '2025-01-31', '2025-01-25', '2025-01-31', 'test', 'test', 'google.maps', 75, '<p>test test</p>', 'https://apolloinfotech.in/', 'Retailer', 1, 1, 0, NULL, '2025-01-30 05:01:59', '2025-02-03 11:27:11'),
(46, '3a4a325b-3399-428d-b392-ed082d8c7762', NULL, '<p><strong style=\"color: rgb(0, 0, 0);\">Lorem Ipsum</strong><span style=\"color: rgb(0, 0, 0);\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span></p>', NULL, NULL, NULL, NULL, NULL, '2025-02-01', '2025-02-14', '2025-02-01', '2025-02-14', 'test', 'test', 'test', 75, '<p><strong style=\"color: rgb(0, 0, 0);\">Lorem Ipsum</strong><span style=\"color: rgb(0, 0, 0);\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span></p>', 'https://apolloinfotech.in/', 'Retailer', 1, 1, 0, NULL, '2025-02-03 11:25:24', '2025-02-03 11:26:47'),
(47, '50e474c5-4776-433d-b9ed-bc6ceec2a79f', 1, 'test test', NULL, 5, 41, 33, 37, '2025-02-15', '2025-02-28', '2025-02-15', '2025-02-28', 'test', 'Test', 'https://maps.google.com/', 77, NULL, NULL, NULL, 1, 1, 0, '103.1.100.226', '2025-02-04 08:39:02', '2025-07-25 09:05:28'),
(49, '8c04d8da-bf29-4fa0-94e6-b9d4319135ac', 1, 'test', NULL, NULL, NULL, 37, 33, '2025-03-21', '2025-03-31', '2025-03-22', '2025-03-31', 'test', 'Test', 'https://maps.app.goo.gl/ZCVQe4qxS1whbvJN8', 57, '<p>WEB DESIGNER</p>', 'apolloinfotech.com', 'Web Designer', 0, 1, 0, '103.1.100.226', '2025-03-20 05:12:53', '2025-07-25 09:36:16'),
(50, 'c7ac86d1-9093-46bd-8bb9-0bd2554fa490', 1, 'ASASGGDGDGasgasggdZDGDgdgd', NULL, NULL, NULL, 37, 33, '2025-04-04', '2025-04-30', '2025-04-07', '2025-04-12', 'sfsf', 'Sfsf', 'ASgfasg', 57, NULL, NULL, NULL, 0, 1, 0, '103.1.100.226', '2025-04-04 05:52:58', '2025-07-25 09:01:05'),
(51, '31077e41-edb8-4c4a-827f-d70064d2ecc2', 1, 'test', NULL, NULL, NULL, 36, 42, '2025-04-04', '2025-04-30', '2025-04-08', '2025-04-29', 'swiggy-offer', 'Swiggy Offer', 'https://maps.app.goo.gl/52rFYkNn6kW2UahNA', 57, '<p>test</p>', 'apolloinfotech.com', 'Web Designer', 1, 1, 0, '103.1.100.226', '2025-04-04 06:17:31', '2025-07-25 09:36:48'),
(55, '7cb3e4b3-38e3-470e-aec1-56cdaba2aca2', 1, '<p>demotesting</p>', 'Maninagar Ahmedabad', NULL, NULL, 33, 32, '2025-05-07', '2025-05-08', '2025-05-07', '2025-05-08', 'demotesting', 'Demotesting', 'https://www.mappls.com/direction-from--to-vikas+prathmik+shakha,+hirawadi,+bapunagar,+ahmedabad,+gujarat,+382345?@zdata=ZnJvbSsrdG8rNzIuNjQwOTA0LDIzLjA0NjgxNyw3NUc0VDgrdmlh', 78, '<p>hello i\'m testing</p>', 'HELLO.COMfbgb', 'Dental Cleaningzxczf', 1, 1, 0, '103.1.100.226', '2025-05-06 09:10:20', '2025-07-25 09:22:12'),
(60, '70832097-fb4d-4b88-9124-31415e5ab125', 1, 'hello testing 123', NULL, 5, 41, 33, 38, '2025-06-22', '2025-06-25', '2025-06-15', '2025-06-25', 'demo', 'Demo', 'https://www.google.com/imgres?imgurl=https%3A%2F%2Fimages01.nicepagecdn.com%2Fpage%2F11%2F73%2Fhtml-template-117349.jpg%3Fversion%3Dd6c41a51-779b-478b-bf7d-c267565987a1&tbnid=Cqg7trshUr_ZgM&vet=12ahUKEwjwmqnUlKCCAxUWT2wGHayXAoQQxiAoCXoECAAQGA..i&imgrefurl=https%3A%2F%2Fnicepage.com%2Fht%2F117349%2Ffull-service-design-studio-html-template&docid=gf2LRL71yWF8LM&w=260&h=722&itg=1&q=my%20account%20page%20design%20html&hl=en&ved=2ahUKEwjwmqnUlKCCAxUWT2wGHayXAoQQxiAoCXoECAAQGA', 78, NULL, NULL, NULL, 0, 1, 0, '103.1.100.226', '2025-06-24 06:08:19', '2025-07-25 09:06:41'),
(61, '39aedaaf-8191-4e9c-a20a-c9eba5382c14', 1, 'testing', NULL, NULL, NULL, 36, 29, '2025-07-02', '2025-07-08', '2025-07-03', '2025-07-16', 'pizza', 'Pizza', 'https://www.google.com/search?q=ahmedabad+map&sca_esv=d04797fb9f77f3ab&sxsrf=AE3TifNUG3wrwqtKfiyJmzven96E073bHQ%3A1751359577820&ei=WaBjaOXqMavhseMPgJTJmQQ&oq=ahemda&gs_lp=Egxnd3Mtd2l6LXNlcnAiBmFoZW1kYSoCCAAyBxAjGLECGCcyDhAAGIAEGJECGLEDGIoFMgUQABiABDILEAAYgAQYkQIYigUyChAAGIAEGAIYywEyExAuGIAEGAIYxwEYywEYjgUYrwEyBRAAGIAEMgoQLhiABBixAxgKMhMQLhiABBgCGMcBGMsBGI4FGK8BMgUQABiABEiOK1DnB1jFHXADeACQAQSYAbEBoAG8DqoBBDAuMTK4AQPIAQD4AQGYAgqgAvUJqAIUwgIKEAAYsAMY1gQYR8ICDRAAGIAEGLADGEMYigXCAgoQIxiABBgnGIoFwgILEAAYgAQYsQMYyQPCAggQABiABBixA8ICDRAAGIAEGLEDGEMYigXCAgsQABiABBiSAxiKBcICChAAGIAEGEMYigXCAgcQIxgnGOoCwgINECMY8AUYJxjJAhjqAsICExAAGIAEGEMYtAIYigUY6gLYAQHCAhQQABiABBjjBBi0AhjpBBjqAtgBAcICEBAjGPAFGIAEGCcYyQIYigXCAhYQLhiABBixAxjRAxhDGIMBGMcBGIoFwgILEAAYgAQYsQMYgwHCAgsQLhiABBjRAxjHAcICDRAuGIAEGLEDGEMYigXCAhAQLhiABBjRAxhDGMcBGIoFwgIOEC4YgAQYxwEYjgUYrwHCAgcQLhiABBgKwgIQEC4YgAQYxwEYChiOBRivAcICBxAAGIAEGArCAhMQLhiABBixAxjHARgKGI4FGK8BmAMR8QW7tiNdRksKC4gGAZAGCroGBggBEAEYAZIHAzMuN6AH_YsBsgcDMC43uAfNCcIHBTItNC42yAdl&sclient=gws-wiz-serp', 78, NULL, NULL, NULL, 1, 1, 0, '103.1.100.226', '2025-07-01 09:23:50', '2025-07-25 09:06:53'),
(62, 'acd33cf8-5c09-41c7-bd96-dbee4ed9e3e4', 1, 'demo testing', NULL, NULL, NULL, 36, 43, '2025-07-23', '2025-07-08', '2025-07-07', '2025-07-09', 'groceries-&-markets', 'Groceries & Markets', 'https://www.google.com/search?q=ahmedabad+map&oq=&gs_lcrp=EgZjaHJvbWUqCQgCECMYJxjqAjIJCAAQIxgnGOoCMgkIARAjGCcY6gIyCQgCECMYJxjqAjIJCAMQIxgnGOoCMgkIBBAjGCcY6gIyCQgFECMYJxjqAjIJCAYQIxgnGOoCMgkIBxAjGCcY6gLSAQszMzIwMDg0ajBqN6gCCLACAfEFpa4TG7VaR5DxBaWuExu1WkeQ&sourceid=chrome&ie=UTF-8', 78, NULL, NULL, NULL, 1, 1, 0, '103.1.100.226', '2025-07-01 09:41:38', '2025-07-25 09:06:59'),
(63, 'a8d2f77a-3729-483b-bbc4-5a1ed48d1f7c', 1, 'demotesting', NULL, NULL, NULL, 36, 44, '2025-07-08', '2025-07-09', '2025-07-15', '2025-07-16', 'alcohol-tasting', 'Alcohol Tasting', 'https://www.google.com/search?q=ahmedabad+map&oq=&gs_lcrp=EgZjaHJvbWUqCQgCECMYJxjqAjIJCAAQIxgnGOoCMgkIARAjGCcY6gIyCQgCECMYJxjqAjIJCAMQIxgnGOoCMgkIBBAjGCcY6gIyCQgFECMYJxjqAjIJCAYQIxgnGOoCMgkIBxAjGCcY6gLSAQszMzIwMDg0ajBqN6gCCLACAfEFpa4TG7VaR5DxBaWuExu1WkeQ&sourceid=chrome&ie=UTF-8', 78, '<p>this is add for testing</p>', 'www.com', 'Alohal', 1, 1, 0, '103.1.100.226', '2025-07-01 09:44:02', '2025-07-25 11:42:04'),
(64, '913aeca1-1ca4-48f4-bf9c-b931895a3b7a', 1, 'test', NULL, NULL, NULL, 36, 45, '2025-07-10', '2025-07-17', '2025-07-14', '2025-07-15', 'bar', 'Bar', 'https://www.google.com/search?q=ahmedabad+map&oq=&gs_lcrp=EgZjaHJvbWUqCQgCECMYJxjqAjIJCAAQIxgnGOoCMgkIARAjGCcY6gIyCQgCECMYJxjqAjIJCAMQIxgnGOoCMgkIBBAjGCcY6gIyCQgFECMYJxjqAjIJCAYQIxgnGOoCMgkIBxAjGCcY6gLSAQszMzIwMDg0ajBqN6gCCLACAfEFpa4TG7VaR5DxBaWuExu1WkeQ&sourceid=chrome&ie=UTF-8', 78, NULL, NULL, NULL, 1, 1, 0, '103.1.100.226', '2025-07-01 09:47:18', '2025-07-25 09:07:20'),
(65, '7e05818d-8cf4-43a6-80eb-a362e1e511b7', 1, 'surat', NULL, NULL, NULL, 36, 46, '2025-07-08', '2025-07-22', '2025-07-07', '2025-07-29', 'cafe', 'Cafe', 'https://www.google.com/search?q=ahmedabad+map&oq=&gs_lcrp=EgZjaHJvbWUqCQgCECMYJxjqAjIJCAAQIxgnGOoCMgkIARAjGCcY6gIyCQgCECMYJxjqAjIJCAMQIxgnGOoCMgkIBBAjGCcY6gIyCQgFECMYJxjqAjIJCAYQIxgnGOoCMgkIBxAjGCcY6gLSAQszMzIwMDg0ajBqN6gCCLACAfEFpa4TG7VaR5DxBaWuExu1WkeQ&sourceid=chrome&ie=UTF-8', 78, NULL, NULL, NULL, 1, 1, 0, '103.1.100.226', '2025-07-01 10:12:43', '2025-07-25 09:07:28'),
(66, '536b0ce4-779a-4c60-a344-be9e32376d23', 1, 'skin', NULL, NULL, NULL, 33, 37, '2025-07-17', '2025-07-14', '2025-07-13', '2025-07-03', 'skin-&-care', 'Skin & Care', 'https://www.google.com/search?q=ahmedabad+map&oq=&gs_lcrp=EgZjaHJvbWUqCQgCECMYJxjqAjIJCAAQIxgnGOoCMgkIARAjGCcY6gIyCQgCECMYJxjqAjIJCAMQIxgnGOoCMgkIBBAjGCcY6gIyCQgFECMYJxjqAjIJCAYQIxgnGOoCMgkIBxAjGCcY6gLSAQszMzIwMDg0ajBqN6gCCLACAfEFpa4TG7VaR5DxBaWuExu1WkeQ&sourceid=chrome&ie=UTF-8', 78, NULL, NULL, NULL, 1, 1, 0, '103.1.100.226', '2025-07-01 10:20:24', '2025-07-25 09:07:35'),
(67, 'f995f743-62ac-42b0-bbfc-a2a986a11c5c', 1, 'demo0', NULL, NULL, NULL, 33, 38, '2025-07-09', '2025-07-10', '2025-07-13', '2025-07-15', 'hair-remove', 'Hair Remove', 'https://www.google.com/search?q=ahmedabad+map&oq=&gs_lcrp=EgZjaHJvbWUqCQgCECMYJxjqAjIJCAAQIxgnGOoCMgkIARAjGCcY6gIyCQgCECMYJxjqAjIJCAMQIxgnGOoCMgkIBBAjGCcY6gIyCQgFECMYJxjqAjIJCAYQIxgnGOoCMgkIBxAjGCcY6gLSAQszMzIwMDg0ajBqN6gCCLACAfEFpa4TG7VaR5DxBaWuExu1WkeQ&sourceid=chrome&ie=UTF-8', 78, NULL, NULL, NULL, 1, 1, 0, '103.1.100.226', '2025-07-01 10:22:40', '2025-07-25 09:07:42'),
(68, 'dfab8d17-d2bf-41f1-acf2-accede4812cd', 1, 'test', NULL, NULL, NULL, 33, 39, '2025-07-09', '2025-07-07', '2025-07-03', '2025-07-15', 'salon', 'Salon', 'https://www.google.com/search?q=ahmedabad+map&oq=&gs_lcrp=EgZjaHJvbWUqCQgCECMYJxjqAjIJCAAQIxgnGOoCMgkIARAjGCcY6gIyCQgCECMYJxjqAjIJCAMQIxgnGOoCMgkIBBAjGCcY6gIyCQgFECMYJxjqAjIJCAYQIxgnGOoCMgkIBxAjGCcY6gLSAQszMzIwMDg0ajBqN6gCCLACAfEFpa4TG7VaR5DxBaWuExu1WkeQ&sourceid=chrome&ie=UTF-8', 78, NULL, NULL, NULL, 1, 1, 0, '103.1.100.226', '2025-07-01 10:27:09', '2025-07-25 09:07:49'),
(69, '4096f0c7-39b9-4092-a062-7e612bb751f9', 1, 'demo', NULL, NULL, NULL, 33, 40, '2025-07-21', '2025-07-23', '2025-07-06', '2025-07-13', 'hair-spa', 'Hair Spa', 'https://www.google.com/search?q=ahmedabad+map&oq=&gs_lcrp=EgZjaHJvbWUqCQgCECMYJxjqAjIJCAAQIxgnGOoCMgkIARAjGCcY6gIyCQgCECMYJxjqAjIJCAMQIxgnGOoCMgkIBBAjGCcY6gIyCQgFECMYJxjqAjIJCAYQIxgnGOoCMgkIBxAjGCcY6gLSAQszMzIwMDg0ajBqN6gCCLACAfEFpa4TG7VaR5DxBaWuExu1WkeQ&sourceid=chrome&ie=UTF-8', 78, NULL, NULL, NULL, 1, 1, 0, '103.1.100.226', '2025-07-01 10:29:15', '2025-07-25 09:08:03'),
(70, '9b38c307-898d-4884-9816-29c324540fa2', 1, 'demotest', NULL, NULL, NULL, 33, 41, '2025-07-03', '2025-07-15', '2025-07-13', '2025-07-21', 'nails', 'Nails', 'https://www.google.com/search?q=ahmedabad+map&oq=&gs_lcrp=EgZjaHJvbWUqCQgCECMYJxjqAjIJCAAQIxgnGOoCMgkIARAjGCcY6gIyCQgCECMYJxjqAjIJCAMQIxgnGOoCMgkIBBAjGCcY6gIyCQgFECMYJxjqAjIJCAYQIxgnGOoCMgkIBxAjGCcY6gLSAQszMzIwMDg0ajBqN6gCCLACAfEFpa4TG7VaR5DxBaWuExu1WkeQ&sourceid=chrome&ie=UTF-8', 78, NULL, NULL, NULL, 1, 1, 0, '103.1.100.226', '2025-07-01 10:33:30', '2025-07-25 09:08:20'),
(71, '839d546c-ac43-4d15-bc66-c76d14417e9e', 1, 'demo', NULL, NULL, NULL, 34, 47, '2025-07-06', '2025-07-21', '2025-07-22', '2025-07-18', 'kids', 'Kids', 'https://www.google.com/search?q=ahmedabad+map&oq=&gs_lcrp=EgZjaHJvbWUqCQgCECMYJxjqAjIJCAAQIxgnGOoCMgkIARAjGCcY6gIyCQgCECMYJxjqAjIJCAMQIxgnGOoCMgkIBBAjGCcY6gIyCQgFECMYJxjqAjIJCAYQIxgnGOoCMgkIBxAjGCcY6gLSAQszMzIwMDg0ajBqN6gCCLACAfEFpa4TG7VaR5DxBaWuExu1WkeQ&sourceid=chrome&ie=UTF-8', 78, NULL, NULL, NULL, 1, 1, 0, '103.1.100.226', '2025-07-01 10:36:28', '2025-07-25 09:08:33'),
(72, '66b6d372-b3fa-4488-803d-528de2184b2e', 1, 'demo', NULL, NULL, NULL, 34, 48, '2025-07-07', '2025-07-15', '2025-07-13', '2025-07-16', 'fun', 'Fun', 'https://www.google.com/search?q=ahmedabad+map&oq=&gs_lcrp=EgZjaHJvbWUqCQgCECMYJxjqAjIJCAAQIxgnGOoCMgkIARAjGCcY6gIyCQgCECMYJxjqAjIJCAMQIxgnGOoCMgkIBBAjGCcY6gIyCQgFECMYJxjqAjIJCAYQIxgnGOoCMgkIBxAjGCcY6gLSAQszMzIwMDg0ajBqN6gCCLACAfEFpa4TG7VaR5DxBaWuExu1WkeQ&sourceid=chrome&ie=UTF-8', 78, NULL, NULL, NULL, 1, 1, 0, '103.1.100.226', '2025-07-01 10:42:54', '2025-07-25 09:08:46'),
(73, '0f13d711-8e21-4ce3-b49e-c99c6f6f1ae3', 1, 'demo', NULL, NULL, NULL, 34, 49, '2025-07-02', '2025-07-05', '2025-07-08', '2025-07-10', 'sightseeing-&-tours', 'Sightseeing & Tours', 'https://www.google.com/search?q=ahmedabad+map&oq=&gs_lcrp=EgZjaHJvbWUqCQgCECMYJxjqAjIJCAAQIxgnGOoCMgkIARAjGCcY6gIyCQgCECMYJxjqAjIJCAMQIxgnGOoCMgkIBBAjGCcY6gIyCQgFECMYJxjqAjIJCAYQIxgnGOoCMgkIBxAjGCcY6gLSAQszMzIwMDg0ajBqN6gCCLACAfEFpa4TG7VaR5DxBaWuExu1WkeQ&sourceid=chrome&ie=UTF-8', 78, NULL, NULL, NULL, 1, 1, 0, '103.1.100.226', '2025-07-01 10:46:03', '2025-07-25 09:08:58'),
(74, 'dabf638a-c2da-474f-a760-e84210fc7d80', NULL, '<p>testing</p>', 'Ahemdabad', NULL, NULL, 34, 50, '2025-07-02', '2025-07-10', '2025-07-04', '2025-07-09', 'night-event', 'Night Event', 'https://www.google.com/search?q=ahmedabad+map&oq=&gs_lcrp=EgZjaHJvbWUqCQgCECMYJxjqAjIJCAAQIxgnGOoCMgkIARAjGCcY6gIyCQgCECMYJxjqAjIJCAMQIxgnGOoCMgkIBBAjGCcY6gIyCQgFECMYJxjqAjIJCAYQIxgnGOoCMgkIBxAjGCcY6gLSAQszMzIwMDg0ajBqN6gCCLACAfEFpa4TG7VaR5DxBaWuExu1WkeQ&sourceid=chrome&ie=UTF-8', 78, NULL, NULL, NULL, 1, 1, 0, NULL, '2025-07-01 10:49:55', '2025-07-01 10:50:42'),
(75, 'c3ceed98-4cb8-433d-8723-bceee6773551', 1, 'demo test', NULL, NULL, NULL, 34, 51, '2025-07-02', '2025-07-10', '2025-07-09', '2025-07-15', 'suports', 'Suports', 'https://www.google.com/search?q=ahmedabad+map&oq=&gs_lcrp=EgZjaHJvbWUqCQgCECMYJxjqAjIJCAAQIxgnGOoCMgkIARAjGCcY6gIyCQgCECMYJxjqAjIJCAMQIxgnGOoCMgkIBBAjGCcY6gIyCQgFECMYJxjqAjIJCAYQIxgnGOoCMgkIBxAjGCcY6gLSAQszMzIwMDg0ajBqN6gCCLACAfEFpa4TG7VaR5DxBaWuExu1WkeQ&sourceid=chrome&ie=UTF-8', 78, NULL, NULL, NULL, 1, 1, 0, '103.1.100.226', '2025-07-01 10:53:28', '2025-07-25 09:09:16'),
(76, '544d3fcf-0e31-45be-999b-237433466d0e', 1, 'testing', NULL, NULL, NULL, 35, 52, '2025-07-02', '2025-07-10', '2025-07-04', '2025-07-09', 'oil-change', 'Oil Change', 'https://www.google.com/search?q=ahmedabad+map&oq=&gs_lcrp=EgZjaHJvbWUqCQgCECMYJxjqAjIJCAAQIxgnGOoCMgkIARAjGCcY6gIyCQgCECMYJxjqAjIJCAMQIxgnGOoCMgkIBBAjGCcY6gIyCQgFECMYJxjqAjIJCAYQIxgnGOoCMgkIBxAjGCcY6gLSAQszMzIwMDg0ajBqN6gCCLACAfEFpa4TG7VaR5DxBaWuExu1WkeQ&sourceid=chrome&ie=UTF-8', 78, NULL, NULL, NULL, 1, 1, 0, '103.1.100.226', '2025-07-01 11:14:33', '2025-07-25 09:09:28'),
(77, '9585fecc-eab9-4c1d-bbc4-4d1bf6de3c1a', 1, 'demotest', NULL, NULL, NULL, 37, 33, '2025-07-08', '2025-07-16', '2025-07-09', '2025-07-15', 'clothes', 'Clothes', 'https://www.google.com/search?q=ahmedabad+map&oq=&gs_lcrp=EgZjaHJvbWUqCQgCECMYJxjqAjIJCAAQIxgnGOoCMgkIARAjGCcY6gIyCQgCECMYJxjqAjIJCAMQIxgnGOoCMgkIBBAjGCcY6gIyCQgFECMYJxjqAjIJCAYQIxgnGOoCMgkIBxAjGCcY6gLSAQszMzIwMDg0ajBqN6gCCLACAfEFpa4TG7VaR5DxBaWuExu1WkeQ&sourceid=chrome&ie=UTF-8', 78, NULL, NULL, NULL, 1, 1, 0, '103.1.100.226', '2025-07-01 11:17:44', '2025-07-25 09:09:41'),
(78, '9c2aa7d7-1c32-44d2-b0ce-f66449d07665', 1, 'demo testing', NULL, NULL, NULL, 37, NULL, '2025-07-02', '2025-07-22', '2025-07-07', '2025-07-21', 'phone', 'Phone', 'https://www.google.com/search?q=ahmedabad+map&oq=&gs_lcrp=EgZjaHJvbWUqCQgCECMYJxjqAjIJCAAQIxgnGOoCMgkIARAjGCcY6gIyCQgCECMYJxjqAjIJCAMQIxgnGOoCMgkIBBAjGCcY6gIyCQgFECMYJxjqAjIJCAYQIxgnGOoCMgkIBxAjGCcY6gLSAQszMzIwMDg0ajBqN6gCCLACAfEFpa4TG7VaR5DxBaWuExu1WkeQ&sourceid=chrome&ie=UTF-8', 78, NULL, NULL, NULL, 1, 1, 0, '103.1.100.226', '2025-07-01 11:21:55', '2025-07-25 09:09:52'),
(79, '011e0e60-3a7e-4efb-bec6-57a01ebfe6c9', 1, 'demo test', NULL, NULL, NULL, 38, 35, '2025-07-02', '2025-07-17', '2025-07-02', '2025-07-14', 'travel', 'Travel', 'https://www.google.com/search?q=ahmedabad+map&oq=&gs_lcrp=EgZjaHJvbWUqCQgCECMYJxjqAjIJCAAQIxgnGOoCMgkIARAjGCcY6gIyCQgCECMYJxjqAjIJCAMQIxgnGOoCMgkIBBAjGCcY6gIyCQgFECMYJxjqAjIJCAYQIxgnGOoCMgkIBxAjGCcY6gLSAQszMzIwMDg0ajBqN6gCCLACAfEFpa4TG7VaR5DxBaWuExu1WkeQ&sourceid=chrome&ie=UTF-8', 78, NULL, NULL, NULL, 1, 1, 0, '103.1.100.226', '2025-07-01 11:25:48', '2025-07-25 09:10:15'),
(80, 'd8e3e15f-4184-4e13-af0d-ff471fa53ae9', 1, 'demo test', NULL, NULL, NULL, NULL, NULL, '2025-07-03', '2025-07-17', '2025-07-08', '2025-07-15', 'friendship', 'Friendship', 'EgZjaHJvbWUqCQgCECMYJxjqAjIJCAAQIxgnGOoCMgkIARAjGCcY6gIyCQgCECMYJxjqAjIJCAMQIxgnGOoCMgkIBBAjGCcY6gIyCQgFECMYJxjqAjIJCAYQIxgnGOoCMgkIBxAjGCcY6gLSAQszMzIwMDg0ajBqN6gCCLACAfEFpa4TG7VaR5DxBaWuExu1WkeQ', 78, NULL, NULL, NULL, 1, 1, 0, '103.1.100.226', '2025-07-01 11:36:43', '2025-07-25 09:10:27'),
(81, 'ee1a3ffb-9f53-42d6-8897-7b58f4fc7cfa', 1, 'demo', NULL, NULL, NULL, NULL, NULL, '2025-07-23', '2025-07-28', '2025-07-14', '2025-07-28', 'demo', 'Demo', 'EgZjaHJvbWUqCQgCECMYJxjqAjIJCAAQIxgnGOoCMgkIARAjGCcY6gIyCQgCECMYJxjqAjIJCAMQIxgnGOoCMgkIBBAjGCcY6gIyCQgFECMYJxjqAjIJCAYQIxgnGOoCMgkIBxAjGCcY6gLSAQszMzIwMDg0ajBqN6gCCLACAfEFpa4TG7VaR5DxBaWuExu1WkeQ', 78, NULL, NULL, NULL, 1, 1, 0, '103.1.100.226', '2025-07-01 13:16:07', '2025-07-25 09:10:38'),
(82, '79d1d389-0a7e-4c41-a4fa-14ba5723cca6', 1, 'demo', NULL, NULL, NULL, 33, NULL, '2025-07-02', '2025-07-24', '2025-07-09', '2025-07-15', 'spa', 'Spa', 'EgZjaHJvbWUqCQgCECMYJxjqAjIJCAAQIxgnGOoCMgkIARAjGCcY6gIyCQgCECMYJxjqAjIJCAMQIxgnGOoCMgkIBBAjGCcY6gIyCQgFECMYJxjqAjIJCAYQIxgnGOoCMgkIBxAjGCcY6gLSAQszMzIwMDg0ajBqN6gCCLACAfEFpa4TG7VaR5DxBaWuExu1WkeQ', 78, NULL, NULL, NULL, 1, 1, 0, '103.1.100.226', '2025-07-01 13:27:20', '2025-07-25 09:10:51'),
(83, 'd341d51c-604b-4e2c-a0cd-811d90b3ec42', 1, 'hello testing', NULL, NULL, NULL, 33, NULL, '2025-07-02', '2025-07-17', '2025-07-16', '2025-07-23', 'demo', 'Demo', 'https://www.mapsofindia.com/maps/gujarat/surat.htm', 78, NULL, NULL, NULL, 1, 1, 0, '103.1.100.226', '2025-07-09 11:55:46', '2025-07-25 09:11:07'),
(84, 'c55bd7b2-2638-4994-9886-1faba82f67e8', 1, 'hgffghfghffdhd', NULL, NULL, NULL, 34, 47, '2025-07-17', '2025-07-20', '2025-07-15', '2025-07-20', 'testing', 'Testing', 'www.com', 78, '<p>ersfgddsdf</p>', 'www.com', 'test', 0, 1, 0, '103.1.100.226', '2025-07-18 06:47:16', '2025-07-25 09:11:21'),
(85, 'cce45a44-6c7f-4bfb-afb5-0e1da4877092', 1, 'erygsedgdx fhrdjhfdb gtfdju', NULL, NULL, NULL, 36, 29, '2025-07-23', '2025-07-24', '2025-07-25', '2025-07-25', 'wedgwhweh', 'Wedgwhweh', 'www.google.com', 78, NULL, NULL, NULL, 0, 1, 0, '103.1.100.226', '2025-07-23 05:34:13', '2025-07-25 09:11:32'),
(86, '661155e3-e220-426e-a057-5d98ea7ba0bc', 1, 'this is add for testing', NULL, NULL, NULL, 36, 29, '2025-07-23', '2025-07-24', '2025-07-25', '2025-07-28', '50%-off-for-rakshabandhan', '50% Off For Rakshabandhan', 'www.com', 78, NULL, NULL, NULL, 0, 1, 0, '103.1.100.226', '2025-07-23 05:47:46', '2025-07-25 09:11:42');

-- --------------------------------------------------------

--
-- Table structure for table `Deals_old`
--

CREATE TABLE `Deals_old` (
  `Deals_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `deal_brand_name` varchar(255) DEFAULT NULL,
  `deal_title` varchar(255) DEFAULT NULL,
  `deal_description` varchar(255) DEFAULT NULL,
  `regularprice` int(255) NOT NULL DEFAULT '0',
  `pricecut_price` int(255) NOT NULL DEFAULT '0',
  `month_voucher_cap` int(255) NOT NULL DEFAULT '0',
  `deal_state_id` int(11) NOT NULL DEFAULT '0',
  `deal_city_id` int(11) NOT NULL DEFAULT '0',
  `deal_category_id` int(11) NOT NULL DEFAULT '0',
  `deal_sub_category_id` int(11) NOT NULL DEFAULT '0',
  `is_best_deals` varchar(255) DEFAULT NULL,
  `is_popular_gift_set` varchar(255) DEFAULT NULL,
  `wishlist_flag` int(11) NOT NULL DEFAULT '0',
  `display_start_date` date DEFAULT NULL,
  `display_end_date` date DEFAULT NULL,
  `offer_start_date` date DEFAULT NULL,
  `offer_end_date` date DEFAULT NULL,
  `deals_slug` varchar(255) DEFAULT NULL,
  `deals_location` varchar(255) DEFAULT NULL,
  `Map_image_link` varchar(255) DEFAULT NULL,
  `iStatus` int(11) NOT NULL DEFAULT '1',
  `isDelete` int(11) NOT NULL DEFAULT '0',
  `strIP` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deals_longdescription` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Deals_old`
--

INSERT INTO `Deals_old` (`Deals_id`, `user_id`, `deal_brand_name`, `deal_title`, `deal_description`, `regularprice`, `pricecut_price`, `month_voucher_cap`, `deal_state_id`, `deal_city_id`, `deal_category_id`, `deal_sub_category_id`, `is_best_deals`, `is_popular_gift_set`, `wishlist_flag`, `display_start_date`, `display_end_date`, `offer_start_date`, `offer_end_date`, `deals_slug`, `deals_location`, `Map_image_link`, `iStatus`, `isDelete`, `strIP`, `created_at`, `updated_at`, `deals_longdescription`) VALUES
(20, 1, 'demo', 'demo', 'demo', 0, 0, 0, 5, 41, 22, 21, 'test', NULL, 0, '2024-12-13', '2024-12-15', '2024-12-11', '2024-12-15', 'demo', 'test', NULL, 1, 0, '103.1.100.226', '2024-12-13 12:43:24', '2024-12-16 11:43:19', 'demo11'),
(26, 1, 'test', 'test', 'test11', 0, 0, 0, 5, 41, 22, 21, 'test', NULL, 0, '2024-12-15', '2024-12-18', '2024-12-15', '2024-12-20', 'test', 'test', NULL, 1, 0, '103.1.100.226', '2024-12-16 11:32:19', '2024-12-16 11:42:38', 'test'),
(30, 0, NULL, 'food', NULL, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-20 11:21:43', '2024-12-20 11:21:43', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Deal_images`
--

CREATE TABLE `Deal_images` (
  `deal_image_id` int(11) NOT NULL,
  `deals_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `iStatus` int(11) DEFAULT '1',
  `isDelete` int(11) DEFAULT '0',
  `strIP` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_primary` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Deal_images`
--

INSERT INTO `Deal_images` (`deal_image_id`, `deals_id`, `user_id`, `image_url`, `iStatus`, `isDelete`, `strIP`, `created_at`, `updated_at`, `is_primary`) VALUES
(26, NULL, 1, '1734956291_1192.jpeg', 1, 0, '103.1.100.226', '2024-12-23 12:18:11', NULL, 0),
(27, NULL, 1, '1734956291_6457.jpeg', 1, 0, '103.1.100.226', '2024-12-23 12:18:11', NULL, 0),
(28, NULL, 1, '1734956291_5273.jpeg', 1, 0, '103.1.100.226', '2024-12-23 12:18:11', NULL, 0),
(30, 4, 1, '1734957104_3106.jpg', 1, 0, '103.1.100.226', '2024-12-23 12:31:44', NULL, 0),
(31, 4, 1, '1734957104_4430.jpeg', 1, 0, '103.1.100.226', '2024-12-23 12:31:44', NULL, 0),
(33, 44, 1, '1735133504_1690.jpg', 1, 0, '103.1.100.226', '2024-12-25 13:31:44', NULL, 0),
(34, 44, 1, '1735133504_3534.jpeg', 1, 0, '103.1.100.226', '2024-12-25 13:31:44', NULL, 0),
(35, 42, 1, '1735195828_7130.jpg', 1, 0, '103.1.100.226', NULL, '2024-12-26 06:50:28', 0),
(36, 49, 1, '1735204338_4119.jpg', 1, 0, '103.1.100.226', '2024-12-26 09:12:18', NULL, 0),
(37, 49, 1, '1735204338_2237.jpg', 1, 0, '103.1.100.226', '2024-12-26 09:12:18', NULL, 0),
(38, 49, 1, '1735204464_6602.jpg', 1, 0, '103.1.100.226', NULL, '2024-12-26 09:14:24', 0),
(39, 49, 1, '1735204464_2137.jpg', 1, 0, '103.1.100.226', NULL, '2024-12-26 09:14:24', 0),
(40, 3, 1, '1735376651_4125.jpg', 1, 0, '103.1.100.226', '2024-12-28 09:04:11', NULL, 0),
(41, 3, 1, '1735376945_6799.jpeg', 1, 0, '103.1.100.226', NULL, '2024-12-28 09:09:05', 0),
(42, 6, 1, '1735563064_8064.jpeg', 1, 0, '103.1.100.226', '2024-12-30 12:51:04', NULL, 0),
(43, 7, 1, '1735622799_1240.jpeg', 1, 0, '103.1.100.226', '2024-12-31 05:26:39', NULL, 0),
(44, 9, 1, '1735634745_8901.jpg', 1, 0, '103.1.100.226', '2024-12-31 08:45:46', NULL, 0),
(45, 9, 1, '1735634746_9680.jpg', 1, 0, '103.1.100.226', '2024-12-31 08:45:46', NULL, 0),
(47, 21, 1, '1735639848_8234.jpg', 1, 0, '103.1.100.226', '2024-12-31 10:10:48', NULL, 0),
(48, 29, 1, '1736141019_7810.jpeg', 1, 0, '103.1.100.226', '2025-01-06 05:23:39', NULL, 0),
(49, 29, 1, '1736141019_7175.jpeg', 1, 0, '103.1.100.226', '2025-01-06 05:23:39', NULL, 0),
(50, 29, 1, '1736141019_9645.jpg', 1, 0, '103.1.100.226', '2025-01-06 05:23:39', NULL, 0),
(51, 30, 1, '1736142274_2831.jpg', 1, 0, '103.1.100.226', '2025-01-06 05:44:34', NULL, 0),
(52, 14, 1, '1736765413_3450.jpg', 1, 0, '103.1.100.226', '2025-01-13 10:50:13', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faq-masters`
--

CREATE TABLE `faq-masters` (
  `id` int(11) NOT NULL,
  `question` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iStatus` tinyint(1) DEFAULT '1',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `strIP` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faq-masters`
--

INSERT INTO `faq-masters` (`id`, `question`, `answer`, `category`, `iStatus`, `createdAt`, `updatedAt`, `created_at`, `updated_at`, `strIP`) VALUES
(8, 'test', 'tst', NULL, 1, NULL, NULL, '2024-12-13 10:08:17', '2024-12-23 10:52:53', '103.1.100.226'),
(9, 'test', 'rgffddsvdsvfsdasfasdfsafdsfdsdfsdsdfsdfsdfsdfsdfsdf', NULL, 1, NULL, NULL, '2024-12-30 12:34:46', '2024-12-30 12:35:10', '103.1.100.226'),
(10, 'test', 'test test test test test test test test test test test', NULL, 1, NULL, NULL, '2025-01-16 06:45:39', '2025-01-16 06:50:56', '103.1.100.226');

-- --------------------------------------------------------

--
-- Table structure for table `fine_print`
--

CREATE TABLE `fine_print` (
  `finePrintId` int(11) NOT NULL,
  `iProductId` int(11) NOT NULL DEFAULT '0',
  `strDescription` text,
  `iStatus` int(11) NOT NULL DEFAULT '1',
  `isDelete` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `strIP` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `headerimage`
--

CREATE TABLE `headerimage` (
  `header_image_id` int(11) NOT NULL,
  `header_image` varchar(45) DEFAULT NULL,
  `iStatus` int(11) DEFAULT '1',
  `isDelete` int(11) DEFAULT '0',
  `strIP` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `headerimage`
--

INSERT INTO `headerimage` (`header_image_id`, `header_image`, `iStatus`, `isDelete`, `strIP`, `created_at`, `updated_at`) VALUES
(7, '1742979469_26032025142749.svg', 1, 0, '103.1.100.226', '2025-03-26 08:57:49', '2025-03-26 08:57:49');

-- --------------------------------------------------------

--
-- Table structure for table `Image`
--

CREATE TABLE `Image` (
  `id` int(11) NOT NULL,
  `subcat_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `Image` varchar(255) DEFAULT NULL,
  `strIP` varchar(255) DEFAULT NULL,
  `iStatus` int(11) DEFAULT '1',
  `isDelete` int(11) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `cat_name` varchar(255) DEFAULT NULL,
  `subcat_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Image`
--

INSERT INTO `Image` (`id`, `subcat_id`, `category_id`, `Image`, `strIP`, `iStatus`, `isDelete`, `created_at`, `updated_at`, `cat_name`, `subcat_name`) VALUES
(14, 22, 23, '1734950994_23122024161954.jpg', '103.1.100.226', 1, 0, '2024-12-23 10:49:54', '2024-12-23 10:49:54', 'Electronics', 'Mobile Phones'),
(15, 23, 24, '1734951022_23122024162022.jpg', '103.1.100.226', 1, 0, '2024-12-23 10:50:07', '2024-12-23 10:50:22', 'Fashion', 'Men’s Clothing'),
(17, 22, 23, '1735562066_30122024180426.jpg', '103.1.100.226', 1, 0, '2024-12-30 12:34:26', '2024-12-30 12:34:26', 'Electronics', 'Mobile Phones'),
(20, 23, 24, '1737009432_16012025120712.jpg', '103.1.100.226', 1, 0, '2025-01-16 06:37:12', '2025-01-16 06:37:12', 'Fashion', 'Men’s Clothing');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_01_12_173356_create_permission_tables', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1);

-- --------------------------------------------------------

--
-- Table structure for table `offer_image`
--

CREATE TABLE `offer_image` (
  `offerimage_id` int(11) NOT NULL,
  `offer_image` varchar(100) DEFAULT NULL,
  `iStatus` int(11) DEFAULT '1',
  `isDelete` int(11) DEFAULT '0',
  `strIP` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `link` varchar(100) DEFAULT NULL,
  `is_align` int(11) DEFAULT NULL COMMENT '1 = top 2 = bottom'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `offer_image`
--

INSERT INTO `offer_image` (`offerimage_id`, `offer_image`, `iStatus`, `isDelete`, `strIP`, `created_at`, `updated_at`, `link`, `is_align`) VALUES
(6, '1738832252_06022025142732.png', 1, 0, '103.1.100.226', '2025-02-06 08:57:32', '2025-02-06 08:57:32', 'www.com', 1),
(7, '1738832277_06022025142757.png', 1, 0, '103.1.100.226', '2025-02-06 08:57:57', '2025-02-06 08:57:57', 'facebook.com', 1),
(8, '1738833931_06022025145531.png', 1, 0, '103.1.100.226', '2025-02-06 09:25:31', '2025-02-06 09:25:31', 'www.com', 2),
(9, '1738833954_06022025145554.png', 1, 0, '103.1.100.226', '2025-02-06 09:25:54', '2025-02-06 09:25:54', 'facebook.com', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'user-list', 'web', '2022-09-12 04:33:06', '2022-09-12 04:33:06'),
(2, 'user-create', 'web', '2022-09-12 04:33:06', '2022-09-12 04:33:06'),
(3, 'user-edit', 'web', '2022-09-12 04:33:06', '2022-09-12 04:33:06'),
(4, 'user-delete', 'web', '2022-09-12 04:33:06', '2022-09-12 04:33:06'),
(5, 'role-create', 'web', '2022-09-12 04:33:06', '2022-09-12 04:33:06'),
(6, 'role-edit', 'web', '2022-09-12 04:33:06', '2022-09-12 04:33:06'),
(7, 'role-list', 'web', '2022-09-12 04:33:06', '2022-09-12 04:33:06'),
(8, 'role-delete', 'web', '2022-09-12 04:33:06', '2022-09-12 04:33:06'),
(9, 'permission-list', 'web', '2022-09-12 04:33:06', '2022-09-12 04:33:06'),
(10, 'permission-create', 'web', '2022-09-12 04:33:06', '2022-09-12 04:33:06'),
(11, 'permission-edit', 'web', '2022-09-12 04:33:06', '2022-09-12 04:33:06'),
(12, 'permission-delete', 'web', '2022-09-12 04:33:06', '2022-09-12 04:33:06');

-- --------------------------------------------------------

--
-- Table structure for table `promocodes`
--

CREATE TABLE `promocodes` (
  `promo_id` int(11) NOT NULL,
  `GUID` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `description` text,
  `pro_img` varchar(255) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `iStatus` int(11) DEFAULT '1',
  `isDelete` int(11) DEFAULT '0',
  `strIP` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `dis_per` varchar(255) DEFAULT NULL,
  `vendorid` int(11) DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `subcat_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `promocodes`
--

INSERT INTO `promocodes` (`promo_id`, `GUID`, `code`, `description`, `pro_img`, `start_date`, `end_date`, `iStatus`, `isDelete`, `strIP`, `created_at`, `updated_at`, `link`, `dis_per`, `vendorid`, `state_id`, `city_id`, `category_id`, `subcat_id`) VALUES
(14, '907e24ea-f314-48ba-95e9-20b5fb6f69b1', 'AJIO FASHION', 'CLOTH STORE', '1738670165_04022025172605.png', '2025-02-01 00:00:00', '2025-02-20 00:00:00', 1, 0, '103.1.100.226', '2025-01-31 11:26:37', '2025-02-04 12:14:39', 'apolloinfotech.com', '50', 57, NULL, NULL, NULL, 29),
(15, 'c79f8609-515d-4976-84d3-df9128209368', 'NYKAA50OFF', 'Get ₹50 off on your first purchase above ₹499. Valid on all beauty and skincare products. Hurry, limited-time offer!', '1738329070_31012025184110.png', '2025-02-01 00:00:00', '2025-02-10 00:00:00', 1, 0, '103.1.100.226', '2025-01-31 13:11:10', '2025-01-31 13:11:10', 'apolloinfotech.com', '50', 57, NULL, NULL, 36, 29),
(16, '1ef2c0cc-efd6-4505-aea4-7fb97b87f26a', 'Flat 50% Off On Your Fav Brand', 'T-Shirt', '1750934742_26062025161542.jpg', '2025-02-04 00:00:00', '2025-03-14 00:00:00', 1, 0, '103.1.100.226', '2025-02-04 07:25:17', '2025-06-26 10:45:42', 'https://maps.app.goo.gl/3zQDrwGKX9rjw2QS6', '50', 77, NULL, NULL, NULL, 30),
(17, '5837ea67-8ef9-4e7e-a579-5bcb6ab511ab', 'Flat 40% OFF', 'T-Shirt', '1750934752_26062025161552.jpg', '2025-02-15 00:00:00', '2025-02-28 00:00:00', 1, 0, '103.1.100.226', '2025-02-04 08:41:42', '2025-06-26 10:45:52', 'https://maps.app.goo.gl/3zQDrwGKX9rjw2QS6', '40', 77, NULL, NULL, NULL, 30),
(18, '47971b2f-3ad3-44f3-a412-954d55ca0395', 'test', 'ggggdfg', '1746524509_06052025151149.png', '2025-05-06 00:00:00', '2025-05-10 00:00:00', 1, 0, '103.1.100.226', '2025-05-06 09:41:49', '2025-05-06 10:20:32', 'www.com', '12', 78, NULL, NULL, NULL, 30),
(19, 'e74f7e44-0ef3-4ebf-9061-8832eaa654db', '0506', 'testing', '1750934031_26062025160351.jpg', '2025-05-12 00:00:00', '2025-06-30 00:00:00', 1, 0, '103.1.100.226', '2025-05-06 09:50:21', '2025-06-26 10:33:51', 'www.com', '10', 78, NULL, NULL, NULL, 30);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `strIP` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`, `strIP`) VALUES
(1, 'Admin', 'web', '2022-09-12 04:33:06', '2022-09-12 04:33:06', NULL),
(2, 'Account', 'web', '2022-09-12 04:33:06', '2024-08-17 10:10:28', '103.1.100.226'),
(3, 'Support team', NULL, '2024-08-17 10:11:43', '2024-08-17 10:11:43', NULL),
(4, 'marketing', NULL, '2024-09-06 15:50:48', '2024-09-06 15:50:48', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1);

-- --------------------------------------------------------

--
-- Table structure for table `role_permission`
--

CREATE TABLE `role_permission` (
  `permission_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `MasterEntry` int(11) DEFAULT '1',
  `States` int(11) DEFAULT '1',
  `City` int(11) DEFAULT '1',
  `Price` int(11) DEFAULT '1',
  `Area` int(11) DEFAULT '1',
  `Career` int(11) DEFAULT '1',
  `Testimonial` int(11) DEFAULT '1',
  `Faq` int(11) DEFAULT '1',
  `News_and_Updates` int(11) DEFAULT '1',
  `Tags` int(11) DEFAULT '1',
  `Vehicle` int(11) DEFAULT '1',
  `Cms` int(11) DEFAULT '1',
  `Goods_Type` int(11) NOT NULL DEFAULT '1',
  `Our_Team` int(11) NOT NULL DEFAULT '1',
  `Offer` int(11) NOT NULL DEFAULT '1',
  `Driver_Request` int(11) NOT NULL DEFAULT '1',
  `Driver_List` int(11) DEFAULT '1',
  `Driver_Pass` int(11) DEFAULT '1',
  `Seo` int(11) DEFAULT '1',
  `Customer` int(11) DEFAULT '1',
  `Employee_List` int(11) NOT NULL DEFAULT '1',
  `Role` int(11) NOT NULL DEFAULT '1',
  `istatus` int(11) NOT NULL DEFAULT '1',
  `Isdelete` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `strIP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Driver_Location` int(11) NOT NULL DEFAULT '1',
  `Career_Inquiry` int(11) NOT NULL DEFAULT '1',
  `Contact_Inquiry` int(11) NOT NULL DEFAULT '1',
  `News_Letter_Inquiry` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `role_permission`
--

INSERT INTO `role_permission` (`permission_id`, `role_id`, `MasterEntry`, `States`, `City`, `Price`, `Area`, `Career`, `Testimonial`, `Faq`, `News_and_Updates`, `Tags`, `Vehicle`, `Cms`, `Goods_Type`, `Our_Team`, `Offer`, `Driver_Request`, `Driver_List`, `Driver_Pass`, `Seo`, `Customer`, `Employee_List`, `Role`, `istatus`, `Isdelete`, `created_at`, `updated_at`, `strIP`, `Driver_Location`, `Career_Inquiry`, `Contact_Inquiry`, `News_Letter_Inquiry`) VALUES
(16, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2024-08-17 06:49:51', '2024-08-17 06:49:51', NULL, 1, 1, 1, 1),
(19, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, '2024-08-17 09:46:02', '2024-08-17 09:46:02', NULL, 1, 1, 1, 1),
(20, 4, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, '2024-09-06 15:53:15', '2024-09-06 15:53:15', '42.105.173.11', 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sendemaildetails`
--

CREATE TABLE `sendemaildetails` (
  `id` int(11) NOT NULL,
  `strSubject` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `strTitle` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `strFromMail` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ToMail` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `strCC` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `strBCC` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sendemaildetails`
--

INSERT INTO `sendemaildetails` (`id`, `strSubject`, `strTitle`, `strFromMail`, `ToMail`, `strCC`, `strBCC`) VALUES
(4, 'Contact Inquiry', 'Wardrobe Fashion', 'no-reply@thewardrobefashion.in', NULL, '', ''),
(8, 'Forget Password', 'Wardrobe Fashion', 'no-reply@thewardrobefashion.in', NULL, NULL, NULL),
(9, 'PriceCut', 'PriceCut', 'info@getdemo.in', NULL, NULL, NULL),
(10, 'Dispatch Order', 'Wardrobe Fashion', 'no-reply@thewardrobefashion.in', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `id` int(11) NOT NULL,
  `sitename` varchar(5000) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `email` varchar(500) DEFAULT NULL,
  `api_key` varchar(1000) DEFAULT NULL,
  `iStatus` int(11) NOT NULL DEFAULT '1',
  `isDelete` int(11) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `strIP` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`id`, `sitename`, `logo`, `email`, `api_key`, `iStatus`, `isDelete`, `created_at`, `updated_at`, `strIP`) VALUES
(1, 'Wardrobe', '1709706874.png', 'thewardrobefashion2024@gmail.com', 'c161b18ad624a8b272e4dae4d794ff3d', 1, 0, '2024-08-03 13:52:06', NULL, '103.81.93.45');

-- --------------------------------------------------------

--
-- Table structure for table `state-masters`
--

CREATE TABLE `state-masters` (
  `stateId` int(11) NOT NULL,
  `stateName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `iStatus` int(11) DEFAULT '1',
  `isDelete` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `strIP` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `state-masters`
--

INSERT INTO `state-masters` (`stateId`, `stateName`, `iStatus`, `isDelete`, `created_at`, `updated_at`, `strIP`) VALUES
(3, 'Karnataka', 1, 0, '2024-06-27 10:48:11', '2024-06-27 10:48:11', NULL),
(5, 'Gujarat', 1, 0, '2024-06-27 10:48:11', '2025-01-13 05:52:07', NULL),
(6, 'Telangana', 1, 0, '2024-06-27 10:48:11', '2024-06-27 10:48:11', NULL),
(7, 'Tamil Nadu', 1, 0, '2024-06-27 10:48:11', '2024-06-27 10:48:11', NULL),
(8, 'Rajasthan', 1, 0, '2024-06-27 10:48:11', '2024-06-27 10:48:11', NULL),
(9, 'Uttar Pradesh', 1, 0, '2024-06-27 10:48:11', '2024-06-27 10:48:11', NULL),
(10, 'Bihar', 1, 0, '2024-06-27 10:48:11', '2024-06-27 10:48:11', NULL),
(11, 'Madhya Pradesh', 1, 0, '2024-06-27 10:48:11', '2024-06-27 10:48:11', NULL),
(12, 'Andra Pradesh', 1, 0, '2024-06-27 10:48:11', '2025-01-13 05:52:38', '103.1.100.226'),
(13, 'Punjab', 1, 0, '2024-06-27 10:48:11', '2024-12-09 07:18:24', '103.1.100.226'),
(14, 'Haryana', 1, 0, '2024-06-27 10:48:11', '2025-01-13 05:29:33', NULL),
(15, 'Jammu and Kashmir', 1, 0, '2024-06-27 10:48:11', '2024-06-27 10:48:11', NULL),
(16, 'Jharkhand', 1, 0, '2024-06-27 10:48:11', '2024-06-27 10:48:11', NULL),
(17, 'Chhattisgarh', 1, 0, '2024-06-27 10:48:11', '2024-06-27 10:48:11', NULL),
(18, 'Assam', 1, 0, '2024-06-27 10:48:11', '2024-12-24 06:02:52', '103.1.100.226'),
(19, 'Chandigarh', 1, 0, '2024-06-27 10:48:11', '2024-06-27 10:48:11', NULL),
(20, 'Odisha', 1, 0, '2024-06-27 10:48:11', '2024-06-27 10:48:11', NULL),
(21, 'Kerala', 1, 0, '2024-06-27 10:48:11', '2024-06-27 10:48:11', NULL),
(22, 'Uttarakhand', 1, 0, '2024-06-27 10:48:11', '2024-06-27 10:48:11', NULL),
(23, 'Puducherry', 1, 0, '2024-06-27 10:48:11', '2024-06-27 10:48:11', NULL),
(24, 'Tripura', 1, 0, '2024-06-27 10:48:11', '2024-06-27 10:48:11', NULL),
(26, 'Mizoram', 1, 0, '2024-06-27 10:48:11', '2024-06-27 10:48:11', NULL),
(27, 'Meghalaya', 1, 0, '2024-06-27 10:48:11', '2024-06-27 10:48:11', NULL),
(28, 'Manipur', 1, 0, '2024-06-27 10:48:11', '2024-06-27 10:48:11', NULL),
(29, 'Himachal Pradesh', 1, 0, '2024-06-27 10:48:11', '2024-06-27 10:48:11', NULL),
(30, 'Nagaland', 1, 0, '2024-06-27 10:48:11', '2024-06-27 10:48:11', NULL),
(31, 'Goa', 1, 0, '2024-06-27 10:48:11', '2024-06-27 10:48:11', NULL),
(33, 'Arunachal Pradesh', 1, 0, '2024-06-27 10:48:11', '2024-12-24 06:02:51', NULL),
(34, 'Dadra and Nagar Haveli', 1, 0, '2024-06-27 10:48:11', '2024-06-27 10:48:11', NULL),
(57, 'Maharastra', 1, 0, '2025-01-17 05:41:41', '2025-01-17 05:41:41', '103.1.100.226');

-- --------------------------------------------------------

--
-- Table structure for table `subcategory`
--

CREATE TABLE `subcategory` (
  `iSubCategoryId` int(11) NOT NULL,
  `iSequence` int(11) NOT NULL DEFAULT '0',
  `iCategoryId` int(11) DEFAULT '0',
  `strCategoryName` varchar(255) DEFAULT NULL,
  `strSubCategoryName` varchar(255) DEFAULT NULL,
  `strSlugName` varchar(255) DEFAULT NULL,
  `iStatus` int(11) NOT NULL DEFAULT '1',
  `isDelete` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `strIP` varchar(255) DEFAULT NULL,
  `SubCategories_img` varchar(255) DEFAULT NULL,
  `subCategory_icon` varchar(255) DEFAULT NULL,
  `display_homepage` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subcategory`
--

INSERT INTO `subcategory` (`iSubCategoryId`, `iSequence`, `iCategoryId`, `strCategoryName`, `strSubCategoryName`, `strSlugName`, `iStatus`, `isDelete`, `created_at`, `updated_at`, `strIP`, `SubCategories_img`, `subCategory_icon`, `display_homepage`) VALUES
(29, 0, 36, 'Food & Drink', 'pizza', 'pizza', 1, 0, '2025-01-31 07:27:06', '2025-01-31 07:27:06', '103.1.100.226', '1738308426_31012025125706.jpeg', '1738308426_31012025125706.svg', 0),
(31, 0, 35, 'Auto & Home', 'Testing', 'testing', 1, 0, '2025-06-24 11:59:36', '2025-06-24 11:59:36', '103.1.100.226', '', '1750766376_24062025172936.svg', NULL),
(32, 0, 33, 'Beauty & Spas', 'Face treatments', 'face-treatments', 1, 0, '2025-06-24 12:04:11', '2025-06-24 12:08:54', '103.1.100.226', '1750766934_24062025173854.png', '1750766651_24062025173411.svg', NULL),
(33, 0, 37, 'Gifts', 'Festival', 'festival', 1, 0, '2025-06-24 12:14:11', '2025-06-24 12:14:11', '103.1.100.226', '', '1750767251_24062025174411.svg', 1),
(34, 0, 34, 'Things To Do', 'creativity', 'creativity', 1, 0, '2025-06-24 12:14:54', '2025-06-24 12:14:54', '103.1.100.226', '', '1750767294_24062025174454.svg', 0),
(35, 0, 38, 'Travel', 'picnic', 'picnic', 1, 0, '2025-06-24 12:15:45', '2025-06-24 12:15:45', '103.1.100.226', '', '1750767345_24062025174545.svg', NULL),
(37, 0, 33, 'Beauty & Spas', 'Skin & Care', 'skin-&-care', 1, 0, '2025-06-30 12:58:41', '2025-06-30 12:58:41', '103.1.100.226', '1751288321_30062025182841.jpg', '1751288321_30062025182841.svg', NULL),
(38, 0, 33, 'Beauty & Spas', 'Hair Removal', 'hair-removal', 1, 0, '2025-06-30 13:02:41', '2025-06-30 13:02:41', '103.1.100.226', '1751288561_30062025183241.webp', '1751288561_30062025183241.svg', NULL),
(39, 0, 33, 'Beauty & Spas', 'Salons', 'salons', 1, 0, '2025-06-30 13:08:13', '2025-06-30 13:08:13', '103.1.100.226', '1751288893_30062025183813.jpg', '1751288893_30062025183813.svg', NULL),
(40, 0, 33, 'Beauty & Spas', 'Spa', 'spa', 1, 0, '2025-06-30 13:12:42', '2025-06-30 13:12:42', '103.1.100.226', '1751289162_30062025184242.jpg', '1751289162_30062025184242.svg', NULL),
(41, 0, 33, 'Beauty & Spas', 'Nail Salons', 'nail-salons', 1, 0, '2025-06-30 13:16:41', '2025-06-30 13:16:41', '103.1.100.226', '1751289401_30062025184641.jpg', '1751289401_30062025184641.svg', NULL),
(42, 0, 36, 'Food & Drink', 'Restaurants', 'restaurants', 1, 0, '2025-06-30 13:18:52', '2025-06-30 13:18:52', '103.1.100.226', '1751289532_30062025184852.jpg', '1751289532_30062025184852.svg', NULL),
(43, 0, 36, 'Food & Drink', 'Groceries & Markets', 'groceries-&-markets', 1, 0, '2025-06-30 13:20:11', '2025-06-30 13:20:11', '103.1.100.226', '1751289611_30062025185011.jpg', '1751289611_30062025185011.svg', NULL),
(44, 0, 36, 'Food & Drink', 'Breweries, Wineries & Distilleries', 'breweries,-wineries-&-distilleries', 1, 0, '2025-06-30 13:23:17', '2025-06-30 13:23:17', '103.1.100.226', '1751289797_30062025185317.jpeg', '1751289797_30062025185317.svg', NULL),
(45, 0, 36, 'Food & Drink', 'Bars', 'bars', 1, 0, '2025-06-30 13:25:03', '2025-06-30 13:25:03', '103.1.100.226', '1751289903_30062025185503.jpg', '1751289903_30062025185503.svg', NULL),
(46, 0, 36, 'Food & Drink', 'Cafes & Treats', 'cafes-&-treats', 1, 0, '2025-06-30 13:27:31', '2025-06-30 13:27:31', '103.1.100.226', '1751290051_30062025185731.jpeg', '1751290051_30062025185731.svg', NULL),
(47, 0, 34, 'Things To Do', 'Kids Activities', 'kids-activities', 1, 0, '2025-06-30 14:09:09', '2025-06-30 14:09:09', '103.1.100.226', '1751292549_30062025193909.jpg', '1751292549_30062025193909.svg', NULL),
(48, 0, 34, 'Things To Do', 'Fun & Leisure', 'fun-&-leisure', 1, 0, '2025-07-01 05:19:59', '2025-07-01 05:19:59', '103.1.100.226', '1751347199_01072025104959.jpeg', '1751347199_01072025104959.svg', NULL),
(49, 0, 34, 'Things To Do', 'Sightseeing & Tours', 'sightseeing-&-tours', 1, 0, '2025-07-01 05:22:46', '2025-07-01 05:22:46', '103.1.100.226', '1751347366_01072025105246.jpeg', '1751347366_01072025105246.svg', NULL),
(50, 0, 34, 'Things To Do', 'Tickets & Events', 'tickets-&-events', 1, 0, '2025-07-01 05:24:47', '2025-07-01 05:24:47', '103.1.100.226', '1751347487_01072025105447.jpg', '1751347487_01072025105447.svg', NULL),
(51, 0, 34, 'Things To Do', 'Sports & Outdoors', 'sports-&-outdoors', 1, 0, '2025-07-01 05:28:08', '2025-07-01 05:28:08', '103.1.100.226', '1751347688_01072025105808.jpg', '1751347688_01072025105808.svg', NULL),
(52, 0, 35, 'Auto & Home', 'Oil Change', 'oil-change', 1, 0, '2025-07-01 05:30:28', '2025-07-01 05:30:28', '103.1.100.226', '1751347828_01072025110028.jpg', '1751347828_01072025110028.svg', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `testimonial-masters`
--

CREATE TABLE `testimonial-masters` (
  `id` int(11) DEFAULT NULL,
  `firstName` text,
  `lastName` text,
  `email` text,
  `description` text,
  `imageURL` text,
  `date` text,
  `cityName` text,
  `slugName` text,
  `rating` int(11) DEFAULT NULL,
  `iStatus` int(11) DEFAULT NULL,
  `isDelete` int(11) DEFAULT NULL,
  `created_at` text,
  `updated_at` text,
  `strIP` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `testimonial-masters`
--

INSERT INTO `testimonial-masters` (`id`, `firstName`, `lastName`, `email`, `description`, `imageURL`, `date`, `cityName`, `slugName`, `rating`, `iStatus`, `isDelete`, `created_at`, `updated_at`, `strIP`) VALUES
(25, 'test', 'test', 'test@gmail.com', '<p>testing</p>', '1733135816_02122024160656.jpg', '', 'Ahmedabad', '', 78, 1, 0, '2024-12-02 16:06:56', '2024-12-02 16:06:56', '127.0.0.1');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `role_id` int(11) NOT NULL DEFAULT '2' COMMENT '1=Admin, 2=TA/TP',
  `role_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `strIP` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `mobile_number`, `photo`, `password`, `address`, `role_id`, `role_name`, `status`, `created_at`, `updated_at`, `strIP`, `last_login`) VALUES
(1, 'Super', 'Admin', 'admin@admin.com', '9028187696', NULL, '$2y$12$G4FMXATQod29.VCYMfdi3OlJBlXuK561PUcaE771dvaHWN5OAuxP2', NULL, 1, NULL, 1, '2022-09-12 04:33:06', '2025-07-30 11:19:24', NULL, '2025-07-30 11:19:24'),
(2, 'Mihir', 'Rathod', 'mihirrathod97@gmail.com', '9725123569', NULL, '$2y$12$6RpC3n.eczWgLPJVRda.NebqBwXpMd113lt63FTn3HHGTG5NvmqVi', 'A-1 , Anubhav Flat , bhairavnath cross road , Maninagar , Ahmedabad', 3, 'Support team', 1, '2024-08-22 13:35:38', '2024-08-22 13:37:08', '103.1.100.226', NULL),
(3, 'shubham', 'shivastava', 'shubham@gmail.com', '976543211', NULL, '$2y$12$TbnK4P3C0WfgQ.nxbuh3yulVH6Y5wVHSkhlmORV.NJ8I3xyysrGKe', 'bangaluru', 4, 'marketing', 1, '2024-09-06 15:54:11', '2024-09-06 15:54:31', '42.105.173.11', '2024-09-06 15:54:31');

-- --------------------------------------------------------

--
-- Table structure for table `user_subscribe_deal`
--

CREATE TABLE `user_subscribe_deal` (
  `user_subscribe_deal_id` int(11) NOT NULL,
  `Customer_GUID` varchar(250) DEFAULT NULL,
  `vendorid` int(11) DEFAULT NULL,
  `deal_id` int(11) DEFAULT NULL,
  `deal_option_id` int(11) DEFAULT NULL,
  `deal_title` varchar(100) DEFAULT NULL,
  `deal_des` text,
  `dealvalidity_fromdate` date DEFAULT NULL,
  `dealvalidity_todate` date DEFAULT NULL,
  `option_title` varchar(255) DEFAULT NULL,
  `regular_price` int(11) DEFAULT NULL,
  `pricecut_price` int(11) DEFAULT NULL,
  `monthly_voucher` varchar(45) DEFAULT NULL,
  `iStatus` int(11) DEFAULT '1',
  `isDelete` int(11) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_subscribe_deal`
--

INSERT INTO `user_subscribe_deal` (`user_subscribe_deal_id`, `Customer_GUID`, `vendorid`, `deal_id`, `deal_option_id`, `deal_title`, `deal_des`, `dealvalidity_fromdate`, `dealvalidity_todate`, `option_title`, `regular_price`, `pricecut_price`, `monthly_voucher`, `iStatus`, `isDelete`, `created_at`, `updated_at`) VALUES
(3, '1', 60, 10, 24, 'Up to 49% Off on Salon - Women\'s Haircut at Pure Self Salon N Spa', '<p><span style=\"color: rgb(55, 65, 81);\">Promotional value expires 180 days after purchase. Amount paid never expires. Appointment required, contact by phone at +1 905 604 7873. May be repurchased every 30 days. Limit 3 per person. Merchant is solely responsible to purchasers for the care and quality of the advertised goods and services. Learn about&nbsp;</span><a href=\"https://www.groupon.com/legal/pricing-transparency\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: var(--tw-prose-links);\">Strike-Through Pricing and Savings</a></p>', NULL, NULL, 'Skilled stylists give the client new style with cuts to create a fresh look', 5999, 4999, '100', 1, 0, '2025-01-23 07:30:43', '2025-01-23 07:30:43'),
(4, '1', 60, 10, 24, 'Up to 49% Off on Salon - Women\'s Haircut at Pure Self Salon N Spa', '<p><span style=\"color: rgb(55, 65, 81);\">Promotional value expires 180 days after purchase. Amount paid never expires. Appointment required, contact by phone at +1 905 604 7873. May be repurchased every 30 days. Limit 3 per person. Merchant is solely responsible to purchasers for the care and quality of the advertised goods and services. Learn about&nbsp;</span><a href=\"https://www.groupon.com/legal/pricing-transparency\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: var(--tw-prose-links);\">Strike-Through Pricing and Savings</a></p>', '2025-01-01', '2025-01-10', 'Skilled stylists give the client new style with cuts to create a fresh look', 5999, 4999, '100', 1, 0, '2025-01-23 07:32:32', '2025-01-23 07:32:32'),
(5, 'b5ad16df-20c6-4de9-93f1-5c2434267f44', 60, 10, 24, 'Up to 49% Off on Salon - Women\'s Haircut at Pure Self Salon N Spa', '<p><span style=\"color: rgb(55, 65, 81);\">Promotional value expires 180 days after purchase. Amount paid never expires. Appointment required, contact by phone at +1 905 604 7873. May be repurchased every 30 days. Limit 3 per person. Merchant is solely responsible to purchasers for the care and quality of the advertised goods and services. Learn about&nbsp;</span><a href=\"https://www.groupon.com/legal/pricing-transparency\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: var(--tw-prose-links);\">Strike-Through Pricing and Savings</a></p>', '2025-01-01', '2025-01-10', 'Skilled stylists give the client new style with cuts to create a fresh look', 5999, 4999, '100', 1, 0, '2025-01-23 11:58:48', '2025-01-23 11:58:48'),
(7, '1d8f1c8b-308b-4d72-b888-a7c765614254', 60, 10, 24, 'Up to 49% Off on Salon - Women\'s Haircut at Pure Self Salon N Spa', '<p><span style=\"color: rgb(55, 65, 81);\">Promotional value expires 180 days after purchase. Amount paid never expires. Appointment required, contact by phone at +1 905 604 7873. May be repurchased every 30 days. Limit 3 per person. Merchant is solely responsible to purchasers for the care and quality of the advertised goods and services. Learn about&nbsp;</span><a href=\"https://www.groupon.com/legal/pricing-transparency\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: var(--tw-prose-links);\">Strike-Through Pricing and Savings</a></p>', '2025-01-01', '2025-01-10', 'Skilled stylists give the client new style with cuts to create a fresh look', 5999, 4999, '100', 1, 0, '2025-01-24 12:42:32', '2025-01-24 12:42:32'),
(8, '8ac2ddf0-db90-477c-941f-014108b77e91', 57, 2, 4, 'FALT 60% OFF ON SELECTED HOTELsssssssssssssss', '<h4>Niagara Falls, Ontario: Panoramic Views of the Falls near Vegas-Style Casinos and Water Parks</h4><p>At Niagara Falls, water thunders downward from a height of nearly 200 feet, crashing onto craggy boulders below. The falls straddle the border between Canada and the United States, but the Canadian side of the Niagara River is universally hailed as the finest vantage point to take in all three of Niagara Falls\' photogenic brinks: American, Bridal Veil, and Horseshoe Falls.</p><p>Hornblower cruises ferry raincoat-clad passengers around the base of the falls from April to October, depending on the river\'s ice conditions. Year-round, Journey Behind the Falls grants a glimpse behind the curtain of Horseshoe Falls—visitors board an elevator that descends 150 feet into the bedrock, then stand at an observation deck steps from the cascading water. A 10-minute walk from the falls is the neon-lit Clifton Hill neighborhood. Its Fallsview Boulevard has plenty of Vegas-style kitsch, including glitzy casinos and indoor wasster parks.</p>', '2025-01-18', '2025-01-26', 'NON-AC ROOM', 599, 299, '100', 1, 0, '2025-01-24 19:03:41', '2025-01-24 19:03:41'),
(9, '8ac2ddf0-db90-477c-941f-014108b77e91', 57, 2, 3, 'FALT 60% OFF ON SELECTED HOTELsssssssssssssss', '<h4>Niagara Falls, Ontario: Panoramic Views of the Falls near Vegas-Style Casinos and Water Parks</h4><p>At Niagara Falls, water thunders downward from a height of nearly 200 feet, crashing onto craggy boulders below. The falls straddle the border between Canada and the United States, but the Canadian side of the Niagara River is universally hailed as the finest vantage point to take in all three of Niagara Falls\' photogenic brinks: American, Bridal Veil, and Horseshoe Falls.</p><p>Hornblower cruises ferry raincoat-clad passengers around the base of the falls from April to October, depending on the river\'s ice conditions. Year-round, Journey Behind the Falls grants a glimpse behind the curtain of Horseshoe Falls—visitors board an elevator that descends 150 feet into the bedrock, then stand at an observation deck steps from the cascading water. A 10-minute walk from the falls is the neon-lit Clifton Hill neighborhood. Its Fallsview Boulevard has plenty of Vegas-style kitsch, including glitzy casinos and indoor wasster parks.</p>', '2025-01-18', '2025-01-26', 'DELUX HOTEL', 1099, 599, '50', 1, 0, '2025-01-24 19:03:57', '2025-01-24 19:03:57'),
(10, '8ac2ddf0-db90-477c-941f-014108b77e91', 57, 2, 3, 'FALT 60% OFF ON SELECTED HOTELsssssssssssssss', '<h4>Niagara Falls, Ontario: Panoramic Views of the Falls near Vegas-Style Casinos and Water Parks</h4><p>At Niagara Falls, water thunders downward from a height of nearly 200 feet, crashing onto craggy boulders below. The falls straddle the border between Canada and the United States, but the Canadian side of the Niagara River is universally hailed as the finest vantage point to take in all three of Niagara Falls\' photogenic brinks: American, Bridal Veil, and Horseshoe Falls.</p><p>Hornblower cruises ferry raincoat-clad passengers around the base of the falls from April to October, depending on the river\'s ice conditions. Year-round, Journey Behind the Falls grants a glimpse behind the curtain of Horseshoe Falls—visitors board an elevator that descends 150 feet into the bedrock, then stand at an observation deck steps from the cascading water. A 10-minute walk from the falls is the neon-lit Clifton Hill neighborhood. Its Fallsview Boulevard has plenty of Vegas-style kitsch, including glitzy casinos and indoor wasster parks.</p>', '2025-01-18', '2025-01-26', 'DELUX HOTEL', 1099, 599, '50', 1, 0, '2025-01-24 19:04:13', '2025-01-24 19:04:13'),
(11, '8ac2ddf0-db90-477c-941f-014108b77e91', 58, 1, 1, 'Zomoto 10% off', '<p>Zomoto 10% off</p>', NULL, NULL, 'Zomto 10% off', 1200, 1000, '50', 1, 0, '2025-01-24 19:11:06', '2025-01-24 19:11:06'),
(12, '8ac2ddf0-db90-477c-941f-014108b77e91', 57, 2, 4, 'FALT 60% OFF ON SELECTED HOTELsssssssssssssss', '<h4>Niagara Falls, Ontario: Panoramic Views of the Falls near Vegas-Style Casinos and Water Parks</h4><p>At Niagara Falls, water thunders downward from a height of nearly 200 feet, crashing onto craggy boulders below. The falls straddle the border between Canada and the United States, but the Canadian side of the Niagara River is universally hailed as the finest vantage point to take in all three of Niagara Falls\' photogenic brinks: American, Bridal Veil, and Horseshoe Falls.</p><p>Hornblower cruises ferry raincoat-clad passengers around the base of the falls from April to October, depending on the river\'s ice conditions. Year-round, Journey Behind the Falls grants a glimpse behind the curtain of Horseshoe Falls—visitors board an elevator that descends 150 feet into the bedrock, then stand at an observation deck steps from the cascading water. A 10-minute walk from the falls is the neon-lit Clifton Hill neighborhood. Its Fallsview Boulevard has plenty of Vegas-style kitsch, including glitzy casinos and indoor wasster parks.</p>', '2025-01-18', '2025-01-26', 'NON-AC ROOM', 599, 299, '100', 1, 0, '2025-01-24 19:36:10', '2025-01-24 19:36:10'),
(13, 'd5755b1a-567e-4bfc-8a74-cdebe729d560', 57, 2, 4, 'FALT 60% OFF ON SELECTED HOTELsssssssssssssss', '<h4>Niagara Falls, Ontario: Panoramic Views of the Falls near Vegas-Style Casinos and Water Parks</h4><p>At Niagara Falls, water thunders downward from a height of nearly 200 feet, crashing onto craggy boulders below. The falls straddle the border between Canada and the United States, but the Canadian side of the Niagara River is universally hailed as the finest vantage point to take in all three of Niagara Falls\' photogenic brinks: American, Bridal Veil, and Horseshoe Falls.</p><p>Hornblower cruises ferry raincoat-clad passengers around the base of the falls from April to October, depending on the river\'s ice conditions. Year-round, Journey Behind the Falls grants a glimpse behind the curtain of Horseshoe Falls—visitors board an elevator that descends 150 feet into the bedrock, then stand at an observation deck steps from the cascading water. A 10-minute walk from the falls is the neon-lit Clifton Hill neighborhood. Its Fallsview Boulevard has plenty of Vegas-style kitsch, including glitzy casinos and indoor wasster parks.</p>', '2025-01-18', '2025-01-26', 'NON-AC ROOM', 599, 299, '100', 1, 0, '2025-01-25 06:16:42', '2025-01-25 06:16:42'),
(14, '8ac2ddf0-db90-477c-941f-014108b77e91', 59, 3, 5, 'HOTEL BOOKING DEAL', '<h3><strong>Hotel Features &amp; Amenities</strong></h3><ul><li><strong>Prime Location:</strong> Just minutes away from popular attractions, restaurants, and shopping districts.</li><li><strong>On-Site Dining:</strong> Enjoy a variety of cuisines at our award-winning restaurant, or unwind with cocktails at the rooftop bar.</li><li><strong>Spa &amp; Wellness Center:</strong> Rejuvenate with a relaxing massage, sauna, or fitness session in our state-of-the-art gym.</li><li><strong>Business Center:</strong> Equipped with high-speed internet, meeting rooms, and audiovisual facilities for corporate guests.</li><li><strong>Family-Friendly Services:</strong> Dedicated play areas for kids and babysitting services available upon request.</li><li><strong>24/7 Concierge:</strong> Personalized assistance for tours, transport, and special requests.</li></ul>', NULL, NULL, 'Standard Room', 1999, 1299, '500', 1, 0, '2025-01-25 06:21:09', '2025-01-25 06:21:09'),
(15, '8ac2ddf0-db90-477c-941f-014108b77e91', 59, 3, 5, 'HOTEL BOOKING DEAL', '<h3><strong>Hotel Features &amp; Amenities</strong></h3><ul><li><strong>Prime Location:</strong> Just minutes away from popular attractions, restaurants, and shopping districts.</li><li><strong>On-Site Dining:</strong> Enjoy a variety of cuisines at our award-winning restaurant, or unwind with cocktails at the rooftop bar.</li><li><strong>Spa &amp; Wellness Center:</strong> Rejuvenate with a relaxing massage, sauna, or fitness session in our state-of-the-art gym.</li><li><strong>Business Center:</strong> Equipped with high-speed internet, meeting rooms, and audiovisual facilities for corporate guests.</li><li><strong>Family-Friendly Services:</strong> Dedicated play areas for kids and babysitting services available upon request.</li><li><strong>24/7 Concierge:</strong> Personalized assistance for tours, transport, and special requests.</li></ul>', NULL, NULL, 'Standard Room', 1999, 1299, '500', 1, 0, '2025-01-25 06:43:30', '2025-01-25 06:43:30'),
(16, '8ac2ddf0-db90-477c-941f-014108b77e91', 59, 5, 12, 'Luxury Fragrance Deals', '<h4><strong>Discover Your Signature Scent – Irresistible Deals on Premium Perfumes</strong></h4><p>Elevate your everyday style with our exclusive perfume deals. Whether you prefer floral, woody, or citrusy fragrances, our curated selection offers something for everyone. Perfect as a gift or an indulgence for yourself, these perfumes promise to leave a lasting impression.</p>', NULL, NULL, 'Midnight Oud (100ml)', 2799, 2299, '100', 1, 0, '2025-01-25 10:38:33', '2025-01-25 10:38:33'),
(17, '8ac2ddf0-db90-477c-941f-014108b77e91', 59, 3, 7, 'HOTEL BOOKING DEAL', '<h3><strong>Hotel Features &amp; Amenities</strong></h3><ul><li><strong>Prime Location:</strong> Just minutes away from popular attractions, restaurants, and shopping districts.</li><li><strong>On-Site Dining:</strong> Enjoy a variety of cuisines at our award-winning restaurant, or unwind with cocktails at the rooftop bar.</li><li><strong>Spa &amp; Wellness Center:</strong> Rejuvenate with a relaxing massage, sauna, or fitness session in our state-of-the-art gym.</li><li><strong>Business Center:</strong> Equipped with high-speed internet, meeting rooms, and audiovisual facilities for corporate guests.</li><li><strong>Family-Friendly Services:</strong> Dedicated play areas for kids and babysitting services available upon request.</li><li><strong>24/7 Concierge:</strong> Personalized assistance for tours, transport, and special requests.</li></ul>', '2025-01-25', '2025-01-25', 'Presidential Suite', 3999, 2999, '150', 1, 0, '2025-01-25 14:04:35', '2025-01-25 14:04:35'),
(18, '8ac2ddf0-db90-477c-941f-014108b77e91', 57, 2, 4, 'FALT 90% OFF ON SELECTED HOTEL', '<h4>Niagara Falls, Ontario: Panoramic Views of the Falls near Vegas-Style Casinos and Water Parks</h4><p>At Niagara Falls, water thunders downward from a height of nearly 200 feet, crashing onto craggy boulders below. The falls straddle the border between Canada and the United States, but the Canadian side of the Niagara River is universally hailed as the finest vantage point to take in all three of Niagara Falls\' photogenic brinks: American, Bridal Veil, and Horseshoe Falls.</p><p>Hornblower cruises ferry raincoat-clad passengers around the base of the falls from April to October, depending on the river\'s ice conditions. Year-round, Journey Behind the Falls grants a glimpse behind the curtain of Horseshoe Falls—visitors board an elevator that descends 150 feet into the bedrock, then stand at an observation deck steps from the cascading water. A 10-minute walk from the falls is the neon-lit Clifton Hill neighborhood. Its Fallsview Boulevard has plenty of Vegas-style kitsch, including glitzy casinos and indoor wasster parks.</p>', '2025-01-18', '2025-01-26', 'NON-AC ROOM', 599, 299, '100', 1, 0, '2025-01-27 12:03:25', '2025-01-27 12:03:25'),
(19, '8ac2ddf0-db90-477c-941f-014108b77e91', 57, 2, 4, 'FALT 90% OFF ON SELECTED HOTEL', '<h4>Niagara Falls, Ontario: Panoramic Views of the Falls near Vegas-Style Casinos and Water Parks</h4><p>At Niagara Falls, water thunders downward from a height of nearly 200 feet, crashing onto craggy boulders below. The falls straddle the border between Canada and the United States, but the Canadian side of the Niagara River is universally hailed as the finest vantage point to take in all three of Niagara Falls\' photogenic brinks: American, Bridal Veil, and Horseshoe Falls.</p><p>Hornblower cruises ferry raincoat-clad passengers around the base of the falls from April to October, depending on the river\'s ice conditions. Year-round, Journey Behind the Falls grants a glimpse behind the curtain of Horseshoe Falls—visitors board an elevator that descends 150 feet into the bedrock, then stand at an observation deck steps from the cascading water. A 10-minute walk from the falls is the neon-lit Clifton Hill neighborhood. Its Fallsview Boulevard has plenty of Vegas-style kitsch, including glitzy casinos and indoor wasster parks.</p>', '2025-01-18', '2025-01-26', 'NON-AC ROOM', 599, 299, '100', 1, 0, '2025-01-27 12:35:22', '2025-01-27 12:35:22'),
(20, '8ac2ddf0-db90-477c-941f-014108b77e91', 57, 2, 4, 'FALT 90% OFF ON SELECTED HOTEL', '<h4>Niagara Falls, Ontario: Panoramic Views of the Falls near Vegas-Style Casinos and Water Parks</h4><p>At Niagara Falls, water thunders downward from a height of nearly 200 feet, crashing onto craggy boulders below. The falls straddle the border between Canada and the United States, but the Canadian side of the Niagara River is universally hailed as the finest vantage point to take in all three of Niagara Falls\' photogenic brinks: American, Bridal Veil, and Horseshoe Falls.</p><p>Hornblower cruises ferry raincoat-clad passengers around the base of the falls from April to October, depending on the river\'s ice conditions. Year-round, Journey Behind the Falls grants a glimpse behind the curtain of Horseshoe Falls—visitors board an elevator that descends 150 feet into the bedrock, then stand at an observation deck steps from the cascading water. A 10-minute walk from the falls is the neon-lit Clifton Hill neighborhood. Its Fallsview Boulevard has plenty of Vegas-style kitsch, including glitzy casinos and indoor wasster parks.</p>', '2025-01-18', '2025-01-26', 'NON-AC ROOM', 599, 299, '100', 1, 0, '2025-01-27 12:35:51', '2025-01-27 12:35:51'),
(21, '8ac2ddf0-db90-477c-941f-014108b77e91', 57, 2, 3, 'FALT 90% OFF ON SELECTED HOTEL', '<h4>Niagara Falls, Ontario: Panoramic Views of the Falls near Vegas-Style Casinos and Water Parks</h4><p>At Niagara Falls, water thunders downward from a height of nearly 200 feet, crashing onto craggy boulders below. The falls straddle the border between Canada and the United States, but the Canadian side of the Niagara River is universally hailed as the finest vantage point to take in all three of Niagara Falls\' photogenic brinks: American, Bridal Veil, and Horseshoe Falls.</p><p>Hornblower cruises ferry raincoat-clad passengers around the base of the falls from April to October, depending on the river\'s ice conditions. Year-round, Journey Behind the Falls grants a glimpse behind the curtain of Horseshoe Falls—visitors board an elevator that descends 150 feet into the bedrock, then stand at an observation deck steps from the cascading water. A 10-minute walk from the falls is the neon-lit Clifton Hill neighborhood. Its Fallsview Boulevard has plenty of Vegas-style kitsch, including glitzy casinos and indoor wasster parks.</p>', '2025-01-18', '2025-01-26', 'DELUX HOTEL', 1099, 599, '50', 1, 0, '2025-01-27 12:36:34', '2025-01-27 12:36:34'),
(22, '8ac2ddf0-db90-477c-941f-014108b77e91', 57, 2, 4, 'FALT 90% OFF ON SELECTED HOTEL', '<h4>Niagara Falls, Ontario: Panoramic Views of the Falls near Vegas-Style Casinos and Water Parks</h4><p>At Niagara Falls, water thunders downward from a height of nearly 200 feet, crashing onto craggy boulders below. The falls straddle the border between Canada and the United States, but the Canadian side of the Niagara River is universally hailed as the finest vantage point to take in all three of Niagara Falls\' photogenic brinks: American, Bridal Veil, and Horseshoe Falls.</p><p>Hornblower cruises ferry raincoat-clad passengers around the base of the falls from April to October, depending on the river\'s ice conditions. Year-round, Journey Behind the Falls grants a glimpse behind the curtain of Horseshoe Falls—visitors board an elevator that descends 150 feet into the bedrock, then stand at an observation deck steps from the cascading water. A 10-minute walk from the falls is the neon-lit Clifton Hill neighborhood. Its Fallsview Boulevard has plenty of Vegas-style kitsch, including glitzy casinos and indoor wasster parks.</p>', '2025-01-18', '2025-01-26', 'NON-AC ROOM', 599, 299, '100', 1, 0, '2025-01-27 12:36:48', '2025-01-27 12:36:48'),
(23, '8ac2ddf0-db90-477c-941f-014108b77e91', 57, 2, 3, 'FALT 90% OFF ON SELECTED HOTEL', '<h4>Niagara Falls, Ontario: Panoramic Views of the Falls near Vegas-Style Casinos and Water Parks</h4><p>At Niagara Falls, water thunders downward from a height of nearly 200 feet, crashing onto craggy boulders below. The falls straddle the border between Canada and the United States, but the Canadian side of the Niagara River is universally hailed as the finest vantage point to take in all three of Niagara Falls\' photogenic brinks: American, Bridal Veil, and Horseshoe Falls.</p><p>Hornblower cruises ferry raincoat-clad passengers around the base of the falls from April to October, depending on the river\'s ice conditions. Year-round, Journey Behind the Falls grants a glimpse behind the curtain of Horseshoe Falls—visitors board an elevator that descends 150 feet into the bedrock, then stand at an observation deck steps from the cascading water. A 10-minute walk from the falls is the neon-lit Clifton Hill neighborhood. Its Fallsview Boulevard has plenty of Vegas-style kitsch, including glitzy casinos and indoor wasster parks.</p>', '2025-01-18', '2025-01-26', 'DELUX HOTEL', 1099, 599, '50', 1, 0, '2025-01-27 12:37:11', '2025-01-27 12:37:11'),
(24, '8ac2ddf0-db90-477c-941f-014108b77e91', 60, 10, 24, 'Up to 49% Off on Salon - Women\'s Haircut at Pure Self Salon N Spa', '<p><span style=\"color: rgb(55, 65, 81);\">Promotional value expires 180 days after purchase. Amount paid never expires. Appointment required, contact by phone at +1 905 604 7873. May be repurchased every 30 days. Limit 3 per person. Merchant is solely responsible to purchasers for the care and quality of the advertised goods and services. Learn about&nbsp;</span><a href=\"https://www.groupon.com/legal/pricing-transparency\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: var(--tw-prose-links);\">Strike-Through Pricing and Savings</a></p>', '2025-01-01', '2025-01-10', 'Skilled stylists give the client new style with cuts to create a fresh look', 5999, 4999, '100', 1, 0, '2025-01-27 12:37:52', '2025-01-27 12:37:52'),
(25, '8ac2ddf0-db90-477c-941f-014108b77e91', 59, 5, 13, 'Luxury Fragrance Deals', '<h4><strong>Discover Your Signature Scent – Irresistible Deals on Premium Perfumes</strong></h4><p>Elevate your everyday style with our exclusive perfume deals. Whether you prefer floral, woody, or citrusy fragrances, our curated selection offers something for everyone. Perfect as a gift or an indulgence for yourself, these perfumes promise to leave a lasting impression.</p>', NULL, NULL, 'Citrus Fresh Splash (75ml)', 999, 599, '500', 1, 0, '2025-01-27 12:38:23', '2025-01-27 12:38:23'),
(26, '8ac2ddf0-db90-477c-941f-014108b77e91', 59, 5, 12, 'Luxury Fragrance Deals', '<h4><strong>Discover Your Signature Scent – Irresistible Deals on Premium Perfumes</strong></h4><p>Elevate your everyday style with our exclusive perfume deals. Whether you prefer floral, woody, or citrusy fragrances, our curated selection offers something for everyone. Perfect as a gift or an indulgence for yourself, these perfumes promise to leave a lasting impression.</p>', NULL, NULL, 'Midnight Oud (100ml)', 2799, 2299, '100', 1, 0, '2025-01-27 12:38:59', '2025-01-27 12:38:59'),
(27, '8ac2ddf0-db90-477c-941f-014108b77e91', 59, 5, 11, 'Luxury Fragrance Deals', '<h4><strong>Discover Your Signature Scent – Irresistible Deals on Premium Perfumes</strong></h4><p>Elevate your everyday style with our exclusive perfume deals. Whether you prefer floral, woody, or citrusy fragrances, our curated selection offers something for everyone. Perfect as a gift or an indulgence for yourself, these perfumes promise to leave a lasting impression.</p>', NULL, NULL, 'Eternal Bloom (50ml)', 1699, 1499, '500', 1, 0, '2025-01-27 12:39:15', '2025-01-27 12:39:15'),
(28, '8ac2ddf0-db90-477c-941f-014108b77e91', 59, 5, 12, 'Luxury Fragrance Deals', '<h4><strong>Discover Your Signature Scent – Irresistible Deals on Premium Perfumes</strong></h4><p>Elevate your everyday style with our exclusive perfume deals. Whether you prefer floral, woody, or citrusy fragrances, our curated selection offers something for everyone. Perfect as a gift or an indulgence for yourself, these perfumes promise to leave a lasting impression.</p>', NULL, NULL, 'Midnight Oud (100ml)', 2799, 2299, '100', 1, 0, '2025-01-27 12:40:25', '2025-01-27 12:40:25'),
(29, '8ac2ddf0-db90-477c-941f-014108b77e91', 59, 5, 13, 'Luxury Fragrance Deals', '<h4><strong>Discover Your Signature Scent – Irresistible Deals on Premium Perfumes</strong></h4><p>Elevate your everyday style with our exclusive perfume deals. Whether you prefer floral, woody, or citrusy fragrances, our curated selection offers something for everyone. Perfect as a gift or an indulgence for yourself, these perfumes promise to leave a lasting impression.</p>', NULL, NULL, 'Citrus Fresh Splash (75ml)', 999, 599, '500', 1, 0, '2025-01-27 12:41:28', '2025-01-27 12:41:28'),
(30, '8ac2ddf0-db90-477c-941f-014108b77e91', 57, 2, 3, 'FALT 90% OFF ON SELECTED HOTEL', '<h4>Niagara Falls, Ontario: Panoramic Views of the Falls near Vegas-Style Casinos and Water Parks</h4><p>At Niagara Falls, water thunders downward from a height of nearly 200 feet, crashing onto craggy boulders below. The falls straddle the border between Canada and the United States, but the Canadian side of the Niagara River is universally hailed as the finest vantage point to take in all three of Niagara Falls\' photogenic brinks: American, Bridal Veil, and Horseshoe Falls.</p><p>Hornblower cruises ferry raincoat-clad passengers around the base of the falls from April to October, depending on the river\'s ice conditions. Year-round, Journey Behind the Falls grants a glimpse behind the curtain of Horseshoe Falls—visitors board an elevator that descends 150 feet into the bedrock, then stand at an observation deck steps from the cascading water. A 10-minute walk from the falls is the neon-lit Clifton Hill neighborhood. Its Fallsview Boulevard has plenty of Vegas-style kitsch, including glitzy casinos and indoor wasster parks.</p>', '2025-01-18', '2025-01-26', 'DELUX HOTEL', 1099, 599, '50', 1, 0, '2025-01-27 12:43:39', '2025-01-27 12:43:39'),
(31, '8ac2ddf0-db90-477c-941f-014108b77e91', 57, 2, 4, 'FALT 90% OFF ON SELECTED HOTEL', '<h4>Niagara Falls, Ontario: Panoramic Views of the Falls near Vegas-Style Casinos and Water Parks</h4><p>At Niagara Falls, water thunders downward from a height of nearly 200 feet, crashing onto craggy boulders below. The falls straddle the border between Canada and the United States, but the Canadian side of the Niagara River is universally hailed as the finest vantage point to take in all three of Niagara Falls\' photogenic brinks: American, Bridal Veil, and Horseshoe Falls.</p><p>Hornblower cruises ferry raincoat-clad passengers around the base of the falls from April to October, depending on the river\'s ice conditions. Year-round, Journey Behind the Falls grants a glimpse behind the curtain of Horseshoe Falls—visitors board an elevator that descends 150 feet into the bedrock, then stand at an observation deck steps from the cascading water. A 10-minute walk from the falls is the neon-lit Clifton Hill neighborhood. Its Fallsview Boulevard has plenty of Vegas-style kitsch, including glitzy casinos and indoor wasster parks.</p>', '2025-01-18', '2025-01-26', 'NON-AC ROOM', 599, 299, '100', 1, 0, '2025-01-27 13:00:24', '2025-01-27 13:00:24'),
(32, '8ac2ddf0-db90-477c-941f-014108b77e91', 57, 7, 18, 'Power Boost Deals – Stay Charged, Anywhere!', '<h4><strong>Portable Power Banks at Incredible Prices</strong></h4><p>Never run out of battery with our <strong>Power Boost Deals</strong>! Choose from our range of high-capacity, fast-charging power banks to keep your devices powered up on the go. Lightweight, durable, and packed with the latest technology, these power banks are perfect for travelers, professionals, and everyday use.</p>', NULL, NULL, 'MaxCharge 20000mAh', 2499, 1799, '50', 1, 0, '2025-01-27 13:01:21', '2025-01-27 13:01:21'),
(33, '8ac2ddf0-db90-477c-941f-014108b77e91', 57, 2, 4, 'FALT 90% OFF ON SELECTED HOTEL', '<h4>Niagara Falls, Ontario: Panoramic Views of the Falls near Vegas-Style Casinos and Water Parks</h4><p>At Niagara Falls, water thunders downward from a height of nearly 200 feet, crashing onto craggy boulders below. The falls straddle the border between Canada and the United States, but the Canadian side of the Niagara River is universally hailed as the finest vantage point to take in all three of Niagara Falls\' photogenic brinks: American, Bridal Veil, and Horseshoe Falls.</p><p>Hornblower cruises ferry raincoat-clad passengers around the base of the falls from April to October, depending on the river\'s ice conditions. Year-round, Journey Behind the Falls grants a glimpse behind the curtain of Horseshoe Falls—visitors board an elevator that descends 150 feet into the bedrock, then stand at an observation deck steps from the cascading water. A 10-minute walk from the falls is the neon-lit Clifton Hill neighborhood. Its Fallsview Boulevard has plenty of Vegas-style kitsch, including glitzy casinos and indoor wasster parks.</p>', '2025-01-18', '2025-01-26', 'NON-AC ROOM', 599, 299, '100', 1, 0, '2025-01-27 14:12:27', '2025-01-27 14:12:27'),
(34, '8ac2ddf0-db90-477c-941f-014108b77e91', 57, 2, 4, 'FALT 90% OFF ON SELECTED HOTEL', '<h4>Niagara Falls, Ontario: Panoramic Views of the Falls near Vegas-Style Casinos and Water Parks</h4><p>At Niagara Falls, water thunders downward from a height of nearly 200 feet, crashing onto craggy boulders below. The falls straddle the border between Canada and the United States, but the Canadian side of the Niagara River is universally hailed as the finest vantage point to take in all three of Niagara Falls\' photogenic brinks: American, Bridal Veil, and Horseshoe Falls.</p><p>Hornblower cruises ferry raincoat-clad passengers around the base of the falls from April to October, depending on the river\'s ice conditions. Year-round, Journey Behind the Falls grants a glimpse behind the curtain of Horseshoe Falls—visitors board an elevator that descends 150 feet into the bedrock, then stand at an observation deck steps from the cascading water. A 10-minute walk from the falls is the neon-lit Clifton Hill neighborhood. Its Fallsview Boulevard has plenty of Vegas-style kitsch, including glitzy casinos and indoor wasster parks.</p>', '2025-01-18', '2025-01-26', 'NON-AC ROOM', 599, 299, '100', 1, 0, '2025-01-27 14:19:20', '2025-01-27 14:19:20'),
(35, '8ac2ddf0-db90-477c-941f-014108b77e91', 57, 2, 4, 'FALT 90% OFF ON SELECTED HOTEL', '<h4>Niagara Falls, Ontario: Panoramic Views of the Falls near Vegas-Style Casinos and Water Parks</h4><p>At Niagara Falls, water thunders downward from a height of nearly 200 feet, crashing onto craggy boulders below. The falls straddle the border between Canada and the United States, but the Canadian side of the Niagara River is universally hailed as the finest vantage point to take in all three of Niagara Falls\' photogenic brinks: American, Bridal Veil, and Horseshoe Falls.</p><p>Hornblower cruises ferry raincoat-clad passengers around the base of the falls from April to October, depending on the river\'s ice conditions. Year-round, Journey Behind the Falls grants a glimpse behind the curtain of Horseshoe Falls—visitors board an elevator that descends 150 feet into the bedrock, then stand at an observation deck steps from the cascading water. A 10-minute walk from the falls is the neon-lit Clifton Hill neighborhood. Its Fallsview Boulevard has plenty of Vegas-style kitsch, including glitzy casinos and indoor wasster parks.</p>', '2025-01-18', '2025-01-26', 'NON-AC ROOM', 599, 299, '100', 1, 0, '2025-01-27 14:19:37', '2025-01-27 14:19:37'),
(36, '8ac2ddf0-db90-477c-941f-014108b77e91', 59, 5, 12, 'Luxury Fragrance Deals', '<h4><strong>Discover Your Signature Scent – Irresistible Deals on Premium Perfumes</strong></h4><p>Elevate your everyday style with our exclusive perfume deals. Whether you prefer floral, woody, or citrusy fragrances, our curated selection offers something for everyone. Perfect as a gift or an indulgence for yourself, these perfumes promise to leave a lasting impression.</p>', NULL, NULL, 'Midnight Oud (100ml)', 2799, 2299, '100', 1, 0, '2025-01-28 05:32:16', '2025-01-28 05:32:16'),
(37, '8ac2ddf0-db90-477c-941f-014108b77e91', 57, 2, 4, 'FALT 90% OFF ON SELECTED HOTEL', '<h4>Niagara Falls, Ontario: Panoramic Views of the Falls near Vegas-Style Casinos and Water Parks</h4><p>At Niagara Falls, water thunders downward from a height of nearly 200 feet, crashing onto craggy boulders below. The falls straddle the border between Canada and the United States, but the Canadian side of the Niagara River is universally hailed as the finest vantage point to take in all three of Niagara Falls\' photogenic brinks: American, Bridal Veil, and Horseshoe Falls.</p><p>Hornblower cruises ferry raincoat-clad passengers around the base of the falls from April to October, depending on the river\'s ice conditions. Year-round, Journey Behind the Falls grants a glimpse behind the curtain of Horseshoe Falls—visitors board an elevator that descends 150 feet into the bedrock, then stand at an observation deck steps from the cascading water. A 10-minute walk from the falls is the neon-lit Clifton Hill neighborhood. Its Fallsview Boulevard has plenty of Vegas-style kitsch, including glitzy casinos and indoor wasster parks.</p>', '2025-01-18', '2025-01-26', 'NON-AC ROOM', 599, 299, '100', 1, 0, '2025-01-28 06:47:21', '2025-01-28 06:47:21'),
(38, '8ac2ddf0-db90-477c-941f-014108b77e91', 57, 6, 16, 'Mega Smartphone Fest', '<h4><strong>Unbeatable Deals on the Latest Smartphones – Upgrade Your Mobile Today!</strong></h4><p>Looking for the best smartphone at the best price? Our <strong>Mega Smartphone Fest</strong> offers exclusive discounts on top brands and the latest models. Whether you need a feature-packed flagship or a budget-friendly device, we’ve got you covered.</p>', NULL, NULL, 'Redmi Note 13 Max', 18999, 14999, '500', 1, 0, '2025-01-28 07:03:57', '2025-01-28 07:03:57'),
(39, '8ac2ddf0-db90-477c-941f-014108b77e91', 57, 32, 25, 'Flat 100rs Off Next Hotel Booking', '<p><strong>Welcome to Grand Oasis Hotel</strong></p><p>Escape to the tranquil comfort of the Grand Oasis Hotel, where luxury meets convenience in the heart of the city. Our state-of-the-art amenities and unparalleled service ensure a stay like no other. Whether you\'re here for business, leisure, or a romantic getaway, the Grand Oasis offers a wide range of services tailored to meet all your needs.</p><p><strong>Room Features:</strong></p><ul><li><strong>Deluxe King Suite</strong>: Spacious, elegantly furnished, with a stunning city view. Enjoy a king-size bed, smart TV, and a marble ensuite bathroom.</li><li><strong>Standard Double Room</strong>: A perfect option for both business travelers and tourists. Includes free high-speed Wi-Fi, a work desk, and plush bedding for a restful night.</li><li><strong>Executive Penthouse</strong>: Indulge in the ultimate luxury with panoramic views, a private terrace, and exclusive access to our executive lounge.</li></ul><p><strong>Hotel Amenities:</strong></p><ul><li><strong>24/7 Concierge Service</strong>: Need recommendations or assistance? Our concierge is available round-the-clock to cater to your needs.</li><li><strong>Spa &amp; Wellness Center</strong>: Relax and rejuvenate with a variety of spa treatments, including massages, facials, and wellness therapies.</li><li><strong>On-site Restaurant</strong>: Savor international cuisine at our restaurant, where gourmet dishes are prepared using the freshest local ingredients.</li><li><strong>Infinity Pool</strong>: Take a dip in our outdoor pool with stunning views of the city skyline.</li></ul><p><strong>Location:</strong> Located just 5 minutes from the central business district and 15 minutes from the nearest airport, the Grand Oasis is ideally positioned for both work and leisure. Enjoy easy access to shopping malls, historic landmarks, and vibrant nightlife.</p><p><strong>Special Offers:</strong></p><ul><li>Book 3 nights and get the 4th night free.</li><li>Early bird special: 10% off on bookings made 30 days in advance.</li></ul><p>Experience the best in hospitality at the Grand Oasis Hotel—where your comfort is our priority.</p>', '2025-02-01', '2025-02-28', 'FREE LUNCH WITH HOTEL BOOKING', 1999, 1099, '50', 1, 0, '2025-01-28 08:48:48', '2025-01-28 08:48:48'),
(40, '8ac2ddf0-db90-477c-941f-014108b77e91', 60, 9, 23, 'Teeth Cleaning and Whitening Package at Woodbine Dental Hygiene Clinic (C$370 Value)', '<p><span style=\"color: rgb(55, 65, 81);\">Promotional value expires 120 days after purchase. Amount paid never expires. Not valid for clients active within the past 12 month(s). 24-hour cancellation notice required. Appointment required. Must sign waiver. Consultation required before service. If you are ineligible, a refund will be provided. Appointment subject to availability. The appointment can be rescheduled once within the cancellation period. The dental cleaning session is limited to 40-minutes only. The in-office whitening session is limited to a one-time 15-minute session only. $20 materials fee must be paid at time at time of appointment, cash only. Complete cleaning not applicable for client/individual who requires more than 40 minutes of scaling due to specific oral health condition. For teeth whitening: Not all clients are suitable for procedure and results may vary.&nbsp;</span><span style=\"color: var(--tw-prose-bold);\">For Restrictions Apply options: Limit 1 per person, may buy 1 additional as gift(s).&nbsp;</span><span style=\"color: rgb(55, 65, 81);\">Merchant is solely responsible to purchasers for the care and quality of the advertised goods and services. Learn about&nbsp;</span><a href=\"https://www.groupon.com/legal/pricing-transparency\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: var(--tw-prose-links);\">Strike-Through Pricing and Savings</a></p>', NULL, NULL, 'complete teeth cleaning and whitening package', 599, 499, '1000', 1, 0, '2025-01-28 09:40:47', '2025-01-28 09:40:47'),
(41, 'd5755b1a-567e-4bfc-8a74-cdebe729d560', 59, 3, 5, 'HOTEL BOOKING DEAL', '<h3><strong>Hotel Features &amp; Amenities</strong></h3><ul><li><strong>Prime Location:</strong> Just minutes away from popular attractions, restaurants, and shopping districts.</li><li><strong>On-Site Dining:</strong> Enjoy a variety of cuisines at our award-winning restaurant, or unwind with cocktails at the rooftop bar.</li><li><strong>Spa &amp; Wellness Center:</strong> Rejuvenate with a relaxing massage, sauna, or fitness session in our state-of-the-art gym.</li><li><strong>Business Center:</strong> Equipped with high-speed internet, meeting rooms, and audiovisual facilities for corporate guests.</li><li><strong>Family-Friendly Services:</strong> Dedicated play areas for kids and babysitting services available upon request.</li><li><strong>24/7 Concierge:</strong> Personalized assistance for tours, transport, and special requests.</li></ul>', '2025-01-25', '2025-01-25', 'Standard Room', 1999, 1299, '500', 1, 0, '2025-01-28 12:15:13', '2025-01-28 12:15:13'),
(42, '8ac2ddf0-db90-477c-941f-014108b77e91', 59, 5, 11, 'Luxury Fragrance Deals', '<h4><strong>Discover Your Signature Scent – Irresistible Deals on Premium Perfumes</strong></h4><p>Elevate your everyday style with our exclusive perfume deals. Whether you prefer floral, woody, or citrusy fragrances, our curated selection offers something for everyone. Perfect as a gift or an indulgence for yourself, these perfumes promise to leave a lasting impression.</p>', NULL, NULL, 'Eternal Bloom (50ml)', 1699, 1499, '500', 1, 0, '2025-01-28 12:39:57', '2025-01-28 12:39:57'),
(43, '8ac2ddf0-db90-477c-941f-014108b77e91', 59, 5, 12, 'Luxury Fragrance Deals', '<h4><strong>Discover Your Signature Scent – Irresistible Deals on Premium Perfumes</strong></h4><p>Elevate your everyday style with our exclusive perfume deals. Whether you prefer floral, woody, or citrusy fragrances, our curated selection offers something for everyone. Perfect as a gift or an indulgence for yourself, these perfumes promise to leave a lasting impression.</p>', NULL, NULL, 'Midnight Oud (100ml)', 2799, 2299, '100', 1, 0, '2025-01-29 09:26:42', '2025-01-29 09:26:42'),
(44, '8ac2ddf0-db90-477c-941f-014108b77e91', 57, 2, 3, 'FALT 90% OFF ON SELECTED HOTEL', '<h4>Niagara Falls, Ontario: Panoramic Views of the Falls near Vegas-Style Casinos and Water Parks</h4><p>At Niagara Falls, water thunders downward from a height of nearly 200 feet, crashing onto craggy boulders below. The falls straddle the border between Canada and the United States, but the Canadian side of the Niagara River is universally hailed as the finest vantage point to take in all three of Niagara Falls\' photogenic brinks: American, Bridal Veil, and Horseshoe Falls.</p><p>Hornblower cruises ferry raincoat-clad passengers around the base of the falls from April to October, depending on the river\'s ice conditions. Year-round, Journey Behind the Falls grants a glimpse behind the curtain of Horseshoe Falls—visitors board an elevator that descends 150 feet into the bedrock, then stand at an observation deck steps from the cascading water. A 10-minute walk from the falls is the neon-lit Clifton Hill neighborhood. Its Fallsview Boulevard has plenty of Vegas-style kitsch, including glitzy casinos and indoor wasster parks.</p>', '2025-01-18', '2025-01-26', 'DELUX HOTEL', 1099, 599, '50', 1, 0, '2025-01-29 09:42:43', '2025-01-29 09:42:43'),
(45, '8ac2ddf0-db90-477c-941f-014108b77e91', 59, 4, 8, 'Taste Fest Combo Deals', '<h4><strong>Savor the Flavors – Delicious Meals at Unbeatable Prices!</strong></h4><p>Whether you\'re craving classic comfort food, exotic dishes, or a hearty family meal, our exclusive <strong>Taste Fest Combo Deals</strong> have something for everyone. Perfect for dine-in, takeaway, or delivery, these deals are crafted to satisfy your cravings while being easy on your wallet.</p>', NULL, NULL, 'Classic Burger Meal', 399, 299, '5000', 1, 0, '2025-01-29 12:27:09', '2025-01-29 12:27:09'),
(46, '8ac2ddf0-db90-477c-941f-014108b77e91', 59, 4, 8, 'Taste Fest Combo Deals', '<h4><strong>Savor the Flavors – Delicious Meals at Unbeatable Prices!</strong></h4><p>Whether you\'re craving classic comfort food, exotic dishes, or a hearty family meal, our exclusive <strong>Taste Fest Combo Deals</strong> have something for everyone. Perfect for dine-in, takeaway, or delivery, these deals are crafted to satisfy your cravings while being easy on your wallet.</p>', NULL, NULL, 'Classic Burger Meal', 399, 299, '5000', 1, 0, '2025-01-29 14:39:25', '2025-01-29 14:39:25'),
(47, '8ac2ddf0-db90-477c-941f-014108b77e91', 57, 2, 3, 'FALT 90% OFF ON SELECTED NEW HOTEL', '<h4>Niagara Falls, Ontario: Panoramic Views of the Falls near Vegas-Style Casinos and Water Parks</h4><p>At Niagara Falls, water thunders downward from a height of nearly 200 feet, crashing onto craggy boulders below. The falls straddle the border between Canada and the United States, but the Canadian side of the Niagara River is universally hailed as the finest vantage point to take in all three of Niagara Falls\' photogenic brinks: American, Bridal Veil, and Horseshoe Falls.</p><p>Hornblower cruises ferry raincoat-clad passengers around the base of the falls from April to October, depending on the river\'s ice conditions. Year-round, Journey Behind the Falls grants a glimpse behind the curtain of Horseshoe Falls—visitors board an elevator that descends 150 feet into the bedrock, then stand at an observation deck steps from the cascading water. A 10-minute walk from the falls is the neon-lit Clifton Hill neighborhood. Its Fallsview Boulevard has plenty of Vegas-style kitsch, including glitzy casinos and indoor wasster parks.</p>', '2025-01-18', '2025-01-26', 'DELUX HOTEL', 1099, 599, '50', 1, 0, '2025-01-30 05:38:26', '2025-01-30 05:38:26'),
(48, '8ac2ddf0-db90-477c-941f-014108b77e91', 59, 5, 12, 'Luxury Fragrance Deals', '<h4><strong>Discover Your Signature Scent – Irresistible Deals on Premium Perfumes</strong></h4><p>Elevate your everyday style with our exclusive perfume deals. Whether you prefer floral, woody, or citrusy fragrances, our curated selection offers something for everyone. Perfect as a gift or an indulgence for yourself, these perfumes promise to leave a lasting impression.</p>', NULL, NULL, 'Midnight Oud (100ml)', 2799, 2299, '100', 1, 0, '2025-01-30 06:18:12', '2025-01-30 06:18:12'),
(49, '8ac2ddf0-db90-477c-941f-014108b77e91', 59, 3, 7, 'HOTEL BOOKING DEAL', '<h3><strong>Hotel Features &amp; Amenities</strong></h3><ul><li><strong>Prime Location:</strong> Just minutes away from popular attractions, restaurants, and shopping districts.</li><li><strong>On-Site Dining:</strong> Enjoy a variety of cuisines at our award-winning restaurant, or unwind with cocktails at the rooftop bar.</li><li><strong>Spa &amp; Wellness Center:</strong> Rejuvenate with a relaxing massage, sauna, or fitness session in our state-of-the-art gym.</li><li><strong>Business Center:</strong> Equipped with high-speed internet, meeting rooms, and audiovisual facilities for corporate guests.</li><li><strong>Family-Friendly Services:</strong> Dedicated play areas for kids and babysitting services available upon request.</li><li><strong>24/7 Concierge:</strong> Personalized assistance for tours, transport, and special requests.</li></ul>', '2025-01-25', '2025-01-25', 'Presidential Suite', 3999, 2999, '150', 1, 0, '2025-01-30 06:33:12', '2025-01-30 06:33:12'),
(50, '8ac2ddf0-db90-477c-941f-014108b77e91', 57, 32, 25, 'Flat 100rs Off Next Hotel Booking', '<p><strong>Welcome to Grand Oasis Hotel</strong></p><p>Escape to the tranquil comfort of the Grand Oasis Hotel, where luxury meets convenience in the heart of the city. Our state-of-the-art amenities and unparalleled service ensure a stay like no other. Whether you\'re here for business, leisure, or a romantic getaway, the Grand Oasis offers a wide range of services tailored to meet all your needs.</p><p><strong>Room Features:</strong></p><ul><li><strong>Deluxe King Suite</strong>: Spacious, elegantly furnished, with a stunning city view. Enjoy a king-size bed, smart TV, and a marble ensuite bathroom.</li><li><strong>Standard Double Room</strong>: A perfect option for both business travelers and tourists. Includes free high-speed Wi-Fi, a work desk, and plush bedding for a restful night.</li><li><strong>Executive Penthouse</strong>: Indulge in the ultimate luxury with panoramic views, a private terrace, and exclusive access to our executive lounge.</li></ul><p><strong>Hotel Amenities:</strong></p><ul><li><strong>24/7 Concierge Service</strong>: Need recommendations or assistance? Our concierge is available round-the-clock to cater to your needs.</li><li><strong>Spa &amp; Wellness Center</strong>: Relax and rejuvenate with a variety of spa treatments, including massages, facials, and wellness therapies.</li><li><strong>On-site Restaurant</strong>: Savor international cuisine at our restaurant, where gourmet dishes are prepared using the freshest local ingredients.</li><li><strong>Infinity Pool</strong>: Take a dip in our outdoor pool with stunning views of the city skyline.</li></ul><p><strong>Location:</strong> Located just 5 minutes from the central business district and 15 minutes from the nearest airport, the Grand Oasis is ideally positioned for both work and leisure. Enjoy easy access to shopping malls, historic landmarks, and vibrant nightlife.</p><p><strong>Special Offers:</strong></p><ul><li>Book 3 nights and get the 4th night free.</li><li>Early bird special: 10% off on bookings made 30 days in advance.</li></ul><p>Experience the best in hospitality at the Grand Oasis Hotel—where your comfort is our priority.</p>', '2025-02-01', '2025-02-28', 'FREE LUNCH WITH HOTEL BOOKING', 1999, 1099, '50', 1, 0, '2025-01-31 09:40:05', '2025-01-31 09:40:05'),
(51, '8ac2ddf0-db90-477c-941f-014108b77e91', 59, 4, 8, 'Taste Fest Combo Deals', '<h4><strong>Savor the Flavors – Delicious Meals at Unbeatable Prices!</strong></h4><p>Whether you\'re craving classic comfort food, exotic dishes, or a hearty family meal, our exclusive <strong>Taste Fest Combo Deals</strong> have something for everyone. Perfect for dine-in, takeaway, or delivery, these deals are crafted to satisfy your cravings while being easy on your wallet.</p>', NULL, NULL, 'Classic Burger Meal', 399, 299, '5000', 1, 0, '2025-02-03 08:38:58', '2025-02-03 08:38:58'),
(52, '8ac2ddf0-db90-477c-941f-014108b77e91', 58, 1, 2, 'Zomoto 10% off', '<p>Zomoto 10% off</p>', NULL, NULL, 'Zomoto 20% off', 1200, 1000, '50', 1, 0, '2025-02-08 08:55:36', '2025-02-08 08:55:36');
INSERT INTO `user_subscribe_deal` (`user_subscribe_deal_id`, `Customer_GUID`, `vendorid`, `deal_id`, `deal_option_id`, `deal_title`, `deal_des`, `dealvalidity_fromdate`, `dealvalidity_todate`, `option_title`, `regular_price`, `pricecut_price`, `monthly_voucher`, `iStatus`, `isDelete`, `created_at`, `updated_at`) VALUES
(53, '8ac2ddf0-db90-477c-941f-014108b77e91', 78, 3, 7, 'HOTEL BOOKING DEAL', '<h3><strong>Hotel Features &amp; Amenities</strong></h3><ul><li><strong>Prime Location:</strong> Just minutes away from popular attractions, restaurants, and shopping districts.</li><li><strong>On-Site Dining:</strong> Enjoy a variety of cuisines at our award-winning restaurant, or unwind with cocktails at the rooftop bar.</li><li><strong>Spa &amp; Wellness Center:</strong> Rejuvenate with a relaxing massage, sauna, or fitness session in our state-of-the-art gym.</li><li><strong>Business Center:</strong> Equipped with high-speed internet, meeting rooms, and audiovisual facilities for corporate guests.</li><li><strong>Family-Friendly Services:</strong> Dedicated play areas for kids and babysitting services available upon request.</li><li><strong>24/7 Concierge:</strong> Personalized assistance for tours, transport, and special requests.</li></ul>', '2025-01-25', '2025-01-25', 'Presidential Suite', 3999, 2999, '150', 1, 0, '2025-02-12 11:33:39', '2025-02-12 11:33:39'),
(54, '8ac2ddf0-db90-477c-941f-014108b77e91', 78, 2, 3, 'FALT 90% OFF ON SELECTED NEW HOTEL', '<h4>Niagara Falls, Ontario: Panoramic Views of the Falls near Vegas-Style Casinos and Water Parks</h4><p>At Niagara Falls, water thunders downward from a height of nearly 200 feet, crashing onto craggy boulders below. The falls straddle the border between Canada and the United States, but the Canadian side of the Niagara River is universally hailed as the finest vantage point to take in all three of Niagara Falls\' photogenic brinks: American, Bridal Veil, and Horseshoe Falls.</p><p>Hornblower cruises ferry raincoat-clad passengers around the base of the falls from April to October, depending on the river\'s ice conditions. Year-round, Journey Behind the Falls grants a glimpse behind the curtain of Horseshoe Falls—visitors board an elevator that descends 150 feet into the bedrock, then stand at an observation deck steps from the cascading water. A 10-minute walk from the falls is the neon-lit Clifton Hill neighborhood. Its Fallsview Boulevard has plenty of Vegas-style kitsch, including glitzy casinos and indoor wasster parks.</p>', '2025-01-18', '2025-01-26', 'DELUX HOTEL', 1099, 599, '50', 1, 0, '2025-02-14 10:58:03', '2025-02-14 10:58:03'),
(55, 'c4c9937f-8902-4cd1-9bd2-585824bb6581', 58, 1, 1, 'Zomoto 10% off', '<p>Zomoto 10% off</p>', NULL, NULL, 'Zomto 10% off', 1200, 1000, '50', 1, 0, '2025-04-04 06:43:42', '2025-04-04 06:43:42'),
(56, '3b43a6a2-13e2-49f1-9f4f-5a16247a2053', 78, 55, 40, 'demotesting', '<p>demotesting</p>', '2025-05-07', '2025-05-08', 'clothes', 1000, 950, '500', 1, 0, '2025-05-06 09:52:28', '2025-05-06 09:52:28'),
(57, '3b43a6a2-13e2-49f1-9f4f-5a16247a2053', 59, 5, 13, 'Luxury Fragrance Deals', '<h4><strong>Discover Your Signature Scent – Irresistible Deals on Premium Perfumes</strong></h4><p>Elevate your everyday style with our exclusive perfume deals. Whether you prefer floral, woody, or citrusy fragrances, our curated selection offers something for everyone. Perfect as a gift or an indulgence for yourself, these perfumes promise to leave a lasting impression.</p>', NULL, NULL, 'Citrus Fresh Splash (75ml)', 999, 599, '500', 1, 0, '2025-05-06 09:54:45', '2025-05-06 09:54:45'),
(58, '7e4fcbb3-e1d2-40a4-9c60-2e1239bc5bd0', 59, 5, 13, 'Luxury Fragrance Deals', '<h4><strong>Discover Your Signature Scent – Irresistible Deals on Premium Perfumes</strong></h4><p>Elevate your everyday style with our exclusive perfume deals. Whether you prefer floral, woody, or citrusy fragrances, our curated selection offers something for everyone. Perfect as a gift or an indulgence for yourself, these perfumes promise to leave a lasting impression.</p>', NULL, NULL, 'Citrus Fresh Splash (75ml)', 999, 599, '500', 1, 0, '2025-06-11 05:54:21', '2025-06-11 05:54:21'),
(59, '7e4fcbb3-e1d2-40a4-9c60-2e1239bc5bd0', 78, 55, 40, 'demotesting', '<p>demotesting</p>', '2025-05-07', '2025-05-08', 'clothes', 1000, 950, '500', 1, 0, '2025-06-11 06:10:29', '2025-06-11 06:10:29'),
(60, '7e4fcbb3-e1d2-40a4-9c60-2e1239bc5bd0', 77, 47, 34, 'test', '<p>test test</p>', '2025-02-15', '2025-02-28', 'test2', 5000, 2500, '50', 1, 0, '2025-06-11 06:14:20', '2025-06-11 06:14:20'),
(61, 'bf10bdba-2b23-4836-b2a9-fe52bb90b0ec', 59, 3, 7, 'HOTEL BOOKING DEAL', '<h3><strong>Hotel Features &amp; Amenities</strong></h3><ul><li><strong>Prime Location:</strong> Just minutes away from popular attractions, restaurants, and shopping districts.</li><li><strong>On-Site Dining:</strong> Enjoy a variety of cuisines at our award-winning restaurant, or unwind with cocktails at the rooftop bar.</li><li><strong>Spa &amp; Wellness Center:</strong> Rejuvenate with a relaxing massage, sauna, or fitness session in our state-of-the-art gym.</li><li><strong>Business Center:</strong> Equipped with high-speed internet, meeting rooms, and audiovisual facilities for corporate guests.</li><li><strong>Family-Friendly Services:</strong> Dedicated play areas for kids and babysitting services available upon request.</li><li><strong>24/7 Concierge:</strong> Personalized assistance for tours, transport, and special requests.</li></ul>', '2025-01-25', '2025-01-25', 'Presidential Suite', 3999, 2999, '150', 1, 0, '2025-06-19 11:21:12', '2025-06-19 11:21:12'),
(62, 'd5cd83b1-b977-44e5-ab88-83a3caf94b06', 78, 2, 4, 'FALT 90% OFF ON SELECTED NEW HOTEL', '<h4>Niagara Falls, Ontario: Panoramic Views of the Falls near Vegas-Style Casinos and Water Parks</h4><p>At Niagara Falls, water thunders downward from a height of nearly 200 feet, crashing onto craggy boulders below. The falls straddle the border between Canada and the United States, but the Canadian side of the Niagara River is universally hailed as the finest vantage point to take in all three of Niagara Falls\' photogenic brinks: American, Bridal Veil, and Horseshoe Falls.</p><p>Hornblower cruises ferry raincoat-clad passengers around the base of the falls from April to October, depending on the river\'s ice conditions. Year-round, Journey Behind the Falls grants a glimpse behind the curtain of Horseshoe Falls—visitors board an elevator that descends 150 feet into the bedrock, then stand at an observation deck steps from the cascading water. A 10-minute walk from the falls is the neon-lit Clifton Hill neighborhood. Its Fallsview Boulevard has plenty of Vegas-style kitsch, including glitzy casinos and indoor wasster parks.</p>', '2025-01-18', '2025-01-26', 'NON-AC ROOM', 599, 299, '100', 1, 0, '2025-06-19 12:09:31', '2025-06-19 12:09:31'),
(63, 'd5cd83b1-b977-44e5-ab88-83a3caf94b06', 78, 4, 9, 'Taste Fest Combo Deals', '<h4><strong>Savor the Flavors – Delicious Meals at Unbeatable Prices!</strong></h4><p>Whether you\'re craving classic comfort food, exotic dishes, or a hearty family meal, our exclusive <strong>Taste Fest Combo Deals</strong> have something for everyone. Perfect for dine-in, takeaway, or delivery, these deals are crafted to satisfy your cravings while being easy on your wallet.</p>', NULL, NULL, 'Pizza Mania Combo', 599, 499, '1000', 1, 0, '2025-06-25 09:14:18', '2025-06-25 09:14:18'),
(64, 'd5cd83b1-b977-44e5-ab88-83a3caf94b06', 78, 3, 6, 'HOTEL BOOKING DEAL', '<h3><strong>Hotel Features &amp; Amenities</strong></h3><ul><li><strong>Prime Location:</strong> Just minutes away from popular attractions, restaurants, and shopping districts.</li><li><strong>On-Site Dining:</strong> Enjoy a variety of cuisines at our award-winning restaurant, or unwind with cocktails at the rooftop bar.</li><li><strong>Spa &amp; Wellness Center:</strong> Rejuvenate with a relaxing massage, sauna, or fitness session in our state-of-the-art gym.</li><li><strong>Business Center:</strong> Equipped with high-speed internet, meeting rooms, and audiovisual facilities for corporate guests.</li><li><strong>Family-Friendly Services:</strong> Dedicated play areas for kids and babysitting services available upon request.</li><li><strong>24/7 Concierge:</strong> Personalized assistance for tours, transport, and special requests.</li></ul>', '2025-01-25', '2025-01-25', 'Deluxe Room', 2999, 2099, '100', 1, 0, '2025-06-25 09:21:23', '2025-06-25 09:21:23'),
(65, 'd5cd83b1-b977-44e5-ab88-83a3caf94b06', 78, 1, 2, 'Zomoto 10% off', '<p>Zomoto 10% off</p>', NULL, NULL, 'Zomoto 20% off', 1200, 1000, '50', 1, 0, '2025-06-25 09:21:45', '2025-06-25 09:21:45'),
(66, 'd5cd83b1-b977-44e5-ab88-83a3caf94b06', 78, 5, 12, 'Luxury Fragrance Deals', 'Discover Your Signature Scent – Irresistible Deals on Premium PerfumesElevate your everyday style with our exclusive perfume deals. Whether you prefer floral, woody, or citrusy fragrances, our curated selection offers something for everyone. Perfect as a gift or an indulgence for yourself, these perfumes promise to leave a lasting impression.', NULL, NULL, 'Midnight Oud (100ml)', 2799, 2299, '100', 1, 0, '2025-07-24 13:37:33', '2025-07-24 13:37:33'),
(67, 'd5cd83b1-b977-44e5-ab88-83a3caf94b06', 78, 6, 15, 'Mega Smartphone Fest', 'Unbeatable Deals on the Latest Smartphones – Upgrade Your Mobile Today!Looking for the best smartphone at the best price? Our Mega Smartphone Fest offers exclusive discounts on top brands and the latest models. Whether you need a feature-packed flagship or a budget-friendly device, we’ve got you covered.', NULL, NULL, 'iPhone 14 Mini', 64900, 58499, '500', 1, 0, '2025-07-24 13:38:41', '2025-07-24 13:38:41'),
(68, 'd5cd83b1-b977-44e5-ab88-83a3caf94b06', 78, 6, 15, 'Mega Smartphone Fest', 'Unbeatable Deals on the Latest Smartphones – Upgrade Your Mobile Today!Looking for the best smartphone at the best price? Our Mega Smartphone Fest offers exclusive discounts on top brands and the latest models. Whether you need a feature-packed flagship or a budget-friendly device, we’ve got you covered.', NULL, NULL, 'iPhone 14 Mini', 64900, 58499, '500', 1, 0, '2025-07-24 13:38:41', '2025-07-24 13:38:41'),
(69, 'd5cd83b1-b977-44e5-ab88-83a3caf94b06', 78, 6, 15, 'Mega Smartphone Fest', 'Unbeatable Deals on the Latest Smartphones – Upgrade Your Mobile Today!Looking for the best smartphone at the best price? Our Mega Smartphone Fest offers exclusive discounts on top brands and the latest models. Whether you need a feature-packed flagship or a budget-friendly device, we’ve got you covered.', NULL, NULL, 'iPhone 14 Mini', 64900, 58499, '500', 1, 0, '2025-07-24 13:38:41', '2025-07-24 13:38:41'),
(70, 'd5cd83b1-b977-44e5-ab88-83a3caf94b06', 78, 6, 15, 'Mega Smartphone Fest', 'Unbeatable Deals on the Latest Smartphones – Upgrade Your Mobile Today!Looking for the best smartphone at the best price? Our Mega Smartphone Fest offers exclusive discounts on top brands and the latest models. Whether you need a feature-packed flagship or a budget-friendly device, we’ve got you covered.', NULL, NULL, 'iPhone 14 Mini', 64900, 58499, '500', 1, 0, '2025-07-24 13:38:41', '2025-07-24 13:38:41'),
(71, 'd5cd83b1-b977-44e5-ab88-83a3caf94b06', 78, 4, 9, 'Taste Fest Combo Deals', '<h4><strong>Savor the Flavors – Delicious Meals at Unbeatable Prices!</strong></h4><p>Whether you\'re craving classic comfort food, exotic dishes, or a hearty family meal, our exclusive <strong>Taste Fest Combo Deals</strong> have something for everyone. Perfect for dine-in, takeaway, or delivery, these deals are crafted to satisfy your cravings while being easy on your wallet.</p>', NULL, NULL, 'Pizza Mania Combo', 599, 499, '1000', 1, 0, '2025-06-25 09:14:18', '2025-06-25 09:14:18'),
(72, 'd5cd83b1-b977-44e5-ab88-83a3caf94b06', 78, 44, 31, 'test', '<p>test</p>', '2025-01-25', '2025-01-31', 'test', 2000, 1500, '500', 1, 0, '2025-07-25 12:53:05', '2025-07-25 12:53:05'),
(73, 'd5cd83b1-b977-44e5-ab88-83a3caf94b06', 78, 62, 9, 'Groceries & Markets', 'demo testing', '2025-07-07', '2025-07-09', 'Pizza Mania Combo', 599, 499, '1000', 1, 0, '2025-07-25 12:55:27', '2025-07-25 12:55:27'),
(74, 'd5cd83b1-b977-44e5-ab88-83a3caf94b06', 78, 39, 29, 'Zudio Sale 50% Off On Winter Wear', '\"Winter Wonders Await! ❄️ Shop the Zudio Winter Sale and enjoy stylish warmth at unbeatable prices. Jackets, sweaters, and more starting at just ₹499! Hurry, offers valid till stocks last!\"', '2025-02-01', '2025-02-28', 'winter wear', 999, 799, '50', 1, 0, '2025-07-25 12:58:30', '2025-07-25 12:58:30'),
(75, 'd5cd83b1-b977-44e5-ab88-83a3caf94b06', 78, 61, 41, 'Pizza', 'testing', '2025-07-03', '2025-07-16', 'pizaa', 220, 200, '100', 1, 0, '2025-07-28 08:41:21', '2025-07-28 08:41:21'),
(76, 'd5cd83b1-b977-44e5-ab88-83a3caf94b06', 60, 10, 24, 'Up To 49% Off On Salon - Women\'s Haircut At Pure Self Salon N Spa', 'Promotional value expires 180 days after purchase. Amount paid never expires. Appointment required, contact by phone at +1 905 604 7873. May be repurchased every 30 days. Limit 3 per person. Merchant is solely responsible to purchasers for the care and quality of the advertised goods and services. Learn about&nbsp;Strike-Through Pricing and Savings', '2025-01-01', '2025-01-10', 'Skilled stylists give the client new style with cuts to create a fresh look', 5999, 4999, '100', 1, 0, '2025-07-28 08:46:00', '2025-07-28 08:46:00');

-- --------------------------------------------------------

--
-- Table structure for table `vendor`
--

CREATE TABLE `vendor` (
  `vendor_id` int(11) NOT NULL,
  `vendorname` varchar(255) DEFAULT NULL,
  `vendormobile` varchar(255) DEFAULT NULL,
  `vendorimg` varchar(255) DEFAULT NULL,
  `vendoraddress` varchar(255) DEFAULT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `vendorstate` int(255) DEFAULT NULL,
  `vendorcity` varchar(255) DEFAULT NULL,
  `vendorcity_name` varchar(255) DEFAULT NULL,
  `login_id` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `facbooklink` varchar(255) DEFAULT NULL,
  `instragramlink` varchar(255) DEFAULT NULL,
  `businessname` varchar(255) DEFAULT NULL,
  `businessaddress` varchar(255) DEFAULT NULL,
  `vendorsocialpage` varchar(255) DEFAULT NULL,
  `businesscategory` varchar(255) DEFAULT NULL,
  `businessubcategory` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `deal_id` int(255) DEFAULT NULL,
  `deviceToken` varchar(255) DEFAULT NULL,
  `otp` varchar(255) DEFAULT NULL,
  `is_changepasswordfirsttime` varchar(255) NOT NULL DEFAULT '0',
  `isOtpVerified` varchar(255) NOT NULL DEFAULT '0',
  `expiry_time` timestamp NULL DEFAULT NULL,
  `iStatus` int(11) DEFAULT '1',
  `isDelete` int(11) DEFAULT '0',
  `strIP` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vendor`
--

INSERT INTO `vendor` (`vendor_id`, `vendorname`, `vendormobile`, `vendorimg`, `vendoraddress`, `ip_address`, `email`, `vendorstate`, `vendorcity`, `vendorcity_name`, `login_id`, `password`, `facbooklink`, `instragramlink`, `businessname`, `businessaddress`, `vendorsocialpage`, `businesscategory`, `businessubcategory`, `latitude`, `longitude`, `deal_id`, `deviceToken`, `otp`, `is_changepasswordfirsttime`, `isOtpVerified`, `expiry_time`, `iStatus`, `isDelete`, `strIP`, `created_at`, `updated_at`) VALUES
(35, 'nisha', '9898808754', '1734615950_19122024191550.jpg', 'Isanpur', NULL, 'ai.dev.laravel@gmail.com', NULL, NULL, '', 'nisha', NULL, 'www.com', 'www.com', 'test', 'test', 'www.com', 'test', 'test', NULL, NULL, 26, NULL, '4973', '0', '1', '2024-12-18 12:15:33', 1, 0, '103.1.100.226', '2024-12-18 09:26:03', '2025-07-25 08:53:03'),
(41, 'Divya', '9100891052', NULL, 'Isanpur', NULL, 'divya@gmail.com', NULL, NULL, '', 'kirti', NULL, 'www.com', 'www.com', 'test', 'test', 'www.com', 'test', 'test', '22.99486735044983', '72.61293609424062', NULL, NULL, '679484', '1', '1', '2024-12-19 05:44:18', 1, 0, '103.1.100.226', '2024-12-19 05:41:18', '2025-07-25 08:53:33'),
(44, 'Mahesh', '9898808854', NULL, 'Narol', NULL, 'ai.dev.laravel@gmail.com', NULL, NULL, '', 'Apollo123', NULL, 'www.com', 'www.com', 'Food Factory1', 'Aashram Road1`', 'www.com', 'Ticketed Events', NULL, '22.99521443888314', '72.60411709372774', NULL, NULL, '180756', '1', '1', '2024-12-19 11:33:31', 1, 0, '103.1.100.226', '2024-12-19 11:30:31', '2025-07-25 08:53:50'),
(51, 'test11', '9898808988', '1735562295_30122024180815.png', 'Narol', NULL, 'test2@gmail.com', NULL, NULL, '', NULL, NULL, 'www.com', 'www.com', NULL, NULL, NULL, NULL, NULL, '22.995910130068165', '72.59637093148244', NULL, NULL, NULL, '0', '0', NULL, 1, 0, '103.1.100.226', '2024-12-30 12:38:15', '2025-07-25 08:54:46'),
(53, 'Apollo', '9898808851', NULL, 'Maninagar', NULL, 'ai.dev.laravel@gmail.com', 5, '41', '', 'Apollo', NULL, 'www.com', 'www.com', 'Digital Marketing', NULL, 'www.com', '23', NULL, '22.986752', '72.6040576', NULL, NULL, '172117', '1', '1', '2024-12-31 07:06:34', 1, 0, '103.1.100.226', '2024-12-31 07:03:34', '2025-07-25 08:55:22'),
(54, 'geeta', '9723151288', NULL, 'Iskcon Cross Road', NULL, 'ai.dev.laravel1@gmail.com', 5, '33', '', NULL, NULL, 'www.com', 'www.com', 'plastic', NULL, 'www.com', '23', NULL, NULL, NULL, NULL, NULL, '761517', '0', '1', '2025-01-07 09:17:12', 1, 0, '103.1.100.226', '2025-01-07 09:14:12', '2025-07-25 08:57:08'),
(57, 'Parth Vaishnav', '8460139822', '1738316246_31012025150726.jpeg', 'Vastraladad', NULL, 'parthv246@gmail.com', 5, '33', '', NULL, '$2y$12$G4FMXATQod29.VCYMfdi3OlJBlXuK561PUcaE771dvaHWN5OAuxP2', NULL, NULL, 'Apollo Infotech', NULL, 'hello.com', '24', NULL, '21.170240', '72.831062', NULL, NULL, '877421', '1', '1', '2025-01-09 13:34:28', 1, 0, '103.1.100.226', '2025-01-09 13:31:28', '2025-01-31 09:37:26'),
(58, 'Dray Duff', '7486984689', NULL, 'Narol', NULL, 'ai.dev.laravel1@gmail.com', 10, '43', '', NULL, '$2y$12$zzOCj50U4c.bKzD5k624lu1mo.gvLDA7sXDgh3Bo1F/.Y0.tftneC', NULL, NULL, 'Food Factory', NULL, 'www.com', '23', NULL, '22.986752', '72.6007808', NULL, NULL, '391313', '0', '1', '2025-01-11 06:41:19', 1, 0, '103.1.100.226', '2025-01-11 06:38:20', '2025-01-11 06:38:55'),
(59, 'Tarang Parmar', '7984305927', NULL, 'Bopal Ghuma', NULL, 'dev1.apolloinfotech@gmail.com', 5, '33', '', NULL, '$2y$12$G4FMXATQod29.VCYMfdi3OlJBlXuK561PUcaE771dvaHWN5OAuxP2', NULL, NULL, 'IT', NULL, 'apolloinfotech.com', '23', NULL, '22.986752', '72.6007808', NULL, NULL, '922590', '0', '1', '2025-01-11 12:07:46', 1, 0, '103.1.100.226', '2025-01-11 12:04:47', '2025-01-11 12:05:20'),
(60, 'Mihir Rathod', '9725123569', NULL, 'Isanpur Maninager', NULL, 'dev2.apolloinfotech@gmail.com', 57, '50', '', NULL, '$2y$12$G4FMXATQod29.VCYMfdi3OlJBlXuK561PUcaE771dvaHWN5OAuxP2', NULL, NULL, 'Cosmetic Product', NULL, 'sugarcosmetic.com', '23', NULL, '19.054999', '72.8692035', NULL, NULL, '585882', '0', '1', '2025-01-11 13:05:27', 1, 0, '103.1.100.226', '2025-01-11 13:02:27', '2025-01-11 13:03:01'),
(61, 'Bansari Patel', '9987654321', '1737005003_16012025105323.jpg', 'Sola', NULL, 'dev5.apolloinfotech@gmail.com', NULL, NULL, '', NULL, NULL, 'https://www.facebook.com/', 'https://www.instagram.com/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, 1, 0, '103.1.100.226', '2025-01-13 07:00:13', '2025-01-28 12:30:39'),
(62, 'Ravi Patel', '8565656565', '1736764844_13012025161044.png', 'Gokalpura', NULL, 'ai.dev.laravel9@gmail.com', 26, 'maninagar', '', NULL, '$2y$12$BQqEADPuyYcdHxl.KWJ8Ge/MkZp.6lo7gNOpSQFRrs0FHJlaOLUx2', NULL, NULL, 'Ravi PVT LTD', NULL, 'ravipatel.com', '26', NULL, '22.9854465', '72.6032779', NULL, NULL, '848958', '0', '1', '2025-01-13 10:38:15', 1, 0, '103.1.100.226', '2025-01-13 10:35:15', '2025-01-13 10:40:44'),
(69, 'Geeta', '7043447511', NULL, 'Narol', NULL, 'ai.dev.laravel@gmail.com', 57, '50', NULL, NULL, '$2y$12$8Egb3.e/yjts75oY9FBqne7n8SYH.KnzO4lLIWBMNwBt01GR4heiq', NULL, NULL, 'Food Factory', NULL, 'www.com', '23', NULL, '22.9854465', '72.6032779', NULL, NULL, '453793', '0', '1', '2025-01-13 12:58:30', 1, 0, '103.1.100.226', '2025-01-13 12:55:30', '2025-01-13 12:55:52'),
(70, 'Test Apollo', '9824773136', NULL, 'Bhairvnath Maninagar', NULL, 'bhavika.jan02@gmail.com', 5, '41', NULL, NULL, '$2y$12$.V6st/ITz/eMvLjk/q/EC.Cfo0fzMVyjehDo7hg0Ax.GGZb2Ws8bu', NULL, NULL, 'City Fashion', NULL, 'apolloinfotech.com', '24', NULL, '22.9854465', '72.6032779', NULL, NULL, '958270', '0', '1', '2025-01-20 06:01:05', 1, 0, '103.1.100.226', '2025-01-20 05:58:05', '2025-01-20 05:58:33'),
(74, 'faiz', '4567890876', NULL, 'Narol', NULL, 'ai.dev.laravel10@gmail.com', 5, '41', NULL, NULL, '$2y$12$.SVFaNSHZfZQHpGnNka6CuCln9rv8QJ/lGVDQn5.lORJUtQX5SvC6', NULL, NULL, 'Food Factory', NULL, 'www.com', '23', NULL, NULL, NULL, NULL, NULL, '190868', '0', '1', '2025-01-21 06:24:42', 1, 0, '103.1.100.226', '2025-01-21 06:21:42', '2025-01-21 06:22:04'),
(76, 'Ravi Patel', '7802801090', NULL, 'Bhairvnath', NULL, 'ravipatel8976@gmail.com', 5, '41', NULL, NULL, '$2y$12$23hzyjzUrBKBHtSCZlbHEu1IBYPWWKw6NkVFO4emkswcAj1slfun2', NULL, NULL, 'Apollo Infotech', NULL, NULL, '32', NULL, '22.9999238', '72.5515268', NULL, NULL, '149053', '0', '1', '2025-01-30 05:14:51', 1, 0, '103.1.100.226', '2025-01-30 05:11:51', '2025-01-30 05:12:22'),
(77, 'Bansari Patel', '9876541230', '1738671881_04022025175441.png', 'Ahmedabad', NULL, 'bansipatel4041@gmail.com', 5, '41', NULL, NULL, '$2y$12$5lMydzwuiIQE/AFtQpQk6Oh6d6q/Yg54xjaoL5jw1UhKXcopKmN.C', NULL, NULL, 'Apollo Infotech', NULL, '-', '32', NULL, '23.0031506', '72.5530056', NULL, NULL, '534331', '1', '1', '2025-02-04 06:45:04', 1, 0, '103.1.100.226', '2025-02-04 06:42:05', '2025-02-04 12:24:41'),
(78, 'harshita', '6354744741', '1753255493_23072025125453.jpg', 'Ahemdabad', NULL, 'vasaniharshita59@gmail.com', 5, '41', NULL, NULL, '$2y$12$LbMWtAuYmmEwnMHDpdIWhe/8DA28pq/96IPBELW6fyDuxWaQxdAwu', 'www.com', 'www.com', 'saleing', NULL, NULL, '37', NULL, '22.986752', '72.6040576', NULL, NULL, '8261', '0', '1', '2025-07-25 11:33:35', 1, 0, '103.1.100.226', '2025-05-06 05:32:42', '2025-07-25 11:31:14'),
(79, 'Mihir', '9054254223', NULL, 'Narol', NULL, 'dev3.apolloinfotech@gmail.com', 5, '41', NULL, NULL, '$2y$12$4dPiqdL4LnFYoWapmPt1F.GvECgiGVecyI9NCPX.7xb9q0II7CV4.', NULL, NULL, 'Food Factory', NULL, 'www.com', '36', NULL, NULL, NULL, NULL, NULL, '991876', '0', '1', '2025-07-23 10:31:08', 1, 0, '103.1.100.226', '2025-07-23 10:28:09', '2025-07-23 10:30:17'),
(80, 'Mignesh', '9904500629', NULL, 'Narol', NULL, 'dev7.apolloinfotech@gmail.com', 5, 'Ahmedabad', NULL, NULL, '$2y$12$e4yBA/pIoHLTpkghpfG6W.K1fW9rO4fyt4w6Ged6zCTPlYPMIVnZC', NULL, NULL, 'food factory', NULL, NULL, 'testing', NULL, NULL, NULL, NULL, NULL, '5136', '1', '1', '2025-07-23 11:25:31', 1, 0, '103.1.100.226', '2025-07-23 10:48:25', '2025-07-23 11:22:59');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `area-masters`
--
ALTER TABLE `area-masters`
  ADD PRIMARY KEY (`areaId`);

--
-- Indexes for table `base_url`
--
ALTER TABLE `base_url`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `career-masters`
--
ALTER TABLE `career-masters`
  ADD PRIMARY KEY (`iCareerInquiryId`);

--
-- Indexes for table `Categories`
--
ALTER TABLE `Categories`
  ADD PRIMARY KEY (`Categories_id`);

--
-- Indexes for table `city-masters`
--
ALTER TABLE `city-masters`
  ADD PRIMARY KEY (`cityId`),
  ADD KEY `stateMasterStateId` (`stateMasterStateId`);

--
-- Indexes for table `cms`
--
ALTER TABLE `cms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contactus-masters`
--
ALTER TABLE `contactus-masters`
  ADD PRIMARY KEY (`iContactId`);

--
-- Indexes for table `Customer`
--
ALTER TABLE `Customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `Customer_phone` (`Customer_phone`);

--
-- Indexes for table `Customer_Review`
--
ALTER TABLE `Customer_Review`
  ADD PRIMARY KEY (`Customer_Review_id`);

--
-- Indexes for table `Dealmultiimage`
--
ALTER TABLE `Dealmultiimage`
  ADD PRIMARY KEY (`Dealimage_id`);

--
-- Indexes for table `DealOption`
--
ALTER TABLE `DealOption`
  ADD PRIMARY KEY (`deal_option_id`);

--
-- Indexes for table `Deals`
--
ALTER TABLE `Deals`
  ADD PRIMARY KEY (`Deals_id`),
  ADD UNIQUE KEY `GUID` (`GUID`);

--
-- Indexes for table `Deals_old`
--
ALTER TABLE `Deals_old`
  ADD PRIMARY KEY (`Deals_id`);

--
-- Indexes for table `Deal_images`
--
ALTER TABLE `Deal_images`
  ADD PRIMARY KEY (`deal_image_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `faq-masters`
--
ALTER TABLE `faq-masters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fine_print`
--
ALTER TABLE `fine_print`
  ADD PRIMARY KEY (`finePrintId`);

--
-- Indexes for table `headerimage`
--
ALTER TABLE `headerimage`
  ADD PRIMARY KEY (`header_image_id`);

--
-- Indexes for table `Image`
--
ALTER TABLE `Image`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`) USING BTREE;

--
-- Indexes for table `offer_image`
--
ALTER TABLE `offer_image`
  ADD PRIMARY KEY (`offerimage_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `promocodes`
--
ALTER TABLE `promocodes`
  ADD PRIMARY KEY (`promo_id`),
  ADD UNIQUE KEY `GUID` (`GUID`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `role_permission`
--
ALTER TABLE `role_permission`
  ADD PRIMARY KEY (`permission_id`);

--
-- Indexes for table `sendemaildetails`
--
ALTER TABLE `sendemaildetails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `state-masters`
--
ALTER TABLE `state-masters`
  ADD PRIMARY KEY (`stateId`);

--
-- Indexes for table `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`iSubCategoryId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_subscribe_deal`
--
ALTER TABLE `user_subscribe_deal`
  ADD PRIMARY KEY (`user_subscribe_deal_id`);

--
-- Indexes for table `vendor`
--
ALTER TABLE `vendor`
  ADD PRIMARY KEY (`vendor_id`),
  ADD UNIQUE KEY `login_id` (`login_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `area-masters`
--
ALTER TABLE `area-masters`
  MODIFY `areaId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `base_url`
--
ALTER TABLE `base_url`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `career-masters`
--
ALTER TABLE `career-masters`
  MODIFY `iCareerInquiryId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Categories`
--
ALTER TABLE `Categories`
  MODIFY `Categories_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `city-masters`
--
ALTER TABLE `city-masters`
  MODIFY `cityId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `cms`
--
ALTER TABLE `cms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `contactus-masters`
--
ALTER TABLE `contactus-masters`
  MODIFY `iContactId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Customer`
--
ALTER TABLE `Customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `Customer_Review`
--
ALTER TABLE `Customer_Review`
  MODIFY `Customer_Review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Dealmultiimage`
--
ALTER TABLE `Dealmultiimage`
  MODIFY `Dealimage_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `DealOption`
--
ALTER TABLE `DealOption`
  MODIFY `deal_option_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `Deals`
--
ALTER TABLE `Deals`
  MODIFY `Deals_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `Deals_old`
--
ALTER TABLE `Deals_old`
  MODIFY `Deals_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `Deal_images`
--
ALTER TABLE `Deal_images`
  MODIFY `deal_image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faq-masters`
--
ALTER TABLE `faq-masters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `fine_print`
--
ALTER TABLE `fine_print`
  MODIFY `finePrintId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `headerimage`
--
ALTER TABLE `headerimage`
  MODIFY `header_image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `Image`
--
ALTER TABLE `Image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `offer_image`
--
ALTER TABLE `offer_image`
  MODIFY `offerimage_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `promocodes`
--
ALTER TABLE `promocodes`
  MODIFY `promo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `role_permission`
--
ALTER TABLE `role_permission`
  MODIFY `permission_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `sendemaildetails`
--
ALTER TABLE `sendemaildetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `setting`
--
ALTER TABLE `setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `state-masters`
--
ALTER TABLE `state-masters`
  MODIFY `stateId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `iSubCategoryId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_subscribe_deal`
--
ALTER TABLE `user_subscribe_deal`
  MODIFY `user_subscribe_deal_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `vendor`
--
ALTER TABLE `vendor`
  MODIFY `vendor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `city-masters`
--
ALTER TABLE `city-masters`
  ADD CONSTRAINT `city-masters_ibfk_1` FOREIGN KEY (`stateMasterStateId`) REFERENCES `state-masters` (`stateId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
