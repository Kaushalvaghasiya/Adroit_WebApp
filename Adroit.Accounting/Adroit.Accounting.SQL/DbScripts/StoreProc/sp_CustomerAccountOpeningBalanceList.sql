CREATE OR ALTER Procedure [dbo].[sp_CustomerAccountOpeningBalanceList]
(
  @LoginId int,
  @FirmId int,
  @Search VARCHAR(100) = '',
  @PageStart INT = 0,
  @PageSize INT = 10,
  @SortColumn INT = 0,
  @SortOrder NVARCHAR(10) = 'ASC'
)
As
Set Nocount on;
Begin
	SELECT * FROM
	 (   
	  SELECT  
	   ROW_NUMBER() over (ORDER BY
		 CASE WHEN @SortColumn = 0 AND @SortOrder ='ASC' THEN CustomerAccount.[Name] END ASC,  
		 CASE WHEN @SortColumn = 0 AND @SortOrder ='DESC' THEN CustomerAccount.[Name] END DESC,
		 CASE WHEN @SortColumn = 1 AND @SortOrder ='ASC' THEN CustomerAccountOpeningBalance.[OpeningDate] END ASC,  
		 CASE WHEN @SortColumn = 1 AND @SortOrder ='DESC' THEN CustomerAccountOpeningBalance.[OpeningDate] END DESC,
		 CASE WHEN @SortColumn = 2 AND @SortOrder ='ASC' THEN CustomerAccountOpeningBalance.[Credit] END ASC,  
		 CASE WHEN @SortColumn = 2 AND @SortOrder ='DESC' THEN CustomerAccountOpeningBalance.[Credit] END DESC,
		 CASE WHEN @SortColumn = 3 AND @SortOrder ='ASC' THEN CustomerAccountOpeningBalance.[Amount] END ASC,
		 CASE WHEN @SortColumn = 3 AND @SortOrder ='DESC' THEN CustomerAccountOpeningBalance.[Amount] END DESC
		) AS RowNum,
	   Count(*) over () AS TotalRows, 
	   CustomerAccountOpeningBalance.*, 
	   CustomerAccount.[Name] as AccountBranchMappingName
	  FROM CustomerAccountOpeningBalance
	  INNER JOIN CustomerAccountBranchMapping On CustomerAccountOpeningBalance.AccountBranchMappingId = CustomerAccountBranchMapping.Id
	  INNER JOIN CustomerAccount On CustomerAccount.Id = CustomerAccountBranchMapping.AccountId
	  WHERE CustomerAccountOpeningBalance.Deleted = 0
	  AND (Coalesce(@Search,'') = '' 
			OR CustomerAccount.[Name] like '%'+ @Search + '%'
		    OR CustomerAccountOpeningBalance.[Amount] like '%'+ @Search + '%')
	 ) AS T   
	 WHERE (((@PageSize = -1) And 1=1) OR (T.RowNum > @PageStart AND T.RowNum < (@PageStart + (@PageSize+1))))
End
Set Nocount off;
GO