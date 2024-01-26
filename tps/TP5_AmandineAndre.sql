-- Requêtes à réaliser :
-- a. Listez les articles dans l’ordre alphabétique des désignations
SELECT *
FROM ARTICLE
ORDER BY DESIGNATION
;
/*Renvoie 10 enregistrements*/

-- b. Listez les articles dans l’ordre des prix du plus élevé au moins élevé
SELECT *
FROM ARTICLE
ORDER BY PRIX DESC
;
/*Renvoie 10 enregistrements*/

-- c. Listez tous les articles qui sont des « boulons » et triez les résultats par ordre de prix ascendant
SELECT *
FROM ARTICLE
WHERE DESIGNATION LIKE "%boulon%"
ORDER BY PRIX
;
/*Renvoie 4 enregistrement*/

-- d. Listez tous les articles dont la désignation contient le mot « sachet ».
SELECT *
FROM ARTICLE
WHERE DESIGNATION LIKE "%sachet%"
;
/*Renvoie 4 enregistrements*/

-- e. Listez tous les articles dont la désignation contient le mot « sachet » indépendamment de la casse !
SELECT *
FROM ARTICLE
WHERE LOWER(DESIGNATION) LIKE "%sachet%"
;
/*Renvoie 4 enregistrements*/

-- f. Listez les articles avec les informations fournisseur correspondantes. Les résultats doivent être triées 
-- dans l’ordre alphabétique des fournisseurs et par article du prix le plus élevé au moins élevé.
SELECT *
FROM ARTICLE, FOURNISSEUR
WHERE ARTICLE.ID_FOU = FOURNISSEUR.ID
ORDER BY FOURNISSEUR.NOM ASC, ARTICLE.PRIX DESC
;
/*Renvoie 10 enregistrements*/

-- g. Listez les articles de la société « Dubois & Fils »
SELECT *
FROM ARTICLE, FOURNISSEUR
WHERE (ARTICLE.ID_FOU = FOURNISSEUR.ID) AND FOURNISSEUR.NOM LIKE 'Dubois & Fils'
;
/*Renvoie 3 enregistrements*/

-- h. Calculez la moyenne des prix des articles de la société « Dubois & Fils »
SELECT FOURNISSEUR.NOM, AVG(ARTICLE.PRIX)
FROM ARTICLE, FOURNISSEUR
WHERE (ARTICLE.ID_FOU = FOURNISSEUR.ID) AND FOURNISSEUR.NOM LIKE 'Dubois & Fils'
GROUP BY FOURNISSEUR.NOM
;
/*Renvoie 1 résultat : 6.15 €*/

-- i. Calculez la moyenne des prix des articles de chaque fournisseur
SELECT FOURNISSEUR.NOM, AVG(ARTICLE.PRIX)
FROM ARTICLE, FOURNISSEUR
WHERE (ARTICLE.ID_FOU = FOURNISSEUR.ID)
GROUP BY FOURNISSEUR.NOM
;
/* Renvoie 3 résultats : Dubois & Fils - 6.150000 ; FDM SA - 5.272500 ; Française d'Imports - 99.363333*/

-- j. Sélectionnez tous les bons de commandes émis entre le 01/03/2019 et le 05/04/2019 à 12h00.
SELECT * 
FROM bon
WHERE (DATE_CMDE BETWEEN '2019-03-01 00:00:00' AND '2019-04-05 12:00:00')
;
/*Renvoie 1 résultat : une commande passée le 2019-03-02 09:30:00 */

-- k. Sélectionnez les divers bons de commande qui contiennent des boulons
SELECT bon.*, compo.QTE, compo.ID_ART, article.DESIGNATION, article.REF, article.PRIX, article.ID_FOU
FROM bon
    LEFT JOIN compo ON bon.ID = compo.ID_BON
    LEFT JOIN article ON compo.ID_ART = article.ID
WHERE ARTICLE.DESIGNATION LIKE '%boulon%'
;
/*Renvoie 2 résultats : 2 lignes pour le bon de commande 2 */

-- l. Sélectionnez les divers bons de commande qui contiennent des boulons avec le nom du fournisseur associé.
SELECT bon.*, compo.QTE, compo.ID_ART, article.DESIGNATION, article.REF, article.PRIX, article.ID_FOU, fournisseur.NOM
FROM bon
    LEFT JOIN compo ON bon.ID = compo.ID_BON
    LEFT JOIN article ON compo.ID_ART = article.ID
    LEFT JOIN fournisseur ON bon.ID_FOU = fournisseur.ID
WHERE ARTICLE.DESIGNATION LIKE '%boulon%'
;
/*Renvoie 2 résultats : 2 lignes pour le bon de commande 2 */

