CREATE OR ALTER PROCEDURE [sp_CustomerFirmBranchListByBranchToBranchMapping_Select]
(
	@LoginId INT
)
AS
BEGIN
	DECLARE @BranchId int = dbo.fn_GetLoggedInBranchId(@LoginId);
	DECLARE @FirmId int = dbo.fn_GetLoggedInFirmId(@LoginId);
	DECLARE @CustomerId int = dbo.fn_GetCustomerIdByFirm(@FirmId);
	DECLARE @DATA TABLE(Id INT NOT NULL, Title NVARCHAR(200), CityId INT NULL)
	--Users map own branches
	INSERT INTO @DATA 
	SELECT 
		CustomerFirmBranch.Id AS Value, 
		CustomerFirmBranch.Title  + (CASE ISNULL(City.Title, '') WHEN '' THEN '' ELSE ' | ' + City.Title END) AS Text,
		City.Id As Other
	From CustomerFirmBranch 
	LEFT JOIN City ON City.Id = CustomerFirmBranch.CityId
	WHERE CustomerFirmBranch.FirmId = @FirmId
	AND CustomerFirmBranch.Active = 1 
	AND CustomerFirmBranch.Deleted = 0
	
	--Shared branches
	INSERT INTO @DATA
	SELECT 
		CustomerFirmBranch.Id AS Value, 
		CustomerFirmBranch.Title  + (CASE ISNULL(City.Title, '') WHEN '' THEN '' ELSE ' | ' + City.Title END) AS Text,
		City.Id As Other
	From CustomerFirmBranch 
	INNER JOIN CustomerChalanBranchMapping ON CustomerFirmBranch.Id = CustomerChalanBranchMapping.Branch
	LEFT JOIN City ON City.Id = CustomerFirmBranch.CityId
	WHERE CustomerChalanBranchMapping.SharedBranch = @BranchId
	AND CustomerFirmBranch.Active = 1 
	AND CustomerFirmBranch.Deleted = 0

	SELECT DISTINCT
		Branches.Id AS Value, 
		Branches.Title AS Text,
		Branches.CityId As Other
	From @DATA AS Branches 
	ORDER BY Branches.Title ASC
END
GO

