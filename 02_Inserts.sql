USE EscuelaPrimaria_PIA_Gpo62;
GO

INSERT INTO roles (nombre_rol, descripcion)
VALUES 
('Administrador TI', 'Manejo de usuarios, seguridad, respaldos y configuración'),
('Direccion Escolar', 'Consulta información general, contactos de emergencia, reportes académicos y datos necesarios para atención escolar'),
('Control Escolar', 'Registra alumnos, tutores, grupos e inscripciones'),
('Docente', 'Consulta únicamente sus grupos y registra evaluaciones'),
('Alumno', 'Consulta su información académica'),
('Auditor', 'Revisa accesos, cambios y registros de seguridad');

INSERT INTO docentes (
    numero_empleado, nombre, apellido_paterno, apellido_materno,
    correo, estatus, observaciones
)
VALUES
('DOC001', 'Melissa Jacqueline', 'Mendieta', 'González', 'melissa.mendieta@sega.edu.mx', 'Activo', 'Docente titular'),
('DOC002', 'Andrea', 'Infante', 'Sánchez', 'andrea.infante@sega.edu.mx', 'Activo', 'Docente titular'),
('DOC003', 'Yazmany Jahaziel', 'Guerrero', 'Ceja', 'yazmany.guerrero@sega.edu.mx', 'Activo', 'Docente titular'),
('DOC004', 'Paola Fernanda', 'Ramírez', 'Luna', 'paola.ramirez@sega.edu.mx', 'Activo', 'Docente de primaria'),
('DOC005', 'Miguel Ángel', 'Torres', 'Salinas', 'miguel.torres@sega.edu.mx', 'Activo', 'Docente de primaria'),
('DOC006', 'Claudia Mariana', 'Reyes', 'Ortega', 'claudia.reyes@sega.edu.mx', 'Activo', 'Docente de primaria'),
('DOC007', 'Roberto Carlos', 'Mendoza', 'Vega', 'roberto.mendoza@sega.edu.mx', 'Activo', 'Docente de primaria'),
('DOC008', 'Fernanda Sofía', 'Castillo', 'Nava', 'fernanda.castillo@sega.edu.mx', 'Activo', 'Docente de primaria');

INSERT INTO grupos (
    grado, seccion, ciclo_escolar,
    id_docente_titular, observaciones
)
VALUES
(1, 'A', '2025-2026', 1, 'Grupo A de primer grado'),
(1, 'B', '2025-2026', 2, 'Grupo B de primer grado'),
(1, 'C', '2025-2026', 3, 'Grupo C de primer grado'),

(2, 'A', '2025-2026', 4, 'Grupo A de segundo grado'),
(2, 'B', '2025-2026', 5, 'Grupo B de segundo grado'),
(2, 'C', '2025-2026', 6, 'Grupo C de segundo grado'),

(3, 'A', '2025-2026', 7, 'Grupo A de tercer grado'),
(3, 'B', '2025-2026', 8, 'Grupo B de tercer grado'),
(3, 'C', '2025-2026', 1, 'Grupo C de tercer grado'),

(4, 'A', '2025-2026', 2, 'Grupo A de cuarto grado'),
(4, 'B', '2025-2026', 3, 'Grupo B de cuarto grado'),
(4, 'C', '2025-2026', 4, 'Grupo C de cuarto grado'),

(5, 'A', '2025-2026', 5, 'Grupo A de quinto grado'),
(5, 'B', '2025-2026', 6, 'Grupo B de quinto grado'),
(5, 'C', '2025-2026', 7, 'Grupo C de quinto grado'),

(6, 'A', '2025-2026', 8, 'Grupo A de sexto grado'),
(6, 'B', '2025-2026', 1, 'Grupo B de sexto grado'),
(6, 'C', '2025-2026', 2, 'Grupo C de sexto grado');

INSERT INTO materias (nombre_materia, grado, descripcion)
VALUES
('Lectura y escritura', 1, 'Materia de primer grado'),
('Matemáticas básicas', 1, 'Materia de primer grado'),
('Conocimiento del medio', 1, 'Materia de primer grado'),
('Inglés', 1, 'Materia de primer grado'),
('Artes', 1, 'Materia de primer grado'),
('Educación física', 1, 'Materia de primer grado'),

('Lectura y escritura', 2, 'Materia de segundo grado'),
('Matemáticas básicas', 2, 'Materia de segundo grado'),
('Conocimiento del medio', 2, 'Materia de segundo grado'),
('Inglés', 2, 'Materia de segundo grado'),
('Artes', 2, 'Materia de segundo grado'),
('Educación física', 2, 'Materia de segundo grado'),