-- m. Calculez le prix total de chaque bon de commande
SELECT bon.ID, SUM(compo.QTE*article.PRIX)
FROM bon
    LEFT JOIN compo ON bon.ID = compo.ID_BON
    LEFT JOIN article ON compo.ID_ART = article.ID
GROUP BY bon.ID
;
/*Renvoie 2 résultats : bon.ID : 1 - SUM : 561.62 ; bon.ID : 2 - SUM : 262.54*/

-- n. Comptez le nombre d’articles de chaque bon de commande
SELECT bon.ID, SUM(compo.QTE)
FROM bon
    LEFT JOIN compo ON bon.ID = compo.ID_BON
GROUP BY bon.ID
;
/*Renvoie 2 résultats : bon.ID : 1 - SUM : 8 ; bon.ID : 2 - SUM : 59*/

-- o. Affichez les numéros de bons de commande qui contiennent plus de 25 articles et affichez le nombre d’articles 
-- de chacun de ces bons de commande
SELECT bon.ID, SUM(compo.QTE) AS NB_ARTICLE
FROM bon
    LEFT JOIN compo ON bon.ID = compo.ID_BON
GROUP BY bon.ID HAVING SUM(compo.QTE) > 25
;
/*Renvoie 1 résultat : bon.ID : 2 - NB_ARTICLE : 59 */

-- p. Calculez le coût total des commandes effectuées sur le mois d’avril
SELECT MONTH(bon.DATE_CMDE) AS MOIS, SUM(compo.QTE*article.PRIX) AS COUT_TOTAL
FROM bon
    LEFT JOIN compo ON bon.ID = compo.ID_BON
    LEFT JOIN article ON compo.ID_ART = article.ID
WHERE MONTH(bon.DATE_CMDE) = '04'
GROUP BY MONTH(bon.DATE_CMDE)
;
/*ne renvoie aucun résultat : les commandes ont été passées au mois de février ou mars*/

-- 3) Requêtes plus difficiles (facultatives)
-- a. Sélectionnez les articles qui ont une désignation identique mais des fournisseurs différents 
-- (indice : réaliser une auto jointure i.e. de la table avec elle-même)
SELECT ARTICLE_V1.ID, ARTICLE_V1.REF, ARTICLE_V1.DESIGNATION, ARTICLE_V1.PRIX, ARTICLE_V1.ID_FOU
FROM ARTICLE AS ARTICLE_V1
    INNER JOIN ARTICLE AS ARTICLE_V2 ON (ARTICLE_V1.DESIGNATION = ARTICLE_V2.DESIGNATION AND ARTICLE_V1.ID_FOU <> ARTICLE_V2.ID_FOU)
;
/*Renvoie 2 enregistrements : Boulon laiton 5 x 40 mm (sachet de 10) qui a 2 fournisseurs différents*/

-- b. Calculez les dépenses en commandes mois par mois (indice : utilisation des fonctions MONTH et YEAR)
SELECT YEAR(bon.DATE_CMDE) AS ANNEE, MONTH(bon.DATE_CMDE) AS MOIS, SUM(compo.QTE*article.PRIX) AS DEPENSES
FROM bon
    LEFT JOIN compo ON bon.ID = compo.ID_BON
    LEFT JOIN article ON compo.ID_ART = article.ID
GROUP BY MONTH(bon.DATE_CMDE)
ORDER BY YEAR(bon.DATE_CMDE), MONTH(bon.DATE_CMDE)
;
/*Renvoie 2 résultats car seulement 2 mois de commande*/

-- c. Sélectionnez les bons de commandes sans article (indice : utilisation de EXISTS)
SELECT *
FROM bon
    LEFT JOIN compo ON bon.ID = compo.ID_BON 
WHERE compo.ID_ART IS NULL
;
/*Ne renvoie aucunr résulat, car tous les bons de commandes ont des articles de renseignés*/

-- d. Calculez le prix moyen des bons de commande par fournisseur.
SELECT VIRTUA.FOURNISSEUR, AVG(COUT)
FROM (SELECT bon.ID as ID, fournisseur.NOM as FOURNISSEUR, SUM(compo.QTE*article.PRIX) AS COUT 
        FROM bon
            LEFT JOIN compo ON bon.ID = compo.ID_BON
            LEFT JOIN article ON compo.ID_ART = article.ID
            LEFT JOIN fournisseur ON bon.ID_FOU = fournisseur.ID 
        GROUP BY bon.ID, fournisseur.NOM) VIRTUA
GROUP BY VIRTUA.FOURNISSEUR
;
/*Renvoie 2 résultats car seulement 2 fournisseurs ont passé des commandes*/

