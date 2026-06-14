-- ============================================================
--  BasketIQ — Sample Data INSERT Scripts
--  Run in ORDER — foreign keys depend on earlier inserts
--  Compatible with SQL Server (use GETUTCDATE())
--  For PostgreSQL replace GETUTCDATE() with NOW()
-- ============================================================

-- ─── 1. Category ──────────────────────────────────────────────
-- Parent Category first, then sub-Category

INSERT INTO Category (Name, Slug, IconEmoji, ParentCategoryId, SortOrder, IsActive)
VALUES
    ('Dairy & Eggs',        'dairy-eggs',       '🥛', NULL, 1,  1),
    ('Fruits & Vegetables', 'fruits-vegetables', '🥦', NULL, 2,  1),
    ('Staples & Grains',    'staples-grains',   '🌾', NULL, 3,  1),
    ('Snacks & Beverages',  'snacks-beverages', '🍟', NULL, 4,  1),
    ('Oils & Condiments',   'oils-condiments',  '🫒', NULL, 5,  1),
    ('Personal Care',       'personal-care',    '🧴', NULL, 6,  1),
    ('Household',           'household',        '🧹', NULL, 7,  1);

-- Sub-Category (ParentCategoryId references above)
INSERT INTO Category (Name, Slug, IconEmoji, ParentCategoryId, SortOrder, IsActive)
VALUES
    ('Milk',            'milk',            '🥛', 1, 1, 1),   -- child of Dairy & Eggs (Id=1)
    ('Curd & Yoghurt',  'curd-yoghurt',    '🍦', 1, 2, 1),
    ('Butter & Cheese', 'butter-cheese',   '🧀', 1, 3, 1),
    ('Eggs',            'eggs',            '🥚', 1, 4, 1),
    ('Fresh Vegetables','fresh-vegetables','🥦', 2, 1, 1),   -- child of Fruits & Veg (Id=2)
    ('Fresh Fruits',    'fresh-fruits',    '🍌', 2, 2, 1),
    ('Atta & Flour',    'atta-flour',      '🌾', 3, 1, 1),   -- child of Staples (Id=3)
    ('Rice & Pulses',   'rice-pulses',     '🍚', 3, 2, 1),
    ('Sugar & Salt',    'sugar-salt',      '🧂', 3, 3, 1),
    ('Chips & Namkeen', 'chips-namkeen',   '🍟', 4, 1, 1),   -- child of Snacks (Id=4)
    ('Juices & Drinks', 'juices-drinks',   '🧃', 4, 2, 1),
    ('Edible Oils',     'edible-oils',     '🫒', 5, 1, 1);   -- child of Oils (Id=5)

-- ─── 2. Product ────────────────────────────────────────────────
-- CategoryId references sub-Category above

INSERT INTO Product (Name, Slug, Brand, Description, ImageUrl, Unit, CategoryId, IsActive, CreatedAt)
VALUES
-- Milk (CategoryId = 8)
('Amul Taaza Full Cream Milk',   'amul-taaza-milk-1l',     'Amul',      'Fresh full cream pasteurised milk',          NULL, '1 Litre',   8, 1, GETUTCDATE()),
('Amul Gold Full Cream Milk',    'amul-gold-milk-500ml',   'Amul',      'Rich and creamy full cream milk',            NULL, '500 ml',    8, 1, GETUTCDATE()),
('Mother Dairy Full Cream Milk', 'mother-dairy-milk-1l',   'Mother Dairy','Farm fresh pasteurised milk',             NULL, '1 Litre',   8, 1, GETUTCDATE()),
('Nandini Good Life Toned Milk', 'nandini-toned-milk-1l',  'Nandini',   'Low fat toned milk',                        NULL, '1 Litre',   8, 1, GETUTCDATE()),

-- Eggs (CategoryId = 11)
('Farm Fresh White Eggs',        'farm-fresh-eggs-12',     'Farm Fresh','Farm-raised white eggs pack of 12',          NULL, '12 pcs',   11, 1, GETUTCDATE()),
('Licious Free Range Eggs',      'licious-eggs-6',         'Licious',   'Free range brown eggs pack of 6',            NULL, '6 pcs',    11, 1, GETUTCDATE()),

-- Fresh Vegetables (CategoryId = 12)
('Onions',                       'fresh-onions-1kg',       NULL,        'Fresh red onions',                          NULL, '1 kg',     12, 1, GETUTCDATE()),
('Tomatoes',                     'fresh-tomatoes-500g',    NULL,        'Farm fresh ripe tomatoes',                  NULL, '500 g',    12, 1, GETUTCDATE()),
('Potatoes',                     'fresh-potatoes-1kg',     NULL,        'Fresh potatoes from farms',                 NULL, '1 kg',     12, 1, GETUTCDATE()),
('Spinach (Palak)',               'fresh-spinach-250g',     NULL,        'Fresh green spinach leaves',               NULL, '250 g',    12, 1, GETUTCDATE()),
('Broccoli',                     'fresh-broccoli-500g',    NULL,        'Fresh green broccoli florets',              NULL, '500 g',    12, 1, GETUTCDATE()),

