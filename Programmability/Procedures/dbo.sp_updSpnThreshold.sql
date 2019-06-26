SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE procedure [dbo].[sp_updSpnThreshold] --775,100,200,300,'20101010'
@SPNid as int,
@IVR as int,
@short as int,
@long as int,
@start as datetime,
@comments as varchar(8000)=''
as
if (Select COUNT(*) from dbo.spnThresholds where spnID=@SPNid and start=@start)>0
begin
update dbo.spnThresholds set IVR=@IVR,short=@short ,long=@long,start=@start,
comments=@comments  where spnID=@SPNid and start=@start
end
else
begin
insert into dbo.spnThresholds (spnID, start, IVR, Short, Long,comments)
values(@spnID,@start,@IVR,@short,@long,@comments)
return @@identity
end
--select * from dbo.spnThresholds
GO