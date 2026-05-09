--Script para cifrado de datos sensibles
USE EscuelaPrimaria_PIA_Gpo62;
GO

CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'MasterKey_Gpo62_2026!';
GO

CREATE CERTIFICATE CertificadoEscuelaSegura
WITH SUBJECT = 'Certificado para cifrado de datos sensibles de alumnos y tutores';
GO

CREATE SYMMETRIC KEY LlaveSimetricaEscuela
WITH ALGORITHM = AES_256
ENCRYPTION BY CERTIFICATE CertificadoEscuelaSegura;
GO

OPEN SYMMETRIC KEY LlaveSimetricaEscuela
DECRYPTION BY CERTIFICATE CertificadoEscuelaSegura;
GO

UPDATE alumnos
SET 
    curp_cifrada = EncryptByKey(Key_GUID('LlaveSimetricaEscuela'), 'HEGA190315HNLGRN01'),
    direccion_cifrada = EncryptByKey(Key_GUID('LlaveSimetricaEscuela'), 'Calle Encino 245, Monterrey, Nuevo León'),
    alergias_cifradas = EncryptByKey(Key_GUID('LlaveSimetricaEscuela'), 'Alergia leve al polvo'),
    enfermedades_cifradas = EncryptByKey(Key_GUID('LlaveSimetricaEscuela'), 'Sin enfermedades crónicas registradas'),
    contacto_emergencia_cifrado = EncryptByKey(Key_GUID('LlaveSimetricaEscuela'), 'Laura Beatriz García Morales - 8181234567')
WHERE id_alumno = 1;

UPDATE alumnos
SET 
    curp_cifrada = EncryptByKey(Key_GUID('LlaveSimetricaEscuela'), 'DUPV190722MNLRSN02'),
    direccion_cifrada = EncryptByKey(Key_GUID('LlaveSimetricaEscuela'), 'Calle Roble 118, San Nicolás de los Garza, Nuevo León'),
    alergias_cifradas = EncryptByKey(Key_GUID('LlaveSimetricaEscuela'), 'Sin alergias registradas'),
    enfermedades_cifradas = EncryptByKey(Key_GUID('LlaveSimetricaEscuela'), 'Asma leve controlada'),
    contacto_emergencia_cifrado = EncryptByKey(Key_GUID('LlaveSimetricaEscuela'), 'Mónica Alejandra Pansza López - 8187654321')
WHERE id_alumno = 2;

UPDATE tutores
SET
    telefono_cifrado = EncryptByKey(Key_GUID('LlaveSimetricaEscuela'), '8181234567'),
    correo_cifrado = EncryptByKey(Key_GUID('LlaveSimetricaEscuela'), 'laura.garcia@example.com'),
    direccion_cifrada = EncryptByKey(Key_GUID('LlaveSimetricaEscuela'), 'Calle Encino 245, Monterrey, Nuevo León')
WHERE id_tutor = 1;

UPDATE tutores
SET
    telefono_cifrado = EncryptByKey(Key_GUID('LlaveSimetricaEscuela'), '8187654321'),
    correo_cifrado = EncryptByKey(Key_GUID('LlaveSimetricaEscuela'), 'monica.pansza@example.com'),
    direccion_cifrada = EncryptByKey(Key_GUID('LlaveSimetricaEscuela'), 'Calle Roble 118, San Nicolás de los Garza, Nuevo León')
WHERE id_tutor = 2;

UPDATE docentes
SET telefono_cifrado = EncryptByKey(Key_GUID('LlaveSimetricaEscuela'), '8181112233')
WHERE id_docente = 1;

UPDATE docentes
SET telefono_cifrado = EncryptByKey(Key_GUID('LlaveSimetricaEscuela'), '8184445566')
WHERE id_docente = 2;

CLOSE SYMMETRIC KEY LlaveSimetricaEscuela;
GO