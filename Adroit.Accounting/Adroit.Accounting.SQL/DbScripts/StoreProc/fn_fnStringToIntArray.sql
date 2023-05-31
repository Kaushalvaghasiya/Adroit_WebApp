CREATE OR ALTER FUNCTION [dbo].[fnStringToIntArray]
(
@CommaSeparatedInt varchar(max)
)
RETURNS @TB TABLE (ID INT)
AS
BEGIN
DECLARE @XML AS XML
DECLARE @Delimiter AS CHAR(1) =','
SET @XML = CAST(('<X>'+REPLACE(@CommaSeparatedInt,@Delimiter ,'</X><X>')+'</X>') AS XML)
DECLARE @temp TABLE (ID INT)
INSERT INTO @TB (ID)
SELECT N.value('.', 'INT') AS ID FROM @XML.nodes('X') AS T(N)
RETURN;
END
GO