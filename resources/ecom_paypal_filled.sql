-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3307
-- Время создания: Фев 23 2023 г., 09:20
-- Версия сервера: 8.0.32
-- Версия PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `ecom_paypal`
--

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `cat_id` int NOT NULL,
  `cat_title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(31, 'Fridges'),
(32, 'Washing Machines'),
(33, 'Cookers'),
(34, 'Grilles'),
(35, 'Coffee Machines');

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `order_id` int NOT NULL,
  `order_amount` float NOT NULL,
  `order_transaction` varchar(255) NOT NULL,
  `order_status` varchar(255) NOT NULL,
  `order_currency` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`order_id`, `order_amount`, `order_transaction`, `order_status`, `order_currency`) VALUES
(63, 345, '34535434', 'Completed', 'USD');

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `product_id` int NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_category_id` int NOT NULL,
  `product_price` float NOT NULL,
  `product_quantity` int NOT NULL,
  `product_description` text NOT NULL,
  `short_desc` text NOT NULL,
  `product_image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`product_id`, `product_title`, `product_category_id`, `product_price`, `product_quantity`, `product_description`, `short_desc`, `product_image`) VALUES
(113, 'LG French Door Refrigerator with Door-in-Door', 31, 999, 11, 'The LG French Door Refrigerator with Door-in-Door offers plenty of space and features to keep your food fresh and organized. The Door-in-Door feature allows you to easily access your favorite items without having to open the entire fridge. This model also includes a water and ice dispenser, SmartThinQ technology, and adjustable shelving for maximum flexibility.', 'LG French Door Refrigerator with Door-in-Door - Space and organization with easy access to favorites.', 'fridge1.jpg'),
(114, 'Samsung Side-by-Side Refrigerator with Food Showcase', 31, 879, 6, 'The Samsung Side-by-Side Refrigerator with Food Showcase is a sleek and modern option for any kitchen. The Food Showcase feature allows you to quickly access frequently used items without having to open the entire fridge, and the ice and water dispenser is conveniently located on the exterior for easy use. This model also includes adjustable shelving, LED lighting, and a built-in water filter.', 'Samsung Side-by-Side Refrigerator with Food Showcase - Modern design with convenient access and filtering.', 'fridge2.jpg'),
(115, 'Whirlpool Top-Freezer Refrigerator with Flexi-Slide Bin', 31, 799, 3, 'The Whirlpool Top-Freezer Refrigerator with Flexi-Slide Bin is a reliable and affordable option for any household. The Flexi-Slide bin allows you to easily store and access items in the fridge, while the adjustable shelving and humidity-controlled crisper drawers offer maximum flexibility for storing different types of food. This model also includes a full-width freezer shelf and an optional ice maker.', 'Whirlpool Top-Freezer Refrigerator with Flexi-Slide Bin - Reliable and flexible storage for any budget.', 'fridge3.jpg'),
(116, 'LG Front-Load Washer with TurboWash', 32, 765, 4, 'The LG Front-Load Washer with TurboWash Technology offers powerful cleaning performance with a 6Motion technology that uses six different wash motions to thoroughly clean your clothes. The TurboWash feature also reduces wash time by up to 30 minutes, while still providing exceptional cleaning results. This model also includes a steam cleaning option, an anti-vibration system, and a large capacity drum.', 'LG Front-Load Washer with TurboWash Technology - Powerful cleaning with fast wash time.', 'wm1.jpg'),
(117, 'Samsung Top-Load Washer with Active WaterJet', 32, 578, 8, 'The Samsung Top-Load Washer with Active WaterJet offers convenient and efficient washing with a built-in faucet that lets you pre-treat stains before adding your clothes to the wash. The Active WaterJet feature also ensures that detergent is fully dissolved before it reaches your clothes, for a more thorough clean. This model also includes a large capacity drum, multiple wash cycles, and an auto dispensing system for laundry detergent and fabric softener.', 'Samsung Top-Load Washer with Active WaterJet - Convenient and efficient washing with built-in faucet and multiple wash cycles.', 'wm2.jpg'),
(118, 'Whirlpool Smart Front-Load Washer with Load & Go XL Plus', 32, 987, 9, 'The Whirlpool Smart Front-Load Washer with Load & Go XL Plus Dispenser offers advanced features and technology for easy and efficient laundry care. The Load & Go XL Plus Dispenser allows you to add detergent for up to 40 loads at once, while the Smart features let you control the washer remotely through your smartphone or voice assistant. This model also includes a steam cleaning option, an Adaptive Wash technology that adjusts the cycle to each load, and a large capacity drum.', 'Whirlpool Smart Front-Load Washer with Load & Go XL Plus Dispenser - Advanced features and technology for easy and efficient laundry care.', 'wm3.jpg'),
(119, 'Samsung Freestanding Gas Range with True', 33, 450, 5, 'The Samsung Freestanding Gas Range with True Convection offers advanced features and technology for precise and efficient cooking. The True Convection system uses a fan to circulate heat evenly, while the five burners provide plenty of cooking space and power. This model also includes a griddle plate, a storage drawer, and a self-cleaning option for easy maintenance.', 'Samsung Freestanding Gas Range with True Convection - Advanced features for precise and efficient cooking.', 'cooker1.jpg'),
(120, 'Whirlpool Gas Range with AccuSimmer Burner', 33, 879, 13, 'The Whirlpool Gas Range with AccuSimmer Burner offers reliable and affordable cooking performance with a powerful 15,000 BTU burner for quick heating and a low-heat AccuSimmer burner for precise simmering. The large oven capacity and multiple rack positions allow for flexibility in cooking different dishes, while the electronic control panel and digital display make it easy to set and monitor cooking times and temperatures.', 'Whirlpool Gas Range with AccuSimmer Burner - Reliable and affordable cooking performance with precise simmering.', 'cooker2.jpg'),
(121, 'GE Cafe Slide-In Double Oven Gas Range', 33, 490, 6, 'The GE Cafe Slide-In Double Oven Gas Range with Convection offers premium features and design for a luxurious cooking experience. The double oven allows for simultaneous cooking at different temperatures, while the convection system ensures even cooking and browning. This model also includes six burners, a reversible grill/griddle, and a Wi-Fi connection for remote control and monitoring.', 'GE Cafe Slide-In Double Oven Gas Range with Convection - Premium features and design for a luxurious cooking experience.', 'cooker3.jpg'),
(122, 'Weber Spirit II E-310 Gas Grill', 34, 379, 3, 'The Weber Spirit II E-310 Gas Grill offers exceptional grilling performance and durability with three powerful burners and a large cooking area. The porcelain-enameled cast iron grates provide even heat distribution and easy cleaning, while the built-in thermometer allows for precise temperature control. This model also includes a warming rack, a side table, and a grease management system for easy maintenance.', 'Weber Spirit II E-310 Gas Grill - Exceptional performance and durability with powerful burners and large cooking area.', 'grill1.jpg'),
(123, 'Char-Broil TRU-Infrared Gas Grill', 34, 500, 10, 'The Char-Broil TRU-Infrared Gas Grill offers advanced technology and cooking performance with a TRU-Infrared cooking system that prevents flare-ups and provides even heat distribution. The stainless steel grates are durable and easy to clean, while the electronic ignition system allows for quick and easy startup. This model also includes a warming rack, a side burner, and a lid-mounted temperature gauge for precise temperature control.', 'Char-Broil TRU-Infrared Gas Grill - Advanced technology and cooking performance with even heat distribution and easy startup.', 'grill2.jpg'),
(124, 'Blackstone 36-inch Outdoor Flat Gas Grill', 34, 300, 9, 'The Blackstone 36-inch Outdoor Flat Top Gas Grill offers a unique and versatile cooking experience with a large flat top griddle that allows for cooking a wide variety of foods at once. The four burners provide plenty of power and heat control, while the grease management system makes cleaning up a breeze. This model also includes foldable legs for easy portability and storage, and a built-in grease trap for easy disposal.', 'Blackstone 36-inch Outdoor Flat Top Gas Grill - Unique and versatile cooking experience with large flat top griddle and easy cleanup.', 'grill3.jpg'),
(125, 'Breville Barista Express Espresso Machine', 35, 690, 4, 'The Breville Barista Express Espresso Machine offers exceptional espresso-making capabilities with a built-in conical burr grinder and precise temperature control for optimal extraction. The steam wand allows for frothing milk for lattes and cappuccinos, while the intuitive controls make it easy to customize and save your preferred coffee settings. This model also includes a hot water dispenser for making Americanos and tea.', 'Breville Barista Express Espresso Machine - Exceptional espresso-making capabilities with built-in grinder and precise temperature control.', 'cm1.jpg'),
(126, 'Keurig K-Elite Single Serve Coffee Maker Machine', 35, 580, 7, 'The Keurig K-Elite Single Serve Coffee Maker offers convenient and customizable coffee brewing with the ability to brew different cup sizes and strength levels. The strong brew setting produces a bold and flavorful cup, while the hot water dispenser allows for making tea and other hot beverages. This model also includes a large water reservoir and a removable drip tray for easy cleaning.', 'Keurig K-Elite Single Serve Coffee Maker - Convenient and customizable coffee brewing with different cup sizes and strength levels.', 'cm2.jpg'),
(127, 'Technivorm Moccamaster Coffee Maker', 35, 560, 7, 'The Technivorm Moccamaster Coffee Maker offers high-quality coffee brewing with a fast and precise brew cycle and a unique copper heating element that maintains the optimal brewing temperature. The drip stop feature allows for easy and mess-free pouring, while the durable metal construction ensures long-lasting performance. This model also includes a large water reservoir and a brewing capacity of up to 10 cups.', 'Technivorm Moccamaster Coffee Maker - High-quality coffee brewing with fast and precise brew cycle and unique copper heating element.', 'cm3.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `reports`
--

CREATE TABLE `reports` (
  `report_id` int NOT NULL,
  `product_id` int NOT NULL,
  `order_id` int NOT NULL,
  `product_price` float NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_quantity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `slides`
--

CREATE TABLE `slides` (
  `slide_title` varchar(255) NOT NULL,
  `slide_id` int NOT NULL,
  `slide_image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `slides`
--

INSERT INTO `slides` (`slide_title`, `slide_id`, `slide_image`) VALUES
('items', 16, 'slide1.jpg'),
('items', 17, 'slide2.jpg'),
('items', 18, 'slide3.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `user_id` int NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `password`) VALUES
(1, 'admin', 'parfilo2003@gmail.com', 'admin');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Индексы таблицы `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`report_id`);

--
-- Индексы таблицы `slides`
--
ALTER TABLE `slides`
  ADD PRIMARY KEY (`slide_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT для таблицы `reports`
--
ALTER TABLE `reports`
  MODIFY `report_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT для таблицы `slides`
--
ALTER TABLE `slides`
  MODIFY `slide_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
