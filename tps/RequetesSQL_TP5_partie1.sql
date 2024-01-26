---------------------------
-- 2) Requêtes à réaliser :
---------------------------

-- a. Listez les articles dans l’ordre alphabétique des désignations.

SELECT * FROM article ORDER BY DESIGNATION

-- b. Listez les articles dans l’ordre des prix du plus élevé au moins élevé.

SELECT * FROM article ORDER BY PRIX DESC

-- c. Listez tous les articles qui sont des « boulons » et triez les résultats par ordre de prix ascendant.

SELECT * FROM article WHERE DESIGNATION LIKE 'boulon%' ORDER BY PRIX

-- d. Listez tous les articles dont la désignation contient le mot « sachet ».
SELECT * FROM article WHERE DESIGNATION LIKE '%sachet%'

-- e. Listez tous les articles dont la désignation contient le mot « sachet » indépendamment de la casse !

SELECT * FROM article WHERE DESIGNATION COLLATE UTF8_GENERAL_CI LIKE '%SACHET%'

-- f. Listez les articles avec les informations fournisseur correspondantes. Les résultats doivent être triées dans l’ordre alphabétique des fournisseurs et par article du prix le plus élevé au moins élevé.

SELECT * 
FROM article
LEFT JOIN fournisseur ON article.ID_FOU = fournisseur.ID
ORDER BY NOM, PRIX DESC;

-- g. Listez les articles de la société « Dubois & Fils ».

SELECT * 
FROM article
INNER JOIN fournisseur ON article.ID_FOU = fournisseur.ID
WHERE NOM = 'Dubois & fils';

-- h. Calculez la moyenne des prix des articles de la société « Dubois & Fils ».

SELECT NOM, AVG(PRIX) FROM article, fournisseur
WHERE article.ID_FOU = fournisseur.ID
GROUP BY NOM
HAVING NOM = 'Dubois & fils';

-- ou

SELECT NOM, AVG(PRIX) FROM article, fournisseur
WHERE article.ID_FOU = fournisseur.ID AND fournisseur.NOM = 'Dubois & Fils'
GROUP BY NOM

-- i. Calculez la moyenne des prix des articles de chaque fournisseur.

SELECT NOM, AVG(PRIX) FROM article, fournisseur
WHERE article.ID_FOU = fournisseur.ID
GROUP BY NOM

-- j. Sélectionnez tous les bons de commandes émis entre le 01/03/2019 et le 05/04/2019 à 12h00.

SELECT * FROM bon
WHERE DATE_CMDE BETWEEN '2019-03-01 00:00:00' AND '2019-04-05 00:00:00';

-- k. Sélectionnez les divers bons de commande qui contiennent des boulons.

SELECT * FROM bon
WHERE DATE_CMDE BETWEEN '2019-03-01 00:00:00' AND '2019-04-05 00:00:00';

-- l. Sélectionnez les divers bons de commande qui contiennent des boulons avec le nom du fournisseur associé.

SELECT bon.*, compo.QTE, article.DESIGNATION, fournisseur.NOM FROM bon
INNER JOIN compo ON bon.ID = compo.ID_bon
INNER JOIN article ON compo.ID_ART = article.ID
LEFT JOIN fournisseur ON article.ID_FOU = fournisseur.ID

WHERE article.DESIGNATION LIKE 'boulon%' 

-- m. Calculez le prix total de chaque bon de commande.

SELECT bon.*, SUM(compo.QTE*article.PRIX) FROM bon
INNER JOIN compo ON bon.ID = compo.ID_bon
INNER JOIN article ON compo.ID_ART = article.ID
GROUP BY bon.ID;

-- n. Comptez le nombre d’articles de chaque bon de commande.

SELECT bon.*, SUM(compo.QTE) FROM bon
INNER JOIN compo ON bon.ID = compo.ID_bon
INNER JOIN article ON compo.ID_ART = article.ID
GROUP BY bon.ID;

-- o. Affichez les numéros de bons de commande qui contiennent plus de 25 articles et affichez le nombre d’articles de chacun de ces bons de commande.

SELECT bon.ID, SUM(compo.QTE) FROM bon
INNER JOIN compo ON bon.ID = compo.ID_bon
INNER JOIN article ON compo.ID_ART = article.ID
GROUP BY bon.ID
HAVING SUM(compo.QTE) >= 25;

-- p. Calculez le coût total des commandes effectuées sur le mois d’avril.

SELECT bon.*, SUM(compo.QTE*article.PRIX) FROM bon
INNER JOIN compo ON bon.ID = compo.ID_bon
INNER JOIN article ON compo.ID_ART = article.ID
GROUP BY bon.ID
HAVING month(bon.DATE_CMDE) = '04'


