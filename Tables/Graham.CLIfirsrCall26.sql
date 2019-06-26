CREATE TABLE [Graham].[CLIfirsrCall26] (
  [CLInew] [nvarchar](25) NOT NULL,
  [SPNnew] [nvarchar](25) NULL
)
ON [PRIMARY]
GO

CREATE UNIQUE CLUSTERED INDEX [IX_CLIfirsrCall]
  ON [Graham].[CLIfirsrCall26] ([CLInew], [SPNnew])
  ON [PRIMARY]
GO