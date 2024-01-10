CREATE OR ALTER Procedure [dbo].[sp_CustomerFirmBranchListByLoginId_Select]
  @LoginId int
As
Begin
	SELECT 
		CustomerFirmBranch.Id AS Value, 
		CustomerFirmBranch.Title  + (CASE ISNULL(City.Title, '') WHEN '' THEN '' ELSE ' | ' + City.Title END) AS Text,
		City.Id As Other
	From CustomerFirmBranch 
	INNER JOIN CustomerUserBranchMapping ON CustomerFirmBranch.Id = CustomerUserBranchMapping.BranchId
	LEFT JOIN City ON City.Id = CustomerFirmBranch.CityId
	WHERE CustomerUserBranchMapping.UserId = @LoginId
	AND CustomerFirmBranch.Active = 1 
	AND CustomerFirmBranch.Deleted = 0
	ORDER BY CustomerFirmBranch.Title,City.Title ASC
End
GO 