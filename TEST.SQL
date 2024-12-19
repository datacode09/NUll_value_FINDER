SELECT
    column_name,
    CASE
        WHEN column_name IS NULL THEN 'NULL'
        WHEN column_name = '' THEN 'Empty String'
        WHEN TRIM(column_name) = '' THEN 'Whitespace'
        WHEN LOWER(column_name) IN ('null', 'n/a', 'na') THEN 'Special Value'
        ELSE 'Valid Value'
    END AS Value_Type
FROM table_name
WHERE
    column_name IS NULL
    OR column_name = ''
    OR TRIM(column_name) = ''
    OR LOWER(column_name) IN ('null', 'n/a', 'na');
