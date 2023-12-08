-- Donne le prix actuel d'un article
CREATE OR ALTER VIEW prix_actuel
AS
SELECT Historique_prix.id_produit, Historique_prix.prix_article FROM (
	SELECT id_produit, MAX(date_article) as date_actuelle FROM Historique_prix
	GROUP BY id_produit
	) date_prix_actuel
LEFT JOIN Historique_prix ON Historique_prix.id_produit = date_prix_actuel.id_produit AND Historique_prix.date_article = date_prix_actuel.date_actuelle;


-- Donne les dernières adresses de livraison utilisées
CREATE OR ALTER VIEW DerniereAdresseLivraison
AS
SELECT Commande.id_client, Commande.id_adresse FROM Commande
INNER JOIN (
	SELECT id_client, MAX(date_livraison) AS last_delivery_date
    FROM Commande
    GROUP BY id_client) last_addresss ON last_addresss.id_client = Commande.id_client AND last_addresss.last_delivery_date = Commande.date_livraison;


-- Panier Moyen
CREATE OR ALTER PROCEDURE PanierMoyen
AS
BEGIN
	SELECT ROUND(AVG(Commande.total_ttc),2) as Panier_Moyen FROM Commande;
END

EXEC PanierMoyen;


-- Chiffre d’affaire sur un mois particulier 
CREATE OR ALTER PROCEDURE CAMois
	@Annee INT,
	@Mois INT
AS
BEGIN
	-- Définir les date de début et de fin du mois
	DECLARE @DateDebut DATE
	DECLARE @DateFin DATE
	SET @DateDebut = DATEFROMPARTS(@Annee,@mois,1)
	SET @DateFin = DATEADD(DAY, -1, DATEADD(MONTH, 1, @DateDebut))

	SELECT SUM(Commande.total_ttc) AS Chiffre_daffaires FROM Commande
	WHERE Commande.date_emission BETWEEN @DateDebut AND @DateFin;
END

EXEC CAMois @Annee = 2022, @Mois = 1;


-- Identifier les produits sous le seuil de réappro
CREATE OR ALTER PROCEDURE ProduitReappro
AS
BEGIN
	SELECT * FROM Produit
	WHERE Produit.quantite<=Produit.seuil_reappro;
END

EXEC ProduitReappro;


-- Calculer le montant total des achats par client
CREATE OR ALTER PROCEDURE TotalAchatClient
AS
BEGIN
	SELECT 
		Client.nom_client AS 'Nom', 
		Client.prenom_client AS 'Prénom', 
		SUM(Commande.total_ttc) AS 'Total TTC'
	FROM Client
	LEFT JOIN Commande ON Commande.id_client = Client.id_client
	GROUP BY Client.id_client, Client.nom_client, Client.prenom_client;
END

EXEC TotalAchatClient;

-- Identifier les 10 articles les plus/moins vendus
CREATE OR ALTER PROCEDURE TopVente
	@Nb INT = 10,
	@Ordre BIT = 1,
	@DateDebut DATE = NULL,
	@DateFin DATE = NULL
AS
BEGIN
	IF @DateDebut IS NULL
		SET @DateDebut = DATEADD(MONTH, -1, GETDATE())
	IF @DateFin IS NULL
		SET @DateFin = GETDATE()


    SELECT TOP (@Nb)
        Produit.id_produit AS 'ID_Produit',
        Produit.nom_produit AS 'Nom',
        Produit.ref_produit AS 'Ref',
        COALESCE(SUM(Commande.quantite_article),0) AS Quantite_vendu
    FROM Commande
    RIGHT JOIN appartenir ON appartenir.id_commande = Commande.id_commande
    RIGHT JOIN Produit ON Produit.id_produit = appartenir.id_produit
	WHERE Commande.date_emission BETWEEN @DateDebut AND @DateFin
    GROUP BY Produit.id_produit, Produit.nom_produit, Produit.ref_produit
    ORDER BY 
        CASE WHEN @Ordre = 1 THEN COALESCE(SUM(Commande.quantite_article),0) END DESC,
        CASE WHEN @Ordre = 0 THEN COALESCE(SUM(Commande.quantite_article),0) END ASC;
END

EXEC TopVente @Nb = 10, @Ordre = 0;


-- Calculer la valeur commerciale du stock (TTC)
CREATE OR ALTER PROCEDURE ValeurCommercialeStock
AS
BEGIN
	SELECT ROUND(CAST(SUM(Produit.quantite*prix_actuel.prix_article*(1+(Produit.taux_tva/100)) ) AS DECIMAL(38,2)), 2)
	FROM Produit
	LEFT JOIN prix_actuel ON prix_actuel.id_produit = Produit.id_produit;
END

EXEC ValeurCommercialeStock;


-- Calculer la valeur d’achat du stock (HT)
CREATE OR ALTER PROCEDURE ValeurAchatStock
AS
BEGIN
	SELECT SUM(Produit.quantite*prix_actuel.prix_article) FROM Produit
	LEFT JOIN prix_actuel ON prix_actuel.id_produit = Produit.id_produit;
END

EXEC ValeurAchatStock


--Afficher les anniversaires des clients d'aujourd'hui
CREATE OR ALTER PROCEDURE AnniversaireClient
AS
BEGIN
	SELECT 
	Client.date_naissance,
	Client.id_client,
	Client.nom_client,
	Client.prenom_client,
	Adresse.nom_adresse,
	Ville.nom_ville,
	Pays.nom_pays
FROM Client
LEFT JOIN DerniereAdresseLivraison AS last_address ON last_address.id_client = Client.id_client
LEFT JOIN Adresse ON Adresse.id_adresse = last_address.id_adresse
LEFT JOIN Ville ON Ville.id_ville = Adresse.id_ville
LEFT JOIN Pays ON Pays.id_pays = Ville.id_pays
WHERE MONTH(Client.date_naissance) = MONTH(GETDATE())
AND DAY(Client.date_naissance) = DAY(GETDATE())
AND Adresse.nom_adresse IS NOT NULL
ORDER BY id_client;
END



-- Afficher les anniversaires des inscriptions d'aujourd'hui
CREATE OR ALTER PROCEDURE AnniversaireInscription
AS
BEGIN
END
-- #######################################
-- #######################################
-- ############### TO DO #################
-- #######################################
-- #######################################
