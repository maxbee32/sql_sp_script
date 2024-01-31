USE [Ghana_BOG]
GO
/****** Object:  StoredProcedure [dbo].[spBOG_MNB400]    Script Date: 1/29/2024 1:22:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[spBOG_MNB400]
@AsAtDate date =NULL

as

CREATE TABLE #MNB400
(HeaderId int,
 [Month Ended] money,
 [Average Period to date] money,
 Submission_Period date
 )


declare @Year as varchar(4)
declare @PeriodEnd as int
declare @A int

set @Year = datepart(year,@AsAtDate)
set @PeriodEnd = datepart(month,@AsAtDate) 
set @A =datepart(month, DATEADD(MONTH, DATEDIFF(MONTH, -1, @AsAtDate)-1, -1))

INSERT INTO #MNB400


SELECT HeaderId, SUM([Month Ended])[Month Ended],
SUM([Average Period to date]) [Average Period to date],
Submission_Period
FROM (
SELECT headerId, [Month Ended], 
CAST(SUM([Month Ended] + [Average Period to date])/2 as numeric(35,2)) [Average Period to date],
Submission_Period  
FROM (
SELECT headerId , 
SUM([Month Ended])[Month Ended],
SUM([Average Period to date])[Average Period to date],
Submission_Period FROM (

--Curent Month
SELECT headerId, CAST(ABS(SUM(PERDBLNC))as numeric(35,2)) [Month Ended], 
0  [Average Period to date], Submission_Period  FROM (
SELECT HeaderId, C.ActIndx, GL_description, BOG_Description,ACTDESCR,
PERDBLNC, @AsAtDate Submission_Period
FROM MNB400Lookup C
inner Join 
GL00100 D on
 C.ActIndx = D.ACTNUMBR_2
 inner join GL10110 F on  --change from  GL10110(current year) to GL10111(history year) 
  F.ACTINDX = D.ACTINDX
 Where  PERIODID between 0 and @PeriodEnd
 and YEAR1 = @Year
 
 )MonthEnded
 Group by headerId, Submission_Period
 --Total Current Year
 UNION 
  SELECT HeaderId, 
  CAST([Annexure A] + [Annexure B]-[Annexure C]+ [Annexure D]- [Annexure E] -[Annexure F]- [Annexure G]
  -[Credit Impairment] -[Bad Debt Written Off]  + [Annexure H] - [Provision for Tax] as numeric(36,2))[Month Ended],
    0 [Average Period to date],Submission_Period
  FROM (

  SELECT HeaderId,
  SUM(ISNULL([Annexure A],0))[Annexure A],
		 SUM(ISNULL([Annexure B],0))[Annexure B],
		 SUM(ISNULL([Annexure C],0))[Annexure C],
		 SUM(ISNULL([Annexure D],0))[Annexure D],
		 SUM(ISNULL([Annexure E],0))[Annexure E],
		 SUM(ISNULL([Annexure F],0))[Annexure F],
		 SUM(ISNULL([Annexure G],0))[Annexure G],
		 SUM(ISNULL([Annexure H],0))[Annexure H],
		 SUM(ISNULL([Credit Impairment],0))[Credit Impairment],
		 SUM(ISNULL([Bad Debt Written Off],0))[Bad Debt Written Off],
		 SUM(ISNULL([Provision for Tax],0))[Provision for Tax],
		 Submission_Period
  FROM (

  SELECT '3' HeaderId,
    CASE WHEN BOG_Description = 'Interest Income on Loans, Advances and Overdrafts (Annexure A)' THEN  Cumulative END AS [Annexure A],
    CASE WHEN BOG_Description = 'Interest On Investments Received (Annexure B)' THEN Cumulative END AS [Annexure B],
	CASE WHEN BOG_Description = 'Interest Expense (Annexure C)' THEN SUM(Cumulative) END AS [Annexure C],
	CASE WHEN BOG_Description = 'Interest Expense (Annexure D)' THEN Cumulative END AS [Annexure D],
	CASE WHEN BOG_Description in ('Depreciation Charge On PPE','Travelling Expenses','Audit Fees','Printing And Stationery',
	'Repairs and Maintenance','Insurance','Entertainment','Advertising and Publicity','Penalties','Other Operating Expenses')
	THEN SUM(Cumulative) END AS [Annexure E],
	CASE WHEN BOG_Description = 'Salaries ,Wages And Allowances' THEN Cumulative END AS [Annexure F],
	CASE WHEN BOG_Description in ('Cleaning & Sanitation','Security Expenses','Registration and Renewals','Bank Charges')
	THEN SUM(Cumulative) END AS [Annexure G],
	CASE WHEN BOG_Description in ('Forex Loss/Gain', 'Gain (loss) on sale of capital Total') THEN SUM(Cumulative) END AS [Annexure H],
	CASE WHEN BOG_Description ='Credit Impairment' THEN Cumulative END AS [Credit Impairment],
	CASE WHEN BOG_Description ='Bad Debt Written Off' THEN Cumulative END AS [Bad Debt Written Off],
	CASE WHEN BOG_Description = 'Provision for Tax' THEN Cumulative END AS [Provision for Tax],
	Submission_Period
  FROM (
  SELECT BOG_Description, CASE WHEN BOG_Description NOT IN ('Forex Loss/Gain','Provision for Tax') THEN ABS(Cumulative) ELSE
   Cumulative END AS Cumulative,Submission_Period FROM (
  SELECT BOG_Description,CASE WHEN BOG_Description in ( 'Forex Loss/Gain') THEN  Cumulative *-1 ELSE Cumulative
                               
  END AS Cumulative,Submission_Period
  FROM (
  SELECT headerId,0  [Current Month], SUM(PERDBLNC) Cumulative, BOG_Description, @AsAtDate Submission_Period FROM(
Select  headerId,C.ActIndx,GL_description, BOG_Description,
ACTDESCR,  
PERDBLNC  FROM MNB200Lookup C
 inner join 
  GL00100 S on
   C.ActIndx =S.ACTNUMBR_2
	 inner join GL10110 F on  --change from GL10110(current year) to GL10111(history year)
	 S.ACTINDX =F.ACTINDX
	 where  PERIODID between 0  and @PeriodEnd 
	 and YEAR1 = @Year
   
)Cumulative
 Group by headerId,BOG_Description

 )Mnb200

 )Mnb2

 )monthEnded
 Group By BOG_Description, Cumulative,Submission_Period
 )W
  Group By  HeaderId, Submission_Period
 )S

 UNION
 --Average Period to date

 SELECT headerId,  0 [Month Ended],  CAST(ABS(SUM(PERDBLNC))as numeric(35,2))  [Average Period to date], Submission_Period  FROM (
SELECT HeaderId, C.ActIndx, GL_description, BOG_Description,ACTDESCR,
PERDBLNC, @AsAtDate Submission_Period FROM MNB400Lookup C
inner Join 
GL00100 D on
 C.ActIndx = D.ACTNUMBR_2
 inner join GL10110 F on  --change from  GL10111(history year) to  GL10110(current year) 
  F.ACTINDX = D.ACTINDX
 Where  PERIODID between 0 and @PeriodEnd - @A
 and YEAR1 = @Year

 )AveragePeriod
 Group by headerId, Submission_Period
 )MNB400
  Group by headerId,Submission_Period

  )AvergeMNB400
  Group by headerId, [Month Ended], Submission_Period
  
  --Total current Year for Average Period to date
  UNION 

  SELECT HeaderId,0 [Month Ended] ,
  CAST([Annexure A] + [Annexure B]-[Annexure C]+ [Annexure D]- [Annexure E] -[Annexure F]- [Annexure G]
  -[Credit Impairment] -[Bad Debt Written Off]  + [Annexure H] - [Provision for Tax] as numeric(36,2))[Average Period to date] ,
    Submission_Period
  FROM (

  SELECT HeaderId,
  SUM(ISNULL([Annexure A],0))[Annexure A],
		 SUM(ISNULL([Annexure B],0))[Annexure B],
		 SUM(ISNULL([Annexure C],0))[Annexure C],
		 SUM(ISNULL([Annexure D],0))[Annexure D],
		 SUM(ISNULL([Annexure E],0))[Annexure E],
		 SUM(ISNULL([Annexure F],0))[Annexure F],
		 SUM(ISNULL([Annexure G],0))[Annexure G],
		 SUM(ISNULL([Annexure H],0))[Annexure H],
		 SUM(ISNULL([Credit Impairment],0))[Credit Impairment],
		 SUM(ISNULL([Bad Debt Written Off],0))[Bad Debt Written Off],
		 SUM(ISNULL([Provision for Tax],0))[Provision for Tax],
		 Submission_Period
  FROM (

  SELECT '3' HeaderId,
    CASE WHEN BOG_Description = 'Interest Income on Loans, Advances and Overdrafts (Annexure A)' THEN  Cumulative END AS [Annexure A],
    CASE WHEN BOG_Description = 'Interest On Investments Received (Annexure B)' THEN Cumulative END AS [Annexure B],
	CASE WHEN BOG_Description = 'Interest Expense (Annexure C)' THEN SUM(Cumulative) END AS [Annexure C],
	CASE WHEN BOG_Description = 'Interest Expense (Annexure D)' THEN Cumulative END AS [Annexure D],
	CASE WHEN BOG_Description in ('Depreciation Charge On PPE','Travelling Expenses','Audit Fees','Printing And Stationery',
	'Repairs and Maintenance','Insurance','Entertainment','Advertising and Publicity','Penalties','Other Operating Expenses')
	THEN SUM(Cumulative) END AS [Annexure E],
	CASE WHEN BOG_Description = 'Salaries ,Wages And Allowances' THEN Cumulative END AS [Annexure F],
	CASE WHEN BOG_Description in ('Cleaning & Sanitation','Security Expenses','Registration and Renewals','Bank Charges')
	THEN SUM(Cumulative) END AS [Annexure G],
	CASE WHEN BOG_Description in ('Forex Loss/Gain', 'Gain (loss) on sale of capital Total') THEN SUM(Cumulative) END AS [Annexure H],
	CASE WHEN BOG_Description ='Credit Impairment' THEN Cumulative END AS [Credit Impairment],
	CASE WHEN BOG_Description ='Bad Debt Written Off' THEN Cumulative END AS [Bad Debt Written Off],
	CASE WHEN BOG_Description = 'Provision for Tax' THEN Cumulative END AS [Provision for Tax],
	Submission_Period
  FROM (
  SELECT BOG_Description, CASE WHEN BOG_Description NOT IN ('Forex Loss/Gain','Provision for Tax') THEN ABS(Cumulative) ELSE
   Cumulative END AS Cumulative,Submission_Period FROM (
  SELECT BOG_Description,CASE WHEN BOG_Description in ( 'Forex Loss/Gain') THEN  Cumulative *-1 ELSE Cumulative
                               
  END AS Cumulative,Submission_Period
  FROM (
  SELECT headerId,0  [Current Month], SUM(PERDBLNC) Cumulative, BOG_Description, @AsAtDate Submission_Period FROM(
Select  headerId,C.ActIndx,GL_description, BOG_Description,
ACTDESCR, 
PERDBLNC  FROM MNB200Lookup C
 inner join 
  GL00100 S on
   C.ActIndx =S.ACTNUMBR_2
    
	 inner join GL10110 E on  --change from GL10110(current year) to GL10111(history year) 
	 S.ACTINDX =E.ACTINDX
	 where  PERIODID between 0  and @PeriodEnd -@A 
	 and YEAR1 = @Year
   
)Cumulative
 Group by headerId,BOG_Description

 )Mnb200

 )Mnb2

 )monthEnded
 Group By BOG_Description, Cumulative, Submission_Period
 )W
  Group By  HeaderId, Submission_Period
 )S
 
 )R
 Group by HeaderId, Submission_Period


 DELETE FROM MNB400_Detail where Submission_Period = @AsAtDate
 INSERT INTO MNB400_Detail

 SELECT * FROM #MNB400


