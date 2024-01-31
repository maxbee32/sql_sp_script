USE [Ghana_BOG]
GO
/****** Object:  StoredProcedure [dbo].[spBOG_MNB106a]    Script Date: 1/29/2024 1:11:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 ALTER procedure [dbo].[spBOG_MNB106a]
 @AsAtDate date = NULL
 as



 CREATE TABLE #MNB106
 (HeaderId int,
 Individuals money,
 PrivateEnterprises money,
 PublicEnterprise money,
 Others money,
 Submission_Period date
 )


 

 INSERT INTO #MNB106

 SELECT  
     CASE WHEN Account_Type in ('i-Vest') THEN 3 --Fixed Deposit
	     WHEN Account_Type  in ('i-Save','Mobi Save','Savings Plan') THEN 2 --Savings
		 WHEN Account_Type in ('i-Flex') THEN 1 --Demand
		 END AS HeaderId,

    

	   CASE WHEN Client_Type = 'Individual' and Amount between 0.00 and 99999999999999999 and Account_Type in ('i-Vest') then Amount
            WHEN Client_Type = 'Individual' and Amount between 0.00 and 99999999999999999 and Account_Type in ('i-Save','Mobi Save','Savings Plan') then Amount
          WHEN Client_Type = 'Individual' and Amount between 0.00 and 99999999999999999 and Account_Type in ('i-Flex') then Amount 
		 END AS Individuals,


		 CASE WHEN Client_Type = 'Corporate' and Amount between 0.00 and 99999999999999999 and Account_Type in ('i-Vest') then Amount
            WHEN Client_Type = 'Corporate' and Amount between 0.00 and 99999999999999999 and Account_Type in ('i-Save','Mobi Save','Savings Plan')  then Amount
            WHEN Client_Type = 'Corporate' and Amount between 0.00 and 99999999999999999 and Account_Type in ('i-Flex') then Amount
		 END AS PrivateEnterprises,                                                                    --changed from FD to i-vest
		 0 PublicEnterprise, 0 Others, SP 


 FROM(



 SELECT FullName,Client_Type,ISNULL(Balance,0)Amount, Account_Type,SP FROM (
 --savings data from MIP

 SELECT FullName, Client_Type, Balance *-1 Balance,Gender,Account_Type, Submission_Period SP FROM (
 SELECT DISTINCT [Account No], FirstName + SPACE(1) + Surname FullName,Client_Type,Balance,
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

SELECT FullName, Client_Type, Balance *-1 Balance,Gender,Account_Type, Submission_Period SP FROM (
 SELECT DISTINCT [Account No], FirstName + SPACE(1) + Surname FullName,Client_Type,Balance,
 Gender,Account_Type, Submission_Period
From [Savings_Origination_New]
where Submission_Period =@AsAtDate
and [Account Status] in ('Active','dormant','Settled','blocked','closed')
and Internal_control_acc ='No'
--add this change from November 2022
and Account_Type in ('i-Flex')
--end
and Balance < 0
)F
-- where  Balance <0 
 --ends savings data from MIP
 UNION ALL


 


 SELECT  FullName, Client_Type, Balance *-1 Balance,Gender,Account_Type, Submission_Period SP FROM (
 SELECT DISTINCT [Account No], FirstName + SPACE(1) + Surname FullName,Client_Type,Balance,
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

)MNB106


DELETE FROM MNB106_Customer_Type_Detail where Submission_Period =@AsAtDate
INSERT INTO MNB106_Customer_Type_Detail

SELECT HeaderId, SUM(Individuals)Individual,
SUM(PrivateEnterprises)OtherPrivateEnterprise,SUM(PublicEnterprise)PublicEnterprise,
SUM(Others)Others, Submission_Period
FROM #MNB106

Group by HeaderId,Submission_Period



