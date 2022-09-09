use LSR
select * from dbo.Tbl_LSR_Specific_Position 
where Specific_Position_Reference = N'EKLS 10146'



USE [LSR]
SELECT    * from dbo.Tbl_LSR_Panels where ID_CFA = 14 and Panel = 'EKLS 10173'  --ID_Panel = 324

SELECT * from Tbl_LSR_Specific_Position where ID_Specific_Position = 4469
select * from Tbl_LSR_Panels_SpecificPositions where ID_Panel = 324


SELECT     dbo.Tbl_LSR_Panels.ID_CFA, dbo.Tbl_LSR_Panels_SpecificPositions.ID_Panel,dbo.Tbl_LSR_Panels.Panel, dbo.Tbl_LSR_Panels_SpecificPositions.ID_SpecificPosition_Panel, dbo.Tbl_LSR_Specific_Position.Specific_Position_Reference, dbo.Tbl_LSR_Panels_SpecificPositions.ID_Specific_Position,
                      dbo.Tbl_LSR_Specific_Position.Specific_Position_Title  
                      
FROM         dbo.Tbl_LSR_Panels_SpecificPositions INNER JOIN
                      dbo.Tbl_LSR_Panels ON dbo.Tbl_LSR_Panels_SpecificPositions.ID_Panel = dbo.Tbl_LSR_Panels.ID_Panel INNER JOIN
                      dbo.Tbl_LSR_Specific_Position ON dbo.Tbl_LSR_Panels_SpecificPositions.ID_Specific_Position = dbo.Tbl_LSR_Specific_Position.ID_Specific_Position
WHERE     (dbo.Tbl_LSR_Panels.ID_CFA = 14) 
ORDER BY dbo.Tbl_LSR_Panels.Panel ASC


select * from dbo.Tbl_LSR_Interviews_Candidates



SELECT distinct    dbo.Tbl_LSR_Panels_SpecificPositions.ID_Panel, dbo.Tbl_LSR_Panels.ID_CFA, dbo.Tbl_LSR_Panels.Panel, dbo.Tbl_LSR_Specific_Position.Specific_Position_Reference, 
                      dbo.Tbl_LSR_Specific_Position.Specific_Position_Title,  
                      dbo.Tbl_LSR_Panels_SpecificPositions.ID_Specific_Position, dbo.Tbl_LSR_Panels_SpecificPositions.ID_SpecificPosition_Panel, 
                      dbo.Tbl_LSR_Panel_Members.ID_User, dbo.Tbl_LSR_Users.FirstName, dbo.Tbl_LSR_Users.LastName
FROM         dbo.Tbl_LSR_Panels_SpecificPositions INNER JOIN
                      dbo.Tbl_LSR_Panels ON dbo.Tbl_LSR_Panels_SpecificPositions.ID_Panel = dbo.Tbl_LSR_Panels.ID_Panel INNER JOIN
                      dbo.Tbl_LSR_Specific_Position ON dbo.Tbl_LSR_Panels_SpecificPositions.ID_Specific_Position = dbo.Tbl_LSR_Specific_Position.ID_Specific_Position INNER JOIN
                      dbo.Tbl_LSR_Panel_Members ON dbo.Tbl_LSR_Panels_SpecificPositions.ID_Panel = dbo.Tbl_LSR_Panel_Members.ID_Panel INNER JOIN
                      dbo.Tbl_LSR_Users ON dbo.Tbl_LSR_Panel_Members.ID_User = dbo.Tbl_LSR_Users.UserID
WHERE     (dbo.Tbl_LSR_Panels.ID_CFA = 14) and (dbo.Tbl_LSR_Panels.Panel <> Tbl_LSR_Specific_Position.Specific_Position_Reference)

--Needed: ID_Specific_Position, Specific_Position_Reference to be updated- be the same with the Panel code

SELECT 	 ID_Specific_Position
	,Specific_Position_Reference
	--,Specific_Position_Title

FROM 	 Tbl_LSR_Specific_Position 

WHERE 	ID_Specific_Position IN 
(SELECT ID_Specific_Position FROM Tbl_LSR_Panels_SpecificPositions WHERE ID_Panel = 299)



SELECT	DISTINCT Tbl_LSR_Specific_Position.ID_Specific_Position
	,Tbl_LSR_Specific_Position.Specific_Position_Reference
	,Tbl_LSR_Specific_Position.Specific_Position_Title
	,(SELECT Component FROM Tbl_LSR_L_Components 
	  WHERE Tbl_LSR_L_Components.ID_Component = Tbl_LSR_Specific_Position.ID_Component) AS Component
	,(SELECT Region FROM Tbl_LSR_L_Regions 
	  WHERE Tbl_LSR_L_Regions.ID_Region = Tbl_LSR_Specific_Position.ID_Region) AS Region
	,Tbl_LSR_Specific_Position.remaining
	,Tbl_LSR_Panels_SpecificPositions.ID_Priority
	,Tbl_LSR_Specific_Position.ID_Component--
	,Tbl_LSR_Specific_Position.ID_Region--
	
FROM    Tbl_LSR_Panels LEFT OUTER JOIN
	Tbl_LSR_Panels_SpecificPositions ON Tbl_LSR_Panels.ID_Panel = Tbl_LSR_Panels_SpecificPositions.ID_Panel LEFT OUTER JOIN
	Tbl_LSR_Specific_Position ON Tbl_LSR_Panels_SpecificPositions.ID_Specific_Position = Tbl_LSR_Specific_Position.ID_Specific_Position

WHERE 	Tbl_LSR_Panels_SpecificPositions.ID_Panel = 324
AND	Tbl_LSR_Panels_SpecificPositions.ID_Specific_Position = 4493
