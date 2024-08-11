
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Luis Saurith>
-- Create date: <09/08/2024>
-- Description:	<Consulta>
-- =============================================
CREATE PROCEDURE spConsultaClientes
	@idCliente INT NULL
AS
BEGIN

	SET NOCOUNT ON;
	IF (@idCliente = 0 ) SET @idCliente = NULL

	SELECT 
	 C.idCliente
	,C.idTipoDocumento
	,D.DescripcionDocumento
	,C.numeroDocumento
	,CONVERT(VARCHAR(10),C.fechaNacimiento, 105) fechaNacimiento
	,C.primerNombre
	,C.segundoNombre
	,C.primerApellido
	,C.segundoApellido
	,C.direccionResidencia
	,C.numeroCelular
	,C.email
	,C.idTipoPlan
	,P.DescripcionPlan
	FROM clientes	C WITH(NOLOCK)
	INNER JOIN tiposPlanesMedicinaPre P WITH(NOLOCK) ON C.idTipoPlan = P.idTipoPlan
	INNER JOIN tiposDocumentos D WITH(NOLOCK) ON D.idTipoDocumento = C.idTipoDocumento
	WHERE C.idCliente = ISNULL(@idCliente,idCliente)

END
GO

--drop PROCEDURE spConsultaClientes
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Luis Saurith>
-- Create date: <09/08/2024>
-- Description:	<insertar y actualizar>
-- =============================================
CREATE PROCEDURE spInsertaActualizaClientes
	 @idCliente			INT NULL
	,@idTipoDocumento	INT
	,@numeroDocumento	NVARCHAR(50) 
	,@fechaNacimiento	DATETIME
	,@primerNombre		NVARCHAR(100) 
	,@segundoNombre		NVARCHAR(100)  NULL
	,@primerApellido	NVARCHAR(100) 
	,@segundoApellido	NVARCHAR(100)  NULL
	,@direccionResidencia NVARCHAR(250) 
	,@numeroCelular		NVARCHAR(80)
	,@email				NVARCHAR(80)
	,@idTipoPlan		INT
AS
BEGIN

	SET NOCOUNT ON;

	IF(@idCliente = 0)
	BEGIN
		IF NOT EXISTS(SELECT TOP 1 1 FROM  clientes WITH (NOLOCK) WHERE idTipoDocumento = @idTipoDocumento AND numeroDocumento = @numeroDocumento )
		BEGIN
			INSERT INTO clientes (idTipoDocumento,numeroDocumento,fechaNacimiento,primerNombre,segundoNombre,primerApellido,segundoApellido,direccionResidencia,numeroCelular,email,idTipoPlan)
			VALUES(@idTipoDocumento,@numeroDocumento,@fechaNacimiento,@primerNombre,@segundoNombre,@primerApellido,@segundoApellido,@direccionResidencia,@numeroCelular,@email,@idTipoPlan)

			SELECT 'Inserto correctamente' as mensaje	
		END
		ELSE
		BEGIN
			SELECT 'Cliente que ya se encuentre registrado' as mensaje	
		END
	END
	ELSE IF(@idCliente > 0)
	BEGIN
		UPDATE C
		SET  
			 C.idTipoDocumento	= @idTipoDocumento
			,C.numeroDocumento	= @numeroDocumento
			,C.fechaNacimiento	= @fechaNacimiento
			,C.primerNombre		= @primerNombre
			,C.segundoNombre	= @segundoNombre
			,C.primerApellido	= @primerApellido
			,C.segundoApellido  = @segundoApellido
			,C.direccionResidencia = @direccionResidencia
			,C.numeroCelular	= @numeroCelular
			,C.email			= @email
			,C.idTipoPlan		= @idTipoPlan
		FROM clientes	C WITH(UPDLOCK)
		WHERE idCliente = @idCliente

		SELECT 'Actualizo correctamente' as mensaje
	END
END
GO



SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Luis Saurith>
-- Create date: <09/08/2024>
-- Description:	<elimina>
-- =============================================
CREATE PROCEDURE spEliminaClientes
	 @idCliente			INT 
AS
BEGIN

	SET NOCOUNT ON;

	DELETE FROM clientes WHERE idCliente = @idCliente

	SELECT 'Elimino correctamente' mensaje
END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Luis Saurith>
-- Create date: <09/08/2024>
-- Description:	<combos>
-- =============================================
CREATE PROCEDURE spListaCombos
	 @opc			INT 
AS
BEGIN

	IF(@opc = 1)
	BEGIN
		SELECT idTipoDocumento AS 'id',DescripcionDocumento AS 'descripcion'
		FROM tiposDocumentos WITH(NOLOCK)
	END
	ELSE IF (@opc = 2)
	BEGIN
		SELECT idTipoPlan AS 'id',DescripcionPlan AS 'descripcion'
		FROM tiposPlanesMedicinaPre WITH(NOLOCK)
	END
	
END
GO



