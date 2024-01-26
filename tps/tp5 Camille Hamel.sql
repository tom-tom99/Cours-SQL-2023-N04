--a
select * from article order by designation;
--b
select * from article order by prix desc;
--c
select * from article where designation like '%boulon%' order by prix;
--d
select * from article where designation like BINARY '%sachet%';
--e
select * from article where designation like '%sachet%';
--f
select * from article a inner join fournisseur f on f.id = a.id_fou order by f.nom,a.prix desc;
--g

select * from article a inner join fournisseur f on f.id = a.id_fou where f.id = 3;

--h
select AVG(a.prix) from article a inner join  fournisseur f on f.id = a.id_fou where f.id = 3 group by f.id;
--i
select f.nom,AVG(a.prix) from article a inner join  fournisseur f on f.id = a.id_fou group by f.id;
--j
select * from bon where date_cmde between '2019-03-01 00:00:00' and '2019-04-05 12:00:00';
--k
select b.* from bon b inner join compo c on b.id = c.id_bon inner join article a on a.id = c.id_art where a.designation like '%boulon%';
--l
select b.*, f.nom from bon b inner join compo c on b.id = c.id_bon inner join article a on a.id = c.id_art  inner join  fournisseur f on f.id = b.id_fou where a.designation like '%boulon%';
--m
select b.id, b.date_cmde, sum(a.prix*c.qte )from bon b inner join compo c on b.id = c.id_bon inner join article a on a.id = c.id_art group by b.id;
--n
select b.id, b.date_cmde, sum(c.qte) from bon b inner join compo c on b.id = c.id_bon inner join article a on a.id = c.id_art group by b.id;

--o
select b.id, b.date_cmde, sum(c.qte) 
from bon b 
inner join compo c on b.id = c.id_bon 
inner join article a on a.id = c.id_art 
group by b.id 
having sum(c.qte)>25;

--p
select sum(a.prix*c.qte) 
from bon b 
inner join compo c on b.id = c.id_bon 
inner join article a on a.id = c.id_art 
where MONTH(date_cmde) == 4 group by b.id;

--Facultatif

/*a. Sélectionnez les articles qui ont une désignation identique mais des fournisseurs
différents (indice : réaliser une auto jointure i.e. de la table avec elle-même)*/
select * from article a1 
inner join article a2 on a1.designation = a2.designation
 where a1.id_fou != a2.id_fou 
/*b. Calculez les dépenses en commandes mois par mois (indice : utilisation des fonctions
MONTH et YEAR)*/
select YEAR(date_cmde),month(date_cmde),sum(a.prix*c.qte) 
from bon b 
inner join compo c on b.id = c.id_bon
 inner join article a on a.id = c.id_art  
 group by YEAR(date_cmde),MONTH(date_cmde);

--c. Sélectionnez les bons de commandes sans article (indice : utilisation de EXISTS)
select b.id from bon b 
where NOT EXISTS ( select c.id from compo c where c.id_bon = b.id);

--d. Calculez le prix moyen des bons de commande par fournisseur.
select f.nom,avg(sq.somme) from fournisseur f,
 (select sum(a.prix*c.qte) as somme ,b.id_fou from bon b inner join compo c on b.id = c.id_bon inner join article a on a.id = c.id_art group by b.id_fou) sq
  where f.id =sq.id_fou group by f.id;