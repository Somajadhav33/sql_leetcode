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

1907. Count Salary Categories

SELECT 'Low Salary' AS category, COUNT(*) AS accounts_count FROM Accounts WHERE income < 20000 
UNION
SELECT 'Average Salary' AS category, COUNT(*) AS accounts_count FROM Accounts WHERE income >= 20000 AND income <= 50000
UNION
SELECT 'High Salary' AS category, COUNT(*) AS accounts_count FROM Accounts WHERE income > 50000 

-- 626. Exchange Seats
SELECT(
    CASE WHEN id % 2 = 1 AND id = (select max(id) FROM Seat) THEN id
    WHEN id % 2 = 1 THEN id + 1
    WHEN id % 2 = 0 THEN id - 1
    END) AS id, Student
FROM Seat 
ORDER BY id


-- 1341. Movie Rating

WITH most_rated_by_user AS (
    SELECT u.name As user_name , COUNT(*) as nums_rating
    FROM MovieRating m
    INNER JOIN users u
    ON u.user_id = m.user_id
    GROUP BY u.user_id, u.name
    ORDER BY nums_rating DESC, u.name ASC
    LIMIT 1
),
most_rated_movie  AS (
    select m.title as movie_name, AVG(mr.rating) as nums_rating
    FROM MovieRating mr
    INNER JOIN movies m
    ON mr.movie_id = m.movie_id
    WHERE EXTRACT(YEAR FROM created_at) = 2020
          AND EXTRACT(MONTH FROM created_at) = 2
    GROUP BY mr.movie_id, m.title
    ORDER BY nums_rating DESC, m.title ASC
    LIMIT 1
)

SELECT user_name AS results
FROM most_rated_by_user
UNION ALL 
SELECT movie_name AS results
FROM most_rated_movie;


dhoop badi teej hai , kahi aasre ko peed bhi nahi hai
din dhal raha hai , haath main roshni  nhi hai 
pine wale bithe hai khali glass, shrabkhane mai shraabh bhi nahi hai
ladkiya mangthi hai , makaan aur gadi , yaha badan dhkne ke liye accha kapda tak nahi 

Tum kehate hoo ke kitabe uthaoo padhayii karo ,
Kair ye to ab humse nahi ho raha , kya kare kahi dil nahi lag raha,
Agar koi kitab ho jisme tumhare bare main likha ho to batao,
Agar koi kitab ho jisme tumhare bare main likha ho to batao,
Har panna hum raat lenge , har pangti hum dimag main chaap lenge
Fir Koi humse aage ja ke dikhaye ,  to bataoo
Kitabe hum haath main thaamenge,  lekin manjil tum bataoo ;


तुम कहते हो किताबें उठाओ, पढ़ाई करो,
कहाँ ये अब हमसे हो रहा, दिल कहीं नहीं लग रहा।
अगर कोई किताब हो जिसमें तुम्हारे बारे में लिखा हो, बताओ,
अगर कोई किताब हो जिसमें तुम्हारे बारे में लिखा हो, बताओ।
किताब हाथ से नीचे नहीं रखेंगे, तुम बस बताओ।


Talluq chuut jane par jo mushkil main tuze dale 
main apni aakh main asa koi aasu na chodunga


Maiin chahata to hu ke uske sare kwab,  khwaishe  main puri karu
use oo sari khushiya du jiski oo haqdaar hai ,
per uski kuch kwayshe jo main kabhi puri nahi karna chahat,
kyquki use use use bhul jana bhi ek kwwish hai


WITH temp AS 
(SELECT requester_id AS id FROM RequestAccepted
UNION ALL
SELECT accepter_id AS id FROM RequestAccepted)

SELECT id, COUNT(id) AS num FROM temp GROUP BY id 
ORDER BY num DESC LIMIT 1

SELECT user_id , UPPER(SUBSTRING(name FROM 1 FOR 1)) || 
                 LOWER(SUBSTRING(name FROM 2)) AS name 
FROM Users ORDER BY user_id


 #include <bits/stdc++.h>
using namespace std;

class solution{
    public:
    void mergeSort(int arr[], int n){
        mergeSort(arr,0,n-1);
    }
    private:
        void mergeSort(int arr[],int left,int right){
            if(left==right) return;
            int mid=(left+right)/
            merge(arr,left,mid,right);
        }
        
        void merge(int arr[],int left,int mid,int right){
            int n=right-left+1;
            int i=left,j=mid+1,k=0;
            
            while(i<=mid && j<=right){
                if(arr[i]<arr[j]){
                    new_arr[k]=arr[i];
                    i++;
                    k++;
                }else{
                    new_arr[k]=arr[j];
                    j++;
                    k++;
                }
            }
            while(i<=mid){
                new_arr[k]=arr[i];
                i++;
                k++;
            }
            whi
        }
};