-- Fresh Fruits (CategoryId = 13)
('Bananas',                      'fresh-bananas-12pc',     NULL,        'Fresh ripe yellow bananas',                 NULL, '12 pcs',   13, 1, GETUTCDATE()),
('Apples (Shimla)',               'shimla-apples-4pc',      NULL,        'Fresh Shimla apples medium size',          NULL, '4 pcs',    13, 1, GETUTCDATE()),

-- Atta & Flour (CategoryId = 14)
('Aashirvaad Whole Wheat Atta',  'aashirvaad-atta-5kg',   'Aashirvaad','100% whole wheat superior MP wheat atta',   NULL, '5 kg',     14, 1, GETUTCDATE()),
('Aashirvaad Whole Wheat Atta',  'aashirvaad-atta-10kg',  'Aashirvaad','100% whole wheat superior MP wheat atta',   NULL, '10 kg',    14, 1, GETUTCDATE()),
('Pillsbury Maida',              'pillsbury-maida-1kg',   'Pillsbury', 'Refined flour for baking and cooking',       NULL, '1 kg',     14, 1, GETUTCDATE()),

-- Rice & Pulses (CategoryId = 15)
('India Gate Basmati Rice',      'india-gate-basmati-5kg','India Gate', 'Classic aged basmati rice',                NULL, '5 kg',     15, 1, GETUTCDATE()),
('Tata Sampann Chana Dal',       'tata-chana-dal-1kg',    'Tata',      'Unpolished chana dal rich in protein',      NULL, '1 kg',     15, 1, GETUTCDATE()),

-- Sugar & Salt (CategoryId = 16)
('Tata Salt',                    'tata-salt-1kg',          'Tata',      'Iodised vacuum evaporated salt',            NULL, '1 kg',     16, 1, GETUTCDATE()),
('Sugar',                        'sugar-1kg',              NULL,        'White refined crystal sugar',               NULL, '1 kg',     16, 1, GETUTCDATE()),

-- Chips & Namkeen (CategoryId = 17)
('Lays Classic Salted Chips',    'lays-classic-26g',       'PepsiCo',   'Classic salted potato chips',               NULL, '26 g',     17, 1, GETUTCDATE()),
('Haldirams Aloo Bhujia',        'haldirams-aloo-200g',    'Haldirams', 'Crispy potato bhujia namkeen',              NULL, '200 g',    17, 1, GETUTCDATE()),
('Britannia Good Day Biscuits',  'britannia-good-day-87g', 'Britannia', 'Butter cookies with cashew',                NULL, '87 g',     17, 1, GETUTCDATE()),

-- Juices & Drinks (CategoryId = 18)
('Real Mixed Fruit Juice',       'real-juice-mixed-1l',    'Dabur',     'Mixed fruit juice drink no added colour',   NULL, '1 Litre',  18, 1, GETUTCDATE()),
('Tropicana Orange Juice',       'tropicana-orange-1l',    'PepsiCo',   '100% pure squeezed orange juice',           NULL, '1 Litre',  18, 1, GETUTCDATE()),

-- Edible Oils (CategoryId = 19)
('Fortune Sunflower Oil',        'fortune-sunflower-1l',   'Fortune',   'Refined sunflower oil',                     NULL, '1 Litre',  19, 1, GETUTCDATE()),
('Saffola Gold Oil',             'saffola-gold-1l',        'Marico',    'Blended edible vegetable oil',              NULL, '1 Litre',  19, 1, GETUTCDATE()),
('Tata Canola Oil',              'tata-canola-1l',         'Tata',      'Light & healthy canola oil',                NULL, '1 Litre',  19, 1, GETUTCDATE());

-- ─── 3. Platform ───────────────────────────────────────────────
INSERT INTO Platform (Name, Slug, LogoUrl, WebsiteUrl, Color, AvgDeliveryMins, ScraperClass, IsActive, LastScrapedAt)
VALUES
    ('Blinkit',          'blinkit',          NULL, 'https://blinkit.com',        '#F59E0B', 10,  'BlinkitScraper',         1, GETUTCDATE()),
    ('Zepto',            'zepto',            NULL, 'https://www.zeptonow.com',   '#7C3AED', 10,  'ZeptoScraper',           1, GETUTCDATE()),
    ('BigBasket',        'bigbasket',        NULL, 'https://www.bigbasket.com',  '#059669', 120, 'BigBasketScraper',       1, GETUTCDATE()),
    ('JioMart',          'jiomart',          NULL, 'https://www.jiomart.com',    '#2563EB', 60,  'JioMartScraper',         1, GETUTCDATE()),
    ('Swiggy Instamart', 'swiggy-instamart', NULL, 'https://www.swiggy.com',     '#DC2626', 15,  'SwiggyInstamartScraper', 1, GETUTCDATE()),
    ('Amazon Fresh',     'amazon-fresh',     NULL, 'https://www.amazon.in',      '#EA580C', 120, 'AmazonFreshScraper',     1, GETUTCDATE());

