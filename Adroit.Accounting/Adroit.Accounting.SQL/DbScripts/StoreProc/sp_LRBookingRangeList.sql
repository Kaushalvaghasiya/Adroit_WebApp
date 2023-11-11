CREATE OR ALTER Procedure [dbo].[sp_LRBookingRangeList]
  @LoginId int,
  @FirmId int,  
  @Search VARCHAR(100) = '',
  @PageStart INT = 0,
  @PageSize INT = 10,
  @SortColumn INT = 0,
  @SortOrder NVARCHAR(10) = 'ASC'
As
Begin

	SELECT * FROM
	(   
	  SELECT  
	   ROW_NUMBER() over (ORDER BY
		 CASE WHEN @SortColumn = 0 AND @SortOrder ='ASC' THEN CustomerFirmBranch.Title END ASC,
		 CASE WHEN @SortColumn = 0 AND @SortOrder ='DESC' THEN CustomerFirmBranch.Title END DESC,
		 CASE WHEN @SortColumn = 1 AND @SortOrder ='ASC' THEN LRBookingRange.StartNumber END ASC,
		 CASE WHEN @SortColumn = 1 AND @SortOrder ='DESC' THEN LRBookingRange.StartNumber END DESC,
		 CASE WHEN @SortColumn = 2 AND @SortOrder ='ASC' THEN LRBookingRange.EndNumber END ASC,
		 CASE WHEN @SortColumn = 2 AND @SortOrder ='DESC' THEN LRBookingRange.EndNumber END DESC,
		 CASE WHEN @SortColumn = 3 AND @SortOrder ='ASC' THEN [LRBookingRange].Active END ASC,
		 CASE WHEN @SortColumn = 3 AND @SortOrder ='DESC' THEN [LRBookingRange].Active END DESC
		) AS RowNum,
		Count(*) over () AS TotalCount, 
		LRBookingRange.*,
		CustomerFirmBranch.Title As Branch
		FROM [LRBookingRange]
		Left Join CustomerFirmBranch on CustomerFirmBranch.Id = LRBookingRange.BranchId
		WHERE [LRBookingRange].Deleted = 0
		AND (
			Coalesce(@Search,'') = '' 
			OR CustomerFirmBranch.Title like '%'+ @Search + '%'
			OR [LRBookingRange].[StartNumber] like '%'+ @Search + '%'
			OR [LRBookingRange].[EndNumber] like '%'+ @Search + '%'
		)
	 ) AS T   
	 WHERE (((@PageSize = -1) And 1=1) OR (T.RowNum > @PageStart AND T.RowNum < (@PageStart + (@PageSize+1))))
End
GO