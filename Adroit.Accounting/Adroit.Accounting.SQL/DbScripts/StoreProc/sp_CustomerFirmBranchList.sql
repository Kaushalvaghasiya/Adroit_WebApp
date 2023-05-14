CREATE OR ALTER Procedure [dbo].[sp_CustomerFirmBranchList]
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
		 CASE WHEN @SortColumn = 0 AND @SortOrder ='ASC' THEN CustomerFirmBranch.[Title] END ASC,  
		 CASE WHEN @SortColumn = 0 AND @SortOrder ='DESC' THEN CustomerFirmBranch.[Title] END DESC
		) AS RowNum,
	   Count(*) over () AS TotalCount, CustomerFirmBranch.*,[CustomerFirm].Title as CustomerFirm,[FirmBranchTypeAdmin].Title as FirmBranchTypeAdmin, [City].Title as City
	  FROM CustomerFirmBranch
	  LEFT JOIN CustomerFirm ON CustomerFirm.Id=CustomerFirmBranch.FirmId
	  LEFT JOIN FirmBranchTypeAdmin ON CustomerFirmBranch.FirmBranchTypeId=FirmBranchTypeAdmin.id
	  LEFT JOIN City ON CustomerFirmBranch.CityId=City.id
	  WHERE CustomerFirmBranch.IsDeleted = 0 and [CustomerFirmBranch].FirmId=@FirmId
	  AND (Coalesce(@Search,'') = '' OR CustomerFirmBranch.[Title] like '%'+ @Search + '%')
	 ) AS T   
	 WHERE (((@PageSize = -1) And 1=1) OR (T.RowNum > @PageStart AND T.RowNum < (@PageStart + (@PageSize+1))))
End
Set Nocount off;
GO