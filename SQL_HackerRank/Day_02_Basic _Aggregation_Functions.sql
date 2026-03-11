Question 1

Query the greatest value of the Northern Latitudes (LAT_N) from STATION that is less than 137.2345.
Truncate your answer to 4 decimal places.

SELECT TRUNCATE(MAX(LAT_N), 4)
FROM STATION
WHERE LAT_N < 137.2345;
Question 2

Query the Western Longitude (LONG_W) for the largest Northern Latitude (LAT_N) in STATION that is less than 137.2345.
Round your answer to 4 decimal places.

SELECT ROUND(LONG_W, 4)
FROM STATION
WHERE LAT_N = (
    SELECT MAX(LAT_N)
    FROM STATION
    WHERE LAT_N < 137.2345
);
Question 3

Query the smallest Northern Latitude (LAT_N) from STATION that is greater than 38.7780.
Round your answer to 4 decimal places.

SELECT ROUND(MIN(LAT_N), 4)
FROM STATION
WHERE LAT_N > 38.7780;
Question 4

Query the Western Longitude (LONG_W) where the smallest Northern Latitude (LAT_N) in STATION is greater than 38.7780.
Round your answer to 4 decimal places.

SELECT ROUND(LONG_W, 4)
FROM STATION
WHERE LAT_N = (
    SELECT MIN(LAT_N)
    FROM STATION
    WHERE LAT_N > 38.7780
);
Example of Your .sql File Structure

Your file should look like this:

-- Day 1 SQL Practice

-- Question 1
-- Greatest LAT_N less than 137.2345
SELECT TRUNCATE(MAX(LAT_N), 4)
FROM STATION
WHERE LAT_N < 137.2345;


-- Question 2
-- LONG_W for largest LAT_N < 137.2345
SELECT ROUND(LONG_W, 4)
FROM STATION
WHERE LAT_N = (
    SELECT MAX(LAT_N)
    FROM STATION
    WHERE LAT_N < 137.2345
);


-- Question 3
-- Smallest LAT_N greater than 38.7780
SELECT ROUND(MIN(LAT_N), 4)
FROM STATION
WHERE LAT_N > 38.7780;


-- Question 4
-- LONG_W where smallest LAT_N > 38.7780
SELECT ROUND(LONG_W, 4)
FROM STATION
WHERE LAT_N = (
    SELECT MIN(LAT_N)
    FROM STATION
    WHERE LAT_N > 38.7780
);
