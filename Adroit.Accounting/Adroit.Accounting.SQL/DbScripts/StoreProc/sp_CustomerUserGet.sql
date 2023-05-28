 CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerUserGet]
(
	@userId INT
)
AS
BEGIN
	SELECT CustomerUser.*,(SELECT  
        stuff(
                (
                    select  ',' + CAST(t1.BranchId AS varchar) 
                    from    CustomerUserBranchMapping t1
                    where   t1.UserId = t.UserId
                    for xml path('')
                ),1,1,'') Concats
FROM    CustomerUserBranchMapping t
where t.UserId=@userId
GROUP BY t.UserId) as CustomerUserBranch,dbo.AspNetUsers.Email
	FROM CustomerUser
	Left JOIN dbo.AspNetUsers on CustomerUser.UserId=dbo.AspNetUsers.Id
	WHERE CustomerUser.id = @userId

END
GO