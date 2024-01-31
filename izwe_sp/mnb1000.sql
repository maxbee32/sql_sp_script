USE [Ghana_BOG]
GO
/****** Object:  StoredProcedure [dbo].[spBOG_MNB1000]    Script Date: 1/29/2024 1:28:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[spBOG_MNB1000]
@AsAtDate date =NULL

AS 

CREATE TABLE #MNB1000
(
 headerId int,
 Savings float,
 [Fixed Deposit] float,
 [Personal Loans] float,
 [Group Loans] float,
 [Business Loans] float,
 Submission_Period date
)

INSERT INTO #MNB1000
SELECT ID, (Savings/100)Savings, ([Fixed Deposit]/100)FD,
([Personal Loans]/100)PL,([Group Loans]/100)GL,([Business Loans]/100)BL, Submission_Period
FROM (
SELECT  ID,Savings,[Fixed Deposit], 
[Personal Loans], [Group Loans], [Business Loans], 
@AsAtDate Submission_Period from MNB1000Charges

)H

DELETE FROM MNB1000_Detail where Submission_Period =@AsAtDate
INSERT INTO MNB1000_Detail

SELECT * From #MNB1000



