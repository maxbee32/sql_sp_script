USE [Ghana_BOG]
GO
/****** Object:  StoredProcedure [dbo].[spBOG_MNB900]    Script Date: 1/29/2024 1:25:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[spBOG_MNB900]
@AsAtDate date = NULL
as


DECLARE    
			@NoDisbursed		numeric,
			@ValueDisbursed		numeric,
			@NoOutstanding		numeric,
			@ValueOutstanding	numeric,
			@TotalTerm			numeric,
			@WrittenOff			numeric,
			@Recovered			numeric,
			@LargestExposures	numeric
			



	CREATE TABLE #Loans
	( 
		HeaderId			int,
		Amount				numeric
	)

	CREATE TABLE #Accounts
	( 
		AccountID			nvarchar(15),
		Amount				money
	)




	/*Number of loans disbursed*/
	CREATE TABLE #Disbursed
	( 
		AccountID			nvarchar(15),
		Amount				money
	)



 SELECT @NoDisbursed = COUNT([Account No]) FROM (
	Select [Account No], Firstname,Surname,Gender,[Collection mechanism],[Employer Name],Loan_Amount,
[Net Loan Amount],Effective_Date, Present_Value
from Loans where Submission_Period =  @AsAtDate 
and Effective_Date between DATEADD(dd,1,EOMONTH(@AsAtDate,-1)) and @AsAtDate  and [Book Type] ='Ghana Book 1'
UNION ALL
--C4C loans cube
Select [Account No],Firstname,Surname, 'Male'Gender,''collection_mechanism,[Employer Name],
Loan_Amount,[Net Loan Amount],Effective_Date,Present_Value
from [C4C Loans Cube New] where Submission_Period =@AsAtDate
and Effective_Date between DATEADD(dd,1,EOMONTH(@AsAtDate,-1)) and @AsAtDate
 --changed from C4C Loans Cube New to C4C Loans Cube from March 2022
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
)A



INSERT INTO #Accounts

SELECT TOP 20 [Account No], Amount FROM (
SELECT [Account No],SUM([Present_Value])Amount FROM (
Select [Account No], Firstname,Surname,Gender,[Collection mechanism],[Employer Name],Loan_Amount,
[Net Loan Amount],Effective_Date, Present_Value
from Loans where Submission_Period = @AsAtDate and Present_Value >0 and [Book Type]='Ghana Book 1'
UNION ALL
--C4C loans cube
Select [Account No],Firstname,Surname, 'Male'Gender,''collection_mechanism,[Employer Name],
Loan_Amount,[Net Loan Amount],Effective_Date,Present_Value
from [C4C Loans Cube New] where Submission_Period =@AsAtDate and Present_Value >0 and [Book Type]='Ghana Book 1'
 --changed from C4C Loans Cube New to C4C Loans Cube from March 2022
 --changed from C4C Loans Cube to C4C Loans Cube New from November 2022
--C4C loans cube ends
UNION ALL
--Staff Loans start
Select [Account number], [First Name],Surname,Gender,''collection_mechanism, [Customer ID],
[Loan Amount],0 [Net Loan Amount], [Loan Disbursement Date],[Principal Balance]
from [Staff loan] where Submission_Period =@AsAtDate
--Staff Loans ends
UNION ALL
--Landed Property start
Select [Account Number ],[First Name ],[Surname ],[Gender ],''collection_mechanism,[Customer ID ],
[Loan Amount Disbursed ],0 [Net Loan Amount],[Date of Approval ], [Loan Principal Amount(Without Interest) ]
from [Landed Property] where Submission_Period =@AsAtDate

--Landed Property end

UNION ALL
 --Cash Backed Loans Start
  Select ISNULL(TrY_CAST([Account Number] as float),0)CID, ''FirstName,
 ''Surname,'Male'Gender,''Collection_mechanism,ISNULL(TrY_CAST([Account Number] as float),0)CID,
  [Loan Amount],0 Net,[Disbursement Date],Balance
 from [Cash Backed Loans] WHere Submission_Period =@AsAtDate
 
  --Cash Backed Loans end
)H
Group by [Account No]

)Y
Order by Amount DESC


