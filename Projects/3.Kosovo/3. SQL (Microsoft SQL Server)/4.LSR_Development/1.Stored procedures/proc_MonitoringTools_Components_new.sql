USE [LSR_Development]
GO

/****** Object:  StoredProcedure [dbo].[proc_MonitoringTools_Components_NEW]    Script Date: 10/19/2012 09:20:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[proc_MonitoringTools_Components_New]
	(@ID_CFA INT)
AS
	IF @ID_CFA <13
	BEGIN
	SELECT	
		--First Priority
		(SELECT COUNT(*) FROM Tbl_LSR_Priorities P
				Left JOIN Tbl_LSR_Candidates C ON
				P.ID_Candidate = C.ID_Candidate
		WHERE	Priority_Number = 1  AND P.ID_Component = 2
		AND		C.ID_CFA = @ID_CFA
		GROUP BY P.ID_Component) AS [HOM p.1],
		(SELECT COUNT(*)  FROM Tbl_LSR_Priorities P
				Left JOIN Tbl_LSR_Candidates C ON
				P.ID_Candidate = c.ID_Candidate
		WHERE	Priority_Number = 1  AND P.ID_Component = 3
		AND		C.ID_CFA = @ID_CFA
		GROUP BY P.ID_Component) AS [Justice p.1],
		(SELECT COUNT(*)  FROM Tbl_LSR_Priorities P
				Left JOIN Tbl_LSR_Candidates C ON
				P.ID_Candidate = c.ID_Candidate
		WHERE	Priority_Number = 1  AND P.ID_Component = 4
		AND		C.ID_CFA = @ID_CFA
		GROUP BY P.ID_Component) AS [Poilce p.1],
		(SELECT COUNT(*)  FROM Tbl_LSR_Priorities P
				Left JOIN Tbl_LSR_Candidates C ON
				P.ID_Candidate = c.ID_Candidate
		WHERE	Priority_Number = 1  AND P.ID_Component = 5
		AND		C.ID_CFA = @ID_CFA
		GROUP BY P.ID_Component) AS [Customs p.1],
		(SELECT COUNT(*)  FROM Tbl_LSR_Priorities P
				Left JOIN Tbl_LSR_Candidates C ON
				P.ID_Candidate = c.ID_Candidate
		WHERE	Priority_Number = 1  AND P.ID_Component = 6
		AND		C.ID_CFA = @ID_CFA
		GROUP BY P.ID_Component) AS [Admin p.1],
		
		--Second Priority
		(SELECT COUNT(*) FROM Tbl_LSR_Priorities P
				Left JOIN Tbl_LSR_Candidates C ON
				P.ID_Candidate = C.ID_Candidate
		WHERE	Priority_Number = 2  AND P.ID_Component = 2
		AND		C.ID_CFA = @ID_CFA
		GROUP BY P.ID_Component) AS [HOM p.2],
		(SELECT COUNT(*)  FROM Tbl_LSR_Priorities P
				Left JOIN Tbl_LSR_Candidates C ON
				P.ID_Candidate = c.ID_Candidate
		WHERE	Priority_Number = 2  AND P.ID_Component = 3
		AND		C.ID_CFA = @ID_CFA
		GROUP BY P.ID_Component) AS [Justice p.2],
		(SELECT COUNT(*)  FROM Tbl_LSR_Priorities P
				Left JOIN Tbl_LSR_Candidates C ON
				P.ID_Candidate = c.ID_Candidate
		WHERE	Priority_Number = 2  AND P.ID_Component = 4
		AND		C.ID_CFA = @ID_CFA
		GROUP BY P.ID_Component) AS [Poilce p.2],
		(SELECT COUNT(*)  FROM Tbl_LSR_Priorities P
				Left JOIN Tbl_LSR_Candidates C ON
				P.ID_Candidate = c.ID_Candidate
		WHERE	Priority_Number = 2  AND P.ID_Component = 5
		AND		C.ID_CFA = @ID_CFA
		GROUP BY P.ID_Component) AS [Customs p.2],
		(SELECT COUNT(*)  FROM Tbl_LSR_Priorities P
				Left JOIN Tbl_LSR_Candidates C ON
				P.ID_Candidate = c.ID_Candidate
		WHERE	Priority_Number = 2  AND P.ID_Component = 6
		AND		C.ID_CFA = @ID_CFA
		GROUP BY P.ID_Component) AS [Admin p.2]
	END	
   ELSE
	BEGIN
	SELECT
	   --First Priority
		(SELECT COUNT(*) FROM Tbl_LSR_Priorities P
				Left JOIN Tbl_LSR_Candidates C ON
				P.ID_Candidate = C.ID_Candidate
		WHERE	Priority_Number = 1  AND P.ID_Component = 12
		AND		C.ID_CFA = @ID_CFA
		GROUP BY P.ID_Component) AS [OCS p.1],
		(SELECT COUNT(*)  FROM Tbl_LSR_Priorities P
				Left JOIN Tbl_LSR_Candidates C ON
				P.ID_Candidate = c.ID_Candidate
		WHERE	Priority_Number = 1  AND P.ID_Component = 13
		AND		C.ID_CFA = @ID_CFA
		GROUP BY P.ID_Component) AS [OHM p.1],
		(SELECT COUNT(*)  FROM Tbl_LSR_Priorities P
				Left JOIN Tbl_LSR_Candidates C ON
				P.ID_Candidate = c.ID_Candidate
		WHERE	Priority_Number = 1  AND P.ID_Component = 14
		AND		C.ID_CFA = @ID_CFA
		GROUP BY P.ID_Component) AS [SD p.1],
		(SELECT COUNT(*)  FROM Tbl_LSR_Priorities P
				Left JOIN Tbl_LSR_Candidates C ON
				P.ID_Candidate = c.ID_Candidate
		WHERE	Priority_Number = 1  AND P.ID_Component = 15
		AND		C.ID_CFA = @ID_CFA
		GROUP BY P.ID_Component) AS [ED p.1],
		(SELECT COUNT(*)  FROM Tbl_LSR_Priorities P
				Left JOIN Tbl_LSR_Candidates C ON
				P.ID_Candidate = c.ID_Candidate
		WHERE	Priority_Number = 1  AND P.ID_Component = 16
		AND		C.ID_CFA = @ID_CFA
		GROUP BY P.ID_Component) AS [MSD p.1],
		(SELECT COUNT(*)  FROM Tbl_LSR_Priorities P
				Left JOIN Tbl_LSR_Candidates C ON
				P.ID_Candidate = c.ID_Candidate
		WHERE	Priority_Number = 1  AND P.ID_Component = 17
		AND		C.ID_CFA = @ID_CFA
		GROUP BY P.ID_Component) AS [SSD p.1],
		
		--Second Priority
		(SELECT COUNT(*) FROM Tbl_LSR_Priorities P
				Left JOIN Tbl_LSR_Candidates C ON
				P.ID_Candidate = C.ID_Candidate
		WHERE	Priority_Number = 2  AND P.ID_Component = 12
		AND		C.ID_CFA = @ID_CFA
		GROUP BY P.ID_Component) AS [OCS p.2],
		(SELECT COUNT(*)  FROM Tbl_LSR_Priorities P
				Left JOIN Tbl_LSR_Candidates C ON
				P.ID_Candidate = c.ID_Candidate
		WHERE	Priority_Number = 2  AND P.ID_Component = 13
		AND		C.ID_CFA = @ID_CFA
		GROUP BY P.ID_Component) AS [OHM p.2],
		(SELECT COUNT(*)  FROM Tbl_LSR_Priorities P
				Left JOIN Tbl_LSR_Candidates C ON
				P.ID_Candidate = c.ID_Candidate
		WHERE	Priority_Number = 2  AND P.ID_Component = 14
		AND		C.ID_CFA = @ID_CFA
		GROUP BY P.ID_Component) AS [SD p.2],
		(SELECT COUNT(*)  FROM Tbl_LSR_Priorities P
				Left JOIN Tbl_LSR_Candidates C ON
				P.ID_Candidate = c.ID_Candidate
		WHERE	Priority_Number = 2  AND P.ID_Component = 15
		AND		C.ID_CFA = @ID_CFA
		GROUP BY P.ID_Component) AS [ED p.2],
		(SELECT COUNT(*)  FROM Tbl_LSR_Priorities P
				Left JOIN Tbl_LSR_Candidates C ON
				P.ID_Candidate = c.ID_Candidate
		WHERE	Priority_Number = 2  AND P.ID_Component = 16
		AND		C.ID_CFA = @ID_CFA
		GROUP BY P.ID_Component) AS [MSD p.2],
		(SELECT COUNT(*)  FROM Tbl_LSR_Priorities P
				Left JOIN Tbl_LSR_Candidates C ON
				P.ID_Candidate = c.ID_Candidate
		WHERE	Priority_Number = 2  AND P.ID_Component = 17
		AND		C.ID_CFA = @ID_CFA
		GROUP BY P.ID_Component) AS [SSD p.2]
	END




GO


