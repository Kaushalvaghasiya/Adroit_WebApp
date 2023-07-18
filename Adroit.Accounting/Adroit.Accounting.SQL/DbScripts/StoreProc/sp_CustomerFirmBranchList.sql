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
	SELECT * FROM
	(   
		SELECT  
			ROW_NUMBER() over (ORDER BY
				CASE WHEN @SortColumn = 0 AND @SortOrder ='ASC' THEN CustomerFirmBranch.[Title] END ASC,
				CASE WHEN @SortColumn = 0 AND @SortOrder ='DESC' THEN CustomerFirmBranch.[Title] END DESC,
				CASE WHEN @SortColumn = 1 AND @SortOrder ='ASC' THEN [FirmBranchTypeAdmin].[Title] END ASC,
				CASE WHEN @SortColumn = 1 AND @SortOrder ='DESC' THEN [FirmBranchTypeAdmin].[Title] END DESC,
				CASE WHEN @SortColumn = 2 AND @SortOrder ='ASC' THEN CustomerFirmBranch.Pincode END ASC,
				CASE WHEN @SortColumn = 2 AND @SortOrder ='DESC' THEN CustomerFirmBranch.Pincode END DESC,
				CASE WHEN @SortColumn = 3 AND @SortOrder ='ASC' THEN CustomerFirmBranch.GSTNumber END ASC,
				CASE WHEN @SortColumn = 3 AND @SortOrder ='DESC' THEN CustomerFirmBranch.GSTNumber END DESC,
				CASE WHEN @SortColumn = 4 AND @SortOrder ='ASC' THEN [City].[Title] END ASC,
				CASE WHEN @SortColumn = 4 AND @SortOrder ='DESC' THEN [City].[Title] END DESC,
				CASE WHEN @SortColumn = 5 AND @SortOrder ='ASC' THEN CustomerFirmBranch.AddedOn END ASC,
				CASE WHEN @SortColumn = 5 AND @SortOrder ='DESC' THEN CustomerFirmBranch.AddedOn END DESC,
				CASE WHEN @SortColumn = 6 AND @SortOrder ='ASC' THEN CustomerFirmBranch.RenewalDate END ASC,
				CASE WHEN @SortColumn = 6 AND @SortOrder ='DESC' THEN CustomerFirmBranch.RenewalDate END DESC,
				CASE WHEN @SortColumn = 7 AND @SortOrder ='ASC' THEN SoftwarePlan.Title + ' - ' + Software.Title END ASC,
				CASE WHEN @SortColumn = 7 AND @SortOrder ='DESC' THEN SoftwarePlan.Title + ' - ' + Software.Title END DESC
			) AS RowNum,
			Count(*) over () AS TotalCount, 
			CustomerFirmBranch.*,
			[CustomerFirm].Title as CustomerFirm,
			[FirmBranchTypeAdmin].Title as FirmBranchTypeAdmin, 
			[City].Title as City,
			Software.Title  + ' - ' + SoftwarePlan.Title AS SoftwarePlan
		FROM CustomerFirmBranch
		LEFT JOIN CustomerFirm ON CustomerFirm.Id=CustomerFirmBranch.FirmId
		LEFT JOIN FirmBranchTypeAdmin ON CustomerFirmBranch.FirmBranchTypeId=FirmBranchTypeAdmin.Id
		LEFT JOIN SoftwarePlan ON CustomerFirmBranch.SoftwarePlanId = SoftwarePlan.Id
		LEFT JOIN Software ON SoftwarePlan.SoftwareId = Software.Id
		LEFT JOIN City ON CustomerFirmBranch.CityId = City.Id
		WHERE [CustomerFirmBranch].FirmId = @FirmId
		AND CustomerFirmBranch.IsDeleted = 0 
		AND (Coalesce(@Search,'') = '' 
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