SELECT @LargestExposures = ABS(SUM(Amount)) FROM #Accounts


/*Loans Outstanding*/
	CREATE TABLE #OutstandingLoans
	( 
		AccountID			nvarchar(MAX),
		Amount				money
	)


	INSERT INTO #OutstandingLoans
	SELECT [Account No], Present_Value FROM (
	Select [Account No], Firstname,Surname,Gender,[Collection mechanism],[Employer Name],Loan_Amount,
   [Net Loan Amount],Effective_Date, Present_Value
   from Loans where Submission_Period = @AsAtDate and Present_Value> 0 and [Book Type] ='Ghana Book 1'
   UNION ALL
   --C4C loans cube
   Select [Account No],Firstname,Surname, 'Male'Gender,''collection_mechanism,[Employer Name],
   Loan_Amount,[Net Loan Amount],Effective_Date,Present_Value
   from [C4C Loans Cube New] where Submission_Period =@AsAtDate and Present_Value >0 and [Book Type]='Ghana Book 1'
 --changed from C4C Loans Cube New to C4C Loans Cube from March 2022
 --changed from C4C Loans Cube to C4C Loans Cube New from November 2022
  --C4C loans cube ends
  UNION ALL
--Staff Loans start
Select ISNULL([Account number],0)AccountID, [First Name],Surname,Gender,''collection_mechanism, [Customer ID],
[Loan Amount],0 [Net Loan Amount], [Loan Disbursement Date],[Principal Balance]
from [Staff loan] where Submission_Period =@AsAtDate
UNION ALL
--Landed Property start
Select ISNULL([Account Number ],0)AccountID,[First Name ],[Surname ],[Gender ],''collection_mechanism,[Customer ID ],
[Loan Amount Disbursed ],0 [Net Loan Amount],[Date of Approval ], [Loan Principal Amount(Without Interest) ]
from [Landed Property] where Submission_Period =@AsAtDate

--Landed Property end

UNION ALL
 --Cash Backed Loans Start
  Select ISNULL(TrY_CAST([Account Number] as float),0)CID, ''FirstName,
 ''Surname,'Male'Gender,''Collection_mechanism,ISNULL(TrY_CAST([Account Number] as float),0)CID,
  [Loan Amount],0 Net,[Disbursement Date],Balance
 from [Cash Backed Loans] WHere Submission_Period =@AsAtDate
 
  --Cash Backed Loans end

--Staff Loans ends
   )H
    SELECT @NoOutstanding = COUNT(AccountID) FROM #OutstandingLoans


	/*Average Loan Term*/
   CREATE TABLE #AverageLoan
	( 
		
		Term				int
	)

	INSERT INTO #AverageLoan 
	SELECT SUM(AverageWeek)/COUNT([Account No])Terms FROM (
	SELECT [Account No],[Net Loan Amount],DATEDIFF(WEEK,Effective_Date,Repayment_Date)AverageWeek FROM (
	--SELECT [Account No],[Net Loan Amount],[Loan Term] from (
	--payroll loans start
	Select [Account No], Firstname,Surname,Gender,[Collection mechanism],[Employer Name],Loan_Amount,
   [Net Loan Amount],Effective_Date, Present_Value,Repayment_Date,[Loan Term]
   from Loans where Submission_Period = @AsAtDate  and Present_Value > 0 and [Book Type] ='Ghana Book 1'
   --payroll loans end
   UNION ALL
   --C4C loans cube
   Select [Account No],Firstname,Surname, 'Male'Gender,''collection_mechanism,[Employer Name],
   Loan_Amount,[Net Loan Amount],Effective_Date,Present_Value,Repayment_Date,[Loan Term]
   from [C4C Loans Cube New] where Submission_Period =@AsAtDate and Present_Value >0 and [Book Type]='Ghana Book 1'
    --changed from C4C Loans Cube New to C4C Loans Cube from March 2022
 --changed from C4C Loans Cube to C4C Loans Cube New from November 2022
 --C4C loans cube ends
  UNION ALL
--Staff Loans start
Select [Account number], [First Name],Surname,Gender,''collection_mechanism, [Customer ID],
[Loan Amount],0 [Net Loan Amount], [Loan Disbursement Date]Effective_Date,[Principal Balance],
[Loan Maturity Date]Repayment_Date,[Number of Payments Agreed]  from [Staff loan] where Submission_Period =@AsAtDate
--Staff Loans ends
UNION ALL
--Landed Property start
Select [Account Number ],[First Name ],[Surname ],[Gender ],''collection_mechanism,[Customer ID ],
[Loan Amount Disbursed ],0 [Net Loan Amount],[Date of Approval ], [Loan Principal Amount(Without Interest) ],
@AsAtDate Repayment, DATEDIFF(WEEK,[Date of Approval ],@AsAtDate)LoanTerm
 from [Landed Property] where Submission_Period =@AsAtDate
----Landed Property end


UNION ALL
 --Cash Backed Loans Start
  Select ISNULL(TrY_CAST([Account Number] as float),0)CID, ''FirstName,
 ''Surname,'Male'Gender,''Collection_mechanism,ISNULL(TrY_CAST([Account Number] as float),0)CID,
  [Loan Amount],0 Net,[Disbursement Date],Balance, @AsAtDate Repayent,DATEDIFF(WEEK,[Disbursement Date],@AsAtDate)LoanTerm
 from [Cash Backed Loans] WHere Submission_Period =@AsAtDate
 
  --Cash Backed Loans end
   )H
   where [Net Loan Amount] != 0
 )I
 
 SELECT @TotalTerm = Term FROM #AverageLoan


 /* Loans */
	INSERT INTO #Loans SELECT 1, @NoDisbursed
	INSERT INTO #Loans SELECT 2, @NoOutstanding
	INSERT INTO #Loans SELECT 3, @TotalTerm
	INSERT INTO #Loans SELECT 4, '0'--@WrittenOff
	INSERT INTO #Loans SELECT 5, '0'  --@Recovered
	INSERT INTO #Loans SELECT 6, @LargestExposures



	DELETE FROM MNB900_Portfolio_Detail where Submission_Period =@AsAtDate
    INSERT INTO MNB900_Portfolio_Detail 


	SELECT  HeaderId, ROUND(Amount,2) Amount, @AsAtDate Submission_Period
	FROM #Loans

	



--and Effective_Date between DATEADD(dd,1,EOMONTH(@AsAtDate,-1)) and @AsAtDate


--declare @SubmissionDate as date
--declare @Year as varchar(4)
--declare @PeriodEnd as int

--set @SubmissionDate = convert(date,DATEADD(DAY, -(DAY(GETDATE())), GETDATE()))
--set @Year = datepart(year,getdate())
--set @PeriodEnd = datepart(month,DATEADD(DAY, -(DAY(GETDATE())), GETDATE())) 

--  -- Number of Loans Disbursed

--INSERT INTO [dbo].MNB900_Portfolio_Detail
--           ([HeaderId]
--           ,Value,[Submission_Period])  
 
-- SELECT  1,
--(SELECT count([Account No])       
--  FROM Izwe_Reporting_Ghana.[dbo].[tblApplicationsDataWarehouseReport_Ghana]
--  where datepart(month,Effective_Date) = @PeriodEnd
--  and  datepart(year,Effective_Date) = @Year
--  and [Account Status] in ('active','settled'))+

--(SELECT count([Account No])      
--  FROM Izwe_Reporting_Ghana_Logbook.[dbo].tblApplicationsDataWarehouseReport_Ghana
--  where [Account Status] in ('active','settled')
--  and datepart(year,effective_date) = @Year
--  and datepart(month,effective_date) = @PeriodEnd),@SubmissionDate
  
--    -- Value of Loans Disbursed (GHS)

-- INSERT INTO [dbo].MNB900_Portfolio_Detail
--           ([HeaderId]
--           ,Value,[Submission_Period])  
 
-- SELECT  7,
--(SELECT sum([Net Loan Amount])       
--  FROM Izwe_Reporting_Ghana.[dbo].[tblApplicationsDataWarehouseReport_Ghana]
--  where datepart(month,Effective_Date) = @PeriodEnd
--  and  datepart(year,Effective_Date) = @Year
--  and [Account Status] in ('active','settled'))+

--(SELECT sum([Net Loan Amount] )     
--  FROM Izwe_Reporting_Ghana_Logbook.[dbo].tblApplicationsDataWarehouseReport_Ghana
--  where [Account Status] in ('active','settled')
--  and datepart(year,effective_date) = @Year
--  and datepart(month,effective_date) = @PeriodEnd)  ,@SubmissionDate


-- --Number of Loans Outstanding


--   INSERT INTO [dbo].MNB900_Portfolio_Detail
--           ([HeaderId]
--           ,Value,[Submission_Period])
 
-- SELECT  2,
--(SELECT count([Account No])       
--  FROM Izwe_Reporting_Ghana.[dbo].[tblApplicationsDataWarehouseReport_Ghana]
--  where effective_date <= @SubmissionDate
--  and [Book Type] = 'Ghana Book 1' 
--  and [Account No] in ('active' ))+

--(SELECT count([Account No])      
--  FROM Izwe_Reporting_Ghana_Logbook.[dbo].tblApplicationsDataWarehouseReport_Ghana
--  where [Account Status] in ('active')
--  and Effective_Date <= @SubmissionDate),@SubmissionDate



--   --Value of Outstanding Loan Portfolio (GHS)
   
--   INSERT INTO [dbo].MNB900_Portfolio_Detail
--           ([HeaderId]
--           ,Value,[Submission_Period])
 
-- SELECT  8,
 
--sum([PERDBLNC])  as Amount
--,@SubmissionDate
--  FROM [Ghana_BOG].[dbo].[GL00100] a inner join GL10110 b on
--  a.[ACTINDX] = b.[ACTINDX]
-- where a.ACTNUMBR_2 in (6800,6802,6801,7050,7051,6803,6804,6805,6906,6907,6808)
-- and PERIODID between 0 and @PeriodEnd
-- and YEAR1 = @Year


--  --Average Loan Term (in Weeks)

--   INSERT INTO [dbo].MNB900_Portfolio_Detail
--           ([HeaderId]
--           ,Value,[Submission_Period])
 
-- SELECT  3,
-- avg([Loan Term] * 4.34)   ,@SubmissionDate    
--  FROM Izwe_Reporting_Ghana.[dbo].[tblApplicationsDataWarehouseReport_Ghana]
--  where datepart(year,effective_date) = @Year
--  and datepart(month,effective_date) = @PeriodEnd
--  and [Account Status] in ('active','settled')


--    --Twenty Largest Exposures (GHS)

--   INSERT INTO [dbo].MNB900_Portfolio_Detail
--           ([HeaderId]
--           ,Value,[Submission_Period])
 
-- SELECT  6,
--   sum([Outstanding Balance]),@SubmissionDate
--FROM (Select Top(20) [Outstanding Balance]
--	from Izwe_Reporting_Ghana.[dbo].[tblApplicationsDataWarehouseReport_Ghana]
--  where datepart(year,effective_date) = @Year
--  and datepart(month,effective_date) = @PeriodEnd
--  and [Account Status] in ('active')
--  order by [Outstanding Balance] desc) as T

-- --Current Loans [Outstanding Balance]

--   INSERT INTO [dbo].[MNB900_Aging_Detail]
--           ([HeaderId]
--           ,[Outstanding Balance],[Submission_Period])
 
-- SELECT  1,
-- (select sum([Outstanding Balance]) 
--	from Izwe_Reporting_Ghana.[dbo].[tblApplicationsDataWarehouseReport_Ghana]
--  where datepart(year,effective_date) = @Year
--  and datepart(month,effective_date) = @PeriodEnd
--  and [Account Status] in ('active' ))-
--  ( SELECT
--sum([PERDBLNC])  
--  FROM [Ghana_BOG].[dbo].[GL00100] a inner join GL10110 b on
--  a.[ACTINDX] = b.[ACTINDX]
-- where a.ACTNUMBR_2 in (6800,6802,6801,7050,7051,6803,6804,6805,6906,6907,6808)
-- and PERIODID between 0 and @PeriodEnd
-- and YEAR1 = @Year),@SubmissionDate


  