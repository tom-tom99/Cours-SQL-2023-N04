SET SQL_SAFE_UPDATES = 0;

delete from compo where id_bon in (select id from bon where MONTH(date_cmde) = 4 and YEAR(date_cmde) = 2019);

delete from bon where MONTH(date_cmde) = 4 and YEAR(date_cmde) = 2019;