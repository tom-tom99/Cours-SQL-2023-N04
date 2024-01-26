--a. Listez les articles dans l’ordre alphabétique des désignations
SELECT *
FROM ARTICLE
ORDER BY DESIGNATION ASC

--b. Listez les articles dans l’ordre des prix du plus élevé au moins élevé
SELECT *
FROM ARTICLE
ORDER BY PRIX DESC

--c. Listez tous les articles qui sont des « boulons » et triez les résultats par ordre de prix ascendant
SELECT *
FROM ARTICLE
WHERE DESIGNATION LIKE '%boulon%'  
ORDER BY PRIX ASC

--d. Listez tous les articles dont la désignation contient le mot « sachet ».
SELECT *
FROM ARTICLE
WHERE DESIGNATION LIKE '%sachet%';

--e. Listez tous les articles dont la désignation contient le mot « sachet » indépendamment de la casse !
SELECT *
FROM ARTICLE
WHERE LOWER(DESIGNATION) LIKE '%sachet%';

--f. Listez les articles avec les informations fournisseur correspondantes. Les résultats doivent être triées dans l’ordre alphabétique des fournisseurs et par article du prix le plus élevé au moins élevé.
SELECT a.*, f.NOM 
FROM ARTICLE a
JOIN FOURNISSEUR f ON a.ID_FOU = f.ID
ORDER BY f.NOM ASC, a.PRIX DESC;

--g. Listez les articles de la société Dubois & Fils 
SELECT *
FROM ARTICLE 
JOIN FOURNISSEUR f ON ID_FOU = f.ID
WHERE f.NOM = 'Dubois & Fils';


--h. Calculez la moyenne des prix des articles de la société « Dubois & Fils »
SELECT AVG(a.PRIX) AS MoyennePrix
FROM ARTICLE 
JOIN FOURNISSEUR f ON ID_FOU = f.ID
WHERE f.NOM = 'Dubois & Fils';



--i. Calculez la moyenne des prix des articles de chaque fournisseur

SELECT AVG(PRIX),f.NOM
FROM ARTICLE 
JOIN FOURNISSEUR f ON ID_FOU = f.ID
GROUP BY f.NOM

--j. Sélectionnez tous les bons de commandes émis entre le 01/03/2019 et le 05/04/2019 à 12h00.
SELECT *
FROM BON b
WHERE DATE_CMDE BETWEEN '2019-02-01' AND '2019-04-30 12:00:00';

--k. Sélectionnez les divers bons de commande qui contiennent des boulons
SELECT DISTINCT b.*
FROM BON b
JOIN COMPO c ON b.ID = c.ID_BON
JOIN ARTICLE a ON c.ID_ART = a.ID
WHERE a.DESIGNATION LIKE '%boulon%';

--l. Sélectionnez les divers bons de commande qui contiennent des boulons avec le nom du fournisseur associé.
SELECT DISTINCT b.*,f.NOM
FROM BON b
JOIN FOURNISSEUR f ON f.ID = b.ID_FOU
JOIN COMPO c ON b.ID = c.ID_BON
JOIN ARTICLE a ON c.ID_ART = a.ID
WHERE a.DESIGNATION LIKE '%boulon%';

--m. Calculez le prix total de chaque bon de commande
SELECT b.ID, b.NUMERO, SUM(a.PRIX * c.QTE) AS PrixTotal
FROM BON b
JOIN COMPO c ON b.ID = c.ID_BON
JOIN ARTICLE a ON c.ID_ART = a.ID
GROUP BY b.ID;

--n. Comptez le nombre d’articles de chaque bon de commande
SELECT b.ID, b.NUMERO, SUM(c.QTE) AS QteTotal
FROM BON b
JOIN COMPO c ON b.ID = c.ID_BON
JOIN ARTICLE a ON c.ID_ART = a.ID
GROUP BY b.ID;

--o. Affichez les numéros de bons de commande qui contiennent plus de 25 articles et affichez le nombre d’articles de chacun de ces bons de commande
SELECT b.ID, b.NUMERO, SUM(c.QTE)
FROM BON b,COMPO c,ARTICLE a
WHERE b.ID = c.ID_BON
AND c.ID_ART = a.ID
GROUP BY b.ID
HAVING SUM(c.QTE)>25;

--p. Calculez le coût total des commandes effectuées sur le mois d’avril
SELECT b.ID, b.NUMERO, SUM(a.PRIX * c.QTE)
FROM BON b,COMPO c,ARTICLE a
WHERE b.ID = c.ID_BON
AND c.ID_ART = a.ID
GROUP BY b.ID
HAVING b.DATE_CMDE LIKE '2019-04-%';

--a. Sélectionnez les articles qui ont une désignation identique mais des fournisseurs différents (indice : réaliser une auto jointure i.e. de la table avec elle-même)
SELECT a1.*, f1.NOM , a2.ID_FOU, f2.NOM 
FROM ARTICLE a1
JOIN FOURNISSEUR f1 ON a1.ID_FOU = f1.ID
JOIN ARTICLE a2 ON a1.DESIGNATION = a2.DESIGNATION AND a1.ID_FOU <> a2.ID_FOU
JOIN FOURNISSEUR f2 ON a2.ID_FOU = f2.ID;

--b. Calculez les dépenses en commandes mois par mois (indice : utilisation des fonctions MONTH et YEAR)
SELECT YEAR(b.DATE_CMDE) AS Annee, MONTH(b.DATE_CMDE) AS Mois, SUM(a.PRIX * c.QTE) AS Depenses
FROM BON b
JOIN COMPO c ON b.ID = c.ID_BON
JOIN ARTICLE a ON c.ID_ART = a.ID
GROUP BY Annee, Mois
ORDER BY Annee, Mois;

--c. Sélectionnez les bons de commandes sans article (indice : utilisation de EXISTS)
SELECT *
FROM BON b
WHERE NOT EXISTS (
    SELECT 1
    FROM COMPO c
    WHERE c.ID_BON = b.ID
);

--d. Calculez le prix moyen des bons de commande par fournisseur.
SELECT DISTINCT b.*,f.NOM,AVG(a.PRIX * c.QTE) AS Prix
FROM BON b
JOIN FOURNISSEUR f ON f.ID = b.ID_FOU
JOIN COMPO c ON b.ID = c.ID_BON
JOIN ARTICLE a ON c.ID_ART = a.ID
GROUP BY NOM;

