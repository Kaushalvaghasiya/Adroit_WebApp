CREATE OR ALTER Procedure [dbo].[sp_CustomerUserList]
  @CustomerId INT,
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
		 CASE WHEN @SortColumn = 0 AND @SortOrder ='ASC' THEN CustomerUser.[FirstName] END ASC,  
		 CASE WHEN @SortColumn = 0 AND @SortOrder ='DESC' THEN CustomerUser.[LastName] END DESC,
		 CASE WHEN @SortColumn = 1 AND @SortOrder ='ASC' THEN CustomerUser.[FirstName] END ASC,  
		 CASE WHEN @SortColumn = 1 AND @SortOrder ='DESC' THEN CustomerUser.[LastName] END DESC  
		) AS RowNum,
	   Count(*) over () AS TotalCount, CustomerUser.*,dbo.[GetUserBranches](CustomerUser.id) as CustomerUserBranch,Customer.Name as CustomerName
	  FROM CustomerUser
	  LEFT JOIN Customer on Customer.id=CustomerUser.CustomerId
	  WHERE CustomerUser.IsDeleted = 0 and CustomerUser.CustomerId=@CustomerId
	  AND (Coalesce(@Search,'') = '' OR CustomerUser.[FirstName] like '%'+ @Search + '%' OR CustomerUser.[LastName] like '%'+ @Search + '%')
	 ) AS T   
	 WHERE (((@PageSize = -1) And 1=1) OR (T.RowNum > @PageStart AND T.RowNum < (@PageStart + (@PageSize+1))))
End
Set Nocount off;
GO