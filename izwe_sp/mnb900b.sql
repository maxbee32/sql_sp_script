USE [Ghana_BOG]
GO
/****** Object:  StoredProcedure [dbo].[spBOG_MNB900b]    Script Date: 1/29/2024 1:26:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[spBOG_MNB900b]
@AsAtDate date =NULL

AS

CREATE TABLE #MNB900b

(
HeaderId                    int,
 No_of_Borrowers_Male        int,
 No_of_Borrowers_Female      int,
  Total_Disbursed_Amt_Male     money,
  Total_Disbursed_Amt_Female   money,
  Total_Outstanding_Male       money,
 Total_Outstanding_Female     money,
Submission_Period date
)



	Create Table #Range
	(
		ID					int,
		LowerLimit			money,
		Upperlimit			money
	)


	INSERT INTO #Range VALUES (1, -99999999999, 500.00)
	INSERT INTO #Range VALUES (2, 500.01, 1000.00)
	INSERT INTO #Range VALUES (3, 1000.01, 1500.00)
	INSERT INTO #Range VALUES (4, 1500.01, 3000.00)
	INSERT INTO #Range VALUES (5, 3000.01, 99999999999)



	INSERT INTO #MNB900b

	SELECT #Range.ID,
	CASE WHEN Gender in('Male') THEN 1 ELSE 0 END AS No_of_Borrowers_Male,
	CASE WHEN Gender not in('Male') THEN 1 ELSE 0 END AS No_of_Borrowers_Female,
	CASE WHEN Gender in('Male') THEN Loan_Amount ELSE 0 END AS Total_Disbursed_Amt_Male, 
	CASE WHEN Gender not in('Male') THEN Loan_Amount ELSE 0 END AS Total_Disbursed_Amt_Female,
	0,0,@AsAtDate Submission_Period FROM (
	Select [Account No], Firstname,Surname,Gender,[Collection mechanism],[Employer Name],Loan_Amount,
    [Net Loan Amount],Effective_Date,Present_Value
    from Loans where Submission_Period = @AsAtDate
    and Effective_Date between DATEADD(dd,1,EOMONTH(@AsAtDate,-1)) and @AsAtDate and [Book Type] ='Ghana Book 1'
    UNION ALL
        --C4C loans cube
    Select [Account No],Firstname,Surname, 'Male'Gender,''collection_mechanism,[Employer Name],
    Loan_Amount,[Net Loan Amount],Effective_Date,Present_Value
    from [C4C Loans Cube New] where Submission_Period =@AsAtDate
    and Effective_Date between DATEADD(dd,1,EOMONTH(@AsAtDate,-1)) and @AsAtDate and [Book Type] ='Ghana Book 1'
	 --changed from C4C Loans Cube New to C4C Loans Cube from March 2022
     --changed from C4C Loans Cube to C4C Loans Cube New from November 2022
    --C4C loans cube ends
	UNION ALL
	 --Staff Loans start
	Select [Account number], [First Name],Surname,Gender,''collection_mechanism, [Customer ID],
    [Loan Amount],0 [Net Loan Amount], [Loan Disbursement Date],[Principal Balance]
    from [Staff loan] where Submission_Period =@AsAtDate
	and [Loan Disbursement Date] between DATEADD(dd,1,EOMONTH(@AsAtDate,-1)) and @AsAtDate
    --Staff Loans ends
	UNION ALL
--Landed Property start
Select [Account Number ],[First Name ],[Surname ],[Gender ],''collection_mechanism,[Customer ID ],
[Loan Amount Disbursed ],0 [Net Loan Amount],[Date of Approval ], [Loan Principal Amount(Without Interest) ]
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

	
)H 
INNER JOIN #Range ON H.Loan_Amount  BETWEEN #Range.LowerLimit AND #Range.Upperlimit


   INSERT INTO #MNB900b


   SELECT #Range.ID,
	0 No_of_Borrowers_Male,
	0 No_of_Borrowers_Female,
	0 Total_Disbursed_Amt_Male, 
	0 Total_Disbursed_Amt_Female,

	CASE WHEN Gender in('Male') THEN Present_Value ELSE 0 END AS Total_Disbursed_Amt_Male,
	CASE WHEN Gender not in('Male') THEN Present_Value ELSE 0 END AS Total_Disbursed_Amt_Female,
	@AsAtDate Submission_Period
	From(
 SELECT  Gender, Present_Value - total_amount Present_Value,  Loan_Amount, Firstname,Surname, [Employee Number]  FROM (
 select Present_Value, [Employee number], Deduction_amt,[Account No],Gender,Loan_Amount, Firstname,Surname,
       (case 
				when row_number() over (partition by [Employee number] order by [Employee number] ) = 1
             then Deduction_amt
             else 0
        end) as total_amount
		from (
Select  [Account No], Firstname,Surname,Gender,[Collection mechanism],[Employer Name],Loan_Amount,
[Net Loan Amount], Present_Value, [Employee number],
Y.I,ISNULL(Y.deduction,0) Deduction_amt
from Loans S  
LEFT JOIN 
 (select [EMPLOYEE NO] I, SUM([MONTHLY DED])deduction from [Controller Deduction] Group by [EMPLOYEE NO]
 ) Y
 ON S.[Employee Number] = Y.I
 where S.Submission_Period = @AsAtDate and Present_Value > 0 and [Book Type] ='Ghana Book 1'

 )U

)N
UNION ALL
--C4C Loans cube start
 Select 'Male'Gender, Present_Value,  Loan_Amount, Firstname,Surname, [Employee Number]  
 from [C4C Loans Cube New] where Submission_Period=@AsAtDate and Present_Value>0 and [Book Type] = 'Ghana Book 1'
  --changed from C4C Loans Cube New to C4C Loans Cube from March 2022
 --changed from C4C Loans Cube to C4C Loans Cube New from November 2022
 --C4C loans cube end

 UNION ALL
--Staff Loans start
Select Gender,[Principal Balance], [Loan Amount],[First Name],Surname, [Customer ID]
from [Staff loan] where Submission_Period =@AsAtDate
--Staff Loans ends
UNION ALL
--Landed Property start
Select [Gender ], [Loan Principal Amount(Without Interest) ],[Loan Amount Disbursed ]
,[First Name ],[Surname ],[Customer ID ]
from [Landed Property] where Submission_Period =@AsAtDate

--Landed Property end

UNION ALL
 --Cash Backed Loans Start
  Select 'Male'Gender,Balance,[Loan Amount],''FirstName,
 ''Surname,ISNULL(TrY_CAST([Account Number] as float),0)CID
 from [Cash Backed Loans] WHere Submission_Period =@AsAtDate
  --Cash Backed Loans end

)G
INNER JOIN #Range ON G.Present_Value BETWEEN #Range.LowerLimit AND #Range.Upperlimit


DELETE FROM MNB900_LoanSize_Detail where Submission_Period = @AsAtDate
INSERT INTO MNB900_LoanSize_Detail

SELECT  HeaderId,SUM(No_of_Borrowers_Male)No_of_Borrowers_Male,SUM(No_of_Borrowers_Female)No_of_Borrowers_Female,
	ROUND(SUM(Total_Disbursed_Amt_Male),2)Total_Disbursed_Amt_Male,
	ROUND(SUM(Total_Disbursed_Amt_Female),2)Total_Disbursed_Amt_Female,
	ROUND(SUM(Total_Outstanding_Male),2)Total_Outstanding_Male,
	ROUND(SUM(Total_Outstanding_Female),2)Total_Outstanding_Female,
	Submission_Period 
	FROM #MNB900b
	Group by HeaderId,Submission_Period


		

