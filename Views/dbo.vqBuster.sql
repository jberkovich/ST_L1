SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE VIEW [dbo].[vqBuster]
AS
SELECT *
FROM  dbo.qBuster
WHERE ([Call type] = 'D') AND (result = 'C')



GO