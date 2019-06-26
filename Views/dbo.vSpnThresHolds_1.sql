SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO




Create view [dbo].[vSpnThresHolds_1] as
Select spnThresHoldsid id,n.spn,n.id spnid,
 t.IVR ,
 Short,
 Long,
 start,
''comments,
1 addedManualy
From spnThresHolds t 
join numbers n on t.spnid=n.id
union all
 Select  0 spnThresHoldsid ,n.spn,n.id spnid,
 abandonedIVRx IVR,
 abandonedQx Short,
 sSalesZ Long,
    '20000101'start,
  Coalesce(v.comments,'no comments')comments,0 addedManualy
--Coalesce( t.IVR,abandonedIVRx)IVR,
--Coalesce(  t.Short,abandonedQx)Short,
--Coalesce(  t.Long,sSalesZ)Long,
--Coalesce(  t.start ,startSPN)start,
--Coalesce(t.comments,v.comments,'no comments')comments
 from 
  Numbers n join vThresHoldDefault v on v.[Group]=n.[Group] 
  left join dbo.spnThresHolds s on s.spnid=n.id and  s.start='20000101'
  where s.spnid is null
 -- where spn='08444722599' 
 --left join  spnThresHolds t on t.spnID=n.id and t.start=v.start
--where t.spnID is null




GO