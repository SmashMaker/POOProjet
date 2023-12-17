'''
    Peuplement de la base de données
    Génère des txt avec les INSERT

    Etapes Constantes:
    - Produit
    - Pays
    - Ville

    Etaptes Variables:
    - Client
    - Adresse
    - Habiter
    - Personnel
    - Historique prix
    - Commande
    - Appartenir
    - Paiement
'''

import time # Pour le temps d'execution
time_exec = time.time()

# Importation de tous les fichiers pour traiter les données de chaque table
import Adresse
import Appartenir
import Client
import Commande
import Habiter
import Historique_prix
import Paiement
import Pays
import Personnel
import Produit
import Ville


# Classe pour gérer les données et faire les requêtes SQL
class populate:
    def __init__(self,name_table, listdatatype, remove_id_for_query=False):
        self.name_table = name_table
        self.listdatatype = listdatatype # listdata must be data1,data2,data3,etc
        self.data = []
        self.remove_id_for_query = remove_id_for_query

    def get_query(self):
        max = 999
        nb_done = 0
        to_return = ""
        nb_left = len(self.data)

        while nb_left > 0:
            to_do = nb_left
            if to_do > max:
                to_do = max

            to_return += self.proccess_query(nb_done, to_do, max) + "\n\n"
            nb_done += to_do
            nb_left -= to_do
        return to_return

    def proccess_query(self,nb_start, nb_to_do, max):
        # Add header
        listdatatype = self.listdatatype
        if self.remove_id_for_query:
            listdatatype = listdatatype.split(",")
            listdatatype = listdatatype[1:]
            listdatatype = ",".join(listdatatype)

        to_return = "INSERT INTO " + self.name_table + " (" + listdatatype + ")\nVALUES\n"

        # Process query
        if nb_to_do > max: len_data = nb_to_do = max
        if self.remove_id_for_query: start_list = 1
        else: start_list = 0

        for i in range(nb_start, nb_start + nb_to_do):
            data = "("
            for j in range(start_list,len(self.data[i])):
                if self.data[i][j] == "NULL":
                    data += "NULL"
                elif type(self.data[i][j]) == str:
                    data += "'" + str(self.data[i][j]) + "'"
                else:
                    data += str(self.data[i][j])

                if j < len(self.data[i]) - 1:
                    data += ","
            data += ")"
            to_return += data + ",\n"

        # Remove last comma and \n
        while to_return[-1] == "," or to_return[-1] == "\n":
            to_return = to_return[:-1]


        return to_return + ";"

    def remove_last_if_not_void(self):
        if self.data[-1] == []:
            self.data = self.data[:-1]

    def add_data(self,listdata):
        self.data.append(listdata)

    def add_data_list(self,listdata):
        for i in range(len(listdata)):
            self.add_data(listdata[i])
        self.remove_last_if_not_void()
        print(f'Added {len(listdata)} to {self.name_table}')

    def clear_data(self):
        self.data = []

    def set_remove_id_for_query(self, remove_id_for_query):
        self.remove_id_for_query = remove_id_for_query


# Paramètres
nb_villes = 20
nb_clients = 20000
nb_adresses = 40000
nb_personnel = 50
nb_historique_prix = 2000
nb_commande = 50000

rate_habiter = 0.50 # 50% des clients ont + de 1 adresse
rate_commande = 0.25 # 25% des commandes ont + de 1 produit
rate_paiement = 0.1 # 10% des commandes sont payés en plusieurs paiements
rate_adresse_paiement = 0.05 # 5% des paiements sont des adresses differentes de l'adresse de livraison de la commande

folder = "querries/"
extension = ".txt"
do_query = True
all_in_one = True


# Création de tout les objets populate
adresse_populate = populate("adresse","id_adresse, nom_adresse, id_ville")
appartenir_populate = populate("appartenir","id_commande, id_produit")
client_populate = populate("client","id_client, nom_client, prenom_client, date_naissance")
commande_populate = populate("commande","id_commande, date_emission, date_livraison, quantite_article, total_article, total_ht, total_tva, total_ttc, id_adresse, id_client")
habiter_populate = populate("habiter","id_client, id_adresse")
historique_prix_populate = populate("historique_prix","id_historique, id_produit, prix_article, date_article")
paiement_populate = populate("Paiement","id_paiement, date_paiement, moyen_paiement, montant_paiement, id_adresse, id_commande")
pays_populate = populate("pays","id_pays,nom_pays")
personnel_populate = populate("personnel","id_personnel, nom_personnel, prenom_personnel, superieur_personnel, date_embauche, id_adresse")
produit_populate = populate("Produit","id_produit, nom_produit, ref_produit, designation, quantite, seuil_reappro, taux_tva")
ville_populate = populate("ville","id_ville, nom_ville, code_postal, id_pays")



# Ajout des données dans chaque objet (ordre important)
produit_populate.add_data_list(Produit.get_produits())
pays_populate.add_data_list(Pays.get_pays())
ville_populate.add_data_list(Ville.get_villes())

client_populate.add_data_list(Client.get_clients(nb_clients))
adresse_populate.add_data_list(Adresse.get_adresses(nb_adresses,nb_villes))
habiter_populate.add_data_list(Habiter.get_habiter(nb_clients, nb_adresses, rate_habiter))
personnel_populate.add_data_list(Personnel.get_personnel(nb_personnel, nb_villes))
historique_prix_populate.add_data_list(Historique_prix.get_historique_prix(nb_historique_prix, produit_populate.data))

temp_commande = Commande.get_temp_commande(nb_commande, nb_clients, client_populate.data, nb_adresses, adresse_populate.data, ville_populate.data)
appartenir_populate.add_data_list(Appartenir.get_appartenir(temp_commande,produit_populate.data, rate_commande))
commande_populate.add_data_list(Commande.get_commande(temp_commande, appartenir_populate.data, produit_populate.data, historique_prix_populate.data))
paiement_populate.add_data_list(Paiement.get_paiement(commande_populate.data, rate_paiement, rate_adresse_paiement, nb_adresses))


# Enlever les id pour certaines requêtes (Produits, Pays, Ville, Client, Adresse, Personnel, historique_prix et paiement)
produit_populate.set_remove_id_for_query(True)
pays_populate.set_remove_id_for_query(True)
ville_populate.set_remove_id_for_query(True)
client_populate.set_remove_id_for_query(True)
adresse_populate.set_remove_id_for_query(True)
personnel_populate.set_remove_id_for_query(True)
historique_prix_populate.set_remove_id_for_query(True)
paiement_populate.set_remove_id_for_query(True)


# Création des requêtes SQL et sauvegarde dans des fichiers
# all_query = [produit, pays, ville, client, adresse, habiter, personnel, historique_prix, commande, appartenir, paiement]
all_querry = [produit_populate, pays_populate, ville_populate, client_populate, adresse_populate, habiter_populate, personnel_populate, historique_prix_populate, commande_populate, appartenir_populate, paiement_populate]


if do_query:

    print("\n #### Doing query ####")
    if all_in_one:
        with open(folder + "all" + extension, "w", encoding="utf-8") as f:
            for i in range(len(all_querry)):
                f.write(all_querry[i].get_query() + "\n\n")
    else:
        for i in range(len(all_querry)):
            with open(folder + all_querry[i].name_table + extension, "w", encoding="utf-8") as f:
                f.write(all_querry[i].get_query() + "\n\n")

    print("Done")

time_exec = time.time() - time_exec
print("\nExecution: " + str(round(time_exec,2)) + "s")