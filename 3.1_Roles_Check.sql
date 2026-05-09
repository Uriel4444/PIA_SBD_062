--Con este script se hace check de la asignacion de roles, usuarios, etc
USE EscuelaPrimaria_PIA_Gpo62;
GO

SELECT * FROM sys.database_principals
WHERE type = 'R';

SELECT * FROM sys.database_principals
WHERE type = 'S';

SELECT * FROM sys.database_role_members;