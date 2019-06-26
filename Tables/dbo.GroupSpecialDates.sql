CREATE TABLE [dbo].[GroupSpecialDates] (
  [Group] [nvarchar](50) NOT NULL,
  [Date] [datetime] NOT NULL,
  [hDesc] [nvarchar](50) NULL,
  [Start] [datetime] NULL,
  [End] [datetime] NULL,
  [GroupSpecialDatesID] [int] IDENTITY,
  CONSTRAINT [PK_TadSpecialDates] PRIMARY KEY CLUSTERED ([Group], [Date])
)
ON [PRIMARY]
GO

SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE Trigger  [GroupSpecialDates_trugger] 
on [dbo].[GroupSpecialDates]
for Update,delete 
As 
If Update([Date]) or  Update([hDesc]) or  Update([Start]) or  Update([End])
Insert into [dbo].[GroupSpecialDatesAudit](GroupSpecialDatesID, [Group], [Date], [hDesc], [Start], [End])
Select b.GroupSpecialDatesID,b.[Group], b.[Date], b.[hDesc], b.[Start], b.[End] from [dbo].[GroupSpecialDates] a
join deleted b on a.GroupSpecialDatesID=b.GroupSpecialDatesID
Else
Insert into [dbo].[GroupSpecialDatesAudit](GroupSpecialDatesID, [Group], [Date], [hDesc], [Start], [End])
Select b.GroupSpecialDatesID,b.[Group], b.[Date], b.[hDesc], b.[Start], b.[End] from  
  deleted b  
/*
select * from [dbo].[GroupSpecialDatesAudit]
Truncate table [dbo].[GroupSpecialDatesAudit]
*/
GO