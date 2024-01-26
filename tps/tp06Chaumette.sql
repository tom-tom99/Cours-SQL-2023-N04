a. Mettez en majuscules les désignations de tous les articles dont le prix est strictement 
supérieur à 10€

UPDATE ARTICLE
SET DESIGNATION = upper(designation)
WHERE prix > 10

b. Mettez en minuscules la désignation de l’article dont l’identifiant est 2
UPDATE ARTICLE
SET DESIGNATION = lower(designation)
WHERE id = 2


c. Augmentez les prix de 10% pour tous les articles du fournisseur FDM SA
update Article
set prix = prix*1.1
where id_fou = 2



