USE compta;

ALTER TABLE ARTICLE ADD CONSTRAINT FK_ART_FOU FOREIGN KEY (ID_FOU) REFERENCES FOURNISSEUR(ID);
ALTER TABLE BON ADD CONSTRAINT FK_BON_FOU FOREIGN KEY (ID_FOU) REFERENCES FOURNISSEUR(ID);
ALTER TABLE COMPO ADD CONSTRAINT FK_COMPO_ART FOREIGN KEY (ID_ART) REFERENCES ARTICLE(ID);
ALTER TABLE COMPO ADD CONSTRAINT FK_COMPO_BON FOREIGN KEY (ID_BON) REFERENCES BON(ID);

INSERT INTO fournisseur (ID, NOM) VALUES (1, "Française d'Imports");
INSERT INTO fournisseur (ID, NOM) VALUES (2, 'FDM SA');
INSERT INTO fournisseur (ID, NOM) VALUES (3, 'Dubois & fils');

INSERT INTO article (ID, REF, Designation, Prix, ID_FOU) VALUES (1,'A01','Perceuse P1', 74.99,1);
INSERT INTO article (ID, REF, Designation, Prix, ID_FOU) VALUES (2,'F01','	Boulon laiton 4 x 40 mm (sachet de 10)', 2.25,2);
INSERT INTO article (ID, REF, Designation, Prix, ID_FOU) VALUES (3,'F02','Boulon laiton 5 x 40 mm (sachet de 10)',	4.45,2);
INSERT INTO ARTICLE (ID, REF, Designation, Prix, ID_FOU) VALUES (4, 'D01', 'Boulon laiton 5 x 40 mm (sachet de 10)', 4.4, 3) ;
INSERT INTO ARTICLE (ID, REF, Designation, Prix, ID_FOU) VALUES (5, 'A02', 'Meuleuse 125mm', 37.85, 1) ;
INSERT INTO ARTICLE (ID, REF, Designation, Prix, ID_FOU) VALUES (6, 'D03', 'Boulon acier zingué 4 x 40mm (sachet de 10)', 1.8, 3) ;
INSERT INTO ARTICLE (ID, REF, Designation, Prix, ID_FOU) VALUES (7, 'A03', 'Perceuse à colonne', 185.25, 1) ;
INSERT INTO ARTICLE (ID, REF, Designation, Prix, ID_FOU) VALUES (8, 'D04', 'Coffret mêches à bois', 12.25, 3) ;
INSERT INTO ARTICLE (ID, REF, Designation, Prix, ID_FOU) VALUES (9, 'F03', 'Coffret mêches plates', 6.25, 2) ;
INSERT INTO ARTICLE (ID, REF, Designation, Prix, ID_FOU) VALUES (10, 'F04', 'Fraises d’encastrement', 8.14, 2) ;

INSERT INTO BON (ID, NUMERO, DATE_CMDE, DELAI, ID_FOU) VALUES (1,1, '2024-01-25', 3,1);
INSERT INTO COMPO (QTE,ID_ART, ID_BON) VALUES(3,1,1);
INSERT INTO COMPO (QTE,ID_ART, ID_BON) VALUES(4,5,1);
INSERT INTO COMPO (QTE, ID_ART, ID_BON)  VALUES(1,7,1);





