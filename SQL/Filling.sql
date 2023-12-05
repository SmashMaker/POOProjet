-- Fill Client 1
INSERT INTO Client (id_client, nom_client, prenom_client, date_naissance)
VALUES
(1, 'Tremblay', 'Camille', '1992-03-14'),
(2, 'Dubois', 'Alexandre', '1987-08-09'),
(3, 'Lefevre', 'Elise', '2000-04-27'),
(4, 'Martinez', 'Diego', '1981-01-03'),
(5, 'Bertrand', 'Sophie', '1995-09-18'),
(6, 'Rousseau', 'Julien', '1984-07-06'),
(7, 'Simon', 'Mathilde', '1998-11-22'),
(8, 'Leroy', 'Antoine', '1993-05-10'),
(9, 'Garcia', 'Carlos', '1989-12-05'),
(10, 'Moreau', 'Emilie', '1977-07-31'),
(11, 'Dupont', 'Pierre', '1991-02-25'),
(12, 'Bernard', 'Laura', '1986-10-12'),
(13, 'Martin', 'Hugo', '1997-05-08'),
(14, 'Girard', 'Claire', '1980-06-19'),
(15, 'Roux', 'Jérôme', '1994-09-07'),
(16, 'Petit', 'Céline', '1983-01-29'),
(17, 'Blanc', 'Lucas', '1990-08-16'),
(18, 'Martinez', 'Sofia', '1988-05-02'),
(19, 'Fischer', 'Maxime', '1979-11-11'),
(20, 'Dumont', 'Anna', '1996-12-24');


-- Fill Paiement 10
INSERT INTO paiement (id_paiement, date_paiement, moyen_paiement, id_adresse, id_commande)
VALUES
(1, '2022-12-24', 'Carte', 24, 'Cmd001'),
(2, '2023-02-07', 'Carte', 28, 'Cmd002'),
(3, '2023-03-02', 'Carte', 31, 'Cmd003'),
(4, '2023-03-28', 'Carte', 29, 'Cmd004'),
(5, '2023-05-12', 'Espèces', 21, 'Cmd005'),
(6, '2023-06-22', 'Espèces', 25, 'Cmd006'),
(7, '2023-06-29', 'Carte', 35, 'Cmd007'),
(8, '2023-08-14', 'Carte', 40, 'Cmd008'),
(9, '2023-09-02', 'Carte', 22, 'Cmd009'), 
(10, '2023-10-17', 'Carte', 26, 'Cmd010'),
(11, '2023-10-28', 'Chèque', 23, 'Cmd011'),
(12, '2023-12-12', 'Espèces', 39, 'Cmd012'),
(13, '2023-12-27', 'Carte', 37, 'Cmd013'),
(14, '2024-02-06', 'Carte', 34, 'Cmd014'),
(15, '2024-03-02', 'Carte', 38, 'Cmd015'),
(16, '2024-04-17', 'Carte', 27, 'Cmd016'),
(17, '2024-05-28', 'Carte', 30, 'Cmd017'),
(18, '2024-07-12', 'Chèque', 33, 'Cmd018'),
(19, '2024-08-22', 'Espèces', 32, 'Cmd019'),
(20, '2024-10-07', 'Espèces', 36, 'Cmd020');


