
CREATE PROCEDURE [dbo].[Usp_IntentionalFailure]
	(
	@RaiseError VARCHAR(50)='true'
	)
AS
BEGIN
	IF(@RaiseError = 'true')
	BEGIN
		RAISERROR('The Stored Procedure intentionally failed.',16,1);
		RETURN 0;
	END
END;
