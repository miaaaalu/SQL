/* Placements
- output the names of those students whose best friends got offered a higher salary than them. 
- Names must be ordered by the salary amount offered to the best friends. 
*/

-- create table -- 
CREATE OR REPLACE TABLE Students (
    id integer,
    name string
);

CREATE OR REPLACE TABLE Friends (
    id integer,
    Friend_ID integer
    );

CREATE OR REPLACE TABLE Packages (
    id integer,
    Salary Float
    );


--insert sample value--
insert into Students values
    (1,'Ashley'),
    (2,'Samantha'),
    (3,'Julia'),
    (4,'Scarlet');

INSERT into Friends values
    (1,2),
    (2,3),
    (3,4),
    (4,1);

INSERT into Packages values
    (1,15.20),
    (2,10.06),
    (3,11.55),
    (4,12.12);

--works for mysql--
SELECT name
FROM FRIENDS f
JOIN PACKAGES p1
    ON f.id = p1.id
JOIN PACKAGES p2
    ON f.friend_id = p2.id
JOIN students_2
    ON f.ID = students_2.ID
WHERE p2.salary > p1.salary
ORDER BY p2.salary