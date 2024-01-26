SET SQL_SAFE_UPDATES = 0;

UPDATE article set designation = UPPER(designation) where PRIX>10.0;

UPDATE article set designation = LOWER(designation) where id=2;

UPDATE article set PRIX = PRIX*1.10 where id_fou = 2;
