1️⃣ Draw The Triangle 1
Problem

P(R) represents a pattern drawn by Julia in R rows.

Example P(5)

* * * * *
* * * *
* * *
* *
*

Write a query to print P(20).

SQL Query
SET @row := 21;

SELECT REPEAT('* ', @row := @row - 1)
FROM information_schema.tables
LIMIT 20;
2️⃣ Draw The Triangle 2
Problem

P(R) represents a pattern drawn by Julia in R rows.

Example P(5)

*
* *
* * *
* * * *
* * * * *

Write a query to print P(20).

SQL Query
SET @row := 0;

SELECT REPEAT('* ', @row := @row + 1)
FROM information_schema.tables
LIMIT 20;
3️⃣ Print Prime Numbers
Problem

Write a query to print all prime numbers ≤ 1000 in one line separated by &.

Example output:

2&3&5&7
SQL Query
WITH RECURSIVE numbers AS (
    SELECT 2 AS num
    UNION ALL
    SELECT num + 1
    FROM numbers
    WHERE num < 1000
)
SELECT GROUP_CONCAT(num SEPARATOR '&')
FROM numbers n
WHERE NOT EXISTS (
    SELECT 1
    FROM numbers d
    WHERE d.num < n.num
    AND d.num > 1
    AND n.num % d.num = 0
);