-- ─── 4. PLATFORM Product ───────────────────────────────────────
-- Maps each product to each platform
-- ProductId 1 = Amul Taaza 1L, PlatformId 1=Blinkit 2=Zepto 3=BigBasket 4=JioMart 5=Swiggy 6=Amazon

INSERT INTO PlatformProduct (ProductId, PlatformId, ExternalProductId, ExternalUrl, PlatformProductName, IsAvailable, LastCheckedAt)
VALUES
-- Amul Taaza Milk 1L (ProductId=1) on all 6 Platform
(1, 1, 'BLK-AMT-001', 'https://blinkit.com/prn/amul-taaza-1l/prid/11',   'Amul Taaza Full Cream Milk 1L', 1, GETUTCDATE()),
(1, 2, 'ZPT-AMT-001', 'https://zeptonow.com/product/amul-taaza-1l',       'Amul Taaza Milk 1 Litre',       1, GETUTCDATE()),
(1, 3, 'BBK-AMT-001', 'https://bigbasket.com/pd/amul-taaza-1l',           'Amul Taaza Full Cream Milk',    1, GETUTCDATE()),
(1, 4, 'JIO-AMT-001', 'https://jiomart.com/p/amul-taaza-full-cream-1l',   'Amul Taaza Milk 1 Ltr',         1, GETUTCDATE()),
(1, 5, 'SWG-AMT-001', 'https://swiggy.com/instamart/product/amul-taaza',  'Amul Taaza 1L',                 1, GETUTCDATE()),
(1, 6, 'AMZ-AMT-001', 'https://amazon.in/dp/B08AMT001',                   'Amul Taaza Full Cream Milk 1L', 1, GETUTCDATE()),

-- Farm Fresh Eggs 12pc (ProductId=5) on 5 Platform
(5, 1, 'BLK-EGG-012', 'https://blinkit.com/prn/eggs-12/prid/12',         'Farm Fresh White Eggs 12pcs',   1, GETUTCDATE()),
(5, 2, 'ZPT-EGG-012', 'https://zeptonow.com/product/eggs-12',             'White Eggs Pack of 12',         1, GETUTCDATE()),
(5, 3, 'BBK-EGG-012', 'https://bigbasket.com/pd/eggs-12',                 'Farm Eggs 12 pcs',              1, GETUTCDATE()),
(5, 5, 'SWG-EGG-012', 'https://swiggy.com/instamart/product/eggs-12',    'Eggs - White, 12 pcs',          1, GETUTCDATE()),
(5, 6, 'AMZ-EGG-012', 'https://amazon.in/dp/B08EGG012',                   'Farm Fresh Eggs 12 count',      1, GETUTCDATE()),

-- Onions 1kg (ProductId=7) on all 6 Platform
(7, 1, 'BLK-ONI-001', 'https://blinkit.com/prn/onion-1kg/prid/13',       'Onion 1 kg',                    1, GETUTCDATE()),
(7, 2, 'ZPT-ONI-001', 'https://zeptonow.com/product/onions-1kg',          'Red Onion 1 Kg',                1, GETUTCDATE()),
(7, 3, 'BBK-ONI-001', 'https://bigbasket.com/pd/onions-1kg',              'Fresho Onion 1 Kg',             1, GETUTCDATE()),
(7, 4, 'JIO-ONI-001', 'https://jiomart.com/p/onion-1kg',                  'Onion 1 Kg',                    1, GETUTCDATE()),
(7, 5, 'SWG-ONI-001', 'https://swiggy.com/instamart/product/onion-1kg',  'Onion 1 Kg',                    1, GETUTCDATE()),
(7, 6, 'AMZ-ONI-001', 'https://amazon.in/dp/B08ONI001',                   'Fresh Onions 1 Kg',             1, GETUTCDATE()),

-- Aashirvaad Atta 5kg (ProductId=14) on all 6 Platform
(14, 1, 'BLK-ASH-5KG', 'https://blinkit.com/prn/aashirvaad-atta-5kg',    'Aashirvaad Atta 5 Kg',          1, GETUTCDATE()),
(14, 2, 'ZPT-ASH-5KG', 'https://zeptonow.com/product/aashirvaad-atta-5kg','Aashirvaad Whole Wheat Atta 5kg',1, GETUTCDATE()),
(14, 3, 'BBK-ASH-5KG', 'https://bigbasket.com/pd/aashirvaad-atta-5kg',   'Aashirvaad Atta 5 kg',          1, GETUTCDATE()),
(14, 4, 'JIO-ASH-5KG', 'https://jiomart.com/p/aashirvaad-atta-5kg',      'Aashirvaad Atta 5 Kg',          1, GETUTCDATE()),
(14, 5, 'SWG-ASH-5KG', 'https://swiggy.com/instamart/product/atta-5kg',  'Aashirvaad Atta 5 Kg',          1, GETUTCDATE()),
(14, 6, 'AMZ-ASH-5KG', 'https://amazon.in/dp/B08ASH5KG',                  'Aashirvaad Whole Wheat Atta 5kg',1, GETUTCDATE()),

