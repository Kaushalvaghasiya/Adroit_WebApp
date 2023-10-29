CREATE OR ALTER Procedure [dbo].[sp_BoxSettingList]
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
				CASE WHEN @SortColumn = 1 AND @SortOrder ='ASC' THEN ISNULL(Customer.Name, '') END ASC,
				CASE WHEN @SortColumn = 1 AND @SortOrder ='DESC' THEN ISNULL(Customer.Name, '') END DESC,
				CASE WHEN @SortColumn = 2 AND @SortOrder ='ASC' THEN ISNULL(CustomerFirm.Title, '') END ASC,
				CASE WHEN @SortColumn = 2 AND @SortOrder ='DESC' THEN ISNULL(CustomerFirm.Title, '') END DESC,
				CASE WHEN @SortColumn = 3 AND @SortOrder ='ASC' THEN BoxSetting.Active END ASC,
				CASE WHEN @SortColumn = 3 AND @SortOrder ='DESC' THEN BoxSetting.Active END DESC
				) AS RowNum,
			Count(*) over () AS TotalCount, 
			BoxSetting.*,
			Software.Title AS SoftwareTitle,
			ISNULL(Customer.Name, '') AS CustomerName,
			ISNULL(CustomerFirm.Title, '') AS CustomerFirmTitle
		FROM BoxSetting
		LEFT JOIN Software on BoxSetting.SoftwareId = Software.Id
		LEFT JOIN Customer on BoxSetting.CustomerId = Customer.Id
		LEFT JOIN CustomerFirm on BoxSetting.CusomerFirmId = CustomerFirm.Id
		WHERE ISNULL(Software.Deleted, 0) = 0
			AND ISNULL(Customer.Deleted, 0) = 0
			AND ISNULL(CustomerFirm.Deleted, 0) = 0
			AND (Coalesce(@Search,'') = '' 
				OR Software.Title like '%'+ @Search + '%'
				OR ISNULL(Customer.Name, '') like '%'+ @Search + '%'
				OR ISNULL(CustomerFirm.Title, '') like '%'+ @Search + '%')
		) AS T   
	 WHERE (((@PageSize = -1) And 1=1) OR (T.RowNum > @PageStart AND T.RowNum < (@PageStart + (@PageSize+1))))
End
GO