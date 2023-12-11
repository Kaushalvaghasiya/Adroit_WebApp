CREATE OR ALTER PROCEDURE [dbo].[sp_ProductColorList_Select] 
(	@FirmId INT )
AS
BEGIN
	DECLARE @CustomerId INT = dbo.fn_GetCustomerIdByFirm(@FirmId);
	
	SELECT Title As Text
	FROM [ProductColor]
	WHERE CustomerId = @CustomerId AND Deleted = 0 AND Active = 1
	UNION 
	SELECT Title As Text
	FROM [ColorAdmin]
	WHERE Deleted = 0 AND Active = 1
	ORDER BY Title
END
GO