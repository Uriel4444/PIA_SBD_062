-- Este script permite monitorear usuarios, roles, evaluaciones, asignaciones académicas y modificaciones realizadas dentro del sistema. Además, demuestra la implementación de controles de seguridad, trazabilidad y protección de datos sensibles mediante consultas de supervisión y validación.
USE EscuelaPrimaria_PIA_Gpo62;
GO

SELECT 
    u.id_usuario,
    u.username,
    r.nombre_rol,
    u.activo
FROM usuarios u
INNER JOIN roles r
    ON u.id_rol = r.id_rol;
GO

SELECT 
    d.nombre + ' ' + d.apellido_paterno AS docente,
    m.nombre_materia,
    g.grado,
    g.seccion,
    dmg.ciclo_escolar
FROM docente_materia_grupo dmg
INNER JOIN docentes d
    ON dmg.id_docente = d.id_docente
INNER JOIN materias m
    ON dmg.id_materia = m.id_materia
INNER JOIN grupos g
    ON dmg.id_grupo = g.id_grupo;
GO

SELECT 
    e.id_evaluacion,
    a.nombre + ' ' + a.apellido_paterno AS alumno,
    m.nombre_materia,
    e.periodo,
    e.calificacion,
    e.fecha_registro
FROM evaluaciones e
INNER JOIN inscripciones i
    ON e.id_inscripcion = i.id_inscripcion
INNER JOIN alumnos a
    ON i.id_alumno = a.id_alumno
INNER JOIN docente_materia_grupo dmg
    ON e.id_docente_materia_grupo = dmg.id_docente_materia_grupo
INNER JOIN materias m
    ON dmg.id_materia = m.id_materia;
GO

SELECT 
    h.id_historial,
    h.id_evaluacion,
    h.calificacion_anterior,
    h.calificacion_nueva,
    h.fecha_modificacion,
    u.username AS usuario_modifico
FROM historial_evaluaciones h
INNER JOIN usuarios u
    ON h.modificado_por = u.id_usuario;
GO

SELECT 
    id_alumno,
    nombre,
    apellido_paterno,
    curp_cifrada,
    direccion_cifrada,
    alergias_cifradas,
    enfermedades_cifradas
FROM alumnos;
GO