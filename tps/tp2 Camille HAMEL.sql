CREATE TABLE `article` (
  `ID` int(11) NOT NULL,
  `REF` varchar(255),
  `DESIGNATION` varchar(255),
  `PRIX` float,
  `ID_FOU` int(11),
  PRIMARY KEY (`ID`)
)

CREATE TABLE FOURNISSEUR( ID int PRIMARY KEY, nom varchar(255));

CREATE TABLE BON( ID int PRIMARY KEY,
 numero varchar(50),
 date_cmde datetime,
 delai varchar(50),
 ID_FOU int);

 create table compo(
    id int AUTO_INCREMENT PRIMARY KEY,
    qte int,
    id_art int ,
    id_bon int,
      CONSTRAINT FOREIGN KEY(id_art) references article(id),
    constraint FOREIGN KEY(id_bon) references bon(id));