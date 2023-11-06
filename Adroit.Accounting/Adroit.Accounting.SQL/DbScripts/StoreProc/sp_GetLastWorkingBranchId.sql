CREATE OR ALTER PROCEDURE [dbo].[sp_GetLastWorkingBranchId]
(
	@LoginId INT
)
AS
BEGIN
	Select 
		Top 1 CustomerFirmBranch.Id
	From Customer
	Inner Join CustomerUser On Customer.Id = CustomerUser.CustomerId
	Inner Join CustomerFirm On CustomerFirm.CustomerId = Customer.Id
	Inner Join CustomerFirmBranch On CustomerFirmBranch.FirmId = CustomerFirm.Id
	Where CustomerUser.id = @LoginId
		And CustomerFirmBranch.Active = 1 
		And CustomerFirmBranch.Deleted = 0
	Order By CustomerFirmBranch.Id
END
GO