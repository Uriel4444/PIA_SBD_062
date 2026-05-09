--Prueba del stored procedure: INVALIDO
-- Prueba de error: calificación inválida

USE EscuelaPrimaria_PIA_Gpo62;
GO

EXEC sp_registrar_evaluacion
    @id_inscripcion = 1,
    @id_docente_materia_grupo = 1,
    @periodo = 'Segundo Parcial',
    @calificacion = 15,
    @observaciones = 'Prueba de error por calificación inválida',
    @registrado_por = 4;
GO