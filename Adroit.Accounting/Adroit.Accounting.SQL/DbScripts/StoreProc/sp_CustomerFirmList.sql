CREATE OR ALTER Procedure [dbo].[sp_CustomerFirmList]
  @LoginId int,
  @FirmId int,  
  @UserId int,
  @Search VARCHAR(100) = '',
  @PageStart INT = 0,
  @PageSize INT = 10,
  @SortColumn INT = 0,
  @SortOrder NVARCHAR(10) = 'ASC'
As
Begin
	Declare @CustomerId int = dbo.fn_GetCustomerId(@UserId);

	SELECT * FROM
	 (   
	  SELECT  
	   ROW_NUMBER() over (ORDER BY
		 CASE WHEN @SortColumn = 0 AND @SortOrder ='ASC' THEN CustomerFirm.Title END ASC,
		 CASE WHEN @SortColumn = 0 AND @SortOrder ='DESC' THEN CustomerFirm.Title END DESC,
		 CASE WHEN @SortColumn = 1 AND @SortOrder ='ASC' THEN CustomerFirm.OwnerName END ASC,
		 CASE WHEN @SortColumn = 1 AND @SortOrder ='DESC' THEN CustomerFirm.OwnerName END DESC,
		 CASE WHEN @SortColumn = 2 AND @SortOrder ='ASC' THEN [FirmTypeAdmin].Title END ASC,
		 CASE WHEN @SortColumn = 2 AND @SortOrder ='DESC' THEN [FirmTypeAdmin].Title END DESC,
		 CASE WHEN @SortColumn = 2 AND @SortOrder ='ASC' THEN Software.Title END ASC,
		 CASE WHEN @SortColumn = 2 AND @SortOrder ='DESC' THEN Software.Title END DESC,
		 CASE WHEN @SortColumn = 3 AND @SortOrder ='ASC' THEN (SELECT COUNT(*) FROM CustomerFirmBranch WHERE CustomerFirmBranch.FirmId = CustomerFirm.Id AND Deleted = 0) END ASC,
		 CASE WHEN @SortColumn = 3 AND @SortOrder ='DESC' THEN (SELECT COUNT(*) FROM CustomerFirmBranch WHERE CustomerFirmBranch.FirmId = CustomerFirm.Id AND Deleted = 0) END DESC
		) AS RowNum,
	   Count(*) over () AS TotalCount, 
	   CustomerFirm.*, 
	   [FirmTypeAdmin].Title as [FirmType],
	   [Customer].[Name] as CustomerName ,
	   Software.Title as SoftwareName,
	   (SELECT COUNT(*) FROM CustomerFirmBranch WHERE CustomerFirmBranch.FirmId = CustomerFirm.Id AND Deleted = 0) AS NumberOfBranchesCreated
	  FROM CustomerFirm
	  LEFT JOIN [FirmTypeAdmin] on CustomerFirm.FirmTypeId = [FirmTypeAdmin].Id
	  LEFT JOIN	[Customer] ON CustomerFirm.CustomerId = [Customer].Id	
	  LEFT JOIN	Software ON CustomerFirm.SoftwareId = Software.Id	
	  WHERE CustomerFirm.CustomerId = @CustomerId AND CustomerFirm.Deleted = 0
	  AND (Coalesce(@Search,'') = '' 
			OR CustomerFirm.Title like '%'+ @Search + '%'
			OR CustomerFirm.[OwnerName] like '%'+ @Search + '%'
			OR [FirmTypeAdmin].Title like '%'+ @Search + '%'
			OR Software.Title like '%'+ @Search + '%')
	 ) AS T   
	 WHERE (((@PageSize = -1) And 1=1) OR (T.RowNum > @PageStart AND T.RowNum < (@PageStart + (@PageSize+1))))
End
GO