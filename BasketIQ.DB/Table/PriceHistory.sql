IF NOT EXISTS (
    SELECT 1
    FROM sys.tables
    WHERE name = 'PriceHistory'
)
BEGIN
    -- ─── 5. PRICES (Current / latest price per platform listing) ────
   CREATE TABLE PriceHistory (
         Id                BIGINT        IDENTITY(1,1) PRIMARY KEY,
         PlatformProductId INT           NOT NULL,
         Price             DECIMAL(10,2) NOT NULL,
         OriginalPrice     DECIMAL(10,2) NULL,
         RecordedDate      DATE          NOT NULL,     -- one row per day per platform listing
         RecordedAt        DATETIME      NOT NULL DEFAULT GETUTCDATE(),

         CONSTRAINT FK_PriceHistory_PlatformProduct FOREIGN KEY (PlatformProductId)
             REFERENCES PlatformProduct(Id),
         CONSTRAINT UQ_PriceHistory_DailySnapshot
             UNIQUE (PlatformProductId, RecordedDate)  -- one row per day
    );

CREATE INDEX IX_PriceHistory_PlatformProductId ON PriceHistory(PlatformProductId);
CREATE INDEX IX_PriceHistory_RecordedDate       ON PriceHistory(RecordedDate DESC);

END
GO