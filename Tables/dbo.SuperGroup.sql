CREATE TABLE [dbo].[SuperGroup] (
  [id] [int] IDENTITY,
  [superGroupID] [int] NOT NULL,
  [sgName] [nvarchar](50) NOT NULL,
  [gr] [nvarchar](50) NOT NULL,
  CONSTRAINT [PK_superGroup] PRIMARY KEY CLUSTERED ([superGroupID], [sgName], [gr])
)
ON [PRIMARY]
GO