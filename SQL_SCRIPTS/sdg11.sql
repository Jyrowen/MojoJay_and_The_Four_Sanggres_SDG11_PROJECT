-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 05, 2025 at 08:32 AM
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
-- Database: `sdg11`
--

-- --------------------------------------------------------

--
-- Table structure for table `asset`
--

CREATE TABLE `asset` (
  `Asset_ID` int(11) NOT NULL,
  `Geo_ID` int(11) DEFAULT NULL,
  `Asset_Type` varchar(50) DEFAULT NULL,
  `Pre_Disaster_Value` decimal(12,2) DEFAULT NULL CHECK (`Pre_Disaster_Value` >= 0),
  `Coordinates` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `asset`
--

INSERT INTO `asset` (`Asset_ID`, `Geo_ID`, `Asset_Type`, `Pre_Disaster_Value`, `Coordinates`) VALUES
(401, 1, 'Hospital', 50000000.00, '14.63, 120.97'),
(402, 1, 'School', 20000000.00, '14.62, 120.96'),
(403, 2, 'Road', 15000000.00, '13.94, 121.62'),
(404, 3, 'Barangay Hall', 3000000.00, '13.15, 123.73'),
(405, 3, 'Farmland', 8000000.00, '13.16, 123.74'),
(406, 5, 'Fishing Port', 12000000.00, '11.24, 125.00'),
(407, 7, 'Residential Area', 30000000.00, '10.33, 123.89'),
(408, 8, 'Bridge', 45000000.00, '8.47, 124.64'),
(409, 10, 'Market', 7000000.00, '7.08, 125.63'),
(410, 6, 'Clinic', 5000000.00, '15.15, 120.59');

-- --------------------------------------------------------

--
-- Table structure for table `disaster_event`
--

CREATE TABLE `disaster_event` (
  `Event_ID` int(11) NOT NULL,
  `Hazard_Type_ID` int(11) DEFAULT NULL,
  `Geo_ID` int(11) DEFAULT NULL,
  `Start_Date` date NOT NULL,
  `End_Date` date DEFAULT NULL,
  `Severity_Scale` int(11) DEFAULT NULL CHECK (`Severity_Scale` between 1 and 10),
  `Description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `disaster_event`
--

INSERT INTO `disaster_event` (`Event_ID`, `Hazard_Type_ID`, `Geo_ID`, `Start_Date`, `End_Date`, `Severity_Scale`, `Description`) VALUES
(101, 3, 1, '2023-09-10', '2023-09-12', 7, 'Typhoon hit Manila causing flooding'),
(102, 1, 4, '2022-07-05', '2022-07-05', 6, 'Magnitude 6.0 earthquake in Baguio'),
(103, 4, 2, '2023-08-21', '2023-08-22', 5, 'Severe flooding due to monsoon rains'),
(104, 2, 3, '2023-11-14', '2023-11-14', 8, 'Major landslide in Legazpi'),
(105, 7, 3, '2021-01-20', NULL, 9, 'Minor eruption activity from Mayon Volcano'),
(106, 8, 6, '2023-03-01', '2023-04-01', 4, 'Dengue outbreak in Angeles'),
(107, 5, 5, '2020-11-12', '2020-11-13', 8, 'Storm surge during Typhoon Yolanda anniversary'),
(108, 6, 7, '2022-02-10', '2022-02-10', 3, 'Residential fire incident'),
(109, 3, 8, '2021-12-16', '2021-12-17', 9, 'Strong Typhoon Odette hitting CDO'),
(110, 4, 10, '2022-09-20', '2022-09-20', 6, 'Flash flood in Davao City');

-- --------------------------------------------------------

--
-- Table structure for table `geography`
--

CREATE TABLE `geography` (
  `Geo_ID` int(11) NOT NULL,
  `Region_Name` varchar(100) NOT NULL,
  `Municipality` varchar(100) DEFAULT NULL,
  `Barangay` varchar(100) DEFAULT NULL,
  `Poverty_Rate` decimal(5,2) DEFAULT NULL CHECK (`Poverty_Rate` >= 0 and `Poverty_Rate` <= 100),
  `Disaster_Risk_Zone` int(11) DEFAULT NULL CHECK (`Disaster_Risk_Zone` between 1 and 5)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `geography`
--

INSERT INTO `geography` (`Geo_ID`, `Region_Name`, `Municipality`, `Barangay`, `Poverty_Rate`, `Disaster_Risk_Zone`) VALUES
(1, 'NCR', 'Manila', 'Tondo', 28.50, 4),
(2, 'Region IV-A', 'Lucena City', 'Ibabang Dupay', 32.10, 3),
(3, 'Region V', 'Legazpi City', 'Bgy. 1', 45.00, 5),
(4, 'CAR', 'Baguio City', 'Irisan', 12.00, 2),
(5, 'Region VIII', 'Tacloban', 'San Jose', 38.50, 5),
(6, 'Region III', 'Angeles City', 'Balibago', 21.00, 3),
(7, 'Region VII', 'Cebu City', 'Lahug', 25.00, 3),
(8, 'Region X', 'Cagayan de Oro', 'Macasandig', 30.50, 4),
(9, 'BARMM', 'Marawi City', 'Saduc', 55.00, 4),
(10, 'Region XI', 'Davao City', 'Agdao', 18.30, 2);

-- --------------------------------------------------------

--
-- Table structure for table `hazard_type`
--

CREATE TABLE `hazard_type` (
  `Hazard_Type_ID` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Category` varchar(50) DEFAULT NULL CHECK (`Category` in ('Geological','Hydrometeorological','Climatological','Biological'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hazard_type`
--

INSERT INTO `hazard_type` (`Hazard_Type_ID`, `Name`, `Category`) VALUES
(1, 'Earthquake', 'Geological'),
(2, 'Landslide', 'Geological'),
(3, 'Typhoon', 'Hydrometeorological'),
(4, 'Flood', 'Hydrometeorological'),
(5, 'Storm Surge', 'Hydrometeorological'),
(6, 'Fire', 'Climatological'),
(7, 'Volcanic Eruption', 'Geological'),
(8, 'Dengue Outbreak', 'Biological');

-- --------------------------------------------------------

--
-- Stand-in structure for view `high_risk_locations_view`
-- (See below for the actual view)
--
CREATE TABLE `high_risk_locations_view` (
`Geo_ID` int(11)
,`Region_Name` varchar(100)
,`Municipality` varchar(100)
,`Poverty_Rate` decimal(5,2)
,`Disaster_Risk_Zone` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `human_impact`
--

CREATE TABLE `human_impact` (
  `Human_Impact_ID` int(11) NOT NULL,
  `Event_ID` int(11) DEFAULT NULL,
  `Segment_ID` int(11) DEFAULT NULL,
  `Deaths_Count` int(11) DEFAULT NULL CHECK (`Deaths_Count` >= 0),
  `Injuries_Count` int(11) DEFAULT NULL CHECK (`Injuries_Count` >= 0),
  `People_Affected_Count` int(11) DEFAULT NULL CHECK (`People_Affected_Count` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `human_impact`
--

INSERT INTO `human_impact` (`Human_Impact_ID`, `Event_ID`, `Segment_ID`, `Deaths_Count`, `Injuries_Count`, `People_Affected_Count`) VALUES
(301, 101, 201, 5, 12, 2000),
(302, 101, 202, 1, 5, 700),
(303, 102, 206, 0, 10, 1500),
(304, 103, 203, 0, 3, 300),
(305, 104, 205, 12, 25, 5200),
(306, 107, 207, 20, 50, 2300),
(307, 109, 209, 4, 20, 1500),
(308, 110, 210, 0, 2, 700),
(309, 108, 208, 2, 18, 4000),
(310, 106, 203, 0, 120, 800);

-- --------------------------------------------------------

--
-- Table structure for table `impacted_asset`
--

CREATE TABLE `impacted_asset` (
  `Impact_Asset_ID` int(11) NOT NULL,
  `Event_ID` int(11) DEFAULT NULL,
  `Asset_ID` int(11) DEFAULT NULL,
  `Damage_Level` varchar(20) DEFAULT NULL CHECK (`Damage_Level` in ('Minor','Moderate','Severe','Destroyed')),
  `Estimated_Loss_Value` decimal(12,2) DEFAULT NULL CHECK (`Estimated_Loss_Value` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `impacted_asset`
--

INSERT INTO `impacted_asset` (`Impact_Asset_ID`, `Event_ID`, `Asset_ID`, `Damage_Level`, `Estimated_Loss_Value`) VALUES
(501, 101, 401, 'Moderate', 10000000.00),
(502, 101, 402, 'Minor', 2000000.00),
(503, 103, 403, 'Severe', 8000000.00),
(504, 104, 404, 'Destroyed', 3000000.00),
(505, 104, 405, 'Severe', 6000000.00),
(506, 107, 406, 'Destroyed', 12000000.00),
(507, 109, 407, 'Severe', 15000000.00),
(508, 109, 408, 'Moderate', 9000000.00),
(509, 110, 409, 'Minor', 1000000.00),
(510, 108, 410, 'Moderate', 2500000.00);

-- --------------------------------------------------------

--
-- Table structure for table `population_segment`
--

CREATE TABLE `population_segment` (
  `Segment_ID` int(11) NOT NULL,
  `Geo_ID` int(11) DEFAULT NULL,
  `Description` varchar(100) NOT NULL,
  `Total_Count` int(11) DEFAULT NULL CHECK (`Total_Count` >= 0),
  `Vulnerability_Index` int(11) DEFAULT NULL CHECK (`Vulnerability_Index` between 1 and 5),
  `Evacuation_Status` varchar(50) DEFAULT NULL CHECK (`Evacuation_Status` in ('Safe','Evacuated','At Risk'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `population_segment`
--

INSERT INTO `population_segment` (`Segment_ID`, `Geo_ID`, `Description`, `Total_Count`, `Vulnerability_Index`, `Evacuation_Status`) VALUES
(201, 1, 'Low-income families', 4500, 5, 'At Risk'),
(202, 1, 'Elderly residents', 800, 4, 'Evacuated'),
(203, 2, 'PWD Community', 300, 3, 'Safe'),
(204, 2, 'Children (0-12)', 1200, 4, 'At Risk'),
(205, 3, 'Low-income families', 5200, 5, 'At Risk'),
(206, 4, 'Students', 5000, 2, 'Safe'),
(207, 5, 'Fisherfolk', 2300, 5, 'Evacuated'),
(208, 7, 'Urban poor sector', 4000, 4, 'At Risk'),
(209, 8, 'Senior Citizens', 1500, 3, 'Safe'),
(210, 10, 'Single parents', 700, 3, 'Evacuated');

-- --------------------------------------------------------

--
-- Structure for view `high_risk_locations_view`
--
DROP TABLE IF EXISTS `high_risk_locations_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `high_risk_locations_view`  AS SELECT `geography`.`Geo_ID` AS `Geo_ID`, `geography`.`Region_Name` AS `Region_Name`, `geography`.`Municipality` AS `Municipality`, `geography`.`Poverty_Rate` AS `Poverty_Rate`, `geography`.`Disaster_Risk_Zone` AS `Disaster_Risk_Zone` FROM `geography` WHERE `geography`.`Disaster_Risk_Zone` >= 4 AND `geography`.`Poverty_Rate` > 30.00 ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `asset`
--
ALTER TABLE `asset`
  ADD PRIMARY KEY (`Asset_ID`),
  ADD KEY `Geo_ID` (`Geo_ID`);

--
-- Indexes for table `disaster_event`
--
ALTER TABLE `disaster_event`
  ADD PRIMARY KEY (`Event_ID`),
  ADD KEY `Hazard_Type_ID` (`Hazard_Type_ID`),
  ADD KEY `Geo_ID` (`Geo_ID`);

--
-- Indexes for table `geography`
--
ALTER TABLE `geography`
  ADD PRIMARY KEY (`Geo_ID`);

--
-- Indexes for table `hazard_type`
--
ALTER TABLE `hazard_type`
  ADD PRIMARY KEY (`Hazard_Type_ID`);

--
-- Indexes for table `human_impact`
--
ALTER TABLE `human_impact`
  ADD PRIMARY KEY (`Human_Impact_ID`),
  ADD KEY `Event_ID` (`Event_ID`),
  ADD KEY `Segment_ID` (`Segment_ID`);

--
-- Indexes for table `impacted_asset`
--
ALTER TABLE `impacted_asset`
  ADD PRIMARY KEY (`Impact_Asset_ID`),
  ADD KEY `Event_ID` (`Event_ID`),
  ADD KEY `Asset_ID` (`Asset_ID`);

--
-- Indexes for table `population_segment`
--
ALTER TABLE `population_segment`
  ADD PRIMARY KEY (`Segment_ID`),
  ADD KEY `Geo_ID` (`Geo_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `asset`
--
ALTER TABLE `asset`
  ADD CONSTRAINT `asset_ibfk_1` FOREIGN KEY (`Geo_ID`) REFERENCES `geography` (`Geo_ID`);

--
-- Constraints for table `disaster_event`
--
ALTER TABLE `disaster_event`
  ADD CONSTRAINT `disaster_event_ibfk_1` FOREIGN KEY (`Hazard_Type_ID`) REFERENCES `hazard_type` (`Hazard_Type_ID`),
  ADD CONSTRAINT `disaster_event_ibfk_2` FOREIGN KEY (`Geo_ID`) REFERENCES `geography` (`Geo_ID`);

--
-- Constraints for table `human_impact`
--
ALTER TABLE `human_impact`
  ADD CONSTRAINT `human_impact_ibfk_1` FOREIGN KEY (`Event_ID`) REFERENCES `disaster_event` (`Event_ID`),
  ADD CONSTRAINT `human_impact_ibfk_2` FOREIGN KEY (`Segment_ID`) REFERENCES `population_segment` (`Segment_ID`);

--
-- Constraints for table `impacted_asset`
--
ALTER TABLE `impacted_asset`
  ADD CONSTRAINT `impacted_asset_ibfk_1` FOREIGN KEY (`Event_ID`) REFERENCES `disaster_event` (`Event_ID`),
  ADD CONSTRAINT `impacted_asset_ibfk_2` FOREIGN KEY (`Asset_ID`) REFERENCES `asset` (`Asset_ID`);

--
-- Constraints for table `population_segment`
--
ALTER TABLE `population_segment`
  ADD CONSTRAINT `population_segment_ibfk_1` FOREIGN KEY (`Geo_ID`) REFERENCES `geography` (`Geo_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
