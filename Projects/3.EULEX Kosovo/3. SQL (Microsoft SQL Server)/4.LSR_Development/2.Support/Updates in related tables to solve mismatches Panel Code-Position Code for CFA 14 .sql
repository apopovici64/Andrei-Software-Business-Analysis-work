--Updates in related tables to solve mismatches Panel Code-Position Code for CFA 14 

--ID_Panel, ID_Specific_Positions to be updated for CFA = 14
SELECT     dbo.Tbl_LSR_Panels.ID_CFA, dbo.Tbl_LSR_Panels_SpecificPositions.ID_Panel,dbo.Tbl_LSR_Panels.Panel as Panel, dbo.Tbl_LSR_Panels_SpecificPositions.ID_SpecificPosition_Panel, dbo.Tbl_LSR_Specific_Position.Specific_Position_Reference, dbo.Tbl_LSR_Panels_SpecificPositions.ID_Specific_Position,
                      dbo.Tbl_LSR_Specific_Position.Specific_Position_Title  
                      
FROM         dbo.Tbl_LSR_Panels_SpecificPositions INNER JOIN
                      dbo.Tbl_LSR_Panels ON dbo.Tbl_LSR_Panels_SpecificPositions.ID_Panel = dbo.Tbl_LSR_Panels.ID_Panel INNER JOIN
                      dbo.Tbl_LSR_Specific_Position ON dbo.Tbl_LSR_Panels_SpecificPositions.ID_Specific_Position = dbo.Tbl_LSR_Specific_Position.ID_Specific_Position
WHERE     (dbo.Tbl_LSR_Panels.ID_CFA = 14) and (Panel in
('EKLS 10173'
,'EKLS 10181'
,'EKLS 10182'
,'EKLS 10183'
,'EKLS 10184'
,'EKLS 10186'
,'EKLS 10188'))
ORDER BY dbo.Tbl_LSR_Panels.Panel ASC

--Panels in (324
--325
--328
--333
--330
--332
--331)

--1. Panel 324, ID_Specific_Position(Old) = 4469-Generator Mechanic, ID_Specific_Position(New) = 5209 -Carpenter

--ID_Specific_Position(Old) = 4469-
SELECT	DISTINCT Tbl_LSR_Specific_Position.ID_Specific_Position
	,Tbl_LSR_Specific_Position.Specific_Position_Reference
	,Tbl_LSR_Specific_Position.Specific_Position_Title
	,(SELECT Component FROM Tbl_LSR_L_Components 
	  WHERE Tbl_LSR_L_Components.ID_Component = Tbl_LSR_Specific_Position.ID_Component) AS Component
	,(SELECT Region FROM Tbl_LSR_L_Regions 
	  WHERE Tbl_LSR_L_Regions.ID_Region = Tbl_LSR_Specific_Position.ID_Region) AS Region
	,Tbl_LSR_Specific_Position.Number_Vacancies
	,Tbl_LSR_Panels_SpecificPositions.ID_Priority
	,Tbl_LSR_Specific_Position.ID_Component--
	,Tbl_LSR_Specific_Position.ID_Region--
	
FROM    Tbl_LSR_Panels LEFT OUTER JOIN
	Tbl_LSR_Panels_SpecificPositions ON Tbl_LSR_Panels.ID_Panel = Tbl_LSR_Panels_SpecificPositions.ID_Panel LEFT OUTER JOIN
	Tbl_LSR_Specific_Position ON Tbl_LSR_Panels_SpecificPositions.ID_Specific_Position = Tbl_LSR_Specific_Position.ID_Specific_Position

WHERE 	Tbl_LSR_Panels_SpecificPositions.ID_Panel = 324

--2. Panel 325, ID_Specific_Position(Old) = 4471-Central Heating Operator, ID_Specific_Position(New) = 5096-Generator Mechanic

