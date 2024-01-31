USE [Ghana_BOG]
GO
/****** Object:  StoredProcedure [dbo].[spBOG_MNB106New]    Script Date: 1/29/2024 1:13:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER  PROC [dbo].[spBOG_MNB106New]
@AsAtDate  date = NULL
 as


 CREATE TABLE #MNB106
 (HeaderId int,
 Lessthan1000Amt money,
 Lessthan1000NoOFMale varchar(50),
 Lessthan1000NoOFFemale varchar(50),
 Lessthan1000NoOFCompany  varchar(50),
 Between1000And5000Amt money,
 Between1000And5000Male varchar(50),
 Between1000And5000Female varchar(50),
 Between1000And5000Company varchar(50),
 MoreThan5000Amt money,
 MoreThan5000Male varchar(50),
 MoreThan5000Female varchar(50),
 MoreThan5000Company varchar(50),
 Submission_Period date
 )



 INSERT INTO #MNB106



 SELECT  
     CASE WHEN Account_Type in ('i-Vest') and DATEDIFF(day, Date_Activated, granted_date_expiry) between 0 and 30 THEN 3 --Up to a month
	     WHEN Account_Type in ('i-Vest') and DATEDIFF(day, Date_Activated, granted_date_expiry) between 31 and 92 THEN 4 --1Month to 3months
		 WHEN Account_Type in ('i-Vest') and DATEDIFF(day, Date_Activated, granted_date_expiry) between 93 and 186 THEN 5 --3Months to 6months
		 WHEN Account_Type in ('i-Vest') and DATEDIFF(day, Date_Activated, granted_date_expiry) between 187 and 365 THEN 6 --6Months to 1Yeaar
		 WHEN Account_Type in ('i-Vest') and DATEDIFF(day, Date_Activated, granted_date_expiry) between 366 and 730 THEN 7 --1Yeaar to 2Years
		 WHEN Account_Type in ('i-Vest') and DATEDIFF(day, Date_Activated, granted_date_expiry) between 731 and 90000000000 THEN 8 --Above 2Years
		 WHEN Account_Type  in ('i-Save','Mobi Save','Savings Plan') THEN 2 --Savings
		 WHEN Account_Type in ('i-Flex') THEN 1 --Demand
		 END AS HeaderId,

		 --Lessthan1000Amt
      CASE WHEN Amount between 0.0000 and 999.99 and Account_Type in ('i-Vest') 
	  and DATEDIFF(day, Date_Activated, granted_date_expiry) between 0 and 30 then Amount
	   WHEN Amount between 0.0000 and 999.99 and Account_Type in ('i-Vest') 
	  and DATEDIFF(day, Date_Activated, granted_date_expiry) between 31 and 92 then Amount
	   WHEN Amount between 0.0000 and 999.99 and Account_Type in ('i-Vest') 
	  and DATEDIFF(day, Date_Activated, granted_date_expiry) between 93 and 186 then Amount
	   WHEN Amount between 0.0000 and 999.99 and Account_Type in ('i-Vest') 
	  and DATEDIFF(day, Date_Activated, granted_date_expiry) between 187 and 365 then Amount
	    WHEN Amount between 0.0000 and 999.99 and Account_Type in ('i-Vest') 
	  and DATEDIFF(day, Date_Activated, granted_date_expiry) between 366 and 730 then Amount
	    WHEN Amount between 0.0000 and 999.99 and Account_Type in ('i-Vest') 
	  and DATEDIFF(day, Date_Activated, granted_date_expiry) between 731 and 90000000000 then Amount
	 WHEN Amount between 0.0000 and 999.99 and Account_Type in ('i-Save','Mobi Save','Savings Plan') then Amount
		 WHEN Amount between 0.0000 and 999.99 and Account_Type in  ('i-Flex') then Amount
	   END AS Lessthan1000Amt,

	   --Lessthan1000 No OF Male
	   CASE WHEN Amount between 000.00 and 999.99 and Account_Type in ('i-Vest') 
	  and DATEDIFF(day, Date_Activated, granted_date_expiry) between 0 and 30 and Gender in ('Male') then Gender
	   WHEN Amount between  000.00 and 999.99 and Account_Type in ('i-Vest') 
	  and DATEDIFF(day, Date_Activated, granted_date_expiry) between 31 and 92 and Gender in ('Male') then Gender
	   WHEN Amount between 000.00 and 999.99 and Account_Type in ('i-Vest') 
	  and DATEDIFF(day, Date_Activated, granted_date_expiry) between 93 and 186  and Gender in ('Male') then Gender
	   WHEN Amount between 000.00 and 999.99 and Account_Type in ('i-Vest') 
	  and DATEDIFF(day, Date_Activated, granted_date_expiry) between 187 and 365  and Gender in ('Male') then Gender
	    WHEN Amount between 000.00 and 999.99 and Account_Type in ('i-Vest') 
	  and DATEDIFF(day, Date_Activated, granted_date_expiry) between 366 and 730  and Gender in ('Male') then Gender
	    WHEN Amount between 000.00 and 999.99 and Account_Type in ('i-Vest') 
	  and DATEDIFF(day, Date_Activated, granted_date_expiry) between 731 and 90000000000   and Gender in ('Male') then Gender
	 WHEN Amount between 000.00 and 999.99 and Account_Type in ('i-Save','Mobi Save','Savings Plan')  and Gender in ('Male')then Gender
		 WHEN Amount between 000.00 and 999.99 and Account_Type in  ('i-Flex')  and Gender in ('Male') then Gender
	   END AS Lessthan1000NoOFMale,


	   --Lessthan1000 No OF FeMale
	   CASE WHEN Amount between 000.00 and 999.99 and Account_Type in ('i-Vest') 
	  and DATEDIFF(day, Date_Activated, granted_date_expiry) between 0 and 30 and Gender in ('Female') then Gender
	   WHEN Amount between 000.00 and 999.99 and Account_Type in ('i-Vest') 
	  and DATEDIFF(day, Date_Activated, granted_date_expiry) between 31 and 92 and Gender in ('Female') then Gender
	   WHEN Amount between 000.00 and 999.99 and Account_Type in ('i-Vest') 
	  and DATEDIFF(day, Date_Activated, granted_date_expiry) between 93 and 186  and Gender in ('Female') then Gender
	   WHEN Amount between 000.00 and 999.99 and Account_Type in ('i-Vest') 
	  and DATEDIFF(day, Date_Activated, granted_date_expiry) between 187 and 365  and Gender in ('Female') then Gender
	    WHEN Amount between 000.00 and 999.99 and Account_Type in ('i-Vest') 
	  and DATEDIFF(day, Date_Activated, granted_date_expiry) between 366 and 730  and Gender in ('Female') then Gender
	    WHEN Amount between 000.00 and 999.99 and Account_Type in ('i-Vest') 
	  and DATEDIFF(day, Date_Activated, granted_date_expiry) between 731 and 90000000000   and Gender in ('Female') then Gender
	 WHEN Amount between 000.00 and 999.99 and Account_Type in ('i-Save','Mobi Save','Savings Plan')  and Gender in ('Female')then Gender
		 WHEN Amount between 000.00 and 999.99 and Account_Type in  ('i-Flex')  and Gender in ('Female') then Gender
	   END AS Lessthan1000NoOFFemale,

	     --Less than 1000 No Of Others
	   CASE WHEN Amount between 000.00 and 999.99 and Account_Type in ('i-Vest') 
	  and DATEDIFF(day, Date_Activated, granted_date_expiry) between 0 and 30  and Gender is null then 'Corporate'
	   WHEN Amount between 000.00 and 999.99 and Account_Type in ('i-Vest') 
	  and DATEDIFF(day, Date_Activated, granted_date_expiry) between 31 and 92 and Gender is null then 'Corporate'
	   WHEN Amount between 000.00 and 999.99 and Account_Type in ('i-Vest') 
	  and DATEDIFF(day, Date_Activated, granted_date_expiry) between 93 and 186  and Gender is null then 'Corporate'
	   WHEN Amount between 000.00 and 999.99 and Account_Type in ('i-Vest') 
	  and DATEDIFF(day, Date_Activated, granted_date_expiry) between 187 and 365  and Gender is null then 'Corporate'
	    WHEN Amount between 000.00 and 999.99 and Account_Type in ('i-Vest') 
	  and DATEDIFF(day, Date_Activated, granted_date_expiry) between 366 and 730  and Gender is null then 'Corporate'
	    WHEN Amount between 000.00 and 999.99 and Account_Type in ('i-Vest') 
	  and DATEDIFF(day, Date_Activated, granted_date_expiry) between 731 and 90000000000   and Gender is null then 'Corporate'
	 WHEN Amount between 000.00 and 999.99 and Account_Type in ('i-Save','Mobi Save','Savings Plan')  and Gender is null then 'Corporate'
		 WHEN Amount between 000.00 and 999.99 and Account_Type in  ('i-Flex')  and Gender is null then 'Corporate'
	   END AS Lessthan1000NoOFOthers,

	   --Between1000 And 5000Amt
	   CASE WHEN Amount between 1000.00 and 4999.99 and Account_Type in ('i-Vest') 
	  and DATEDIFF(day, Date_Activated, granted_date_expiry) between 0 and 30  then Amount
	   WHEN Amount between 1000.00 and 4999.99 and Account_Type in ('i-Vest') 
	  and DATEDIFF(day, Date_Activated, granted_date_expiry) between 31 and 92 then Amount
	   WHEN Amount between 1000.00 and 4999.99 and Account_Type in ('i-Vest') 
	  and DATEDIFF(day, Date_Activated, granted_date_expiry) between 93 and 186  then Amount
	   WHEN Amount between 1000.00 and 4999.99 and Account_Type in ('i-Vest') 
	  and DATEDIFF(day, Date_Activated, granted_date_expiry) between 187 and 365  then Amount
	    WHEN Amount between 1000.00 and 4999.99 and Account_Type in ('i-Vest') 
	  and DATEDIFF(day, Date_Activated, granted_date_expiry) between 366 and 730  then Amount
	    WHEN Amount between 1000.00 and 4999.99 and Account_Type in ('i-Vest') 
	  and DATEDIFF(day, Date_Activated, granted_date_expiry) between 731 and 90000000000   then Amount
	 WHEN Amount between 1000.00 and 4999.99 and Account_Type in ('i-Save','Mobi Save','Savings Plan')  then Amount
		 WHEN Amount between 1000.00 and 4999.99 and Account_Type in  ('i-Flex')  then Amount
	   END AS Between1000And5000Amt,


	   --Between 1000 And 5000 No Of Male
	     CASE WHEN Amount between 1000.00 and 4999.99 and Account_Type in ('i-Vest') 
	  and DATEDIFF(day, Date_Activated, granted_date_expiry) between 0 and 30  and Gender in ('Male') then Gender
	   WHEN Amount between 1000.00 and 4999.99 and Account_Type in ('i-Vest') 
	  and DATEDIFF(day, Date_Activated, granted_date_expiry) between 31 and 92 and Gender in ('Male') then Gender
	   WHEN Amount between 1000.00 and 4999.99 and Account_Type in ('i-Vest') 
	  and DATEDIFF(day, Date_Activated, granted_date_expiry) between 93 and 186  and Gender in ('Male') then Gender
	   WHEN Amount between 1000.00 and 4999.99 and Account_Type in ('i-Vest') 
	  and DATEDIFF(day, Date_Activated, granted_date_expiry) between 187 and 365  and Gender in ('Male') then Gender
	    WHEN Amount between 1000.00 and 4999.99 and Account_Type in ('i-Vest') 
	  and DATEDIFF(day, Date_Activated, granted_date_expiry) between 366 and 730  and Gender in ('Male') then Gender
	    WHEN Amount between 1000.00 and 4999.99 and Account_Type in ('i-Vest') 
	  and DATEDIFF(day, Date_Activated, granted_date_expiry) between 731 and 90000000000   and Gender in ('Male') then Gender
	 WHEN Amount between 1000.00 and 4999.99 and Account_Type in ('i-Save','Mobi Save','Savings Plan')  and Gender in ('Male') then Gender
		 WHEN Amount between 1000.00 and 4999.99 and Account_Type in  ('i-Flex')  and Gender in ('Male') then Gender
	   END AS Between1000And5000Male,


	   --Between 1000 And 5000 Female
	    CASE WHEN Amount between 1000.00 and 4999.99 and Account_Type in ('i-Vest') 
	  and DATEDIFF(day, Date_Activated, granted_date_expiry) between 0 and 30  and Gender in ('Female') then Gender
	   WHEN Amount between 1000.00 and 4999.99 and Account_Type in ('i-Vest') 
	  and DATEDIFF(day, Date_Activated, granted_date_expiry) between 31 and 92 and Gender in ('Female') then Gender
	   WHEN Amount between 1000.00 and 4999.99 and Account_Type in ('i-Vest') 
	  and DATEDIFF(day, Date_Activated, granted_date_expiry) between 93 and 186  and Gender in ('Female') then Gender
	   WHEN Amount between 1000.00 and 4999.99 and Account_Type in ('i-Vest') 
	  and DATEDIFF(day, Date_Activated, granted_date_expiry) between 187 and 365  and Gender in ('Female') then Gender
	    WHEN Amount between 1000.00 and 4999.99 and Account_Type in ('i-Vest') 
	  and DATEDIFF(day, Date_Activated, granted_date_expiry) between 366 and 730  and Gender in ('Female') then Gender
	    WHEN Amount between 1000.00 and 4999.99 and Account_Type in ('i-Vest') 
	  and DATEDIFF(day, Date_Activated, granted_date_expiry) between 731 and 90000000000   and Gender in ('Female') then Gender
	 WHEN Amount between 1000.00 and 4999.99 and Account_Type in ('i-Save','Mobi Save','Savings Plan')  and Gender in ('Female') then Gender
		 WHEN Amount between 1000.00 and 4999.99 and Account_Type in  ('i-Flex') and Gender in ('Female') then Gender
	   END AS Between1000And5000Female,

	   --Between1000 And 5000 Others
	    CASE WHEN Amount between 1000.00 and 4999.99 and Account_Type in ('i-Vest') 
	  and DATEDIFF(day, Date_Activated, granted_date_expiry) between 0 and 30  and Gender is null then 'Corporate'
	   WHEN Amount between 1000.00 and 4999.99 and Account_Type in ('i-Vest') 
	  and DATEDIFF(day, Date_Activated, granted_date_expiry) between 31 and 92 and Gender is null then 'Corporate'
	   WHEN Amount between 1000.00 and 4999.99 and Account_Type in ('i-Vest') 
	  and DATEDIFF(day, Date_Activated, granted_date_expiry) between 93 and 186  and Gender is null then 'Corporate'
	   WHEN Amount between 1000.00 and 4999.99 and Account_Type in ('i-Vest') 
	  and DATEDIFF(day, Date_Activated, granted_date_expiry) between 187 and 365  and Gender is null then 'Corporate'
	    WHEN Amount between 1000.00 and 4999.99 and Account_Type in ('i-Vest') 
	  and DATEDIFF(day, Date_Activated, granted_date_expiry) between 366 and 730  and Gender is null then 'Corporate'
	    WHEN Amount between 1000.00 and 4999.99 and Account_Type in ('i-Vest') 
	  and DATEDIFF(day, Date_Activated, granted_date_expiry) between 731 and 90000000000   and Gender is null then 'Corporate'
	 WHEN Amount between 1000.00 and 4999.99 and Account_Type in ('i-Save','Mobi Save','Savings Plan')  and Gender is null then 'Corporate'
		 WHEN Amount between 1000.00 and 4999.99 and Account_Type in  ('i-Flex') and Gender is null then 'Corporate'
	   END AS Between1000And5000Others,


	  -- More Than 5000 Amt
	     CASE WHEN Amount between 5000.00 and 99999999999.99 and Account_Type in ('i-Vest') 
	  and DATEDIFF(day, Date_Activated, granted_date_expiry) between 0 and 30  then Amount
	   WHEN Amount between 5000.00 and 99999999999.99 and Account_Type in ('i-Vest') 
	  and DATEDIFF(day, Date_Activated, granted_date_expiry) between 31 and 92 then Amount
	   WHEN Amount between 5000.00 and 99999999999.99 and Account_Type in ('i-Vest') 
	  and DATEDIFF(day, Date_Activated, granted_date_expiry) between 93 and 186  then Amount
	   WHEN Amount between 5000.00 and 99999999999.99 and Account_Type in ('i-Vest') 
	  and DATEDIFF(day, Date_Activated, granted_date_expiry) between 187 and 365  then Amount
	    WHEN Amount between 5000.00 and 99999999999.99 and Account_Type in ('i-Vest') 
	  and DATEDIFF(day, Date_Activated, granted_date_expiry) between 366 and 730  then Amount
	    WHEN Amount between 5000.00 and 99999999999.99 and Account_Type in ('i-Vest') 
	  and DATEDIFF(day, Date_Activated, granted_date_expiry) between 731 and 90000000000   then Amount
	 WHEN Amount between 5000.00 and 99999999999.99 and Account_Type in ('i-Save','Mobi Save','Savings Plan')  then Amount
		 WHEN Amount between 5000.00 and 99999999999.99 and Account_Type in  ('i-Flex')  then Amount
	   END AS MoreThan5000Amt,

	   --More Than 5000 Male
	       CASE WHEN Amount between 5000.00 and 99999999999.99 and Account_Type in ('i-Vest') 
	  and DATEDIFF(day, Date_Activated, granted_date_expiry) between 0 and 30  and Gender in ('Male') then Gender
	   WHEN Amount between 5000.00 and 99999999999.99 and Account_Type in ('i-Vest') 
	  and DATEDIFF(day, Date_Activated, granted_date_expiry) between 31 and 92 and Gender in ('Male') then Gender
	   WHEN Amount between 5000.00 and 99999999999.99 and Account_Type in ('i-Vest') 
	  and DATEDIFF(day, Date_Activated, granted_date_expiry) between 93 and 186  and Gender in ('Male') then Gender
	   WHEN Amount between 5000.00 and 99999999999.99 and Account_Type in ('i-Vest') 
	  and DATEDIFF(day, Date_Activated, granted_date_expiry) between 187 and 365  and Gender in ('Male') then Gender
	    WHEN Amount between 5000.00 and 99999999999.99 and Account_Type in ('i-Vest') 
	  and DATEDIFF(day, Date_Activated, granted_date_expiry) between 366 and 730  and Gender in ('Male') then Gender
	    WHEN Amount between 5000.00 and 99999999999.99 and Account_Type in ('i-Vest') 
	  and DATEDIFF(day, Date_Activated, granted_date_expiry) between 731 and 90000000000   and Gender in ('Male') then Gender
	 WHEN Amount between 5000.00 and 99999999999.99 and Account_Type in ('i-Save','Mobi Save','Savings Plan')  and Gender in ('Male') then Gender
		 WHEN Amount between 5000.00 and 99999999999.99 and Account_Type in  ('i-Flex')  and Gender in ('Male') then Gender
	   END AS MoreThan5000Male,


	   --More Than 5000 Female
	   CASE WHEN Amount between 5000.00 and 99999999999.99 and Account_Type in ('i-Vest') 
	  and DATEDIFF(day, Date_Activated, granted_date_expiry) between 0 and 30  and Gender in ('Female') then Gender
	   WHEN Amount between 5000.00 and 99999999999.99 and Account_Type in ('i-Vest') 
	  and DATEDIFF(day, Date_Activated, granted_date_expiry) between 31 and 92 and Gender in ('Female') then Gender
	   WHEN Amount between 5000.00 and 99999999999.99 and Account_Type in ('i-Vest') 
	  and DATEDIFF(day, Date_Activated, granted_date_expiry) between 93 and 186  and Gender in ('Female') then Gender
	   WHEN Amount between 5000.00 and 99999999999.99 and Account_Type in ('i-Vest') 
	  and DATEDIFF(day, Date_Activated, granted_date_expiry) between 187 and 365  and Gender in ('Female') then Gender
	    WHEN Amount between 5000.00 and 99999999999.99 and Account_Type in ('i-Vest') 
	  and DATEDIFF(day, Date_Activated, granted_date_expiry) between 366 and 730  and Gender in ('Female') then Gender
	    WHEN Amount between 5000.00 and 99999999999.99 and Account_Type in ('i-Vest') 
	  and DATEDIFF(day, Date_Activated, granted_date_expiry) between 731 and 90000000000   and Gender in ('Female') then Gender
	 WHEN Amount between 5000.00 and 99999999999.99 and Account_Type in ('i-Save','Mobi Save','Savings Plan')  and Gender in ('Female') then Gender
		 WHEN Amount between 5000.00 and 99999999999.99 and Account_Type in  ('i-Flex')  and Gender in ('Female') then Gender
	   END AS MoreThan5000Female,

	   --More Than 5000 Others
	    CASE WHEN Amount between 5000.00 and 99999999999.99 and Account_Type in ('i-Vest') 
	  and DATEDIFF(day, Date_Activated, granted_date_expiry) between 0 and 30  and Gender is null then 'Corporate'
	   WHEN Amount between 5000.00 and 99999999999.99 and Account_Type in ('i-Vest') 
	  and DATEDIFF(day, Date_Activated, granted_date_expiry) between 31 and 92 and Gender is null then 'Corporate'
	   WHEN Amount between 5000.00 and 99999999999.99 and Account_Type in ('i-Vest') 
	  and DATEDIFF(day, Date_Activated, granted_date_expiry) between 93 and 186  and Gender is null then 'Corporate'
	   WHEN Amount between 5000.00 and 99999999999.99 and Account_Type in ('i-Vest') 
	  and DATEDIFF(day, Date_Activated, granted_date_expiry) between 187 and 365  and Gender is null then 'Corporate'
	    WHEN Amount between 5000.00 and 99999999999.99 and Account_Type in ('i-Vest') 
	  and DATEDIFF(day, Date_Activated, granted_date_expiry) between 366 and 730  and Gender is null then 'Corporate'
	    WHEN Amount between 5000.00 and 99999999999.99 and Account_Type in ('i-Vest') 
	  and DATEDIFF(day, Date_Activated, granted_date_expiry) between 731 and 90000000000   and Gender is null then 'Corporate'
	 WHEN Amount between 5000.00 and 99999999999.99 and Account_Type in ('i-Save','Mobi Save','Savings Plan')  and Gender is null then 'Corporate'
		 WHEN Amount between 5000.00 and 99999999999.99 and Account_Type in  ('i-Flex')  and Gender is null then 'Corporate'
	   END AS MoreThan5000Others, SP


from (
 SELECT FullName,Client_Type,ISNULL(Balance,0)Amount,Balance,Date_Activated,granted_date_expiry,
 CASE WHEN Gender  IS NULL and Client_Type ='Individual' THEN 'Male' ELSE Gender END AS Gender, Account_Type,SP FROM (

 SELECT FullName, Client_Type, Balance *-1 Balance,Gender,Account_Type, Submission_Period SP
 ,Date_Activated,granted_date_expiry
 FROM (
 SELECT DISTINCT [Account No], FirstName + SPACE(1) + Surname FullName,Client_Type,Balance,Date_Activated,granted_date_expiry,
 Gender,Account_Type, Submission_Period
From [Savings_Origination_New]
where Submission_Period =@AsAtDate
and [Account Status] in ('Active','dormant','Settled','blocked','closed')
and Internal_control_acc ='No'
--add this change from November 2022
and Account_Type in ('i-Save','Mobi Save','Savings Plan')
--end
and Balance < 0



)F

UNION ALL

SELECT FullName, Client_Type, Balance *-1 Balance,Gender,Account_Type, Submission_Period SP ,
  Date_Activated,granted_date_expiry FROM (
 SELECT DISTINCT [Account No], FirstName + SPACE(1) + Surname FullName,Client_Type,Balance,
 Gender,Account_Type, Submission_Period, Date_Activated,granted_date_expiry
From [Savings_Origination_New]
where Submission_Period =@AsAtDate
and [Account Status] in ('Active','dormant','Settled','blocked','closed')
and Internal_control_acc ='No'
--add this change from November 2022
and Account_Type in ('i-Flex')
--end
and Balance < 0
)F

UNION ALL


  SELECT FullName, Client_Type, Balance *-1 Balance,Gender,Account_Type, Submission_Period SP ,
  Date_Activated,granted_date_expiry
  FROM (
 SELECT FirstName + SPACE(1) + Surname FullName,Client_Type,Balance,Date_Activated,granted_date_expiry,
 Gender,Account_Type, Submission_Period
From [Savings_Origination_New]
where Submission_Period =@AsAtDate
and [Account Status] in ('Active','dormant','Settled','blocked','closed')
and Internal_control_acc ='No'
--add this change from November 2022
and Account_Type in ('i-Vest')
--end
and Balance < 0
)F


)J

)U


DELETE FROM MNB106_Detail where Submission_Period =@AsAtDate
INSERT INTO MNB106_Detail

SELECT 

HeaderId, SUM(Lessthan1000Amt)Amount, COUNT(Lessthan1000NoOFMale)NumberOfMale,
COUNT(Lessthan1000NoOFFemale)NumberOfFemale, COUNT(Lessthan1000NoOFCompany)NumberOfOthers,
SUM(Between1000And5000Amt)AmountBtn1000and5000,
COUNT(Between1000And5000Male)NumberofMale1000and5000,
COUNT(Between1000And5000Female)NumberofFemale1000and5000,
COUNT(Between1000And5000Company)NumberOfOthers1000and5000,
SUM(MoreThan5000Amt)AmountMore5000,COUNT(MoreThan5000Male)NumberofMale5000,
COUNT(MoreThan5000Female)NumberofFemale5000, 
COUNT(MoreThan5000Company) NumberofOthers5000,
Submission_Period


FROM #MNB106
where HeaderId is not null
Group By HeaderId, Submission_Period 