('Español', 3, 'Materia de tercer grado'),
('Matemáticas', 3, 'Materia de tercer grado'),
('Ciencias naturales', 3, 'Materia de tercer grado'),
('Historia', 3, 'Materia de tercer grado'),
('Geografía', 3, 'Materia de tercer grado'),
('Formación cívica y ética', 3, 'Materia de tercer grado'),
('Inglés', 3, 'Materia de tercer grado'),
('Artes', 3, 'Materia de tercer grado'),
('Educación física', 3, 'Materia de tercer grado'),

('Español', 4, 'Materia de cuarto grado'),
('Matemáticas', 4, 'Materia de cuarto grado'),
('Ciencias naturales', 4, 'Materia de cuarto grado'),
('Historia', 4, 'Materia de cuarto grado'),
('Geografía', 4, 'Materia de cuarto grado'),
('Formación cívica y ética', 4, 'Materia de cuarto grado'),
('Inglés', 4, 'Materia de cuarto grado'),
('Artes', 4, 'Materia de cuarto grado'),
('Educación física', 4, 'Materia de cuarto grado'),

('Español', 5, 'Materia de quinto grado'),
('Matemáticas', 5, 'Materia de quinto grado'),
('Ciencias naturales', 5, 'Materia de quinto grado'),
('Historia de México y universal', 5, 'Materia de quinto grado'),
('Geografía', 5, 'Materia de quinto grado'),
('Formación cívica y ética', 5, 'Materia de quinto grado'),
('Inglés', 5, 'Materia de quinto grado'),
('Artes', 5, 'Materia de quinto grado'),
('Educación física', 5, 'Materia de quinto grado'),

('Español', 6, 'Materia de sexto grado'),
('Matemáticas', 6, 'Materia de sexto grado'),
('Ciencias naturales', 6, 'Materia de sexto grado'),
('Historia de México y universal', 6, 'Materia de sexto grado'),
('Geografía', 6, 'Materia de sexto grado'),
('Formación cívica y ética', 6, 'Materia de sexto grado'),
('Inglés', 6, 'Materia de sexto grado'),
('Artes', 6, 'Materia de sexto grado'),
('Educación física', 6, 'Materia de sexto grado');

INSERT INTO alumnos (
    matricula, nombre, apellido_paterno, apellido_materno,
    fecha_nacimiento, correo_institucional,
    estatus, observaciones
)
VALUES
('ALU001', 'Ángel Esaú', 'Hernández', 'García', '2019-03-15', 'angel.hernandez@sega.edu.mx', 'Activo', 'Primer grado'),
('ALU002', 'Valeria', 'Durón', 'Pansza', '2019-07-22', 'valeria.duron@sega.edu.mx', 'Activo', 'Primer grado'),
('ALU003', 'Edwin Uriel', 'Santiago', 'Camacho', '2018-10-28', 'edwin.santiago@sega.edu.mx', 'Activo', 'Segundo grado'),
('ALU004', 'Grecia Isabel', 'González', 'García', '2018-05-19', 'grecia.gonzalez@sega.edu.mx', 'Activo', 'Segundo grado'),
('ALU005', 'Daniel', 'Cardona', 'Cuellar', '2017-04-11', 'daniel.cardona@sega.edu.mx', 'Activo', 'Tercer grado'),
('ALU006', 'Javier Gael', 'Garza', 'De la Fuente', '2017-09-02', 'javier.garza@sega.edu.mx', 'Activo', 'Tercer grado'),
('ALU007', 'Alicia Christyna', 'Martínez', 'Parra', '2016-08-14', 'alicia.martinez@sega.edu.mx', 'Activo', 'Cuarto grado'),
('ALU008', 'Jorge Gael', 'Rodríguez', 'Ibarra', '2016-02-26', 'jorge.rodriguez@sega.edu.mx', 'Activo', 'Cuarto grado'),
('ALU009', 'Carolina', 'Garza', 'Ortiz', '2015-06-08', 'carolina.garza@sega.edu.mx', 'Activo', 'Quinto grado'),
('ALU010', 'Aurora del Carmen', 'Piedra', 'Alegría', '2015-12-17', 'aurora.piedra@sega.edu.mx', 'Activo', 'Quinto grado'),
('ALU011', 'Carlos Manuel', 'Valerio', 'Rios', '2014-05-23', 'carlos.valerio@sega.edu.mx', 'Activo', 'Sexto grado'),
('ALU012', 'Mariana Sofía', 'López', 'Herrera', '2014-11-09', 'mariana.lopez@sega.edu.mx', 'Activo', 'Sexto grado');

