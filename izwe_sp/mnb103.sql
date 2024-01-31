USE [Ghana_BOG]
GO
/****** Object:  StoredProcedure [dbo].[spBOG_MNB103]    Script Date: 1/29/2024 12:52:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[spBOG_MNB103]
@AsAtDate date = NULL
as

CREATE TABLE #MNB103
(HeaderId   int,
Amount money,
Submission_Period date
)

declare @Year as varchar(4)
declare @PeriodEnd as int


set @Year = datepart(year,@AsAtDate)
set @PeriodEnd = datepart(month,@AsAtDate) 

INSERT INTO #MNB103

SELECT headerId, ABS(CAST(SUM(PERDBLNC)as numeric(35,2))) Amount, Submission_Period FROM (
SELECT headerId,C.ActIndx,BOG_Description,ACTDESCR,
PERDBLNC, @AsAtDate Submission_Period FROM MNB103LTLookup C
inner Join GL00100 D on
 C.ActIndx = D.ACTNUMBR_2
 inner join GL10110 F on  --change from GL10111(history year) to GL10110(current year) 
  F.ACTINDX = D.ACTINDX
 Where  PERIODID between 0 and @PeriodEnd
 and YEAR1 =@Year
 )MNB103
 Group by headerId, Submission_Period




 DELETE FROM MNB103_Detail where Submission_Period = @AsAtDate
 INSERT INTO MNB103_Detail

 SELECT * FROM #MNB103
