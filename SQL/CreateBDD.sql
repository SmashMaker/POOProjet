-- #### Suppression des tables si elles existent ####
DROP TABLE IF EXISTS appartenir;
DROP TABLE IF EXISTS habiter;
DROP TABLE IF EXISTS Historique_prix;
DROP TABLE IF EXISTS Commande;
DROP TABLE IF EXISTS Personnel;
DROP TABLE IF EXISTS Adresse;
DROP TABLE IF EXISTS Ville;
DROP TABLE IF EXISTS Stock;
DROP TABLE IF EXISTS Paiement;
DROP TABLE IF EXISTS Client;
DROP TABLE IF EXISTS Pays;


-- #### Création des tables ####
-- Table client
CREATE TABLE Client(
   id_client INT,
   nom_client VARCHAR(50),
   prenom_client VARCHAR(50),
   date_naissance DATE,
   PRIMARY KEY(id_client)
);

-- Table Paiement
CREATE TABLE Paiement(
   id_paiement INT,
   date_paiement DATE,
   moyen_paiement VARCHAR(50),
   date_reglement DATE,
   id_client INT NOT NULL,
   PRIMARY KEY(id_paiement),
   FOREIGN KEY(id_client) REFERENCES Client(id_client)
);

-- Table Stock
CREATE TABLE Stock(
   id_produit INT,
   nom_produit VARCHAR(50),
   ref_produit VARCHAR(50),
   designation VARCHAR(50),
   quantite INT,
   seuil_reappro INT,
   taux_tva DECIMAL(15,2),
   PRIMARY KEY(id_produit)
);

-- Table Pays
CREATE TABLE Pays(
   id_pays INT,
   nom_pays VARCHAR(50),
   PRIMARY KEY(id_pays)
);

-- Table Ville
CREATE TABLE Ville(
   id_ville INT,
   nom_ville VARCHAR(50),
   code_postal VARCHAR(10),
   id_pays INT NOT NULL,
   PRIMARY KEY(id_ville),
   FOREIGN KEY(id_pays) REFERENCES Pays(id_pays)
);

-- Table Adresse
CREATE TABLE Adresse(
   id_adresse INT,
   nom_adresse VARCHAR(50),
   livraison BIT,
   facturation BIT,
   id_ville INT NOT NULL,
   PRIMARY KEY(id_adresse),
   FOREIGN KEY(id_ville) REFERENCES Ville(id_ville)
);

-- Table Personnel
CREATE TABLE Personnel(
   id_personnel VARCHAR(50),
   nom_personnel VARCHAR(50),
   prenom_personnel VARCHAR(50),
   superieur_personnel VARCHAR(50),
   date_embauche DATE,
   id_adresse INT NOT NULL,
   PRIMARY KEY(id_personnel),
   UNIQUE(id_adresse),
   FOREIGN KEY(id_adresse) REFERENCES Adresse(id_adresse)
);

-- Table Commande
CREATE TABLE Commande(
   id_commande VARCHAR(50),
   date_emission DATE,
   date_livraison DATE,
   quantite_article INT,
   total_article INT,
   total_ht DECIMAL(15,2),
   total_tva DECIMAL(15,2),
   total_ttc DECIMAL(15,2),
   id_paiement INT NOT NULL,
   id_client INT NOT NULL,
   PRIMARY KEY(id_commande),
   FOREIGN KEY(id_paiement) REFERENCES Paiement(id_paiement),
   FOREIGN KEY(id_client) REFERENCES Client(id_client)
);

-- Table Historique_prix
CREATE TABLE Historique_prix(
   id_historique INT,
   prix_article DECIMAL(15,2),
   date_article DATE,
   id_produit INT NOT NULL,
   PRIMARY KEY(id_historique),
   FOREIGN KEY(id_produit) REFERENCES Stock(id_produit)
);

-- Table intermédiaire entre Adresse et Client
CREATE TABLE habiter(
   id_adresse INT,
   id_client INT,
   PRIMARY KEY(id_adresse, id_client),
   FOREIGN KEY(id_adresse) REFERENCES Adresse(id_adresse),
   FOREIGN KEY(id_client) REFERENCES Client(id_client)
);

-- Table intermédiaire entre Commande et Stock
CREATE TABLE appartenir(
   id_commande VARCHAR(50),
   id_produit INT,
   PRIMARY KEY(id_commande, id_produit),
   FOREIGN KEY(id_commande) REFERENCES Commande(id_commande),
   FOREIGN KEY(id_produit) REFERENCES Stock(id_produit)
);
