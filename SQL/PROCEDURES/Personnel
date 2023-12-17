/*
 Error code : 1
 add/remove/update/show personnel
*/

CREATE OR ALTER PROCEDURE AddPersonnel
    @nom_personnel VARCHAR(50) = NULL,
    @prenom_personnel VARCHAR(50) = NULL,
    @superieur_personnel VARCHAR(50) = NULL,
    @date_embauche DATE = NULL,
    @nom_adresse VARCHAR(50) = NULL,
    @nom_ville VARCHAR(50) = NULL,
    @nom_pays VARCHAR(50) = NULL
AS BEGIN
    -- CHECK (nom, prénom, date_personnel, adresse, ville, pays)
    IF @nom_personnel IS NULL OR @prenom_personnel IS NULL
    BEGIN
        RAISERROR('Erreur dans lajout dun personnel : nom_personnel et/ou prenom_personnel est vide',20,1);
    END
    IF @date_embauche IS NULL
    BEGIN
        RAISERROR('Erreur dans lajout dun personnel : date_embauche est vide',10,1);
        SET @date_embauche = GETDATE();
    END
    IF @nom_adresse IS NULL OR @nom_ville IS NULL OR @nom_pays IS NULL
    BEGIN
        RAISERROR('Erreur dans lajout dun personnel : nom_adresse et/ou nom_ville et/ou nom_pays est vide',20,1);
    END


    -- Déclaration pour la clé étrangère de l'adresse
    DECLARE @id_adresse INT;


    -- Début de l'ajout
    BEGIN TRY
        BEGIN TRANSACTION
        -- Ajout de l'adresse
        EXEC AddAdresse @nom_adresse, @nom_ville, @nom_pays, @id_adresse OUTPUT;

        -- Ajout du personnel
        INSERT INTO Personnel (nom_personnel, prenom_personnel, superieur_personnel, date_embauche, id_adresse)
        VALUES (@nom_personnel, @prenom_personnel, @superieur_personnel, @date_embauche, @id_adresse);

        -- Retourne l'id du personnel ajouté
        SELECT SCOPE_IDENTITY() AS id_personnel;
        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION
        RAISERROR('Erreur dans lajout dun personnel', 20, 1);
    END CATCH
END
GO


CREATE OR ALTER PROCEDURE RemovePersonnel
    @id_personnel INT,
    @nom_personnel VARCHAR(50) = NULL,
    @prenom_personnel VARCHAR(50) = NULL
AS BEGIN
    -- CHECK info
    IF @id_personnel IS NULL OR @nom_personnel IS NULL OR @prenom_personnel IS NULL
    BEGIN
        RAISERROR('Erreur dans la suppression dun personnel : id_personnel et/ou nom_personnel et/ou prenom_personnel est vide',20,1);
    END

    -- Check if personnel exists
    IF NOT EXISTS (SELECT * FROM Personnel WHERE id_personnel = @id_personnel AND nom_personnel = @nom_personnel AND prenom_personnel = @prenom_personnel)
    BEGIN
        RAISERROR('Erreur dans la suppression dun personnel : personnel inexistant',20,1);
    END


    -- Début de la suppression
    BEGIN TRY
        BEGIN TRANSACTION
        -- Suppression du personnel
        DELETE FROM Personnel
        WHERE id_personnel = @id_personnel
        AND nom_personnel = @nom_personnel
        AND prenom_personnel = @prenom_personnel;
        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION
        RAISERROR('Erreur dans la suppression dun personnel', 20, 1);
    END CATCH
END
GO


CREATE OR ALTER PROCEDURE UpdatePersonnel
    @id_personnel INT = NULL,
    @nom_personnel VARCHAR(50) = NULL,
    @prenom_personnel VARCHAR(50) = NULL,
    @superieur_personnel VARCHAR(50) = NULL,
    @date_embauche DATE = NULL,
    @nom_adresse VARCHAR(50) = NULL,
    @nom_ville VARCHAR(50) = NULL,
    @nom_pays VARCHAR(50) = NULL
AS BEGIN
    -- Check id
    IF @id_personnel IS NULL
    BEGIN
        RAISERROR('Erreur dans la modification dun personnel : id_personnel est vide',20,1);
    END

    -- Début de la modification
    BEGIN TRY
        BEGIN TRANSACTION
        -- Modification du personnel
        UPDATE Personnel
        SET nom_personnel = ISNULL(@nom_personnel, nom_personnel),
            prenom_personnel = ISNULL(@prenom_personnel, prenom_personnel),
            superieur_personnel = ISNULL(@superieur_personnel, superieur_personnel),
            date_embauche = ISNULL(@date_embauche, date_embauche)
        WHERE id_personnel = @id_personnel;

        IF @nom_adresse IS NOT NULL AND @nom_ville IS NOT NULL AND @nom_pays IS NOT NULL
        BEGIN
            -- Déclaration pour la clé étrangère de l'adresse
            DECLARE @id_adresse INT;
            EXEC AddAdresse @nom_adresse, @nom_ville, @nom_pays, @id_adresse OUTPUT;
            UPDATE Personnel
            SET id_adresse = @id_adresse
            WHERE id_personnel = @id_personnel;
        END
        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION
        RAISERROR('Erreur dans la modification dun personnel', 20, 1);
    END CATCH
END
GO


CREATE OR ALTER PROCEDURE ShowPersonnel
    @id_personnel INT = NULL,
    @nom_personnel VARCHAR(50) = NULL,
    @prenom_personnel VARCHAR(50) = NULL
AS BEGIN
    -- IF NULL, SELECT ALL
    SELECT * FROM Personnel
    WHERE (@id_personnel IS NULL OR id_personnel = @id_personnel)
    AND (@nom_personnel IS NULL OR nom_personnel = @nom_personnel)
    AND (@prenom_personnel IS NULL OR prenom_personnel = @prenom_personnel);
END
GO
