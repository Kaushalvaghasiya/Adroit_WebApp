CREATE OR ALTER PROCEDURE [dbo].[sp_ProductSizeSave]
(
	 @Id int,
	 @Title NVARCHAR(50),
	 @Active bit,
	 @OrderNumber int
)
AS
BEGIN
	BEGIN TRAN
	BEGIN TRY
		IF EXISTS (SELECT 1 FROM ProductSize WHERE Id = @Id)
			BEGIN
				UPDATE  ProductSize SET
						Title = @Title,
						OrderNumber = @OrderNumber,
						Active = @active
					WHERE ID = @Id
			END
		ELSE If EXISTS (SELECT 1 FROM ProductSize WHERE Title = @Title AND Deleted = 1)
			BEGIN
				UPDATE  ProductSize SET
						OrderNumber = @OrderNumber,
						Active = @Active,
						Deleted = 0
					WHERE Title = @Title

				SELECT @Id=Id FROM ProductSize WHERE Title = @Title
			END
		ELSE 
			BEGIN
				INSERT INTO ProductSize
					([Title], OrderNumber, Active)
				VALUES
					(@Title, @OrderNumber, @Active)

				SET @Id = SCOPE_IDENTITY()
				
			END

		COMMIT TRAN
		SELECT @Id
	END TRY
	BEGIN CATCH
		DECLARE @error INT, @message VARCHAR(4000), @xstate INT;
		SELECT @error = ERROR_NUMBER(), @message = ERROR_MESSAGE(), @xstate = XACT_STATE();
		ROLLBACK TRAN
		IF (@message LIKE '%Violation of UNIQUE KEY%')
		BEGIN
			SET @message = 'Size ''' + @Title + ''' already exist!';
		END
		
		RAISERROR ('%s', 16, 1, @message);
	END CATCH
END
GO