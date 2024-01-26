-----------------------------------------------
-- 3) Requêtes plus difficiles (facultatives) :
-----------------------------------------------

-- a. Sélectionnez les articles qui ont une désignation identique mais des fournisseurs différents (indice : réaliser une auto jointure i.e. de la table avec elle-même)

SELECT article_1.DESIGNATION, article_1.ID_FOU
FROM article as article_1
INNER JOIN article as article_2 ON article_1.DESIGNATION = article_2.DESIGNATION
WHERE article_1.ID_FOU != article_2.ID_FOU

-- b. Calculez les dépenses en commandes mois par mois (indice : utilisation des fonctions MONTH et YEAR).

SELECT YEAR(bon.DATE_CMDE) AS year, MONTH(bon.DATE_CMDE) AS month, AVG(compo.QTE*article.PRIX) AS prix_moy
FROM bon
INNER JOIN compo ON bon.ID = compo.ID_bon
INNER JOIN article ON compo.ID_ART = article.ID
GROUP BY year, month
ORDER BY year, month

-- c. Sélectionnez les bons de commandes sans article (indice : utilisation de EXISTS).

SELECT *
FROM bon
WHERE NOT EXISTS (
    SELECT * 
    FROM compo 
    WHERE bon.ID = compo.ID_BON
)

-- d. Calculez le prix moyen des bons de commande par fournisseur.

SELECT bon.*, fournisseur.NOM, SUM(compo.QTE*article.PRIX)/virtua.tot
FROM bon 
INNER JOIN (SELECT ID_FOU, COUNT(*) AS tot FROM bon GROUP BY ID_FOU) virtua ON virtua.ID_FOU = bon.ID_FOU
INNER JOIN compo ON bon.ID = compo.ID_bon
INNER JOIN article ON compo.ID_ART = article.ID
INNER JOIN fournisseur ON fournisseur.ID = bon.ID_FOU
GROUP BY bon.ID_FOU;
