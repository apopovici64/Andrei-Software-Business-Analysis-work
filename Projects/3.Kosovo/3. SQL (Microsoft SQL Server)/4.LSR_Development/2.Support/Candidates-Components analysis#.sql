select name from sys.tables where object_id in (select object_id from sys.columns where name = 'ID_CFA')
select * from Tbl_LSR_Candidates   --ID_Candidate, ID_CFA
select * from Tbl_LSR_L_Adv_Positions --ID_CFA, ID_Adv_Position
select * from Tbl_LSR_Checked_in_Candidates  --ID_Position, ID_CFA
select * from Candidates_H
select * from Tbl_LSR_CFA
select * from JD

select name from sys.tables where object_id in (select object_id from sys.columns where name = 'ID_Adv_Position')
select * from Tbl_LSR_Candidates

select name from sys.tables where object_id in (select object_id from sys.columns where name = 'ID_Candidate')
select * from Tbl_LSR_Priorities
select * from Tbl_LSR_L_Components
select * from Tbl_LSR_Adv_Position_Component
select * from Tbl_LSR_Specific_Position    --ID_Specific_Position


select * from sys.columns where name = 'ID_CFA'


select * from Tbl_LSR_Candidates where ID_CFA = 3

select max(ID_CFA) from Tbl_LSR_Candidates


select * from Tbl_LSR_L_Adv_Positions


select max(ID_CFA) from Tbl_LSR_L_Adv_Positions


select * from Tbl_LSR_CFA

--Components, Departments, Units
select name from sys.tables where object_id in (select object_id from sys.columns where name = 'ID_Component')

select name from sys.tables where object_id in (select object_id from sys.columns where name like '%department')

select max(ID_Component) from Tbl_LSR_Priorities
select max(ID_Component) from Tbl_LSR_Specific_Position


--abnormal values for ID_CFA beyond 18 ?????
select count(ID_Candidate), ID_CFA from Tbl_LSR_Candidates 
group by ID_CFA  --max(ID_CFA)

select * from Tbl_LSR_Candidates
where ID_CFA > 18
order by ID_CFA asc

select max(ID_Component) from Tbl_LSR_Specific_Position

SELECT * FROM Tbl_LSR_Priorities P   -- max(ID_Component)
			Left JOIN Tbl_LSR_Candidates C ON
			P.ID_Candidate = C.ID_Candidate
WHERE	C.ID_CFA = 12--Priority_Number = 1  AND P.ID_Component = 2
                     --AND		C.ID_CFA = 13--@ID_CFA

SELECT * FROM Tbl_LSR_Specific_Position P   -- max(ID_Component)
			Left JOIN Tbl_LSR_L_Components C ON
			P.ID_Component = C.ID_Component
			--Left JOIN Tbl_LSR_L_Components C ON


--WHERE	C.ID_CFA = 12--Priority_Number = 1  AND P.ID_Component = 2
ORDER BY C.ID_Component


--Number of candidates (applications) per positon
select name from sys.tables where object_id in (select object_id from sys.columns where name = 'ID_CFA')
select * from Tbl_LSR_Candidates   --ID_Candidate, ID_CFA, ID_Gender
select * from Tbl_LSR_L_Adv_Positions --ID_CFA, ID_Adv_Position, Adv_Position_Reference
select * from Tbl_LSR_Checked_in_Candidates order by ID_Position  --ID_Position, ID_CFA
select * from Candidates_H
select * from Tbl_LSR_CFA
select * from JD

select name from sys.tables where object_id in (select object_id from sys.columns where name = 'ID_Adv_Position')
select * from Tbl_LSR_Candidates  --ID_Candidate, ID_CFA, , ID_Gender, 

select name from sys.tables where object_id in (select object_id from sys.columns where name = 'ID_Candidate')
select * from Tbl_LSR_Priorities
select * from Tbl_LSR_L_Components
select * from Tbl_LSR_Adv_Position_Component
select * from Tbl_LSR_Specific_Position order by ID_Specific_Position     --ID_Specific_Position, Specific_Position_Reference

select name from sys.tables where object_id in (select object_id from sys.columns where name = 'ID_Specific_Position')
select * from Tbl_LSR_Adv_Specific_Position  --ID_Specific_Position, ID_Position_Adv_Comp_reg



SELECT     count(ID_Candidate), Adv_Position_Reference
FROM         Tbl_LSR_Candidates INNER JOIN
                      Tbl_LSR_L_Adv_Positions ON Tbl_LSR_Candidates.ID_CFA = Tbl_LSR_L_Adv_Positions.ID_CFA
group by Adv_Position_Reference
                      
ORDER BY ID_CFA ASC


--applications by CFA, Gender, Position
SELECT     TOP (100) PERCENT dbo.Tbl_LSR_Candidates.ID_CFA, dbo.Tbl_LSR_L_Gender.Gender, COUNT(dbo.Tbl_LSR_Candidates.ID_Candidate) AS [Number of Applications], 
                      LSR.dbo.Tbl_LSR_L_Adv_Positions.Adv_Position_Reference, LSR.dbo.Tbl_LSR_L_Adv_Positions.Adv_Position_Title, dbo.Tbl_LSR_Priorities.Priority_Number
FROM         dbo.Tbl_LSR_Candidates INNER JOIN
                      dbo.Tbl_LSR_L_Gender ON dbo.Tbl_LSR_Candidates.ID_Gender = dbo.Tbl_LSR_L_Gender.ID_Gender INNER JOIN
                      dbo.Tbl_LSR_Priorities ON dbo.Tbl_LSR_Candidates.ID_Candidate = dbo.Tbl_LSR_Priorities.ID_Candidate INNER JOIN
                      LSR.dbo.Tbl_LSR_L_Adv_Positions ON dbo.Tbl_LSR_Priorities.ID_Adv_Position = LSR.dbo.Tbl_LSR_L_Adv_Positions.ID_Adv_Position
GROUP BY dbo.Tbl_LSR_Candidates.ID_CFA, dbo.Tbl_LSR_L_Gender.Gender, LSR.dbo.Tbl_LSR_L_Adv_Positions.Adv_Position_Reference, 
                      LSR.dbo.Tbl_LSR_L_Adv_Positions.Adv_Position_Title, dbo.Tbl_LSR_Priorities.Priority_Number
ORDER BY dbo.Tbl_LSR_Candidates.ID_CFA, LSR.dbo.Tbl_LSR_L_Adv_Positions.Adv_Position_Reference                      









