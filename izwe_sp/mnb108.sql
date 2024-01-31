USE [Ghana_BOG]
GO
/****** Object:  StoredProcedure [dbo].[spBOG_MNB108]    Script Date: 1/29/2024 1:14:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[spBOG_MNB108]



@AsAtDate date =NULL

as
CREATE TABLE #MNB108
(HeaderId int,
AgreementDate date,
ExpiryDate date,
InterestRate float,
Amount money,
Submission_Period date 
)



declare @Year as varchar(4)
declare @PeriodEnd as int


set @Year = datepart(year,@AsAtDate)
set @PeriodEnd = datepart(month,@AsAtDate) 

INSERT INTO #MNB108

SELECT headerId, CASE WHEN [Agreement  date] = '1900-01-01' THEN NULL ELSE
[Agreement  date] END AS [Agreement date],
CASE WHEN [Expiry date]= '1900-01-01' THEN NULL ELSE
[Expiry date] END AS [Expiry date],
 [Interest Rate],CAST(ABS(SUM(PERDBLNC)) as numeric(36,2)) Amount, Submission_Period  FROM (
SELECT headerId,[Agreement  date],[Expiry date],[Interest Rate],C.ActIndx,
GL_Description,ACTDESCR,PERDBLNC, @AsAtDate Submission_Period
FROM MNB108Lookup C
inner Join GL00100 D on
 C.ActIndx = D.ACTNUMBR_2
 inner join GL10110 F on  --change from GL10111(history year) to GL10110(current year) 
  F.ACTINDX = D.ACTINDX
 Where  PERIODID between 0 and @PeriodEnd
 and YEAR1 = @Year
 )MNB108
 Group by HeaderId,[Agreement  date],[Expiry date],[Interest Rate], Submission_Period

 DELETE FROM MNB108_Detail where Submission_Period = @AsAtDate
 INSERT INTO MNB108_Detail 

 SELECT * FROM #MNB108
