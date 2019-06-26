SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO






CREATE VIEW [dbo].[vThresHoldDefault_ForWeb_L2W] as 

--SELECT 0  vThresHoldDefaultid, '20010101'start, 'Company' [Group], abandonedIVRx, abandonedQx, sSalesZ,'Company Default' comments 
--FROM WEB_L2W.dbo.userSELECTion WHERE webGRid=0

--UNION ALL

SELECT g.webGRid, [startPeriod]  start, WebGRName[Group], abandonedIVRx, abandonedQx, sSalesZ, 'Group Default' comments 
FROM WEB_L2W.dbo.[Web_Group_Thresholds] u
JOIN WEB_L2W.dbo.webgr g on u.webGRid=g.webGRid 
 





GO