-- Fill Stock 2
INSERT INTO Produit (id_produit, nom_produit, ref_produit, designation, quantite, seuil_reappro, taux_tva)
VALUES
(1, 'Résistances électriques', 'RES-2022', 'RES-PRO-2022', 15, 5, 20),
(2, 'Condensateurs électrolytiques', 'CAP-4567', 'CAP-ELEC-4567', 12, 5, 20),
(3, 'Diodes redresseuses', 'DIOD-7890', 'DIOD-RECT-7890', 23, 5, 20),
(4, 'Transistors bipolaires', 'TRANS-1234', 'TRANS-BIP-1234', 11, 5, 20),
(5, 'Microcontrôleurs', 'MCU-5678', 'MCU-CTRL-5678', 8, 5, 20),
(6, 'Circuits intégrés', 'IC-9012', 'IC-INTEG-9012', 8, 5, 20),
(7, 'LED (diodes électroluminescentes)', 'LED-3456', 'LED-ILLUM-3456', 6, 5, 20),
(8, 'Capteurs de mouvement', 'MOTION-7891', 'MOTION-SENS-7891', 10, 5, 20),
(9, 'Écrans LCD', 'LCD-2345', 'LCD-SCREEN-2345', 13, 5, 20),
(10, 'Cartes de développement Arduino', 'ARDUINO-6789', 'ARDUINO-DEV-6789', 4, 5, 20),
(11, 'Cartes Raspberry Pi', 'RASPI-7891', 'RASPI-CARD-7891', 16, 5, 20),
(12, 'Connecteurs USB', 'USB-5678', 'USB-CONN-5678', 20, 5, 20),
(13, 'Relais électriques', 'RELAY-1234', 'RELAY-ELEC-1234', 25, 5, 20),
(14, 'Batteries rechargeables', 'BATT-9012', 'BATT-RECH-9012', 7, 5, 20),
(15, 'Modules Bluetooth', 'BT-MODUME-7890', 'BT-MOD-3456', 11, 5, 20),
(16, 'Modules Wi-Fi', 'WIFI-MODULE-7890', 'WIFI-MOD-7890', 18, 5, 20),
(17, 'Capteurs de température', 'TEMP-2345', 'TEMP-SENSOR-2345', 14, 5, 20),
(18, 'Moteurs pas à pas', 'STEPPER-6789', 'STEPPER-MOTOR-6789', 3, 5, 20),
(19, 'Cartes mémoire SD', 'SD-CARD-1234', 'SD-MEM-CARD-1234', 22, 5, 20),
(20, 'Convertisseurs de tension', 'CONVERTER-5678', 'VOLT-CONVERTER-5678', 14, 5, 20);


-- Fill Pays 3
INSERT INTO pays (id_pays, nom_pays)
VALUES
(1, 'Allemagne'),
(2, 'Autriche'),
(3, 'Belgique'),
(4, 'Bulgarie'),
(5, 'Croatie'),
(6, 'Danemark'),
(7, 'Espagne'),
(8, 'Estonie'),
(9, 'Finlande'),
(10, 'France'),
(11, 'Grèce'),
(12, 'Hongrie'),
(13, 'Irlande'),
(14, 'Italie'),
(15, 'Lettonie'),
(16, 'Lituanie'),
(17, 'Luxembourg'),
(18, 'Malte'),
(19, 'Pays-Bas'),
(20, 'Pologne'),
(21, 'Portugal'),
(22, 'République tchèque'),
(23, 'Roumanie'),
(24, 'Slovaquie'),
(25, 'Slovénie'),
(26, 'Suède'),
(27, 'Chypre');


-- Fill Ville 4
INSERT INTO Ville (id_ville, nom_ville, code_postal, id_pays)
VALUES
(1, 'Rouen', '76000',10),
(2, 'Grand-Quevilly', '76120',10),
(3, 'Sotteville-lès-Rouen', '76300',10),
(4, 'Mont-Saint-Aignan', '76130',10),
(5, 'Petit-Quevilly', '76140',10),
(6, 'Rouen', '76770',10),
(7, 'Canteleu', '76380',10),
(8, 'Bois-Guillaume', '76230',10),
(9, 'Saint-Étienne-du-Rouvray', '76800',10),
(10, 'Bihorel', '76420',10),
(11, 'Isneauville', '76230',10),
(12, 'Notre-Dame-de-Bondeville', '76960',10),
(13, 'Oissel', '76350',10),
(14, 'Maromme', '76150',10),
(15, 'Darnétal', '76160',10),
(16, 'Grand-Couronne', '76530',10),
(17, 'Le Mesnil-Esnard', '76240',10),
(18, 'Barentin', '76360',10),
(19, 'Elbeuf', '76500',10),
(20, 'Yvetot', '76190',10); 


