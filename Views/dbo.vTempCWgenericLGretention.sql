SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE view [dbo].[vTempCWgenericLGretention]
as
Select a.tmpIDgenericID,a.Start,a.SPN,a.CLI,d.spn TAD,a.TTA,a.Duration-d.Duration Duration89,a.Duration,a.CallType,a.clientDBname,a.origFileName,a.origFileDate,a.OOH,a.Created,a.ignoredDuration,a.createdTmpGen From 
(Select 
b.parentid,tmpIDgenericID, Start, SPN, CLI, TAD, TTA, Duration89, Duration, CallType, clientDBname, origFileName, origFileDate, OOH, a.Created, ignoredDuration, createdTmpGen
 from rapportdb.dbo.tempCWgeneric a
  Join ST_L1.DBO.RetentionCoterminous b on a.tmpIDgenericID=b.parentid where recordtype=''and clientDBname='st_L1')a
 join ST_L1.DBO.RetentionCoterminous c on a.parentid=c.parentid
 join rapportdb.dbo.tempCWgeneric d on  d.tmpIDgenericID=c.childid
where recordtype='' and   a.clientDBname='st_L1'
union
select * from rapportdb.dbo.tempCWgeneric where tmpIDgenericID not in
(
select parentid from  ST_L1.DBO.RetentionCoterminous where recordtype=''
union all
select childid from  ST_L1.DBO.RetentionCoterminous where recordtype=''
) and clientDBname='st_L1' and spn in( '08009809136','08009809137','03709003110') 
 --select * from vTempCWgenericLGretention 
 --Select * from numbersnew where spn  in( '08009809136','08009809137','03709003110')
 -- order by spn,startSPN
GO