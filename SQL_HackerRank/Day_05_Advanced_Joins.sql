-- Day 5 SQL Practice

-- 1. Contest Leaderboard

SELECT h.hacker_id, h.name, SUM(ms.max_score) AS total_score
FROM Hackers h
JOIN (
    SELECT hacker_id, challenge_id, MAX(score) AS max_score
    FROM Submissions
    GROUP BY hacker_id, challenge_id
) ms
ON h.hacker_id = ms.hacker_id
GROUP BY h.hacker_id, h.name
HAVING SUM(ms.max_score) > 0
ORDER BY total_score DESC, h.hacker_id ASC;



-- 2. SQL Project Planning

SELECT MIN(Start_Date) AS project_start,
       MAX(End_Date) AS project_end
FROM (
    SELECT Start_Date,
           End_Date,
           DATE_SUB(Start_Date, INTERVAL ROW_NUMBER() OVER (ORDER BY Start_Date) DAY) AS grp
    FROM Projects
) t
GROUP BY grp
ORDER BY DATEDIFF(MAX(End_Date), MIN(Start_Date)), MIN(Start_Date);



-- 3. Students, Friends and Salary

SELECT s.Name
FROM Students s
JOIN Friends f ON s.ID = f.ID
JOIN Packages p1 ON s.ID = p1.ID
JOIN Packages p2 ON f.Friend_ID = p2.ID
WHERE p2.Salary > p1.Salary
ORDER BY p2.Salary;
