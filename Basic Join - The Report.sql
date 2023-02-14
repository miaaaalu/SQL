/*
- containing three columns: Name, Grade and Mark. 
- Ketty doesn't want the NAMES of those students who received a grade lower than 8. 
- descending order by grade.if the grade is lower than 8, use "NULL" as their name 
- If there is more than one student with the same grade (8-10) assigned to them, order those particular students by their name alphabetically. 
- Finally, if the grade is lower than 8, list them by their grades in descending order. If there is more than one student with the same grade (1-7) assigned to them, order those particular students by their marks in ascending order.
*/

-- create table -- 
CREATE OR REPLACE TABLE Students (
    id integer,
    name string,
    marks integer
);

CREATE OR REPLACE TABLE Grades (
    Grade integer,
    min_mark integer,
    max_mark integer
    );
    

-- insert sample value -- 
insert into Students values
  ('1','Julia',88),
  ('2','Samantha',68),
  ('3','Maria',99),
  ('4','Scarlet',78),
  ('5','Ashley',63),
  ('6','Jane',81);
  
  
insert into Grades values
    (1,0,9),
    (2,10,19),
    (3,20,29),
    (4,30,39),
    (5,40,49),
    (6,50,59),
    (7,60,69),
    (8,70,79),
    (9,80,89),
    (10,90,100);

-- works for mysql
SELECT case when grade >= 8 then name else 'NULL' end as name,
    grade,
    MARKS
FROM STUDENTS 
JOIN GRADES
WHERE MARKS BETWEEN MIN_MARK AND MAX_MARK
order by grade desc,name,MARKS;