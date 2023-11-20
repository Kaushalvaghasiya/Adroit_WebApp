CREATE OR ALTER PROCEDURE [dbo].[sp_GetFirmId]
(
	@LoginId INT
)
AS
BEGIN

	DECLARE @CustomerId int = dbo.fn_GetCustomerId(@loginId);

	SELECT TOP 1 Id 
	FROM CustomerFirm 
	WHERE CustomerId = @CustomerId

END
GO
