/* 1667. Fix Names in a Table
- fix the names so that only the first character is uppercase and the rest are lowercase.
- ordered by user_id.
 */

select user_id,
       upper(left(name,1)) + lower(substring(name,2,len(name))) as name
FROM users;

SELECT user_id,
       Concat(upper(left(name,1)),lower(substr(name,2,len(name))))
FROM users;

/* 1484. Group Sold Products By The Date
- find for each date the number of different products sold and their names.
- The sold products names for each date should be sorted lexicographically.
- Return the result table ordered by sell_date.
 */

--Oracle, Snowflake 
SELECT sell_date,
	   count(distinct(product)),
       listagg(DISTINCT product, ',') WITHIN GROUP (ORDER BY product) 
FROM activities
group by sell_date
order by sell_date;

--SQL SERVER 
with cte as(
    select sell_date,
    	   product,
           row_number ()over(partition by sell_date, product order by product) as num
    from activities)

select sell_date,
	   count(product) as num_sold ,
       string_agg(product, ',') WITHIN GROUP (ORDER BY product) as products
from cte 
where num = 1
group by sell_date
order by sell_date;

/* 1527. Patients With a Condition
- report the patient_id, patient_name and conditions of the patients who have Type I Diabetes. 
- Type I Diabetes always starts with DIAB1 prefix.
*/

select *
from patients 
where conditions like 'DIAB1%' or conditions like '% DIAB1%' 