SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
--USE [ST_L1]
--GO

--/****** Object:  View [dbo].[vspnThresholds_L1_new_Full]    Script Date: 05/10/2018 12:36:00 ******/
--SET ANSI_NULLS ON
--GO

--SET QUOTED_IDENTIFIER ON
--GO


 --Select * from [dbo].[vspnThresholds_L1_new_Full] where spn in('03702635510') 



CREATE view  [dbo].[vspnThresholds_L1_new_Full] as
Select Distinct 0 [Record Type],webgrName [WEB Group],b.spn SPN,spnid SPNid,startPeriod[Threshold Period Start],coalesce (dateadd(d,-1,minStart),FinishPeriod) [Threshold Period Finish], [sSalesZ][Long], [abandonedIVRx][IVR],[abandonedQx][Short],'Web_Group_Thresholds' Comments 
from  [WEB_L1W].[dbo].[Web_Group_Thresholds]a  join [WEB_L1W].[dbo].webgrspn b on a.webGRid =b.webGRid
join [WEB_L1W].[dbo].webgr g on g.webGRid=b.webgrid
left  join (Select  spn,min(s.[start])minStart from [dbo].[spnThresholds] s join numbers n on n.id = s.spnid group by spn)v on v.spn =b.spn
where v.spn is null
--and   b.spn in('03702635510')
Union All
Select Distinct 1 typeR,webgrName [WEB Group],b.spn,spnid,a.startPeriod, FinishPeriod,[sSalesZ],[abandonedIVRx],[abandonedQx],
'Web_Group_Thresholds' Comment 
from  [WEB_L1W].[dbo].[Web_Group_Thresholds]a  join [WEB_L1W].[dbo].webgrspn b on a.webGRid =b.webGRid
join [WEB_L1W].[dbo].webgr g on g.webGRid=b.webgrid
  join (
  Select  spn,min(s.[start])minStart from [dbo].[spnThresholds] s join numbers n on n.id = s.spnid
    --where spn in('03702635510') 
	 group by spn
  )v on v.spn =b.spn
 where minStart>FinishPeriod 

 union all
Select Distinct 2 typeR,'N/A'  [WEB Group], n.spn,0 spnid, a.start,a.finish,long,ivr,short,'spnThresholds' Comment from Numbers n join 
(
Select a.spnid, a.start , coalesce(Dateadd(d,-1,b.start),'20991231')Finish,a.IVR, a.Short, a.Long from  [dbo].[spnThresholds] a left join
[dbo].[spnThresholds]  b on a.spnid=b.spnid 
and a.start<b.start )a
on n.id=spnid --where spn='03702635510'


--order by spn,4


--Select  * from [dbo].[spnThresholds] s join numbers n on n.id = s.spnid  where spn in('03702635510') 

--   --Select * from WEB_L1W.dbo.Web_Group_Thresholds where webGRid=31

--   Select Distinct 1 typeR,webgrName [WEB Group],b.spn,spnid,a.startPeriod, minStart, FinishPeriod,[sSalesZ],[abandonedIVRx],[abandonedQx],
--'Web_Group_Thresholds' Comment 
--from  [WEB_L1W].[dbo].[Web_Group_Thresholds]a  join [WEB_L1W].[dbo].webgrspn b on a.webGRid =b.webGRid
--join [WEB_L1W].[dbo].webgr g on g.webGRid=b.webgrid 
-- join (
--  Select  spn,min(s.[start])minStart from [dbo].[spnThresholds] s join numbers n on n.id = s.spnid  where spn in('03702635510')  group by spn
--  )v on v.spn =b.spn

 --where minStart>FinishPeriod 
GO