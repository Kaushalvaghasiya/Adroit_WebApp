CREATE OR ALTER PROCEDURE [dbo].[sp_BookAdminBoxLabelListBySoftware_Select] (@softwareId tinyint)
AS
BEGIN

	SELECT BookAdmin.BoxLabel1 [Text] 
	FROM BookAdmin 
	INNER JOIN BookAdminSoftwareMapping ON BookAdmin.Id = BookAdminSoftwareMapping.BookId 
	where ISNULL(BookAdmin.BoxLabel1, '') <> '' AND BookAdminSoftwareMapping.SoftwareId = @SoftwareId

	UNION

	SELECT BookAdmin.BoxLabel2 [Text] 
	FROM BookAdmin INNER JOIN BookAdminSoftwareMapping ON BookAdmin.Id = BookAdminSoftwareMapping.BookId 
	where ISNULL(BookAdmin.BoxLabel2, '') <> '' AND BookAdminSoftwareMapping.SoftwareId = @SoftwareId
	
	UNION

	SELECT BookAdmin.BoxLabel3 [Text] 
	FROM BookAdmin INNER JOIN BookAdminSoftwareMapping ON BookAdmin.Id = BookAdminSoftwareMapping.BookId 
	where ISNULL(BookAdmin.BoxLabel3, '') <> '' AND BookAdminSoftwareMapping.SoftwareId = @SoftwareId
	
	UNION

	SELECT BookAdmin.BoxLabel4 [Text] 
	FROM BookAdmin INNER JOIN BookAdminSoftwareMapping ON BookAdmin.Id = BookAdminSoftwareMapping.BookId 
	where ISNULL(BookAdmin.BoxLabel4, '') <> '' AND BookAdminSoftwareMapping.SoftwareId = @SoftwareId
	
	UNION

	SELECT BookAdmin.BoxLabel5 [Text] 
	FROM BookAdmin INNER JOIN BookAdminSoftwareMapping ON BookAdmin.Id = BookAdminSoftwareMapping.BookId 
	where ISNULL(BookAdmin.BoxLabel5, '') <> '' AND BookAdminSoftwareMapping.SoftwareId = @SoftwareId

	UNION

	SELECT BookAdmin.BoxLabel6 [Text] 
	FROM BookAdmin INNER JOIN BookAdminSoftwareMapping ON BookAdmin.Id = BookAdminSoftwareMapping.BookId 
	where ISNULL(BookAdmin.BoxLabel6, '') <> '' AND BookAdminSoftwareMapping.SoftwareId = @SoftwareId

END
GO