-- Fill Adresse 5
INSERT INTO Adresse (id_adresse, nom_adresse, id_ville)
VALUES
(1, '15 Rue Victor Hugo', 1),
(2, '14 Rue du Maréchal Foch', 9),
(3, '51 Avenue Jean Rondeaux', 5),
(4, '17 Rue des Martyrs de la Résistance', 16),
(5, '8 Rue des Martyrs', 12),
(6, '11 Rue du Général Leclerc', 14),
(7, '30 Rue Pierre Brossolette', 19),
(8, '7 Avenue des Canadiens', 2),
(9, '19 Rue de la Petite Savate', 11),
(10, '5 Rue des Moulins', 18),
(11, '32 Rue Gustave Flaubert', 3),
(12, '28 Rue de la République', 7),
(13, '9 Rue du Docteur Léon Colas', 4),
(14, '25 Avenue de Caen', 13),
(15, '6 Place du Général de Gaulle', 8),
(16, '12 Rue des Martyrs de la Résistance', 6),
(17, '22 Rue Georges Braque', 17),
(18, '4 Place de l Hôtel de Ville', 15),
(19, '10 Rue Saint-Julien', 20),
(20, '3 Boulevard Stanislas-Girardin', 10),
(21, '9 Rue de l Église', 19),
(22, '29 Rue Victor Hugo', 14),
(23, '8 Rue des Roses', 4),
(24, '7 Rue Voltaire', 9),
(25, '11 Rue de la Paix', 8),
(26, '22 Rue Pasteur', 11),
(27, '6 Rue Jeanne d Arc', 1),
(28, '4 Rue des Tilleuls', 17),
(29, '14 Rue Victorine Magne', 6),
(30, '13 Rue du Commerce', 15),
(31, '42 Rue des Canadiens', 2),
(32, '18 Rue du Stade', 16),
(33, '25 Rue de la Liberté', 5),
(34, '10 Rue des Cerisiers', 12),
(35, '17 Avenue Jean Jaurès', 3),
(36, '5 Rue du Moulin', 13),
(37, '19 Rue des Lilas', 10),
(38, '12 Rue du Maréchal Foch', 20),
(39, '4 Rue des Tilleuls', 17),
(40, '3 Avenue Gambetta', 7);



-- Fill Personnel 7
INSERT INTO Personnel (id_personnel, nom_personnel, prenom_personnel, superieur_personnel, date_embauche, id_adresse)
VALUES
(1, 'Dubois', 'Martin', 'Camille', '2012-05-11', 5),
(2, 'Martin', 'Marie', 'Martin', '2012-09-25', 8),
(3, 'Leroy', 'Jules', 'Martin', '2012-09-25', 14),
(4, 'Lambert', 'Hugo', 'Martin', '2012-12-12', 12),
(5, 'Moreau', 'Mathis', 'Martin', '2012-12-12', 7),
(6, 'Laurent', 'Nathan', 'Lilian', '2014-03-04', 6),
(7, 'Roux', 'Benjamin', 'Lilian', '2014-03-04', 19),
(8, 'Girard', 'Sarah', 'Lilian', '2014-07-31', 20),
(9, 'Lefebvre', 'Stéphanie', 'Lilian', '2014-07-31', 3),
(10, 'Bonnet', 'Cécile', 'Camille', '2012-05-11', 2),
(11, 'Dupont', 'Lilian', 'Camille', '2012-05-11', 11),
(12, 'Garcia', 'Dominique', 'Louis', '2014-03-04', 16),
(13, 'Petit', 'Louis', 'Camille', '2012-05-11', 13),
(14, 'Rousseau', 'Lila', 'Louis', '2014-03-04', 17),
(15, 'Mercier', 'Daniel', 'Louis', '2012-09-25', 4),
(16, 'Fernandez', 'Robert', 'Louis', '2012-09-25', 10),
(17, 'Caron', 'Maxime', 'Camille', '2012-05-11', 15),
(18, 'Muller', 'Paul', 'Maxime', '2014-07-31', 9),
(19, 'Blanc', 'Florian', 'Maxime', '2014-07-31', 18),
(20, 'Chevalier', 'Camille', NULL, '2012-05-11', 1);


