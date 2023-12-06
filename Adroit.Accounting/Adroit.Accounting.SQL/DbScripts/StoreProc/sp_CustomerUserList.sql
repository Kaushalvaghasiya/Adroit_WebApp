CREATE OR ALTER Procedure [dbo].[sp_CustomerUserList]
  @LoginId int,
  @FirmId int,  
  @Search VARCHAR(100) = '',
  @PageStart INT = 0,
  @PageSize INT = 10,
  @SortColumn INT = 0,
  @SortOrder NVARCHAR(10) = 'ASC'
As
Begin
	Declare @CustomerId int = dbo.fn_GetCustomerIdByFirmId(@FirmId);
	
	SELECT * FROM
	 (   
	  SELECT  
	   ROW_NUMBER() over (ORDER BY
		 CASE WHEN @SortColumn = 0 AND @SortOrder ='ASC' THEN [FirstName] + ' ' + [LastName] END ASC,
		 CASE WHEN @SortColumn = 0 AND @SortOrder ='DESC' THEN [FirstName] + ' ' + [LastName] END DESC,
		 CASE WHEN @SortColumn = 1 AND @SortOrder ='ASC' THEN AspNetUsers.Email END ASC,
		 CASE WHEN @SortColumn = 1 AND @SortOrder ='DESC' THEN AspNetUsers.Email END DESC,
		 CASE WHEN @SortColumn = 1 AND @SortOrder ='ASC' THEN CustomerUser.Active END ASC,
		 CASE WHEN @SortColumn = 1 AND @SortOrder ='DESC' THEN CustomerUser.Active END DESC,
		 CASE WHEN @SortColumn = 1 AND @SortOrder ='ASC' THEN CustomerUser.AllowUpdateUserMenuSettingToCustomer END ASC,
		 CASE WHEN @SortColumn = 1 AND @SortOrder ='DESC' THEN CustomerUser.AllowUpdateUserMenuSettingToCustomer END DESC,
		 CASE WHEN @SortColumn = 1 AND @SortOrder ='ASC' THEN dbo.[fn_GetUserBranches](CustomerUser.Id) END ASC,
		 CASE WHEN @SortColumn = 1 AND @SortOrder ='DESC' THEN dbo.[fn_GetUserBranches](CustomerUser.Id) END DESC
		) AS RowNum,
	   Count(*) over () AS TotalCount, 
	   CustomerUser.*,
	   dbo.[fn_GetUserBranches](CustomerUser.Id) as CustomerUserBranches,
	   AspNetUsers.Email
	  FROM CustomerUser
	  INNER JOIN AspNetUsers ON CustomerUser.UserId = AspNetUsers.Id
	  WHERE CustomerUser.CustomerId = @CustomerId
	  AND CustomerUser.Deleted = 0
	  AND (Coalesce(@Search,'') = '' OR CustomerUser.[FirstName] like '%'+ @Search + '%' OR CustomerUser.[LastName] like '%'+ @Search + '%')
	 ) AS T   
	 WHERE (((@PageSize = -1) And 1=1) OR (T.RowNum > @PageStart AND T.RowNum < (@PageStart + (@PageSize+1))))
End
GO