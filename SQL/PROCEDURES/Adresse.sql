/*
 Error code : 0
 Get Pays/Ville/Adresse
 Add Adresse
 */

CREATE OR ALTER PROCEDURE GetPays
    @nom_pays VARCHAR(50) = NULL,
    @id_pays INT OUTPUT
AS BEGIN
    SELECT @id_pays = Pays.id_pays FROM Pays
    WHERE LOWER(Pays.nom_pays) = LOWER(@nom_pays);
END
GO

CREATE OR ALTER PROCEDURE GetVille
    @nom_ville VARCHAR(50) = NULL,
    @id_pays INT,
    @id_ville INT OUTPUT
AS BEGIN
    SELECT @id_ville = Ville.id_ville FROM Ville
    WHERE LOWER(Ville.nom_ville) = LOWER(@nom_ville)
    AND Ville.id_pays = @id_pays;
END
GO

CREATE OR ALTER PROCEDURE GetAdresse
    @nom_adresse VARCHAR(50) = NULL,
    @id_ville INT,
    @id_adresse INT OUTPUT
AS BEGIN
    SELECT @id_adresse = Adresse.id_adresse FROM Adresse
    WHERE LOWER(Adresse.nom_adresse) = LOWER(@nom_adresse)
    AND Adresse.id_ville = @id_ville;
END
GO

CREATE OR ALTER PROCEDURE AddAdresse
    @nom_adresse VARCHAR(50) = NULL,
    @nom_ville VARCHAR(50) = NULL,
    @nom_pays VARCHAR(50) = NULL
AS BEGIN
    -- Vérification des paramètres
    IF @nom_adresse IS NULL
    BEGIN
        RAISERROR('Erreur dans lajout dune adresse : nom_adresse est NULL', 20, 0);
    END
    IF @nom_ville IS NULL
    BEGIN
        RAISERROR('Erreur dans lajout dune adresse : nom_ville est NULL', 16, 0);
    END
    IF @nom_pays IS NULL
    BEGIN
        RAISERROR('Erreur dans lajout dune adresse : nom_pays est NULL', 16, 0);
    END


    -- Déclaration des ID que nous allons chercher
    DECLARE
        @id_pays INT,
        @id_ville INT,
        @id_adresse INT;

    -- Début de l'ajout
    BEGIN TRY
        BEGIN TRANSACTION
        -- Partie Pays
        EXEC GetPays @nom_pays, @id_pays OUTPUT;

        IF @id_pays IS NULL
        BEGIN
            INSERT INTO PAYS (nom_pays) VALUES (@nom_pays);
            SET @id_pays = SCOPE_IDENTITY();
        END


        -- Partie Ville
        EXEC GetVille @nom_ville, @id_pays, @id_ville OUTPUT

        IF @id_ville IS NULL
        BEGIN
            INSERT INTO VILLE (nom_ville, id_pays) VALUES (@nom_ville, @id_pays);
            SET @id_ville = SCOPE_IDENTITY();
        END


        -- Partie Adresse
        EXEC GetAdresse @nom_adresse, @id_ville, @id_adresse OUTPUT

        IF @id_adresse IS NULL
        BEGIN
            INSERT INTO ADRESSE (nom_adresse, id_ville) VALUES (@nom_adresse, @id_ville);
            SET @id_adresse = SCOPE_IDENTITY();
        END

        -- Retourne l'id de l'adresse créée
        SELECT @id_adresse AS id_adresse;
        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION
        RAISERROR('Erreur dans lajout dune adresse', 20, 0);
    END CATCH
END
GO