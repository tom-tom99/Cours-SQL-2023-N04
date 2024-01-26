SET SQL_SAFE_UPDATES = 0;

-- Mettez en majuscules les désignations de tous les articles dont le prix est strictement supérieur à 10€
UPDATE ARTICLE  SET DESIGNATION = UPPER(DESIGNATION) WHERE prix>10;

-- Mettez en minuscules la désignation de l’article dont l’identifiant est 2
UPDATE ARTICLE  SET DESIGNATION = LOWER(DESIGNATION) WHERE id=2;

--Augmentez les prix de 10% pour tous les articles du fournisseur FDM SA
UPDATE ARTICLE, fournisseur  
SET article.PRIX = article.PRIX*1.1 
WHERE article.id_fou= fournisseur.id and fournisseur.nom='FDM SA';
