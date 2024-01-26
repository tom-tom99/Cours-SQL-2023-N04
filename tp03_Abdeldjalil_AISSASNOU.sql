CREATE TABLE ARTICLE (
    ID INT(8) PRIMARY KEY,
    REF VARCHAR(55),
    DESIGNATION VARCHAR(255),
    PRIX DECIMAL(10, 2),
    ID_FOU INT(8)

);
CREATE TABLE FOURNISSEUR (
    ID INT(8) PRIMARY KEY,
    NOM VARCHAR(255)

);
CREATE TABLE BON (
    ID INT(8) PRIMARY KEY,
    NUMERO VARCHAR(20),
    DATE_CMDE DATETIME,
    DELAI TIME,
    ID_FOU INT(8)
);
CREATE TABLE COMPO (
    ID INT(8) PRIMARY KEY AUTO_INCREMENT,
    QTE INT,
	ID_ART INT(8),
    ID_BON INT(8)
);
-- CONSTRAINT FK_COMBO_ART FOREIGN KEY(ID_ART) REFERENCES ARTICLE(ID) 
    -- FK_COMBO_ART n'est pas obligatoire

ALTER TABLE ARTICLE ADD CONSTRAINT FK_ID_FOU_Article FOREIGN KEY (ID_FOU) REFERENCES FOURNISSEUR(ID);
ALTER TABLE BON ADD CONSTRAINT FK_ID_FOU_Bon FOREIGN KEY (ID_FOU) REFERENCES FOURNISSEUR(ID);
ALTER TABLE COMPO ADD CONSTRAINT FK_ID_ART_Compo FOREIGN KEY (ID_ART) REFERENCES ARTICLE(ID);
ALTER TABLE COMPO ADD CONSTRAINT FK_ID_BON_Compo FOREIGN KEY (ID_BON) REFERENCES BON(ID);

-- Insertion des 3 fournisseurs
INSERT INTO FOURNISSEUR (ID, NOM)
VALUES
    (1, 'Française d’Imports'),
    (2, 'FDM SA'),
    (3, 'Dubois & Fils');

INSERT INTO ARTICLE (ID, REF, Designation, Prix, ID_FOU)
VALUES
    (1, 'A01', 'Perceuse P1', 74.99, 1), -- Française d’Imports
    (2, 'F01', 'Boulon laiton 4 x 40 mm (sachet de 10)', 2.25, 2), -- FDM SA
    (3, 'F02', 'Boulon laiton 5 x 40 mm (sachet de 10)', 4.45, 2), -- FDM SA
    (4, 'D01', 'Boulon laiton 5 x 40 mm (sachet de 10)', 4.40, 3), -- Dubois & Fils
    (5, 'A02', 'Meuleuse 125mm', 37.85, 1), -- Française d’Imports
    (6, 'D03', 'Boulon acier zingué 4 x 40mm (sachet de 10)', 1.8, 3), -- Dubois & Fils
    (7, 'A03', 'Perceuse à colonne', 185.25, 1), -- Française d’Imports
    (8, 'D04', 'Coffret mêches à bois', 12.25, 3), -- Dubois & Fils
    (9, 'F03', 'Coffret mêches plates', 6.25, 2), -- FDM SA
    (10, 'F04', 'Fraises d encastrement', 8.14, 2); -- FDM SA

-- Creation un bon de commande
INSERT INTO BON (ID, NUMERO, DATE_CMDE, DELAI, ID_FOU)
VALUES
    (3, "001", "25/01/2023", 72, 1);

-- Composition du bon de commabde

INSERT INTO COMPO (ID, QTE , ID_ART , ID_BON)
VALUES
    (1, 3, 1, 3),
    (2, 4, 5, 3),
    (3, 1, 7, 3);
