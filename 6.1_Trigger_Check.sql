USE EscuelaPrimaria_PIA_Gpo62;
GO

-- Prueba del trigger de auditoría

UPDATE evaluaciones
SET 
    calificacion = 8.5,
    observaciones = 'Calificación modificada para prueba del trigger'
WHERE id_evaluacion = 2;
GO

-- Resultado del historial generado por el trigger

SELECT 
    id_historial,
    id_evaluacion,
    calificacion_anterior,
    calificacion_nueva,
    observaciones_anteriores,
    observaciones_nuevas,
    modificado_por,
    fecha_modificacion
FROM historial_evaluaciones
WHERE id_evaluacion = 2;
GO