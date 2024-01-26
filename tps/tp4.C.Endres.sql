CREATE TABLE ARTICLE (
    ID int(6) PRIMARY KEY, 
    REF varchar(10), 
    DESIGNATION	varchar(40), 
    PRIX decimal(10),
    ID_FOU int(6)
	);

CREATE TABLE FOURNISSEUR (
    ID  int(6) PRIMARY KEY, 
    NOM varchar(20)
	);

CREATE TABLE BON (
    ID int(6) PRIMARY KEY, 
    NUMERO varchar(20),
    DATE_CMDE date,
    DELAI int(5),
    ID_FOU int(6)
    );

CREATE TABLE COMPO (
    ID	int(6) AUTO_INCREMENT PRIMARY KEY,
    QTE	int(6),
    ID_ART int(6),
    ID_BON int(6)
    );


-- Listez toutes les données concernant les articles
SELECT * FROM ARTICLE;

-- Listez uniquement les références et désignations des articles de plus de 2 euros
SELECT REF, DESIGNATION FROM ARTICLE WHERE prix>2;

--En utilisant les opérateurs de comparaison, listez tous les articles dont le prix est compris entre 2 et 6.25 euros
SELECT * FROM ARTICLE WHERE prix>=2 AND prix <=6.25;

-- En utilisant l’opérateur BETWEEN, listez tous les articles dont le prix est compris entre 2 et 6.25 euros
SELECT * FROM ARTICLE WHERE prix BETWEEN 2 AND 6.25;

--Listez tous les articles dont le prix n’est pas compris entre 2 et 6.25 euros et dont le fournisseur est Française d’Imports.
SELECT * FROM ARTICLE WHERE (prix NOT BETWEEN 2 AND 6.25) AND ID_FOU =1;

--En utilisant un opérateur logique, listez tous les articles dont les fournisseurs sont la Française d’imports ou Dubois et Fils
SELECT * FROM ARTICLE WHERE ID_FOU =3 OR ID_FOU =1;

--En utilisant l’opérateur IN, réalisez la même requête que précédemment
SELECT * FROM ARTICLE WHERE ID_FOU IN(1,3);

-- En utilisant les opérateurs NOT et IN, listez tous les articles dont les fournisseurs ne sont ni Française d’Imports, ni Dubois et Fils.
SELECT * FROM ARTICLE WHERE ID_FOU NOT IN(1,3);

--Listez tous les bons de commande dont la date de commande est entre le 01/02/2019 et le 30/04/2019.
SELECT * FROM BON WHERE DATE_CMDE BETWEEN '2019-02-01' AND '2019-04-30';

