-- Création d'une clé étrangère entre :
-- la colonne ID_FOU de la table ARTICLE et la colonne ID de la table FOURNISSEUR : 
ALTER TABLE article add constraint FK_ARTICLE_FOU FOREIGN KEY (ID_FOU) REFERENCES fournisseur(ID);
-- la colonne ID_FOU de la table BON et la colonne ID de la table FOURNISSEUR : 
ALTER TABLE bon add constraint FK_BON_FOU FOREIGN KEY (ID_FOU) REFERENCES fournisseur(ID);
-- la colonne ID_ART de la table COMPO et la colonne ID de la table ARTICLE : 
ALTER TABLE compo add constraint FK_COMPO_ART FOREIGN KEY (ID_ART) REFERENCES article(ID);
-- la colonne ID_BON de la table COMPO et la colonne ID de la table BON : 
ALTER TABLE compo add constraint FK_COMPO_BON FOREIGN KEY (ID_BON) REFERENCES bon(ID);


-- 3) Insérer les 3 fournisseurs suivants : 1-Française d’Imports, 2-FDM SA, 3-Dubois & Fils
INSERT INTO fournisseur (ID, NOM) values (1, 'Française d’Imports');
INSERT INTO fournisseur (ID, NOM) values (2, 'FDM SA');
INSERT INTO fournisseur (ID, NOM) values (3, 'Dubois & Fils');

-- 4) Dans la table des articles, insérez les 10 articles suivants :
INSERT INTO article (ID, REF, DESIGNATION, PRIX, ID_FOU) values (1, "A01", "Perceuse P1",74.99,1);
INSERT INTO article (ID, REF, DESIGNATION, PRIX, ID_FOU) values (2, "F01", "Boulon laiton 4 x 40 mm (sachet de 10)",2.25,2);
INSERT INTO article (ID, REF, DESIGNATION, PRIX, ID_FOU) values (3, "F02", "Boulon laiton 5 x 40 mm (sachet de 10)",4.45,2);
INSERT INTO article (ID, REF, DESIGNATION, PRIX, ID_FOU) values (4, "D01", "Boulon laiton 5 x 40 mm (sachet de 10)",4.40,3);
INSERT INTO article (ID, REF, DESIGNATION, PRIX, ID_FOU) values (5, "A02", "Meuleuse 125mm",37.85,1);
INSERT INTO article (ID, REF, DESIGNATION, PRIX, ID_FOU) values (6, "D03", "Boulon acier zingué 4 x 40mm (sachet de 10)",1.8,3);
INSERT INTO article (ID, REF, DESIGNATION, PRIX, ID_FOU) values (7, "A03", "Perceuse à colonne",185.25,1);
INSERT INTO article (ID, REF, DESIGNATION, PRIX, ID_FOU) values (8, "D04", "Coffret mêches à bois",12.25,3);
INSERT INTO article (ID, REF, DESIGNATION, PRIX, ID_FOU) values (9, "F03", "Coffret mêches plates",6.25,2);
INSERT INTO article (ID, REF, DESIGNATION, PRIX, ID_FOU) values (10, "F04", "Fraises d’encastrement",8.14,2);

-- 5) Insérez le bon de commande suivant passé auprès de Française d’Imports :
--      a. 3 perceuses P1
--      b. 4 meuleuses 125mm
--      c. 1 perceuse à colonne
--      d. Délai de 3 jours

INSERT INTO bon (ID, NUMERO, DATE_CMDE, DELAI, ID_FOU) values (1, 1, '2024-01-25', 3, 1);
INSERT INTO compo (QTE,ID_ART,ID_BON) values (3, 1, 1);
INSERT INTO compo (QTE,ID_ART,ID_BON) values (4, 5, 1);
INSERT INTO compo (QTE,ID_ART,ID_BON) values (1, 7, 1);




