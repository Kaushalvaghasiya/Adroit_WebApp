CREATE OR ALTER Procedure [dbo].[sp_AdminSoftwarePlanList]
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
		 CASE WHEN @SortColumn = 1 AND @SortOrder ='ASC' THEN SoftwarePlan.[Title] END ASC,  
		 CASE WHEN @SortColumn = 1 AND @SortOrder ='DESC' THEN SoftwarePlan.[Title] END DESC,
		  CASE WHEN @SortColumn = 1 AND @SortOrder ='ASC' THEN SoftwarePlan.[business] END ASC,  
		 CASE WHEN @SortColumn = 1 AND @SortOrder ='DESC' THEN SoftwarePlan.[business] END DESC,
		  CASE WHEN @SortColumn = 1 AND @SortOrder ='ASC' THEN SoftwarePlan.[Code] END ASC,  
		 CASE WHEN @SortColumn = 1 AND @SortOrder ='DESC' THEN SoftwarePlan.[Code] END DESC
		) AS RowNum,
	   Count(*) over () AS TotalCount, SoftwarePlan.*,Software.Title As SoftwareName 
	  FROM SoftwarePlan
	  LEFT JOIN Software on SoftwarePlan.SoftwareId=Software.Id
	  WHERE SoftwarePlan.IsDeleted = 0
	  AND (Coalesce(@Search,'') = '' OR SoftwarePlan.[Title] like '%'+ @Search + '%'  OR SoftwarePlan.[business] like '%'+ @Search + '%')
	 ) AS T   
	 WHERE (((@PageSize = -1) And 1=1) OR (T.RowNum > @PageStart AND T.RowNum < (@PageStart + (@PageSize+1))))
End
Set Nocount off;
GO