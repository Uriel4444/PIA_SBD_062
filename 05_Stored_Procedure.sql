--Creación del stored procedure
--Permite que un docente registre una calificación de un alumno validando que toda la información exista y sea válida antes de guardarla
USE EscuelaPrimaria_PIA_Gpo62;
GO

CREATE PROCEDURE sp_registrar_evaluacion
    @id_inscripcion INT,
    @id_docente_materia_grupo INT,
    @periodo VARCHAR(100),
    @calificacion DECIMAL(4,2),
    @observaciones VARCHAR(MAX),
    @registrado_por INT
AS
BEGIN
    BEGIN TRY

        IF NOT EXISTS (
            SELECT 1
            FROM inscripciones
            WHERE id_inscripcion = @id_inscripcion
        )
        BEGIN
            RAISERROR('La inscripción indicada no existe.', 16, 1);
            RETURN;
        END;

        IF NOT EXISTS (
            SELECT 1
            FROM docente_materia_grupo
            WHERE id_docente_materia_grupo = @id_docente_materia_grupo
        )
        BEGIN
            RAISERROR('La asignación docente-materia-grupo no existe.', 16, 1);
            RETURN;
        END;

        IF NOT EXISTS (
            SELECT 1
            FROM usuarios
            WHERE id_usuario = @registrado_por
              AND activo = 1
        )
        BEGIN
            RAISERROR('El usuario que registra no existe o no está activo.', 16, 1);
            RETURN;
        END;

        IF @calificacion < 0 OR @calificacion > 10
        BEGIN
            RAISERROR('La calificación debe estar entre 0 y 10.', 16, 1);
            RETURN;
        END;

        INSERT INTO evaluaciones (
            id_inscripcion,
            id_docente_materia_grupo,
            periodo,
            calificacion,
            observaciones,
            registrado_por
        )
        VALUES (
            @id_inscripcion,
            @id_docente_materia_grupo,
            @periodo,
            @calificacion,
            @observaciones,
            @registrado_por
        );

        SELECT 
            'Evaluación registrada correctamente' AS mensaje,
            @calificacion AS calificacion,

            CASE
                WHEN @calificacion >= 9 THEN 'Excelente'
                WHEN @calificacion >= 8 THEN 'Bueno'
                WHEN @calificacion >= 7 THEN 'Regular'
                WHEN @calificacion >= 6 THEN 'Suficiente'
                ELSE 'Requiere apoyo'
            END AS desempeno;

    END TRY

    BEGIN CATCH

        SELECT 
            ERROR_MESSAGE() AS error,
            ERROR_NUMBER() AS numero_error,
            ERROR_LINE() AS linea_error;

    END CATCH
END;
GO