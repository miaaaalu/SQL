/* 1965. Employees With Missing Information
- report the IDs of all the employees with missing information. The information of an employee is missing if:
    - The employee's name is missing, or
    -The employee's salary is missing.
- ordered by employee_id in ascending order.
 */

-- my solution 
with t1 as 
(select 
    e.employee_id as id_1,
    s.employee_id as id_2
from employees e
full join salaries s
on e.employee_id = s.employee_id
where name is null 
or salary is null
)

select id_1 as employee_id 
from t1
where id_1 is not null
union all
select id_2 as employee_id 
from t1
where id_2 is not null
order by employee_id;

-- other solution 
SELECT employee_id 
FROM Employees 
WHERE employee_id NOT IN (SELECT employee_id FROM Salaries)
UNION 
SELECT employee_id 
FROM Salaries 
WHERE employee_id NOT IN (SELECT employee_id FROM Employees);