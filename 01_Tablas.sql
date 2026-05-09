CREATE DATABASE EscuelaPrimaria_PIA_Gpo62;
GO

USE EscuelaPrimaria_PIA_Gpo62;
GO

CREATE TABLE roles (
    id_rol INT IDENTITY(1,1) PRIMARY KEY,
    nombre_rol VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255)
);

CREATE TABLE usuarios (
    id_usuario INT IDENTITY(1,1) PRIMARY KEY,
    username VARCHAR(150) NOT NULL UNIQUE,
    password_hash VARBINARY(MAX) NOT NULL,
    id_rol INT NOT NULL,
    activo BIT DEFAULT 1,
    FOREIGN KEY (id_rol) REFERENCES roles(id_rol)
);

CREATE TABLE docentes (
    id_docente INT IDENTITY(1,1) PRIMARY KEY,
    numero_empleado VARCHAR(50) NOT NULL UNIQUE,
    nombre VARCHAR(150) NOT NULL,
    apellido_paterno VARCHAR(150) NOT NULL,
    apellido_materno VARCHAR(150),
    telefono_cifrado VARBINARY(MAX),
    correo VARCHAR(255),
    estatus VARCHAR(100),
    observaciones VARCHAR(MAX)
);

CREATE TABLE grupos (
    id_grupo INT IDENTITY(1,1) PRIMARY KEY,
    grado INT NOT NULL,
    seccion VARCHAR(10) NOT NULL,
    ciclo_escolar VARCHAR(100) NOT NULL,
    id_docente_titular INT NOT NULL,
    observaciones VARCHAR(MAX),
    FOREIGN KEY (id_docente_titular) REFERENCES docentes(id_docente)
);

CREATE TABLE alumnos (
    id_alumno INT IDENTITY(1,1) PRIMARY KEY,
    matricula VARCHAR(50) NOT NULL UNIQUE,
    nombre VARCHAR(150) NOT NULL,
    apellido_paterno VARCHAR(150) NOT NULL,
    apellido_materno VARCHAR(150),
    curp_cifrada VARBINARY(MAX),
    fecha_nacimiento DATE,
    direccion_cifrada VARBINARY(MAX),
    correo_institucional VARCHAR(255),
    alergias_cifradas VARBINARY(MAX),
    enfermedades_cifradas VARBINARY(MAX),
    contacto_emergencia_cifrado VARBINARY(MAX),
    estatus VARCHAR(100),
    observaciones VARCHAR(MAX)
);

CREATE TABLE tutores (
    id_tutor INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    apellido_paterno VARCHAR(150) NOT NULL,
    apellido_materno VARCHAR(150),
    parentesco VARCHAR(100),
    telefono_cifrado VARBINARY(MAX),
    correo_cifrado VARBINARY(MAX),
    fecha_nacimiento DATE,
    direccion_cifrada VARBINARY(MAX),
    observaciones VARCHAR(MAX)
);

CREATE TABLE alumno_tutor (
    id_alumno INT NOT NULL,
    id_tutor INT NOT NULL,
    contacto_principal BIT DEFAULT 0,
    autorizado_recoger BIT DEFAULT 0,
    observaciones VARCHAR(MAX),
    PRIMARY KEY (id_alumno, id_tutor),
    FOREIGN KEY (id_alumno) REFERENCES alumnos(id_alumno),
    FOREIGN KEY (id_tutor) REFERENCES tutores(id_tutor)
);

CREATE TABLE materias (
    id_materia INT IDENTITY(1,1) PRIMARY KEY,
    nombre_materia VARCHAR(150) NOT NULL,
    grado INT NOT NULL,
    descripcion VARCHAR(MAX)
);

CREATE TABLE docente_materia_grupo (
    id_docente_materia_grupo INT IDENTITY(1,1) PRIMARY KEY,
    id_docente INT NOT NULL,
    id_materia INT NOT NULL,
    id_grupo INT NOT NULL,
    ciclo_escolar VARCHAR(100) NOT NULL,
    observaciones VARCHAR(MAX),
    FOREIGN KEY (id_docente) REFERENCES docentes(id_docente),
    FOREIGN KEY (id_materia) REFERENCES materias(id_materia),
    FOREIGN KEY (id_grupo) REFERENCES grupos(id_grupo)
);

CREATE TABLE inscripciones (
    id_inscripcion INT IDENTITY(1,1) PRIMARY KEY,
    id_alumno INT NOT NULL,
    id_grupo INT NOT NULL,
    ciclo_escolar VARCHAR(100) NOT NULL,
    fecha_inscripcion DATE,
    estatus VARCHAR(100),
    observaciones VARCHAR(MAX),
    FOREIGN KEY (id_alumno) REFERENCES alumnos(id_alumno),
    FOREIGN KEY (id_grupo) REFERENCES grupos(id_grupo)
);

CREATE TABLE evaluaciones (
    id_evaluacion INT IDENTITY(1,1) PRIMARY KEY,
    id_inscripcion INT NOT NULL,
    id_docente_materia_grupo INT NOT NULL,
    periodo VARCHAR(100) NOT NULL,
    calificacion DECIMAL(4,2),
    observaciones VARCHAR(MAX),
    fecha_registro DATETIME DEFAULT GETDATE(),
    registrado_por INT NOT NULL,
    FOREIGN KEY (id_inscripcion) REFERENCES inscripciones(id_inscripcion),
    FOREIGN KEY (id_docente_materia_grupo) REFERENCES docente_materia_grupo(id_docente_materia_grupo),
    FOREIGN KEY (registrado_por) REFERENCES usuarios(id_usuario)
);