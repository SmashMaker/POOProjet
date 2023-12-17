/*
 Error code : 2
 add/remove/update/show produit
 add/remove/update Prix (historique_prix)
*/

CREATE OR ALTER PROCEDURE AddPrix
    @id_produit INT,
    @prix_article MONEY,
    @date_article DATE
AS BEGIN
    -- Check if not null
    IF @id_produit IS NULL OR @prix_article IS NULL
    BEGIN
        RAISERROR('Erreur dans lajout dun prix : id_produit et/ou prix_article estN NULL', 20, 2);
    END
    IF @date_article IS NULL
    BEGIN
        RAISERROR('Erreur dans lajout dun prix : date_article est NULL', 10, 2);
        SET @date_article = GETDATE();
    END

    -- Check if id_produit exists
    IF NOT EXISTS(SELECT * FROM Produit WHERE id_produit = @id_produit)
    BEGIN
        RAISERROR('Erreur dans lajout dun prix : id_produit nexiste pas', 20, 2);
    END


    -- Début de l'ajout
    BEGIN TRY
        BEGIN TRANSACTION
            -- Ajout dans Historique_prix
            INSERT INTO Historique_prix(prix_article, date_article, id_produit)
            VALUES(@prix_article, @date_article, @id_produit);

            SELECT SCOPE_IDENTITY() AS id_historique;
        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION
        RAISERROR('Erreur dans lajout dun prix', 20, 2);
    END CATCH
END
GO

CREATE OR ALTER PROCEDURE RemovePrix
    @id_produit INT,
    @id_historique INT
AS BEGIN
    -- Check if not null
    IF @id_produit IS NULL
    BEGIN
        RAISERROR('Erreur dans la suppression dun prix : id_produit est NULL', 20, 2);
    END

    -- Check if id_produit exists
    IF NOT EXISTS(SELECT * FROM Produit WHERE id_produit = @id_produit)
    BEGIN
        RAISERROR('Erreur dans la suppression dun prix : id_produit nexiste pas', 20, 2);
    END

    -- Check if id_historique is null
    IF @id_historique IS NULL
    BEGIN
        SET @id_historique = (SELECT id_historique FROM prix_actuel WHERE id_produit = @id_produit);
        IF @id_historique IS NULL
        BEGIN
            RAISERROR('Erreur dans la suppression dun prix : id_historique nexiste pas', 20, 2);
        END
        ELSE
        BEGIN
            RAISERROR('Erreur dans la suppression dun prix : id_historique est NULL', 10, 2);
        END
    END

    -- Debut de la suppression
    BEGIN TRY
        BEGIN TRANSACTION
            -- Suppression dans Historique_prix
            DELETE FROM Historique_prix WHERE id_historique = @id_historique;
        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION
        RAISERROR('Erreur dans la suppression dun prix', 20, 2);
    END CATCH
END
GO

CREATE OR ALTER PROCEDURE UpdatePrix
    @id_produit INT = NULL,
    @id_historique INT = NULL,
    @prix_article MONEY = NULL,
    @date_article DATE = NULL
AS BEGIN
    -- Check if not null
    IF @id_produit IS NULL OR @prix_article IS NULL
    BEGIN
        RAISERROR('Erreur dans la modification dun prix : id_produit et/ou prix_article est NULL', 20, 2);
    END

    IF @id_historique IS NULL
    BEGIN
        SET @id_historique = (SELECT id_historique FROM prix_actuel WHERE id_produit = @id_produit);
        IF @id_historique IS NULL
        BEGIN
            RAISERROR('Erreur dans la modification dun prix : id_historique nexiste pas', 20, 2);
        END
        ELSE
        BEGIN
            RAISERROR('Erreur dans la modification dun prix : id_historique est NULL', 10, 2);
        END
    END

    IF @date_article IS NULL OR @date_article NOT IN (SELECT date_article FROM Historique_prix WHERE id_historique = @id_historique)
    BEGIN
        RAISERROR('Erreur dans la modification dun prix : date_article est NULL ou nexiste pas', 10, 2);
    END

    -- Debut de la modification
    BEGIN TRY
        BEGIN TRANSACTION
            -- Modification dans Historique_prix
            UPDATE Historique_prix
            SET prix_article = @prix_article
            WHERE id_historique = @id_historique;
        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION
        RAISERROR('Erreur dans la modification dun prix', 20, 2);
    END CATCH
