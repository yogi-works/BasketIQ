IF NOT EXISTS (
    SELECT 1
    FROM sys.tables
    WHERE name = 'ScraperLog'
)
BEGIN
    CREATE TABLE ScraperLog (
    Id              BIGINT        IDENTITY(1,1) PRIMARY KEY,
    PlatformId      INT           NOT NULL,
    Status          NVARCHAR(20)  NOT NULL,       -- Running | Success | Failed
    ProductsScraped INT           NULL,
    ErrorMessage    NVARCHAR(MAX) NULL,
    StartedAt       DATETIME      NOT NULL DEFAULT GETUTCDATE(),
    CompletedAt     DATETIME      NULL,
    DurationSeconds INT           NULL,           -- CompletedAt - StartedAt

    CONSTRAINT FK_ScraperLog_Platform FOREIGN KEY (PlatformId) REFERENCES Platform(Id)
);

CREATE INDEX IX_ScraperLog_PlatformId ON ScraperLog(PlatformId);
CREATE INDEX IX_ScraperLog_StartedAt  ON ScraperLog(StartedAt DESC);

END
GO