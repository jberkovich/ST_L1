SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO






CREATE view  [dbo].[vspnThresholds_new_Full] as
Select Distinct 0 [Record Type],webgrName [WEB Group],b.spn SPN,spnid SPNid,startPeriod[Threshold Period Start],coalesce (dateadd(d,-1,minStart),FinishPeriod) [Threshold Period Finish], [sSalesZ][Long], [abandonedIVRx][IVR],[abandonedQx][Short],'Web_Group_Thresholds' Comments 
from  [dbo].[vWeb_Group_Thresholds_All] b
left  join (Select  spn,min(s.[start])minStart from [dbo].[spnThresholds] s join numbers n on n.id = s.spnid group by spn)v on v.spn =b.spn
where v.spn is null

Union All
Select Distinct 1 typeR,webgrName [WEB Group],b.spn,spnid,startPeriod, FinishPeriod,[sSalesZ],[abandonedIVRx],[abandonedQx],'Web_Group_Thresholds' Comment 
from  [dbo].[vWeb_Group_Thresholds_All] b
  join (Select  spn,min(s.[start])minStart from [dbo].[spnThresholds] s join numbers n on n.id = s.spnid group by spn)v on v.spn =b.spn
   where minStart>FinishPeriod 
 --where v.spn='08000093916'
 union all
Select Distinct 2 typeR,'N/A'  [WEB Group], n.spn,0 spnid, a.start,a.finish,long,ivr,short,'spnThresholds' Comment from Numbers n join 
(
Select a.spnid, a.start , coalesce(Dateadd(d,-1,b.start),'20991231')Finish,a.IVR, a.Short, a.Long from  [dbo].[spnThresholds] a left join
[dbo].[spnThresholds]  b on a.spnid=b.spnid 
and a.start<b.start )a
on n.id=spnid  --where spn='08000093916'


--order by spn,4




GO