--ID_Specific_Position(Old) = 4471-Central Heating Operator
SELECT	DISTINCT Tbl_LSR_Specific_Position.ID_Specific_Position
	,Tbl_LSR_Specific_Position.Specific_Position_Reference
	,Tbl_LSR_Specific_Position.Specific_Position_Title
	,(SELECT Component FROM Tbl_LSR_L_Components 
	  WHERE Tbl_LSR_L_Components.ID_Component = Tbl_LSR_Specific_Position.ID_Component) AS Component
	,(SELECT Region FROM Tbl_LSR_L_Regions 
	  WHERE Tbl_LSR_L_Regions.ID_Region = Tbl_LSR_Specific_Position.ID_Region) AS Region
	,Tbl_LSR_Specific_Position.Number_Vacancies
	,Tbl_LSR_Panels_SpecificPositions.ID_Priority
	,Tbl_LSR_Specific_Position.ID_Component--
	,Tbl_LSR_Specific_Position.ID_Region--
	
FROM    Tbl_LSR_Panels LEFT OUTER JOIN
	Tbl_LSR_Panels_SpecificPositions ON Tbl_LSR_Panels.ID_Panel = Tbl_LSR_Panels_SpecificPositions.ID_Panel LEFT OUTER JOIN
	Tbl_LSR_Specific_Position ON Tbl_LSR_Panels_SpecificPositions.ID_Specific_Position = Tbl_LSR_Specific_Position.ID_Specific_Position

WHERE 	Tbl_LSR_Panels_SpecificPositions.ID_Panel = 325



--ID_Specific_Position (New)= 5096-Generator Mechanic
SELECT 	 *
FROM 	 Tbl_LSR_Specific_Position 
WHERE 	Specific_Position_Reference ='EKLS 10181'

--2.Panel 325, ID_Specific_Position(Old) = 4471-Central Heating Operator, ID_Specific_Position(New) = 5096-Generator Mechanic
--3.Panel 328, ID_Specific_Position(Old) = 4472-Cleaner, ID_Specific_Position(New) = 5097-Plumber

--ID_Specific_Position(Old) = 4472-Cleaner
SELECT	DISTINCT Tbl_LSR_Specific_Position.ID_Specific_Position
	,Tbl_LSR_Specific_Position.Specific_Position_Reference
	,Tbl_LSR_Specific_Position.Specific_Position_Title
	,(SELECT Component FROM Tbl_LSR_L_Components 
	  WHERE Tbl_LSR_L_Components.ID_Component = Tbl_LSR_Specific_Position.ID_Component) AS Component
	,(SELECT Region FROM Tbl_LSR_L_Regions 
	  WHERE Tbl_LSR_L_Regions.ID_Region = Tbl_LSR_Specific_Position.ID_Region) AS Region
	,Tbl_LSR_Specific_Position.Number_Vacancies
	,Tbl_LSR_Panels_SpecificPositions.ID_Priority
	,Tbl_LSR_Specific_Position.ID_Component--
	,Tbl_LSR_Specific_Position.ID_Region--
	
FROM    Tbl_LSR_Panels LEFT OUTER JOIN
	Tbl_LSR_Panels_SpecificPositions ON Tbl_LSR_Panels.ID_Panel = Tbl_LSR_Panels_SpecificPositions.ID_Panel LEFT OUTER JOIN
	Tbl_LSR_Specific_Position ON Tbl_LSR_Panels_SpecificPositions.ID_Specific_Position = Tbl_LSR_Specific_Position.ID_Specific_Position

WHERE 	Tbl_LSR_Panels_SpecificPositions.ID_Panel = 328


--ID_Specific_Position (New)= 5097-Plumber
SELECT 	 *
FROM 	 Tbl_LSR_Specific_Position 
WHERE 	Specific_Position_Reference ='EKLS 10182'


--2. Panel 325, ID_Specific_Position(Old) = 4471-Central Heating Operator, ID_Specific_Position(New) = 5096-Generator Mechanic
--3.Panel 328, ID_Specific_Position(Old) = 4472-Cleaner, ID_Specific_Position(New) = 5097-Plumber
--4.Panel 333, ID_Specific_Position(Old) = 4473-Administrative/Language Assistant (Albanian/English), ID_Specific_Position(New) = 5098-Regional Human Resources / Finance Assistant