INSERT INTO tutores (
    nombre, apellido_paterno, apellido_materno,
    parentesco, fecha_nacimiento, observaciones
)
VALUES
('Laura Beatriz', 'García', 'Morales', 'Madre', '1991-04-18', 'Tutora principal'),
('Mónica Alejandra', 'Pansza', 'López', 'Madre', '1990-11-25', 'Tutora principal'),
('Luis Fernando', 'Santiago', 'Reyes', 'Padre', '1989-09-13', 'Tutor principal'),
('Claudia Isabel', 'García', 'Santos', 'Madre', '1992-06-07', 'Tutora principal'),
('José Antonio', 'Cardona', 'Ramírez', 'Padre', '1988-03-21', 'Tutor principal'),
('Adriana Michelle', 'De la Fuente', 'Vargas', 'Madre', '1990-01-30', 'Tutora principal'),
('Patricia Elena', 'Parra', 'Núñez', 'Madre', '1987-07-12', 'Tutora principal'),
('Roberto Iván', 'Rodríguez', 'Campos', 'Padre', '1986-10-05', 'Tutor principal'),
('Gabriela Fernanda', 'Ortiz', 'Salazar', 'Madre', '1989-12-01', 'Tutora principal'),
('Carmen Alejandra', 'Alegría', 'Mendoza', 'Madre', '1988-08-16', 'Tutora principal'),
('Manuel Alejandro', 'Valerio', 'Hernández', 'Padre', '1985-02-27', 'Tutor principal'),
('Daniela Paola', 'Herrera', 'Castillo', 'Madre', '1986-05-20', 'Tutora principal');

INSERT INTO alumno_tutor (
    id_alumno, id_tutor,
    contacto_principal,
    autorizado_recoger,
    observaciones
)
VALUES
(1,1,1,1,'Tutor principal'),
(2,2,1,1,'Tutor principal'),
(3,3,1,1,'Tutor principal'),
(4,4,1,1,'Tutor principal'),
(5,5,1,1,'Tutor principal'),
(6,6,1,1,'Tutor principal'),
(7,7,1,1,'Tutor principal'),
(8,8,1,1,'Tutor principal'),
(9,9,1,1,'Tutor principal'),
(10,10,1,1,'Tutor principal'),
(11,11,1,1,'Tutor principal'),
(12,12,1,1,'Tutor principal');

INSERT INTO inscripciones (
    id_alumno, id_grupo,
    ciclo_escolar,
    fecha_inscripcion,
    estatus,
    observaciones
)
VALUES
(1,1,'2025-2026','2025-08-20','Activo','Primer grado grupo A'),
(2,1,'2025-2026','2025-08-20','Activo','Primer grado grupo A'),
(3,4,'2025-2026','2025-08-20','Activo','Segundo grado grupo A'),
(4,4,'2025-2026','2025-08-20','Activo','Segundo grado grupo A'),
(5,7,'2025-2026','2025-08-20','Activo','Tercer grado grupo A'),
(6,7,'2025-2026','2025-08-20','Activo','Tercer grado grupo A'),
(7,10,'2025-2026','2025-08-20','Activo','Cuarto grado grupo A'),
(8,10,'2025-2026','2025-08-20','Activo','Cuarto grado grupo A'),
(9,13,'2025-2026','2025-08-20','Activo','Quinto grado grupo A'),
(10,13,'2025-2026','2025-08-20','Activo','Quinto grado grupo A'),
(11,16,'2025-2026','2025-08-20','Activo','Sexto grado grupo A'),
(12,16,'2025-2026','2025-08-20','Activo','Sexto grado grupo A');

INSERT INTO docente_materia_grupo (
    id_docente,
    id_materia,
    id_grupo,
    ciclo_escolar,
    observaciones
)
VALUES
(2, 8, 4, '2025-2026', 'Andrea imparte Matemáticas básicas en segundo A'),
(2, 22, 10, '2025-2026', 'Andrea imparte Español en cuarto A'),
(1, 1, 1, '2025-2026', 'Melissa imparte Lectura y escritura en primero A'),
(3, 19, 7, '2025-2026', 'Yazmany imparte Inglés en tercero A');