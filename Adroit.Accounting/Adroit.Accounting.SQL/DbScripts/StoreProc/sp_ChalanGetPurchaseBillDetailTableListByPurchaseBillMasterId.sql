CREATE OR ALTER PROCEDURE [dbo].[sp_ChalanGetPurchaseBillDetailTableListByPurchaseBillMasterId]
  @LoginId int,
  @BranchId int,
  @PurchaseBillMasterId int
AS
BEGIN
	   Declare @CustomerId int = dbo.[fn_GetCustomerId](@LoginId);

	   SELECT  	    
		[Z-PurchaseBillDetail-Z].*
		,[Product].Title as ProductTitle
		FROM [Z-PurchaseBillDetail-Z]		
		INNER JOIN [Z-PurchaseBillMaster-Z] ON [Z-PurchaseBillMaster-Z].Id = [Z-PurchaseBillDetail-Z].PurchaseBillMasterId AND [Z-PurchaseBillMaster-Z].Deleted = 0
		INNER JOIN [ProductBranchMapping] ON [ProductBranchMapping].Id = [Z-PurchaseBillDetail-Z].ProductBranchMappingId AND [ProductBranchMapping].BranchId = @BranchId AND [ProductBranchMapping].Deleted = 0
		INNER JOIN [Product] ON [Product].Id = [ProductBranchMapping].ProductId AND [Product].CustomerId = @CustomerId AND [Product].Deleted = 0 AND [Product].Active = 1
		WHERE [Z-PurchaseBillMaster-Z].[BranchId] = @BranchId
			  AND [Z-PurchaseBillDetail-Z].Deleted = 0
			  AND [Z-PurchaseBillDetail-Z].PurchaseBillMasterId = @PurchaseBillMasterId
END
GO