--ID_Specific_Position(Old) = 4473-Administrative/Language Assistant (Albanian/English)
SELECT	DISTINCT Tbl_LSR_Specific_Position.ID_Specific_Position
	,Tbl_LSR_Specific_Position.Specific_Position_Reference
	,Tbl_LSR_Specific_Position.Specific_Position_Title
	,(SELECT Component FROM Tbl_LSR_L_Components 
	  WHERE Tbl_LSR_L_Components.ID_Component = Tbl_LSR_Specific_Position.ID_Component) AS Component
	,(SELECT Region FROM Tbl_LSR_L_Regions 
	  WHERE Tbl_LSR_L_Regions.ID_Region = Tbl_LSR_Specific_Position.ID_Region) AS Region
	,Tbl_LSR_Specific_Position.Number_Vacancies
	,Tbl_LSR_Panels_SpecificPositions.ID_Priority
	,Tbl_LSR_Specific_Position.ID_Component--
	,Tbl_LSR_Specific_Position.ID_Region--
	
FROM    Tbl_LSR_Panels LEFT OUTER JOIN
	Tbl_LSR_Panels_SpecificPositions ON Tbl_LSR_Panels.ID_Panel = Tbl_LSR_Panels_SpecificPositions.ID_Panel LEFT OUTER JOIN
	Tbl_LSR_Specific_Position ON Tbl_LSR_Panels_SpecificPositions.ID_Specific_Position = Tbl_LSR_Specific_Position.ID_Specific_Position

WHERE 	Tbl_LSR_Panels_SpecificPositions.ID_Panel = 333


--ID_Specific_Position (New)= 5098-Regional Human Resources / Finance Assistant
SELECT 	 *
FROM 	 Tbl_LSR_Specific_Position 
WHERE 	Specific_Position_Reference ='EKLS 10183'


--2. Panel 325, ID_Specific_Position(Old) = 4471-Central Heating Operator, ID_Specific_Position(New) = 5096-Generator Mechanic
--3.Panel 328, ID_Specific_Position(Old) = 4472-Cleaner, ID_Specific_Position(New) = 5097-Plumber
--4.Panel 333, ID_Specific_Position(Old) = 4473-Administrative/Language Assistant (Albanian/English), ID_Specific_Position(New) = 5098-Regional Human Resources / Finance Assistant
--5.Panel 330, ID_Specific_Position(Old) = 4474-Transport/Fuel Supply Assistant, ID_Specific_Position(New) = 5099-Regional Logistics Assistant

--ID_Specific_Position(Old) = 4474-Transport/Fuel Supply Assistant
SELECT	DISTINCT Tbl_LSR_Specific_Position.ID_Specific_Position
	,Tbl_LSR_Specific_Position.Specific_Position_Reference
	,Tbl_LSR_Specific_Position.Specific_Position_Title
	,(SELECT Component FROM Tbl_LSR_L_Components 
	  WHERE Tbl_LSR_L_Components.ID_Component = Tbl_LSR_Specific_Position.ID_Component) AS Component
	,(SELECT Region FROM Tbl_LSR_L_Regions 
	  WHERE Tbl_LSR_L_Regions.ID_Region = Tbl_LSR_Specific_Position.ID_Region) AS Region
	,Tbl_LSR_Specific_Position.Number_Vacancies
	,Tbl_LSR_Panels_SpecificPositions.ID_Priority
	,Tbl_LSR_Specific_Position.ID_Component--
	,Tbl_LSR_Specific_Position.ID_Region--
	
FROM    Tbl_LSR_Panels LEFT OUTER JOIN
	Tbl_LSR_Panels_SpecificPositions ON Tbl_LSR_Panels.ID_Panel = Tbl_LSR_Panels_SpecificPositions.ID_Panel LEFT OUTER JOIN
	Tbl_LSR_Specific_Position ON Tbl_LSR_Panels_SpecificPositions.ID_Specific_Position = Tbl_LSR_Specific_Position.ID_Specific_Position

WHERE 	Tbl_LSR_Panels_SpecificPositions.ID_Panel = 330



--ID_Specific_Position (New)= 5099-Regional Logistics Assistant
SELECT 	 *
FROM 	 Tbl_LSR_Specific_Position 
WHERE 	Specific_Position_Reference ='EKLS 10184'

