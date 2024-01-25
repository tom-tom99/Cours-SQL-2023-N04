--a   Listez toutes les données concernant les articles
SELECT * FROM ARTICLE;
/*
ID	REF	DESIGNATION	PRIX	ID_FOU	
1	A01	Perceuse P1	74.99	1	
2	F01	Boulon laiton 4 x 40 mm (sachet de 10)	2.25	2	
3	F02	Boulon laiton 5 x 40 mm (sachet de 10)	4.45	2	
4	D01	Boulon laiton 5 x 40 mm (sachet de 10)	4.40	3	
5	A02	Meuleuse 125mm	37.85	1	
6	D03	Boulon acier zingué 4 x 40mm (sachet de 10)	1.80	3	
7	A03	Perceuse à colonne	185.25	1	
8	D04	Coffret mêches à bois	12.25	3	
9	F03	Coffret mêches plates	6.25	2	
10	F04	Fraises d’encastrement	8.14	2	

*/
--b   Listez uniquement les références et désignations des articles de plus de 2 euros
SELECT REF, DESIGNATION FROM ARTICLE WHERE PRIX > 2;
/*
REF	DESIGNATION	
A01	Perceuse P1	
F01	Boulon laiton 4 x 40 mm (sachet de 10)	
F02	Boulon laiton 5 x 40 mm (sachet de 10)	
D01	Boulon laiton 5 x 40 mm (sachet de 10)	
A02	Meuleuse 125mm	
A03	Perceuse à colonne	
D04	Coffret mêches à bois	
F03	Coffret mêches plates	
F04	Fraises d’encastrement	

*/
--c  En utilisant les opérateurs de comparaison, listez tous les articles dont le prix est compris entre 2 et 6.25 euros
SELECT * FROM ARTICLE WHERE PRIX >= 2 AND PRIX <= 6.25;
/*

ID	REF	DESIGNATION	PRIX	ID_FOU	
2	F01	Boulon laiton 4 x 40 mm (sachet de 10)	2.25	2	
3	F02	Boulon laiton 5 x 40 mm (sachet de 10)	4.45	2	
4	D01	Boulon laiton 5 x 40 mm (sachet de 10)	4.40	3	
9	F03	Coffret mêches plates	6.25	2	

*/
--d En utilisant l’opérateur BETWEEN, listez tous les articles dont le prix est compris entre 2 et 6.25 euros
SELECT * FROM ARTICLE WHERE PRIX BETWEEN 2 AND 6.25;
/*
ID	REF	DESIGNATION	PRIX	ID_FOU	
2	F01	Boulon laiton 4 x 40 mm (sachet de 10)	2.25	2	
3	F02	Boulon laiton 5 x 40 mm (sachet de 10)	4.45	2	
4	D01	Boulon laiton 5 x 40 mm (sachet de 10)	4.40	3	
9	F03	Coffret mêches plates	6.25	2	

*/
--e Listez tous les articles dont le prix n’est pas compris entre 2 et 6.25 euros et dont le fournisseur est Française d’Imports.

SELECT a.*
FROM ARTICLE a
JOIN FOURNISSEUR f ON a.ID_FOU = f.ID
WHERE a.PRIX NOT BETWEEN 2 AND 6.25 
AND f.NOM = 'Française d’Imports';
/*
0 résultat
*/
--f En utilisant un opérateur logique, listez tous les articles dont les fournisseurs sont la Française d’imports ou Dubois et Fils
SELECT a.*
FROM ARTICLE a
JOIN FOURNISSEUR f ON a.ID_FOU = f.ID
WHERE f.NOM ='Française d’Imports' OR f.NOM ='Dubois & Fils' 
--ORDER BY f.NOM;
/*

4	D01	Boulon laiton 5 x 40 mm (sachet de 10)	4.40	3	

*/

--g  En utilisant l’opérateur IN, réalisez la même requête que précédemment
SELECT a.*
FROM ARTICLE a
JOIN FOURNISSEUR f ON a.ID_FOU = f.ID
WHERE f.NOM IN ('Française d’Imports', 'Dubois & Fils');
/*

ID	REF	DESIGNATION	PRIX	ID_FOU	
4	D01	Boulon laiton 5 x 40 mm (sachet de 10)	4.40	3	
6	D03	Boulon acier zingué 4 x 40mm (sachet de 10)	1.80	3	
8	D04	Coffret mêches à bois	12.25	3	

*/
--h  En utilisant les opérateurs NOT et IN, listez tous les articles dont les fournisseurs ne sont ni Française d’Imports, ni Dubois et Fils
SELECT a.*
FROM ARTICLE a
JOIN FOURNISSEUR f ON a.ID_FOU = f.ID
WHERE f.NOM NOT IN ('Française d’Imports', 'Dubois & Fils');
/*
ID	REF	DESIGNATION	PRIX	ID_FOU	
1	A01	Perceuse P1	74.99	1	
5	A02	Meuleuse 125mm	37.85	1	
7	A03	Perceuse à colonne	185.25	1	
2	F01	Boulon laiton 4 x 40 mm (sachet de 10)	2.25	2	
3	F02	Boulon laiton 5 x 40 mm (sachet de 10)	4.45	2	
9	F03	Coffret mêches plates	6.25	2	
10	F04	Fraises d’encastrement	8.14	2	

*/

--i         Listez tous les bons de commande dont la date de commande est entre le 01/02/2019 et le 30/04/2019
SELECT *
FROM BON
WHERE DATE_CMDE BETWEEN '2019-02-01' AND '2019-04-30';
/*
ID	NUMERO	DATE_CMDE	DELAI	ID_FOU	
1	1	2019-02-08 09:30:00	3	1	
2	2	2019-03-02 09:30:00	5	2	

/*
SELECT
FROM
JOIN
WHERE
GROUP BY
HAVING
ORDER BY
*/