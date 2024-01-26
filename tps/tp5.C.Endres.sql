-- Listez les articles dans l’ordre alphabétique des désignations
SELECT * FROM ARTICLE ORDER BY DESIGNATION;

--Listez les articles dans l’ordre des prix du plus élevé au moins élevé
SELECT * FROM ARTICLE ORDER BY prix Desc;
-- Listez tous les articles qui sont des « boulons » et triez les résultats par ordre de prix ascendant
SELECT * FROM ARTICLE WHERE DESIGNATION  LIKE 'Boulon%' ORDER BY prix;

--Listez tous les articles dont la désignation contient le mot « sachet ».
SELECT * FROM ARTICLE WHERE DESIGNATION  LIKE '%sachet%';

--Listez tous les articles dont la désignation contient le mot « sachet » indépendamment de la casse !
-- A priori le COLLATE choisi est insensible à la casse mais dans el doute on peut ajouter un LOWER
SELECT * FROM ARTICLE WHERE LOWER(DESIGNATION)  LIKE '%sachet%';

--Listez les articles avec les informations fournisseur correspondantes. Les résultats doivent être triés 
--dans l’ordre alphabétique des fournisseurs et par article du prix le plus élevé au moins élevé.
SELECT * FROM ARTICLE, FOURNISSEUR WHERE article.ID_FOU = fournisseur.ID ORDER BY fournisseur.nom ASC, article.prix DESC;

--Listez les articles de la société « Dubois & Fils »
SELECT * FROM ARTICLE , FOURNISSEUR WHERE article.ID_FOU = fournisseur.ID AND fournisseur.nom='Dubois & Fils';

-- Calculez la moyenne des prix des articles de la société « Dubois & Fils »
SELECT AVG(article.PRIX) AS MoyennePrix FROM ARTICLE , FOURNISSEUR WHERE article.ID_FOU = fournisseur.ID AND fournisseur.nom='Dubois & Fils' ;

--Calculez la moyenne des prix des articles de chaque fournisseur
SELECT fournisseur.nom , AVG(article.PRIX) AS MoyennePrix FROM ARTICLE , FOURNISSEUR WHERE article.ID_FOU = fournisseur.ID GROUP BY fournisseur.nom;

-- Sélectionnez tous les bons de commandes émis entre le 01/03/2019 et le 05/04/2019 à 12h00.
SELECT * from BON WHERE DATE_CMDE BETWEEN '2019-03-01' AND '2019-04-05 12:00:00';

--Sélectionnez les divers bons de commande qui contiennent des boulons
SELECT bon.id, compo.id, compo.id_bon, compo.id_art, article.id, article.designation  from BON,COMPO,ARTICLE WHERE bon.id = compo.id_bon and  compo.id_art = article.id and  article.designation LIKE "Boulon%";

--Sélectionnez les divers bons de commande qui contiennent des boulons avec le nom du fournisseur associé.
SELECT bon.id,  article.designation , fournisseur.nom from BON 
JOIN COMPO ON BON.ID = COMPO.ID_BON
JOIN ARTICLE ON COMPO.ID_ART = ARTICLE.ID
JOIN FOURNISSEUR ON ARTICLE.ID_FOU = FOURNISSEUR.ID
WHERE  article.designation LIKE "Boulon%";

--Calculez le prix total de chaque bon de commande
SELECT bon.id, SUM(article.prix*compo.qte) AS PrixTotal from BON
INNER JOIN COMPO ON BON.ID = COMPO.ID_BON
INNER JOIN ARTICLE ON COMPO.ID_ART = ARTICLE.ID
GROUP BY bon.id;

--comptez le nombre d’articles de chaque bon de commande
SELECT bon.id,  SUM(compo.qte) AS NBTotalArticles from BON
INNER JOIN COMPO ON BON.ID = COMPO.ID_BON
GROUP BY bon.id;

--Affichez les numéros de bons de commande qui contiennent plus de 25 articles 
--et affichez le nombre d’articles de chacun de ces bons de commande
SELECT bon.numero, SUM(compo.qte) AS NBTotalArticles from BON
INNER JOIN COMPO ON BON.ID = COMPO.ID_BON
GROUP BY bon.numero HAVING SUM(compo.qte)>25;

--Calculez le coût total des commandes effectuées sur le mois d’avril
SELECT bon.numero, SUM(article.prix*compo.qte) AS PrixTotal from BON
INNER JOIN COMPO ON BON.ID = COMPO.ID_BON
INNER JOIN ARTICLE ON COMPO.ID_ART = ARTICLE.ID
WHERE DATE_CMDE LIKE '%-04-%';
-- ou WHERE MONTH(BON.DATE_CMDE) = 04;

--Sélectionnez les articles qui ont une désignation identique mais des fournisseurs différents 
SELECT A1.ID AS ID_Article1, A1.DESIGNATION AS Designation, A1.ID_FOU AS ID_Fournisseur1,
       A2.ID AS ID_Article2, A2.ID_FOU AS ID_Fournisseur2
FROM ARTICLE A1
JOIN ARTICLE A2 ON A1.DESIGNATION = A2.DESIGNATION
              AND A1.ID <> A2.ID
              AND A1.ID_FOU <> A2.ID_FOU;

--Calculez les dépenses en commandes mois par mois 
SELECT SUM(article.prix*compo.qte) AS PrixTotal, 
YEAR(BON.DATE_CMDE) AS Annee, MONTH(BON.DATE_CMDE) AS Mois  from BON
INNER JOIN COMPO ON BON.ID = COMPO.ID_BON
INNER JOIN ARTICLE ON COMPO.ID_ART = ARTICLE.ID
GROUP BY Annee, Mois
ORDER BY Annee, Mois

--Sélectionnez les bons de commandes sans article (indice : utilisation de EXISTS)
SELECT * FROM bon WHERE ID NOT IN (SELECT distinct id_bon from compo);
-- ou
SELECT BON.*
FROM BON
LEFT JOIN COMPO ON BON.ID = COMPO.ID_BON
WHERE COMPO.ID_BON IS NULL;
-- ou
SELECT *
FROM BON
WHERE NOT EXISTS (
    SELECT 1
    FROM COMPO
    WHERE COMPO.ID_BON = BON.ID
);

--Calculez le prix moyen des bons de commande par fournisseur.
SELECT fournisseur.nom, AVG(article.prix*compo.qte) AS PrixMoyen from BON
INNER JOIN COMPO ON BON.ID = COMPO.ID_BON
INNER JOIN ARTICLE ON COMPO.ID_ART = ARTICLE.ID
JOIN FOURNISSEUR ON ARTICLE.ID_FOU = FOURNISSEUR.ID
GROUP BY fournisseur.nom;


