CREATE OR ALTER Procedure [dbo].[sp_CustomerFirmList]
  @LoginId int,
  @FirmId int,  
  @CustomerId int,
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
		 CASE WHEN @SortColumn = 0 AND @SortOrder ='ASC' THEN CustomerFirm.[OwnerName] END ASC,  
		 CASE WHEN @SortColumn = 0 AND @SortOrder ='DESC' THEN CustomerFirm.[OwnerName] END DESC,
		 CASE WHEN @SortColumn = 1 AND @SortOrder ='ASC' THEN CustomerFirm.[Title] END ASC,  
		 CASE WHEN @SortColumn = 1 AND @SortOrder ='DESC' THEN CustomerFirm.[Title] END DESC  
		) AS RowNum,
	   Count(*) over () AS TotalCount, 
	   CustomerFirm.*, 
	   [FirmTypeAdmin].Title as [FirmType],
	   [Customer].[Name] as CustomerName ,
	   (SELECT COUNT(*) FROM CustomerFirmBranch WHERE CustomerFirmBranch.FirmId = CustomerFirm.Id AND IsDeleted = 0) AS NumberOfBranchesCreated
	  FROM CustomerFirm
	  LEFT JOIN [FirmTypeAdmin] on CustomerFirm.FirmTypeId = [FirmTypeAdmin].Id
	  LEFT JOIN	[Customer] ON CustomerFirm.CustomerId=[Customer].Id	
	  WHERE CustomerFirm.IsDeleted = 0 and [CustomerFirm].customerId=@CustomerId
	  AND (Coalesce(@Search,'') = '' OR CustomerFirm.[OwnerName] like '%'+ @Search + '%')
	 ) AS T   
	 WHERE (((@PageSize = -1) And 1=1) OR (T.RowNum > @PageStart AND T.RowNum < (@PageStart + (@PageSize+1))))
End
Set Nocount off;
GO