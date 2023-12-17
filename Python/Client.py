
#(id_client, nom_client, prenom_client, date_naissance)
def get_clients(nb_clients):
    clients = []

    id_clients = [i for i in range(1, nb_clients + 1)]
    nom_clients, prenom_clients = get_names(nb_clients)
    date_naissance = get_dates(nb_clients)

    for i in range(nb_clients):
        clients.append([id_clients[i], nom_clients[i], prenom_clients[i], date_naissance[i]])

    return clients

def get_names(nb):
    return_nom = []
    return_prenom = []

    import random
    # open name.txt file in utf-8
    with open("names.txt", "r", encoding="utf-8") as f:
        lines = f.readlines()

    # Split names and firstnames
    # Name structure : "Nom, Prenom\n"
    nom = []
    prenom = []
    for i in range(len(lines)):
        splited = lines[i].split(",")
        nom.append(splited[0])
        prenom.append(splited[1][:-1])

    # Remove spaces if there is
    for i in range(len(nom)):
        nom[i] = nom[i].strip()
        prenom[i] = prenom[i].strip()

    # Choose random names and firstnames
    for i in range(nb):
        return_nom.append(random.choice(nom))
        return_prenom.append(random.choice(prenom))

    return return_nom, return_prenom

def get_dates(nb):
    dates = []
    import random
    for i in range(nb):
        year = random.randint(1950,2005)
        mounth = random.randint(1,12)
        day = random.randint(1,28)

        # Add 0 if needed
        if mounth < 10:
            mounth = "0" + str(mounth)
        if day < 10:
            day = "0" + str(day)

        dates.append(str(year) + "-" + str(mounth) + "-" + str(day))
    return dates