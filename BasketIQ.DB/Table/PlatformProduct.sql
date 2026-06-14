IF NOT EXISTS (
    SELECT 1
    FROM sys.tables
    WHERE name = 'PlatformProduct'
)
BEGIN
    CREATE TABLE PlatformProduct (
    Id                  INT            IDENTITY(1,1) PRIMARY KEY,
    ProductId           INT            NOT NULL,
    PlatformId          INT            NOT NULL,
    ExternalProductId   NVARCHAR(200)  NULL,      -- Platform's own product ID
    ExternalUrl         NVARCHAR(1000) NULL,      -- Deep link to buy
    PlatformProductName NVARCHAR(300)  NULL,      -- Name as shown on platform
    IsAvailable         BIT            NOT NULL DEFAULT 1,
    LastCheckedAt       DATETIME       NULL,

    CONSTRAINT FK_PlatformProduct_Product  FOREIGN KEY (ProductId)  REFERENCES Product(Id),
    CONSTRAINT FK_PlatformProduct_Platform FOREIGN KEY (PlatformId) REFERENCES Platform(Id),
    CONSTRAINT UQ_PlatformProduct_ProductPlatform UNIQUE (ProductId, PlatformId)
);

CREATE INDEX IX_PlatformProduct_ProductId  ON PlatformProduct(ProductId);
CREATE INDEX IX_PlatformProduct_PlatformId ON PlatformProduct(PlatformId);
END
