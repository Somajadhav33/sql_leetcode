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

