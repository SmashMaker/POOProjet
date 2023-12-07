-- Panier Moyen
SELECT ROUND(AVG(Commande.total_ttc),2) as Panier_Moyen FROM Commande;


-- Chiffre d’affaire sur un mois particulier :
SELECT SUM(Commande.total_ttc) AS Chiffre_daffaires FROM Commande
WHERE Commande.date_emission BETWEEN '2022-01-01' AND '2022-02-01';


-- Identifier les produits sous le seuil de réappro
SELECT * FROM Produit
WHERE Produit.quantite<=Produit.seuil_reappro;


-- Calculer le montant total des achats par client
SELECT 
    Client.nom_client AS 'Nom', 
    Client.prenom_client AS 'Prénom', 
    SUM(Commande.total_ttc) AS 'Total TTC'
FROM Client
LEFT JOIN Commande ON Commande.id_client = Client.id_client
GROUP BY Client.id_client, Client.nom_client, Client.prenom_client;


-- Identifier les 10 articles les plus vendus
SELECT TOP 10
	Produit.id_produit AS 'ID_Produit',
	Produit.nom_produit AS 'Nom',
	Produit.ref_produit AS 'Ref',
	COALESCE(SUM(Commande.quantite_article),0) AS 'Quantite_vendu'
FROM Commande
RIGHT JOIN appartenir ON appartenir.id_commande = Commande.id_commande
RIGHT JOIN Produit ON Produit.id_produit = appartenir.id_produit
GROUP BY Produit.id_produit, Produit.nom_produit, Produit.ref_produit
ORDER BY Quantite_vendu DESC;


-- identifier les 10 articles les moins vendus :
SELECT TOP 10
	Produit.id_produit AS 'ID_Produit',
	Produit.nom_produit AS 'Nom',
	Produit.ref_produit AS 'Ref',
	COALESCE(SUM(Commande.quantite_article),0) AS 'Quantite_vendu'
FROM Commande
RIGHT JOIN appartenir ON appartenir.id_commande = Commande.id_commande
RIGHT JOIN Produit ON Produit.id_produit = appartenir.id_produit
GROUP BY Produit.id_produit, Produit.nom_produit, Produit.ref_produit
ORDER BY Quantite_vendu ASC;


-- Calculer la valeur commerciale du stock
-- #######################################
-- #######################################
-- ############### TO DO #################
-- #######################################
-- #######################################


-- Calculer la valeur d’achat du stock
SELECT SUM(hp.prix_article*Produit.quantite) AS Valeur_Stock 
FROM (
	-- Sous requêtes qui donne le prix actuel de chaque article
	SELECT 
		hp.id_produit,
		hp.prix_article,
		MAX(hp.date_article) AS date_prix_actuel
	FROM Historique_prix hp
	GROUP BY hp.id_produit, hp.prix_article) hp
LEFT JOIN Produit ON Produit.id_produit = hp.id_produit;


--Afficher les anniversaires des clients d'aujourd'hui
SELECT 
	Client.date_naissance,
	Client.id_client,
	Client.nom_client,
	Client.prenom_client,
	Adresse.nom_adresse,
	Ville.nom_ville,
	Pays.nom_pays
FROM Client
LEFT JOIN (
    SELECT id_client, id_adresse, MAX(date_livraison) AS last_delivery_date
    FROM Commande
    GROUP BY id_client, id_adresse
) AS last_address ON last_address.id_client = Client.id_client
LEFT JOIN Adresse ON Adresse.id_adresse = last_address.id_adresse
LEFT JOIN Ville ON Ville.id_ville = Adresse.id_ville
LEFT JOIN Pays ON Pays.id_pays = Ville.id_pays
WHERE MONTH(Client.date_naissance) = MONTH(GETDATE())
AND DAY(Client.date_naissance) = DAY(GETDATE());


-- Afficher les anniversaires des inscriptions d'aujourd'hui
-- #######################################
-- #######################################
-- ############### TO DO #################
-- #######################################
-- #######################################
