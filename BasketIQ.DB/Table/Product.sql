IF NOT EXISTS (
    SELECT 1
    FROM sys.tables
    WHERE name = 'Product'
)
BEGIN
    CREATE TABLE Product (
        Id          INT IDENTITY(1,1) PRIMARY KEY,
        Name        NVARCHAR(200) NOT NULL,
        Slug        NVARCHAR(200) NOT NULL,
        Brand       NVARCHAR(100) NULL,
        Description NVARCHAR(MAX) NULL,
        ImageUrl    NVARCHAR(500) NULL,
        Unit        NVARCHAR(50) NULL,
        CategoryId  INT NOT NULL,
        IsActive    BIT NOT NULL DEFAULT 1,
        CreatedAt   DATETIME NOT NULL DEFAULT GETUTCDATE(),

        CONSTRAINT UQ_Products_Slug UNIQUE (Slug),

        CONSTRAINT FK_Products_Category
            FOREIGN KEY (CategoryId)
            REFERENCES Category(Id)
    );
END

CREATE INDEX IX_Product_Name       ON Product(Name);
CREATE INDEX IX_Product_CategoryId ON Product(CategoryId);
CREATE INDEX IX_Product_Brand      ON Product(Brand);