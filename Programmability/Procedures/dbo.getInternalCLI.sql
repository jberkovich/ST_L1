SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE procedure [dbo].[getInternalCLI]  -- 1
@checked as bit=0
as



 
 
-- Select CLI+Char(9)+CLIdescr CLI, Checked,(select count(*) from   dbo.internalCLI)cnt From   dbo.internalCLI
--else Select  'No File 'CLI,0 Checked
   
 Select CLI+Char(9)+CLIdescr CLI, Checked
 --,(select count(*) from   dbo.internalCLI)cnt 
 From   dbo.internalCLI
  Where Checked =   @checked or @checked=0
GO