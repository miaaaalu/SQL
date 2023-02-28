/* Ollivander's Inventory
- determining the minimum number of gold galleons needed to buy each non-evil wand of high power and age
- print the id, age, coins_needed, and power of the wands that Ron's interested in, 
- sorted in order of descending power. 
- If more than one wand has same power, sort the result in order of descending age.
*/

-- create table 
CREATE OR REPLACE TABLE Wands (
    id integer,
    code integer,
    coins_needed integer,
    power integer
);

CREATE OR REPLACE TABLE Wands_Property (
    code integer,
    age integer,
    is_evil integer
);
        

-- insert sample value --
insert into Wands_Property values
    (1,45,0),
    (2,40,0),
    (3,4,1),
    (4,20,0),
    (5,17,0);

insert into Wands values
    (1,4,3688,8),
    (2,3,9365,3),
    (3,3,7187,10),
    (4,3,734,8),
    (5,1,6020,2),
    (6,2,6773,7),
    (7,3,9873,9),
    (8,3,7721,7),
    (9,1,1647,10),
    (10,4,504,5),
    (11,2,7587,5),
    (12,5,9897,10),
    (13,3,4651,8),
    (14,2,5408,1),
    (15,2,6018,7),
    (16,4,7710,5),
    (17,2,8798,7),
    (18,2,3312,3),
    (19,4,7651,6),
    (20,5,5689,3);

-- Works for ms sql server --
WITH T1 AS(
    SELECT id,
           age,
           coins_needed,
           power,
           RANK() OVER(PARTITION BY AGE, POWER ORDER BY coins_needed ASC) COINS_RANK
    FROM WANDS
    JOIN WANDS_PROPERTY
        ON WANDS.CODE = WANDS_PROPERTY.CODE
    WHERE IS_EVIL = 0
    )
    
SELECT id,
    age,
    coins_needed,
    power
FROM T1
WHERE COINS_RANK = 1
ORDER BY POWER DESC, age desc;