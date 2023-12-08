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


-- Calculer la valeur commerciale du stock
-- #######################################
-- #######################################
-- ############### TO DO #################
-- #######################################
-- #######################################


-- Calculer la valeur d’achat du stock
CREATE OR ALTER PROCEDURE ValeurAchatStock
AS
BEGIN
END
-- #######################################
-- #######################################
-- ############### TO DO #################
-- #######################################
-- #######################################


--Afficher les anniversaires des clients d'aujourd'hui
CREATE OR ALTER PROCEDURE AnniversaireClient
AS
BEGIN
END
-- #######################################
-- #######################################
-- ############### TO DO #################
-- #######################################
-- #######################################


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
