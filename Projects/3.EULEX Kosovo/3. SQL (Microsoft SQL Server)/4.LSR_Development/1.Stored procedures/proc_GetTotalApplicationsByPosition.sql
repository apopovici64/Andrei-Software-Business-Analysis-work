USE [LSR_Development]
GO

/****** Object:  StoredProcedure [dbo].[proc_GetTotalApplicationsByPosition]    Script Date: 11/06/2012 16:27:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[proc_GetTotalApplicationsByPosition]
AS

SELECT     TOP (100) PERCENT dbo.Tbl_LSR_Candidates.ID_CFA, dbo.Tbl_LSR_L_Gender.Gender, COUNT(dbo.Tbl_LSR_Candidates.ID_Candidate) AS [Number of Applications], 
                      LSR.dbo.Tbl_LSR_L_Adv_Positions.Adv_Position_Reference, LSR.dbo.Tbl_LSR_L_Adv_Positions.Adv_Position_Title, dbo.Tbl_LSR_Priorities.Priority_Number
FROM         dbo.Tbl_LSR_Candidates INNER JOIN
                      dbo.Tbl_LSR_L_Gender ON dbo.Tbl_LSR_Candidates.ID_Gender = dbo.Tbl_LSR_L_Gender.ID_Gender INNER JOIN
                      dbo.Tbl_LSR_Priorities ON dbo.Tbl_LSR_Candidates.ID_Candidate = dbo.Tbl_LSR_Priorities.ID_Candidate INNER JOIN
                      LSR.dbo.Tbl_LSR_L_Adv_Positions ON dbo.Tbl_LSR_Priorities.ID_Adv_Position = LSR.dbo.Tbl_LSR_L_Adv_Positions.ID_Adv_Position
GROUP BY dbo.Tbl_LSR_Candidates.ID_CFA, dbo.Tbl_LSR_L_Gender.Gender, LSR.dbo.Tbl_LSR_L_Adv_Positions.Adv_Position_Reference, 
                      LSR.dbo.Tbl_LSR_L_Adv_Positions.Adv_Position_Title, dbo.Tbl_LSR_Priorities.Priority_Number
ORDER BY dbo.Tbl_LSR_Candidates.ID_CFA, LSR.dbo.Tbl_LSR_L_Adv_Positions.Adv_Position_Reference                      

GO


