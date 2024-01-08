CREATE OR ALTER   PROCEDURE [dbo].[sp_GetProductListWithGroupId]
(
	@loginId int, 
	@firmId int,
	@GroupId int
)
AS
BEGIN
	SELECT Product.Id As Value, 
		ISNULL(Product.[PrintName], '') + ' (' + [Product].Title + ' - ' + [Product].Code + ')' As Text 
	FROM Product
	WHERE Product.Deleted = 0 AND Product.Active = 1 
	AND Product.GroupId = @GroupId
	ORDER BY Product.PrintName
END
GO