
CREATE TABLE `article` (
  `ID` int(11) NOT NULL,
  `REF` varchar(255) DEFAULT NULL,
  `DESIGNATION` varchar(255) DEFAULT NULL,
  `PRIX` decimal(10,2) DEFAULT NULL,
  `ID_FOU` varchar(255) DEFAULT NULL
)

CREATE TABLE `bon` (
  `ID` int(11) NOT NULL,
  `NUMERO` int(11) DEFAULT NULL,
  `DATE_CMDE` date DEFAULT NULL,
  `DELAI` time DEFAULT NULL,
  `ID_FOU` int(11) DEFAULT NULL
)

CREATE TABLE `combo` (
  `ID` int(11) NOT NULL,
  `QTE` int(11) DEFAULT NULL,
  `ID_ART` varchar(255) DEFAULT NULL,
  `ID_BON` varchar(255) DEFAULT NULL
)

CREATE TABLE `fournisseur` (
  `ID` int(11) NOT NULL,
  `NOM` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
