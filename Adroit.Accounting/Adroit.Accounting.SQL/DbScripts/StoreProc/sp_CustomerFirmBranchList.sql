CREATE OR ALTER Procedure [dbo].[sp_CustomerFirmBranchList]
  @LoginId int,
  @FirmId int,  
  @Search VARCHAR(100) = '',
  @PageStart INT = 0,
  @PageSize INT = 10,
  @SortColumn INT = 0,
  @SortOrder NVARCHAR(10) = 'ASC'
As
Set Nocount on;
Begin
	Declare @CustomerId int = dbo.fn_GetCustomerIdByFirm(@FirmId);
	
	SELECT * FROM
	(   
		SELECT  
			ROW_NUMBER() over (ORDER BY
				CASE WHEN @SortColumn = 0 AND @SortOrder ='ASC' THEN CustomerFirmBranch.OrderNumber END ASC,
				CASE WHEN @SortColumn = 0 AND @SortOrder ='DESC' THEN CustomerFirmBranch.OrderNumber END DESC,
				CASE WHEN @SortColumn = 1 AND @SortOrder ='ASC' THEN CustomerFirm.[Title] END ASC,
				CASE WHEN @SortColumn = 1 AND @SortOrder ='DESC' THEN CustomerFirm.[Title] END DESC,
				CASE WHEN @SortColumn = 2 AND @SortOrder ='ASC' THEN CustomerFirmBranch.[Title] END ASC,
				CASE WHEN @SortColumn = 2 AND @SortOrder ='DESC' THEN CustomerFirmBranch.[Title] END DESC,
				CASE WHEN @SortColumn = 3 AND @SortOrder ='ASC' THEN CustomerFirmBranch.ShortTitle END ASC,
				CASE WHEN @SortColumn = 3 AND @SortOrder ='DESC' THEN CustomerFirmBranch.ShortTitle END DESC,
				CASE WHEN @SortColumn = 4 AND @SortOrder ='ASC' THEN [FirmBranchTypeAdmin].[Title] END ASC,
				CASE WHEN @SortColumn = 4 AND @SortOrder ='DESC' THEN [FirmBranchTypeAdmin].[Title] END DESC,
				CASE WHEN @SortColumn = 5 AND @SortOrder ='ASC' THEN [City].[Title] END ASC,
				CASE WHEN @SortColumn = 5 AND @SortOrder ='DESC' THEN [City].[Title] END DESC,
				CASE WHEN @SortColumn = 6 AND @SortOrder ='ASC' THEN CustomerFirmBranch.AddedOn END ASC,
				CASE WHEN @SortColumn = 6 AND @SortOrder ='DESC' THEN CustomerFirmBranch.AddedOn END DESC,
				CASE WHEN @SortColumn = 7 AND @SortOrder ='ASC' THEN CustomerFirmBranch.RenewalDate END ASC,
				CASE WHEN @SortColumn = 7 AND @SortOrder ='DESC' THEN CustomerFirmBranch.RenewalDate END DESC,
				CASE WHEN @SortColumn = 8 AND @SortOrder ='ASC' THEN SoftwarePlan.Code + ' - ' + Software.Title END ASC,
				CASE WHEN @SortColumn = 8 AND @SortOrder ='DESC' THEN SoftwarePlan.Code + ' - ' + Software.Title END DESC
			) AS RowNum,
			Count(*) over () AS TotalCount, 
			CustomerFirmBranch.*,
			[CustomerFirm].Title as CustomerFirm,
			[FirmBranchTypeAdmin].Title as FirmBranchTypeAdmin, 
			[City].Title as City,
			SoftwarePlan.Code + ' - ' + SoftwarePlan.Title AS SoftwarePlan
		FROM CustomerFirm 
		INNER JOIN CustomerFirmBranch ON CustomerFirm.Id=CustomerFirmBranch.FirmId
		INNER JOIN FirmBranchTypeAdmin ON CustomerFirmBranch.FirmBranchTypeId=FirmBranchTypeAdmin.Id
		INNER JOIN SoftwarePlan ON CustomerFirmBranch.SoftwarePlanId = SoftwarePlan.Id
		INNER JOIN Software ON SoftwarePlan.SoftwareId = Software.Id
		LEFT JOIN City ON CustomerFirmBranch.CityId = City.Id
		WHERE [CustomerFirm].[CustomerId] = @CustomerId AND (@FirmId = 0 OR [CustomerFirm].Id = @FirmId)
		AND CustomerFirmBranch.Deleted = 0
		AND (Coalesce(@Search,'') = '' 
			OR CustomerFirm.[Title] like '%'+ @Search + '%'
			OR CustomerFirmBranch.[Title] like '%'+ @Search + '%'
			OR FirmBranchTypeAdmin.[Title] like '%'+ @Search + '%'
			OR CustomerFirmBranch.GSTNumber like '%'+ @Search + '%'
			OR CustomerFirmBranch.Pincode like '%'+ @Search + '%'
			OR City.[Title] like '%'+ @Search + '%'
			OR CAST(CustomerFirmBranch.RenewalDate AS VARCHAR) like '%'+ @Search + '%'
			OR CAST(CustomerFirmBranch.AddedOn AS VARCHAR) like '%'+ @Search + '%'
			OR SoftwarePlan.Title + Software.Title like '%'+ @Search + '%')
	 ) AS T   
	 WHERE (((@PageSize = -1) And 1=1) OR (T.RowNum > @PageStart AND T.RowNum < (@PageStart + (@PageSize+1))))
End
GO