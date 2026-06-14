IF NOT EXISTS (
    SELECT 1
    FROM sys.tables
    WHERE name = 'Category'
)
BEGIN
    CREATE TABLE Category (
        Id               INT           IDENTITY(1,1) PRIMARY KEY,
        Name             NVARCHAR(100) NOT NULL,
        Slug             NVARCHAR(100) NOT NULL,
        IconEmoji        NVARCHAR(10)  NULL,         -- 🥛 🧅 🍅
        ParentCategoryId INT           NULL,          -- self-reference for sub-categories
        SortOrder        INT           NOT NULL DEFAULT 0,
        IsActive         BIT           NOT NULL DEFAULT 1,
    
        CONSTRAINT UQ_Category_Slug UNIQUE (Slug),
        CONSTRAINT FK_Category_Parent FOREIGN KEY (ParentCategoryId)
            REFERENCES Category(Id)
    );
END
GO