-- Fortune Sunflower Oil 1L (ProductId=25) on all 6 Platform
(25, 1, 'BLK-FSO-001', 'https://blinkit.com/prn/fortune-sunflower-1l',   'Fortune Sunflower Oil 1L',       1, GETUTCDATE()),
(25, 2, 'ZPT-FSO-001', 'https://zeptonow.com/product/fortune-oil-1l',    'Fortune Sunflower Oil 1 Litre',  1, GETUTCDATE()),
(25, 3, 'BBK-FSO-001', 'https://bigbasket.com/pd/fortune-sunflower-1l',  'Fortune Sunflower Oil 1L',       1, GETUTCDATE()),
(25, 4, 'JIO-FSO-001', 'https://jiomart.com/p/fortune-sunflower-oil-1l', 'Fortune Sunflower Oil 1 Ltr',    1, GETUTCDATE()),
(25, 5, 'SWG-FSO-001', 'https://swiggy.com/instamart/product/fortune-1l','Fortune Sunflower Oil 1L',       1, GETUTCDATE()),
(25, 6, 'AMZ-FSO-001', 'https://amazon.in/dp/B08FSO001',                  'Fortune Sunflower Oil 1 Litre',  1, GETUTCDATE()),

-- Tata Salt 1kg (ProductId=19) on 5 Platform
(19, 1, 'BLK-TST-001', 'https://blinkit.com/prn/tata-salt-1kg',          'Tata Salt 1 kg',                1, GETUTCDATE()),
(19, 2, 'ZPT-TST-001', 'https://zeptonow.com/product/tata-salt-1kg',     'Tata Salt 1Kg',                 1, GETUTCDATE()),
(19, 3, 'BBK-TST-001', 'https://bigbasket.com/pd/tata-salt-1kg',         'Tata Salt 1 kg',                1, GETUTCDATE()),
(19, 4, 'JIO-TST-001', 'https://jiomart.com/p/tata-salt-1kg',            'Tata Salt 1 Kg',                1, GETUTCDATE()),
(19, 6, 'AMZ-TST-001', 'https://amazon.in/dp/B08TST001',                  'Tata Salt 1kg',                 1, GETUTCDATE()),

-- Lays Classic Chips 26g (ProductId=21) on 4 Platform
(21, 1, 'BLK-LYS-026', 'https://blinkit.com/prn/lays-classic-26g',       'Lays Classic Salted 26g',       1, GETUTCDATE()),
(21, 2, 'ZPT-LYS-026', 'https://zeptonow.com/product/lays-26g',          'Lay''s Classic Salted Chips 26g',1, GETUTCDATE()),
(21, 3, 'BBK-LYS-026', 'https://bigbasket.com/pd/lays-classic-26g',      'Lays Classic Salted Chips 26g', 1, GETUTCDATE()),
(21, 5, 'SWG-LYS-026', 'https://swiggy.com/instamart/product/lays-26g',  'Lays Classic 26g',              1, GETUTCDATE()),

-- Britannia Good Day 87g (ProductId=23) on 5 Platform
(23, 1, 'BLK-BGD-087', 'https://blinkit.com/prn/britannia-good-day-87g', 'Britannia Good Day Butter 87g', 1, GETUTCDATE()),
(23, 2, 'ZPT-BGD-087', 'https://zeptonow.com/product/good-day-87g',      'Good Day Cashew Cookies 87g',   1, GETUTCDATE()),
(23, 3, 'BBK-BGD-087', 'https://bigbasket.com/pd/britannia-good-day-87g','Britannia Good Day Cookies 87g',1, GETUTCDATE()),
(23, 4, 'JIO-BGD-087', 'https://jiomart.com/p/britannia-good-day-87g',   'Britannia Good Day 87g',        1, GETUTCDATE()),
(23, 6, 'AMZ-BGD-087', 'https://amazon.in/dp/B08BGD087',                  'Britannia Good Day Butter 87g', 1, GETUTCDATE());

-- ─── 5. Price (Current live Price) ────────────────────────────
-- PlatformProductId sequence: check your actual IDs after inserting PlatformProduct
-- Assuming IDs 1-6   = Amul Taaza Milk on 6 Platform
--           IDs 7-11  = Farm Fresh Eggs on 5 Platform
--           IDs 12-17 = Onions on 6 Platform
--           IDs 18-23 = Aashirvaad Atta on 6 Platform
--           IDs 24-29 = Fortune Oil on 6 Platform
--           IDs 30-34 = Tata Salt on 5 Platform
--           IDs 35-38 = Lays on 4 Platform
--           IDs 39-43 = Britannia Good Day on 5 Platform

INSERT INTO Price (PlatformProductId, CurrentPrice, OriginalPrice, DiscountPercent, OfferLabel, CapturedAt)
VALUES
-- Amul Taaza Milk 1L
(1,  65.00, 68.00, 4.41,  NULL,                      GETUTCDATE()),  -- Blinkit
(2,  66.00, 68.00, 2.94,  NULL,                      GETUTCDATE()),  -- Zepto
(3,  62.00, 65.00, 4.62,  '5% off on 2 items',       GETUTCDATE()),  -- BigBasket BEST
(4,  64.00, 68.00, 5.88,  NULL,                      GETUTCDATE()),  -- JioMart
(5,  67.00, 68.00, 1.47,  NULL,                      GETUTCDATE()),  -- Swiggy Instamart
(6,  68.00, 68.00, 0.00,  NULL,                      GETUTCDATE()),  -- Amazon Fresh

