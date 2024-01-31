USE [Ghana_BOG]
GO
/****** Object:  StoredProcedure [dbo].[spBOG_MNB107]    Script Date: 1/29/2024 1:14:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[spBOG_MNB107]

@AsAtDate date = NULL

AS

CREATE TABLE #MNB107

(HeaderId int,
Pieces int,
Submission_Period date
)

INSERT INTO #MNB107

SELECT 
 CASE WHEN Notes='200' THEN 2
      WHEN Notes ='100' THEN 3
	  WHEN Notes ='50' THEN 4
	  WHEN Notes = '20' THEN 5
	  WHEN Notes ='10'  THEN 6
	  WHEN Notes ='5' THEN 7
	  WHEN Notes ='2' THEN 8
	  WHEN Notes ='1' THEN 9
	  WHEN Notes ='0.5' THEN 13
	  WHEN Notes ='0.2' THEN 14
	  WHEN Notes ='0.1' THEN 15
	  WHEN Notes ='0.05' THEN 16
	  WHEN Notes ='0.01' THEN 17
	  END AS HeaderID, Pieces, Submission_Period
FROM (
SELECT [DENOMINATIONS (GH)] Notes, SUM(QTY) Pieces, Submission_Period 
from [Cash denomination] where Submission_Period =@AsAtDate
Group by [DENOMINATIONS (GH)], Submission_Period

)W

DELETE FROM MNB107_Detail where Submission_Period= @AsAtDate
INSERT INTO  MNB107_Detail

SELECT * from #MNB107
where HeaderId is not null


