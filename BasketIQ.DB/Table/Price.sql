IF NOT EXISTS (
    SELECT 1
    FROM sys.tables
    WHERE name = 'Price'
)
BEGIN
    -- ─── 5. PRICES (Current / latest price per platform listing) ────
    CREATE TABLE Price (
        Id                BIGINT         IDENTITY(1,1) PRIMARY KEY,
        PlatformProductId INT            NOT NULL,
        CurrentPrice      DECIMAL(10,2)  NOT NULL,
        OriginalPrice     DECIMAL(10,2)  NULL,        -- MRP before discount
        DiscountPercent   DECIMAL(5,2)   NULL,        -- 15.50 = 15.5% off
        OfferLabel        NVARCHAR(200)  NULL,        -- Buy 2 Get 1 Free
        CapturedAt        DATETIME       NOT NULL DEFAULT GETUTCDATE(),
    
        CONSTRAINT FK_Price_PlatformProduct FOREIGN KEY (PlatformProductId)
            REFERENCES PlatformProduct(Id)
    );

    CREATE INDEX IX_Price_PlatformProductId ON Price(PlatformProductId);
    CREATE INDEX IX_Price_CapturedAt        ON Price(CapturedAt DESC);
    CREATE INDEX IX_Price_CurrentPrice      ON Price(CurrentPrice);
END
GO