--2. Panel 325, ID_Specific_Position(Old) = 4471-Central Heating Operator, ID_Specific_Position(New) = 5096-Generator Mechanic
--3.Panel 328, ID_Specific_Position(Old) = 4472-Cleaner, ID_Specific_Position(New) = 5097-Plumber
--4.Panel 333, ID_Specific_Position(Old) = 4473-Administrative/Language Assistant (Albanian/English), ID_Specific_Position(New) = 5098-Regional Human Resources / Finance Assistant
--5.Panel 330, ID_Specific_Position(Old) = 4474-Transport/Fuel Supply Assistant, ID_Specific_Position(New) = 5099-Regional Logistics Assistant
--6.Panel 332, ID_Specific_Position(Old) = 4475-Logistics Assistant, 5101-IT Technician or Communications Technician

--ID_Specific_Position(Old) = 4475-Logistics Assistant
SELECT	DISTINCT Tbl_LSR_Specific_Position.ID_Specific_Position
	,Tbl_LSR_Specific_Position.Specific_Position_Reference
	,Tbl_LSR_Specific_Position.Specific_Position_Title
	,(SELECT Component FROM Tbl_LSR_L_Components 
	  WHERE Tbl_LSR_L_Components.ID_Component = Tbl_LSR_Specific_Position.ID_Component) AS Component
	,(SELECT Region FROM Tbl_LSR_L_Regions 
	  WHERE Tbl_LSR_L_Regions.ID_Region = Tbl_LSR_Specific_Position.ID_Region) AS Region
	,Tbl_LSR_Specific_Position.Number_Vacancies
	,Tbl_LSR_Panels_SpecificPositions.ID_Priority
	,Tbl_LSR_Specific_Position.ID_Component--
	,Tbl_LSR_Specific_Position.ID_Region--
	
FROM    Tbl_LSR_Panels LEFT OUTER JOIN
	Tbl_LSR_Panels_SpecificPositions ON Tbl_LSR_Panels.ID_Panel = Tbl_LSR_Panels_SpecificPositions.ID_Panel LEFT OUTER JOIN
	Tbl_LSR_Specific_Position ON Tbl_LSR_Panels_SpecificPositions.ID_Specific_Position = Tbl_LSR_Specific_Position.ID_Specific_Position

WHERE 	Tbl_LSR_Panels_SpecificPositions.ID_Panel = 332


--ID_Specific_Position (New)= 5101-IT Technician or Communications Technician
SELECT 	 *
FROM 	 Tbl_LSR_Specific_Position 
WHERE 	Specific_Position_Reference ='EKLS 10186'

--2. Panel 325, ID_Specific_Position(Old) = 4471-Central Heating Operator, ID_Specific_Position(New) = 5096-Generator Mechanic
--3.Panel 328, ID_Specific_Position(Old) = 4472-Cleaner, ID_Specific_Position(New) = 5097-Plumber
--4.Panel 333, ID_Specific_Position(Old) = 4473-Administrative/Language Assistant (Albanian/English), ID_Specific_Position(New) = 5098-Regional Human Resources / Finance Assistant
--5.Panel 330, ID_Specific_Position(Old) = 4474-Transport/Fuel Supply Assistant, ID_Specific_Position(New) = 5099-Regional Logistics Assistant
--6.Panel 332, ID_Specific_Position(Old) = 4475-Logistics Assistant, 5101-IT Technician or Communications Technician
--7.Panel 331, ID_Specific_Position(Old) = 4476-Inventory Officer, ID_Specific_Position(New) = 5102-Vehicle Workshop Technician

--ID_Specific_Position(Old) = 4476-Inventory Officer
SELECT	DISTINCT Tbl_LSR_Specific_Position.ID_Specific_Position
	,Tbl_LSR_Specific_Position.Specific_Position_Reference
	,Tbl_LSR_Specific_Position.Specific_Position_Title
	,(SELECT Component FROM Tbl_LSR_L_Components 
	  WHERE Tbl_LSR_L_Components.ID_Component = Tbl_LSR_Specific_Position.ID_Component) AS Component
	,(SELECT Region FROM Tbl_LSR_L_Regions 
	  WHERE Tbl_LSR_L_Regions.ID_Region = Tbl_LSR_Specific_Position.ID_Region) AS Region
	,Tbl_LSR_Specific_Position.Number_Vacancies
	,Tbl_LSR_Panels_SpecificPositions.ID_Priority
	,Tbl_LSR_Specific_Position.ID_Component--
	,Tbl_LSR_Specific_Position.ID_Region--
	
