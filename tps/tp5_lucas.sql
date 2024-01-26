--a. Listez les articles dans l’ordre alphabétique des désignations
SELECT *
FROM ARTICLE
ORDER BY DESIGNATION ASC
/*

ID	REF	DESIGNATION   	PRIX	ID_FOU	
6	D03	Boulon acier zingué 4 x 40mm (sachet de 10)	1.80	3	
2	F01	Boulon laiton 4 x 40 mm (sachet de 10)	2.25	2	
3	F02	Boulon laiton 5 x 40 mm (sachet de 10)	4.45	2	
4	D01	Boulon laiton 5 x 40 mm (sachet de 10)	4.40	3	
8	D04	Coffret mêches à bois	12.25	3	
9	F03	Coffret mêches plates	6.25	2	
10	F04	Fraises d’encastrement	8.14	2	
5	A02	Meuleuse 125mm	37.85	1	
7	A03	Perceuse à colonne	185.25	1	
1	A01	Perceuse P1	74.99	1	
*/

--b. Listez les articles dans l’ordre des prix du plus élevé au moins élevé
SELECT *
FROM ARTICLE
ORDER BY PRIX DESC
/*
ID	REF	DESIGNATION	PRIX   	ID_FOU	
7	A03	Perceuse à colonne	185.25	1	
1	A01	Perceuse P1	74.99	1	
5	A02	Meuleuse 125mm	37.85	1	
8	D04	Coffret mêches à bois	12.25	3	
10	F04	Fraises d’encastrement	8.14	2	
9	F03	Coffret mêches plates	6.25	2	
3	F02	Boulon laiton 5 x 40 mm (sachet de 10)	4.45	2	
4	D01	Boulon laiton 5 x 40 mm (sachet de 10)	4.40	3	
2	F01	Boulon laiton 4 x 40 mm (sachet de 10)	2.25	2	
6	D03	Boulon acier zingué 4 x 40mm (sachet de 10)	1.80	3	

*/
--c. Listez tous les articles qui sont des « boulons » et triez les résultats par ordre de prix ascendant
SELECT *
FROM ARTICLE
WHERE DESIGNATION LIKE '%boulon%'  
ORDER BY PRIX ASC
/*

ID	REF	DESIGNATION	PRIX   	ID_FOU	
6	D03	Boulon acier zingué 4 x 40mm (sachet de 10)	1.80	3	
2	F01	Boulon laiton 4 x 40 mm (sachet de 10)	2.25	2	
4	D01	Boulon laiton 5 x 40 mm (sachet de 10)	4.40	3	
3	F02	Boulon laiton 5 x 40 mm (sachet de 10)	4.45	2	
*/
--d. Listez tous les articles dont la désignation contient le mot « sachet ».
SELECT *
FROM ARTICLE
WHERE DESIGNATION LIKE '%sachet%';
/*
ID	REF	DESIGNATION	PRIX	ID_FOU	
2	F01	Boulon laiton 4 x 40 mm (sachet de 10)	2.25	2	
3	F02	Boulon laiton 5 x 40 mm (sachet de 10)	4.45	2	
4	D01	Boulon laiton 5 x 40 mm (sachet de 10)	4.40	3	
6	D03	Boulon acier zingué 4 x 40mm (sachet de 10)	1.80	3	
*/
--e. Listez tous les articles dont la désignation contient le mot « sachet » indépendamment de la casse !
SELECT *
FROM ARTICLE
WHERE LOWER(DESIGNATION) LIKE '%sachet%';
/*
ID	REF	DESIGNATION	PRIX	ID_FOU	
2	F01	Boulon laiton 4 x 40 mm (sachet de 10)	2.25	2	
3	F02	Boulon laiton 5 x 40 mm (sachet de 10)	4.45	2	
4	D01	Boulon laiton 5 x 40 mm (sachet de 10)	4.40	3	
6	D03	Boulon acier zingué 4 x 40mm (sachet de 10)	1.80	3	
*/
--f. Listez les articles avec les informations fournisseur correspondantes. Les résultats doivent être triées dans l’ordre alphabétique des fournisseurs et par article du prix le plus élevé au moins élevé.
SELECT a.*, f.NOM 
FROM ARTICLE a
JOIN FOURNISSEUR f ON a.ID_FOU = f.ID
ORDER BY f.NOM ASC, a.PRIX DESC;
/*
ID	REF	DESIGNATION	PRIX	ID_FOU	NOM   	
8	D04	Coffret mêches à bois	12.25	3	Dubois & Fils	
4	D01	Boulon laiton 5 x 40 mm (sachet de 10)	4.40	3	Dubois & Fils	
6	D03	Boulon acier zingué 4 x 40mm (sachet de 10)	1.80	3	Dubois & Fils	
10	F04	Fraises d’encastrement	8.14	2	FDM SA	
9	F03	Coffret mêches plates	6.25	2	FDM SA	
3	F02	Boulon laiton 5 x 40 mm (sachet de 10)	4.45	2	FDM SA	
2	F01	Boulon laiton 4 x 40 mm (sachet de 10)	2.25	2	FDM SA	
7	A03	Perceuse à colonne	185.25	1	Française d'Imports	
1	A01	Perceuse P1	74.99	1	Française d'Imports	
5	A02	Meuleuse 125mm	37.85	1	Française d'Imports	
*/
--g. Listez les articles de la société « Dubois & Fils »
SELECT a.*, f.NOM
FROM ARTICLE a
JOIN FOURNISSEUR f ON a.ID_FOU = f.ID
WHERE f.NOM = 'Dubois & Fils';
/*
ID	REF	DESIGNATION	PRIX	ID_FOU	NOM	
4	D01	Boulon laiton 5 x 40 mm (sachet de 10)	4.40	3	Dubois & Fils	
6	D03	Boulon acier zingué 4 x 40mm (sachet de 10)	1.80	3	Dubois & Fils	
8	D04	Coffret mêches à bois	12.25	3	Dubois & Fils	
*/

