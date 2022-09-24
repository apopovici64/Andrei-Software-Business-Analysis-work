USE [Personnel_EULEX_development]
GO

/****** Object:  StoredProcedure [dbo].[GetPersonnelWithPoliceFunctions_Simple]    Script Date: 09/26/2012 15:13:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Andrei Popovici
-- Create date: 02/11/2012
-- Description:	
-- =============================================
ALTER PROCEDURE [dbo].[GetPersonnelWithPoliceFunctions_Simple] 
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	  SELECT 
	  x.Last_name+' '+x.First_Name AS Full_Name,
      FROM dbo.v_SimplePersonnelHavingPoliceFunctions x    
      ORDER BY Full_Name

END



GO


