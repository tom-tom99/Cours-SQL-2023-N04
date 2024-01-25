--a
select * from article;
--b
select ref,designation from article where prix >2;
--c
select * from article where prix>2 and prix<6.25;
--d
select * from article where prix between 2 and 6.25;
--e
select * from article where prix not between 2 and 6.25 and id_fou=1;
--f
select * from article where id_fou=1 or id_fou=2;
--g
select * from article where id_fou in (1,2)
--h
select * from article where id_fou not in (1,2)
--i
select * from bon where date_cmde between '2019-02-01' and '2019-04-30';
