CREATE OR ALTER PROCEDURE [dbo].[sp_GSTUQCSave]
(
	 @Id int,
	 @Title NVARCHAR(30),
	 @Code VARCHAR(3),
	 @CodeEWayBill VARCHAR(20),
	 @OrderNumber int,
	 @Active bit
)
AS
BEGIN
	BEGIN TRAN
	BEGIN TRY
		IF EXISTS (SELECT 1 FROM GSTUQC WHERE Id = @Id)
			BEGIN
				UPDATE  GSTUQC SET
						Title = @Title,
						Code = @Code,
						CodeEWayBill = @CodeEWayBill,
						OrderNumber = @OrderNumber,
						Active = @active
					WHERE ID = @Id
			END
		ELSE If EXISTS (SELECT 1 FROM GSTUQC WHERE Title = @Title AND Deleted = 1)
			BEGIN
				UPDATE  GSTUQC SET
						Code = @Code,
						CodeEWayBill = @CodeEWayBill,
						OrderNumber = @OrderNumber,
						Active = @active,
						Deleted = 0
					WHERE Title = @Title 

				SELECT @Id=Id FROM GSTUQC WHERE Title = @Title 
			END
		ELSE
			BEGIN
				INSERT INTO GSTUQC
					(Title, Code, CodeEWayBill, OrderNumber, Active)
				VALUES
					(@Title, @Code, @CodeEWayBill, @OrderNumber, @Active)

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
			SET @message = 'GSTUQC ''' + @Title + ''' already exist!';
		END
		
		RAISERROR ('%s', 16, 1, @message);
	END CATCH
END
GO