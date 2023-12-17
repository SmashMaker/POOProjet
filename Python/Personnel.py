# (id_personnel, nom_personnel, prenom_personnel, superieur_personnel, date_embauche, id_adresse)
def get_personnel(nb_personnel, nb_adresses):
    rate = 0.05
    personnel = []

    id_personnel = [i for i in range(1, nb_personnel + 1)]
    nom_personnel, prenom_personnel = get_names(nb_personnel)
    superieur_personnel = get_superieur(nb_personnel,rate)
    date_embauche = get_dates(nb_personnel)
    id_adresse = get_id_adresse(nb_personnel, nb_adresses)

    for i in range(nb_personnel):
        # Find name of the superieur base on id (index)
        superieur_personnel[i] = prenom_personnel[superieur_personnel[i]-1] if superieur_personnel[i] != 'NULL' else 'NULL'
        personnel.append([id_personnel[i], nom_personnel[i], prenom_personnel[i], superieur_personnel[i], date_embauche[i], id_adresse[i]])

    return personnel

def get_names(nb):
    return_nom = []
    return_prenom = []

    import random
    # open name.txt file in utf-8
    with open("name.txt", "r", encoding="utf-8") as f:
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
def get_superieur(nb, rate):
    # Some don't have superieur
    import random
    superieur = []
    for i in range(nb):
        if random.random() > rate:
            superieur.append(random.randint(1, nb))
        else:
            superieur.append('NULL')
    return superieur

def get_dates(nb):
    dates = []
    import random
    for i in range(nb):
        year = random.randint(2010,2022)
        mounth = random.randint(1,12)
        day = random.randint(1,28)

        # Add 0 if needed
        if mounth < 10:
            mounth = "0" + str(mounth)
        if day < 10:
            day = "0" + str(day)

        dates.append(str(year) + "-" + str(mounth) + "-" + str(day))
    return dates
def get_id_adresse(nb_personnel, nb_adresses):
    id_adresse = []
    import random
    for i in range(nb_personnel):
        id_adresse.append(random.randint(1, nb_adresses))
    return id_adresse