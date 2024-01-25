ALTER TABLE ARTICLE
ADD CONSTRAINT fk_article_fournisseur
FOREIGN KEY (ID_FOU) REFERENCES FOURNISSEUR(ID);

ALTER TABLE BON
ADD CONSTRAINT fk_bon_fournisseur
FOREIGN KEY (ID_FOU) REFERENCES FOURNISSEUR(ID);

ALTER TABLE COMPO
ADD CONSTRAINT fk_compo_article
FOREIGN KEY (ID_ART) REFERENCES ARTICLE(ID);

ALTER TABLE COMPO
ADD CONSTRAINT fk_compo_bon
FOREIGN KEY (ID_BON) REFERENCES BON(ID);

INSERT INTO FOURNISSEUR (NOM) VALUES
('Française d’Imports'),
('FDM SA'),
('Dubois & Fils');

INSERT INTO ARTICLE (REF, DESIGNATION, PRIX, ID_FOU) VALUES
('A01', 'Perceuse P1', 74.99, 1),
('F01', 'Boulon laiton 4 x 40 mm (sachet de 10)', 2.25, 2),
('F02', 'Boulon laiton 5 x 40 mm (sachet de 10)', 4.45, 2),
('D01', 'Boulon laiton 5 x 40 mm (sachet de 10)', 4.40, 3),
('A02', 'Meuleuse 125mm', 37.85, 1),
('D03', 'Boulon acier zingué 4 x 40mm (sachet de 10)', 1.8, 3),
('A03', 'Perceuse à colonne', 185.25, 1),
('D04', 'Coffret mêches à bois', 12.25, 3),
('F03', 'Coffret mêches plates', 6.25, 2),
('F04', 'Fraises d’encastrement', 8.14, 2);



INSERT INTO BON (NUMERO, DATE_CMDE, DELAI, ID_FOU)
VALUES ('BC001', '2024-01-25', '3:00:00', 1);

INSERT INTO COMPO (QTE, ID_ART, ID_BON)
VALUES (3,(SELECT ID FROM ARTICLE WHERE DESIGNATION = 'Perceuse P1' AND ID_FOU = 1 ), (SELECT ID FROM BON WHERE NUMERO = 'BC001')),
    (4,(SELECT ID FROM ARTICLE WHERE DESIGNATION = 'Meuleuse 125mm' AND ID_FOU = 1 ),(SELECT ID FROM BON WHERE NUMERO = 'BC001')),
    (1,(SELECT ID FROM ARTICLE WHERE DESIGNATION = 'Perceuse à colonne' AND ID_FOU = 1 ), (SELECT ID FROM BON WHERE NUMERO = 'BC001'));