USE [Ghana_BOG]
GO
/****** Object:  StoredProcedure [dbo].[spBOG_MNB104]    Script Date: 1/29/2024 12:59:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[spBOG_MNB104]
@AsAtDate date = NULL
as

CREATE TABLE #MNB104
(HeaderId int,
Amount money,
Submission_Period date
)

declare @Year as varchar(4)
declare @PeriodEnd as int


set @Year = datepart(year,@AsAtDate)
set @PeriodEnd = datepart(month,@AsAtDate) 

INSERT INTO #MNB104

SELECT headerId,CAST(ABS(SUM(PERDBLNC))as numeric(36,2)) Amount, Submission_Period FROM (
SELECT headerId,C.ActIndx,BOG_Description,ACTDESCR,

 PERDBLNC, @AsAtDate Submission_Period FROM MNB104Lookup C
inner Join GL00100 D on
 C.ActIndx = D.ACTNUMBR_2
 inner join GL10110 F on  --change from GL10111(history year) to GL10110(current year) 
  F.ACTINDX = D.ACTINDX
 Where  PERIODID between 0 and @PeriodEnd
 and YEAR1 = @Year
 )MNB104
 Group by headerId,Submission_Period

 DELETE FROM MNB104_Detail where Submission_Period = @AsAtDate
 INSERT INTO MNB104_Detail

 Select * FROM #MNB104



