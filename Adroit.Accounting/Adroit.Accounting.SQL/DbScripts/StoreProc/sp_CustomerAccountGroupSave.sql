CREATE OR ALTER PROCEDURE [dbo].[sp_AccountGroupAdminSave]
(
	 @Id		INT,
	 @UserId	INT,
	 @Code		VARCHAR(3),
	 @Title		NVARCHAR(50),
	 @TypeId	TINYINT,
	 @AccountGroupHeaderId INT,
	 @OrderNumber INT,
	 @Active BIT,
	 @AddedById INT
)
AS
BEGIN
	BEGIN TRAN
	BEGIN TRY
		Declare @CustomerId int = dbo.fn_GetCustomerId(@UserId);

		IF EXISTS (SELECT 1 FROM CustomerAccountGroup WHERE Id = @Id And CustomerId = @CustomerId)
			BEGIN
				UPDATE  CustomerAccountGroup SET
						Code = @Code,
						Title = @Title,
						TypeId = @TypeId,
						AccountGroupHeaderId = @AccountGroupHeaderId,
						OrderNumber = @OrderNumber,
						Active = @Active
					WHERE ID = @Id And CustomerId = @CustomerId
			END
		ELSE If EXISTS (SELECT 1 FROM CustomerAccountGroup WHERE AccountGroupHeaderId = @AccountGroupHeaderId AND Title = @Title AND Deleted = 1 And CustomerId = @CustomerId)
			BEGIN
				UPDATE  CustomerAccountGroup SET
						Code = @Code,
						Active = @Active,
						Deleted = 0
					WHERE AccountGroupHeaderId = @AccountGroupHeaderId AND Title = @Title And CustomerId = @CustomerId

				SELECT @Id=Id FROM CustomerAccountGroup WHERE AccountGroupHeaderId = @AccountGroupHeaderId AND Title = @Title And CustomerId = @CustomerId
			END
		ELSE
			BEGIN
				INSERT INTO CustomerAccountGroup
					(CustomerId,AccountGroupHeaderId, Title, TypeId, Code, OrderNumber, Active, AddedById)
				VALUES
					(@CustomerId, @AccountGroupHeaderId, @Title, @TypeId, @Code, @OrderNumber, @Active, @AddedById)

				SET @Id = SCOPE_IDENTITY()
			END
		COMMIT TRAN
		SELECT @Id
	END TRY
	BEGIN CATCH
		DECLARE @error INT, @message VARCHAR(4000), @xstate INT;
		SELECT @error = ERROR_NUMBER(), @message = ERROR_MESSAGE(), @xstate = XACT_STATE();
		ROLLBACK TRAN

		IF (@message LIKE '%IX_AccountGroup_1%')
			BEGIN
				SET @message = 'Secondary account group code ''' + @Code + ''' already exist!';
			END
		ELSE
			IF (@message LIKE '%IX_AccountGroup%')
			BEGIN
				SET @message = 'Secondary account group title ''' + @Title + ''' already exist!';
			END

		RAISERROR ('%s', 16, 1, @message);
	END CATCH
END
GO