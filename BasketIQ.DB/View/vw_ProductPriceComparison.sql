CREATE OR ALTER VIEW vw_ProductPriceComparison AS
SELECT
    p.Id          AS ProductId,
    p.Name        AS ProductName,
    p.Unit,
    pl.Id         AS PlatformId,
    pl.Name       AS PlatformName,
    pl.Color      AS PlatformColor,
    pl.AvgDeliveryMins,
    pp.ExternalUrl,
    pr.CurrentPrice,
    pr.OriginalPrice,
    pr.DiscountPercent,
    pr.OfferLabel,
    pr.CapturedAt
FROM Product        p
JOIN PlatformProduct pp ON pp.ProductId         = p.Id
JOIN Platform        pl ON pl.Id                = pp.PlatformId
JOIN Price           pr ON pr.PlatformProductId = pp.Id
WHERE pp.IsAvailable = 1
  AND pl.IsActive    = 1;