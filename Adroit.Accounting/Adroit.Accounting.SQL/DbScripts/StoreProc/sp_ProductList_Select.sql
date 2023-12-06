CREATE OR ALTER   PROCEDURE [dbo].[sp_ProductList_Select]
(
	@LoginId int, 
	@FirmId int
)
AS
BEGIN
    Declare @CustomerId int = dbo.fn_GetCustomerIdByFirmId(@FirmId);

	SELECT Product.Id As Value, 
		ISNULL(Product.[PrintName], '') + ' (' + [Product].Title + ' - ' + [Product].Code + ')' As Text 
	FROM Product
	WHERE CustomerId = @CustomerId AND Deleted = 0 AND Active = 1
	ORDER BY Product.PrintName
END
GO