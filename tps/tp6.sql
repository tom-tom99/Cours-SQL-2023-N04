--a. Mettez en majuscules les désignations de tous les articles dont le prix est strictement supérieur à 10€
UPDATE ARTICLE
SET DESIGNATION = UPPER(DESIGNATION)
WHERE PRIX > 10;
--b. Mettez en minuscules la désignation de l’article dont l’identifiant est 2
UPDATE ARTICLE
SET DESIGNATION = LOWER(DESIGNATION)
WHERE ID = 2;
--c. Augmentez les prix de 10% pour tous les articles du fournisseur FDM SA
UPDATE ARTICLE
SET PRIX = PRIX *1.10
WHERE ID_FOU =  (SELECT ID
FROM FOURNISSEUR
WHERE NOM ='FDM SA');