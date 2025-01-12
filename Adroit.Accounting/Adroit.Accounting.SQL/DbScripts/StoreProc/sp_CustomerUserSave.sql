CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerUserSave]
(
	 @Id int,
	 @LoginId int,
	 @FirmId int,
	 @UserId uniqueidentifier,
	 @Active bit = 1,
	 @FirstName VARCHAR(50),
	 @LastName VARCHAR(50),
	 @OwnerBranchId INT = NULL,
	 @AllowUpdateUserMenuSettingToCustomer bit = 0,
	 @CustomerUserBranchIds NVARCHAR(MAX)
)
AS
BEGIN
	Declare @CustomerId int = dbo.fn_GetCustomerIdByFirm(@FirmId);

	BEGIN TRAN
	BEGIN TRY
		IF EXISTS (SELECT 1 FROM CustomerUser WHERE CustomerUser.CustomerId = @CustomerId AND Id = @Id)
			BEGIN
				UPDATE CustomerUser SET
					Active = @Active, 
					ModifiedById = @LoginId, 
					ModifiedOn = GETUTCDATE(),
					OwnerBranchId = @OwnerBranchId,
					FirstName = @FirstName,
					LastName = @LastName,
					AllowUpdateUserMenuSettingToCustomer = @AllowUpdateUserMenuSettingToCustomer
					WHERE CustomerUser.CustomerId = @CustomerId AND ID = @Id 

				DELETE FROM [CustomerUserBranchMapping] where UserId = @Id
			END
		ELSE
			BEGIN
				INSERT INTO [CustomerUser] 
					([CustomerId], [UserId], [Active], [Locked], [AddedOn], [OwnerBranchId], [FirstName], [LastName], AllowUpdateUserMenuSettingToCustomer)
				VALUES (@CustomerId, @UserId, @Active, 0, GETUTCDATE(), @OwnerBranchId, @FirstName, @LastName, @AllowUpdateUserMenuSettingToCustomer)

				SET @Id = SCOPE_IDENTITY();
			END
		
		INSERT INTO [CustomerUserBranchMapping] 
				(UserId,BranchId,AddedById,AddedOn)
				Select 
				@Id,
				Id,
				@LoginId,
				GETUTCDATE()
				from dbo.[fnStringToIntArray](@CustomerUserBranchIds)
		
		COMMIT TRAN
		SELECT @Id
	END TRY
	BEGIN CATCH
		DECLARE @error INT, @message VARCHAR(4000), @xstate INT;
		SELECT @error = ERROR_NUMBER(), @message = ERROR_MESSAGE(), @xstate = XACT_STATE();
		ROLLBACK TRAN

		RAISERROR ('%s', 16, 1, @message);
	END CATCH
END
GO
