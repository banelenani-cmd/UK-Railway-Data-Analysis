
-- ============================================================
-- UK RAILWAY DATA ANALYSIS
-- DATA CLEANING AND VALIDATION
-- Tools: MySQL Workbench 8.0 and Tableau
-- ============================================================


-- ============================================================
-- 1. DATA EXPLORATION
-- ============================================================

-- Inspect the original railway dataset.
SELECT *
FROM railway;

-- Create a staging table for data preparation.
-- This preserves the original dataset.
CREATE TABLE railway_staging
SELECT *
FROM railway;

-- Inspect the staging table.
SELECT *
FROM railway_staging;


-- ============================================================
-- 2. DUPLICATE CHECKS
-- ============================================================

-- Assign row numbers to identify potential duplicate records
-- across all columns.
SELECT ROW_NUMBER() OVER(
    PARTITION BY
        `Transaction ID`,
        `Date of Purchase`,
        `Time of Purchase`,
        `Purchase Type`,
        `Payment Method`,
        Railcard,
        `Ticket Class`,
        `Ticket Type`,
        Price,
        `Departure Station`,
        `Arrival Destination`,
        `Date of Journey`,
        `Departure Time`,
        `Arrival Time`,
        `Actual Arrival Time`,
        `Journey Status`,
        `Reason for Delay`,
        `Refund Request`
    ORDER BY `Transaction ID`
) AS row_num
FROM railway_staging;

-- Identify records with row numbers greater than 1.
WITH duplicate_cte AS
(
    SELECT ROW_NUMBER() OVER(
        PARTITION BY
            `Transaction ID`,
            `Date of Purchase`,
            `Time of Purchase`,
            `Purchase Type`,
            `Payment Method`,
            Railcard,
            `Ticket Class`,
            `Ticket Type`,
            Price,
            `Departure Station`,
            `Arrival Destination`,
            `Date of Journey`,
            `Departure Time`,
            `Arrival Time`,
            `Actual Arrival Time`,
            `Journey Status`,
            `Reason for Delay`,
            `Refund Request`
        ORDER BY `Transaction ID`
    ) AS row_num
    FROM railway_staging
)
SELECT *
FROM duplicate_cte
WHERE row_num > 1;

-- Check for repeated transaction IDs.
-- Repeated IDs should be investigated to determine
-- whether they represent duplicates.
SELECT
    `Transaction ID`,
    COUNT(*) AS occurrences
FROM railway_staging
GROUP BY `Transaction ID`
HAVING COUNT(*) > 1;


-- ============================================================
-- 3. MISSING VALUE CHECKS
-- ============================================================

-- Identify records containing NULL values.
-- Some NULL values may be valid depending on journey status.
SELECT *
FROM railway_staging
WHERE `Transaction ID` IS NULL
   OR `Date of Purchase` IS NULL
   OR `Time of Purchase` IS NULL
   OR `Purchase Type` IS NULL
   OR `Payment Method` IS NULL
   OR Railcard IS NULL
   OR `Ticket Class` IS NULL
   OR `Ticket Type` IS NULL
   OR Price IS NULL
   OR `Departure Station` IS NULL
   OR `Arrival Destination` IS NULL
   OR `Date of Journey` IS NULL
   OR `Departure Time` IS NULL
   OR `Arrival Time` IS NULL
   OR `Actual Arrival Time` IS NULL
   OR `Journey Status` IS NULL
   OR `Reason for Delay` IS NULL
   OR `Refund Request` IS NULL;


-- ============================================================
-- 4. CATEGORICAL VALUE VALIDATION
-- ============================================================

-- Examine distinct values in categorical columns.
-- This helps identify inconsistent or unexpected categories.

SELECT DISTINCT `Journey Status`
FROM railway_staging;

SELECT DISTINCT `Purchase Type`
FROM railway_staging;

SELECT DISTINCT `Payment Method`
FROM railway_staging;

SELECT DISTINCT Railcard
FROM railway_staging;

SELECT DISTINCT `Ticket Class`
FROM railway_staging;

SELECT DISTINCT `Ticket Type`
FROM railway_staging;

SELECT DISTINCT `Refund Request`
FROM railway_staging;

