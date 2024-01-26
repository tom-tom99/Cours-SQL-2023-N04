-- Commencer par désactiver le safe mode : 
SET SQL_SAFE_UPDATES = 0;

-- Mettez en majuscules les désignations de tous les articles dont le prix est strictement supérieur à 10€
UPDATE article
SET DESIGNATION = UCASE(DESIGNATION)
WHERE PRIX > 10
;

article (ID, REF, DESIGNATION, PRIX, ID_FOU)
-- Mettez en minuscules la désignation de l’article dont l’identifiant est 2
UPDATE article
SET DESIGNATION = LCASE(DESIGNATION)
WHERE ID = 2
;

-- Augmentez les prix de 10% pour tous les articles du fournisseur FDM SA
UPDATE article
SET PRIX = (PRIX*1.1)
WHERE ID_FOU = 2
;