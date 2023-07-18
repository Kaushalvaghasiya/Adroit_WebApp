CREATE OR ALTER FUNCTION [dbo].[fn_GetCustomerStatus]
(
@customerstsatus char(1)
)
RETURNS varchar(max)
AS
BEGIN
	RETURN CASE @customerstsatus when '1' then 'Registered' when '2' then 'Verified' else '' end
END
GO