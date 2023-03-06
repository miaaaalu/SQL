/* 175. Combine Two Tables
- report the first name, last name, city, and state of each person in the Person table. 
- If the address of a personId is not present in the Address table, report null instead.
*/

SELECT firstName,
       lastName,
       COALESCE (city,null) city,
       COALESCE (state,null) state
FROM Person p
LEFT JOIN Address a
    ON p.personID = a.personId


/* 1581. Customer Who Visited but Did Not Make Any Transactions
- find the IDs of the users who visited without making any transactions 
- find the number of times they made these types of visits.
 */

 SELECT customer_id,
        count(visit_id) as count_no_trans
 FROM Visits
 WHERE visit_id not in (
     SELECT visit_id 
     From Transactions
     )
GROUP BY customer_id

/* 1148. Article Views I
- find all the authors that viewed at least one of their own articles.
- sorted by id in ascending order.
*/

select distinct(author_id) as id
from views
where author_id = viewer_id
order by id;


/* 197. Rising Temperature
- find all dates' Id with higher temperatures compared to its previous dates (yesterday).
 */

with cte as (
select *,
	TEMPERATURE - lag(temperature) over(order by id) as previous_tem
from weather
)

select id from cte
where previous_tem > 0 and previous_tem is not null;