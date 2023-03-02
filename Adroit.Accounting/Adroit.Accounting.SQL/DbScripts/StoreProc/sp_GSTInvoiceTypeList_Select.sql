CREATE OR ALTER PROCEDURE [dbo].[sp_GSTInvoiceTypeList_Select]
AS
BEGIN
	SELECT Id,Title
	FROM [GSTInvoiceType]
	ORDER BY [GSTInvoiceType].Title
END
GO