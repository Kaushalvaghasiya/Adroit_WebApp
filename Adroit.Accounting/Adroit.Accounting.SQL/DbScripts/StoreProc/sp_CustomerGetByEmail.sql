CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerGetByEmail]
(
	@Email varchar(50)
)
AS
BEGIN
	SELECT *
	FROM Customer WHERE Email = @Email
END
GO