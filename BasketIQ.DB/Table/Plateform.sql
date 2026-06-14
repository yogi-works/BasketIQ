IF NOT EXISTS (SELECT 1 FROM sys.tables WHERE name = 'Platform')
    BEGIN
        CREATE TABLE Platform (
        Id               INT           IDENTITY(1,1) PRIMARY KEY,
        Name             NVARCHAR(100) NOT NULL,      -- Blinkit, Zepto…
        Slug             NVARCHAR(100) NOT NULL,      -- blinkit, zepto…
        LogoUrl          NVARCHAR(500) NULL,
        WebsiteUrl       NVARCHAR(500) NULL,
        Color            NVARCHAR(10)  NULL,          -- #F59E0B
        AvgDeliveryMins  INT           NULL,          -- 10, 20, 120
        ScraperClass     NVARCHAR(100) NULL,          -- BlinkitScraper
        IsActive         BIT           NOT NULL DEFAULT 1,
        LastScrapedAt    DATETIME      NULL,
    
        CONSTRAINT UQ_Platform_Slug UNIQUE (Slug)
    );
END
GO




INSERT INTO Platform (Name, Slug, Color, AvgDeliveryMins, ScraperClass, IsActive)
VALUES
    ('Blinkit',          'blinkit',          '#F59E0B', 10,  'BlinkitScraper',         1),
    ('Zepto',            'zepto',            '#7C3AED', 10,  'ZeptoScraper',           1),
    ('BigBasket',        'bigbasket',        '#059669', 120, 'BigBasketScraper',       1),
    ('JioMart',          'jiomart',          '#2563EB', 60,  'JioMartScraper',         1),
    ('Swiggy Instamart', 'swiggy-instamart', '#DC2626', 15,  'SwiggyInstamartScraper', 1),
    ('Amazon Fresh',     'amazon-fresh',     '#EA580C', 120, 'AmazonFreshScraper',     1);