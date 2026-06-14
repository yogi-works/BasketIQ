IF NOT EXISTS (
    SELECT 1
    FROM sys.tables
    WHERE name = 'Wishlist'
)
BEGIN
    -- ─── 5. PRICES (Current / latest price per platform listing) ────
   CREATE TABLE Wishlist (
    Id        INT      IDENTITY(1,1) PRIMARY KEY,
    UserId    INT      NOT NULL,
    ProductId INT      NOT NULL,
    AddedAt   DATETIME NOT NULL DEFAULT GETUTCDATE(),

    CONSTRAINT FK_Wishlist_User    FOREIGN KEY (UserId)    REFERENCES Users(Id)    ON DELETE CASCADE,
    CONSTRAINT FK_Wishlist_Product FOREIGN KEY (ProductId) REFERENCES Product(Id) ON DELETE CASCADE,
    CONSTRAINT UQ_Wishlist_UserProduct UNIQUE (UserId, ProductId)
);

CREATE INDEX IX_Wishlist_UserId ON Wishlist(UserId);



END
GO