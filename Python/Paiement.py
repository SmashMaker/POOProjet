# (id_paiement, date_paiement, moyen_paiement, montant_paiement, id_adresse, id_commande)
import random

def get_paiement(commande_data, rate_paiement, rate_adresse_paiement, nb_adresses):
    paiement_data = []

    # commande_data (id_commande, date_emission, date_livraison, quantite_article, total_article, total_ht, total_tva, total_ttc, id_adresse, id_client)

    id_paiement = [] # Will calulate after all the list
    date_paiement = []
    moyen_paiement = []
    montant_paiement = []
    id_adresse = []
    id_commande = []

    for i in range(len(commande_data)):
        one_command_info = get_paiement_for_one_command(commande_data[i], rate_paiement, rate_adresse_paiement, nb_adresses)
        for j in one_command_info:
            date_paiement.append(j[0])
            moyen_paiement.append(j[1])
            montant_paiement.append(j[2])
            id_adresse.append(j[3])
            id_commande.append(j[4])

    id_paiement = [i for i in range(len(date_paiement))]

    for i in range(len(id_paiement)):
        paiement_data.append([id_paiement[i], date_paiement[i], moyen_paiement[i], montant_paiement[i], id_adresse[i], id_commande[i]])

    return paiement_data

def get_rate_paiement(nb_paiement):
    if nb_paiement == 1:
        return [1]

    rate_paiement_on_command = [random.random() for _ in range(nb_paiement)]
    total = sum(rate_paiement_on_command)

    # Normalize to sum up to 1
    rate_paiement_on_command = [round(i / total, 3) for i in rate_paiement_on_command]
    return rate_paiement_on_command

def get_nb_paiement(rate_paiement):
    import random
    nb_paiement_on_command = 1
    while random.random() < rate_paiement:
        nb_paiement_on_command += 1
    return nb_paiement_on_command

def get_date_paiement(date_emission):
    start_year = int(date_emission[0:4])
    start_month = int(date_emission[5:7])
    start_day = int(date_emission[8:10])

    start_day += random.randint(0, 28)

    if start_day > 28:
        start_month += 1
        start_day -= 28
    if start_month > 12:
        start_year += 1
        start_month -= 12

    if start_day < 10:
        start_day = "0" + str(start_day)
    if start_month < 10:
        start_month = "0" + str(start_month)

    return str(start_year) + "-" + str(start_month) + "-" + str(start_day)

def get_paiement_for_one_command(the_command_data, rate_paiement, rate_adresse_paiement, nb_adresses):
    paiement_one_command = []

    nb_paiement_on_command = get_nb_paiement(rate_paiement)
    rate_paiement_on_command = get_rate_paiement(nb_paiement_on_command) # Sum not equal to 1 but diverge to 1

    # (id_paiement, date_paiement, moyen_paiement, montant_paiement, id_adresse, id_commande)
    # id is processed in the main function get_paiement
    for i in range(nb_paiement_on_command):
        date_paiement = get_date_paiement(the_command_data[1])
        moyen_paiement = random.choice(["CB", "Cheque", "Virement"])
        montant_paiement = round(the_command_data[7] * rate_paiement_on_command[i], 4)
        id_adresse = the_command_data[8] if random.random() < rate_adresse_paiement else random.randint(1, nb_adresses)
        id_commande = the_command_data[0]
        paiement_one_command.append([date_paiement, moyen_paiement, montant_paiement, id_adresse, id_commande])


    # If sum of paiement is not equal to total_ttc, add the difference to the last paiement
    total_paiement = sum([i[2] for i in paiement_one_command])
    if total_paiement != the_command_data[7]:
        paiement_one_command[-1][2] += the_command_data[7] - total_paiement
        paiement_one_command[-1][2] = round(paiement_one_command[-1][2], 4)



    return paiement_one_command