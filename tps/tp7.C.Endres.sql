SET SQL_SAFE_UPDATES = 0;

--Supprimer dans la table compo toutes les lignes concernant les bons de commande d’avril 2019
DELETE FROM COMPO
WHERE ID_BON IN (
    SELECT ID
    FROM BON
    WHERE YEAR(DATE_CMDE) = 2019 AND MONTH(DATE_CMDE) = 4
);
-- Supprimer dans la table bon tous les bons de commande d’avril 2019.
DELETE FROM BON WHERE YEAR(DATE_CMDE) = 2019 AND MONTH(DATE_CMDE) = 4;