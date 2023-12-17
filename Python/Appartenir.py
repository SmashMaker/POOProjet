# (id_commande, id_produit) 1 line = 1 time the product, 2 lines = 2 times the product
def get_appartenir(temp_commande_data, produit_data, rate_commande):
    nb_commande = len(temp_commande_data[0])
    nb_produit = len(produit_data)

    appartenir = []
    id_commande = get_id_commande(nb_commande, temp_commande_data)
    id_produit = get_produit(nb_commande, nb_produit, rate_commande)

    appartenir = process_appartenir(id_commande, id_produit)
    return appartenir

def get_id_commande(nb_commande, temp_commande_data):
    id_commande = []

    for i in range(nb_commande):
        id_commande.append(temp_commande_data[0][i])


    return id_commande

def get_produit(nb_commande, nb_produit, rate_commande):
    id_produit = []
    import random

    for i in range(nb_commande):
        id_produit.append([[random.randint(1, nb_produit), random.randint(1,5)]])
        while (random.random() < rate_commande):
            produit = random.randint(1, nb_produit)
            if produit not in id_produit[i]:
                id_produit[i].append([produit, random.randint(1,5)])

    return id_produit

def process_appartenir(id_commande, id_produit):
    appartenir = []

    for i in range(len(id_commande)):
        for j in range(len(id_produit[i])):
            for k in range(id_produit[i][j][1]):
                appartenir.append([id_commande[i], id_produit[i][j][0]])

    return appartenir