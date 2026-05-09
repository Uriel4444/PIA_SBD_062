--Script para verficar el cifrado
USE EscuelaPrimaria_PIA_Gpo62;
GO

SELECT 
    id_alumno,
    nombre,
    apellido_paterno,
    curp_cifrada,
    direccion_cifrada,
    alergias_cifradas,
    enfermedades_cifradas,
    contacto_emergencia_cifrado
FROM alumnos;

SELECT 
    id_tutor,
    nombre,
    apellido_paterno,
    telefono_cifrado,
    correo_cifrado,
    direccion_cifrada
FROM tutores;

SELECT 
    id_docente,
    nombre,
    apellido_paterno,
    telefono_cifrado
FROM docentes;