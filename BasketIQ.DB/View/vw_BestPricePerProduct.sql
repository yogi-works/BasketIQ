CREATE OR ALTER VIEW vw_BestPricePerProduct AS
SELECT
    p.Id          AS ProductId,
    p.Name        AS ProductName,
    pl.Name       AS Platform,
    pr.CurrentPrice,
    pr.OriginalPrice,
    pr.DiscountPercent,
    pr.OfferLabel,
    pp.ExternalUrl,
    pr.CapturedAt,
    ROW_NUMBER() OVER (
        PARTITION BY p.Id
        ORDER BY pr.CurrentPrice ASC
    ) AS PriceRank
FROM Product p
JOIN PlatformProduct pp ON pp.ProductId  = p.Id
JOIN Platform        pl ON pl.Id         = pp.PlatformId
JOIN Price           pr ON pr.PlatformProductId = pp.Id
WHERE pp.IsAvailable = 1
  AND pl.IsActive    = 1
  AND pr.CapturedAt >= DATEADD(HOUR, -1, GETUTCDATE());  -- prices within last hour only
