CREATE OR ALTER Procedure [dbo].[sp_TransportLRBranchCityMappingList]
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
		 CASE WHEN @SortColumn = 0 AND @SortOrder ='ASC' THEN [City].[Title] END ASC,  
		 CASE WHEN @SortColumn = 0 AND @SortOrder ='DESC' THEN [City].[Title] END DESC,
		 CASE WHEN @SortColumn = 1 AND @SortOrder ='ASC' THEN [CustomerFirmBranch].[Title] END ASC,  
		 CASE WHEN @SortColumn = 1 AND @SortOrder ='DESC' THEN [CustomerFirmBranch].[Title] END DESC,
		 CASE WHEN @SortColumn = 2 AND @SortOrder ='ASC' THEN TransportLRBranchCityMapping.[OrderNumber] END ASC,  
		 CASE WHEN @SortColumn = 2 AND @SortOrder ='DESC' THEN TransportLRBranchCityMapping.[OrderNumber] END DESC,
		 CASE WHEN @SortColumn = 3 AND @SortOrder ='ASC' THEN TransportLRBranchCityMapping.[Active] END ASC,  
		 CASE WHEN @SortColumn = 3 AND @SortOrder ='DESC' THEN TransportLRBranchCityMapping.[Active] END DESC
		) AS RowNum,
	  Count(*) over () AS TotalCount
	  , TransportLRBranchCityMapping.*
	  , [City].[Title] AS CityName
	  , [CustomerFirmBranch].[Title] AS BranchName
	  FROM TransportLRBranchCityMapping
	  INNER JOIN [City] on TransportLRBranchCityMapping.CityId = [City].Id
	  INNER JOIN [CustomerFirmBranch] on TransportLRBranchCityMapping.BranchId = [CustomerFirmBranch].Id
	  WHERE [TransportLRBranchCityMapping].Deleted = 0
	  AND (Coalesce(@Search,'') = '' OR [City].[Title] like '%'+ @Search + '%')
	 ) AS T   
	 WHERE (((@PageSize = -1) And 1=1) OR (T.RowNum > @PageStart AND T.RowNum < (@PageStart + (@PageSize+1))))
End
Set Nocount off;


