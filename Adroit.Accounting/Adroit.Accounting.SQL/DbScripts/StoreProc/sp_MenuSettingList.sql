CREATE OR ALTER Procedure [dbo].[sp_MenuSettingList]
  @LoginId int,
  @Search VARCHAR(100) = '',
  @PageStart INT = 0,
  @PageSize INT = 10,
  @SortColumn INT = 0,
  @SortOrder NVARCHAR(10) = 'ASC'
As
Begin
	SELECT * FROM
	 (   
		SELECT ROW_NUMBER() over (ORDER BY
				CASE WHEN @SortColumn = 0 AND @SortOrder ='ASC' THEN Software.Title END ASC,
				CASE WHEN @SortColumn = 0 AND @SortOrder ='DESC' THEN Software.Title END DESC,
				CASE WHEN @SortColumn = 1 AND @SortOrder ='ASC' THEN ISNULL(SoftwarePlan.Title, '') + ISNULL(SoftwarePlan.Code, '') END ASC,
				CASE WHEN @SortColumn = 1 AND @SortOrder ='DESC' THEN ISNULL(SoftwarePlan.Title, '') + ISNULL(SoftwarePlan.Code, '') END DESC,
				CASE WHEN @SortColumn = 2 AND @SortOrder ='ASC' THEN ISNULL(Customer.Name, '') END ASC,
				CASE WHEN @SortColumn = 2 AND @SortOrder ='DESC' THEN ISNULL(Customer.Name, '') END DESC,
				CASE WHEN @SortColumn = 3 AND @SortOrder ='ASC' THEN ISNULL(CustomerFirm.Title, '') END ASC,
				CASE WHEN @SortColumn = 3 AND @SortOrder ='DESC' THEN ISNULL(CustomerFirm.Title, '') END DESC,
				CASE WHEN @SortColumn = 4 AND @SortOrder ='ASC' THEN ISNULL(CustomerFirmBranch.Title, '') END ASC,
				CASE WHEN @SortColumn = 4 AND @SortOrder ='DESC' THEN ISNULL(CustomerFirmBranch.Title, '') END DESC,
				CASE WHEN @SortColumn = 5 AND @SortOrder ='ASC' THEN ISNULL(CustomerUser.FirstName, '') + ' ' + ISNULL(CustomerUser.LastName, '') END ASC,
				CASE WHEN @SortColumn = 5 AND @SortOrder ='DESC' THEN ISNULL(CustomerUser.FirstName, '') + ' ' + ISNULL(CustomerUser.LastName, '') END DESC,
				CASE WHEN @SortColumn = 6 AND @SortOrder ='ASC' THEN MenuSetting.Active END ASC,
				CASE WHEN @SortColumn = 6 AND @SortOrder ='DESC' THEN MenuSetting.Active END DESC
				) AS RowNum,
			Count(*) over () AS TotalCount, 
			MenuSetting.*,
			Software.Title AS SoftwareTitle,
			REPLACE(ISNULL(SoftwarePlan.Title, '') + ' (' + ISNULL(SoftwarePlan.Code, '') + ')', '()','') AS SoftwarePlanTitle,
			ISNULL(Customer.Name, '') AS CustomerName,
			ISNULL(CustomerFirm.Title, '') AS CustomerFirmTitle,
			ISNULL(CustomerFirmBranch.Title, '') AS CustomerFirmBranchTitle,
			ISNULL(CustomerUser.FirstName, '') + ' ' + ISNULL(CustomerUser.LastName, '') AS UserName
		FROM MenuSetting
		LEFT JOIN Software on MenuSetting.SoftwareId = Software.Id
		LEFT JOIN SoftwarePlan on MenuSetting.SoftwarePlanId = SoftwarePlan.Id
		LEFT JOIN Customer on MenuSetting.CustomerId = Customer.Id
		LEFT JOIN CustomerFirm on MenuSetting.CusomerFirmId = CustomerFirm.Id
		LEFT JOIN CustomerFirmBranch on MenuSetting.CustomerFirmBranchId = CustomerFirmBranch.Id
		LEFT JOIN CustomerUser on MenuSetting.CustomerUserId = CustomerUser.Id
		WHERE Software.Deleted = 0
			AND ISNULL(SoftwarePlan.Deleted, 0) = 0
			AND Customer.Deleted = 0
			AND CustomerFirm.Deleted = 0
			AND CustomerFirmBranch.Deleted = 0
			AND CustomerUser.DeletedOn IS NULL
			AND (Coalesce(@Search,'') = '' 
				OR Software.Title like '%'+ @Search + '%'
				OR ISNULL(SoftwarePlan.Title, '') like '%'+ @Search + '%'
				OR ISNULL(SoftwarePlan.Code, '') like '%'+ @Search + '%'
				OR ISNULL(Customer.Name, '') like '%'+ @Search + '%'
				OR ISNULL(CustomerFirm.Title, '') like '%'+ @Search + '%'
				OR ISNULL(CustomerFirmBranch.Title, '') like '%'+ @Search + '%'
				OR ISNULL(CustomerUser.FirstName, '') + ' ' + ISNULL(CustomerUser.LastName, '') like '%'+ @Search + '%')
		) AS T   
	 WHERE (((@PageSize = -1) And 1=1) OR (T.RowNum > @PageStart AND T.RowNum < (@PageStart + (@PageSize+1))))
End
GO