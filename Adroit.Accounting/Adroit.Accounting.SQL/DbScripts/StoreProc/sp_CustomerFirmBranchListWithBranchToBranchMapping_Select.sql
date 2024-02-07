CREATE OR ALTER Procedure [dbo].[sp_CustomerFirmBranchListByLoginId_Select]
  @LoginId int
As
Begin
	DECLARE @LoggedInBranch INT 
	DECLARE @DATA TABLE(ID INT NOT NULL, Title NVARCHAR(100), CityId INT NOT NULL)

	SELECT @LoggedInBranch = dbo.fn_GetLoggedInBranchId(@LoginId)

	--Users map own branches
	INSERT INTO @DATA 
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
	
	--Shared branches
	INSERT INTO @DATA
	SELECT 
		CustomerFirmBranch.Id AS Value, 
		CustomerFirmBranch.Title  + (CASE ISNULL(City.Title, '') WHEN '' THEN '' ELSE ' | ' + City.Title END) AS Text,
		City.Id As Other
	From CustomerFirmBranch 
	INNER JOIN CustomerChalanBranchMapping ON CustomerFirmBranch.Id = CustomerChalanBranchMapping.SharedBranch
	LEFT JOIN City ON City.Id = CustomerFirmBranch.CityId
	WHERE CustomerChalanBranchMapping.Branch = @LoggedInBranch
	AND CustomerFirmBranch.Active = 1 
	AND CustomerFirmBranch.Deleted = 0

	SELECT 
		Id AS Value, 
		Title Text,
		CityId As Other
	FROM @DATA ORDER BY Title ASC
End
GO 