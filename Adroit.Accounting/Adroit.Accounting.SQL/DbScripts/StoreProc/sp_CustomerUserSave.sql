CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerUserSave]
(
	 @Id int,
	 @UserId uniqueidentifier,
	 @CustomerId int,
	 @IsActive  bit,
	 @IsLocked bit,
	 @AddedById int,
	 @OwnerBranchId int,
	 @ModifiedById int
)
AS
BEGIN
	BEGIN TRAN
	BEGIN TRY
		IF EXISTS (SELECT 1 FROM CustomerUser WHERE Id = @Id)
			BEGIN
				UPDATE CustomerUser SET
					CustomerId = @CustomerId, 
					UserId = @UserId, 
					IsActive = @IsActive, 
					IsLocked = @IsLocked, 
					ModifiedById = @ModifiedById, 
					OwnerBranchId = @OwnerBranchId
					WHERE ID = @Id
				SELECT @Id;
			END
		ELSE
			BEGIN
				INSERT INTO CustomerUser
					(CustomerId, UserId, IsActive, IsLocked, AddedById, AddedOn, OwnerBranchId)
				VALUES
					(@CustomerId, @UserId, @IsActive, @IsLocked, @AddedById, GETUTCDATE(), @OwnerBranchId)

				SET @Id = SCOPE_IDENTITY();
				SELECT @Id;
			END
		COMMIT TRAN
	END TRY
	BEGIN CATCH
		DECLARE @error INT, @message VARCHAR(4000), @xstate INT;
		SELECT @error = ERROR_NUMBER(), @message = ERROR_MESSAGE(), @xstate = XACT_STATE();
		ROLLBACK TRAN

		RAISERROR ('%s', 16, 1, @message);
	END CATCH
END
GO