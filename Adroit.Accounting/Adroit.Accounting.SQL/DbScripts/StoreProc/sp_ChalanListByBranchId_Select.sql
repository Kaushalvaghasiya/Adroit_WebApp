CREATE OR ALTER   PROCEDURE [dbo].[sp_ChalanListByBranchId_Select]
(
	@BranchId int
)
AS
BEGIN
	Select 
		PBMaster.BillNumberBranch As Text,
		PBMaster.Id As Value
	From [Z-PurchaseBillMaster-Z]  PBMaster 
	Where PBMaster.BranchId = @BranchId 
	And PBMaster.Deleted = 0
	ORDER BY PBMaster.BillNumberBranch
END
GO