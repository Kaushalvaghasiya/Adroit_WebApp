CREATE OR ALTER FUNCTION [dbo].[GetUserBranches]
(
@userId int
)
RETURNS varchar(max)
AS
BEGIN
DECLARE @branchnames varchar(max) = ''
SELECT
@branchnames = @branchnames + CustomerFirmBranch.Title + ' ('+ CustomerFirm.Title +')' + '</br>'
from CustomerUser
INNER JOIN CustomerUserBranchMapping on CustomerUser.Id = CustomerUserBranchMapping.UserId
INNER JOIN CustomerFirmBranch ON CustomerUserBranchMapping.BranchId = CustomerFirmBranch.Id
INNER JOIN CustomerFirm ON CustomerFirmBranch.FirmId = CustomerFirm.Id
WHERE CustomerUser.ID = @userid

RETURN SUBSTRING(@branchnames, 0, LEN(@branchnames))
END
GO
