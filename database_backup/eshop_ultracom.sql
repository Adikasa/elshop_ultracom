-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 02, 2025 at 07:27 PM
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
-- Database: `eshop_ultracom`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_brand`
--

CREATE TABLE `tbl_brand` (
  `brand_id` int(11) NOT NULL,
  `brand_name` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_brand`
--

INSERT INTO `tbl_brand` (`brand_id`, `brand_name`) VALUES
(11, 'Sato'),
(9, 'Epson'),
(10, 'Printronix');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE `tbl_category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `category_status` tinyint(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`category_id`, `category_name`, `category_status`) VALUES
(79, 'Mesin Hitung Uang', 1),
(78, 'Printer', 1),
(80, 'Encoder', 1),
(81, 'Timestamp', 1),
(82, 'Mesin Antrian', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_contact`
--

CREATE TABLE `tbl_contact` (
  `contact_id` int(11) NOT NULL,
  `contact_name` varchar(25) NOT NULL,
  `contact_email` varchar(32) NOT NULL,
  `contact_subject` varchar(32) NOT NULL,
  `contact_message` text NOT NULL,
  `contact_status` tinyint(2) NOT NULL,
  `contact_date` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customer`
--

CREATE TABLE `tbl_customer` (
  `cus_id` int(11) NOT NULL,
  `cus_name` varchar(55) NOT NULL,
  `cus_email` varchar(55) NOT NULL,
  `cus_password` varchar(32) NOT NULL,
  `cus_mobile` varchar(14) NOT NULL,
  `cus_address` text NOT NULL,
  `cus_city` varchar(55) NOT NULL,
  `cus_country` varchar(55) NOT NULL,
  `cus_zip` varchar(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_customer`
--

INSERT INTO `tbl_customer` (`cus_id`, `cus_name`, `cus_email`, `cus_password`, `cus_mobile`, `cus_address`, `cus_city`, `cus_country`, `cus_zip`) VALUES
(53, 'Burhanudin', 'satrio@adidayadigital.com', '8b2c6adc36b47f8019c5a20abf9eedee', '081210110160', 'Jl. Smpn 3, Rawakalong, Kec. Gn. Sindur', 'Tangerang Selatan', 'Banten', '10150'),
(52, 'Muhamad Ridhan', 'ridhan@adidayadigital.com', '8b2c6adc36b47f8019c5a20abf9eedee', '08161422223', 'Jl. Nusa Indah 2 no. 106 003/007, No. 106', 'KOTA DEPOK', '-- Provinsi --', '16517'),
(51, 'Syaiful Amri', 'sineas@smkn1gunungsindur.sch.id', '7383a233e9aba174b3441faf98f45b8c', '081210110160', 'Jl. Nusa Indah 2 no. 106 003/007, No. 106 Kel. Curug, Kec. Bojongsari', 'Kab. Bogor', 'Jawa Barat', '16517'),
(54, 'Muhamad Ridhan', 'qwerty@gmail.com', '25d55ad283aa400af464c76d713c07ad', '08161422223', 'Jl. Nusa Indah 2 no. 106 003/007, No. 106', 'jakarta', '-- Provinsi --', '16517');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order`
--

CREATE TABLE `tbl_order` (
  `order_id` int(11) NOT NULL,
  `cus_id` int(11) NOT NULL,
  `shipping_id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL,
  `order_total` float NOT NULL,
  `order_status` varchar(20) NOT NULL DEFAULT 'pending',
  `order_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_order`
--

INSERT INTO `tbl_order` (`order_id`, `cus_id`, `shipping_id`, `payment_id`, `order_total`, `order_status`, `order_date`) VALUES
(100, 47, 78, 102, 107, 'pending', '2017-12-31 17:20:20'),
(97, 48, 76, 99, 107, 'pending', '2017-12-31 17:01:39'),
(101, 51, 80, 103, 3570010, 'pending', '2025-06-27 13:26:57'),
(102, 52, 81, 104, 98634000, 'pending', '2025-06-27 14:49:21'),
(103, 53, 82, 105, 2550010, 'pending', '2025-06-27 15:00:37'),
(104, 52, 83, 106, 108304000, 'pending', '2025-06-29 16:30:58'),
(105, 54, 84, 107, 3584010, 'pending', '2025-06-30 13:50:01');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order_details`
--

CREATE TABLE `tbl_order_details` (
  `order_details_id` int(12) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(5) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `product_price` float NOT NULL,
  `sales_quantity` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_order_details`
--

INSERT INTO `tbl_order_details` (`order_details_id`, `order_id`, `product_id`, `product_name`, `product_price`, `sales_quantity`) VALUES
(125, 100, 53, 'Samsung j7', 100, 1),
(119, 97, 53, 'Samsung j7', 100, 1),
(126, 101, 1, 'Epson LQ 2190', 3500000, 1),
(127, 102, 2, 'Printronix P8215 Cabinet', 96700000, 1),
(128, 103, 79, 'Printer Laser', 1250000, 2),
(129, 104, 2, 'Printronix P8215 Cabinet', 96700000, 2),
(130, 105, 4, 'Printer Passbook Epson PLQ 20', 3200000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_payment`
--

CREATE TABLE `tbl_payment` (
  `payment_id` int(11) NOT NULL,
  `payment_status` varchar(20) NOT NULL DEFAULT 'pending',
  `payment_type` varchar(20) NOT NULL,
  `payment_date_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `payment_message` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_payment`
--

INSERT INTO `tbl_payment` (`payment_id`, `payment_status`, `payment_type`, `payment_date_time`, `payment_message`) VALUES
(102, 'pending', 'cash_on_delivery', '2017-12-31 17:20:20', ''),
(98, 'pending', 'cash_on_delivery', '2017-12-30 23:45:17', ''),
(97, 'pending', 'cash_on_delivery', '2017-12-30 23:36:17', ''),
(96, 'pending', 'cash_on_delivery', '2017-12-30 23:17:07', ''),
(103, 'pending', 'cash_on_delivery', '2025-06-27 13:26:57', 'tolong cepat yah'),
(104, 'pending', 'cash_on_delivery', '2025-06-27 14:49:21', 'Tolong Dikirim Segera Yah...'),
(105, 'pending', 'cash_on_delivery', '2025-06-27 15:00:37', ''),
(106, 'pending', 'cash_on_delivery', '2025-06-29 16:30:58', ''),
(107, 'pending', 'cash_on_delivery', '2025-06-30 13:50:01', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product`
--

CREATE TABLE `tbl_product` (
  `pro_id` int(11) NOT NULL,
  `pro_title` varchar(255) NOT NULL,
  `pro_desc` text NOT NULL,
  `pro_cat` tinyint(4) NOT NULL,
  `pro_sub_cat` tinyint(4) NOT NULL,
  `pro_brand` tinyint(4) NOT NULL,
  `pro_price` float NOT NULL,
  `pro_quantity` tinyint(4) NOT NULL,
  `pro_availability` tinyint(4) NOT NULL COMMENT 'status 1=instock, 2=outof stock, 3= up coming',
  `pro_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'status=1 enable status=2 disable',
  `pro_image` text DEFAULT NULL,
  `top_product` tinyint(1) DEFAULT 0 COMMENT 'show top value=1 other wise value=0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_product`
--

INSERT INTO `tbl_product` (`pro_id`, `pro_title`, `pro_desc`, `pro_cat`, `pro_sub_cat`, `pro_brand`, `pro_price`, `pro_quantity`, `pro_availability`, `pro_status`, `pro_image`, `top_product`) VALUES
(1, 'Epson LQ 2190', '<p><strong>High Speed</strong><br>\r\nThe 24-pin wide carriage LQ-2190 boosts a high print speed of up to 480 cps (10 cpi) makes it an ideal solution for high volume applications.</p>\r\n\r\n<p><strong>Robust and Reliable</strong><br>\r\nWith MTBF (mean time between failure) of 20,000 power-on hours and a print head life of 400 million strokes per wire, this extremely robust printer is suitable for medium and large print volumes. Both features guarantee uninterrupted operation and less maintenance, in turn enhancing your productivity and reducing your total cost of ownership.</p>\r\n\r\n<p><strong>Versatile Connectivity</strong><br>\r\nWith a built-in USB, parallel interface and optional network print server, the LQ-2190 is engineered for versatile connectivity. What’s more, choice of front, rear and bottom paper paths gives you even more control over desk space management.</p>\r\n\r\n<p><strong>High Ribbon Yield</strong><br>\r\nWith a ribbon life of around 15 million characters, the ribbon replacement intervals are longer which in turn lower running costs and total cost of ownership.</p>\r\n', 78, 36, 9, 3500000, 0, 1, 1, 'uploads/Epson_LQ2190.png', 1),
(2, 'Printronix P8215 Cabinet', '<p>Printronix P8215 Series Cabinet barang ready siap kirim ke seluruh indonesia untuk PPN (faktur) juga tersedia GARANSI 1 TAHUN spesifikasi: Printer Printronix P8215 High Speed (Draft) : 1500/1289 Data Processing: 1125/900 Near Letter Quality : 600/459 Graphics Speed : Up to 187 Inch/Minute (60 x 48 dpi) Paper Feed Speed : 25 Inch/Second Ribbon : 1 x ribbon Reliability : MTBF : 10,000 hour(s) Barcode : Code 39, Data Matrix, EAN/JAN-13, EAN/JAN-8, Interleaved 2 of 5, PDF417, Postnet, Royal Mail, UPC-A, UPC-E Media Type continuous forms, fanfold paper Media Size Fanfold (3 in - 17 in) Resolution 90 x 96 dpi Didalam paket sdh termasuk * buku panduan / Manual book * Pita / Ribbon * Kabel Power * Kabel USB</p>\r\n', 78, 34, 10, 96700000, -2, 1, 1, 'uploads/Printronix_p8215_Cabinet8.png', NULL),
(3, 'Printer Barcode Sato CL4NX', '<p>Printer Barcode Sato CL4NX Spesifikasi : -Kecepatan Print : 10 ips (254 mm/s), 8 ips (203 mm/s), 6 ips (152 mm/s) -Lebar Area Cetak : 4.1? (104.0 mm) -Panjang Maksimal : 98.43? (2500 mm),59.06? (1500 mm),15.75? (400 mm) -Lebar Media : 0.98? (25 mm) - 5.15? (131 mm) -Lebar Pita : 1.55? (39.5 mm) - 5.03? (128 mm) -Dimensi : D:17.99? (457 mm) W: 10.66? (271 mm) H: 12.63? (321mm) Weight 33 lbs. ( 15 kgs) Kondisi barang second 98% masih bagus</p>\r\n', 78, 35, 11, 10000000, 10, 1, 1, 'uploads/SOCL4NXPlus_Main0-removebg-preview.png', NULL),
(4, 'Printer Passbook Epson PLQ 20', '<p>Ready Printer Passbook Epson PLQ-20 Printer untuk mencetak buku tabungan atau validasi pada transaksi bank Mencetak BPKB dan surat nikah Jenis dotmatrix Spesifikasi : Kertas potong (single) ukuran 65 X 67 mm sampai 245 X 297 mm Ketebalan 0.065 sampai 0.19 mm Berat 52 sampai 157 gsm Kertas potong (multiple) ukuran 65 X 67 mm sampai 245 X297 mm 1 original dan 6 copy Ketebalan 0.12 sampai 0.53 mm Berat (satu lembar) 34 sampai 50 gsm Passbook lebar 110 sampai 241.3 mm Panjang lapisan horizontal : 127 sampai 220 mm Panjang lapisan vertikal 85 sampai 220 mm Ketebalan 2.6 mm STOCK SANGAT BANYAK TERSEDIA RATUSAN UNIT GARANSI 1 TAHUN SIAP COD - JAKARTA DAN KIRIM KE SELURUH INDONESIA BERAT BARANG SUDAH TERMASUK PACKING KAYU STANDARD LUAR KOTA DAN KARDUS PLUS SPON</p>\r\n', 78, 36, 9, 3200000, 0, 1, 2, 'uploads/epson-plq-30-passbook-printer-original-imafhzec3sg9t8ar-removebg-preview.png', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_shipping`
--

CREATE TABLE `tbl_shipping` (
  `shipping_id` int(11) NOT NULL,
  `cus_id` int(11) NOT NULL,
  `cus_name` varchar(55) NOT NULL,
  `cus_email` varchar(55) NOT NULL,
  `cus_password` varchar(32) NOT NULL,
  `cus_mobile` varchar(14) NOT NULL,
  `cus_address` text NOT NULL,
  `cus_city` varchar(55) NOT NULL,
  `cus_country` varchar(55) NOT NULL,
  `cus_zip` varchar(5) NOT NULL,
  `cus_fax` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_shipping`
--

INSERT INTO `tbl_shipping` (`shipping_id`, `cus_id`, `cus_name`, `cus_email`, `cus_password`, `cus_mobile`, `cus_address`, `cus_city`, `cus_country`, `cus_zip`, `cus_fax`) VALUES
(80, 51, 'Syaiful Amri', 'sineas@smkn1gunungsindur.sch.id', '', '081210110160', 'Jl. Nusa Indah 2 no. 106 003/007, No. 106 Kel. Curug, Kec. Bojongsari', 'Kab. Bogor', 'Jawa Barat', '16517', ''),
(79, 50, 'Syaiful Amri', 'sineas@smkn1gunungsindur.sch.id', '', '08161422223', 'Jl. Nusa Indah 2 no. 106 003/007, No. 106', 'KOTA DEPOK', 'United_States', '16517', ''),
(81, 52, 'Muhamad Ridhan', 'ridhan@adidayadigital.com', '', '08161422223', 'Jl. Nusa Indah 2 no. 106 003/007, No. 106', 'KOTA DEPOK', 'Jawa Barat', '16517', ''),
(82, 53, 'Burhanudin', 'satrio@adidayadigital.com', '', '081210110160', 'Jl. Smpn 3, Rawakalong, Kec. Gn. Sindur', 'Tangerang Selatan', 'Banten', '10150', ''),
(83, 52, 'Muhamad Ridhan', 'ridhan@adidayadigital.com', '', '08161422223', 'Jl. Nusa Indah 2 no. 106 003/007, No. 106', 'KOTA DEPOK', '-- Provinsi --', '16517', ''),
(84, 0, 'Syaiful Amri', 'syaiful@smkn1gunungsindur.sch.id', '', '08161422223', 'Jl. Nusa Indah 2 no. 106 003/007, No. 106', 'KOTA DEPOK', 'UK', '16517', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sub_category`
--

CREATE TABLE `tbl_sub_category` (
  `sub_cat_id` int(11) NOT NULL,
  `sub_category_name` varchar(255) NOT NULL,
  `category_sub_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_sub_category`
--

INSERT INTO `tbl_sub_category` (`sub_cat_id`, `sub_category_name`, `category_sub_id`) VALUES
(36, 'PassBook', 0),
(35, 'Barcode', 0),
(34, 'Cabinet', 78);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `user_id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_role` tinyint(3) NOT NULL,
  `user_status` tinyint(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`user_id`, `username`, `user_email`, `user_password`, `user_role`, `user_status`) VALUES
(1, 'Syaiful Amri', 'admin@gmail.com', '$2y$10$jC5vMlVtrPNSZNZr4cpJ.O4x.pvMMhRMkLV/NuOthbiVlttTHmsTi', 1, 1),
(16, 'Syaiful Amri', 'syaiful@adidayadigital.com', '$2y$10$lPkQz3/dWSj.dL76646FlugRnunADaYqYm.K0O6JY/A1WqsoNugxK', 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_brand`
--
ALTER TABLE `tbl_brand`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `tbl_contact`
--
ALTER TABLE `tbl_contact`
  ADD PRIMARY KEY (`contact_id`);

--
-- Indexes for table `tbl_customer`
--
ALTER TABLE `tbl_customer`
  ADD PRIMARY KEY (`cus_id`);

--
-- Indexes for table `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `tbl_order_details`
--
ALTER TABLE `tbl_order_details`
  ADD PRIMARY KEY (`order_details_id`);

--
-- Indexes for table `tbl_payment`
--
ALTER TABLE `tbl_payment`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`pro_id`);

--
-- Indexes for table `tbl_shipping`
--
ALTER TABLE `tbl_shipping`
  ADD PRIMARY KEY (`shipping_id`);

--
-- Indexes for table `tbl_sub_category`
--
ALTER TABLE `tbl_sub_category`
  ADD PRIMARY KEY (`sub_cat_id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_brand`
--
ALTER TABLE `tbl_brand`
  MODIFY `brand_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `tbl_contact`
--
ALTER TABLE `tbl_contact`
  MODIFY `contact_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `tbl_customer`
--
ALTER TABLE `tbl_customer`
  MODIFY `cus_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `tbl_order`
--
ALTER TABLE `tbl_order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `tbl_order_details`
--
ALTER TABLE `tbl_order_details`
  MODIFY `order_details_id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- AUTO_INCREMENT for table `tbl_payment`
--
ALTER TABLE `tbl_payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT for table `tbl_product`
--
ALTER TABLE `tbl_product`
  MODIFY `pro_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `tbl_shipping`
--
ALTER TABLE `tbl_shipping`
  MODIFY `shipping_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `tbl_sub_category`
--
ALTER TABLE `tbl_sub_category`
  MODIFY `sub_cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
