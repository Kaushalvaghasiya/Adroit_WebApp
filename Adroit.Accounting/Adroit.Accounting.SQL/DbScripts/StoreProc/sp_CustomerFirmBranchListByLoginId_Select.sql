CREATE OR ALTER Procedure [dbo].[sp_CustomerFirmBranchListByLoginId_Select]
  @FirmId int
As
Begin
	Declare @CustomerId int = dbo.fn_GetCustomerIdByFirm(@FirmId);

	Select 
		CustomerFirmBranch.Id AS Value, CustomerFirmBranch.Title AS Text
	From Customer
	Inner Join CustomerUser On Customer.Id = CustomerUser.CustomerId
	Inner Join CustomerFirm On CustomerFirm.CustomerId = Customer.Id
	Inner Join CustomerFirmBranch On CustomerFirmBranch.FirmId = CustomerFirm.Id
	Where Customer.Id = @CustomerId
	Order By CustomerFirmBranch.Title Asc
End
GO