-- Fill Commande 9
INSERT INTO Commande (id_commande, date_emission, date_livraison, quantite_article, total_article, total_ht, total_tva, total_ttc, id_adresse, id_client)
VALUES
('Cmd001', '2022-12-25', '2023-01-01', 9, 180, 180, 36, 216, 24, 5),
('Cmd002', '2023-02-08', '2023-02-15', 5, 7.5, 7.5, 1.5, 9, 28, 6),
('Cmd003', '2023-03-03', '2023-03-10', 14, 18.9, 18.9, 3.78, 22.68, 31, 7),
('Cmd004', '2023-03-29', '2023-04-05', 2, 24, 24, 4.8, 28.8, 29, 2),
('Cmd005', '2023-05-13', '2023-05-20', 11, 35.75, 35.75, 7.15, 42.9, 21, 1),
('Cmd006', '2023-06-23', '2023-06-30', 7, 3.5, 3.5, 0.7, 4.2, 25, 3),
('Cmd007', '2023-06-30', '2023-07-07', 3, 45, 45, 9, 54, 35, 4),
('Cmd008', '2023-08-15', '2023-08-22', 13, 286, 286, 57.2, 343.2, 40, 9),
('Cmd009', '2023-09-03', '2023-09-10', 6, 102, 102, 20.4, 122.4, 22, 10),
('Cmd010', '2023-10-18', '2023-10-25', 8, 600, 600, 120, 720, 26, 15),
('Cmd011', '2023-10-29', '2023-11-05', 1, 0.25, 0.25, 0.05, 0.3, 23, 18),
('Cmd012', '2023-12-13', '2023-12-20', 12, 48, 48, 9.6, 57.6, 39, 16),
('Cmd013', '2023-12-28', '2024-01-04', 4, 160, 160, 32, 192, 37, 17),
('Cmd014', '2024-02-07', '2024-02-14', 10, 400, 400, 80, 480, 34, 19),
('Cmd015', '2024-03-03', '2024-03-10', 15, 15, 15, 3, 18, 38, 20),
('Cmd016', '2024-04-18', '2024-04-25', 7, 42, 42, 8.4, 50.4, 27, 13),
('Cmd017', '2024-05-29', '2024-06-05', 11, 110, 110, 22, 132, 30, 14),
('Cmd018', '2024-07-13', '2024-07-20', 3, 12, 12, 2.4, 14.4, 33, 11),
('Cmd019', '2024-08-23', '2024-08-30', 6, 9, 9, 1.8, 10.8, 32, 12),
('Cmd020', '2024-10-08', '2024-10-15', 2, 28, 28, 5.6, 33.6, 36, 8);


-- Fill Historique_prix 8
INSERT INTO Historique_prix (id_historique, id_produit, prix_article, date_article)
VALUES
(1, 1, 0.25, '2022-12-01'),
(2, 2, 1.5, '2022-12-01'),
(3, 3, 0.5, '2022-12-01'),
(4, 4, 1.35, '2022-12-01'),
(5, 5, 4, '2022-12-01'),
(6, 6, 3.25, '2022-12-01'),
(7, 7, 1, '2022-12-01'),
(8, 8, 10, '2022-12-01'),
(9, 9, 40, '2022-12-01'),
(10, 10, 40, '2022-12-01'),
(11, 11, 75, '2022-12-01'),
(12, 12, 1.5, '2022-12-01'),
(13, 13, 4, '2022-12-01'),
(14, 14, 14, '2022-12-01'),
(15, 15, 12, '2022-12-01'),
(16, 16, 15, '2022-12-01'),
(17, 17, 6, '2022-12-01'),
(18, 18, 20, '2022-12-01'),
(19, 19, 22, '2022-12-01'),
(20, 20, 17, '2022-12-01');


-- Fill Appartenire (Table intermédiaire entre Commande et Catalogue)
INSERT INTO appartenir (id_commande, id_produit)
VALUES
('Cmd001', 18),
('Cmd002', 2),
('Cmd003', 4),
('Cmd004', 15),
('Cmd005', 6),
('Cmd006', 3),
('Cmd007', 16),
('Cmd008', 19),
('Cmd009', 20),
('Cmd010', 11),
('Cmd011', 1),
('Cmd012', 5),
('Cmd013', 9),
('Cmd014', 10),
('Cmd015', 7),
('Cmd016', 17),
('Cmd017', 8),
('Cmd018', 13),
('Cmd019', 12),
('Cmd020', 14);


-- Fill  Habiter (Table intermédiaire entre Adresse et Client)
INSERT INTO habiter(id_client, id_adresse) VALUES
(1, 21),
(2, 29),
(3, 25),
(4,35),
(5,24),
(6,28),
(7,31),
(8,36),
(9,40),
(10,22),
(11,33),
(12,32),
(13,27),
(14,30),
(15,26),
(16,39),
(17,37),
(18,23),
(19,34),
(20,38);
