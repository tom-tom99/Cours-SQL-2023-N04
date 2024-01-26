# TP Index

Nous allons ici étudier l'une des strctures de données permettant d'indexer des éléments dans une base de données : la hashmap.

Cette stucture de données possède la caractéristique de permettre la récupération d'un élément présent dans celle-ci sans en parcourir
la totalité, contrairement à un array.

En notation big O, on dit que les recherches dans une hashmap ont une complexité de O(1), contrairement aux arrays qui ont une complexité
O(n).

Pour bien comprendre ce qu'il se passe dans une base de données lorsque l'on crée un index, nous allons tenter d'implémenter un petit programme
dans le langage de votre choix faisant office de démonstration du fonctionnement d'un index.

Nous aurons définit une structure de données au format suivant :

```json
[
    {

       id : 1,
       ref: 'A01',
       nom : 'Perceuse P1',
       prix : 74.99,
    },
    {
        id : 2,
        ref : 'F01',
        nom : 'Boulon laiton 4 x 40 mm (sachet de 10)'
    },
    {
        id : 3 'F02',
        ref : 'Boulon laiton 5 x 40 mm (sachet de 10)',
        nom : 4.45
    },
    {
        id : 4,
        ref : 'D01',
        nom : 'Boulon laiton 5 x 40 mm (sachet de 10)'
    },
    {
        id : 5,
        ref : 'A02',
        nom : 'Meuleuse 125mm'
    },
    {
        id : 6,
        ref : 'D03',
        nom : 'Boulon acier zingué 4 x 40mm (sachet de 10)'
    },
    {
        id : 74,
        ref : 'A03',
        nom : 'Perceuse à colonne'
    },
    {
        id : 11,
        ref : 'PF04',
        nom : 'Perceuse d’encastrement'
    },
    {
        id : 12,
        ref : 'C04',
        nom : 'Clous d’encastrement'
    },
    {
        id : 18,
        ref : 'F64',
        nom : 'Framboises d’encastrement'
    }
]
```

Le but va être de créer une **table de hashage** en implémentant notre propre **hashmap** permettant de créer des index sur l'id de chaque entrée du tableau.
Notre programme demandera à l'utilisateur de saisir l'identifiant, et récupérera le reste des données en faisant appel à une table de hash. L'utilisateur pourra également rentrer un nouvel élément dans les données. Son nouvel identifiant sera ajouté à la table de hash

Voici comment fonctionne une table de hash:

Lorsque l'on rentre un identifiant, on fait une opération mathématique dessus pour en faire un nombre pouvant servir à pointer sur un array.

Sur cette case de l'array, on vérifie si on y trouve une clé égale à l'identifant. Si l'on trouve la clé, on renvoie la valeur associée, correspondant à la position de l'élément d'id égal à l'identifiant que l'on a passé à la table de hash. Sinon, on remonte que la valeur cherchée n'existe pas.




Il est interdit pour cet exercice d'utiliser une hashmap issue de la libria
