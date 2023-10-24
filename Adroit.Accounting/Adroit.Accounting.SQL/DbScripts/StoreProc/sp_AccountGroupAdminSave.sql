CREATE OR ALTER PROCEDURE [dbo].[sp_AccountGroupAdminSave]
(
	 @Id int,
	 @Code VARCHAR(3),
	 @Title NVARCHAR(50),
	 @TypeId tinyint,
	 @AccountGroupHeaderId int,
	 @OrderNumber int,
	 @Active bit
)
AS
BEGIN
	BEGIN TRAN
	BEGIN TRY
		IF EXISTS (SELECT 1 FROM AccountGroupAdmin WHERE Id = @Id)
			BEGIN
				UPDATE  AccountGroupAdmin SET
						Code = @Code,
						Title = @Title,
						TypeId = @TypeId,
						AccountGroupHeaderId = @AccountGroupHeaderId,
						OrderNumber = @OrderNumber,
						Active = @Active
					WHERE ID = @Id
			END
		ELSE If EXISTS (SELECT 1 FROM AccountGroupAdmin WHERE AccountGroupHeaderId = @AccountGroupHeaderId AND Title = @Title AND Deleted = 1)
			BEGIN
				UPDATE  AccountGroupAdmin SET
						Code = @Code,
						Active = @Active,
						Deleted = 0
					WHERE AccountGroupHeaderId = @AccountGroupHeaderId AND Title = @Title 

				SELECT @Id=Id FROM AccountGroupAdmin WHERE AccountGroupHeaderId = @AccountGroupHeaderId AND Title = @Title 
			END
		ELSE
			BEGIN
				INSERT INTO AccountGroupAdmin
					(AccountGroupHeaderId, Title, TypeId, Code, OrderNumber, Active)
				VALUES
					(@AccountGroupHeaderId, @Title, @TypeId, @Code, @OrderNumber, @Active)

				SET @Id = SCOPE_IDENTITY()
			END
		COMMIT TRAN
		SELECT @Id
	END TRY
	BEGIN CATCH
		DECLARE @error INT, @message VARCHAR(4000), @xstate INT;
		SELECT @error = ERROR_NUMBER(), @message = ERROR_MESSAGE(), @xstate = XACT_STATE();
		ROLLBACK TRAN

		IF (@message LIKE '%IX_AccountGroupMaster_1%')
			BEGIN
				SET @message = 'Secondary account group code ''' + @Code + ''' already exist!';
			END
		ELSE
			IF (@message LIKE '%IX_AccountGroupMaster%')
			BEGIN
				SET @message = 'Secondary account group title ''' + @Title + ''' already exist!';
			END

		RAISERROR ('%s', 16, 1, @message);
	END CATCH
END
GO