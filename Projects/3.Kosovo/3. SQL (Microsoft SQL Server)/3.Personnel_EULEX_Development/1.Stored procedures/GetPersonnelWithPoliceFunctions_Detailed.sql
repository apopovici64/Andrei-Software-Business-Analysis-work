USE [Personnel_EULEX_Development]
GO

/****** Object:  StoredProcedure [dbo].[GetPersonnelWithPoliceFunctions_Detailed]    Script Date: 11/12/2012 16:07:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Andrei Popovici	
-- Create date: 02/11/2012
-- Description:	
-- =============================================
ALTER PROCEDURE [dbo].[GetPersonnelWithPoliceFunctions_Detailed] 
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    SELECT 
     x.ID_Employee 
    ,x.Last_name+' '+x.First_Name AS Full_name
    ,x.ID_Card 
	,x.ID_Nationality 
	,x.Nationality 
	,x.ID_engagement 
	,x.Engagement 
	,x.ID_Position 
	,x.Position_Reference 
	,x.Position_title
	,x.ArrivalDate 
	,x.Date_Termination 
	,x.ID_Component
	,x.Components 
	,x.ID_Department 
	,x.Department 
	,x.ID_Unit_Office 
	,x.Unit_Office

	FROM dbo.v_DetailedPersonnelHavingPoliceFunctions x
	ORDER BY Full_name
	
END



GO


