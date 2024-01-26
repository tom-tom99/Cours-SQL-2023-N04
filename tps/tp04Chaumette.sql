a. Listez toutes les données concernant les articles
select * from ARTICLE

b. Listez uniquement les références et désignations des articles de plus de 2 euros
select REF , DESIGNATION from ARTICLE where prix > 2.00

c. En utilisant les opérateurs de comparaison, listez tous les articles dont le prix est 
compris entre 2 et 6.25 euros
select * from ARTICLE where prix >=2.00 and prix <=6.25

d.En utilisant l’opérateur BETWEEN, listez tous les articles dont le prix est compris 
entre 2 et 6.25 euros
select * from ARTICLE where PRIX between 2.00 and 6.25

e.Listez tous les articles dont le prix n’est pas compris entre 2 et 6.25 euros et dont le 
fournisseur est Française d’Imports.
select DESIGNATION from ARTICLE where Prix not between 2.00 and 6.25 and ID_FOU=1

f. En utilisant un opérateur logique, listez tous les articles dont les fournisseurs sont la 
Française d’imports ou Dubois et Fils
select DESIGNATION from ARTICLE where ID_FOU!=2

g. En utilisant l’opérateur IN, réalisez la même requête que précédemment
select Designation from article where ID_FOU in (1,3)

h. En utilisant les opérateurs NOT et IN, listez tous les articles dont les fournisseurs ne 
sont ni Française d’Imports, ni Dubois et Fils.
select Designation from article where ID_FOU not in (1,3)

i. Listez tous les bons de commande dont la date de commande est entre le 
01/02/2019 et le 30/04/2019
Select * from BON where DATE_CMDE BETWEEN '2019-02-01' and '2019-04-30'