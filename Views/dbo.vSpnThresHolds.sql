SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO


CREATE  view [dbo].[vSpnThresHolds] as

Select a.*,coalesce(b.finish,'20991231')finish from [dbo].[vSpnThresHolds_1]a
left Join 
(
Select ID,a.spn,start,dateadd(d,-1,min(bstart))finish  from (
select a.*,b.start bStart from dbo.vSpnThresHolds_1   
 a join
dbo.vSpnThresHolds_1 b on a.spn=b.spn and a.start<b.start) a
group by  a.spn,ID,start
) b on a.spn=b.spn and a.id=b.id



GO