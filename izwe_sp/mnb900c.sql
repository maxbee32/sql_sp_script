USE [Ghana_BOG]
GO
/****** Object:  StoredProcedure [dbo].[spBOG_MNB900c]    Script Date: 1/29/2024 1:27:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[spBOG_MNB900c]

@AsAtDate date = NULL

AS 

CREATE TABLE #MNB900c 
(
  headerId int,
  CurrentLoans  money,
  OLEM money,
  SubStandard money,
  Doubtful money,
  Loss money,
  Submission_Period date
)


--Previous balance
INSERT INTO #MNB900c
--payroll loans start
Select '1' headerId,
Case When [Past Due Band] in ('Current Portfolio','Due 1 to < 30 days') Then Present_Value Else 0 End As CurrentLoans,
Case When [Past Due Band] in ('Due 30 to < 90 days') Then Present_Value Else 0 End As OLEM,
Case When [Past Due Band] in ('Due 90 to < 180 Days') Then Present_Value Else 0 End As SubStandard,
Case When [Past Due Band] in ('Due 180 to < 12 months') Then Present_Value Else 0 End As Doubtful,
Case When [Past Due Band] in ('Due 12 and above') Then Present_Value Else 0 End As Loss,
@AsAtDate Submission_Period
from Loans where Submission_Period = DATEADD(MONTH, DATEDIFF(MONTH, -1, @AsAtDate)-1, -1) and Present_Value>0 and [Book Type] = 'Ghana Book 1'


--payroll loans end
UNION ALL

--c4c cube loans begin
Select '1' headerId,
Case When [Past Due Band] in ('Current Portfolio','Due 1 to < 30 days') Then Present_Value Else 0 End As CurrentLoans,
Case When [Past Due Band] in ('Due 30 to < 90 days') Then Present_Value Else 0 End As OLEM,
Case When [Past Due Band] in ('Due 30 to < 90 days','Due 90 to < 180 Days') Then Present_Value Else 0 End As SubStandard,
Case When [Past Due Band] in ('Due 180 to < 12 months') Then Present_Value Else 0 End As Doubtful,
Case When [Past Due Band] in ('Due 12 and above') Then Present_Value Else 0 End As Loss,
@AsAtDate Submission_Period from [C4C Loans Cube New] where Submission_Period =DATEADD(MONTH, DATEDIFF(MONTH, -1, @AsAtDate)-1, -1) and Present_Value>0 and [Book Type] = 'Ghana Book 1'
 --changed from C4C Loans Cube New to C4C Loans Cube from March 2022
 --changed from C4C Loans Cube to C4C Loans Cube New from November 2022
--c4c cube loans end

--Staff loans Start
UNION ALL

SELECT HeaderId,CASE WHEN Date_Diff between 1 and 30 then [Principal Balance] ELSE 0 End As CurrentLoans,
0 OLEM,
CASE WHEN Date_Diff between 31 and 180 then [Principal Balance]  ELSE 0 END AS SubStandard,
CASE WHEN Date_Diff between 181 and 365 then [Principal Balance]  ELSE 0 EnD AS Doubtful,
CASE WHEN Date_Diff not between 1 and 365 then [Principal Balance]  ELSE 0 END AS Loss,
Submission_Period

FROM (
Select'1'HeaderId,DATEDIFF(day,[Loan Disbursement Date],[Date of Last Actual Principal Repayment])Date_Diff,
[Principal Balance],
@AsAtDate Submission_Period
from [Staff Loan] where Submission_Period = DATEADD(MONTH, DATEDIFF(MONTH, -1, @AsAtDate)-1, -1)
)B
--staff Loans end

--New Advances
INSERT INTO #MNB900c
 Select HeaderId, Present_Value, 0 OLEM, 0 SubStandard, 0 Doubtful, 0 Loss,@AsAtDate Submission_Period from (
--payroll loans
Select '2' HeaderId ,[Account No], Firstname,Surname,Gender,[Collection mechanism],[Employer Name],Loan_Amount,
[Net Loan Amount],Effective_Date,Present_Value
from Loans where Submission_Period = @AsAtDate--CAST(DATEADD(s,-1,DATEADD(mm, DATEDIFF(m,0,@AsAtDate)+2,0)) as date)
and Effective_Date between DATEADD(dd,1,EOMONTH(@AsAtDate,-1)) and @AsAtDate
--payroll loans end
UNION ALL
--C4C loans cube
Select '2' HeaderId , [Account No],Firstname,Surname, 'Male'Gender,''collection_mechanism,[Employer Name],
Loan_Amount,[Net Loan Amount],Effective_Date,Present_Value
from [C4C Loans Cube New] where Submission_Period =@AsAtDate
and Effective_Date between DATEADD(dd,1,EOMONTH(@AsAtDate,-1)) and @AsAtDate
 --changed from C4C Loans Cube New to C4C Loans Cube from March 2022
 --changed from C4C Loans Cube to C4C Loans Cube New from November 2022
--C4C loans cube ends
UNION ALL
--Staff Loans start
Select '2' headerId,[Account number], [First Name],Surname,Gender,''collection_mechanism, [Customer ID],
[Loan Amount],0 [Net Loan Amount], [Loan Disbursement Date],[Principal Balance]
from [Staff loan] where Submission_Period =@AsAtDate
and [Loan Disbursement Date] between  DATEADD(dd,1,EOMONTH(@AsAtDate,-1)) and @AsAtDate
--Staff Loans ends

)N


DELETE FROM MNB900_Advances_Detail Where Submission_Period =@AsAtDate
INSERT INTO MNB900_Advances_Detail


Select headerId, SUM (CurrentLoans)CurrentLoans,SUM( OLEM)OLEM,SUM( SubStandard)SubStandard, 
SUM(Doubtful)Doubtful, SUM(Loss)Loss, Submission_Period from #MNB900c
group by headerId, Submission_Period


