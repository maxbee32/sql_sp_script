USE [Ghana_BOG]
GO
/****** Object:  StoredProcedure [dbo].[spBOG_MNB105]    Script Date: 1/29/2024 1:09:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[spBOG_MNB105]
@AsAtDate date = NULL
as

CREATE TABLE #MNB105
(
HeaderId int,
Amount money,
Submission_Period date
)


--declare @SubmissionDate as date
declare @Year as varchar(4)
declare @PeriodEnd as int

set @Year = datepart(year,@AsAtDate)
set @PeriodEnd = datepart(month,@AsAtDate) 




---credit Risk 
INSERT INTO #MNB105


 Select 6 headerId,

 (sum([PERDBLNC])  *-1 )   as Amount
 ,@AsAtDate Submission_Period
  FROM [Ghana_BOG].[dbo].[GL00100] a
  inner join
  GL10110 b  --change from GL10111(history year) to GL10110(current year) 
  on a.[ACTINDX] = b.[ACTINDX]
 where a.ACTNUMBR_2 in (8942)
 and PERIODID between 0 and @PeriodEnd
   and YEAR1 = @Year


  -- Income Surplus (Audited Retained Earnings)



INSERT INTO #MNB105


 Select 3 headerId,

 (sum([PERDBLNC])  *-1 )- 13449924.00 - 19118385.54   as Amount
 ,@AsAtDate Submission_Period
  FROM [Ghana_BOG].[dbo].[GL00100] a
  inner join
  GL10110 b  --change from GL10111(history year) to GL10110(current year) 
  on a.[ACTINDX] = b.[ACTINDX]
 where a.ACTNUMBR_2 in (7750)
 and PERIODID between 0 and @PeriodEnd
   and YEAR1 = @Year
 

 INSERT INTO #MNB105

 SELECT  2 headerId,
 
  19118385.54 + (sum([PERDBLNC])  *-1 )    as Amount
 ,@AsAtDate Submission_Period
  FROM [Ghana_BOG].[dbo].[GL00100] a
  inner join
  GL10110 b  --change from GL10111(history year) to GL10110(current year) 
  on a.[ACTINDX] = b.[ACTINDX]
 where a.ACTNUMBR_2 in (8941)
 and PERIODID between 0 and @PeriodEnd
   and YEAR1 = @Year

    --Statutory Reserve Fund


INSERT INTO #MNB105
 
 SELECT  1 headerId,13449924.00  Amount,@AsAtDate Submission_Period   --changed from 12780228 to 13182313 for 2022


 Delete from MNB105_Detail where Submission_Period  =@AsAtDate

 INSERT INTO MNB105_Detail

 Select * from #MNB105 

  
