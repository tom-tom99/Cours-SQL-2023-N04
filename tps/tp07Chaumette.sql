a. Supprimer dans la table compo toutes les lignes concernant les bons de commande 
d’avril 2019

delete from compo
where ID_BON in 
(select id from bon where month(DATE_CMDE) = 4)



b. Supprimer dans la table bon tous les bons de commande d’avril 2019.

delete from bon 
where month(DATE_CMDE) = 4

