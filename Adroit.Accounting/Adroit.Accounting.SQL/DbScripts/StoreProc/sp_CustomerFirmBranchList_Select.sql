CREATE OR ALTER Procedure [dbo].[sp_CustomerFirmBranchList_Select]
  @FirmId int
As
Begin

	SELECT
		CustomerFirmBranch.Id AS Value, 
		CustomerFirmBranch.Title AS Text,
		CustomerFirm.Title as Other
	From CustomerFirmBranch 
		 Left Join CustomerFirm ON CustomerFirm.Id = CustomerFirmBranch.FirmId
	WHERE CustomerFirmBranch.FirmId = @FirmId AND CustomerFirmBranch.Active = 1 AND CustomerFirmBranch.Deleted = 0
	ORDER BY CustomerFirm.Title, CustomerFirmBranch.Title ASC
End
GO