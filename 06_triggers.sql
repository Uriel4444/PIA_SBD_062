--Implementación de trigger
-- Se implementó un trigger de auditoría que registra automáticamente cualquier modificación realizada sobre las evaluaciones académicas. Cada cambio queda almacenado en la tabla historial_evaluaciones, permitiendo mantener trazabilidad, integridad y control sobre las modificaciones efectuadas dentro del sistema escolar

USE EscuelaPrimaria_PIA_Gpo62;
GO

CREATE TABLE historial_evaluaciones (
    id_historial INT IDENTITY(1,1) PRIMARY KEY,
    id_evaluacion INT NOT NULL,
    calificacion_anterior DECIMAL(4,2),
    calificacion_nueva DECIMAL(4,2),
    observaciones_anteriores VARCHAR(MAX),
    observaciones_nuevas VARCHAR(MAX),
    modificado_por INT,
    fecha_modificacion DATETIME DEFAULT GETDATE(),

    FOREIGN KEY (id_evaluacion) REFERENCES evaluaciones(id_evaluacion),
    FOREIGN KEY (modificado_por) REFERENCES usuarios(id_usuario)
);
GO

CREATE TRIGGER trg_auditar_cambio_evaluacion
ON evaluaciones
AFTER UPDATE
AS
BEGIN
    INSERT INTO historial_evaluaciones (
        id_evaluacion,
        calificacion_anterior,
        calificacion_nueva,
        observaciones_anteriores,
        observaciones_nuevas,
        modificado_por,
        fecha_modificacion
    )
    SELECT
        d.id_evaluacion,
        d.calificacion,
        i.calificacion,
        d.observaciones,
        i.observaciones,
        i.registrado_por,
        GETDATE()
    FROM deleted d
    INNER JOIN inserted i
        ON d.id_evaluacion = i.id_evaluacion;
END;
GO
