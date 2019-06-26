SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
--Select * from [dbo].[vSpnThresHolds]
--Select * from [vThresHoldDefault]

CREATE VIEW [dbo].[vThresHoldDefault] as 
SELECT 0  vThresHoldDefaultid, '20010101'start, 'Company' [Group], abandonedIVRx, abandonedQx, sSalesZ,'Company Default' comments 
FROM WEB_L1W.dbo.userSELECTion WHERE webGRid=0

UNION ALL
SELECT g.webGRid,'20010101'start,WebGRName,abandonedIVRx,abandonedQx,sSalesZ,'Group Default' comments 
FROM WEB_L3W.dbo.userSELECTion u
JOIN WEB_L3W.dbo.webgr g on u.webGRid=g.webGRid

UNION  

SELECT g.webGRid,'20010101'start,WebGRName,abandonedIVRx,abandonedQx,sSalesZ,'Group Default' comments 
FROM WEB_L5W.dbo.userSELECTion u
JOIN WEB_L5W.dbo.webgr g on u.webGRid=g.webGRid
UNION  


SELECT g.webGRid, '20010101' start, WebGRName, abandonedIVRx, abandonedQx, sSalesZ, 'Group Default' comments 
FROM WEB_L1W.dbo.userSELECTion u
JOIN WEB_L1W.dbo.webgr g on u.webGRid=g.webGRid

UNION  

SELECT g.webGRid,'20010101'start,WebGRName,abandonedIVRx,abandonedQx,sSalesZ,'Group Default' comments 
FROM WEB_L2W.dbo.userSELECTion u
JOIN WEB_L2W.dbo.webgr g on u.webGRid=g.webGRid




--UNION 

--SELECT g.webGRid,'20010101'start,WebGRName,abandonedIVRx,abandonedQx,sSalesZ,'Group Default' comments 
--FROM WEB_L3W.dbo.userSELECTion u
--JOIN WEB_L3W.dbo.webgr g on u.webGRid=g.webGRid


GO