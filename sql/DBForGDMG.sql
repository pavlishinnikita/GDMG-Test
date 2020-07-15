SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `DBForGDMG`
--

-- --------------------------------------------------------

--
-- Table structure for table `Category`
--

CREATE TABLE `Category` (
  `id` int(255) NOT NULL,
  `parent_id` int(255) DEFAULT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Category`
--

INSERT INTO `Category` (`id`, `parent_id`, `name`) VALUES
(1, NULL, 'CAT1'),
(2, 1, 'CAT1-1'),
(3, 1, 'CAT1-2'),
(4, NULL, 'CAT2'),
(5, 4, 'CAT2-1'),
(6, 2, 'CAT1-1-1'),
(7, 6, 'CAT1-1-1-1'),
(8, 5, 'CAT2-1-1');

-- --------------------------------------------------------

--
-- Table structure for table `Opportunity`
--

CREATE TABLE `Opportunity` (
  `id` int(255) NOT NULL,
  `product_id` int(255) NOT NULL,
  `quantity` int(255) NOT NULL,
  `dt` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Opportunity`
--

INSERT INTO `Opportunity` (`id`, `product_id`, `quantity`, `dt`) VALUES
(1, 1, 5, '2020-07-07 21:01:08'),
(2, 1, 3, '2020-07-07 21:02:57'),
(3, 3, 7, '2020-07-07 21:03:17'),
(4, 2, 10, '2020-07-07 21:03:31'),
(5, 2, 20, '2020-07-07 21:03:43'),
(6, 2, 20, '2020-07-07 21:03:43'),
(7, 3, 777, '2020-07-09 10:30:19'),
(8, 4, 10, '2020-07-09 12:23:39');

-- --------------------------------------------------------

--
-- Table structure for table `Product`
--

CREATE TABLE `Product` (
  `id` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Product`
--

INSERT INTO `Product` (`id`, `name`, `price`) VALUES
(1, 'Product1', 1),
(2, 'Product2', 2),
(3, 'Product3', 3),
(4, 'Product4', 4);

-- --------------------------------------------------------

--
-- Table structure for table `ProductToCategory`
--

CREATE TABLE `ProductToCategory` (
  `id` int(255) NOT NULL,
  `product_id` int(255) NOT NULL,
  `category_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ProductToCategory`
--

INSERT INTO `ProductToCategory` (`id`, `product_id`, `category_id`) VALUES
(1, 1, 1),
(2, 1, 3),
(3, 1, 4),
(4, 2, 4),
(5, 2, 5),
(6, 3, 6),
(7, 4, 7);

-- --------------------------------------------------------

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Category`
--
ALTER TABLE `Category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Category_Category` (`parent_id`);

--
-- Indexes for table `Opportunity`
--
ALTER TABLE `Opportunity`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Opportunity_Product` (`product_id`);

--
-- Indexes for table `Product`
--
ALTER TABLE `Product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ProductToCategory`
--
ALTER TABLE `ProductToCategory`
  ADD PRIMARY KEY (`product_id`,`category_id`,`id`),
  ADD KEY `FK_ProductToCategory_Category` (`category_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Product`
--
ALTER TABLE `Product`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;


--
-- Constraints for dumped tables
--

--
-- Constraints for table `Category`
--
ALTER TABLE `Category`
  ADD CONSTRAINT `FK_Category_Category` FOREIGN KEY (`parent_id`) REFERENCES `Category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Opportunity`
--
ALTER TABLE `Opportunity`
  ADD CONSTRAINT `FK_Opportunity_Product` FOREIGN KEY (`product_id`) REFERENCES `Product` (`id`);

--
-- Constraints for table `ProductToCategory`
--
ALTER TABLE `ProductToCategory`
  ADD CONSTRAINT `FK_ProductToCategory_Category` FOREIGN KEY (`category_id`) REFERENCES `Category` (`id`),
  ADD CONSTRAINT `FK_ProductToCategory_Product` FOREIGN KEY (`product_id`) REFERENCES `Product` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