END
GO

CREATE OR ALTER PROCEDURE ShowPrix
    @id_produit INT = NULL,
    @id_historique INT = NULL,
    @date_article DATE = NULL
AS BEGIN
    -- IF NULL, SELECT ALL
    SELECT * FROM Historique_prix
    WHERE (@id_produit IS NULL OR id_produit = @id_produit)
    AND (@id_historique IS NULL OR id_historique = @id_historique)
    AND (@date_article IS NULL OR date_article = @date_article)
END
GO

CREATE OR ALTER PROCEDURE AddProduit
    @nom_produit VARCHAR(50) = NULL,
    @ref_produit VARCHAR(50) = NULL,
    @designation VARCHAR(50) = NULL,
    @quantite INT = NULL,
    @seuil_reappro INT = NULL,
    @taux_tva DECIMAL(15,2) = NULL,
    @prix_article MONEY = NULL,
    @date_article DATE = NULL
AS BEGIN
    -- Check if not null
    IF @nom_produit IS NULL OR @ref_produit IS NULL OR @designation IS NULL OR @quantite IS NULL OR @seuil_reappro IS NULL OR @taux_tva IS NULL OR @prix_article IS NULL OR @date_article IS NULL
    BEGIN
        RAISERROR('Erreur dans lajout dun produit : un ou plusieurs parametres sont NULL', 10, 2);
    END

    -- Debut de l'ajout
    BEGIN TRY
        BEGIN TRANSACTION
            -- Ajout dans Produit
            INSERT INTO Produit(nom_produit, ref_produit, designation, quantite, seuil_reappro, taux_tva)
            VALUES(@nom_produit, @ref_produit, @designation, @quantite, @seuil_reappro, @taux_tva);

            -- Ajout dans Historique_prix
            DECLARE @id_produit INT = SCOPE_IDENTITY();
            IF @id_produit IS NOT NULL
            BEGIN
                IF @date_article IS NULL
                BEGIN
                    SET @date_article = GETDATE();
                END
                EXEC AddPrix @id_produit, @prix_article, @date_article;
            END
        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION
        RAISERROR('Erreur dans lajout dun produit', 20, 2);
    END CATCH
END
GO

CREATE OR ALTER PROCEDURE RemoveProduit
    @id_produit INT = NULL,
    @ref_produit VARCHAR(50) = NULL
AS BEGIN
    -- Check if not null
    IF @id_produit IS NULL AND @ref_produit IS NULL
    BEGIN
        RAISERROR('Erreur dans la suppression dun produit : id_produit et ref_produit sont NULL', 20, 2);
    END

    -- Check if id_produit exists
    IF @id_produit IS NOT NULL AND NOT EXISTS(SELECT * FROM Produit WHERE id_produit = @id_produit)
    BEGIN
        RAISERROR('Erreur dans la suppression dun produit : id_produit nexiste pas', 20, 2);
    END

    -- Début de la suppression
    BEGIN TRY
        BEGIN TRANSACTION
            -- Suppression dans Historique_prix
            UPDATE Historique_prix
            SET id_produit = 0 -- Deleted produit
            WHERE id_produit = @id_produit;

            -- Suppression dans Appartenir
            UPDATE appartenir
            SET id_produit = 0 -- Deleted produit
            WHERE id_produit = @id_produit;

            -- Suppression dans Produit
            DELETE FROM Produit WHERE id_produit = @id_produit;
        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION
        RAISERROR('Erreur dans la suppression dun produit', 20, 2);
    END CATCH
END
GO

