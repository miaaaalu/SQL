process null value: 
```sql
COALESCE (column,0)
```

swap row value
```sql
UPDATE SALARY
SET SEX = CASE WHEN SEX = 'm' THEN 'f' ELSE 'm' END
```

Processing duplicate Data 

```sql
---delete duplicate emails, keeping only 1 unique email with the smallest id
DELETE FROM PERSON
WHERE ID NOT IN (
    SELECT min(id)
    FROM person
    group by email
);
```
```sql
--delete duplicate product by date, and product 
WITH CTE AS(
    SELECT sell_date,f
    	   product,
           row_number ()over(partition by sell_date, product order by product) as num
    FROM activities)

SELECT * FROM cte 
where num = 1
```

Check missing information from two tables 
```sql 
SELECT column 
FROM table1 
WHERE column NOT IN (
    SELECT column 
    FROM table2
    )
```

Capitalize first letter of a string
```sql
CONCAT(UPPER(LEFT(column,1)),SUBSTR(LOWER(column),2,LEN(column))) 
```

Window function
```sql
    -- SUM, COUNT, and AVG
    SUM(column_1) OVER (PARTITION BY column_1 ORDER BY column_1)
    AVG(column_1) OVER (PARTITION BY column_1 ORDER BY column_1)
    COUNT(column_1) OVER (PARTITION BY column_1 ORDER BY column_1)

    -- ROW_NUMBER(), RANK() and DENSE_RANK()
        --for duplicate records, order by 1,2,3,4,5...
        ROW_NUMBER() OVER (PARTITION BY column_1 ORDER BY column_1) 
        --for duplicate records, order by 1,2,2,4,4,6...
        Rank() OVER (PARTITION BY column_1 ORDER BY column_1) 
        --for duplicate records, order by 1,2,2,3,3,4...
        DENSE_RANK() OVER (PARTITION BY column_1 ORDER BY column_1)

    -- NITLE()
    NITLE(int) OVER (PARTITION BY column_1 ORDER BY column_1)

    -- LAG and LEAD
    LAG(column_1, int) OVER (PARTITION BY column_1 ORDER BY column_1)
    LEAD(column_1, int) OVER (PARTITION BY column_1 ORDER BY column_1)

    --LISTAGG
        --Mysql
        GROUP_CONCAT(column_1 ORDER BY column_1 SEPARATOR ',')
        --Oracle, Snowflake & DB2
        LISTAGG(column_1, ',') WITHIN GROUP (ORDER BY column_1)
        --PostgreSQL
        STRING_AGG(column_1, ',' ORDER BY column_1) 
        --SQL Server
        STRING_AGG(column_1, ',') WITHIN GROUP (ORDER BY column_1) 


```

Processing String
```sql
--Extract string 
LEFT(column,INT)
SUBSTR(column,start_position(int),length(int))

--connect string 
CONCAT()

--OTHER 
Upper()
Lower()
Len()
```
 
LIKE 
```sql
-- start with DIAB1
like 'DIAB1%‘ 
-- end with DIAB1
like '%DIAB1' 
-- include DIAB1
like '%DIAB1%' include DIAB1
-- any condition in middle start with DIAB1 like ACNE DIAB100
like '% DIAB1%' 
```

DATE 
```SQL
SELECT 
    DATEDIFF(year, @start_dt, @end_dt) diff_in_year, 
    DATEDIFF(quarter, @start_dt, @end_dt) diff_in_quarter, 
    DATEDIFF(month, @start_dt, @end_dt) diff_in_month, 
    DATEDIFF(dayofyear, @start_dt, @end_dt) diff_in_dayofyear, 
    DATEDIFF(day, @start_dt, @end_dt) diff_in_day, 
    DATEDIFF(week, @start_dt, @end_dt) diff_in_week, 
    DATEDIFF(hour, @start_dt, @end_dt) diff_in_hour, 
    DATEDIFF(minute, @start_dt, @end_dt) diff_in_minute, 
    DATEDIFF(second, @start_dt, @end_dt) diff_in_second, 
    DATEDIFF(millisecond, @start_dt, @end_dt) diff_in_millisecond;
```