-- Farm Fresh Eggs 12pc
(7,  92.00, 96.00, 4.17,  NULL,                      GETUTCDATE()),  -- Blinkit
(8,  84.00, 96.00, 12.50, 'Limited time deal',        GETUTCDATE()),  -- Zepto BEST
(9,  88.00, 96.00, 8.33,  NULL,                      GETUTCDATE()),  -- BigBasket
(10, 89.00, 96.00, 7.29,  NULL,                      GETUTCDATE()),  -- Swiggy
(11, 90.00, 96.00, 6.25,  'Pack of 12',               GETUTCDATE()),  -- Amazon

-- Onions 1kg
(12, 42.00, 45.00, 6.67,  NULL,                      GETUTCDATE()),  -- Blinkit
(13, 40.00, 45.00, 11.11, NULL,                      GETUTCDATE()),  -- Zepto
(14, 38.00, 45.00, 15.56, 'Farm fresh offer',         GETUTCDATE()),  -- BigBasket BEST
(15, 36.00, 45.00, 20.00, 'Weekend special',          GETUTCDATE()),  -- JioMart BEST (even better)
(16, 44.00, 45.00, 2.22,  NULL,                      GETUTCDATE()),  -- Swiggy
(17, 45.00, 45.00, 0.00,  NULL,                      GETUTCDATE()),  -- Amazon

-- Aashirvaad Atta 5kg
(18, 285.00, 320.00, 10.94, NULL,                    GETUTCDATE()),  -- Blinkit
(19, 278.00, 320.00, 13.13, NULL,                    GETUTCDATE()),  -- Zepto
(20, 295.00, 320.00, 7.81,  '5% off on subscription',GETUTCDATE()),  -- BigBasket
(21, 268.00, 320.00, 16.25, 'JioMart Super Saver',   GETUTCDATE()),  -- JioMart BEST
(22, 290.00, 320.00, 9.38,  NULL,                    GETUTCDATE()),  -- Swiggy
(23, 298.00, 320.00, 6.88,  NULL,                    GETUTCDATE()),  -- Amazon

-- Fortune Sunflower Oil 1L
(24, 149.00, 160.00, 6.88, NULL,                     GETUTCDATE()),  -- Blinkit
(25, 145.00, 160.00, 9.38, NULL,                     GETUTCDATE()),  -- Zepto
(26, 138.00, 160.00, 13.75,'BB Star Deal',            GETUTCDATE()),  -- BigBasket BEST
(27, 142.00, 160.00, 11.25, NULL,                    GETUTCDATE()),  -- JioMart
(28, 148.00, 160.00, 7.50, NULL,                     GETUTCDATE()),  -- Swiggy
(29, 152.00, 160.00, 5.00, NULL,                     GETUTCDATE()),  -- Amazon

-- Tata Salt 1kg
(30, 24.00, 27.00, 11.11, NULL,                      GETUTCDATE()),  -- Blinkit
(31, 22.00, 27.00, 18.52, 'Limited offer',            GETUTCDATE()),  -- Zepto BEST
(32, 23.00, 27.00, 14.81, NULL,                      GETUTCDATE()),  -- BigBasket
(33, 25.00, 27.00, 7.41,  NULL,                      GETUTCDATE()),  -- JioMart
(34, 26.00, 27.00, 3.70,  NULL,                      GETUTCDATE()),  -- Amazon

-- Lays Classic Chips 26g
(35, 10.00, 10.00, 0.00,  NULL,                      GETUTCDATE()),  -- Blinkit
(36, 10.00, 13.00, 23.08, 'Buy 3 Get 1 Free',        GETUTCDATE()),  -- Zepto DEAL
(37, 10.00, 10.00, 0.00,  NULL,                      GETUTCDATE()),  -- BigBasket
(38, 10.00, 10.00, 0.00,  NULL,                      GETUTCDATE()),  -- Swiggy

-- Britannia Good Day 87g
(39, 35.00, 40.00, 12.50, NULL,                      GETUTCDATE()),  -- Blinkit
(40, 33.00, 40.00, 17.50, 'Combo offer',              GETUTCDATE()),  -- Zepto
(41, 34.00, 40.00, 15.00, 'BB Star Deal',             GETUTCDATE()),  -- BigBasket BEST
(42, 36.00, 40.00, 10.00, NULL,                      GETUTCDATE()),  -- JioMart
(43, 37.00, 40.00, 7.50,  NULL,                      GETUTCDATE());  -- Amazon

-- ─── 6. PRICE HISTORY (Last 7 days sample) ──────────────────────
-- Showing history for Amul Taaza Milk on Blinkit (PlatformProductId=1)
-- and Onions on JioMart (PlatformProductId=15)

