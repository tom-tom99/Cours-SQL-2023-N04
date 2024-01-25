-- Requêtes à réaliser :
-- a. Listez toutes les données concernant les articles
SELECT * 
FROM ARTICLE 
;
/*Renvoie 10 enregistrements*/

-- b. Listez uniquement les références et désignations des articles de plus de 2 euros
SELECT REF, DESIGNATION 
FROM ARTICLE
WHERE PRIX > 2.00
;
/*Renvoie 9 enregistrements*/

-- c. En utilisant les opérateurs de comparaison, listez tous les articles dont le prix est compris entre 2 et 
-- 6.25 euros
SELECT *
FROM ARTICLE
WHERE PRIX >= 2.00 AND PRIX <=6.25
;
/*Renvoie 4 enregistrements*/

-- d. En utilisant l’opérateur BETWEEN, listez tous les articles dont le prix est compris entre 2 et 6.25 euros
SELECT *
FROM ARTICLE 
WHERE PRIX BETWEEN 2.00 AND 6.25
;
/*Renvoie 4 enregistrements*/

-- e. Listez tous les articles dont le prix n’est pas compris entre 2 et 6.25 euros et dont le fournisseur est 
-- Française d’Imports.
SELECT * 
FROM ARTICLE 
WHERE (PRIX NOT BETWEEN 2.00 AND 6.25) AND ID_FOU = 1
;
/*Renvoie 3 enregistrements*/

-- f. En utilisant un opérateur logique, listez tous les articles dont les fournisseurs sont la Française 
-- d’imports ou Dubois et Fils
SELECT *
FROM ARTICLE
WHERE ID_FOU = 1 OR ID_FOU = 3
;
/*Renvoie 6 enregistrements*/

-- g. En utilisant l’opérateur IN, réalisez la même requête que précédemment
SELECT *
FROM ARTICLE 
WHERE ID_FOU IN (1,3)
;
/*Renvoie 6 enregistrements*/

-- h. En utilisant les opérateurs NOT et IN, listez tous les articles dont les fournisseurs ne sont ni 
-- Française d’Imports, ni Dubois et Fils.
SELECT *
FROM ARTICLE 
WHERE ID_FOU NOT IN (1,3)
;
/*Renvoie 4 enregistrements*/

-- i. Listez tous les bons de commande dont la date de commande est entre le 01/02/2019 et le 30/04/2019.
SELECT *
FROM BON
WHERE DATE_CMDE BETWEEN '2019-02-01 00:00:00' AND '2019-04-30 00:00:00'
;
/*Renvoie 2 enregistrements*/