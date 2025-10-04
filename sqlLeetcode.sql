-- 1757 . Recyclable and Low Fat Products
    SELECT product_id 
	FROM Products 
	WHERE low_fats = 'Y' AND recyclable = 'Y';

-- 584. Find Customer Referee
    SELECT name
    FROM Customer
 	WHERE referee_id IS NULL OR referee_id != 2;

-- 595. Big Countries
    SELECT name, population, area 
    FROM World
    WHERE area >= 3000000 OR population >= 25000000;

-- 1148. Article Views I
    SELECT DISTINCT author_id as id
    FROM Views
    WHERE author_id = viewer_id 
    ORDER BY id ASC;

-- 1683. Invalid Tweets
    SELECT tweet_id 
    FROM Tweets 
    WHERE LENGTH(content) > 15;

-- 1378. Replace Employee ID With The Unique Identifier
    SELECT unique_id , name 
    FROM Employees  
    Emp LEFT JOIN EmployeeUNI uni 
    ON Emp.id =  uni.id;

-- 1068. Product Sales Analysis I
    SELECT product_name, year, price 
    FROM Sales 
    INNER JOIN Product 
    ON Sales.product_id = Product.product_id;

--  1581. Customer Who Visited but Did Not Make Any Transactions
    SELECT customer_id , COUNT(customer_id) as count_no_trans
    FROM Visits
    LEFT join Transactions 
    ON visits.visit_id = transactions.visit_id
    WHERE transactions.transaction_id is NULL
    GROUP BY visits.customer_id


-- 197. Rising Temperature
    SELECT T.id
    FROM Weather T
    JOIN Weather Y
    ON T.recordDate = Y.recordDate + INTERVAL '1 day'
    WHERE T.temperature > Y.temperature;

-- 1661. Average Time of Process per Machine
   SELECT a1.machine_id, ROUND(AVG(a2.timestamp - a1.timestamp)::numeric, 3) AS               processing_time
   FROM Activity a1
   JOIN Activity a2 
   ON a1.machine_id = a2.machine_id
   WHERE a1.activity_type = 'start' AND a2.activity_type = 'end'
   GROUP BY a1.machine_id;

-- 577. Employee Bonus
   SELECT name , bonus
   FROM Employee E 
   LEFT JOIN Bonus B 
   ON E.empId = B.empId
   WHERE B.bonus IS NULL OR B.bonus < 1000;

-- 1280. Students and Examinations
   SELECT s.student_id, s.student_name, sb.subject_name, COUNT(ex.subject_name) AS  attended_exams
   FROM Students s
  JOIN Subjects sb
  ON 1=1   
  LEFT JOIN Examinations ex
  ON ex.student_id = s.student_id 
  AND ex.subject_name = sb.subject_name
  GROUP BY s.student_id, s.student_name, sb.subject_name
  ORDER BY s.student_id, sb.subject_name;

-- 570. Managers with at Least 5 Direct Reports
   SELECT name 
   FROM Employee 
   WHERE id IN (
     SELECT managerId 
     FROM Employee 
     GROUP BY managerId 
     HAVING COUNT(*) >= 5)

-- 1934. Confirmation Rate
  SELECT s.user_id, 
    ROUND(AVG(CASE WHEN c.action = 'confirmed' THEN 1 ELSE 0 END), 2) AS       confirmation_rate
  FROM Signups s
  LEFT JOIN Confirmations c
  ON s.user_id = c.user_id
  GROUP BY s.user_id;

-- 620. Not Boring Movies
  SELECT id, movie, description, rating
  FROM Cinema
  WHERE id % 2 != 0 AND description != 'boring'
  ORDER BY rating DESC;

-- 1633. Percentage of Users Attended a Contest
  SELECT contest_id, 
    ROUND(COUNT(r.user_id)*100.0/(SELECT count(*) FROM Users),2) AS percentage
  FROM Register r
  GROUP BY contest_id
  ORDER BY percentage DESC, contest_id ASC;

-- 1075. Project Employees I
  SELECT p.project_id, 
        ROUND(AVG(e.experience_years), 2) AS average_years 
  FROM Project p LEFT JOIN Employee e
  ON p.employee_id = e.employee_id
  GROUP BY  p.project_id;

-- 1211. Queries Quality and Percentage
SELECT query_name, 
    ROUND(AVG(rating * 1.0/position), 2) AS quality,
    ROUND(AVG(CASE WHEN rating < 3 THEN 1 ELSE 0 END ) * 100, 2) AS poor_query_percentage