--h. Calculez la moyenne des prix des articles de la société « Dubois & Fils »
SELECT AVG(a.PRIX) AS MoyennePrix,f.NOM
FROM ARTICLE a
JOIN FOURNISSEUR f ON a.ID_FOU = f.ID
WHERE f.NOM = 'Dubois & Fils';

/*
MoyennePrix  NOM
6.150000	Dubois & Fils	
*/

--i. Calculez la moyenne des prix des articles de chaque fournisseur

SELECT AVG(a.PRIX),f.NOM
FROM ARTICLE a
JOIN FOURNISSEUR f ON a.ID_FOU = f.ID
GROUP BY f.NOM
/*
AVG(a.PRIX)	NOM	
6.150000	Dubois & Fils	
5.272500	FDM SA	
99.363333	Française d'Imports	

*/
--j. Sélectionnez tous les bons de commandes émis entre le 01/03/2019 et le 05/04/2019 à 12h00.
SELECT *
FROM BON b
WHERE DATE_CMDE BETWEEN '2019-02-01' AND '2019-04-30 12:00:00';
/*
ID	NUMERO	DATE_CMDE	DELAI	ID_FOU	
1	1	2019-02-08 09:30:00	3	1	
2	2	2019-03-02 09:30:00	5	2	
*/
--k. Sélectionnez les divers bons de commande qui contiennent des boulons
SELECT DISTINCT b.*
FROM BON b
JOIN COMPO c ON b.ID = c.ID_BON
JOIN ARTICLE a ON c.ID_ART = a.ID
WHERE a.DESIGNATION LIKE '%boulon%';
/*


ID NUMERO DATE_CMDE DELAI ID_FOU
2	2	2019-03-02 09:30:00	5	2	

*/
--l. Sélectionnez les divers bons de commande qui contiennent des boulons avec le nom du fournisseur associé.
SELECT DISTINCT b.*,f.NOM
FROM BON b
JOIN FOURNISSEUR f ON f.ID = b.ID_FOU
JOIN COMPO c ON b.ID = c.ID_BON
JOIN ARTICLE a ON c.ID_ART = a.ID
WHERE a.DESIGNATION LIKE '%boulon%';
/*
ID NUMERO DATE_CMDE DELAI ID_FOU NOM
2	2	2019-03-02 09:30:00	5	2	FDM SA	

*/
--m. Calculez le prix total de chaque bon de commande
SELECT b.ID, b.NUMERO, SUM(a.PRIX * c.QTE) AS PrixTotal
FROM BON b
JOIN COMPO c ON b.ID = c.ID_BON
JOIN ARTICLE a ON c.ID_ART = a.ID
GROUP BY b.ID;
/*

ID	NUMERO	PrixTotal	
1	1	561.62	
2	2	262.54	

*/
--n. Comptez le nombre d’articles de chaque bon de commande
SELECT b.ID, b.NUMERO, SUM(c.QTE) AS QteTotal
FROM BON b
JOIN COMPO c ON b.ID = c.ID_BON
JOIN ARTICLE a ON c.ID_ART = a.ID
GROUP BY b.ID;
/*


ID	NUMERO	QteTotal	
1	1	8	
2	2	59	
*/
--o. Affichez les numéros de bons de commande qui contiennent plus de 25 articles et affichez le nombre d’articles de chacun de ces bons de commande
SELECT b.ID, b.NUMERO, SUM(c.QTE)
FROM BON b,COMPO c,ARTICLE a
WHERE b.ID = c.ID_BON
AND c.ID_ART = a.ID
GROUP BY b.ID
HAVING SUM(c.QTE)>25;
/*
ID NUMERO SUM(c.QTE)
2	2	59	

*/
--p. Calculez le coût total des commandes effectuées sur le mois d’avril
SELECT SUM(a.PRIX * c.QTE) as coutTotal
FROM BON b,COMPO c,ARTICLE a
WHERE b.ID = c.ID_BON
AND c.ID_ART = a.ID
WHERE b.DATE_CMDE LIKE '2019-04-%';
/* 0 résultat */

