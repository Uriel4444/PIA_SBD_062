--Prueba del stored procedure: RESULTADO VÁLIDO
USE EscuelaPrimaria_PIA_Gpo62;
GO

EXEC sp_registrar_evaluacion
    @id_inscripcion = 1,
    @id_docente_materia_grupo = 1,
    @periodo = 'Primer Parcial',
    @calificacion = 9.5,
    @observaciones = 'Excelente desempeño académico',
    @registrado_por = 4;
GO