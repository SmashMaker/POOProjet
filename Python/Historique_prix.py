# (id_historique, id_produit, prix_article, date_article)
def get_historique_prix(nb_historique, produits_data):
    date_start = 2012
    date_end = 2022
    historique_prix = []
    nb_produit = len(produits_data)

    id_historique = [i for i in range(1, nb_historique + 1)]
    id_produit = get_id_produit(nb_historique, nb_produit)
    prix_article = get_prix(nb_historique, id_produit)
    date_article = get_dates(nb_historique, date_start, date_end)

    for i in range(nb_historique):
        historique_prix.append([id_historique[i], id_produit[i], prix_article[i], date_article[i]])

    return historique_prix

def get_id_produit(nb_historique, nb_produit):
    id_produit = []
    import random
    for i in range(nb_historique):
        id_produit.append(random.randint(1, nb_produit))
    return id_produit

# If first time, put random price
# If not, put last price + random variation
def get_prix(nb_historique, id_produit):
    prix = []
    already_exist = [False for i in range(len(id_produit))]
    import random
    for i in range(nb_historique):
        if already_exist[id_produit[i]-1]:
            original_price = prix[id_produit.index(id_produit[i])]
            # round to 2 decimals
            prix.append(round(original_price*(1+random.uniform(-0.1,0.1)),2))

        else:
            prix.append(random.randint(2,100))
            already_exist[id_produit[i]-1] = True
    return prix


def get_dates(nb_historique, date_start, date_end):
    dates = []
    import random
    if nb_historique > (date_end - date_start + 1) * 12 * 28:
        print('\n###############################################')
        print("Trop d'historique pour la période donnée")
        print(f'Nombre d\'historique : {nb_historique}')
        print(f'Date de début : {date_start}')
        print('###############################################\n')
    for i in range(nb_historique):
        year = random.randint(date_start,date_end)
        mounth = random.randint(1,12)
        day = random.randint(1,28)
        dates.append([year, mounth, day])

    # Sort dates by year, mounth, day
    dates = sorted(dates, key=lambda date: (date[0], date[1], date[2]))

    # Convert to string
    for i in range(len(dates)):

        # Add 0 if day or mounth < 10
        if dates[i][1] < 10:
            dates[i][1] = "0" + str(dates[i][1])
        if dates[i][2] < 10:
            dates[i][2] = "0" + str(dates[i][2])

        dates[i] = str(dates[i][0]) + "-" + str(dates[i][1]) + "-" + str(dates[i][2])

    return dates