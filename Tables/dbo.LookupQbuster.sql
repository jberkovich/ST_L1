CREATE TABLE [dbo].[LookupQbuster] (
  [Destination] [nvarchar](20) NOT NULL,
  [Description] [nvarchar](255) NOT NULL,
  CONSTRAINT [PK_lookupQbuster] PRIMARY KEY CLUSTERED ([Destination])
)
ON [PRIMARY]
GO