--List the distinct store ids and order number from the sales table where the order date is greater than or equal to January 1, 1994 
--and the quantity is greater than 5. The query should produce the result set listed below.


--List the distinct store ids and order number from the sales table where the order date is greater than or equal to January 1, 1994 
--and the quantity is greater than 5. The query should produce the result set listed below.

select distinct [stor_id],ord_num from 
[dbo].[sales]
where [ord_date] > = '1994-01-01'
and [qty] >5;


--List the name, city, and state from the authors table where the state is KS or UT. 
--Format the name of the author as the first letter of first name followed by a space followed by the last name. 
--Order the result set by the name. 

Select CONCAT(SUBSTRING(au_fname,1,1), ' ',au_lname )AS name,
city,
state
from [dbo].[authors]
where [state] in ('KS', 'UT') 
ORDER BY name;


--List the title id, title, royalty, publisher date, and book available date by adding 
--three months to the publisher date from the titles table where the price is greater than or equal to $15.00, 
--and the year to date sales is greater than or equal to 4000. 
--Display only the first 30 characters of the title. 
--Place the symbol ‘%‘ after each royalty amount in the result set. 
--Display the publisher date and the book available date in the format of dd-MM-yyyy. 
--Order the result set by the title. The query should produce the result set listed below.

select
[title_id],
SUBSTRING(title, 1,30) AS title, 
CONCAT([royalty], '%') As royalty,
format ([pubdate], 'dd-MM-yyy')  As pubdate,
FORMAT(DATEADD(MONTH,3,pubdate), 'dd-MM-yyyy') As available_date
from [dbo].[titles]
where price >= 15.00
AND [ytd_sales] >= 4000
order by [title]


--List the first name, last name, and hire date from the employees table for employees with a hire year of 1990. 
--Format the name as the last name followed by a comma followed by a space followed by the first name. 
--Display the hire date in the format of MMM dd yyyy. Order the result set by the name of the employee. 
--The query should produce the result set listed below.

select 
CONCAT ([lname], ', ', [fname]) AS name,
format([hire_date], 'MMM dd yyyy') AS hire_date
from [dbo].[employees]
where DATEPART(year,hire_date) = '1990'
order by name;

--List the title id, title, and price from the titles table, and calculate a new price by increasing the price by 5% 
--where the type is business or popular_comp.
--Use the formula (price * 1.05) to calculate the new price, and round the answer to 2 decimal points. 
--The query should produce the result set listed below.

select
[title_id],[title],[price],
format ((price*1.05), 'N') As new_price
from 
[dbo].[titles]
where [type]IN ( 'business' ,'popular_comp'); 



