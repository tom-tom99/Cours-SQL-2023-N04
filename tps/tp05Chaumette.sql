a. Listez les articles dans l’ordre alphabétique des désignations
select * from article order by Designation

b. Listez les articles dans l’ordre des prix du plus élevé au moins élevé
select * from article order by prix desc


c. Listez tous les articles qui sont des « boulons » et triez les résultats par ordre de prix 
ascendant
select * from article where designation like 'Boulon%' order by prix

d. Listez tous les articles dont la désignation contient le mot « sachet ».
select * from article where designation like'%sachet%'

e. Listez tous les articles dont la désignation contient le mot « sachet » 
indépendamment de la casse !
select * from article where upper(designation) like upper('%sachet%')

f. Listez les articles avec les informations fournisseur correspondantes. Les résultats 
doivent être triées dans l’ordre alphabétique des fournisseurs et par article du prix le 
plus élevé au moins élevé.
select * from article inner join fournisseur on article.id_fou = fournisseur.id order by nom asc , Prix desc

g. Listez les articles de la société « Dubois & Fils »
select * from article where ID_fou=3

h. Calculez la moyenne des prix des articles de la société « Dubois & Fils »
select avg(prix), ID_FOU from article where ID_FOU=3

i. Calculez la moyenne des prix des articles de chaque fournisseur
select avg(prix), ID_FOU from article group by ID_FOU

j. Sélectionnez tous les bons de commandes émis entre le 01/03/2019 et le 
05/04/2019 à 12h00.
Select * from BON where DATE_CMDE BETWEEN '2019-03-01' and '2019-05-04'

k. Sélectionnez les divers bons de commande qui contiennent des boulons
select * from BON inner join compo on bon.id= compo.id_bon where ID_ART in (2,3,4,6)

l. Sélectionnez les divers bons de commande qui contiennent des boulons avec le nom 
du fournisseur associé.
select * from BON 
inner join compo on bon.id = compo.id_bon 
inner join fournisseur on bon.id_fou = fournisseur.id
where ID_ART in (2,3,4,6)

m. Calculez le prix total de chaque bon de commande
select sum(prix*qte), bon.id from BON
inner join compo on bon.id = compo.id_bon 
inner join article on compo.id_art = article.id
group by bon.ID

n. Comptez le nombre d’articles de chaque bon de commande
select sum(qte), bon.id from BON
inner join compo on bon.id = compo.id_bon 
group by bon.ID

o. Affichez les numéros de bons de commande qui contiennent plus de 25 articles et 
affichez le nombre d’articles de chacun de ces bons de commande 
select bon.id,sum(qte) from bon
inner join compo on bon.id = compo.id_bon 
group by bon.ID having sum(qte)>25


p. Calculez le coût total des commandes effectuées sur le mois d’avril
select sum(prix*qte) from BON
inner join compo on bon.id = compo.id_bon 
inner join article on compo.id_art = article.id
WHERE DATE_CMDE between '2019-04-01' and '2019-04-30'

-- commande insérée pour verifier la requete ci dessus
-- INSERT INTO BON (ID, NUMERO, DELAI, ID_FOU, DATE_CMDE) VALUES (4, 4, 5, 2, '2019-04-16 09:30:00');
-- INSERT INTO COMPO (ID_ART, ID_BON, QTE) values (2, 4, 5);
-- INSERT INTO COMPO (ID_ART, ID_BON, QTE) values (3, 4, 5);

-- INSERT INTO BON (ID, NUMERO, DELAI, ID_FOU, DATE_CMDE) VALUES (6, 6, 5, 2, '2020-10-16 09:30:00');
-- INSERT INTO COMPO (ID_ART, ID_BON, QTE) values (2, 4, 1);
-- INSERT INTO COMPO (ID_ART, ID_BON, QTE) values (3, 4, 1);

-- INSERT INTO BON (ID, NUMERO, DELAI, ID_FOU, DATE_CMDE) VALUES (3, 3, 5, 2, '2019-04-15 09:30:00');
-- INSERT INTO COMPO (ID_ART, ID_BON, QTE) values (4, 2, 5);
-- INSERT INTO COMPO (ID_ART, ID_BON, QTE) values (3, 2, 5);
-- INSERT INTO COMPO (ID_ART, ID_BON, QTE) values (8, 2, 1);
-- INSERT INTO COMPO (ID_ART, ID_BON, QTE) values (9, 2, 1);

Requêtes plus difficiles (facultatives)
a. Sélectionnez les articles qui ont une désignation identique mais des fournisseurs 
différents (indice : réaliser une auto jointure i.e. de la table avec elle-même)

SELECT DISTINCT designation, id_fou
FROM article a1, article a2
WHERE a1.designation = a2.designation
AND a1.ID_FOU != a2.ID_FOU


b. Calculez les dépenses en commandes mois par mois (indice : utilisation des fonctions 
MONTH et YEAR)
select year(bon.DATE_CMDE) as Annee, month(bon.DATE_CMDE) as Mois, sum(article.prix * compo.qte)
from bon
inner join compo on bon.id = compo.id_bon 
inner join article on compo.id_art = article.id
group by YEAR(bon.DATE_CMDE), MONTH(bon.DATE_CMDE)


c. Sélectionnez les bons de commandes sans article (indice : utilisation de EXISTS)

select * from bon
left join compo on bon.id = compo.id_bon 
where compo.id_art is null

-- ou alors
-- SELECT * FROM bon
-- WHERE EXISTS (SELECT * FROM compo WHERE id_art is null)


d. Calculez le prix moyen des bons de commande par fournisseur
select avg(prix*qte), bon.ID_FOU from bon 
inner join compo on bon.id = compo.id_bon 
inner join article on compo.id_art = article.id
group by ID_FOU