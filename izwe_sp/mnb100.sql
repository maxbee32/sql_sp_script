USE [Ghana_BOG]
GO
/****** Object:  StoredProcedure [dbo].[spBOG_MNB100]    Script Date: 1/29/2024 12:50:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[spBOG_MNB100]
@AsAtDate date = NULL
as

CREATE TABLE #MNB100
(
HeaderId int,
Amount money,
Submission_Period date
)


declare @Year as varchar(4)
declare @PeriodEnd as int

set @Year = datepart(year,@AsAtDate)
set @PeriodEnd = datepart(month,@AsAtDate) 



INSERT INTO #MNB100

SELECT headerId,
ABS(CAST(ROUND(SUM(PERDBLNC),2) as numeric (36,2)))Amount,
@AsAtDate Submission_Period
FROM (
SELECT DISTINCT E.ACTNUMBR_2,headerId,GL_description,
BOG_Description, ACTDESCR, D.ACTINDX, PERDBLNC,PERIODID FROM MNB100Lookup C
inner join 
 GL00100 E 
   on C.ActIndx =E.ACTNUMBR_2
   inner join 
   GL10110 D  --change  GL10111(history year) to from GL10110(current year) 
   on D.ACTINDX = E.ACTINDX
    where YEAR1 =@Year
	and PERIODID between 0 and @PeriodEnd
)J
Group by headerId

 
 DELETE FROM MNB100_Detail where Submission_Period =@AsAtDate
 INSERT INTO MNB100_Detail

 SELECT * FROM #MNB100


