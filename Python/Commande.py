# (id_commande, date_emission, date_livraison, quantite_article, total_article, total_ht, total_tva, total_ttc, id_adresse, id_client)
def get_temp_commande(nb_commande, nb_clients, clients_data, nb_adresses, adresses_data, ville_data):
    temp_commande = []

    date_start = 2012
    date_end = 2022


    date_emission, date_livraison = get_dates(nb_commande, date_start, date_end)
    quantite_article = []
    total_article = []
    total_ht = []
    total_tva = []
    total_ttc = []
    id_adresse = get_adresse(nb_commande, nb_adresses)
    id_client = get_client(nb_commande, nb_clients)

    # Last cause need date, id_adresse, id_client to get
    id_commande = get_id_commands(clients_data, date_emission, adresses_data, ville_data, nb_commande)

    temp_commande = [id_commande, date_emission, date_livraison, quantite_article, total_article, total_ht, total_tva, total_ttc, id_adresse, id_client]

    return temp_commande
def get_commande(temp_commande, appartenir_data, produit_data, historique_prix_data):
    commande = []
    nb_commande = len(temp_commande[0])



    for i in range(nb_commande):
        date_emission = temp_commande[1][i]
        date_livraison = temp_commande[2][i]
        id_adresse = temp_commande[8][i]
        id_client = temp_commande[9][i]

        if date_emission[1] < 10:
            date_emission[1] = "0" + str(date_emission[1])
        if date_emission[2] < 10:
            date_emission[2] = "0" + str(date_emission[2])
        if date_livraison[1] < 10:
            date_livraison[1] = "0" + str(date_livraison[1])
        if date_livraison[2] < 10:
            date_livraison[2] = "0" + str(date_livraison[2])

        date_emission = str(date_emission[0]) + "-" + str(date_emission[1]) + "-" + str(date_emission[2])
        date_livraison = str(date_livraison[0]) + "-" + str(date_livraison[1]) + "-" + str(date_livraison[2])

        quantite_article = 0
        total_article = 0
        total_ht = 0
        total_tva = 0
        total_ttc = 0

        id_article_in_commande = []

        # Get_quantité_article
        for j in range(len(appartenir_data)):
            if appartenir_data[j][0] == temp_commande[0][i]:
                quantite_article += 1
                if appartenir_data[j][1] not in id_article_in_commande:
                    id_article_in_commande.append(appartenir_data[j][1])
        total_article = quantite_article

        # Get info of article in commande like price
        info_article_commande = []
        for j in range(len(id_article_in_commande)):
            info_article_commande.append(get_info_produit(id_article_in_commande[j], produit_data, historique_prix_data, date_emission, appartenir_data, temp_commande[0][i]))


        # Get total_ht, total_tva, total_ttc
        for j in info_article_commande:
            total_ht += j[1] * j[2]
            total_tva += j[1] * j[2] * j[3] / 100
            total_ttc += j[1] * j[2] * (1 + j[3]/100)

        # Round to 4 decimals
        total_ht = round(total_ht, 4)
        total_tva = round(total_tva, 4)
        total_ttc = round(total_ttc, 4)

        # (id_commande, date_emission, date_livraison, quantite_article, total_article, total_ht, total_tva, total_ttc, id_adresse, id_client)
        commande.append([temp_commande[0][i], date_emission, date_livraison, quantite_article, total_article, total_ht, total_tva, total_ttc, id_adresse, id_client])

    return commande;
def get_dates(nb_commande, date_start, date_end):
    import random
    date_emission = []
    date_livraison = []

    # Get random date emission and + 1 to 3 days for delivery
    for i in range(nb_commande):
        year = random.randint(date_start,date_end)
        mounth = random.randint(1,12)
        day = random.randint(1,28)

        date_emission.append([year, mounth, day])
        day += random.randint(1, 3)

        # Check if date is not out of month, year
        if day > 28:
            day -= 28
            mounth += 1
            if mounth > 12:
                mounth -= 12
                year += 1
        date_livraison.append([year, mounth, day])

    # Sort dates by year, mounth, day
    date_emission = sorted(date_emission, key=lambda date: (date[0], date[1], date[2]))
    date_livraison = sorted(date_livraison, key=lambda date: (date[0], date[1], date[2]))

    return date_emission, date_livraison
def get_adresse(nb_commande, nb_adresses):
    id_adresse = []
    import random
    for i in range(nb_commande):
        id_adresse.append(random.randint(1, nb_adresses))
    return id_adresse
def get_client(nb_commande, nb_clients):
    id_client = []
    import random
    for i in range(nb_commande):
        id_client.append(random.randint(1, nb_clients))
    return id_client
def get_id_commands(data_clients, date_emission, adresses_data, ville_data, nb_commande):
    import random

    id_commande = []
    increment = 1
    """
        2 lettre du prénom -> client_data[2][0:2]
        2 lettre du nom -> client_data[1][0:2]
        année commande -> date_emission[0:4]
        3 lettre ville -> nb_adresse -> adresses_data[id_adresse-1][2] -> ville_data[2][:3]
        num incrément -> 0-nb_commande
    """

    nb_clients = len(data_clients)
    nb_adresses = len(adresses_data)

    id_client = [random.randint(1, nb_clients) for i in range(nb_commande)]

    for i in id_client:
        prenom = data_clients[i-1][2]
        nom = data_clients[i-1][1]
        date = date_emission[i-1]

        adresse_client = random.randint(1, nb_adresses)
        id_ville = adresses_data[adresse_client-1][2]
        ville = ville_data[id_ville-1][1]
        ville = ville.replace(" ", "")


        id_commande.append(prenom[0:2] +
                           nom[0:2] +
                           str(date[0]) +
                           ville[0:3] +
                           str(increment))
        increment += 1



    return id_commande
def get_info_produit(id_produit, produit_data, historique_prix_data, date_emission, appartenir_data,id_commande):
    # Get info produit actual quantity, price, tva
    info_produit = []

    # Get quantity
    quantity = 0
    for i in appartenir_data:
        if i[1] == id_produit and i[0] == id_commande:
            quantity += 1

    # Get tva
    tva = produit_data[id_produit-1][6]

    # Get price of product at date_emission
    prix = 0

    for i in historique_prix_data:
        if i[1] == id_produit:
            if i[3][1:-1] < date_emission:
                prix = i[2]
            else:
                break

    if prix == 0:
        print("Erreur get_info_produit")
        print(id_produit)
        print(date_emission)
        print(historique_prix_data)
        print()

    info_produit = [id_produit, quantity, prix, tva]

    return info_produit