CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerUserBranchSave]
(
	 @Id int,
	 @FirstName VARCHAR(5),
	 @LastName VARCHAR(5),
	 @UserId uniqueidentifier,
	 @CustomerId int,
	 @IsActive bit,
	 @OwnerBranchId INT,
	 @BranchCSV NVARCHAR(max),
	 @AddedById int,
	 @ModifiedById INT
)
AS
BEGIN
	BEGIN TRAN
	BEGIN TRY
		

		IF EXISTS (SELECT 1 FROM CustomerUser WHERE Id = @Id)
			BEGIN
				UPDATE CustomerUser SET
					IsActive = @IsActive, 
					ModifiedById = @ModifiedById, 
					OwnerBranchId = @OwnerBranchId,
					FirstName = @FirstName,
					LastName = @LastName
					WHERE ID = @Id
				SELECT @Id;
			END
		ELSE
			BEGIN
				INSERT INTO [CustomerUser] 
					([CustomerId], [UserId], [IsActive], [IsLocked], [IsDeleted], [AddedOn], [OwnerBranchId], [FirstName], [LastName])
				VALUES (@CustomerId, @UserId, @IsActive, 0, 0, GETUTCDATE(), @OwnerBranchId, @FirstName, @LastName)

				SET @Id = SCOPE_IDENTITY();
				SELECT @Id;
			END

			Delete from [CustomerUserBranchMapping]  where UserId=@Id

				INSERT INTO [CustomerUserBranchMapping] 
					(UserId,BranchId,AddedById,AddedOn)
					Select 
					@Id,
					Id,
					@AddedById,
					GETUTCDATE()
					from dbo.[fnStringToIntArray](@BranchCSV)
		
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
