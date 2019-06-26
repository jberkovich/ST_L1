CREATE TABLE [dbo].[qBuster] (
  [Destination] [nvarchar](20) NOT NULL,
  [CLI] [nvarchar](20) NOT NULL,
  [start] [datetime] NOT NULL,
  [result] [nchar](1) NOT NULL,
  [Call type] [nchar](1) NOT NULL,
  CONSTRAINT [PK_qBuster] PRIMARY KEY CLUSTERED ([Destination], [CLI], [start], [result], [Call type])
)
ON [PRIMARY]
GO