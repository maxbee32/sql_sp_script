USE [Ghana_BOG]
GO
/****** Object:  StoredProcedure [dbo].[spBOG_MNB105_3Year_Average]    Script Date: 1/29/2024 1:09:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[spBOG_MNB105_3Year_Average]
@AsAtDate date = NULL
as


CREATE TABLE #MNB105Average
(
 HeaderId int,
 Income money,
 Submission_Period date
)

INSERT INTO #MNB105Average

Select CASE WHEN Description ='Previous Year 1' THEN 1 
            WHEN Description = 'Previous Year 2' THEN 2
		    WHEN Description = 'Previous Year 3' THEN 3
			End as HeaderId,
			Amount,
			@AsAtDate Submission_Period
From MNB105_ScheduleAverge



 DELETE FROM MNB105_3Year_Average_Detail Where Submission_Period = @AsAtDate
 INSERT INTO MNB105_3Year_Average_Detail

 Select * From #MNB105Average