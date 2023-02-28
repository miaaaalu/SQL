## 595. Big Countries

Write an SQL query to report the name, population, and area of the big countries.

A country is big if:
- it has an area of at least three million (i.e., 3000000 km2), or
- it has a population of at least twenty-five million (i.e., 25000000).

| Column Name      | type |
| ----------- | ----------- |
| name        | varchar |
| continent   | varchar |
| area        | int     |
| population  | int     |
| gdp         | int     |

```sql
SELECT name, 
       population,
       area
FROM World
Where POPULATION >= 25000000 OR Area >= 3000000
```

## 1757. Recyclable and Low Fat Products
Write an SQL query to find the ids of products that are both low fat and recyclable.
- low_fats is an ENUM of type ('Y', 'N') where 'Y' means this product is low fat and 'N' means it is not.
- recyclable is an ENUM of types ('Y', 'N') where 'Y' means this product is recyclable and 'N' means it is not.

```sql
SELECT product_id 
FROM Products 
Where low_fats = 'Y' AND recyclable = 'Y'
```

## 584. Find Customer Referee
Write an SQL query to report the names of the customer that are not referred by the customer with id = 2.

```sql
SELECT name
FROM Customer 
WHERE coalesce(referee_id,0) !=2
```


## 183. Customers Who Never Order
Write an SQL query to report all customers who never order anything.
- Table: Customers
- Table: Orders

```sql
SELECT name as Customers
FROM Customers 
WHERE customers.id NOT IN (
    SELECT customerId
    FROM orders
) 
```