SELECT sell_date, COUNT(DISTINCT product) AS num_sold, 
STRING_AGG(DISTINCT product, ',' ORDER BY product) AS products
FROM Activities
GROUP BY sell_date
ORDER BY sell_date
#include <bits/stdc++.h>
using namespace std;

class solution{
    public:
        int partition(int arr[],int low,int high){
            int i=low,j=high;
            while(i<j){
                while(arr[i]<=arr[low]) i++;
                while(arr[j]>arr[low])
                if(i<j){
                    int temp=arr[i];
                    arr[i]=arr[j];
                    arr[j]=temp;
                }
            }
            int temp=arr[low];
            arr[low]=arr[j];
            arr[j]=temp;
            return j;
        }
        void quickSort(int arr[],int n){
             quickSort(arr,0,n-1);using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void CheckBoxList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label3.Text = "You selected: ";
        foreach (ListItem li in CheckBoxList1.Items)
        {
            if (li.Selected)
            {
                Label3.Text += " " + li;
            }
            
        }
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label4.Text = "You selected: " + DropDownList1.SelectedItem.Text;
    }
    protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label5.Text = "You selected: " + ListBox1.SelectedItem.Text;
    }
    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label6.Text = "You selected: " + RadioButtonList1.SelectedItem.Text;
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {

    }
    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {

    }
    protected void TextBox1_TextChanged1(object sender, EventArgs e)
    {
        Label13.Text = "You Entered  : ";
        Label13.Text += TextBox1.Text;
    }
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        Label14.Text = "Selected Date : ";
        Label14.Text += Calendar1.SelectedDate.ToLongDateString();
    }
}using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void CheckBoxList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label3.Text = "You selected: ";
        foreach (ListItem li in CheckBoxList1.Items)
        {
            if (li.Selected)
            {
                Label3.Text += " " + li;
            }
            
        }
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label4.Text = "You selected: " + DropDownList1.SelectedItem.Text;
    }
    protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label5.Text = "You selected: " + ListBox1.SelectedItem.Text;
    }
    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label6.Text = "You selected: " + RadioButtonList1.SelectedItem.Text;
    }
    protected void LinkButton1_Click(object sender, using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void CheckBoxList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label3.Text = "You selected: ";
        foreach (ListItem li in CheckBoxList1.Items)
        {
            if (li.Selected)
            {
                Label3.Text += " " + li;
            }
            
        }
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label4.Text = "You selected: " + DropDownList1.SelectedItem.Text;
    }
    protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label5.Text = "You selected: " + ListBox1.SelectedItem.Text;
    }
    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label6.Text = "You selected: " + RadioButtonList1.SelectedItem.Text;
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {

    }
    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {

    }
    protected void TextBox1_TextChanged1(object sender, EventArgs e)
    {
        Label13.Text = "You Entered  : ";
        Label13.Text += TextBox1.Text;
    }
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        Label14.Text = "Selected Date : ";
        Label14.Text += Calendar1.SelectedDate.ToLongDateString();
    }
} e)
    {

    }
    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {

    }
    protected void TextBox1_TextChanged1(object sender, EventArgs e)
    {
        Label13.Text = "You Entered  : ";
        Label13.Text += TextBox1.Text;
    }
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        Label14.Text = "Selected Date : ";
        Label14.Text += Calendar1.SelectedDate.ToLongDateString();
    }
}
        }
    private:
        void quickSort(int arr[],int low,int high){
            if(low<high){
             int j=partition(arr,low,high);
             quickSort(arr,low,j-1);
             quickSort(arr,j+1,h
         }
        }
};
select email
from Person
GROUP BY email
HAVING COUNT(email) > 1;

with cte as (
select id,visit_date,
lag(people, 2) over (order by id) as lag2,
lag(people, 1) over (order by id) as lag1,
people,
lead(people, 1) over (order by id) as lead1,
lead(people, 2) over (order by id) as lead2
from stadium
)

select id, visit_date, people
from cte
where people >=100
and ((lead1>=100 and lead2 >=100) or (lag1>=100 and lag2 >=100) or (lag1>=100 and lead1 >=100) )

select customer_number
From Orders
Group By customer_number
ORDER BY COUNT(*) 
LIMIT 1;
Mere chup rehne ka sabab yeh bayaan hai,
Naraz nahi tumse, bas dil bejaan hai,
Jo rooth gaya, woh gulam kaisa — yeh soch aayi,
Bas ek pal ko apni aukaat yaad aayi.


select actor_id , director_id
from ActorDirector 
group by actor_id, director_id
having count(director_id) >= 3;


