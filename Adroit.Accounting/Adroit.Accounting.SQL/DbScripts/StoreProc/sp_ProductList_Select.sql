CREATE OR ALTER   PROCEDURE [dbo].[sp_ProductList_Select]
(
	@loginId int, 
	@firmId int
)
AS
BEGIN
	SELECT Product.Id As Value, 
		ISNULL(Product.[PrintName], '') + ' (' + [Product].Title + ' - ' + [Product].Code + ')' As Text 
	FROM Product
	WHERE Product.Deleted = 0 AND Product.Active = 1 
	ORDER BY Product.PrintName
END
GO