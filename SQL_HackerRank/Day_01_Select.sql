# SQL Practice – Day 1

## 1. Students with Marks > 75

**Question**

Query the Name of any student in STUDENTS who scored higher than 75 marks.
Order the output by the last three characters of each name.
If two students have the same last three characters, sort them by ascending ID.

**SQL Query**

```sql
SELECT Name
FROM STUDENTS
WHERE Marks > 75
ORDER BY RIGHT(Name,3), ID;
```

---

## 2. Employee Names in Alphabetical Order

**Question**

Write a query that prints a list of employee names from the Employee table in alphabetical order.

**SQL Query**

```sql
SELECT name
FROM Employee
ORDER BY name;
```

---

## 3. Employees with Salary > 2000 and Months < 10

**Question**

Write a query that prints employee names where salary is greater than 2000 and months worked is less than 10.
Sort the result by ascending employee_id.

**SQL Query**

```sql
SELECT name
FROM Employee
WHERE salary > 2000 AND months < 10
ORDER BY employee_id;
```

---

## 4. Triangle Type Classification

**Question**

Write a query to classify triangles based on side lengths A, B, and C.

**SQL Query**

```sql
SELECT
CASE
    WHEN A + B <= C OR A + C <= B OR B + C <= A THEN 'Not A Triangle'
    WHEN A = B AND B = C THEN 'Equilateral'
    WHEN A = B OR B = C OR A = C THEN 'Isosceles'
    ELSE 'Scalene'
END
FROM TRIANGLES;
```

---

## 5. Binary Tree Node Type

**Question**

Given the BST table with columns N (node value) and P (parent), classify each node as Root, Inner, or Leaf.

**SQL Query**

```sql
SELECT 
N,
CASE
    WHEN P IS NULL THEN 'Root'
    WHEN N IN (SELECT P FROM BST) THEN 'Inner'
    ELSE 'Leaf'
END
FROM BST
ORDER BY N;
```

---

## 6. Occupations Formatting

**Question**

Print all names followed by the first letter of their occupation in parentheses.

**SQL Query**

```sql
SELECT CONCAT(Name,'(',LEFT(Occupation,1),')')
FROM OCCUPATIONS
ORDER BY Name;
```

**Count of Each Occupation**

```sql
SELECT CONCAT('There are a total of ',COUNT(*),' ',LOWER(Occupation),'s.')
FROM OCCUPATIONS
GROUP BY Occupation
ORDER BY COUNT(*), Occupation;
```

---

## 7. Company Hierarchy Count

**Question**

Print company_code, founder, number of lead managers, senior managers, managers, and employees.

**SQL Query**

```sql
SELECT 
c.company_code,
c.founder,
COUNT(DISTINCT lm.lead_manager_code),
COUNT(DISTINCT sm.senior_manager_code),
COUNT(DISTINCT m.manager_code),
COUNT(DISTINCT e.employee_code)
FROM Company c
LEFT JOIN Lead_Manager lm ON c.company_code = lm.company_code
LEFT JOIN Senior_Manager sm ON c.company_code = sm.company_code
LEFT JOIN Manager m ON c.company_code = m.company_code
LEFT JOIN Employee e ON c.company_code = e.company_code
GROUP BY c.company_code, c.founder
ORDER BY c.company_code;
```
