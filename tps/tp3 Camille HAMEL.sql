ALTER TABLE article
ADD FOREIGN KEY (id_fou) REFERENCES fournisseur(id);

ALTER TABLE bon
ADD FOREIGN KEY (id_fou) REFERENCES fournisseur(id);

/*clés étrangères table compo déjà créées*/

insert into fournisseur values
(1,"Française d’Imports"),
(2,"FDM SA"),
(3,"Dubois & Fils");

insert into article values
(1,"A01","Perceuse P1",74.99,1),
(2,"F01","Boulon laiton 4 x 40 mm (sachet de 10)",2.25,2),
(3,"F02","Boulon laiton 5 x 40 mm (sachet de 10)",4.45,2),
(4,"D01","Boulon laiton 5 x 40 mm (sachet de 10)",4.40,3),
(5,"A02","Meuleuse 125mm",37.85,1),
(6,"D03","Boulon acier zingué 4 x 40mm (sachet de 10)",1.8,3),
(7,"A03","Perceuse à colonne",185.25,1),
(8,"D04","Coffret mêches à bois",12.25,3),
(9,"F03","Coffret mêches plates",6.25,2),
(10,"F04","Fraises d’encastrement",8.14,2);

insert into bon values (2,"001","2023-07-15 04:45:15","3 jours",1);

insert into compo(id_bon,id_art,qte) values
(2,1,3),
(2,5,4),
(2,7,1);