FROM    Tbl_LSR_Panels LEFT OUTER JOIN
	Tbl_LSR_Panels_SpecificPositions ON Tbl_LSR_Panels.ID_Panel = Tbl_LSR_Panels_SpecificPositions.ID_Panel LEFT OUTER JOIN
	Tbl_LSR_Specific_Position ON Tbl_LSR_Panels_SpecificPositions.ID_Specific_Position = Tbl_LSR_Specific_Position.ID_Specific_Position

WHERE 	Tbl_LSR_Panels_SpecificPositions.ID_Panel = 331


--ID_Specific_Position (New)= 5102-Vehicle Workshop Technician
SELECT 	 *
FROM 	 Tbl_LSR_Specific_Position 
WHERE 	Specific_Position_Reference ='EKLS 10188'



--UPDATES1
--update panels with the new ID_Specific_Position to replace the old one
--2. Panel 325, ID_Specific_Position(Old) = 4471-Central Heating Operator, ID_Specific_Position(New) = 5096-Generator Mechanic
--3.Panel 328, ID_Specific_Position(Old) = 4472-Cleaner, ID_Specific_Position(New) = 5097-Plumber
--4.Panel 333, ID_Specific_Position(Old) = 4473-Administrative/Language Assistant (Albanian/English), ID_Specific_Position(New) = 5098-Regional Human Resources / Finance Assistant
--5.Panel 330, ID_Specific_Position(Old) = 4474-Transport/Fuel Supply Assistant, ID_Specific_Position(New) = 5099-Regional Logistics Assistant
--6.Panel 332, ID_Specific_Position(Old) = 4475-Logistics Assistant, 5101-IT Technician or Communications Technician
--7.Panel 331, ID_Specific_Position(Old) = 4476-Inventory Officer, ID_Specific_Position(New) = 5102-Vehicle Workshop Technician

--1.Panel 324, ID_Specific_Position(Old) = 4469-Generator Mechanic, ID_Specific_Position(New) = 5209 -Carpenter
update Tbl_LSR_Panels_SpecificPositions   --reverse for ID_Specific_Position = 4469
set ID_Specific_Position = 5209
where ID_Panel = 324

--2. Panel 325, ID_Specific_Position(Old) = 4471-Central Heating Operator, ID_Specific_Position(New) = 5096-Generator Mechanic
update Tbl_LSR_Panels_SpecificPositions   --reverse for ID_Specific_Position = 4471
set ID_Specific_Position = 5096
where ID_Panel = 325

--3.Panel 328, ID_Specific_Position(Old) = 4472-Cleaner, ID_Specific_Position(New) = 5097-Plumber
update Tbl_LSR_Panels_SpecificPositions   --reverse for ID_Specific_Position = 4472
set ID_Specific_Position = 5097
where ID_Panel = 328

--4.Panel 333, ID_Specific_Position(Old) = 4473-Administrative/Language Assistant (Albanian/English), ID_Specific_Position(New) = 5098-Regional Human Resources / Finance Assistant
update Tbl_LSR_Panels_SpecificPositions   --reverse for ID_Specific_Position = 4473
set ID_Specific_Position = 5098
where ID_Panel = 333

--5.Panel 330, ID_Specific_Position(Old) = 4474-Transport/Fuel Supply Assistant, ID_Specific_Position(New) = 5099-Regional Logistics Assistant
update Tbl_LSR_Panels_SpecificPositions   --reverse for ID_Specific_Position = 4474
set ID_Specific_Position = 5099
where ID_Panel = 330

--6.Panel 332, ID_Specific_Position(Old) = 4475-Logistics Assistant, 5101-IT Technician or Communications Technician
update Tbl_LSR_Panels_SpecificPositions   --reverse for ID_Specific_Position = 4475
set ID_Specific_Position = 5101
where ID_Panel = 332

