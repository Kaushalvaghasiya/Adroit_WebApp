CREATE OR ALTER PROCEDURE [dbo].[sp_TransportDescList_Select] 
(
	@FirmId INT
)
AS
BEGIN

	DECLARE @CustomerId INT = dbo.fn_GetCustomerIdByFirm(@FirmId);

	SELECT Title As [Text]
	FROM [TransportDesc]
	WHERE CustomerId = @CustomerId AND Deleted = 0 AND Active = 1
	ORDER BY Title

END


