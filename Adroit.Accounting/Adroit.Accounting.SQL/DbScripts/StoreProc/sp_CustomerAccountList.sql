CREATE OR ALTER Procedure [dbo].[sp_CustomerAccountList]
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
    Declare @CustomerId int = dbo.fn_GetCustomerIdByFirm(@FirmId);

	SELECT * FROM
	 (   
	  SELECT  
	   ROW_NUMBER() over (ORDER BY
	   CASE WHEN @SortColumn = 0 AND @SortOrder ='ASC' THEN CustomerAccount.[Name] END ASC,  
		 CASE WHEN @SortColumn = 0 AND @SortOrder ='DESC' THEN CustomerAccount.[Name] END DESC,
		 CASE WHEN @SortColumn = 1 AND @SortOrder ='ASC' THEN [CustomerAccountGroup].Title END ASC,  
		 CASE WHEN @SortColumn = 1 AND @SortOrder ='DESC' THEN [CustomerAccountGroup].Title END DESC,
		 CASE WHEN @SortColumn = 2 AND @SortOrder ='ASC' THEN CustomerAccount.GSTNumber END ASC,  
		 CASE WHEN @SortColumn = 2 AND @SortOrder ='DESC' THEN CustomerAccount.GSTNumber END DESC,
		 CASE WHEN @SortColumn = 3 AND @SortOrder ='ASC' THEN [City].Title END ASC,  
		 CASE WHEN @SortColumn = 3 AND @SortOrder ='DESC' THEN [City].Title END DESC,
		 CASE WHEN @SortColumn = 4 AND @SortOrder ='ASC' THEN CustomerAccount.Mobile END ASC,  
		 CASE WHEN @SortColumn = 4 AND @SortOrder ='DESC' THEN CustomerAccount.Mobile END DESC
		) AS RowNum,
	   Count(*) over () AS TotalCount, 
	   CustomerAccount.Id, 
	   CustomerAccount.[Name], 
	   [CustomerAccountGroup].Title as AccountGroup, 
	   CustomerAccount.GSTNumber, 
	   [City].Title as [CityName], 
	   CustomerAccount.Mobile 
	  FROM CustomerAccount
	  INNER JOIN [CustomerAccountGroup] on CustomerAccount.AccountGroupId = [CustomerAccountGroup].Id
	  LEFT JOIN [City] on CustomerAccount.CityId = [City].Id AND [City].Active = 1
	  WHERE CustomerAccount.CustomerId = @CustomerId AND CustomerAccount.Deleted = 0 
	  AND (Coalesce(@Search,'') = '' OR CustomerAccount.[Name] like '%'+ @Search + '%'
		   OR [CustomerAccountGroup].Title like '%'+ @Search + '%'
		   OR CustomerAccount.GSTNumber like '%'+ @Search + '%'
		   OR [City].Title like '%'+ @Search + '%'
		   OR CustomerAccount.Mobile like '%'+ @Search + '%')
	 ) AS T   
	 WHERE (((@PageSize = -1) And 1=1) OR (T.RowNum > @PageStart AND T.RowNum < (@PageStart + (@PageSize+1))))
End
Set Nocount off;
GO