--7.Panel 331, ID_Specific_Position(Old) = 4476-Inventory Officer, ID_Specific_Position(New) = 5102-Vehicle Workshop Technician
update Tbl_LSR_Panels_SpecificPositions   --reverse for ID_Specific_Position = 4476
set ID_Specific_Position = 5102
where ID_Panel = 331




USE [LSR]
GO
/****** Object:  StoredProcedure [dbo].[proc_GetShortlistStatus_ByPanel]    Script Date: 02/06/2013 19:16:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[proc_GetShortlistStatus_ByPanel]
	(@ID_Specific_Position INT = NULL
	,@ID_Panel INT = NULL
	,@ID_Status INT = NULL
	,@ID_Candidate INT = NULL)
AS

	SELECT	Count(*)
	FROM Tbl_LSR_Shortlisted_Candidates 	
	WHERE 	Tbl_LSR_Shortlisted_Candidates.ID_Specific_Position = @ID_Specific_Position AND
		Tbl_LSR_Shortlisted_Candidates.ID_Member_Panel IN (SELECT ID_Member_Panel FROM Tbl_LSR_Panel_Members WHERE ID_Panel = @ID_Panel) AND
		Tbl_LSR_Shortlisted_Candidates.ID_Status = @ID_Status AND
		ID_Candidate = @ID_Candidate

--UPDATES2
--Modify specific position for the shortlisted candidates
--1.Panel 324-selection of Carpenter, ID_Specific_Position(New) = 5209
	SELECT	*
	FROM Tbl_LSR_Shortlisted_Candidates 	
	WHERE 	Tbl_LSR_Shortlisted_Candidates.ID_Specific_Position = 4469 AND
		Tbl_LSR_Shortlisted_Candidates.ID_Member_Panel IN (SELECT ID_Member_Panel FROM Tbl_LSR_Panel_Members WHERE ID_Panel = 324) 
		
--ID_Candidates shortlisted for the position
select * from dbo.Tbl_LSR_Candidates
where ID_Candidate in (25668
,25677
,25670)

--update shortlisted candidates from old to new position
update Tbl_LSR_Shortlisted_Candidates     --reverse for ID_Specific_Position = 4469 
set ID_Specific_Position = 5209
where ID_Candidate in (25668
,25677
,25670)



--2. Panel 325, ID_Specific_Position(Old) = 4471-Central Heating Operator, ID_Specific_Position(New) = 5096-Generator Mechanic
	SELECT	*
	FROM Tbl_LSR_Shortlisted_Candidates 	
	WHERE 	Tbl_LSR_Shortlisted_Candidates.ID_Specific_Position = 4471 AND
		Tbl_LSR_Shortlisted_Candidates.ID_Member_Panel IN (SELECT ID_Member_Panel FROM Tbl_LSR_Panel_Members WHERE ID_Panel = 325) 
		
--Check names for ID_Candidates shortlisted for the position
select * from dbo.Tbl_LSR_Candidates
where ID_Candidate in (25408
,25411
,25406)

--UPDATE shortlisted candidates from old to new position
update Tbl_LSR_Shortlisted_Candidates     --reverse for ID_Specific_Position = 4471 
set ID_Specific_Position = 5096
where ID_Candidate in (25408
,25411
,25406)



--3.Panel 328, ID_Specific_Position(Old) = 4472-Cleaner, ID_Specific_Position(New) = 5097-Plumber
	SELECT	*
	FROM Tbl_LSR_Shortlisted_Candidates 	
	WHERE 	Tbl_LSR_Shortlisted_Candidates.ID_Specific_Position = 4472 AND
		Tbl_LSR_Shortlisted_Candidates.ID_Member_Panel IN (SELECT ID_Member_Panel FROM Tbl_LSR_Panel_Members WHERE ID_Panel = 328) 
		
--ID_Candidates shortlisted for the position
select * from dbo.Tbl_LSR_Candidates
where ID_Candidate in (25410
,25407
,25567
,25467
,25409)

--update shortlisted candidates from old to new position
update Tbl_LSR_Shortlisted_Candidates     --reverse for ID_Specific_Position = 4472 
set ID_Specific_Position = 5097
where ID_Candidate in (25410
,25407
,25567
,25467
,25409)


--4.Panel 333, ID_Specific_Position(Old) = 4473-Administrative/Language Assistant (Albanian/English), ID_Specific_Position(New) = 5098-Regional Human Resources / Finance Assistant
	SELECT	*
	FROM Tbl_LSR_Shortlisted_Candidates 	
	WHERE 	Tbl_LSR_Shortlisted_Candidates.ID_Specific_Position = 4473 AND
		Tbl_LSR_Shortlisted_Candidates.ID_Member_Panel IN (SELECT ID_Member_Panel FROM Tbl_LSR_Panel_Members WHERE ID_Panel = 333) 
		
--ID_Candidates shortlisted for the position
select * from dbo.Tbl_LSR_Candidates
where ID_Candidate in (25464
,25480
,25602)

--update shortlisted candidates from old to new position
update Tbl_LSR_Shortlisted_Candidates     --reverse for ID_Specific_Position = 4473 
set ID_Specific_Position = 5098
where ID_Candidate in (25464
,25480
,25602)


--5.Panel 330, ID_Specific_Position(Old) = 4474-Transport/Fuel Supply Assistant, ID_Specific_Position(New) = 5099-Regional Logistics Assistant
	SELECT	*
	FROM Tbl_LSR_Shortlisted_Candidates 	
	WHERE 	Tbl_LSR_Shortlisted_Candidates.ID_Specific_Position = 4474 AND
		Tbl_LSR_Shortlisted_Candidates.ID_Member_Panel IN (SELECT ID_Member_Panel FROM Tbl_LSR_Panel_Members WHERE ID_Panel = 330)
		
--ID_Candidates shortlisted for the position
select * from dbo.Tbl_LSR_Candidates
where ID_Candidate in (25394
,25664
,25402
,25414
,25425)

--update shortlisted candidates from old to new position
update Tbl_LSR_Shortlisted_Candidates     --reverse for ID_Specific_Position = 4474 
set ID_Specific_Position = 5099
where ID_Candidate in (25394
,25664
,25402
,25414
,25425)


--6.Panel 332, ID_Specific_Position(Old) = 4475-Logistics Assistant, 5101-IT Technician or Communications Technician
	SELECT	*
	FROM Tbl_LSR_Shortlisted_Candidates 	
	WHERE 	Tbl_LSR_Shortlisted_Candidates.ID_Specific_Position = 4475 AND
		Tbl_LSR_Shortlisted_Candidates.ID_Member_Panel IN (SELECT ID_Member_Panel FROM Tbl_LSR_Panel_Members WHERE ID_Panel = 332) 
		
--ID_Candidates shortlisted for the position
select * from dbo.Tbl_LSR_Candidates
where ID_Candidate in (25457
,25431
,25541
,25447)

--update shortlisted candidates from old to new position
update Tbl_LSR_Shortlisted_Candidates     --reverse for ID_Specific_Position = 4475 
set ID_Specific_Position = 5101
where ID_Candidate in (25457
,25431
,25541
,25447)


--7.Panel 331, ID_Specific_Position(Old) = 4476-Inventory Officer, ID_Specific_Position(New) = 5102-Vehicle Workshop Technician
	SELECT	*
	FROM Tbl_LSR_Shortlisted_Candidates 	
	WHERE 	Tbl_LSR_Shortlisted_Candidates.ID_Specific_Position = 4476 AND
		Tbl_LSR_Shortlisted_Candidates.ID_Member_Panel IN (SELECT ID_Member_Panel FROM Tbl_LSR_Panel_Members WHERE ID_Panel = 331)
		
--ID_Candidates shortlisted for the position
select * from dbo.Tbl_LSR_Candidates
where ID_Candidate in (25454
,25445
,25446
,25662
,25654
,25663)

--update shortlisted candidates from old to new position
update Tbl_LSR_Shortlisted_Candidates     --reverse for ID_Specific_Position = 4476 
set ID_Specific_Position = 5102
where ID_Candidate in (25454
,25445
,25446
,25662
,25654
,25663)