Mera to tumhari fikar karna bhi tumhe galat lagta hai,
Par tumse baat kiye bina dil nahi lagta mera.
Kya tumhe सच me kabhi mehsoos nahi hua, Ki mujhe tumse mohabbat hai…?
Ya phir tum bas yunhi, bewajah beparwah ban kar dikhawa karti ho?


Mujhe tumse kuch kehna hai, dil  kuch poochta hai, izazat hai?
Lamhe lamhe tumse baat karni hai , har baat tumhe batani hai, izazat hai?
Rehna chahta hoon tumhaare kareeb, saaya ban kar, izazat hai?
Sapno ko haqeeqat banani hai , Sari zindagi  tumhare sang bitani hai,  izazat hai?
Duniya ko batana hai tuum sirf mere ho, ab to bolo.. izazat hai?


Na koi hai jise main apna keh kar fikr karu,
Na koi jo khamoshi me meri haalat samjhe।
Log bahut milte hain, bheed kabhi kam nahi huyee,
Par dil ki takleef… kisi ki nazar me kabhi nahi aane di

SELECT id,
SUM(CASE WHEN month = 'Jan' THEN revenue END) AS Jan_Revenue,
SUM(CASE WHEN month = 'Feb' THEN revenue END) AS Feb_Revenue,
SUM(CASE WHEN month = 'Mar' THEN revenue END) AS Mar_Revenue,
SUM(CASE WHEN month = 'Apr' THEN revenue END) AS Apr_Revenue,
SUM(CASE WHEN month = 'May' THEN revenue END) AS May_Revenue,
SUM(CASE WHEN month = 'Jun' THEN revenue END) AS Jun_Revenue,
SUM(CASE WHEN month = 'Jul' THEN revenue END) AS Jul_Revenue,
SUM(CASE WHEN month = 'Aug' THEN revenue END) AS Aug_Revenue,
SUM(CASE WHEN month = 'Sep' THEN revenue END) AS Sep_Revenue,
SUM(CASE WHEN month = 'Oct' THEN revenue END) AS Oct_Revenue,
SUM(CASE WHEN month = 'Nov' THEN revenue END) AS Nov_Reven
SUM(CASE WHEN month = 'Dec' THEN revenue END) AS Dec_Revenue
FROM Department
GROUP BY id;
DOCKER AND KUBERNATICS

SDLC - 
    steps - 
		packages +  dependencies + appllication level + external 
I will provide you with a topic and a set of paragraphs on that topic. Your task is to create structured notes from this content that are clear, simple, and easy to understand. The notes should be organized in a format suitable for academic scoring around 12 to 16 marks.

Please follow these instructions:

Use only simple English; avoid difficult or complex words.

Base the notes mostly on the content I provide, but if any important details relevant to the topic are missing in my paragraphs, you may add those details accurately and clearly.

Structure the notes with clear headings, bullet points, and short sentences for easy reading.

Include relevant examples from the text when needed to clarify points.

If there are images related to the content, you may refer to and incorporate them briefly to support the notes.

Ensure the notes cover all key ideas and important details to help answer exam questions well.

Keep the notes concise but informative enough for good exam performance.

When I provide the topic and paragraphs, respond with structured notes following these guidelines

-- Write your PostgreSQL query statement below
SELECT stock_name, 
(SUM(CASE WHEN operation = 'Sell' THEN price ELSE 0 END) - SUM (CASE WHEN operation = 'Buy' THEN price ELSE 0 END)) as capital_gain_loss 
FROM Stocks GROUP BY stock_name


react , tailwind , flowbite ⏳ 90-Minute Masterclass (that turned into 2.5 hours 😆)



Yesterday, I attended the “Master React Basics in 90 Minutes” masterclass by WsCube Tech , and honestly, even though it stretched well past time, it was totally worth it!

 

I already have a strong foundation in React, but this session was a great refresh and add-on. It helped me revisit the essentials and pick up a few new insights along the way.



Always feels great to keep learning and sharpening the skills..



#ReactJS #LearningJourney #WsCubeTech #FrontendDevelopment #KeepLearning


Hum khud andheron mein kho gaye hain,  
Aur duniya humse roshni maang rahi hai।  
Log humse unki zindagi sudhaarne ki baat karte hain,  
Jabki humari apni zindagi uljhi padi hai।  




Happy Birthday! 🎉 Dev karu tula sagl milo jaychi tu hakkdar aahes — khup success, khup peace, ani khup smile milot ya year madhe 💫

Best wishes to an extremely beautiful, smart, genius, and kind classmate

Gift dilo asta pan sutti mule chance miss zalla maza 😅



1️⃣ “Tuza kahi vachaycha plan aahe ka sutti madhe?”
2️⃣ “Asel tar sang, msg takun thev mala 😅 maza balance samplay aahe, msg nahi karu shakt 😌”