-- Commencer par désactiver le safe mode : 
SET SQL_SAFE_UPDATES = 0;

-- On doit dans le TP supprimer des bons de commandes d'avril 2019, mais nous n'en avons pas
-- donc on commence par en créer 2
INSERT INTO BON (ID, NUMERO, DELAI, ID_FOU, DATE_CMDE) VALUES (3, 3, 3, 1, '2019-04-08 09:30:00');
INSERT INTO COMPO (ID_ART, ID_BON, QTE) values (1, 3, 3);
INSERT INTO COMPO (ID_ART, ID_BON, QTE) values (2, 3, 12);
INSERT INTO COMPO (ID_ART, ID_BON, QTE) values (6, 3, 1);

INSERT INTO BON (ID, NUMERO, DELAI, ID_FOU, DATE_CMDE) VALUES (4, 4, 1, 1, '2019-04-12 09:30:00');
INSERT INTO COMPO (ID_ART, ID_BON, QTE) values (8, 4, 15);
INSERT INTO COMPO (ID_ART, ID_BON, QTE) values (2, 4, 9);
INSERT INTO COMPO (ID_ART, ID_BON, QTE) values (5, 4, 2);

-- On peut vérifier la création dans la table bon, puis la table compo
SELECT * FROM BON ; /*Contient 4 enregistrements*/
SELECT * FROM COMPO ; /*Contient 13 enregistrements*/

-- Supprimer dans la table compo toutes les lignes concernant les bons de commande d’avril 2019
DELETE FROM COMPO
WHERE ID_BON IN (SELECT ID as ID_BON FROM BON WHERE (YEAR(DATE_CMDE)='2019' AND MONTH(DATE_CMDE)='04'))
;
/* Message : 6 lignes supprimées */

-- Supprimer dans la table bon tous les bons de commande d’avril 2019
DELETE FROM BON
WHERE (YEAR(DATE_CMDE)='2019' AND MONTH(DATE_CMDE)='04')
;
/* Message : 2 lignes supprimées */
