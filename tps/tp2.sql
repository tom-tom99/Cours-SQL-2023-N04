ALTER TABLE ARTICLE
ADD CONSTRAINT fk_article_fournisseur
FOREIGN KEY (ID_FOU) REFERENCES FOURNISSEUR(ID);

ALTER TABLE BON
ADD CONSTRAINT fk_bon_fournisseur
FOREIGN KEY (ID_FOU) REFERENCES FOURNISSEUR(ID);

ALTER TABLE COMPO
ADD CONSTRAINT fk_compo_article
FOREIGN KEY (ID_ART) REFERENCES ARTICLE(ID);

ALTER TABLE COMPO
ADD CONSTRAINT fk_compo_bon
FOREIGN KEY (ID_BON) REFERENCES BON(ID);