CREATE OR ALTER PROCEDURE UpdateProduit
    @id_produit INT = NULL,
    @ref_produit VARCHAR(50) = NULL,
    @nom_produit VARCHAR(50) = NULL,
    @designation VARCHAR(50) = NULL,
    @quantite INT = NULL,
    @seuil_reappro INT = NULL,
    @taux_tva DECIMAL(15,2) = NULL,
    @prix_article MONEY = NULL,
    @date_article DATE = NULL
AS BEGIN
    -- Check id et ref_produit
    IF @id_produit IS NULL AND @ref_produit IS NULL
    BEGIN
        RAISERROR('Erreur dans la modification dun produit : id_produit et ref_produit sont NULL', 20, 2);
    END
    IF @id_produit NOT IN (SELECT id_produit FROM Produit) AND @ref_produit NOT IN (SELECT ref_produit FROM Produit)
    BEGIN
        RAISERROR('Erreur dans la modification dun produit : id_produit/ref_produit nexiste pas', 20, 2);
    END

    -- Compensate NULL
    IF @id_produit IS NULL
    BEGIN
        SET @id_produit = (SELECT id_produit FROM Produit WHERE ref_produit = @ref_produit);
    END
    IF @ref_produit IS NULL
    BEGIN
        SET @ref_produit = (SELECT ref_produit FROM Produit WHERE id_produit = @id_produit);
    END


    -- Debut de la modification
    BEGIN TRY
        BEGIN TRANSACTION
            -- Modification dans Produit
            UPDATE Produit
            SET nom_produit = ISNULL(@nom_produit, nom_produit),
                ref_produit = ISNULL(@ref_produit, ref_produit),
                designation = ISNULL(@designation, designation),
                quantite = ISNULL(@quantite, quantite),
                seuil_reappro = ISNULL(@seuil_reappro, seuil_reappro),
                taux_tva = ISNULL(@taux_tva, taux_tva)
            WHERE id_produit = @id_produit AND ref_produit = @ref_produit;

            -- Modification dans Historique_prix
            IF @prix_article IS NOT NULL
            BEGIN
                IF @date_article IS NULL
                BEGIN
                    SET @date_article = GETDATE();
                END
                EXEC AddPrix @id_produit, @prix_article, @date_article;
            END
        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION
        RAISERROR('Erreur dans la modification dun produit', 20, 2);
    END CATCH
END
GO

CREATE OR ALTER PROCEDURE ShowProduit
    @id_produit INT = NULL,
    @ref_produit VARCHAR(50) = NULL,
    @nom_produit VARCHAR(50) = NULL,
    @designation VARCHAR(50) = NULL,
    @quantite INT = NULL,
    @seuil_reappro INT = NULL,
    @taux_tva DECIMAL(15,2) = NULL,
    @prix_article MONEY = NULL,
    @date_article DATE = NULL
AS BEGIN
    -- IF NULL, SELECT ALL
    SELECT
        Produit.id_produit,
        Produit.nom_produit,
        Produit.ref_produit,
        Produit.designation,
        Produit.quantite,
        Produit.seuil_reappro,
        Produit.taux_tva,
        prix_actuel.prix_article,
        Historique_prix.date_article
    FROM Produit
    LEFT JOIN prix_actuel ON Produit.id_produit = prix_actuel.id_produit
    LEFT JOIN Historique_prix ON prix_actuel.id_historique = Historique_prix.id_historique
    WHERE (@id_produit IS NULL OR Produit.id_produit = @id_produit)
    AND (@ref_produit IS NULL OR Produit.ref_produit = @ref_produit)
    AND (@nom_produit IS NULL OR Produit.nom_produit = @nom_produit)
    AND (@designation IS NULL OR Produit.designation = @designation)
    AND (@quantite IS NULL OR Produit.quantite = @quantite)
    AND (@seuil_reappro IS NULL OR Produit.seuil_reappro = @seuil_reappro)
    AND (@taux_tva IS NULL OR Produit.taux_tva = @taux_tva)
    AND (@prix_article IS NULL OR prix_actuel.prix_article = @prix_article)
    AND (@date_article IS NULL OR Historique_prix.date_article = @date_article)
END
GO