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