INSERT INTO PriceHistory (PlatformProductId, Price, OriginalPrice, RecordedDate, RecordedAt)
VALUES
-- Amul Taaza 1L on Blinkit — last 7 days
(1, 68.00, 68.00, CAST(DATEADD(DAY,-7, GETUTCDATE()) AS DATE), DATEADD(DAY,-7, GETUTCDATE())),
(1, 68.00, 68.00, CAST(DATEADD(DAY,-6, GETUTCDATE()) AS DATE), DATEADD(DAY,-6, GETUTCDATE())),
(1, 66.00, 68.00, CAST(DATEADD(DAY,-5, GETUTCDATE()) AS DATE), DATEADD(DAY,-5, GETUTCDATE())),
(1, 66.00, 68.00, CAST(DATEADD(DAY,-4, GETUTCDATE()) AS DATE), DATEADD(DAY,-4, GETUTCDATE())),
(1, 68.00, 68.00, CAST(DATEADD(DAY,-3, GETUTCDATE()) AS DATE), DATEADD(DAY,-3, GETUTCDATE())),
(1, 65.00, 68.00, CAST(DATEADD(DAY,-2, GETUTCDATE()) AS DATE), DATEADD(DAY,-2, GETUTCDATE())),
(1, 65.00, 68.00, CAST(DATEADD(DAY,-1, GETUTCDATE()) AS DATE), DATEADD(DAY,-1, GETUTCDATE())),
(1, 65.00, 68.00, CAST(GETUTCDATE() AS DATE),                  GETUTCDATE()),

-- Amul Taaza 1L on BigBasket — last 7 days
(3, 65.00, 65.00, CAST(DATEADD(DAY,-7, GETUTCDATE()) AS DATE), DATEADD(DAY,-7, GETUTCDATE())),
(3, 65.00, 65.00, CAST(DATEADD(DAY,-6, GETUTCDATE()) AS DATE), DATEADD(DAY,-6, GETUTCDATE())),
(3, 64.00, 65.00, CAST(DATEADD(DAY,-5, GETUTCDATE()) AS DATE), DATEADD(DAY,-5, GETUTCDATE())),
(3, 64.00, 65.00, CAST(DATEADD(DAY,-4, GETUTCDATE()) AS DATE), DATEADD(DAY,-4, GETUTCDATE())),
(3, 63.00, 65.00, CAST(DATEADD(DAY,-3, GETUTCDATE()) AS DATE), DATEADD(DAY,-3, GETUTCDATE())),
(3, 62.00, 65.00, CAST(DATEADD(DAY,-2, GETUTCDATE()) AS DATE), DATEADD(DAY,-2, GETUTCDATE())),
(3, 62.00, 65.00, CAST(DATEADD(DAY,-1, GETUTCDATE()) AS DATE), DATEADD(DAY,-1, GETUTCDATE())),
(3, 62.00, 65.00, CAST(GETUTCDATE() AS DATE),                  GETUTCDATE()),

-- Onions 1kg on JioMart — price fluctuating over 7 days
(15, 45.00, 45.00, CAST(DATEADD(DAY,-7, GETUTCDATE()) AS DATE), DATEADD(DAY,-7, GETUTCDATE())),
(15, 42.00, 45.00, CAST(DATEADD(DAY,-6, GETUTCDATE()) AS DATE), DATEADD(DAY,-6, GETUTCDATE())),
(15, 40.00, 45.00, CAST(DATEADD(DAY,-5, GETUTCDATE()) AS DATE), DATEADD(DAY,-5, GETUTCDATE())),
(15, 38.00, 45.00, CAST(DATEADD(DAY,-4, GETUTCDATE()) AS DATE), DATEADD(DAY,-4, GETUTCDATE())),
(15, 36.00, 45.00, CAST(DATEADD(DAY,-3, GETUTCDATE()) AS DATE), DATEADD(DAY,-3, GETUTCDATE())),
(15, 36.00, 45.00, CAST(DATEADD(DAY,-2, GETUTCDATE()) AS DATE), DATEADD(DAY,-2, GETUTCDATE())),
(15, 36.00, 45.00, CAST(DATEADD(DAY,-1, GETUTCDATE()) AS DATE), DATEADD(DAY,-1, GETUTCDATE())),
(15, 36.00, 45.00, CAST(GETUTCDATE() AS DATE),                  GETUTCDATE());

-- ─── 7. USERS ───────────────────────────────────────────────────
-- Passwords are BCrypt hashed — plain text shown in comments
-- Use BCrypt.Net-Next in your .NET project to hash on register

