CREATE OR ALTER PROCEDURE [dbo].[sp_GetGSTRateByProductId]
(
	@ProductId INT,
	@FirmId INT,
	@BranchId INT
)
AS
BEGIN

	DECLARE @CustomerId INT = dbo.fn_GetCustomerIdByFirm(@FirmId);

	SELECT [GSTRate].Rate As GSTRate
	FROM CustomerFirmBranch 
	INNER JOIN ProductBranchMapping on ProductBranchMapping.BranchId = @BranchId
	INNER JOIN Product on Product.Id = ProductBranchMapping.ProductId AND Product.CustomerId = @CustomerId
	INNER JOIN [GSTRate] on [GSTRate].Id = [Product].GSTRateId AND [GSTRate].Deleted = 0 AND [GSTRate].Active = 1
	WHERE Product.Id = @ProductId
	AND CustomerFirmBranch.Id = @BranchId
	AND CustomerFirmBranch.FirmId = @FirmId

END
GO


