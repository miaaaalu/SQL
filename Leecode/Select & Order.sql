/* 1873. Calculate Special Bonus
 Write an SQL query to calculate 
- the bonus of each employee. The bonus of an employee is 100% of their salary if the ID of the employee is an odd number and the employee name does not start with the character 'M'. 
- The bonus of an employee is 0 otherwise.
- Return the result table ordered by employee_id.
*/
SELECT 
    employee_id,
    CASE 
    WHEN employee_id % 2 != 0 AND name not like 'M%' THEN salary 
    ELSE 0 
    END AS bonus
ORDER BY employee_id

/* 627. Swap Salary
swap all 'f' and 'm' values with a single update statement and no intermediate temporary tables.
*/
UPDATE SALARY
SET SEX = CASE WHEN SEX = 'm' THEN 'f' ELSE 'm' END

/*  196. Delete Duplicate Emails
- delete all the duplicate emails
- keeping only one unique email with the smallest id. 
- Note that you are supposed to write a DELETE statement and not a SELECT one.
 */
DELETE FROM PERSON
WHERE ID NOT IN (
    select min(id)
    from person
    group by email
);