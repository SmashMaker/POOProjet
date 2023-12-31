-- #### Suppression des tables si elles existent ####
DROP TABLE IF EXISTS appartenir;
DROP TABLE IF EXISTS habiter;

DROP TABLE IF EXISTS Historique_prix;
DROP TABLE IF EXISTS Produit;
DROP TABLE IF EXISTS Personnel;

DROP TABLE IF EXISTS Paiement;
DROP TABLE IF EXISTS Commande;
DROP TABLE IF EXISTS Client;

DROP TABLE IF EXISTS Adresse;
DROP TABLE IF EXISTS Ville;
DROP TABLE IF EXISTS Pays;



-- #### Création des tables ####
CREATE TABLE Client(
   id_client INT IDENTITY(0,1),
   nom_client VARCHAR(50),
   prenom_client VARCHAR(50),
   date_naissance DATE,
   PRIMARY KEY(id_client)
);

CREATE TABLE Produit(
   id_produit INT IDENTITY(0,1),
   nom_produit VARCHAR(50),
   ref_produit VARCHAR(50),
   designation VARCHAR(50),
   quantite INT,
   seuil_reappro INT,
   taux_tva DECIMAL(15,2),
   PRIMARY KEY(id_produit)
);

CREATE TABLE Pays(
   id_pays INT IDENTITY(0,1),
   nom_pays VARCHAR(50),
   PRIMARY KEY(id_pays)
);

CREATE TABLE Ville(
   id_ville INT IDENTITY(0,1),
   nom_ville VARCHAR(50),
   code_postal VARCHAR(10),
   id_pays INT NOT NULL,
   PRIMARY KEY(id_ville),
   FOREIGN KEY(id_pays) REFERENCES Pays(id_pays)
);

CREATE TABLE Adresse(
   id_adresse INT IDENTITY(0,1),
   nom_adresse VARCHAR(50),
   id_ville INT NOT NULL,
   PRIMARY KEY(id_adresse),
   FOREIGN KEY(id_ville) REFERENCES Ville(id_ville)
);

CREATE TABLE Personnel(
   id_personnel INT IDENTITY(0,1),
   nom_personnel VARCHAR(50),
   prenom_personnel VARCHAR(50),
   superieur_personnel VARCHAR(50),
   date_embauche DATE,
   id_adresse INT,
   PRIMARY KEY(id_personnel),
   FOREIGN KEY(id_adresse) REFERENCES Adresse(id_adresse)
);

CREATE TABLE Commande(
   id_commande VARCHAR(50),
   date_emission DATE,
   date_livraison DATE,
   quantite_article INT,
   total_article INT,
   total_ht MONEY,
   total_tva MONEY,
   total_ttc MONEY,
   id_adresse INT,
   id_client INT,
   PRIMARY KEY(id_commande),
   FOREIGN KEY(id_adresse) REFERENCES Adresse(id_adresse),
   FOREIGN KEY(id_client) REFERENCES Client(id_client)
);

CREATE TABLE Paiement(
   id_paiement INT IDENTITY(1,1),
   date_paiement DATE,
   moyen_paiement VARCHAR(50),
   montant_paiement MONEY,
   id_adresse INT NOT NULL,
   id_commande VARCHAR(50) NOT NULL,
   PRIMARY KEY(id_paiement),
   FOREIGN KEY(id_adresse) REFERENCES Adresse(id_adresse),
   FOREIGN KEY(id_commande) REFERENCES Commande(id_commande)
);

CREATE TABLE Historique_prix(
   id_historique INT IDENTITY(1,1),
   prix_article MONEY,
   date_article DATE,
   id_produit INT NOT NULL,
   PRIMARY KEY(id_historique),
   FOREIGN KEY(id_produit) REFERENCES Produit(id_produit)
);

CREATE TABLE habiter(
   id_adresse INT,
   id_client INT,
   --PRIMARY KEY(id_adresse, id_client),
   FOREIGN KEY(id_adresse) REFERENCES Adresse(id_adresse),
   FOREIGN KEY(id_client) REFERENCES Client(id_client)
);

CREATE TABLE appartenir(
   id_commande VARCHAR(50),
   id_produit INT,
   --PRIMARY KEY(id_commande, id_produit),
   FOREIGN KEY(id_commande) REFERENCES Commande(id_commande),
   FOREIGN KEY(id_produit) REFERENCES Produit(id_produit)
);


-- Ajout des item supprimés
INSERT INTO Pays (nom_pays) VALUES ('Deleted');
INSERT INTO Ville (nom_ville, id_pays) VALUES ('Deleted', 0);
INSERT INTO Adresse (nom_adresse, id_ville) VALUES ('Deleted', 0);
INSERT INTO Client (nom_client, prenom_client) VALUES ('Deleted', 'Deleted');
INSERT INTO habiter(id_adresse, id_client) VALUES (0, 0);
INSERT INTO Produit (nom_produit) VALUES ('Deleted'); --
INSERT INTO Personnel (nom_personnel, prenom_personnel, id_adresse) VALUES ('Deleted', 'Deleted', 0); --
