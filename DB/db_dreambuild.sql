-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 13, 2024 at 11:25 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_dreambuild`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `admin_id` int(10) UNSIGNED NOT NULL,
  `admin_username` varchar(50) NOT NULL,
  `admin_password` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`admin_id`, `admin_username`, `admin_password`) VALUES
(1, 'admin@gmail.com', 'admin@123');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_complaints`
--

CREATE TABLE `tbl_complaints` (
  `complaint_id` int(10) UNSIGNED NOT NULL,
  `complaint_title` varchar(50) DEFAULT NULL,
  `complaint_description` varchar(500) DEFAULT NULL,
  `complaint_date` date DEFAULT NULL,
  `complaint_status` int(10) UNSIGNED DEFAULT 0,
  `complaint_reply` varchar(150) DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `worker_id` int(10) UNSIGNED DEFAULT NULL,
  `landlord_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_complaints`
--

INSERT INTO `tbl_complaints` (`complaint_id`, `complaint_title`, `complaint_description`, `complaint_date`, `complaint_status`, `complaint_reply`, `user_id`, `worker_id`, `landlord_id`) VALUES
(4, 'freeland', 'no water', '2024-03-19', 0, NULL, NULL, NULL, 1),
(5, 'house', 'no money', '2024-03-19', 0, NULL, NULL, 1, NULL),
(6, 'bad', 'bad', '2024-04-13', 0, NULL, 2, NULL, NULL),
(7, 'carpenter', 'very bad ', '2024-04-13', 0, NULL, NULL, 9, NULL),
(8, 'enginner', 'your work is so bad', '2024-04-13', 0, NULL, NULL, 1, NULL),
(9, 'bad', 'bad', '2024-04-13', 0, NULL, 2, NULL, NULL),
(10, 'land', 'good', '2024-04-13', 0, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_district`
--

CREATE TABLE `tbl_district` (
  `district_id` int(10) UNSIGNED NOT NULL,
  `district_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_district`
--

INSERT INTO `tbl_district` (`district_id`, `district_name`) VALUES
(1, 'IDUKKI'),
(2, 'PALAKKAD'),
(3, 'KANNUR'),
(4, 'ERNAKULAM'),
(5, 'KOZHIKODE'),
(6, 'WAYANAD'),
(7, 'KASARGOD');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_feedback`
--

CREATE TABLE `tbl_feedback` (
  `feedback_id` int(10) UNSIGNED NOT NULL,
  `feedback_description` varchar(500) DEFAULT NULL,
  `feedback_date` date DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `worker_id` int(10) UNSIGNED DEFAULT NULL,
  `landlord_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_feedback`
--

INSERT INTO `tbl_feedback` (`feedback_id`, `feedback_description`, `feedback_date`, `user_id`, `worker_id`, `landlord_id`) VALUES
(2, 'good', '2024-03-13', NULL, NULL, 1),
(3, 'good', '2024-04-13', 2, NULL, NULL),
(4, 'good', '2024-04-13', NULL, 9, NULL),
(5, 'good', '2024-04-13', NULL, 1, NULL),
(6, 'good', '2024-04-13', 2, NULL, NULL),
(7, 'good', '2024-04-13', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_land`
--

CREATE TABLE `tbl_land` (
  `land_id` int(10) UNSIGNED NOT NULL,
  `land_image` varchar(50) DEFAULT NULL,
  `land_tokenamount` int(10) UNSIGNED DEFAULT NULL,
  `land_address` varchar(500) DEFAULT NULL,
  `landlord_id` int(10) UNSIGNED DEFAULT NULL,
  `land_status` int(10) UNSIGNED DEFAULT 0,
  `location_id` int(10) UNSIGNED DEFAULT NULL,
  `land_details` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_land`
--

INSERT INTO `tbl_land` (`land_id`, `land_image`, `land_tokenamount`, `land_address`, `landlord_id`, `land_status`, `location_id`, `land_details`) VALUES
(1, 'Land_1709.jpg', 5000, 'freeland parakadavu \r\n                        ', 1, 3, 1, ' 5 acre\r\n                        '),
(2, 'Land_1116.jpg', 1000, ' near suvarnagiri road\r\n                        ', 1, 0, 3, ' 3.5 acre\r\n                        '),
(3, 'Land_1762.jpg', 3000, '  near st.joseph school  Azhikkal   road           ', 1, 0, 7, ' 2.5 acre\r\n                        '),
(4, 'Land_1469.jpg', 5000, ' near nelliyampathy \r\n hills                       ', 1, 0, 5, ' 50  cent\r\n                        '),
(5, 'Land_1871.jpg', 3000, ' farm land khordha                      ', 1, 3, 12, ' 4 acre\r\n                       ');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_landbooking`
--

CREATE TABLE `tbl_landbooking` (
  `landbooking_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `land_id` int(10) UNSIGNED DEFAULT NULL,
  `booking_date` date DEFAULT NULL,
  `booked_date` date DEFAULT NULL,
  `landbooking_pstatus` int(10) UNSIGNED DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_landbooking`
--

INSERT INTO `tbl_landbooking` (`landbooking_id`, `user_id`, `land_id`, `booking_date`, `booked_date`, `landbooking_pstatus`) VALUES
(3, 1, 1, '2024-03-16', '2024-03-04', 3),
(4, 1, 1, '2024-03-19', '2024-03-12', 3),
(5, 1, 1, '2024-03-19', '2024-04-03', 3),
(6, 2, 1, '2024-04-13', '2024-05-08', 3),
(7, 2, 5, '2024-04-13', '2024-04-18', 3),
(8, 2, 3, '2024-04-13', '2024-04-02', 3),
(9, 2, 5, '2024-04-13', '2024-05-25', 3);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_landlord`
--

CREATE TABLE `tbl_landlord` (
  `landlord_id` int(10) UNSIGNED NOT NULL,
  `landlord_name` varchar(50) DEFAULT NULL,
  `landlord_gender` varchar(50) DEFAULT NULL,
  `landlord_contact` varchar(50) DEFAULT NULL,
  `landlord_email` varchar(50) DEFAULT NULL,
  `landlord_dob` date DEFAULT NULL,
  `landlord_doj` date DEFAULT NULL,
  `landlord_photo` varchar(50) DEFAULT NULL,
  `landlord_password` varchar(50) DEFAULT NULL,
  `landlord_proof` varchar(50) DEFAULT NULL,
  `landlord_vstatus` int(10) UNSIGNED DEFAULT 0,
  `place_id` int(10) UNSIGNED DEFAULT NULL,
  `landlord_address` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_landlord`
--

INSERT INTO `tbl_landlord` (`landlord_id`, `landlord_name`, `landlord_gender`, `landlord_contact`, `landlord_email`, `landlord_dob`, `landlord_doj`, `landlord_photo`, `landlord_password`, `landlord_proof`, `landlord_vstatus`, `place_id`, `landlord_address`) VALUES
(1, 'saji pg', 'Male', '9495187733', 'saji@gmail.com', '1988-01-20', '2024-03-13', 'Landlord_1832.png', 'saji', 'LandlordProof_2061.png', 1, 1, 'kuzhikkattukunnel (h) kolani p.o thodupuzha\r\n                        \r\n                        '),
(2, 'Gopi KJ', 'Male', '9574857654', 'gopi@gmail.com', '2000-06-12', '2024-03-13', 'Landlord_1228.jpg', 'gopi', 'LandlordProof_1525.jpg', 1, 15, 'Gopan heaven H Ranipuram Road Kasargod');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_latestwork`
--

CREATE TABLE `tbl_latestwork` (
  `lwork_id` int(10) UNSIGNED NOT NULL,
  `lwork_image` varchar(50) DEFAULT NULL,
  `lwork_amount` int(10) UNSIGNED DEFAULT NULL,
  `lwork_caption` varchar(100) DEFAULT NULL,
  `lwork_details` varchar(500) DEFAULT NULL,
  `worker_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_latestwork`
--

INSERT INTO `tbl_latestwork` (`lwork_id`, `lwork_image`, `lwork_amount`, `lwork_caption`, `lwork_details`, `worker_id`) VALUES
(1, 'LatestWork_1216.jpg', 2000, 'VASTU TIPS', ' \r\n     Hanging crystals                   ', 1),
(2, 'LatestWork_2045.jpg', 15000, 'architect design', ' 3000 sq.feet with swimming pool\r\n                        ', 2),
(3, 'LatestWork_1293.jpg', 20000, 'construction ', ' construction design \r\n                        ', 3),
(4, 'LatestWork_1638.jpg', 20000, 'design and build contractor', ' design and build contractor\r\n                        ', 4),
(5, 'LatestWork_1427.jpg', 15000, 'interior design in singapore', ' interior space planning,\r\n                        ', 5),
(6, 'LatestWork_1729.crdownload', 2000, 'Right -house painting', ' wallpaintaing           ', 6),
(7, 'LatestWork_2030.jpg', 35000, 'emerency plumber', ' \r\n        plumber on call                ', 7),
(8, 'LatestWork_1393.jpeg', 5000, 'electrician hourly works', ' electrician hourly works\r\n                        ', 8),
(9, 'LatestWork_1248.jpg', 15000, 'furniture', ' fast maintance\r\n                        ', 9);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_location`
--

CREATE TABLE `tbl_location` (
  `location_id` int(10) UNSIGNED NOT NULL,
  `location_name` varchar(50) NOT NULL,
  `place_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_location`
--

INSERT INTO `tbl_location` (`location_id`, `location_name`, `place_id`) VALUES
(1, 'PARAKADAVU', 1),
(2, 'PARAKADAVU', 2),
(3, 'VELLAYAMKUDY', 3),
(4, 'KAVA', 4),
(5, 'NELLIYAMPATHY', 5),
(6, 'EDAKADU', 6),
(7, 'AZHIKKAL', 7),
(8, 'FORT KOCHI', 8),
(9, 'VAZHAKULAM', 9),
(10, 'BEYPORE TEMPLE', 10),
(11, 'KAPPADE FOREST', 11),
(12, 'KHORDHA', 12),
(13, 'EDAKKAL CAVE', 13),
(14, 'BEKAL PORT', 14),
(15, 'RANIPURAM TEMPLE', 15);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_lworkbooking`
--

CREATE TABLE `tbl_lworkbooking` (
  `lworkbooking_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `lwork_id` int(10) UNSIGNED DEFAULT NULL,
  `booking_date` date DEFAULT NULL,
  `booked_date` date DEFAULT NULL,
  `lworkbooking_pstatus` int(10) UNSIGNED DEFAULT 0,
  `lworkbooking_cstatus` int(10) UNSIGNED DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_lworkbooking`
--

INSERT INTO `tbl_lworkbooking` (`lworkbooking_id`, `user_id`, `lwork_id`, `booking_date`, `booked_date`, `lworkbooking_pstatus`, `lworkbooking_cstatus`) VALUES
(1, 1, 1, '2024-03-13', '2024-03-27', 1, 3),
(2, 1, 1, '2024-04-13', '2024-04-09', 0, 0),
(3, 1, 1, '2024-04-13', '2024-04-17', 0, 1),
(5, 2, 2, '2024-04-13', '2024-04-18', 0, 3),
(6, 2, 2, '2024-04-13', '2024-04-19', 1, 3),
(7, 2, 1, '2024-04-13', '2024-05-11', 1, 3),
(8, 2, 1, '2024-04-13', '2024-05-11', 0, 0),
(9, 2, 9, '2024-04-13', '2024-04-20', 1, 3),
(10, 2, 1, '2024-04-13', '2024-04-25', 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_place`
--

CREATE TABLE `tbl_place` (
  `place_id` int(10) UNSIGNED NOT NULL,
  `place_name` varchar(50) NOT NULL,
  `district_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_place`
--

INSERT INTO `tbl_place` (`place_id`, `place_name`, `district_id`) VALUES
(1, 'THODUPUZHA', 1),
(2, 'KOLANI', 1),
(3, 'KATTAPPANA', 1),
(4, 'VETTIKKUNNU', 2),
(5, 'PARAMBIKULAM', 2),
(6, 'CHALA', 3),
(7, 'AZHIKODE', 3),
(8, 'KOCHI', 4),
(9, 'MUVATTUPUZHA', 4),
(10, 'BEYPORE', 5),
(11, 'KAPPADE', 5),
(12, 'KALPATTA', 6),
(13, 'EDAKKAL', 6),
(14, 'BEKAL', 7),
(15, 'RANIPURAM', 7);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_review`
--

CREATE TABLE `tbl_review` (
  `review_id` int(10) UNSIGNED NOT NULL,
  `review_datetime` datetime DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `user_rating` int(10) UNSIGNED DEFAULT NULL,
  `user_review` varchar(150) DEFAULT NULL,
  `worker_id` int(10) UNSIGNED DEFAULT NULL,
  `user_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_review`
--

INSERT INTO `tbl_review` (`review_id`, `review_datetime`, `user_id`, `user_rating`, `user_review`, `worker_id`, `user_name`) VALUES
(1, '2024-04-13 14:20:58', NULL, 4, 'tiyg', 9, 'ytv'),
(2, '2024-04-13 14:37:51', NULL, 4, 'si', 1, 'siyad');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_service`
--

CREATE TABLE `tbl_service` (
  `service_id` int(10) UNSIGNED NOT NULL,
  `service_title` varchar(50) DEFAULT NULL,
  `service_description` varchar(500) DEFAULT NULL,
  `service_amount` int(10) UNSIGNED DEFAULT NULL,
  `worker_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_service`
--

INSERT INTO `tbl_service` (`service_id`, `service_title`, `service_description`, `service_amount`, `worker_id`) VALUES
(1, 'predict the future', ' predict the future of the house\r\n                        ', 1001, 1),
(2, 'architect design', ' architect revies  drwawing based feeback owner\r\n                        ', 3000, 2),
(3, 'Design and drawing services', ' Design and drawing services\r\n                        ', 2300, 3),
(4, 'paperwork', ' design and build contractor\r\n                        ', 20000, 4),
(5, 'formation and engineering implementation', ' formation and engineering implementation\r\n                  ', 20000, 5),
(6, 'wallpaintaing', ' wallpaintaing             ', 2000, 6),
(7, 'he whole system of piping', ' he whole system of piping\r\n                        ', 2000, 7),
(8, 'Commercial electrician', ' Electrical installation,\r\nMaintenance Electrician\r\n                        ', 20000, 8),
(9, 'Cabinet installation', ' Cabinet installation\r\n                        ', 1001, 9);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_servicebooking`
--

CREATE TABLE `tbl_servicebooking` (
  `servicebooking_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `service_id` int(10) UNSIGNED DEFAULT NULL,
  `booking_date` date DEFAULT NULL,
  `booked_date` date DEFAULT NULL,
  `servicebooking_astatus` int(10) UNSIGNED DEFAULT 0,
  `servicebooking_pstatus` int(10) UNSIGNED DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_servicebooking`
--

INSERT INTO `tbl_servicebooking` (`servicebooking_id`, `user_id`, `service_id`, `booking_date`, `booked_date`, `servicebooking_astatus`, `servicebooking_pstatus`) VALUES
(1, 1, 1, '2024-04-13', '2024-04-30', 0, 0),
(2, 2, 1, '2024-04-13', '2024-05-08', 1, 0),
(3, 2, 1, '2024-04-13', '2024-04-25', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_servicegallery`
--

CREATE TABLE `tbl_servicegallery` (
  `sgallery_id` int(10) UNSIGNED NOT NULL,
  `sgallery_image` varchar(50) DEFAULT NULL,
  `service_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_servicegallery`
--

INSERT INTO `tbl_servicegallery` (`sgallery_id`, `sgallery_image`, `service_id`) VALUES
(1, 'Service_1085.avif', 1),
(2, 'Service_1755.jpg', 2),
(3, 'Service_1418.jpg', 3),
(4, 'Service_1056.jpg', 5),
(5, 'Service_1868.crdownload', 6),
(6, 'Service_1103.jpg', 7),
(7, 'Service_1863.jpeg', 8),
(8, 'Service_1872.jpg', 9);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_servicetype`
--

CREATE TABLE `tbl_servicetype` (
  `servicetype_id` int(10) UNSIGNED NOT NULL,
  `servicetype_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_servicetype`
--

INSERT INTO `tbl_servicetype` (`servicetype_id`, `servicetype_name`) VALUES
(1, 'predict the future'),
(2, 'analyze the positions of house'),
(3, 'Design and drawing services'),
(4, 'Paperwork'),
(5, 'Site Clearing.'),
(6, 'Laying the Foundation.'),
(7, 'Design and build services:'),
(8, 'Planning and managing'),
(9, 'interior space planning,'),
(10, 'formation and engineering implementation'),
(11, 'wallpaintaing'),
(12, 'Realstic painting'),
(13, 'he whole system of piping'),
(14, 'Commercial electrician'),
(15, 'Electrical installation'),
(16, 'Maintenance Electrician'),
(17, 'Cabinet installation'),
(18, 'furniture');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_contact` varchar(50) DEFAULT NULL,
  `user_email` varchar(50) DEFAULT NULL,
  `user_gender` varchar(50) DEFAULT NULL,
  `user_address` varchar(150) DEFAULT NULL,
  `user_dob` date DEFAULT NULL,
  `user_doj` date DEFAULT NULL,
  `user_photo` varchar(50) DEFAULT NULL,
  `user_password` varchar(50) DEFAULT NULL,
  `location_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`user_id`, `user_name`, `user_contact`, `user_email`, `user_gender`, `user_address`, `user_dob`, `user_doj`, `user_photo`, `user_password`, `location_id`) VALUES
(1, ' MATHEW', '9605381309', 'mathew29@gmail.com', 'Male', 'kombanaparambil(h)vellayamkudy (po) kattappana\r\n                        \r\n                        \r\n                        ', '1993-06-08', '2024-03-13', 'User_1391.webp', 'mathew', 3),
(2, 'siyad', '9778350198', 'siyad@gmail.com', 'Male', 'kombanaparambill H kattappana po vellayamkudy', '2003-10-25', '2024-04-13', 'User_2015.jpg', 'siyad', 3);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_wishlist`
--

CREATE TABLE `tbl_wishlist` (
  `wishlist_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `worker_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_wishlist`
--

INSERT INTO `tbl_wishlist` (`wishlist_id`, `user_id`, `worker_id`) VALUES
(1, 1, 1),
(2, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_work`
--

CREATE TABLE `tbl_work` (
  `work_id` int(10) UNSIGNED NOT NULL,
  `work_image` varchar(50) DEFAULT NULL,
  `work_caption` varchar(100) DEFAULT NULL,
  `worker_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_work`
--

INSERT INTO `tbl_work` (`work_id`, `work_image`, `work_caption`, `worker_id`) VALUES
(1, 'Work_1451.jpg', 'VASTU TIPS', 1),
(2, 'Work_1417.jpg', 'Architect design', 2),
(3, 'Work_1639.webp', 'construction ', 3),
(4, 'Work_1295.webp', 'Paperwork,worker align', 4),
(5, 'Work_2051.jpg', 'interoir design singapore', 5),
(6, 'Work_1426.jpg', 'home painting', 6),
(7, 'Work_1425.jpg', 'first class plumbing', 7),
(8, 'Work_1678.jpg', 'industrial  elecriction', 8),
(9, 'Work_1053.avif', 'Cabinet installation', 9);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_worker`
--

CREATE TABLE `tbl_worker` (
  `worker_id` int(10) UNSIGNED NOT NULL,
  `worker_name` varchar(50) NOT NULL,
  `worker_contact` varchar(50) DEFAULT NULL,
  `worker_gender` varchar(50) DEFAULT NULL,
  `worker_email` varchar(50) DEFAULT NULL,
  `worker_address` varchar(150) DEFAULT NULL,
  `worker_dob` date DEFAULT NULL,
  `worker_photo` varchar(50) DEFAULT NULL,
  `worker_proof` varchar(50) DEFAULT NULL,
  `worker_vstatus` int(10) UNSIGNED DEFAULT 0,
  `worker_password` varchar(50) DEFAULT NULL,
  `worker_doj` date DEFAULT NULL,
  `workertype_id` int(10) UNSIGNED DEFAULT NULL,
  `place_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_worker`
--

INSERT INTO `tbl_worker` (`worker_id`, `worker_name`, `worker_contact`, `worker_gender`, `worker_email`, `worker_address`, `worker_dob`, `worker_photo`, `worker_proof`, `worker_vstatus`, `worker_password`, `worker_doj`, `workertype_id`, `place_id`) VALUES
(1, 'Ayush', '9478514876', 'Male', 'ayush@123', 'puthanpurakkal(h)Thodupuzha East (po) Thodupuzha\r\n685585', '2001-02-14', 'Worker_2082.jpg', 'WorkerProof_1099.jpg', 1, 'ayush', '2024-03-13', 1, 1),
(2, 'Sarath Biju', '9465124578', 'Male', 'sarath@gmail.com', 'Kaduvakkuzhiyil(h) Ezhallor Po vettikkunnu palakkad', '2004-06-14', 'Worker_1723.jpg', 'WorkerProof_1572.jpg', 1, 'sarath', '2024-03-13', 2, 4),
(3, 'Aajal', '9745859632', 'Male', 'aajal@gmail.com', 'Panichiyil(h) parambikkulam po Palakkadu', '2004-02-03', 'Worker_2049.avif', 'WorkerProof_1644.avif', 1, 'aajal', '2024-03-13', 3, 5),
(4, 'Althaf', '6545789685', 'Male', 'althaf@gmail.com', 'Anakkuzhiyil h chakkodu po chala Kannur', '2011-05-10', 'Worker_2077.jpg', 'WorkerProof_2103.jpg', 1, 'althaf', '2024-03-13', 4, 6),
(5, 'Govind', '9495187733', 'Male', 'govind@gmail.com', 'Govinthapuram h fort kochi po kochi Ernakulam', '2002-02-11', 'Worker_1233.webp', 'WorkerProof_2058.webp', 1, 'govind', '2024-03-13', 5, 8),
(6, 'Naveen', '9745859632', 'Male', 'naveen@gmail.com', 'Arackal H  Beypure road Kozhikkodu', '1999-10-31', 'Worker_1120.webp', 'WorkerProof_2009.webp', 1, 'naveen', '2024-03-13', 6, 10),
(7, 'Abhijith', '9465124578', 'Male', 'abhijith@gmail.com', 'Shanthipuram colony H kappadu  fort Po Kappadu', '2005-02-08', 'Worker_1635.png', 'WorkerProof_1249.png', 1, 'abhijith', '2024-03-13', 7, 11),
(8, 'Richard Martin', '9478514876', 'Male', 'richard@gmail.com', 'Vattathil H Edakkal cavu road Edakkal Wayanadu', '2006-01-31', 'Worker_2018.jpg', 'WorkerProof_1290.jpg', 1, 'richard', '2024-03-13', 8, 13),
(9, 'Manaf ', '9495187733', 'Male', 'manaf@gmail.com', 'Padippurayil H Bekal kadu PO Kasargod', '2001-10-23', 'Worker_1063.jpg', 'WorkerProof_1383.jpg', 1, 'manaf', '2024-03-13', 9, 14);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_workertype`
--

CREATE TABLE `tbl_workertype` (
  `workertype_id` int(10) UNSIGNED NOT NULL,
  `workertype_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_workertype`
--

INSERT INTO `tbl_workertype` (`workertype_id`, `workertype_name`) VALUES
(1, 'ASTROLOGIST'),
(2, 'ARCHITECTS'),
(3, 'ENGINEERS'),
(4, 'CONTRACTORS'),
(5, 'INTERIOR DESIGNERS'),
(6, 'PAINTERS'),
(7, 'PLUMBERS'),
(8, 'ELECTRICIANS'),
(9, 'CARPENTERS');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_workgallery`
--

CREATE TABLE `tbl_workgallery` (
  `wgallery_id` int(10) UNSIGNED NOT NULL,
  `wgallery_image` varchar(50) DEFAULT NULL,
  `work_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_workgallery`
--

INSERT INTO `tbl_workgallery` (`wgallery_id`, `wgallery_image`, `work_id`) VALUES
(1, 'WorkGallery_1131.webp', 3),
(2, 'WorkGallery_1061.webp', 4),
(3, 'WorkGallery_1753.jpg', 5),
(4, 'WorkGallery_1755.jpg', 6),
(5, 'WorkGallery_1757.jpg', 7),
(6, 'WorkGallery_1045.jpg', 8),
(7, 'WorkGallery_1324.jpg', 9);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `admin_id` (`admin_id`);

--
-- Indexes for table `tbl_complaints`
--
ALTER TABLE `tbl_complaints`
  ADD PRIMARY KEY (`complaint_id`),
  ADD UNIQUE KEY `complaint_id` (`complaint_id`);

--
-- Indexes for table `tbl_district`
--
ALTER TABLE `tbl_district`
  ADD PRIMARY KEY (`district_id`),
  ADD UNIQUE KEY `district_id` (`district_id`);

--
-- Indexes for table `tbl_feedback`
--
ALTER TABLE `tbl_feedback`
  ADD PRIMARY KEY (`feedback_id`),
  ADD UNIQUE KEY `feedback_id` (`feedback_id`);

--
-- Indexes for table `tbl_land`
--
ALTER TABLE `tbl_land`
  ADD PRIMARY KEY (`land_id`),
  ADD UNIQUE KEY `land_id` (`land_id`);

--
-- Indexes for table `tbl_landbooking`
--
ALTER TABLE `tbl_landbooking`
  ADD PRIMARY KEY (`landbooking_id`),
  ADD UNIQUE KEY `landbooking_id` (`landbooking_id`);

--
-- Indexes for table `tbl_landlord`
--
ALTER TABLE `tbl_landlord`
  ADD PRIMARY KEY (`landlord_id`),
  ADD UNIQUE KEY `landlord_id` (`landlord_id`);

--
-- Indexes for table `tbl_latestwork`
--
ALTER TABLE `tbl_latestwork`
  ADD PRIMARY KEY (`lwork_id`),
  ADD UNIQUE KEY `lwork_id` (`lwork_id`);

--
-- Indexes for table `tbl_location`
--
ALTER TABLE `tbl_location`
  ADD PRIMARY KEY (`location_id`),
  ADD UNIQUE KEY `location_id` (`location_id`);

--
-- Indexes for table `tbl_lworkbooking`
--
ALTER TABLE `tbl_lworkbooking`
  ADD PRIMARY KEY (`lworkbooking_id`),
  ADD UNIQUE KEY `workbooking_id` (`lworkbooking_id`);

--
-- Indexes for table `tbl_place`
--
ALTER TABLE `tbl_place`
  ADD PRIMARY KEY (`place_id`),
  ADD UNIQUE KEY `place_id` (`place_id`);

--
-- Indexes for table `tbl_review`
--
ALTER TABLE `tbl_review`
  ADD PRIMARY KEY (`review_id`),
  ADD UNIQUE KEY `review_id` (`review_id`);

--
-- Indexes for table `tbl_service`
--
ALTER TABLE `tbl_service`
  ADD PRIMARY KEY (`service_id`),
  ADD UNIQUE KEY `service_id` (`service_id`);

--
-- Indexes for table `tbl_servicebooking`
--
ALTER TABLE `tbl_servicebooking`
  ADD PRIMARY KEY (`servicebooking_id`),
  ADD UNIQUE KEY `servicebooking_id` (`servicebooking_id`);

--
-- Indexes for table `tbl_servicegallery`
--
ALTER TABLE `tbl_servicegallery`
  ADD PRIMARY KEY (`sgallery_id`),
  ADD UNIQUE KEY `sgallery_id` (`sgallery_id`);

--
-- Indexes for table `tbl_servicetype`
--
ALTER TABLE `tbl_servicetype`
  ADD PRIMARY KEY (`servicetype_id`),
  ADD UNIQUE KEY `servicetype_id` (`servicetype_id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `tbl_wishlist`
--
ALTER TABLE `tbl_wishlist`
  ADD PRIMARY KEY (`wishlist_id`),
  ADD UNIQUE KEY `wishlist_id` (`wishlist_id`);

--
-- Indexes for table `tbl_work`
--
ALTER TABLE `tbl_work`
  ADD PRIMARY KEY (`work_id`),
  ADD UNIQUE KEY `work_id` (`work_id`);

--
-- Indexes for table `tbl_worker`
--
ALTER TABLE `tbl_worker`
  ADD PRIMARY KEY (`worker_id`),
  ADD UNIQUE KEY `worker_id` (`worker_id`);

--
-- Indexes for table `tbl_workertype`
--
ALTER TABLE `tbl_workertype`
  ADD PRIMARY KEY (`workertype_id`),
  ADD UNIQUE KEY `workertype_id` (`workertype_id`);

--
-- Indexes for table `tbl_workgallery`
--
ALTER TABLE `tbl_workgallery`
  ADD PRIMARY KEY (`wgallery_id`),
  ADD UNIQUE KEY `wgallery_id` (`wgallery_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `admin_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_complaints`
--
ALTER TABLE `tbl_complaints`
  MODIFY `complaint_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_district`
--
ALTER TABLE `tbl_district`
  MODIFY `district_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_feedback`
--
ALTER TABLE `tbl_feedback`
  MODIFY `feedback_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_land`
--
ALTER TABLE `tbl_land`
  MODIFY `land_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_landbooking`
--
ALTER TABLE `tbl_landbooking`
  MODIFY `landbooking_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tbl_landlord`
--
ALTER TABLE `tbl_landlord`
  MODIFY `landlord_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_latestwork`
--
ALTER TABLE `tbl_latestwork`
  MODIFY `lwork_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tbl_location`
--
ALTER TABLE `tbl_location`
  MODIFY `location_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tbl_lworkbooking`
--
ALTER TABLE `tbl_lworkbooking`
  MODIFY `lworkbooking_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_place`
--
ALTER TABLE `tbl_place`
  MODIFY `place_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tbl_review`
--
ALTER TABLE `tbl_review`
  MODIFY `review_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_service`
--
ALTER TABLE `tbl_service`
  MODIFY `service_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tbl_servicebooking`
--
ALTER TABLE `tbl_servicebooking`
  MODIFY `servicebooking_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_servicegallery`
--
ALTER TABLE `tbl_servicegallery`
  MODIFY `sgallery_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_servicetype`
--
ALTER TABLE `tbl_servicetype`
  MODIFY `servicetype_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_wishlist`
--
ALTER TABLE `tbl_wishlist`
  MODIFY `wishlist_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_work`
--
ALTER TABLE `tbl_work`
  MODIFY `work_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tbl_worker`
--
ALTER TABLE `tbl_worker`
  MODIFY `worker_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tbl_workertype`
--
ALTER TABLE `tbl_workertype`
  MODIFY `workertype_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tbl_workgallery`
--
ALTER TABLE `tbl_workgallery`
  MODIFY `wgallery_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
