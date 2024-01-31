USE [Ghana_BOG]
GO
/****** Object:  StoredProcedure [dbo].[spBOG_MNB103b]    Script Date: 1/29/2024 12:56:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER procedure [dbo].[spBOG_MNB103b]  
@AsAtDate date = NULL
as

CREATE TABLE #MNB103b
(headerId int,
 AccountID					varchar(20),
 PLoan						money,
 NPLoan						money,
 POverdraft					money,
 NPOverdraft				money,
 NumbOfCust					varchar(100),
 Submission_Period			date
)


INSERT INTO #MNB103b

Select headerId,[Account No],
Case When MonthsToDays between 0 and 90 Then Present_Value Else 0 End As PLoan,
Case When MonthsToDays not between 0 and 90 Then Present_Value Else 0 End As NPLoan,
0 POverdraft, 0 NPOverdraft,[Account No] NumbOfCust,  Submission_Period

From (

SELECT  headerId,[Account No], Present_Value- total_amount Present_Value,  Loan_Amount, Firstname,Surname, [Employee Number],MonthsToDays ,
NumbofCust,Submission_Period
FROM (

 select headerId,[Account No],Present_Value,MonthsToDays,
 [Employee number], Deduction_amt,Gender,Loan_Amount, Firstname,Surname,[Account No] NumbofCust,Submission_Period,
       (case 
				when row_number() over (partition by [Employee number] order by [Employee number] ) = 1
             then Deduction_amt
             else 0
        end) as total_amount
		from (

		--Payroll loans start
Select '1'headerId, [Account No], Present_Value, 
Firstname,Surname,Gender,[Collection mechanism],[Employer Name],Loan_Amount,
[Net Loan Amount],  [Employee number],[Arrears month] * 31 MonthsToDays,
Y.I,ISNULL(Y.deduction,0) Deduction_amt, Submission_Period
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
 Select '1'headerId,[Account No], Present_Value,  Loan_Amount, Firstname,Surname, [Account No] CID,[Arrears month] * 31 MonthsToDays,
 [Account No] NumbofCust,Submission_Period
 from [C4C Loans Cube New] where Submission_Period=@AsAtDate and Present_Value>0 and [Book Type] = 'Ghana Book 1'
 --changed from C4C Loans Cube New to C4C Loans Cube from March 2022
 --changed from C4C Loans Cube to C4C Loans Cube New from November 2022
 --C4C loans cube end

 UNION ALL
 --Staff Loans Start
 Select '1' headerId, ISNULL([Account number],0)CID,[Principal Balance], [Loan Amount],[First Name],Surname,
 ISNULL([Account number],0)CID,ISNULL([Days in Arrears],0)MonthsToDays,ISNULL([Account number],0)CID, Submission_Period
 from [Staff loan] where Submission_Period =@AsAtDate
 --Start Loans End


 UNION ALL

 ---Landed Property start
 Select '1'headerId,ISNULL([Account Number ],0)CID,CAST([Loan Principal Amount(Without Interest) ]as numeric(36,2))Balance,
 [Loan Amount Disbursed ],[First Name ],[Surname ],ISNULL([Account Number ],0)CID,ISNULL([Days in Arrears ],0)MonthsToDays,
 ISNULL([Account Number ],0)CID, Submission_Period
 from [Landed Property] where Submission_Period =@AsAtDate
 --Landed Property end

 UNION ALL
 --Cash Backed Loans Start

 Select '1'headerId,ISNULL(TrY_CAST([Account Number] as float),0)AccountNumber,Balance,[Loan Amount],''FirstName,
 ''Surname,ISNULL(TrY_CAST([Account Number] as float),0)CID, 0 DaysInArrears,ISNULL(TrY_CAST([Account Number] as float),0)AID, Submission_Period
 from [Cash Backed Loans] WHere Submission_Period =@AsAtDate
 --Cash Backed Loans end
)B


 DELETE FROM MNB103_Sectoral_Distribution_Detail where Submission_Period = @AsAtDate
INSERT INTO MNB103_Sectoral_Distribution_Detail 


Select headerId,SUM(PLoan)PLoan,SUM(POverdraft )POverdraft,
SUM(NPLoan)NPLoan,SUM(NPOverdraft )NPOverdraft,
COUNT(NumbOfCust)NumbOfCust,Submission_Period from  #MNB103b where Submission_Period =@AsAtDate
group by headerId, Submission_Period











