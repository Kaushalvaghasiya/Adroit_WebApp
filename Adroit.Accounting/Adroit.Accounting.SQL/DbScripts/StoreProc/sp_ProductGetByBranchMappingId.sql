CREATE OR ALTER PROCEDURE [dbo].[sp_ProductGetByBranchMappingId]
(
	@LoginId INT
	,@FirmId INT
	,@BranchId INT
	,@Id INT
)
AS
BEGIN

    Declare @CustomerId int = dbo.fn_GetCustomerIdByFirm(@FirmId);
	
	SELECT 
		Product.*,
		ProductColor.Title As colorName,
		ProductSize.Title As sizeName,
		[GSTRate].Rate As GSTRate
	FROM Product
	INNER JOIN ProductBranchMapping on Product.Id = ProductBranchMapping.ProductId AND ProductBranchMapping.BranchId = @BranchId
	INNER JOIN [GSTRate] on [GSTRate].Id = [Product].GSTRateId AND [GSTRate].Deleted = 0 AND [GSTRate].Active = 1
	LEFT JOIN ProductColor on ProductColor.Id = Product.ColourId AND ProductColor.Deleted = 0 AND ProductColor.Active = 1 AND ProductColor.CustomerId = @CustomerId
	LEFT JOIN ProductSize on ProductSize.Id = Product.SizeId AND ProductSize.Deleted = 0 AND ProductSize.Active = 1 AND ProductSize.CustomerId = @CustomerId
	WHERE Product.CustomerId = @CustomerId AND ProductBranchMapping.Id = @Id


END
GO
