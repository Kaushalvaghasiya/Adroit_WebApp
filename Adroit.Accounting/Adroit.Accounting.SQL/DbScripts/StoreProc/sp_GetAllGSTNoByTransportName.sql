CREATE OR ALTER PROCEDURE [dbo].[sp_GetAllGSTNoByTransportName]
(
	@SearchName VARCHAR(50)
)
AS
BEGIN
	SELECT DISTINCT GSTNumberTransport
	FROM CustomerAccount	
	WHERE UPPER(TransportName) = UPPER(@SearchName)
END
GO