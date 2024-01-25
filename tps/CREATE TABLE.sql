CREATE TABLE Article (
    ID int PRIMARY KEY,
    REF varchar(255),
    DESIGNATION varchar(255),
    PRIX decimal(10,2),
    ID_FOU int(8)
    )

CREATE TABLE Fournisseur (
    ID int PRIMARY KEY,
    NOM varchar(255)
    )

CREATE TABLE Bon (
    ID int PRIMARY KEY,
    DATE_CMDE datetime,
    DELAI time,
    ID_FOU int(8)
)

CREATE TABLE Compo (
    ID int AUTO_INCREMENT PRIMARY KEY,
    QTE int,
    ID_ART int(8),
    ID_BON int(8)
    )

