1️⃣ Manhattan Distance Between Two Points

Problem

Query the Manhattan Distance between two points where:

Round the result to 4 decimal places.

SQL Query

SELECT 
ROUND(
ABS(MIN(LAT_N) - MAX(LAT_N)) +
ABS(MIN(LONG_W) - MAX(LONG_W)),
4
)
FROM STATION;
2️⃣ Euclidean Distance Between Two Points

Problem

Calculate the Euclidean distance between two points using the minimum and maximum latitude and longitude values.

SQL Query

SELECT 
ROUND(
SQRT(
POWER(MAX(LAT_N) - MIN(LAT_N),2) +
POWER(MAX(LONG_W) - MIN(LONG_W),2)
),
4
)
FROM STATION;
3️⃣ Median of Northern Latitude

Problem

Find the median value of LAT_N and round it to 4 decimal places.

SQL Query

SELECT 
ROUND(LAT_N,4)
FROM (
    SELECT 
        LAT_N,
        ROW_NUMBER() OVER (ORDER BY LAT_N) AS row_num,
        COUNT(*) OVER () AS total_rows
    FROM STATION
) AS temp
WHERE row_num = CEILING(total_rows/2);
4️⃣ Sum of LAT_N in a Given Range

Problem

Find the sum of LAT_N values where:

LAT_N > 38.7880

LAT_N < 137.2345

Truncate the result to 4 decimal places.

SQL Query

SELECT 
TRUNCATE(SUM(LAT_N),4)
FROM STATION
WHERE LAT_N > 38.7880
AND LAT_N < 137.2345;
