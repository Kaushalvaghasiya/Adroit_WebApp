CREATE OR ALTER Procedure [dbo].[sp_CustomerFirmBranchListByCustomerId_Select]
  @FirmId int
As
Begin
	Declare @CustomerId int = dbo.fn_GetCustomerIdByFirm(@FirmId);
	SELECT 
		CustomerFirmBranch.Id AS Value, 
		CustomerFirmBranch.Title  + (CASE ISNULL(City.Title, '') WHEN '' THEN '' ELSE ' | ' + City.Title + ' ( ' + CustomerFirm.Title + ' )' END) AS Text
	From CustomerFirmBranch 
		 inner join CustomerFirm on CustomerFirmBranch.FirmId = CustomerFirm.Id AND CustomerFirm.Deleted = 0
		 LEFT JOIN City ON City.Id = CustomerFirmBranch.CityId AND City.Active = 1
	WHERE CustomerFirm.CustomerId = @CustomerId AND CustomerFirmBranch.Deleted = 0
	ORDER BY CustomerFirmBranch.Title, City.Title, CustomerFirm.Title ASC

End
GO