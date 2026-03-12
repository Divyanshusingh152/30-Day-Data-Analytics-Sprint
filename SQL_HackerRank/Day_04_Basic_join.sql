1. Sum of Population of Cities in Asia

Question

Given the CITY and COUNTRY tables, query the sum of the populations of all cities where the continent is 'Asia'.

Note:
CITY.CountryCode and COUNTRY.Code are matching key columns.

SQL Query

SELECT 
SUM(CITY.Population)
FROM CITY
JOIN COUNTRY
ON CITY.CountryCode = COUNTRY.Code
WHERE COUNTRY.Continent = 'Asia';
2. Names of Cities in Africa

Question

Given the CITY and COUNTRY tables, query the names of all cities where the continent is 'Africa'.

Note:
CITY.CountryCode and COUNTRY.Code are matching key columns.

SQL Query

SELECT 
CITY.Name
FROM CITY
JOIN COUNTRY
ON CITY.CountryCode = COUNTRY.Code
WHERE COUNTRY.Continent = 'Africa';
3. Average City Population by Continent

Question

Given the CITY and COUNTRY tables, query the names of all continents and their average city populations.

The average population should be rounded down to the nearest integer.

Note:
CITY.CountryCode and COUNTRY.Code are matching key columns.

SQL Query

SELECT 
COUNTRY.Continent,
FLOOR(AVG(CITY.Population))
FROM CITY
JOIN COUNTRY
ON CITY.CountryCode = COUNTRY.Code
GROUP BY COUNTRY.Continent;
