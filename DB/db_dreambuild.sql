-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 11, 2024 at 07:34 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

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

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cartbody`
--

CREATE TABLE `tbl_cartbody` (
  `cbody_id` int(10) UNSIGNED NOT NULL,
  `cart_id` int(10) UNSIGNED DEFAULT NULL,
  `cart_qty` int(10) UNSIGNED DEFAULT NULL,
  `cart_status` int(10) UNSIGNED DEFAULT 0,
  `sproduct_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_carthead`
--

CREATE TABLE `tbl_carthead` (
  `cart_id` int(10) UNSIGNED NOT NULL,
  `user_id` date DEFAULT NULL,
  `booking_status` int(10) UNSIGNED DEFAULT 0,
  `payment_status` int(10) UNSIGNED DEFAULT 0,
  `grand_total` int(10) UNSIGNED DEFAULT NULL,
  `booking_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

-- --------------------------------------------------------

--
-- Table structure for table `tbl_district`
--

CREATE TABLE `tbl_district` (
  `district_id` int(10) UNSIGNED NOT NULL,
  `district_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `location_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

-- --------------------------------------------------------

--
-- Table structure for table `tbl_location`
--

CREATE TABLE `tbl_location` (
  `location_id` int(10) UNSIGNED NOT NULL,
  `location_name` varchar(50) NOT NULL,
  `place_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

-- --------------------------------------------------------

--
-- Table structure for table `tbl_place`
--

CREATE TABLE `tbl_place` (
  `place_id` int(10) UNSIGNED NOT NULL,
  `place_name` varchar(50) NOT NULL,
  `district_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product`
--

CREATE TABLE `tbl_product` (
  `product_id` int(10) UNSIGNED NOT NULL,
  `product_name` varchar(50) DEFAULT NULL,
  `product_image` varchar(50) DEFAULT NULL,
  `pcategory_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_productcategory`
--

CREATE TABLE `tbl_productcategory` (
  `pcategory_id` int(10) UNSIGNED NOT NULL,
  `pcategory_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `worker_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

-- --------------------------------------------------------

--
-- Table structure for table `tbl_servicegallery`
--

CREATE TABLE `tbl_servicegallery` (
  `sgallery_id` int(10) UNSIGNED NOT NULL,
  `sgallery_image` varchar(50) DEFAULT NULL,
  `service_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_servicetype`
--

CREATE TABLE `tbl_servicetype` (
  `servicetype_id` int(10) UNSIGNED NOT NULL,
  `servicetype_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_shop`
--

CREATE TABLE `tbl_shop` (
  `shop_id` int(10) UNSIGNED NOT NULL,
  `shop_name` varchar(50) NOT NULL,
  `shop_email` varchar(50) NOT NULL,
  `shop_contact` varchar(50) DEFAULT NULL,
  `shop_address` varchar(150) DEFAULT NULL,
  `shop_logo` varchar(50) DEFAULT NULL,
  `shop_proof` varchar(50) DEFAULT NULL,
  `shop_password` varchar(50) DEFAULT NULL,
  `shop_doj` date DEFAULT NULL,
  `shop_vstatus` int(50) DEFAULT 0,
  `place_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_shopproduct`
--

CREATE TABLE `tbl_shopproduct` (
  `sproduct_id` int(10) UNSIGNED NOT NULL,
  `shop_id` int(10) UNSIGNED DEFAULT NULL,
  `product_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sproductgallery`
--

CREATE TABLE `tbl_sproductgallery` (
  `gallery_id` int(10) UNSIGNED NOT NULL,
  `gallery_image` varchar(50) DEFAULT NULL,
  `sproduct_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sproductstock`
--

CREATE TABLE `tbl_sproductstock` (
  `sproductstock_id` int(10) UNSIGNED NOT NULL,
  `sproduct_id` int(10) UNSIGNED DEFAULT NULL,
  `sproduct_qty` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

-- --------------------------------------------------------

--
-- Table structure for table `tbl_wishlist`
--

CREATE TABLE `tbl_wishlist` (
  `wishlist_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `worker_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

-- --------------------------------------------------------

--
-- Table structure for table `tbl_workertype`
--

CREATE TABLE `tbl_workertype` (
  `workertype_id` int(10) UNSIGNED NOT NULL,
  `workertype_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `admin_id` (`admin_id`);

--
-- Indexes for table `tbl_cartbody`
--
ALTER TABLE `tbl_cartbody`
  ADD PRIMARY KEY (`cbody_id`);

--
-- Indexes for table `tbl_carthead`
--
ALTER TABLE `tbl_carthead`
  ADD PRIMARY KEY (`cart_id`);

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
-- Indexes for table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `tbl_productcategory`
--
ALTER TABLE `tbl_productcategory`
  ADD PRIMARY KEY (`pcategory_id`);

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
-- Indexes for table `tbl_shop`
--
ALTER TABLE `tbl_shop`
  ADD PRIMARY KEY (`shop_id`),
  ADD UNIQUE KEY `shop_id` (`shop_id`);

--
-- Indexes for table `tbl_shopproduct`
--
ALTER TABLE `tbl_shopproduct`
  ADD PRIMARY KEY (`sproduct_id`);

--
-- Indexes for table `tbl_sproductgallery`
--
ALTER TABLE `tbl_sproductgallery`
  ADD PRIMARY KEY (`gallery_id`);

--
-- Indexes for table `tbl_sproductstock`
--
ALTER TABLE `tbl_sproductstock`
  ADD PRIMARY KEY (`sproductstock_id`);

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
-- AUTO_INCREMENT for table `tbl_cartbody`
--
ALTER TABLE `tbl_cartbody`
  MODIFY `cbody_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_carthead`
--
ALTER TABLE `tbl_carthead`
  MODIFY `cart_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_complaints`
--
ALTER TABLE `tbl_complaints`
  MODIFY `complaint_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_district`
--
ALTER TABLE `tbl_district`
  MODIFY `district_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tbl_feedback`
--
ALTER TABLE `tbl_feedback`
  MODIFY `feedback_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_land`
--
ALTER TABLE `tbl_land`
  MODIFY `land_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_landbooking`
--
ALTER TABLE `tbl_landbooking`
  MODIFY `landbooking_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_landlord`
--
ALTER TABLE `tbl_landlord`
  MODIFY `landlord_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_latestwork`
--
ALTER TABLE `tbl_latestwork`
  MODIFY `lwork_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_location`
--
ALTER TABLE `tbl_location`
  MODIFY `location_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_lworkbooking`
--
ALTER TABLE `tbl_lworkbooking`
  MODIFY `lworkbooking_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_place`
--
ALTER TABLE `tbl_place`
  MODIFY `place_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_product`
--
ALTER TABLE `tbl_product`
  MODIFY `product_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_productcategory`
--
ALTER TABLE `tbl_productcategory`
  MODIFY `pcategory_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_review`
--
ALTER TABLE `tbl_review`
  MODIFY `review_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_service`
--
ALTER TABLE `tbl_service`
  MODIFY `service_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_servicebooking`
--
ALTER TABLE `tbl_servicebooking`
  MODIFY `servicebooking_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_servicegallery`
--
ALTER TABLE `tbl_servicegallery`
  MODIFY `sgallery_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tbl_servicetype`
--
ALTER TABLE `tbl_servicetype`
  MODIFY `servicetype_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_shop`
--
ALTER TABLE `tbl_shop`
  MODIFY `shop_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_shopproduct`
--
ALTER TABLE `tbl_shopproduct`
  MODIFY `sproduct_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tbl_sproductgallery`
--
ALTER TABLE `tbl_sproductgallery`
  MODIFY `gallery_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_sproductstock`
--
ALTER TABLE `tbl_sproductstock`
  MODIFY `sproductstock_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_wishlist`
--
ALTER TABLE `tbl_wishlist`
  MODIFY `wishlist_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_work`
--
ALTER TABLE `tbl_work`
  MODIFY `work_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_worker`
--
ALTER TABLE `tbl_worker`
  MODIFY `worker_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_workertype`
--
ALTER TABLE `tbl_workertype`
  MODIFY `workertype_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_workgallery`
--
ALTER TABLE `tbl_workgallery`
  MODIFY `wgallery_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
