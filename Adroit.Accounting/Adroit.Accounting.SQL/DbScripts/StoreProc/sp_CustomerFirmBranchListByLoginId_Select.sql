CREATE OR ALTER Procedure [dbo].[sp_CustomerFirmBranchListByLoginId_Select]
  @LoginId int
As
Begin
	Declare @CustomerId int = dbo.fn_GetCustomerId(@LoginId);

	Select 
		CustomerFirmBranch.Id AS Value, CustomerFirmBranch.Title AS Text
	From Customer
	Inner Join CustomerFirm On Customer.Id = CustomerFirm.CustomerId
	Inner Join CustomerFirmBranch On CustomerFirm.Id = CustomerFirmBranch.FirmId
	Where Customer.Id = @CustomerId
	AND CustomerFirm.Deleted = 0
	AND CustomerFirmBranch.Deleted = 0 AND CustomerFirmBranch.Active = 1
	Order By CustomerFirmBranch.Title Asc
End
GO