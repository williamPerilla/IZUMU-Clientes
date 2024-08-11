-- Crear tabla tiposDocumentos
CREATE TABLE tiposDocumentos (
    idTipoDocumento INT IDENTITY(1,1) PRIMARY KEY,
    descripcionDocumento NVARCHAR(50) NOT NULL
)
GO

-- Insertar datos en tiposDocumentos
INSERT INTO tiposDocumentos (DescripcionDocumento)
VALUES 
    ('CC-Cedula de ciudadania'),
    ('RC-Registro Civil'),
    ('TI-Tarjeta de Identidad'),
    ('CE-Cedula de extranjeria')
GO

-- Crear tabla tiposPlanesMedicinaPre
CREATE TABLE tiposPlanesMedicinaPre (
    idTipoPlan INT IDENTITY(1,1) PRIMARY KEY,
    descripcionPlan NVARCHAR(50) NOT NULL
)
GO

-- Insertar datos en tiposPlanesMedicinaPre
INSERT INTO tiposPlanesMedicinaPre (DescripcionPlan)
VALUES 
    ('Gama Diamante'),
    ('Gama Zafiro'),
    ('Gama Rubi')
GO

--drop table clientes
-- Crear tabla clientes
CREATE TABLE clientes (
    idCliente INT IDENTITY(1,1) PRIMARY KEY,
    idTipoDocumento INT NOT NULL,
    numeroDocumento NVARCHAR(50) NOT NULL,
    fechaNacimiento DATETIME NOT NULL,
    primerNombre NVARCHAR(100) NOT NULL,
    segundoNombre NVARCHAR(100) NULL,
    primerApellido NVARCHAR(100) NOT NULL,
    segundoApellido NVARCHAR(100) NULL,
    direccionResidencia NVARCHAR(250) NOT NULL,
    numeroCelular NVARCHAR(80) NOT NULL,
    email NVARCHAR(80) NOT NULL,
    idTipoPlan INT NOT NULL,
    CONSTRAINT FK_clientes_tiposDocumentos FOREIGN KEY (idTipoDocumento) REFERENCES tiposDocumentos(idTipoDocumento),
    CONSTRAINT FK_clientes_tiposPlanesMedicinaPre FOREIGN KEY (idTipoPlan) REFERENCES tiposPlanesMedicinaPre(idTipoPlan)
	)