
data=[
    {
       'id' : 1,
       'ref': 'A01',
       'nom' : 'Perceuse P1',
       'prix' : 74.99
    },
    {
        'id' : 2,
        'ref' : 'F01',
        'nom' : 'Boulon laiton 4 x 40 mm (sachet de 10)'
    },
    {
        'id' : 3 ,
        'ref':'F02',
        'nom' : 'Boulon laiton 5 x 40 mm (sachet de 10)',
        'prix' : 4.45
    },
    {
        'id' : 4,
        'ref' : 'D01',
        'nom' : 'Boulon laiton 5 x 40 mm (sachet de 10)'
    },
    {
        'id' : 5,
        'ref' : 'A02',
        'nom' : 'Meuleuse 125mm'
    },
    {
        'id' : 6,
        'ref' : 'D03',
        'nom' : 'Boulon acier zingué 4 x 40mm (sachet de 10)'
    },
    {
        'id' : 74,
        'ref' : 'A03',
        'nom' : 'Perceuse à colonne'
    },
    {
        'id' : 11,
        'ref' : 'PF04',
        'nom' : 'Perceuse d’encastrement'
    },
    {
        'id' : 12,
        'ref' : 'C04',
        'nom' : 'Clous d’encastrement'
    },
    {
        'id' : 18,
        'ref' : 'F64',
        'nom' : 'Framboises d’encastrement'
    }
]
table_hash = {}


def hashage(id):
    somme = sum(int(chiffre) for chiffre in str(id))
    resultat = somme * len(str(identifiant))
    return resultat % 10 

def ajout_elem(n_id,n_ref,n_nom,n_prix):
     
    nouvel_element = {"id": n_id,"ref": n_ref, "nom": n_nom,"prix": n_prix}
    position = hashage(nouvel_element['id'])
    if position not in table_hash:
        table_hash[position] = []
    table_hash[position].append(nouvel_element)

def recuperer_elem(identifiant):
    position = hashage(identifiant)
    if position in table_hash:
        for elem in table_hash[position]:
            if elem['id'] == identifiant:
                return elem
    return "pas d'élément"


    
for element in data:
    identifiant = element.get('id')
    position = hashage(identifiant)
    if position not in table_hash:
        table_hash[position] = []

    table_hash[position].append(element)


while True :
    print("1. Récupérer élément par id")
    print("2. Ajouter un élément")
    o=input("Entrez l'action : ")

    if o == "1":
        identifiant = int(input("Entrez l'identifiant : "))
        res=recuperer_elem(identifiant)
        if res:
            print(res)
        else: print ('pas de resultat')

    if o == "2":
        n_id =int(input("Entrez l'identifiant du nouvel élément : "))
        n_ref=input("Entrez la référence du nouvel élément : ")
        n_nom=input("Entrez le nom du nouvel élément : ")
        n_prix=float(input("Entrez le prix du nouvel élément : "))
        ajout_elem(n_id,n_ref,n_nom,n_prix)