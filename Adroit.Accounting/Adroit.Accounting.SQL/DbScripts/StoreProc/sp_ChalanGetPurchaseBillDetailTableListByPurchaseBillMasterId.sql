CREATE OR ALTER PROCEDURE [dbo].[sp_ChalanGetPurchaseBillDetailTableListByPurchaseBillMasterId]
  @BranchId int,
  @PurchaseBillMasterId int
AS
BEGIN
	   SELECT  	    
		[Z-PurchaseBillDetail-Z].*		
		FROM [Z-PurchaseBillDetail-Z]		
		INNER JOIN [Z-PurchaseBillMaster-Z] ON [Z-PurchaseBillMaster-Z].Id = [Z-PurchaseBillDetail-Z].PurchaseBillMasterId AND [Z-PurchaseBillMaster-Z].Deleted = 0
		WHERE [Z-PurchaseBillMaster-Z].[BranchId] = @BranchId
			  AND [Z-PurchaseBillDetail-Z].Deleted = 0
			  AND [Z-PurchaseBillDetail-Z].PurchaseBillMasterId = @PurchaseBillMasterId
END
GO