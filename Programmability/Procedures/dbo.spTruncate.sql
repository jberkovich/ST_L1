SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
Create PROCEDURE [dbo].[spTruncate]
    @nameTable varchar(60)  
    WITH EXECUTE AS 'truncate_proxy'
    AS

SET NOCOUNT OFF;
DECLARE @QUERY NVARCHAR(200);

SET @QUERY = N'TRUNCATE TABLE ' + @nameTable + ';'

EXECUTE sp_executesql @QUERY;
/*
CREATE USER [truncate_proxy] WITHOUT LOGIN;
GO
GRANT ALTER TO [truncate_proxy];
GO
*/

GO