USE [Ghana_BOG]
GO
/****** Object:  StoredProcedure [dbo].[spBOG_MNB200]    Script Date: 1/29/2024 1:16:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[spBOG_MNB200]
@AsAtDate date =NULL
as
CREATE TABLE #MNB200
(headerId  int,
CurrentMonth money,
Cumulative money,
Submission_Period date
)


declare @Year as varchar(4)
declare @PeriodEnd as int



set @Year = datepart(year,@AsAtDate)
set @PeriodEnd = datepart(month,@AsAtDate) 

INSERT INTO #MNB200

SELECT HeaderID, 
CASE WHEN Headerid in (2,4,31,32,34,35,38,97,3,47,48,49,50,51,52,53,54,55,56,57,59,61,62,64,68,74,75,76,79,80,81,82)

    then  [Current Month] * -1 
    
	 ELSE [Current Month]
         END AS 
		 [Current Month],

CASE WHEN Headerid in (2,4,31,32,34,35,38,97,3,47,48,49,50,51,52,53,54,55,56,57,59,61,62,64,68,74,75,76,79,80,81,82) 
then  [Cumulative] * -1 
   
	 ELSE [Cumulative]
         END AS 
		 [Cumulative] ,

Submission_Period
FROM (
 SELECT headerId, CAST(SUM([Current Month])as numeric(36,2)) [Current Month], 
 CAST(SUM(Cumulative) as numeric (36,2)) Cumulative, Submission_Period FROM (
SELECT headerId,SUM(PERDBLNC) [Current Month], 0 Cumulative, @AsAtDate Submission_Period FROM(
Select  headerId,C.ActIndx,GL_description, BOG_Description,
ACTDESCR, 

PERDBLNC * -1 PERDBLNC  FROM MNB200Lookup C
 inner join 
  GL00100 S on
   C.ActIndx =S.ACTNUMBR_2
    inner join 
	GL10110 E on  --change from GL10110(current year) to GL10111(history year) 
	 S.ACTINDX =E.ACTINDX
	 where  PERIODID = @PeriodEnd 
	 and YEAR1 = @Year
	
	 
)CurrentMonth
 Group by headerId


  UNION 
--cumulative
SELECT headerId,0  [Current Month], SUM(PERDBLNC) Cumulative, @AsAtDate Submission_Period FROM(
Select  headerId,C.ActIndx,GL_description, BOG_Description,
ACTDESCR, 

PERDBLNC *-1 PERDBLNC   FROM MNB200Lookup C
 inner join 
  GL00100 S on
   C.ActIndx =S.ACTNUMBR_2
    inner join 
	GL10110 E on  --change from GL10110(current year) to  GL10111(history year) 
	 S.ACTINDX =E.ACTINDX
	 where  PERIODID between 0  and @PeriodEnd 
	 and YEAR1 = @Year
   
)Cumulative
 Group by headerId

 )Mnb200
  Group by headerId, Submission_Period


  )BOG_MNB


DELETE FROM MNB200_Detail WHERE Submission_Period = @AsAtDate
INSERT INTO MNB200_Detail

SELECT * FROM #MNB200