SELECT DISTINCT `Reason for Delay`
FROM railway_staging;


-- ============================================================
-- 5. DATA STANDARDISATION
-- ============================================================

-- Standardise reason-for-delay categories.
-- These mappings group specific causes into broader categories.

UPDATE railway_staging
SET `Reason for Delay` = 'Technical Issue'
WHERE `Reason for Delay` = 'Signal Failure';

UPDATE railway_staging
SET `Reason for Delay` = 'Weather Conditions'
WHERE `Reason for Delay` = 'Weather';

UPDATE railway_staging
SET `Reason for Delay` = 'Staffing'
WHERE `Reason for Delay` = 'Staff Shortage';

-- Check standardised categories.
SELECT DISTINCT `Reason for Delay`
FROM railway_staging;

-- Remove leading and trailing spaces from column values.
UPDATE railway_staging
SET `Transaction ID` = TRIM(`Transaction ID`),
    `Date of Purchase` = TRIM(`Date of Purchase`),
    `Time of Purchase` = TRIM(`Time of Purchase`),
    `Purchase Type` = TRIM(`Purchase Type`),
    `Payment Method` = TRIM(`Payment Method`),
    Railcard = TRIM(Railcard),
    `Ticket Class` = TRIM(`Ticket Class`),
    `Ticket Type` = TRIM(`Ticket Type`),
    Price = TRIM(Price),
    `Departure Station` = TRIM(`Departure Station`),
    `Arrival Destination` = TRIM(`Arrival Destination`),
    `Date of Journey` = TRIM(`Date of Journey`),
    `Departure Time` = TRIM(`Departure Time`),
    `Arrival Time` = TRIM(`Arrival Time`),
    `Actual Arrival Time` = TRIM(`Actual Arrival Time`),
    `Journey Status` = TRIM(`Journey Status`),
    `Reason for Delay` = TRIM(`Reason for Delay`),
    `Refund Request` = TRIM(`Refund Request`);


-- ============================================================
-- 6. DATE AND TIME VALIDATION
-- ============================================================

-- Inspect sample purchase and journey dates.
SELECT
    `Date of Purchase`,
    `Date of Journey`
FROM railway_staging
LIMIT 20;

-- Identify purchase dates that do not match YYYY-MM-DD.
SELECT `Date of Purchase`
FROM railway_staging
WHERE `Date of Purchase` IS NOT NULL
  AND TRIM(`Date of Purchase`) <> ''
  AND (
      STR_TO_DATE(`Date of Purchase`, '%Y-%m-%d') IS NULL
      OR DATE_FORMAT(
          STR_TO_DATE(`Date of Purchase`, '%Y-%m-%d'),
          '%Y-%m-%d'
      ) <> TRIM(`Date of Purchase`)
  );

-- Inspect all six date and time columns.
SELECT
    `Date of Purchase`,
    `Time of Purchase`,
    `Date of Journey`,
    `Departure Time`,
    `Arrival Time`,
    `Actual Arrival Time`
FROM railway_staging
LIMIT 20;


-- ============================================================
-- 7. DATA TYPE CONVERSION
-- ============================================================

-- Inspect existing column data types.
DESCRIBE railway_staging;

-- Create a backup before changing column types.
CREATE TABLE railway_staging_backup AS
SELECT *
FROM railway_staging;

-- Confirm the schema before conversion.
DESCRIBE railway_staging;

-- Convert date and time columns to appropriate data types.
ALTER TABLE railway_staging
    MODIFY COLUMN `Date of Purchase` DATE,
    MODIFY COLUMN `Time of Purchase` TIME,
    MODIFY COLUMN `Date of Journey` DATE,
    MODIFY COLUMN `Departure Time` TIME,
    MODIFY COLUMN `Arrival Time` TIME,
    MODIFY COLUMN `Actual Arrival Time` TIME;

-- Verify the updated column data types.
DESCRIBE railway_staging;


-- ============================================================
-- 8. FINAL DATA QUALITY CHECKS
-- ============================================================

-- Review the prepared dataset.
SELECT *
FROM railway_staging;

-- ============================================================
-- END OF SCRIPT
-- ============================================================
