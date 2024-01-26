CREATE TABLE ARTICLE(
    ID INT PRIMARY KEY,
    REF VARCHAR(150),
    DESIGNATION VARCHAR(150),
    PRIX DECIMAL,
    ID_FOU INT
    );

CREATE TABLE FOURNISSEUR(
    ID INT PRIMARY KEY,
    NOM VARCHAR(150)
    );

CREATE TABLE BON(
    ID INT PRIMARY KEY,
    NUMERO INT,
    DATE_CMDE DATETIME,
    DELAI TIME,
    ID_FOU INT
    );

CREATE TABLE COMPO(
    ID INT PRIMARY KEY AUTO_INCREMENT,
    QTE INT,
    ID_ART INT,
    	FOREIGN KEY(ID_ART)
    	REFERENCES ARTICLE(ID),
    ID_BON INT,
    	FOREIGN KEY(ID_BON)
    	REFERENCES BON(ID)
   );
