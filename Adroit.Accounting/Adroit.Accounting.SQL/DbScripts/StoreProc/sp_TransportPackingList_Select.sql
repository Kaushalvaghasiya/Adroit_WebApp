CREATE OR ALTER PROCEDURE [dbo].[sp_TransportPackingList_Select] 
(
	@loginId INT
)
AS
BEGIN

	DECLARE @CustomerId INT = dbo.fn_GetCustomerId(@loginId);

	SELECT Id As Value,Title As Text
	FROM [TransportPacking]
	WHERE Deleted = 0 AND Active = 1
	AND [TransportPacking].CustomerId = @CustomerId
	ORDER BY Title
END