FROM Queries 
GROUP BY query_name

-- 1193. Monthly Transactions I
SELECT TO_CHAR(trans_date, 'YYYY-MM') as month, country, 
    COUNT(amount) as trans_count,
    COUNT(CASE WHEN state='approved' then id else null end ) as approved_count, 
    SUM(amount) as trans_total_amount, SUM(CASE WHEN state='approved' then amount else 0 end) as approved_total_amount
FROM Transactions
group by country, month

-- 1174. Immediate Food Delivery II
SELECT ROUND(
    100.0 * COUNT(CASE WHEN order_date = customer_pref_delivery_date THEN 1 END)
        / COUNT(*), 2) AS immediate_percentage
FROM Delivery
WHERE (customer_id, order_date) IN 
        (SELECT customer_id, MIN(order_date) FROM Delivery GROUP BY customer_id);

-- 550. Game Play Analysis IV
SELECT ROUND(1.0* COUNT(player_id)/ (SELECT COUNT(DISTINCT player_id) FROM Activity), 2) AS fraction
FROM Activity
WHERE (player_id , event_date) IN (
    SELECT player_id, MIN(event_date) + 1
    FROM Activity
    GROUP BY player_id
)

-- 2356. Number of Unique Subjects Taught by Each Teacher
SELECT teacher_id , count(distinct subject_id) as cnt
FROM Teacher
GROUP BY teacher_id

-- 1141. User Activity for the Past 30 Days I
SELECT activity_date AS day , count(distinct user_id) as active_users 
FROM Activity 
WHERE  activity_date BETWEEN DATE '2019-07-27' - INTERVAL '29 DAYS' AND DATE '2019-07-27'
GROUP BY activity_date


--  1070. Product Sales Analysis III
SELECT product_id,year AS first_year,quantity , price
FROM Sales 
WHERE(product_id, year) IN (
    SELECT product_id, MIN(year)
    FROM Sales
    GROUP BY product_id
)

-- 596. Classes With at Least 5 Students

SELECT class
FROM Courses 
GROUP BY class
HAVING COUNT(student) >= 5


-- 1729. Find Followers Count
SELECT user_id, COUNT(follower_id) AS followers_count
FROM Followers 
GROUP BY user_id
ORDER BY user_id 

-- 619. Biggest Single Number
select case when count(*) = 1 then num else null end as num
from MyNumbers 
group by num
order by num DESC nulls last
limit 1

-- 1045. Customers Who Bought All Products
SELECT customer_id
FROM Customer
GROUP BY customer_id
HAVING COUNT(distinct product_key) = (SELECT COUNT(distinct product_key) FROM Product)

-- 1731. The Number of Employees Which Report to Each Employee
SELECT e1.employee_id  AS employee_id , 
        MAX(e1.name) AS name, 
        COUNT(e2.reports_to) AS reports_count, 
        ROUND(AVG(e2.age)) AS average_age
FROM Employees e1 JOIN Employees e2
ON e1.employee_id = e2.reports_to
GROUP BY e1.employee_id
ORDER BY employee_id;

-- 1789. Primary Department for Each Employee
SELECT employee_id , department_id 
FROM employee
WHERE primary_flag = 'Y' OR employee_id IN(
    SELECT employee_id
    FROM Employee
    GROUP BY employee_id
    HAVING COUNT(*) = 1
);

-- 610. Triangle Judgement
SELECT x, y, z, 
    CASE WHEN (x + y > z ) 
        AND (y + z > x) 
        AND (x + z > y) 
        THEN 'Yes' ELSE 'No'
    END AS triangle
FROM Triangle 

-- 1164. Product Price at a Given Date
SELECT distinct product_id, 10 as price
from Products
group by product_id
having min(change_date) > '2019-08-16'

Union 

select distinct product_id, new_price as price
from Products
where(product_id, change_date) in (
    select product_id, max(change_date)
    from Products where change_date <= '2019-08-16'
    group by product_id
)

-- 1204. Last Person to Fit in the Bus

SELECT person_name
FROM(SELECT person_name,turn, sum(weight) OVER ( ORDER BY turn) AS 
t_weight FROM Queue) as temp
WHERE t_weight <= 1000
ORDER BY turn DESC LIMIT 1;