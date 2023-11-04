CREATE OR ALTER Procedure [dbo].[sp_LRBookingRangeBranch_Select]
  @UserId int
As
Begin
	Declare @CustomerId int = dbo.fn_GetCustomerId(@UserId);

	Select 
		CustomerFirmBranch.Id AS Value, CustomerFirm.Title AS Text
	From Customer
	Inner Join CustomerUser On Customer.Id = CustomerUser.CustomerId
	Inner Join CustomerFirm On CustomerFirm.CustomerId = Customer.Id
	Inner Join CustomerFirmBranch On CustomerFirmBranch.FirmId = CustomerFirm.Id
	Where Customer.Id = @CustomerId
End
GO