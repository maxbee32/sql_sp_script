USE [Ghana_BOG]
GO
/****** Object:  StoredProcedure [dbo].[spBOG_MNB103c]    Script Date: 1/29/2024 12:57:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER procedure [dbo].[spBOG_MNB103c]
@AsAtDate  date =NULL
as

CREATE TABLE #MNB103c

(
HeaderId int,
NoOfMaleApplied int,
NoOfMaleAppliedAmt money,
NoOfFemaleApplied int,
NoOfFemaleAppliedAmt money,
NoOfOthersApplied int,
NoOfOthersAppliedAmt money,
SanctionedMaleLoans int,
SanctionedMaleLoansAmt money,
SanctionedFemaleLoans int,
SanctionedFemaleLoansAmt  money,
SanctionedOthersLoans int,
SanctionedOthersLoansAmt money,
RejectedMaleLoans  int,
RejectedMaleLoansAmt money,
RejectedFemaleLoans  int,
RejectedFemaleLoansAmt money,
RejectedOthersLoans int,
RejectedOthersLoansAmt money,
CumulativeMaleLoans int,
CumulativeMaleLoansAmt money,
CumulativeFemaleLoans int,
CumulativeFemaleLoansAmt money,
CumulativeOthersLoans int,
CumulativeOthersLoansAmt money,
Submission_Period date
)

Create Table #Range
	(
		ID					int,
		LowerLimit			money,
		Upperlimit			money
	)


	INSERT INTO #Range VALUES (13, -99999999999, 500)
	INSERT INTO #Range VALUES (14, 500.01, 1000)
	INSERT INTO #Range VALUES (15, 1000.01, 10000)
	INSERT INTO #Range VALUES (16, 10000.01, 100000)
	INSERT INTO #Range VALUES (17, 100000.01, 99999999999)

--Loan Purpose Begins
INSERT INTO #MNB103c
 
SELECT '8'HeaderId,
    CASE WHEN Gender in('Male') THEN 1 ELSE 0 END AS NAppliedMale,
	CASE WHEN Gender in('Male') THEN Loan_Amount ELSE 0  END AS AppliedMale,
	CASE WHEN Gender in('Female') THEN 1 ELSE 0 END AS NAppliedFemale, 
	CASE WHEN Gender  in('Female') THEN Loan_Amount ELSE 0  END AS AppliedFemale,
	CASE WHEN Gender not in('Male','Female') THEN 1 ELSE 0 END AS NAppliedOthers, 
	CASE WHEN Gender not in('Male','Female') THEN Loan_Amount ELSE 0  END AS AppliedOthers,
	CASE WHEN Gender in('Male') THEN 1 ELSE 0 END AS NSanctionedMale,
	CASE WHEN Gender in('Male') THEN Loan_Amount ELSE 0 END AS SanctionedMale,
	CASE WHEN Gender in('Female') THEN 1 ELSE 0 END AS NSanctionedFemale,
	CASE WHEN Gender in('Female') THEN Loan_Amount ELSE 0  END AS SanctionedFemale,
	CASE WHEN Gender not in('Male','Female') THEN 1 ELSE 0 END AS SanctionedOthers, 
	CASE WHEN Gender not in('Male','Female') THEN Loan_Amount ELSE 0  END AS SanctionedOthers,
	0 NRejectedMale, 
	0 RejectedMale,
	0 NRejectedFemale,
	0 RejectedFemale,
	0 NROthers,
	0 Others,
	0 NOutStandingMale,
	0 OutStandingMale,
	0 NOutStandingFemale,
	0 OutStandingFemale,
	0 NOutstandingOthers,
	0 OutstandingOthers,
	@AsAtDate Submission_Period

FROM (
--payroll loans
Select [Account No], Firstname,Surname,Gender,[Collection mechanism],[Employer Name],Loan_Amount,
[Net Loan Amount],Effective_Date,Present_Value
from Loans where Submission_Period = @AsAtDate--CAST(DATEADD(s,-1,DATEADD(mm, DATEDIFF(m,0,@AsAtDate)+2,0)) as date)
and Effective_Date between DATEADD(dd,1,EOMONTH(@AsAtDate,-1)) and @AsAtDate
--payroll loans end
UNION ALL
--C4C loans cube
Select [Account No],Firstname,Surname, 'Male'Gender,''collection_mechanism,[Employer Name],
Loan_Amount,[Net Loan Amount],Effective_Date,Present_Value
from [C4C Loans Cube New] where Submission_Period =@AsAtDate
and Effective_Date between DATEADD(dd,1,EOMONTH(@AsAtDate,-1)) and @AsAtDate
--changed from C4C Loans Cube New to C4C Loans Cube  from March 2022
--changed from C4C Loans Cube to C4C Loans Cube New from November 2022

--C4C loans cube ends
UNION ALL
--Staff Loans start
Select [Account number], [First Name],Surname,Gender,''collection_mechanism, [Customer ID],
[Loan Amount],0 [Net Loan Amount], [Loan Disbursement Date],[Principal Balance]
from [Staff loan] where Submission_Period =@AsAtDate
and [Loan Disbursement Date] between  DATEADD(dd,1,EOMONTH(@AsAtDate,-1)) and @AsAtDate
--Staff Loans ends
UNION ALL
--Landed Property start
Select [Account Number ],[First Name ],[Surname ],[Gender ],''collection_mechanism,[Customer ID ],
[Loan Amount Disbursed ],0 [Net Loan Amount],CONVERT(date,[Date of Approval ])ApprovalDate, [Loan Principal Amount(Without Interest) ]
from [Landed Property] where Submission_Period =@AsAtDate
and [Date of Approval ] between DATEADD(dd,1,EOMONTH(@AsAtDate,-1)) and @AsAtDate
--Landed Property end

UNION ALL
 --Cash Backed Loans Start
  Select ISNULL(TrY_CAST([Account Number] as float),0)CID, ''FirstName,
 ''Surname,'Male'Gender,''Collection_mechanism,ISNULL(TrY_CAST([Account Number] as float),0)CID,
  [Loan Amount],0 Net,[Disbursement Date],Balance
 from [Cash Backed Loans] WHere Submission_Period =@AsAtDate
 And [Disbursement Date] between  DATEADD(dd,1,EOMONTH(@AsAtDate,-1)) and @AsAtDate
  --Cash Backed Loans end


)M

--Loan Purpose end

--Loan Size Begins
INSERT INTO #MNB103c

SELECT #Range.ID, 
	CASE WHEN Gender in('Male') THEN 1 ELSE 0 END AS NAppliedMale,
	CASE WHEN Gender in('Male') THEN Loan_Amount ELSE 0  END AS AppliedMale,
	CASE WHEN Gender in('Female')  THEN 1 ELSE 0 END AS NAppliedFemale, 
	CASE WHEN Gender in('Female') THEN Loan_Amount ELSE 0  END AS AppliedFemale,
     CASE WHEN Gender not in('Male','Female') THEN 1 ELSE 0 END AS NAppliedOthers, 
	CASE WHEN Gender not in('Male','Female') THEN Loan_Amount ELSE 0  END AS AppliedOthers,
	CASE WHEN Gender in('Male') THEN 1 ELSE 0 END AS NSanctionedMale,
	CASE WHEN Gender in('Male') THEN Loan_Amount ELSE 0 END AS SanctionedMale,
	CASE WHEN Gender  in('Female') THEN 1 ELSE 0 END AS NSanctionedFemale,
	CASE WHEN Gender in('Female') THEN Loan_Amount ELSE 0  END AS SanctionedFemale,
	CASE WHEN Gender not in('Male','Female') THEN 1 ELSE 0 END AS SanctionedOthers, 
	CASE WHEN Gender not in('Male','Female') THEN Loan_Amount ELSE 0  END AS SanctionedOthers,
	0 NRejectedMale, 
	0 RejectedMale,
	0 NRejectedFemale,
	0 RejectedFemale,
	0 NRothers,
	0 Rothers,
	0 NOutStandingMale,
	0 OutStandingMale,
	0 NOutStandingFemale,
	0 OutStandingFemale,
	0 NOutstandingOther,
	0 outstandingOther,
	@AsAtDate Submission_Period
	FROM(
--payroll loans
Select [Account No], Firstname,Surname,Gender,[Collection mechanism],[Employer Name],Loan_Amount,
[Net Loan Amount],Effective_Date,Present_Value
from Loans where Submission_Period = @AsAtDate--CAST(DATEADD(s,-1,DATEADD(mm, DATEDIFF(m,0,@AsAtDate)+2,0)) as date)
and Effective_Date between DATEADD(dd,1,EOMONTH(@AsAtDate,-1)) and @AsAtDate
--payroll loans end
UNION ALL
--C4C loans cube
Select [Account No],Firstname,Surname, 'Male'Gender,''collection_mechanism,[Employer Name],
Loan_Amount,[Net Loan Amount],Effective_Date,Present_Value
from [C4C Loans Cube New] where Submission_Period =@AsAtDate
and Effective_Date between DATEADD(dd,1,EOMONTH(@AsAtDate,-1)) and @AsAtDate
--changed from C4C Loans Cube New to C4C Loans Cube  from March 2022
--changed from C4C Loans Cube to C4C Loans Cube New from November 2022
--C4C loans cube ends
UNION ALL
--Staff Loans start
Select [Account number], [First Name],Surname,Gender,''collection_mechanism, [Customer ID],
[Loan Amount],0 [Net Loan Amount], [Loan Disbursement Date],[Principal Balance]
from [Staff loan] where Submission_Period =@AsAtDate
and [Loan Disbursement Date] between  DATEADD(dd,1,EOMONTH(@AsAtDate,-1)) and @AsAtDate
--Staff Loans ends
UNION ALL
--Landed Property start
Select [Account Number ],[First Name ],[Surname ],[Gender ],''collection_mechanism,[Customer ID ],
[Loan Amount Disbursed ],0 [Net Loan Amount],CONVERT(date,[Date of Approval ])ApprovalDate, [Loan Principal Amount(Without Interest) ]
from [Landed Property] where Submission_Period =@AsAtDate
and [Date of Approval ] between DATEADD(dd,1,EOMONTH(@AsAtDate,-1)) and @AsAtDate
--Landed Property end
UNION ALL
 --Cash Backed Loans Start
  Select ISNULL(TrY_CAST([Account Number] as float),0)CID, ''FirstName,
 ''Surname,'Male'Gender,''Collection_mechanism,ISNULL(TrY_CAST([Account Number] as float),0)CID,
  [Loan Amount],0 Net,[Disbursement Date],Balance
 from [Cash Backed Loans] WHere Submission_Period =@AsAtDate
 And [Disbursement Date] between  DATEADD(dd,1,EOMONTH(@AsAtDate,-1)) and @AsAtDate
  --Cash Backed Loans end

)T
INNER JOIN #Range ON Loan_Amount BETWEEN #Range.LowerLimit AND #Range.Upperlimit
--Loan Size ends

--Security Begins
INSERT INTO #MNB103c

Select headerId,
CASE WHEN Gender in('Male') THEN 1 ELSE 0 END AS NAppliedMale,
	CASE WHEN Gender in('Male') THEN Loan_Amount ELSE 0  END AS AppliedMale,
	CASE WHEN Gender  in('Female')  THEN 1 ELSE 0 END AS NAppliedFemale, 
	CASE WHEN Gender  in('Female') THEN Loan_Amount ELSE 0  END AS AppliedFemale,
	CASE WHEN Gender not in('Male','Female') THEN 1 ELSE 0 END AS NAppliedOthers, 
	CASE WHEN Gender not in('Male','Female') THEN Loan_Amount ELSE 0  END AS AppliedOthers,
	CASE WHEN Gender in('Male') THEN 1 ELSE 0 END AS NSanctionedMale,
	CASE WHEN Gender in('Male') THEN Loan_Amount ELSE 0 END AS SanctionedMale,
	CASE WHEN Gender  in('Female') THEN 1 ELSE 0 END AS NSanctionedFemale,
	CASE WHEN Gender  in('Female') THEN Loan_Amount ELSE 0  END AS SanctionedFemale,
	CASE WHEN Gender not in('Male','Female') THEN 1 ELSE 0 END AS SanctionedOthers, 
	CASE WHEN Gender not in('Male','Female') THEN Loan_Amount ELSE 0  END AS SanctionedOthers,
	0 NRejectedMale, 
	0 RejectedMale,
	0 NRejectedFemale,
	0 RejectedFemale,
	0 NRothers,
	0 ROthers,
	0 NOutStandingMale,
	0 OutStandingMale,
	0 NOutStandingFemale,
	0 OutStandingFemale,
	0 NOutstandingOther,
	0 OutstandingOther,
	@AsAtDate Submission_Period
from (
--payroll loans
Select '19' headerId, [Account No], Firstname,Surname,Gender,[Collection mechanism],[Employer Name],Loan_Amount,
[Net Loan Amount],Effective_Date,Present_Value
from Loans where Submission_Period = @AsAtDate--CAST(DATEADD(s,-1,DATEADD(mm, DATEDIFF(m,0,@AsAtDate)+2,0)) as date)
and Effective_Date between DATEADD(dd,1,EOMONTH(@AsAtDate,-1)) and @AsAtDate
--payroll loans end
UNION ALL
--C4C loans cube
Select '18' headerId, [Account No],Firstname,Surname, 'Male'Gender,''collection_mechanism,[Employer Name],
Loan_Amount,[Net Loan Amount],Effective_Date,Present_Value
from [C4C Loans Cube New] where Submission_Period =@AsAtDate
and Effective_Date between DATEADD(dd,1,EOMONTH(@AsAtDate,-1)) and @AsAtDate
--C4C loans cube ends
UNION ALL
--Staff Loans start
Select '18'HeaderId, [Account number], [First Name],Surname,Gender,''collection_mechanism, [Customer ID],
[Loan Amount],0 [Net Loan Amount], [Loan Disbursement Date],[Principal Balance]
from [Staff loan] where Submission_Period =@AsAtDate
and [Loan Disbursement Date] between  DATEADD(dd,1,EOMONTH(@AsAtDate,-1)) and @AsAtDate
--Staff Loans ends

UNION ALL
--Landed Property start
Select '18'headerId,[Account Number ],[First Name ],[Surname ],[Gender ],''collection_mechanism,[Customer ID ],
[Loan Amount Disbursed ],0 [Net Loan Amount],CONVERT(date,[Date of Approval ])ApprovalDate, [Loan Principal Amount(Without Interest) ]
from [Landed Property] where Submission_Period =@AsAtDate
and [Date of Approval ] between DATEADD(dd,1,EOMONTH(@AsAtDate,-1)) and @AsAtDate
--Landed Property end

UNION ALL
 --Cash Backed Loans Start
  Select '18'headerId, ISNULL(TrY_CAST([Account Number] as float),0)CID, ''FirstName,
 ''Surname,'Male'Gender,''Collection_mechanism,ISNULL(TrY_CAST([Account Number] as float),0)CID,
  [Loan Amount],0 Net,[Disbursement Date],Balance
 from [Cash Backed Loans] WHere Submission_Period =@AsAtDate
 And [Disbursement Date] between  DATEADD(dd,1,EOMONTH(@AsAtDate,-1)) and @AsAtDate
  --Cash Backed Loans end
)U
--Security Ends



--Terms Begins
INSERT INTO #MNB103c

Select Case WHen [Loan Term]/ 12 between 0 and 1 then '20'
            When [Loan Term]/ 12 between 1.001 and 5 then '21'
			Else '22' End As HeaderId,
CASE WHEN Gender in('Male') THEN 1 ELSE 0 END AS NAppliedMale,
	CASE WHEN Gender in('Male') THEN Loan_Amount ELSE 0  END AS AppliedMale,
	CASE WHEN Gender  in('Female')  THEN 1 ELSE 0 END AS NAppliedFemale, 
	CASE WHEN Gender in('Female') THEN Loan_Amount ELSE 0  END AS AppliedFemale,
	CASE WHEN Gender not in('Male','Female') THEN 1 ELSE 0 END AS NAppliedOthers, 
	CASE WHEN Gender not in('Male','Female') THEN Loan_Amount ELSE 0  END AS AppliedOthers,
	CASE WHEN Gender in('Male') THEN 1 ELSE 0 END AS NSanctionedMale,
	CASE WHEN Gender in('Male') THEN Loan_Amount ELSE 0 END AS SanctionedMale,
	CASE WHEN Gender not in('Male') THEN 1 ELSE 0 END AS NSanctionedFemale,
	CASE WHEN Gender not in('Male') THEN Loan_Amount ELSE 0  END AS SanctionedFemale,
	CASE WHEN Gender not in('Male','Female') THEN 1 ELSE 0 END AS SanctionedOthers, 
	CASE WHEN Gender not in('Male','Female') THEN Loan_Amount ELSE 0  END AS SanctionedOthers,
	0 NRejectedMale, 
	0 RejectedMale,
	0 NRejectedFemale,
	0 RejectedFemale,
	0 NRothers,
	0 ROthers,
	0 NOutStandingMale,
	0 OutStandingMale,
	0 NOutStandingFemale,
	0 OutStandingFemale,
	0 NOutstandingOther,
	0 OutstandingOther,
	@AsAtDate Submission_Period
from (
--payroll loans
Select [Account No], Firstname,Surname,Gender,[Collection mechanism],[Employer Name],Loan_Amount,
[Net Loan Amount],Effective_Date,Present_Value,[Loan Term]
from Loans where Submission_Period = @AsAtDate--CAST(DATEADD(s,-1,DATEADD(mm, DATEDIFF(m,0,@AsAtDate)+2,0)) as date)
and Effective_Date between DATEADD(dd,1,EOMONTH(@AsAtDate,-1)) and @AsAtDate
--payroll loans end
UNION ALL
--C4C loans cube
Select [Account No],Firstname,Surname, 'Male'Gender,''collection_mechanism,[Employer Name],
Loan_Amount,[Net Loan Amount],Effective_Date,Present_Value,[Loan Term]
from [C4C Loans Cube New] where Submission_Period =@AsAtDate
and Effective_Date between DATEADD(dd,1,EOMONTH(@AsAtDate,-1)) and @AsAtDate
--changed from C4C Loans Cube New to C4C Loans Cube  from March 2022
--changed from C4C Loans Cube to C4C Loans Cube New from November 2022
--C4C loans cube ends
UNION ALL
--Staff Loans start
Select [Account number], [First Name],Surname,Gender,''collection_mechanism, [Customer ID],
[Loan Amount],0 [Net Loan Amount], [Loan Disbursement Date],[Principal Balance],[Number of Payments Agreed]
from [Staff loan] where Submission_Period =@AsAtDate
and [Loan Disbursement Date] between  DATEADD(dd,1,EOMONTH(@AsAtDate,-1)) and @AsAtDate
--Staff Loans ends
UNION ALL
--Landed Property start
Select [Account Number ],[First Name ],[Surname ],[Gender ],''collection_mechanism,[Customer ID ],
[Loan Amount Disbursed ],0 [Net Loan Amount],CONVERT(date,[Date of Approval ])ApprovalDate, [Loan Principal Amount(Without Interest) ],
0 NumberOfPayment
from [Landed Property] where Submission_Period =@AsAtDate
and [Date of Approval ] between DATEADD(dd,1,EOMONTH(@AsAtDate,-1)) and @AsAtDate
--Landed Property end

UNION ALL
 --Cash Backed Loans Start
  Select ISNULL(TrY_CAST([Account Number] as float),0)CID, ''FirstName,
 ''Surname,'Male'Gender,''Collection_mechanism,ISNULL(TrY_CAST([Account Number] as float),0)CID,
  [Loan Amount],0 Net,[Disbursement Date],Balance, 0 NumberOfPayment
 from [Cash Backed Loans] WHere Submission_Period =@AsAtDate
 And [Disbursement Date] between  DATEADD(dd,1,EOMONTH(@AsAtDate,-1)) and @AsAtDate
  --Cash Backed Loans end
)N
--Terms Ends


--Outstanding Balance for Purpose Begins
INSERT INTO #MNB103c

SELECT '8' HeaderId,
	0 NAppliedMale,
    0 AppliedMale,
	0 NAppliedFemale, 
	0 AppliedFemale,
	0 NAppliedOthers,
	0 AppliedOthers,
	0 NSanctionedMale,
	0 SanctionedMale,
	0 NSanctionedFemale,
	0 SanctionedFemale,
	0 NSanctionedOther,
	0 SanctionedOther,
	0 NRejectedMale,
	0 RejectedMale,0 NRejectedFemale, 0 RejectedFemale,0 NRejectedOther, 0 RejectedOther,
	CASE WHEN Gender in('Male') THEN 1 ELSE 0 END AS NOutStandingMale,
	CASE WHEN Gender in('Male') THEN Present_Value ELSE 0  END AS OutStandingMale, 
	CASE WHEN Gender  in('Female') THEN 1 ELSE 0 END AS NOutStandingFemale,
	CASE WHEN Gender  in('Female') THEN Present_Value ELSE 0  END AS OutStandingFemale,
	CASE WHEN Gender  not in('Male','Female') THEN 1 ELSE 0 END AS NOutStandingOther,
	CASE WHEN Gender not in('Male','Female') THEN Present_Value ELSE 0  END AS OutStandingOther,
	@AsAtDate Submission FROM(

SELECT  Gender, Present_Value - total_amount Present_Value,  Loan_Amount, Firstname,Surname, [Employee Number]  FROM (

 select Present_Value, [Employee number], Deduction_amt,[Account No],Gender,Loan_Amount, Firstname,Surname,
       (case 
				when row_number() over (partition by [Employee number] order by [Employee number] ) = 1
             then Deduction_amt
             else 0
        end) as total_amount
		from (
		--Payroll loans start
Select  [Account No], Firstname,Surname,Gender,[Collection mechanism],[Employer Name],Loan_Amount,
[Net Loan Amount], Present_Value, [Employee number],
Y.I,ISNULL(Y.deduction,0) Deduction_amt
from Loans S 
--payroll loans ends
--Controller deduction start
LEFT JOIN 
 (select [EMPLOYEE NO] I, SUM([MONTHLY DED])deduction from [Controller Deduction] Group by [EMPLOYEE NO]
 ) Y
 --Controller deduction end
 ON S.[Employee Number] = Y.I
 where S.Submission_Period =@AsAtDate and Present_Value > 0 and [Book Type] ='Ghana Book 1'

 )U

 
)N
UNION ALL
--C4C Loans cube start
 Select 'Male'Gender, Present_Value,  Loan_Amount, Firstname,Surname, [Employee Number]  
 from [C4C Loans Cube New] where Submission_Period=@AsAtDate and Present_Value>0 and [Book Type] = 'Ghana Book 1'
 --changed from C4C Loans Cube New to C4C Loans Cube  from March 2022
 --changed from C4C Loans Cube to C4C Loans Cube New from November 2022
 --C4C loans cube end

 UNION ALL
--Staff Loans start
Select Gender, [Principal Balance],[Loan Amount],[First Name],Surname, [Customer ID]
from [Staff loan] where Submission_Period =@AsAtDate
--Staff Loans ends
UNION ALL
--Landed Property start
Select [Gender ], CAST([Loan Principal Amount(Without Interest) ] as numeric(36,2))Principal,[Loan Amount Disbursed ],
[First Name ],[Surname ],[Customer ID ]
from [Landed Property] where Submission_Period =@AsAtDate

--Landed Property end

UNION ALL
 --Cash Backed Loans Start
  Select 'Male'Gender,Balance,[Loan Amount],''FirstName,
 ''Surname,ISNULL(TrY_CAST([Account Number] as float),0)CID
 from [Cash Backed Loans] WHere Submission_Period =@AsAtDate
  --Cash Backed Loans end
)O

--Outstanding Balance for Purpose Ends 

--Outstanding Balance for Loan Size Begins
INSERT INTO #MNB103c


SELECT  #Range.ID,
	0 NAppliedMale,
    0 AppliedMale,
	0 NAppliedFemale, 
	0 AppliedFemale,
	0,0,
	0 NSanctionedMale,
	0 SanctionedMale,
	0 NSanctionedFemale,
	0 SanctionedFemale,0,0, 0 NRejectedMale,
	0 RejectedMale,0 NRejectedFemale, 0 RejectedFemale,0,0,
	CASE WHEN Gender in('Male') THEN 1 ELSE 0 END AS NOutStandingMale,
	CASE WHEN Gender in('Male') THEN Present_Value ELSE 0  END AS OutStandingMale, 
	CASE WHEN Gender in('Female') THEN 1 ELSE 0 END AS NOutStandingFemale,
	CASE WHEN Gender  in('Female') THEN Present_Value ELSE 0  END AS OutStandingFemale,
	CASE WHEN Gender  not in('Male','Female') THEN 1 ELSE 0 END AS NOutStandingOther,
	CASE WHEN Gender not in('Male','Female') THEN Present_Value ELSE 0  END AS OutStandingOther,
	@AsAtDate Submission FROM (

SELECT  Gender, Present_Value - total_amount Present_Value,  Loan_Amount, Firstname,Surname, [Employee Number]  FROM (

 select Present_Value, [Employee number], Deduction_amt,[Account No],Gender,Loan_Amount, Firstname,Surname,
       (case 
				when row_number() over (partition by [Employee number] order by [Employee number] ) = 1
             then Deduction_amt
             else 0
        end) as total_amount
		from (
		--Payroll loans start
Select  [Account No], Firstname,Surname,Gender,[Collection mechanism],[Employer Name],Loan_Amount,
[Net Loan Amount], Present_Value, [Employee number],
Y.I,ISNULL(Y.deduction,0) Deduction_amt
from Loans S -- where Submission_Period = '2022-06-30' and Present_Value > 0 and [Book Type] ='Ghana Book 1' 
--payroll loans ends
--Controller deduction start
LEFT JOIN 
 (select [EMPLOYEE NO] I, SUM([MONTHLY DED])deduction from [Controller Deduction] Group by [EMPLOYEE NO]
 ) Y
 --Controller deduction end
 ON S.[Employee Number] = Y.I
 where S.Submission_Period = @AsAtDate and Present_Value > 0 and [Book Type] ='Ghana Book 1'

 )U

)N
UNION ALL
--C4C Loans cube start
 Select 'Male'Gender, Present_Value,  Loan_Amount, Firstname,Surname, [Employee Number]  
 from [C4C Loans Cube New] where Submission_Period=@AsAtDate and Present_Value>0 and [Book Type] = 'Ghana Book 1'
 --changed from C4C Loans Cube New to C4C Loans Cube  from March 2022
 --changed from C4C Loans Cube to C4C Loans Cube New from November 2022
 --C4C loans cube end

  UNION ALL
--Staff Loans start
Select Gender, [Principal Balance],[Loan Amount],[First Name],Surname, [Customer ID]
from [Staff loan] where Submission_Period =@AsAtDate
--Staff Loans ends

UNION ALL
--Landed Property start
Select [Gender ], CAST([Loan Principal Amount(Without Interest) ] as numeric(36,2))Principal,[Loan Amount Disbursed ],
[First Name ],[Surname ],[Customer ID ]
from [Landed Property] where Submission_Period =@AsAtDate

--Landed Property end

UNION ALL
 --Cash Backed Loans Start
  Select 'Male'Gender,Balance,[Loan Amount],''FirstName,
 ''Surname,ISNULL(TrY_CAST([Account Number] as float),0)CID
 from [Cash Backed Loans] WHere Submission_Period =@AsAtDate
  --Cash Backed Loans end
)H 
 INNER JOIN #Range ON Present_Value BETWEEN #Range.LowerLimit AND #Range.Upperlimit


 --Outstanding Balance Security Begins
 INSERT INTO #MNB103c
 --Payroll loans are all secured
 Select HeaderId ,
 0 NAppliedMale,
    0 AppliedMale,
	0 NAppliedFemale, 
	0 AppliedFemale,
	0,0,
	0 NSanctionedMale,
	0 SanctionedMale,
	0 NSanctionedFemale,
	0 SanctionedFemale,
	0,0,
	0 NRejectedMale,
	0 RejectedMale,0 NRejectedFemale, 0 RejectedFemale,0,0,
	CASE WHEN Gender in('Male') THEN 1 ELSE 0 END AS NOutStandingMale,
	CASE WHEN Gender in('Male') THEN Present_Value ELSE 0  END AS OutStandingMale, 
	CASE WHEN Gender  in('Female') THEN 1 ELSE 0 END AS NOutStandingFemale,
	CASE WHEN Gender  in('Female') THEN Present_Value ELSE 0  END AS OutStandingFemale,
	CASE WHEN Gender  not in('Male','Female') THEN 1 ELSE 0 END AS NOutStandingOther,
	CASE WHEN Gender not in('Male','Female') THEN Present_Value ELSE 0  END AS OutStandingOther,
	 @AsAtDate Submission_Period

 From(
 SELECT '19' headerId, Gender, Present_Value - total_amount Present_Value,  Loan_Amount, Firstname,Surname, [Employee Number]  FROM (

 select Present_Value, [Employee number], Deduction_amt,[Account No],Gender,Loan_Amount, Firstname,Surname,
       (case 
				when row_number() over (partition by [Employee number] order by [Employee number] ) = 1
             then Deduction_amt
             else 0
        end) as total_amount
		from (
		--Payroll loans start
Select  [Account No], Firstname,Surname,Gender,[Collection mechanism],[Employer Name],Loan_Amount,
[Net Loan Amount], Present_Value, [Employee number],
Y.I,ISNULL(Y.deduction,0) Deduction_amt
from Loans S 
--payroll loans ends
--Controller deduction start
LEFT JOIN 
 (select [EMPLOYEE NO] I, SUM([MONTHLY DED])deduction from [Controller Deduction] Group by [EMPLOYEE NO]
 ) Y
 --Controller deduction end
 ON S.[Employee Number] = Y.I
 where S.Submission_Period =@AsAtDate and Present_Value > 0 and [Book Type] ='Ghana Book 1'

 )U

 
)N
UNION ALL
Select '18' headerId, 'Male'Gender,Present_Value,Loan_Amount,Firstname,Surname,[Employee number]
from [C4C Loans Cube New] where Submission_Period =@AsAtDate and Present_Value>0 and [Book Type] = 'Ghana Book 1'
--changed from C4C Loans Cube New to C4C Loans Cube  from March 2022
--changed from C4C Loans Cube to C4C Loans Cube New from November 2022
UNION ALL
--Staff Loans start
Select '18' headerId, Gender, [Principal Balance],[Loan Amount],[First Name],Surname, [Customer ID]
from [Staff loan] where Submission_Period =@AsAtDate
--Staff Loans ends

UNION ALL
--Landed Property start
Select '18'headerId, [Gender ], CAST([Loan Principal Amount(Without Interest) ] as numeric(36,2))Principal,[Loan Amount Disbursed ],
[First Name ],[Surname ],[Customer ID ]
from [Landed Property] where Submission_Period =@AsAtDate

--Landed Property end

UNION ALL
 --Cash Backed Loans Start
  Select '18'headerId,'Male'Gender,Balance,[Loan Amount],''FirstName,
 ''Surname,ISNULL(TrY_CAST([Account Number] as float),0)CID
 from [Cash Backed Loans] WHere Submission_Period =@AsAtDate
  --Cash Backed Loans end
)N
-- Outstanding BalanceSecurity Ends


-- Outstanding Balance Terms Begins

INSERT INTO #MNB103c

Select Case WHen [Loan Term]/ 12 between 0 and 1 then '20'
            When [Loan Term]/ 12 between 1.001 and 5 then '21'
			Else '22' End As HeaderId,
   0 NAppliedMale,
    0 AppliedMale,
	0 NAppliedFemale, 
	0 AppliedFemale,
	0,0,
	0 NSanctionedMale,
	0 SanctionedMale,
	0 NSanctionedFemale,
	0 SanctionedFemale,0,0, 0 NRejectedMale,
	0 RejectedMale,0 NRejectedFemale, 0 RejectedFemale,0,0,
	CASE WHEN Gender in('Male') THEN 1 ELSE 0 END AS NOutStandingMale,
	CASE WHEN Gender in('Male') THEN Present_Value ELSE 0  END AS OutStandingMale, 
	CASE WHEN Gender  in('Female') THEN 1 ELSE 0 END AS NOutStandingFemale,
	CASE WHEN Gender  in('Female') THEN Present_Value ELSE 0  END AS OutStandingFemale,
	CASE WHEN Gender  not in('Male','Female') THEN 1 ELSE 0 END AS NOutStandingOther,
	CASE WHEN Gender not in('Male','Female') THEN Present_Value ELSE 0  END AS OutStandingOther,
	@AsAtDate Submission_Period
 From (
 SELECT  Gender, Present_Value - total_amount Present_Value,  Loan_Amount, Firstname,Surname, [Employee Number],[Loan Term]  FROM (

 select Present_Value, [Employee number], Deduction_amt,[Account No],Gender,Loan_Amount, Firstname,Surname,[Loan Term],
       (case 
				when row_number() over (partition by [Employee number] order by [Employee number] ) = 1
             then Deduction_amt
             else 0
        end) as total_amount
		from (
		--Payroll loans start
Select  [Account No], Firstname,Surname,Gender,[Collection mechanism],[Employer Name],Loan_Amount,
[Net Loan Amount], Present_Value, [Employee number],
Y.I,ISNULL(Y.deduction,0) Deduction_amt, [Loan Term]
from Loans S 
--payroll loans ends
--Controller deduction start
LEFT JOIN 
 (select [EMPLOYEE NO] I, SUM([MONTHLY DED])deduction from [Controller Deduction] Group by [EMPLOYEE NO]
 ) Y
 --Controller deduction end
 ON S.[Employee Number] = Y.I
 where S.Submission_Period =@AsAtDate and Present_Value > 0 and [Book Type] ='Ghana Book 1'

 )U

 
)N
UNION ALL
Select  'Male'Gender,Present_Value,Loan_Amount,Firstname,Surname,[Employee number],[Loan Term]
from [C4C Loans Cube New] where Submission_Period =@AsAtDate and Present_Value>0 and [Book Type] = 'Ghana Book 1'
--changed from C4C Loans Cube New to C4C Loans Cube  from March 2022
--changed from C4C Loans Cube to C4C Loans Cube New from November 2022

 UNION ALL
--Staff Loans start
Select Gender, [Principal Balance],[Loan Amount],[First Name],Surname, [Customer ID],[Number of Payments Agreed]
from [Staff loan] where Submission_Period =@AsAtDate
--Staff Loans ends
UNION ALL
--Landed Property start
Select [Gender ], CAST([Loan Principal Amount(Without Interest) ] as numeric(36,2))Principal,[Loan Amount Disbursed ],
[First Name ],[Surname ],[Customer ID ], 0 NumberOfPayments
from [Landed Property] where Submission_Period =@AsAtDate

--Landed Property end
UNION ALL
 --Cash Backed Loans Start
  Select 'Male'Gender,Balance,[Loan Amount],''FirstName,
 ''Surname,ISNULL(TrY_CAST([Account Number] as float),0)CID, 0 NumberOfPayements
 from [Cash Backed Loans] WHere Submission_Period =@AsAtDate
  --Cash Backed Loans end

)N
--Outstanding Balance Terms Ends


  DELETE FROM MNB103_LoanApplication_Detail where Submission_Period = @AsAtDate
	INSERT INTO MNB103_LoanApplication_Detail

   Select HeaderId,SUM(NoOfMaleApplied)NAppliedMale,ROUND(SUM(NoOfMaleAppliedAmt),2)AppliedMale,
	SUM(NoOfFemaleApplied)NAppliedFemale,ROUND(SUM(NoOfFemaleAppliedAmt),2)AppliedFemale,
	SUM(NoOfOthersApplied)NOthersApplied,ROUND(SUM(NoOfOthersAppliedAmt),2)OthersApplied ,
	SUM(SanctionedMaleLoans)NSanctionedMale,ROUND(SUM(SanctionedMaleLoansAmt),2)SanctionedMale,
	SUM(SanctionedFemaleLoans)NSanctionedFemale,ROUND(SUM(SanctionedFemaleLoansAmt),2)SanctionedFemale,
	SUM(SanctionedOthersLoans )NSanctionedOthersLoans,ROUND(SUM(SanctionedOthersLoansAmt),2)SanctionedOthers ,
	SUM(RejectedMaleLoans)NRejectedMale,ROUND(SUM(RejectedMaleLoansAmt),2)RejectedMale,
	SUM(RejectedFemaleLoans)NRejectedFemale,ROUND(SUM(RejectedFemaleLoansAmt),2)RejectedFemale,
	SUM(RejectedOthersLoans)NRejectedOthers, ROUND(SUM(RejectedOthersLoansAmt),2) RejectedOthersLoans,
	SUM(CumulativeMaleLoans)NOutStandingMale,ROUND(ABS(SUM(CumulativeMaleLoansAmt)),2)OutStandingMale,
	SUM(CumulativeFemaleLoans)NOutStandingFemale,ROUND(ABS(SUM(CumulativeFemaleLoansAmt)),2)OutStandingFemale,
	SUM(CumulativeOthersLoans)NCumulativeOthers,ROUND(SUM(CumulativeOthersLoansAmt ),2)CumulativeOthers,
	Submission_Period
	From #MNB103c
	Group By HeaderId,Submission_Period
	


	

  
  
 
  

 
 
 
