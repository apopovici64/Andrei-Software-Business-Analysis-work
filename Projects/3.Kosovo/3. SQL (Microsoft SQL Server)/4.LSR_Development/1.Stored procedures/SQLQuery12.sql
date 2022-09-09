USE [LSR_Development]
GO

/****** Object:  StoredProcedure [dbo].[proc_GetTotalCandidatesByComponents_New]    Script Date: 10/30/2012 15:47:58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[proc_GetTotalSelectedCandidatesByComponents]
	(@ID_CFA INT = NULL)
AS

SELECT	Distinct Tbl_LSR_Priorities.ID_Component, Tbl_LSR_L_Components.Component, 

	(SELECT COUNT(*) FROM Tbl_LSR_Priorities P
			Left JOIN Tbl_LSR_Candidates ON
			P.ID_Candidate = Tbl_LSR_Candidates.ID_Candidate
	WHERE	Priority_Number = 1 
	AND		Tbl_LSR_Candidates.ID_Gender = 2 
	AND		P.ID_Component = Tbl_LSR_Priorities.ID_Component
	AND		Tbl_LSR_Candidates.ID_CFA = @ID_CFA
	AND     Tbl_LSR_Candidates.ID_Status = 15
	GROUP BY P.ID_Component) AS 'Male1',

	(SELECT	COUNT(*) FROM Tbl_LSR_Priorities P
			Left JOIN Tbl_LSR_Candidates ON
			P.ID_Candidate = Tbl_LSR_Candidates.ID_Candidate
	WHERE	Priority_Number = 1 
	AND		Tbl_LSR_Candidates.ID_Gender = 3 
	AND		P.ID_Component = Tbl_LSR_Priorities.ID_Component
	AND		Tbl_LSR_Candidates.ID_CFA = @ID_CFA
	AND     Tbl_LSR_Candidates.ID_Status = 15
	GROUP BY P.ID_Component) AS 'Female1',

	(SELECT COUNT(*) FROM Tbl_LSR_Priorities P
            Left JOIN Tbl_LSR_Candidates ON
            P.ID_Candidate = Tbl_LSR_Candidates.ID_Candidate
	WHERE	Priority_Number = 2 
	AND		Tbl_LSR_Candidates.ID_Gender = 2 
	AND		P.ID_Component = Tbl_LSR_Priorities.ID_Component
	AND		Tbl_LSR_Candidates.ID_CFA = @ID_CFA
	AND     Tbl_LSR_Candidates.ID_Status = 15
	GROUP BY P.ID_Component) AS 'Male2',

	(SELECT	COUNT(*) FROM Tbl_LSR_Priorities P
            Left JOIN Tbl_LSR_Candidates ON
            P.ID_Candidate = Tbl_LSR_Candidates.ID_Candidate
	WHERE	Priority_Number = 2 
	AND		Tbl_LSR_Candidates.ID_Gender = 3 
	AND		P.ID_Component = Tbl_LSR_Priorities.ID_Component
	AND		Tbl_LSR_Candidates.ID_CFA = @ID_CFA
	AND     Tbl_LSR_Candidates.ID_Status = 15
	GROUP BY P.ID_Component) AS 'Female2' 

--FROM Tbl_LSR_Priorities         

FROM	Tbl_LSR_Priorities LEFT OUTER JOIN Tbl_LSR_L_Components ON
		Tbl_LSR_Priorities.ID_Component = Tbl_LSR_L_Components.ID_Component

ORDER BY Tbl_LSR_Priorities.ID_Component


GO