INSERT INTO Users (FullName, Email, PasswordHash, Pincode, City, IsEmailVerified, Role, CreatedAt, LastLoginAt)
VALUES
-- Admin user (password: Admin@123)
('Rahul Sharma',    'admin@basketiq.in',       '$2a$12$adminhashedpassword123xyz',  '411001', 'Pune',      1, 'Admin', GETUTCDATE(), GETUTCDATE()),
-- Regular users (password: Test@123)
('Priya Patel',     'priya.patel@gmail.com',   '$2a$12$userhashedpassword456abc',   '400001', 'Mumbai',    1, 'User',  DATEADD(DAY,-10, GETUTCDATE()), DATEADD(DAY,-1, GETUTCDATE())),
('Arjun Mehta',     'arjun.mehta@gmail.com',   '$2a$12$userhashedpassword789def',   '560001', 'Bengaluru', 1, 'User',  DATEADD(DAY,-5,  GETUTCDATE()), GETUTCDATE()),
('Sneha Reddy',     'sneha.reddy@yahoo.com',   '$2a$12$userhashedpasswordghi012',   '500001', 'Hyderabad', 0, 'User',  DATEADD(DAY,-2,  GETUTCDATE()), NULL),
('Vikram Singh',    'vikram.singh@outlook.com','$2a$12$userhashedpasswordjkl345',   '110001', 'Delhi',     1, 'User',  DATEADD(DAY,-15, GETUTCDATE()), DATEADD(DAY,-3, GETUTCDATE()));

-- ─── 8. Wishlist ───────────────────────────────────────────────
-- UserId 2=Priya, 3=Arjun, 4=Sneha

INSERT INTO Wishlist (UserId, ProductId, AddedAt)
VALUES
(2, 1,  DATEADD(DAY,-5, GETUTCDATE())),   -- Priya saved Amul Milk
(2, 14, DATEADD(DAY,-5, GETUTCDATE())),   -- Priya saved Aashirvaad Atta
(2, 25, DATEADD(DAY,-3, GETUTCDATE())),   -- Priya saved Fortune Oil
(3, 1,  DATEADD(DAY,-2, GETUTCDATE())),   -- Arjun saved Amul Milk
(3, 5,  DATEADD(DAY,-2, GETUTCDATE())),   -- Arjun saved Eggs
(3, 7,  DATEADD(DAY,-1, GETUTCDATE())),   -- Arjun saved Onions
(3, 19, DATEADD(DAY,-1, GETUTCDATE())),   -- Arjun saved Tata Salt
(4, 21, DATEADD(DAY,-1, GETUTCDATE())),   -- Sneha saved Lays
(4, 23, DATEADD(DAY,-1, GETUTCDATE())),   -- Sneha saved Britannia Good Day
(5, 14, DATEADD(DAY,-8, GETUTCDATE())),   -- Vikram saved Atta
(5, 25, DATEADD(DAY,-8, GETUTCDATE()));   -- Vikram saved Fortune Oil

-- ─── 9. PRICE ALERTS ────────────────────────────────────────────
-- UserId, ProductId, PlatformId (NULL=any), TargetPrice

INSERT INTO PriceAlert (UserId, ProductId, PlatformId, TargetPrice, IsActive, TriggeredAt, CreatedAt)
VALUES
(2, 1,  NULL, 60.00, 1, NULL, DATEADD(DAY,-4, GETUTCDATE())),  -- Priya: alert when Amul Milk < ₹60 (any platform)
(2, 14, 4,    250.00,1, NULL, DATEADD(DAY,-4, GETUTCDATE())),  -- Priya: alert when Atta < ₹250 on JioMart
(2, 25, NULL, 130.00,1, NULL, DATEADD(DAY,-2, GETUTCDATE())),  -- Priya: alert when Fortune Oil < ₹130
(3, 7,  NULL, 30.00, 1, NULL, DATEADD(DAY,-1, GETUTCDATE())),  -- Arjun: alert when Onions < ₹30 (any)
(3, 5,  2,    80.00, 1, NULL, DATEADD(DAY,-1, GETUTCDATE())),  -- Arjun: alert when Eggs < ₹80 on Zepto
(5, 14, NULL, 260.00,1, NULL, DATEADD(DAY,-7, GETUTCDATE())),  -- Vikram: Atta < ₹260 — already triggered!
(5, 14, NULL, 260.00,1, DATEADD(DAY,-2, GETUTCDATE()), DATEADD(DAY,-7, GETUTCDATE())); -- triggered alert example

-- ─── 10. SCRAPER LOGS ───────────────────────────────────────────
INSERT INTO ScraperLog (PlatformId, Status, ProductsScraped, ErrorMessage, StartedAt, CompletedAt, DurationSeconds)
VALUES
(1, 'Success', 1250, NULL,                                   DATEADD(MINUTE,-30, GETUTCDATE()), DATEADD(MINUTE,-28, GETUTCDATE()), 120),
(2, 'Success', 980,  NULL,                                   DATEADD(MINUTE,-28, GETUTCDATE()), DATEADD(MINUTE,-26, GETUTCDATE()), 110),
(3, 'Success', 2100, NULL,                                   DATEADD(MINUTE,-26, GETUTCDATE()), DATEADD(MINUTE,-22, GETUTCDATE()), 240),
(4, 'Failed',  NULL, 'Connection timeout after 30 seconds',  DATEADD(MINUTE,-24, GETUTCDATE()), DATEADD(MINUTE,-23, GETUTCDATE()), 60),
(5, 'Success', 870,  NULL,                                   DATEADD(MINUTE,-22, GETUTCDATE()), DATEADD(MINUTE,-20, GETUTCDATE()), 95),
(6, 'Success', 1540, NULL,                                   DATEADD(MINUTE,-20, GETUTCDATE()), DATEADD(MINUTE,-17, GETUTCDATE()), 180),
-- Previous run (1 hour ago)
(1, 'Success', 1248, NULL,                                   DATEADD(HOUR,-1, GETUTCDATE()),    DATEADD(MINUTE,-58, GETUTCDATE()), 118),
(2, 'Success', 975,  NULL,                                   DATEADD(HOUR,-1, GETUTCDATE()),    DATEADD(MINUTE,-58, GETUTCDATE()), 105),
(3, 'Failed',  NULL, 'Bot detection triggered — 403 error',  DATEADD(HOUR,-1, GETUTCDATE()),    DATEADD(MINUTE,-59, GETUTCDATE()), 45),
(4, 'Success', 1100, NULL,                                   DATEADD(HOUR,-1, GETUTCDATE()),    DATEADD(MINUTE,-57, GETUTCDATE()), 160);

