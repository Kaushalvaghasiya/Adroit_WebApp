CREATE OR ALTER PROCEDURE [dbo].[sp_ProductSizeList_Select] 
(
	@FirmId INT
)
AS
BEGIN

	DECLARE @CustomerId INT = dbo.fn_GetCustomerIdByFirm(@FirmId);

	SELECT Title As Text
	FROM [ProductSize]
	WHERE CustomerId = @CustomerId AND Deleted = 0 AND [ProductSize].Active = 1
	UNION
	SELECT Title As Text
	FROM [ProductSizeAdmin]
	WHERE Deleted = 0 AND Active = 1
	ORDER BY Title
END
GO