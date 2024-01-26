-- Objectifs du TP
-- Apprendre à écrire des requêtes SQL avec les diverses clauses possibles :
-- • WHERE
-- • ORDER BY
-- • GROUP BY
-- • HAVING

-- 0- Lister les tables d'une base de données
SHOW TABLES

-- a- Listez toutes les données concernant la table article
SELECT * FROM article
-- b- Listez toutes les données concernant toutes les tables
SELECT * FROM article, bon, fournisseur, compo
-- c- Listez uniquement les références et désignations 
--      des articles de plus de 2 euros
SELECT REF, DESIGNATION FROM ARTICLE WHERE PRIX > 2;

-- d- En utilisant l’opérateur BETWEEN, listez tous les articles dont le prix est compris 
-- entre 2 et 6.25 euros
SELECT * FROM ARTICLE WHERE PRIX BETWEEN 2 and 6.25

--e. Listez tous les articles dont le prix n’est pas compris entre 2 et 6.25 euros et dont le 
-- fournisseur est Française d’Imports.
SELECT * FROM ARTICLE WHERE PRIX NOT BETWEEN 2 and 6.25 AND ID_FOU = 1;

-- f. En utilisant un opérateur logique, listez tous les articles dont les fournisseurs sont la 
--      Française d’imports ou Dubois et Fils
SELECT * FROM ARTICLE WHERE ID_FOU=1 OR ID_FOU=3;

-- g. En utilisant l’opérateur IN, réalisez la même requête que précédemment
SELECT * FROM ARTICLE WHERE ID_FOU IN (SELECT ID FROM FOURNISSEUR WHERE NOM IN ("Française d''Imports" , 'Dubois & Fils'));

-- En utilisant les opérateurs NOT et IN, listez tous les articles dont les fournisseurs ne 
--      sont ni Française d’Imports, ni Dubois et Fils
SELECT * FROM ARTICLE WHERE ID_FOU NOT IN (SELECT ID FROM FOURNISSEUR WHERE NOM IN ("Française d''Imports" , 'Dubois & Fils'));

-- Listez tous les bons de commande dont la date de commande est entre le 
--         01/02/2019 et le 30/04/2019.
SELECT * FROM BON WHERE DATE_CMDE IN BETWEEN "01/02/2019" AND "30/04/2019"