-- ─── 11. SEARCH LOGS ────────────────────────────────────────────
INSERT INTO SearchLog (UserId, SearchQuery, ResultCount, SearchedAt)
VALUES
(NULL, 'amul milk',         12, DATEADD(MINUTE,-45, GETUTCDATE())),
(2,    'amul milk 1l',      8,  DATEADD(MINUTE,-40, GETUTCDATE())),
(NULL, 'onions',            6,  DATEADD(MINUTE,-38, GETUTCDATE())),
(3,    'eggs',              5,  DATEADD(MINUTE,-35, GETUTCDATE())),
(NULL, 'aashirvaad atta',   4,  DATEADD(MINUTE,-30, GETUTCDATE())),
(4,    'lays chips',        3,  DATEADD(MINUTE,-28, GETUTCDATE())),
(NULL, 'tomatoes',          4,  DATEADD(MINUTE,-25, GETUTCDATE())),
(2,    'fortune oil',       6,  DATEADD(MINUTE,-20, GETUTCDATE())),
(5,    'basmati rice',      5,  DATEADD(MINUTE,-18, GETUTCDATE())),
(NULL, 'tata salt',         4,  DATEADD(MINUTE,-15, GETUTCDATE())),
(3,    'britannia biscuits',7,  DATEADD(MINUTE,-10, GETUTCDATE())),
(NULL, 'paneer',            0,  DATEADD(MINUTE,-8,  GETUTCDATE())),  -- 0 results = product to add!
(NULL, 'maggi noodles',     0,  DATEADD(MINUTE,-5,  GETUTCDATE())),  -- 0 results = product to add!
(2,    'amul butter',       3,  DATEADD(MINUTE,-3,  GETUTCDATE())),
(NULL, 'milk',              15, DATEADD(MINUTE,-1,  GETUTCDATE()));

-- ============================================================
--  USEFUL VERIFICATION QUERIES — run after inserting
-- ============================================================

-- 1. Check product count per category
SELECT c.Name AS Category, COUNT(p.Id) AS ProductCount
FROM Category c
LEFT JOIN Product p ON p.CategoryId = c.Id
GROUP BY c.Id, c.Name
ORDER BY ProductCount DESC;

-- 2. Best price per product right now
SELECT
    p.Name AS Product,
    p.Unit,
    MIN(pr.CurrentPrice) AS BestPrice,
    MAX(pr.CurrentPrice) AS WorstPrice,
    MAX(pr.CurrentPrice) - MIN(pr.CurrentPrice) AS PriceDifference
FROM Product p
JOIN PlatformProduct pp ON pp.ProductId = p.Id
JOIN Price pr ON pr.PlatformProductId = pp.Id
GROUP BY p.Id, p.Name, p.Unit
ORDER BY PriceDifference DESC;

-- 3. Platform with most Product
SELECT pl.Name AS Platform, COUNT(pp.Id) AS ProductListed
FROM Platform pl
LEFT JOIN PlatformProduct pp ON pp.PlatformId = pl.Id
GROUP BY pl.Id, pl.Name
ORDER BY ProductListed DESC;

-- 4. Top searched Product
SELECT SearchQuery, COUNT(*) AS SearchCount
FROM SearchLog
GROUP BY SearchQuery
ORDER BY SearchCount DESC;

-- 5. Active price alerts
SELECT
    u.FullName, u.Email,
    p.Name AS Product,
    pa.TargetPrice,
    MIN(pr.CurrentPrice) AS CurrentBestPrice,
    CASE WHEN MIN(pr.CurrentPrice) <= pa.TargetPrice
         THEN 'TRIGGER NOW!' ELSE 'Waiting' END AS AlertStatus
FROM PriceAlert pa
JOIN Users   u  ON u.Id  = pa.UserId
JOIN Product p ON p.Id  = pa.ProductId
JOIN PlatformProduct pp ON pp.ProductId = p.Id
JOIN Price pr ON pr.PlatformProductId = pp.Id
WHERE pa.IsActive = 1 AND pa.TriggeredAt IS NULL
GROUP BY u.FullName, u.Email, p.Name, pa.TargetPrice;
