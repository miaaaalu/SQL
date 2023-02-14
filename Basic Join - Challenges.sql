/* Challenges
- print the hacker_id, name, and the total number of challenges created by each student. 
- Sort by the total number of challenges in descending order. 
- If more than 1 student created the same number of challenges, then sort the result by hacker_id. 
- If more than one student created the same number of challenges and the count is less than the maximum number of challenges created, then exclude those students from the result.
*/

-- create table 
CREATE OR REPLACE TABLE Hackers (
    hacker_id integer,
    name string
    );

CREATE OR REPLACE TABLE Challenges (
    challenge_id integer,
    hacker_id integer
);

-- insert sample value 0--
INSERT into HACKERS values
    (5077,'Rose'),
    (21283,'Angela'),
    (62743,'Frank'),
    (88255,'Patrick'),
    (96196,'Lisa');

INSERT into CHALLENGES values
    (61654,5077),
    (58302,21283),
    (40587,88255),
    (29477,5077),
    (1220,21283),
    (69514,21283),
    (46561,62743),
    (58077,62743),
    (18483,88255),
    (76766,21283),
    (52382,5077),
    (74467,21283),
    (33625,96196),
    (26053,88255),
    (42665,62743),
    (12859,62743),
    (70094,21283),
    (34599,88255),
    (54680,88255),
    (61881,5077);


-- Works for MYSQL --
/* count total number of challenges of each student */
WITH 
T1 AS(
    SELECT HACKER_ID, 
           COUNT(*) AS challenges_created_id
    FROM Challenges
    GROUP BY HACKER_ID
),

/* filter out the challenges count as required, by selecting result from above table*/
T2 AS (
    SELECT challenges_created_id, 
           CASE WHEN COUNT(*) > 1 
           AND challenges_created_id < (SELECT MAX(challenges_created_id) FROM T1) 
           THEN 0 
           ELSE COUNT(*) 
           END AS filter
    FROM T1
    GROUP BY challenges_created_id
    HAVING filter > 0
),

/* link result with student id*/
T3 AS (
    SELECT T1.challenges_created_id,
           hacker_id
    FROM T2
    JOIN T1 
        ON T2.challenges_created_id = T1.challenges_created_id
)

/* link result with student name*/
SELECT Hackers.HACKER_ID,
       name,
       CHALLENGES_CREATED_ID
FROM T3
JOIN Hackers
    ON T3.HACKER_ID = Hackers.HACKER_ID
ORDER BY 3 desc,1;