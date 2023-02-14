/* Contest Leaderboard
- The total score of a hacker is the sum of their maximum scores for all of the challenges. 
- print the hacker_id, name, and total score of the hackers ordered by the descending score. 
- If more than one hacker achieved the same total score, then sort the result by ascending hacker_id. 
- Exclude all hackers with a total score of 0 from your result.
*/

-- create table -- 
CREATE OR REPLACE TABLE Hackers_3 (
    hacker_id integer,
    name string
    );

CREATE OR REPLACE TABLE Submissions_2 (
    submission_id integer,
    hacker_id integer,
    challenge_id integer,
    score integer
);

--insert sample value--
insert into HACKERS values
    (4071,'Rose'),
    (4806,'Angela'),
    (26071,'Frank'),
    (49438,'Patrick'),
    (74842,'Lisa'),
    (80305,'Kimberly'),
    (84072,'Bonnie'),
    (87868,'Michael'),
    (92118,'Todd'),
    (95895,'Joe');

insert into SUBMISSIONS values
    (67194,74842,63132,76),
    (64479,74842,19797,98),
    (40742,26071,49593,20),
    (17513,4806,49593,32),
    (69846,80305,19797,19),
    (41002,26071,89343,36),
    (52826,49438,49593,9),
    (31093,26071,19797,2),
    (81614,84072,49593,100),
    (44829,26071,89343,17),
    (75147,80305,49593,48),
    (14115,4806,49593,76),
    (6943,4071,19797,95),
    (12855,4806,25917,13),
    (73343,80305,49593,42),
    (84264,84072,63132,0),
    (9951,4071,49593,43),
    (45104,49438,25917,34),
    (53795,74842,19797,5),
    (26363,26071,19797,29),
    (10063,4071,49593,96);

--works for MS SQL Server--
/* extract max score per unique challenge result with student id*/
WITH T1 AS
(
    SELECT HACKER_ID,
           CHALLENGE_ID,
           MAX(SCORE) MAX_SCORE
    FROM SUBMISSIONS
    GROUP BY HACKER_ID,CHALLENGE_ID
)

/* extract sum of max score, filter a total score of 0, link above table with student name*/
SELECT T1.HACKER_ID,
       NAME,
       SUM(MAX_SCORE)
FROM T1
JOIN HACKERS
    ON T1.HACKER_ID = HACKERS.HACKER_ID
GROUP BY T1.HACKER_ID,NAME
HAVING SUM(MAX_SCORE) > 0
ORDER BY SUM(MAX_SCORE) DESC, T1.HACKER_ID;