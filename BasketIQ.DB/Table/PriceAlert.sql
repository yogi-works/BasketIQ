IF NOT EXISTS (
    SELECT 1
    FROM sys.tables
    WHERE name = 'PriceAlert'
)
BEGIN
    CREATE TABLE PriceAlert (
    Id          INT           IDENTITY(1,1) PRIMARY KEY,
    UserId      INT           NOT NULL,
    ProductId   INT           NOT NULL,
    PlatformId  INT           NULL,              -- NULL = alert on ANY platform
    TargetPrice DECIMAL(10,2) NOT NULL,          -- alert when price drops to/below this
    IsActive    BIT           NOT NULL DEFAULT 1,
    TriggeredAt DATETIME      NULL,              -- NULL = not yet triggered
    CreatedAt   DATETIME      NOT NULL DEFAULT GETUTCDATE(),

    CONSTRAINT FK_PriceAlert_User     FOREIGN KEY (UserId)    REFERENCES Users(Id)     ON DELETE CASCADE,
    CONSTRAINT FK_PriceAlert_Product  FOREIGN KEY (ProductId) REFERENCES Product(Id),
    CONSTRAINT FK_PriceAlert_Platform FOREIGN KEY (PlatformId) REFERENCES Platform(Id)
);

CREATE INDEX IX_PriceAlert_UserId    ON PriceAlert(UserId);
CREATE INDEX IX_PriceAlert_ProductId ON PriceAlert(ProductId);
CREATE INDEX IX_PriceAlert_IsActive  ON PriceAlert(IsActive);
END
GO