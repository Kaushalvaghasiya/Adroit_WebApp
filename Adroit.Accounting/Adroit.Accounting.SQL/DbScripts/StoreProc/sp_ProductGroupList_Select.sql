CREATE OR ALTER PROCEDURE [dbo].[sp_ProductGroupList_Select] 
(	@FirmId INT )
AS
BEGIN
	DECLARE @CustomerId INT = dbo.fn_GetCustomerIdByFirm(@FirmId);

	SELECT [ProductGroup].Id As Value, Title As Text
	FROM [ProductGroup]
	WHERE CustomerId = @CustomerId AND Deleted = 0 AND Active = 1
	ORDER BY Title
END
GO