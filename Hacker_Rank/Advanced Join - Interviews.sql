/* Interviews
- print the contest_id, hacker_id, name, and the sums of total_submissions, total_accepted_submissions, total_views, and total_unique_views for each contest sorted by contest_id. 
- Exclude the contest from the result if all four sums are 0 .
*/

-- create table -- 
CREATE OR REPLACE TABLE Contests (
    contest_id integer,
    hacker_id integer,
    name string
    );

CREATE OR REPLACE TABLE Colleges (
    college_id integer,
    contest_id integer
    );

CREATE OR REPLACE TABLE Challenges (
    challenge_id integer,
    college_id integer
);

CREATE OR REPLACE TABLE View_Stats (
    challenge_id integer,
    total_views integer,
    total_unique_views integer
);

CREATE OR REPLACE TABLE Submission_Stats (
    challenge_id integer,
    total_submissions integer,
    total_accepted_submissions integer
);

--insert sample value--
INSERT into Contests values
    (66406,17973,'Rose'),
    (66556,79153,'Angela'),
    (94828,80275,'Frank');
    
INSERT into Colleges values
    (11219,66406),
    (32473,66556),
    (56685,94828);
    
INSERT into Challenges values
    (18765,11219),
    (47127,11219),
    (60292,32473),
    (72974,56685);


INSERT into View_Stats values
    (47127,26,19),
    (47127,15,14),
    (18765,43,10),
    (18765,72,13),
    (75516,35,17),
    (60292,11,10),
    (72974,41,15),
    (75516,75,11);

INSERT into Submission_Stats values
    (75516,34,12),
    (47127,27,10),
    (47127,56,18),
    (75516,74,12),
    (75516,83,8),
    (72974,68,24),
    (72974,82,14),
    (47127,28,11);

--works for mysql--
SELECT con.contest_id,
       hacker_id,
       name,
       COALESCE(sum(t1),0) total_submissions,
       COALESCE(sum(t2),0) total_accepted_submissions,
       COALESCE(sum(t3),0) total_views,
       COALESCE(sum(t4),0) total_unique_views
FROM contests con 
JOIN colleges col
    ON con.contest_id = col.contest_id
JOIN challenges cha
    ON cha.college_id = col.college_id
LEFT JOIN (
   SELECT challenge_id,
           sum(total_submissions) t1,
           sum(total_accepted_submissions) t2
    FROM submission_stats
    GROUP BY challenge_id
) T1
    ON T1.challenge_id = cha.challenge_id
LEFT JOIN (
    SELECT challenge_id,
           sum(total_views) t3,
           sum(total_unique_views) t4
    FROM view_stats
    GROUP BY challenge_id
) T2
    ON t2.challenge_id = cha.challenge_id
GROUP BY con.contest_id, hacker_id, name
HAVING (total_submissions + total_accepted_submissions + total_views + total_unique_views) > 0
ORDER BY con.contest_id;