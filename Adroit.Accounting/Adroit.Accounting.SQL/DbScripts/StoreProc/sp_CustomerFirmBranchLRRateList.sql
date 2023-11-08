CREATE OR ALTER Procedure [dbo].[sp_CustomerFirmBranchLRRateList]
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
				CASE WHEN @SortColumn = 0 AND @SortOrder ='ASC' THEN [CustomerFirmBranch].[Title] END ASC,
				CASE WHEN @SortColumn = 0 AND @SortOrder ='DESC' THEN [CustomerFirmBranch].[Title] END DESC,
				CASE WHEN @SortColumn = 1 AND @SortOrder ='ASC' THEN [City].[Title] END ASC,
				CASE WHEN @SortColumn = 1 AND @SortOrder ='DESC' THEN [City].[Title] END DESC,
				CASE WHEN @SortColumn = 2 AND @SortOrder ='ASC' THEN CustomerFirmBranchLRRate.AddedOn END ASC,
				CASE WHEN @SortColumn = 2 AND @SortOrder ='DESC' THEN CustomerFirmBranchLRRate.AddedOn END DESC
			) AS RowNum,
			Count(*) over () AS TotalCount, 
			CustomerFirmBranchLRRate.*,
			[CustomerFirmBranch].Title as Branch, 
			[City].Title as City
		FROM CustomerFirmBranchLRRate
		LEFT JOIN CustomerFirmBranch ON CustomerFirmBranch.Id=CustomerFirmBranchLRRate.BranchId
		LEFT JOIN City ON CustomerFirmBranchLRRate.CityId = City.Id
		WHERE 
			(Coalesce(@Search,'') = '' 
			OR CustomerFirmBranch.[Title] like '%'+ @Search + '%'
			OR City.[Title] like '%'+ @Search + '%'
			OR CAST(CustomerFirmBranchLRRate.AddedOn AS VARCHAR) like '%'+ @Search + '%'
			)
	 ) AS T   
	 WHERE (((@PageSize = -1) And 1=1) OR (T.RowNum > @PageStart AND T.RowNum < (@PageStart + (@PageSize+1))))
End
GO