IF NOT EXISTS (
    SELECT 1
    FROM sys.tables
    WHERE name = 'Users'
)
BEGIN
    -- ─── 5. PRICES (Current / latest price per platform listing) ────
   CREATE TABLE Users (
    Id              INT           IDENTITY(1,1) PRIMARY KEY,
    FullName        NVARCHAR(150) NOT NULL,
    Email           NVARCHAR(255) NOT NULL,
    PasswordHash    NVARCHAR(500) NULL,           -- NULL if social login
    Pincode         NVARCHAR(10)  NULL,
    City            NVARCHAR(100) NULL,
    IsEmailVerified BIT           NOT NULL DEFAULT 0,
    Role            NVARCHAR(20)  NOT NULL DEFAULT 'User',  -- User | Admin
    CreatedAt       DATETIME      NOT NULL DEFAULT GETUTCDATE(),
    LastLoginAt     DATETIME      NULL,

    CONSTRAINT UQ_Users_Email UNIQUE (Email)
);

CREATE INDEX IX_Users_Email ON Users(Email);


END
GO