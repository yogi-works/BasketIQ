IF NOT EXISTS (
    SELECT 1
    FROM sys.tables
    WHERE name = 'SearchLog'
)
BEGIN
    CREATE TABLE SearchLog (
        Id          BIGINT        IDENTITY(1,1) PRIMARY KEY,
        UserId      INT           NULL,              -- NULL = guest search
        SearchQuery NVARCHAR(300) NOT NULL,
        ResultCount INT           NULL,
        SearchedAt  DATETIME      NOT NULL DEFAULT GETUTCDATE(),
    
        CONSTRAINT FK_SearchLog_User FOREIGN KEY (UserId) REFERENCES Users(Id)
    );
    
    CREATE INDEX IX_SearchLog_SearchQuery ON SearchLog(SearchQuery);
    CREATE INDEX IX_SearchLog_SearchedAt  ON SearchLog(SearchedAt DESC);

END
GO