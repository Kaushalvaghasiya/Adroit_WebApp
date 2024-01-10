CREATE OR ALTER Procedure [dbo].[sp_AdminCustomerBranchToBranchMappingList]
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
			ROW_NUMBER() OVER (ORDER BY
				CASE WHEN @SortColumn = 0 AND @SortOrder ='ASC' THEN A.Title END ASC,
				CASE WHEN @SortColumn = 0 AND @SortOrder ='DESC' THEN A.Title END DESC,
				CASE WHEN @SortColumn = 1 AND @SortOrder ='ASC' THEN B.Title END ASC,
				CASE WHEN @SortColumn = 1 AND @SortOrder ='DESC' THEN B.Title END DESC
			) AS RowNum,
			Count(*) OVER () AS TotalCount, 
			CustomerChalanBranchMapping.Id,
			A.Title as Branch,
			B.Title as SharedBranch
		FROM CustomerChalanBranchMapping
		LEFT JOIN CustomerFirmBranch as A ON A.Id=CustomerChalanBranchMapping.Branch
		LEFT JOIN CustomerFirmBranch as B ON B.Id=CustomerChalanBranchMapping.SharedBranch
		where
		(Coalesce(@Search,'') = '' 
			OR A.Title like '%'+ @Search + '%'
			OR B.Title like '%'+ @Search + '%')
			
	 ) AS T   
	 WHERE (((@PageSize = -1) And 1=1) OR (T.RowNum > @PageStart AND T.RowNum < (@PageStart + (@PageSize+1))))
End
GO