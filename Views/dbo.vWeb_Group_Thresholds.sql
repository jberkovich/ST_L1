SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--Distinct 0 [Record Type],webgrName [WEB Group],b.spn SPN,spnid SPNid,startPeriod[Threshold Period Start]
--,coalesce (dateadd(d,-1,minStart),FinishPeriod) [Threshold Period Finish], [sSalesZ][Long], [abandonedIVRx][IVR],[abandonedQx][Short],'Web_Group_Thresholds' Comments 

CREATE view [dbo].[vWeb_Group_Thresholds] as
Select Distinct webgrName,spn,spnid,startPeriod start,FinishPeriod finish ,[sSalesZ] long, [abandonedIVRx]ivr,[abandonedQx]short
From
(

Select webgrName,spn,spnid,startPeriod,FinishPeriod,[sSalesZ], [abandonedIVRx],[abandonedQx] From [WEB_L1W].[dbo].[Web_Group_Thresholds]a join [WEB_L1W].[dbo].webgrspn b on a.webGRid =b.webGRid
join [WEB_L1W].[dbo].webgr g on g.webGRid=b.webgrid--31
Union All
Select webgrName,spn,spnid,startPeriod,FinishPeriod,[sSalesZ], [abandonedIVRx],[abandonedQx] From [WEB_L2W].[dbo].[Web_Group_Thresholds]a join [WEB_L2W].[dbo].webgrspn b on a.webGRid =b.webGRid
join [WEB_L2W].[dbo].webgr g on g.webGRid=b.webgrid --29
Union  All
Select webgrName,spn,spnid,startPeriod,FinishPeriod,[sSalesZ], [abandonedIVRx],[abandonedQx] From [WEB_L3W].[dbo].[Web_Group_Thresholds]a join [WEB_L3W].[dbo].webgrspn b on a.webGRid =b.webGRid
join [WEB_L3W].[dbo].webgr g on g.webGRid=b.webgrid --37
Union  All
Select webgrName,spn,spnid,startPeriod,FinishPeriod,[sSalesZ], [abandonedIVRx],[abandonedQx] From [WEB_L5W].[dbo].[Web_Group_Thresholds]a join [WEB_L5W].[dbo].webgrspn b on a.webGRid =b.webGRid
join [WEB_L5W].[dbo].webgr g on g.webGRid=b.webgrid --5
)a

GO