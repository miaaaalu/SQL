/* SQL Project Planning
- Samantha is interested in finding the total number of different projects completed.
- output the start and end dates of projects listed by the number of days it took to complete the project in ascending order. 
- If there is more than one project that have the same number of completion days, then order by the start date of the project.
*/

-- create table -- 
CREATE OR REPLACE TABLE Projects (
    Task_ID integer,
    Start_Date date,
    End_Date date
);

--insert sample value--
insert into PROJECTS values
    (1,'2015-10-01','2015-10-02'),
    (2,'2015-10-02','2015-10-03'),
    (3,'2015-10-03','2015-10-04'),
    (4,'2015-10-13','2015-10-14'),
    (5,'2015-10-14','2015-10-15'),
    (6,'2015-10-28','2015-10-29'),
    (7,'2015-10-30','2015-10-31');

--works for MS SQL Server--
WITH T1 AS 
    (SELECT *,
           dateadd(day, - row_number()over(order by start_date),start_date) col1
    FROM PROJECTS
    )

SELECT MIN(start_date),
       MAX(end_date)
FROM T1
GROUP BY COL1
ORDER BY COUNT(COL1),MIN(start_date);