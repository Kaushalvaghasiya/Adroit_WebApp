CREATE OR ALTER FUNCTION [dbo].[fn_GetCustomerType]
(
@customertype char(1)
)
RETURNS varchar(max)
AS
BEGIN
	RETURN CASE @customertype when '0' then 'BackOffice' when '1' then 'Inquiry' when '2' then 'Demo' when '3' then 'FOC' when '4' then 'Customer' else '' end
END
GO