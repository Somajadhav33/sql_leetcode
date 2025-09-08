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
