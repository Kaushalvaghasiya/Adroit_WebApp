CREATE OR ALTER PROCEDURE [dbo].[sp_ProductPackingList_Select] 
(	@FirmId INT )
AS
BEGIN
	DECLARE @CustomerId INT = dbo.fn_GetCustomerIdByFirm(@FirmId);

	SELECT Id As Value, Title As Text
	FROM [ProductPacking]
	WHERE CustomerId = @CustomerId AND Deleted = 0 AND Active = 1
	ORDER BY Title
END
GO