--a. Sélectionnez les articles qui ont une désignation identique mais des fournisseurs différents (indice : réaliser une auto jointure i.e. de la table avec elle-même)
SELECT a1.*, f1.NOM , a2.ID_FOU, f2.NOM 
FROM ARTICLE a1
JOIN FOURNISSEUR f1 ON a1.ID_FOU = f1.ID
JOIN ARTICLE a2 ON a1.DESIGNATION = a2.DESIGNATION AND a1.ID_FOU <> a2.ID_FOU
JOIN FOURNISSEUR f2 ON a2.ID_FOU = f2.ID;

/*
ID	REF	DESIGNATION	PRIX	ID_FOU	NOM	ID_FOU	NOM	
4	D01	Boulon laiton 5 x 40 mm (sachet de 10)	4.40	3	Dubois & Fils	2	FDM SA	
3	F02	Boulon laiton 5 x 40 mm (sachet de 10)	4.45	2	FDM SA	3	Dubois & Fils	
*/
--b. Calculez les dépenses en commandes mois par mois (indice : utilisation des fonctions MONTH et YEAR)
SELECT YEAR(b.DATE_CMDE) AS Annee, MONTH(b.DATE_CMDE) AS Mois, SUM(a.PRIX * c.QTE) AS Depenses
FROM BON b
JOIN COMPO c ON b.ID = c.ID_BON
JOIN ARTICLE a ON c.ID_ART = a.ID
GROUP BY Annee, Mois
ORDER BY Annee, Mois;
/*
Annee   	Mois   	Depenses	
2019	2	561.62	
2019	3	262.54	
*/
--c. Sélectionnez les bons de commandes sans article (indice : utilisation de EXISTS)
SELECT *
FROM BON b
WHERE NOT EXISTS (
    SELECT 1
    FROM COMPO c
    WHERE c.ID_BON = b.ID
);
/*
0 resultat
*/
--d. Calculez le prix moyen des bons de commande par fournisseur.
SELECT DISTINCT b.*,f.NOM,AVG(a.PRIX * c.QTE) AS Prix
FROM BON b
JOIN FOURNISSEUR f ON f.ID = b.ID_FOU
JOIN COMPO c ON b.ID = c.ID_BON
JOIN ARTICLE a ON c.ID_ART = a.ID
GROUP BY NOM;

/*

ID	NUMERO	DATE_CMDE	DELAI	ID_FOU	NOM	Prix	
2	2	2019-03-02 09:30:00	5	2	FDM SA	65.635000	
1	1	2019-02-08 09:30:00	3	1	Française d'Imports	187.206667	
*/
