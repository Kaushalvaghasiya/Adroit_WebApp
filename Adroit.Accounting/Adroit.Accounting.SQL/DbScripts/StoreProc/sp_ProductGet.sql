CREATE OR ALTER PROCEDURE [dbo].[sp_ProductGet]
(
	@LoginId INT
	,@FirmId INT
	,@Id INT
)
AS
BEGIN

    Declare @CustomerId int = dbo.fn_GetCustomerIdByFirm(@FirmId);
	
	SELECT 
		Product.*,
		ProductColor.Title As colorName,
		ProductSize.Title As sizeName,
		(SELECT STUFF((SELECT ',' + CAST(t1.BranchId AS VARCHAR) FROM ProductBranchMapping t1
						WHERE t1.ProductId = t.ProductId AND Deleted = 0 FOR XML PATH('')),1,1,'') Concats
			FROM ProductBranchMapping t
			WHERE t.ProductId = @Id AND Deleted = 0 GROUP BY t.ProductId) AS ProductBranchId
	FROM Product
	LEFT JOIN ProductColor on ProductColor.Id = Product.ColourId AND ProductColor.Deleted = 0 AND ProductColor.Active = 1 AND ProductColor.CustomerId = @CustomerId
	LEFT JOIN ProductSize on ProductSize.Id = Product.SizeId AND ProductSize.Deleted = 0 AND ProductSize.Active = 1 AND ProductSize.CustomerId = @CustomerId
	WHERE Product.CustomerId = @CustomerId AND Product.Id = @Id


END
GO
