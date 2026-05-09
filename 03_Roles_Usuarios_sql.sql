--En este script se crean los roles, login y usuarios y se asignan los permisos
USE EscuelaPrimaria_PIA_Gpo62;
GO

CREATE ROLE rol_administrador_ti;
CREATE ROLE rol_direccion_escolar;
CREATE ROLE rol_control_escolar;
CREATE ROLE rol_docente;
CREATE ROLE rol_alumno;
CREATE ROLE rol_auditor;
GO

CREATE LOGIN admin_ti WITH PASSWORD = 'AdminTI_Gpo62_2026!';
CREATE LOGIN direccion_escolar WITH PASSWORD = 'Direccion_Gpo62_2026!';
CREATE LOGIN control_escolar WITH PASSWORD = 'Control_Gpo62_2026!';
CREATE LOGIN docente_demo WITH PASSWORD = 'Docente_2105446_2026!';
CREATE LOGIN alumno_demo WITH PASSWORD = 'Alumno_2016485_2026!';
CREATE LOGIN auditor_demo WITH PASSWORD = 'Auditor_2002278_2026!';
GO

CREATE USER admin_ti FOR LOGIN admin_ti;
CREATE USER direccion_escolar FOR LOGIN direccion_escolar;
CREATE USER control_escolar FOR LOGIN control_escolar;
CREATE USER docente_demo FOR LOGIN docente_demo;
CREATE USER alumno_demo FOR LOGIN alumno_demo;
CREATE USER auditor_demo FOR LOGIN auditor_demo;
GO

ALTER ROLE rol_administrador_ti ADD MEMBER admin_ti;
ALTER ROLE rol_direccion_escolar ADD MEMBER direccion_escolar;
ALTER ROLE rol_control_escolar ADD MEMBER control_escolar;
ALTER ROLE rol_docente ADD MEMBER docente_demo;
ALTER ROLE rol_alumno ADD MEMBER alumno_demo;
ALTER ROLE rol_auditor ADD MEMBER auditor_demo;
GO

GRANT SELECT, INSERT, UPDATE, DELETE ON roles TO rol_administrador_ti;
GRANT SELECT, INSERT, UPDATE, DELETE ON usuarios TO rol_administrador_ti;
GRANT SELECT, INSERT, UPDATE, DELETE ON docentes TO rol_administrador_ti;
GRANT SELECT, INSERT, UPDATE, DELETE ON grupos TO rol_administrador_ti;
GRANT SELECT, INSERT, UPDATE, DELETE ON materias TO rol_administrador_ti;
GRANT SELECT, INSERT, UPDATE, DELETE ON docente_materia_grupo TO rol_administrador_ti;
GRANT SELECT, INSERT, UPDATE, DELETE ON alumnos TO rol_administrador_ti;
GRANT SELECT, INSERT, UPDATE, DELETE ON tutores TO rol_administrador_ti;
GRANT SELECT, INSERT, UPDATE, DELETE ON alumno_tutor TO rol_administrador_ti;
GRANT SELECT, INSERT, UPDATE, DELETE ON inscripciones TO rol_administrador_ti;
GRANT SELECT, INSERT, UPDATE, DELETE ON evaluaciones TO rol_administrador_ti;

GRANT SELECT ON alumnos TO rol_direccion_escolar;
GRANT SELECT ON tutores TO rol_direccion_escolar;
GRANT SELECT ON alumno_tutor TO rol_direccion_escolar;
GRANT SELECT ON docentes TO rol_direccion_escolar;
GRANT SELECT ON grupos TO rol_direccion_escolar;
GRANT SELECT ON materias TO rol_direccion_escolar;
GRANT SELECT ON docente_materia_grupo TO rol_direccion_escolar;
GRANT SELECT ON inscripciones TO rol_direccion_escolar;
GRANT SELECT ON evaluaciones TO rol_direccion_escolar;

GRANT SELECT, INSERT, UPDATE ON alumnos TO rol_control_escolar;
GRANT SELECT, INSERT, UPDATE ON tutores TO rol_control_escolar;
GRANT SELECT, INSERT, UPDATE ON alumno_tutor TO rol_control_escolar;
GRANT SELECT, INSERT, UPDATE ON inscripciones TO rol_control_escolar;
GRANT SELECT ON docentes TO rol_control_escolar;
GRANT SELECT ON grupos TO rol_control_escolar;
GRANT SELECT ON materias TO rol_control_escolar;

GRANT SELECT ON grupos TO rol_docente;
GRANT SELECT ON materias TO rol_docente;
GRANT SELECT ON docente_materia_grupo TO rol_docente;
GRANT SELECT ON inscripciones TO rol_docente;
GRANT SELECT, INSERT, UPDATE ON evaluaciones TO rol_docente;

GRANT SELECT ON evaluaciones TO rol_alumno;

GRANT SELECT ON roles TO rol_auditor;
GRANT SELECT ON usuarios TO rol_auditor;
GRANT SELECT ON docentes TO rol_auditor;
GRANT SELECT ON grupos TO rol_auditor;
GRANT SELECT ON materias TO rol_auditor;
GRANT SELECT ON docente_materia_grupo TO rol_auditor;
GRANT SELECT ON alumnos TO rol_auditor;
GRANT SELECT ON evaluaciones TO rol_auditor;
GO

INSERT INTO usuarios (
    username,
    password_hash,
    id_rol,
    activo
)
VALUES
('admin_ti', HASHBYTES('SHA2_256', 'AdminTI_Gpo62_2026!'), 1, 1),
('direccion_escolar', HASHBYTES('SHA2_256', 'Direccion_Gpo62_2026!'), 2, 1),
('control_escolar', HASHBYTES('SHA2_256', 'Control_Gpo62_2026!'), 3, 1),
('docente_demo', HASHBYTES('SHA2_256', 'Docente_2105446_2026!'), 4, 1),
('alumno_demo', HASHBYTES('SHA2_256', 'Alumno_2016485_2026!'), 5, 1),
('auditor_demo', HASHBYTES('SHA2_256', 'Auditor_2002278_2026!'), 6, 1);
GO