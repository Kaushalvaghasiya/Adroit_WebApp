CREATE OR ALTER Procedure [dbo].[sp_CustomerFirmBranchListByFirmId_Select]
  @FirmId int
As
Begin

	SELECT 
		CustomerFirmBranch.Id AS Value, 
		CustomerFirmBranch.Title  + (CASE ISNULL(City.Title, '') WHEN '' THEN '' ELSE ' | ' + City.Title END) AS Text
	From CustomerFirmBranch 
		 LEFT JOIN City ON City.Id = CustomerFirmBranch.CityId AND City.Active = 1
	WHERE CustomerFirmBranch.FirmId = 6 AND CustomerFirmBranch .Active = 1 AND CustomerFirmBranch.Deleted = 0
	ORDER BY CustomerFirmBranch.Title,  City.Title ASC

End
GO