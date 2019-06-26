SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
--select [dbo].[fThresholdsList]('03303030280','20130701','20130801')
create     FUNCTION [dbo].[fThresholdsList] (@SPN varchar(20),
@start as datetime,@finish as datetime

)
RETURNS VARCHAR(1000)
AS

BEGIN 
DECLARE @Text varchar(4000)

-- Declare the variables to store the values returned by FETCH.
DECLARE @itemDecr varchar(150)
DECLARE Threshold_cursor CURSOR FOR
SELECT   
' ('+convert(varchar(11),start,103) +': '+ cast(IVR as varchar(4))+' '+ cast(Short as varchar(4)) +' '+ cast(Long as varchar(4)) +') '
FROM   dbo.vSpnThresHolds  
WHERE  spn= @SPN  and (@start between start and finish or @finish between start and finish) 
order by  start desc
OPEN Threshold_cursor
--Select * from dbo.vSpnThresHolds
-- Perform the first fetch and store the values in variables.
-- Note: The variables are in the same order as the columns
-- in the SELECT statement. 

FETCH NEXT FROM Threshold_cursor
INTO @itemDecr

-- Check @@FETCH_STATUS to see if there are any more rows to fetch.
WHILE @@FETCH_STATUS = 0
BEGIN

   -- Concatenate and display the current values in the variables.
/*   SELECT 'Author: ' + @au_fname + ' ' +  @au_lname*/
    SELECT @Text= isnull(@itemDecr,'') + isnull(@Text,'')
   -- This is executed as long as the previous fetch succeeds.
   FETCH NEXT FROM Threshold_cursor
   INTO @itemDecr
END
CLOSE Threshold_cursor
DEALLOCATE Threshold_cursor


	RETURN  @Text-- '('+LEFT(@TEXT,datalength(@text)-2)  +')'

END












GO