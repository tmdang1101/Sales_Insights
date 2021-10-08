-- Summary of Dataset

Select * From sales.customers;
/* 38 different stores who purchase products from this company */

Select * From sales.transactions;
Select count(*) From sales.transactions;
/* A total of more than 150,000 transactions */

Select * From sales.markets;
Select count(*) From sales.markets;
/* 17 market locations, 15 of which are from India */

Select * From sales.products;
Select count(*) From sales.products;
/* 279 different products */

Select * From sales.date;
Select sales.date.year, count(*) From sales.date Group by sales.date.year;
/* sales transactions were recorded from 2017 to 2020 */
-- This table gives us the date format to help with filtering the data we want




/*-----------------------------------------------------------------------------*/

-- Data Exploration

Select count(*) From sales.transactions Where market_code = "Mark001";
-- number of sales made in Chennai

Select distinct product_code From sales.transactions where market_code='Mark001';
-- shows distinct products purchased in Chennai

Select * From sales.transactions Where currency = "USD";
-- two odd data entries where currency is USD in 2017

Select *
From sales.transactions
Where currency Not Like '%INR%';
-- alternative query to the one above

Select sales.transactions.*, sales.date.* 
From sales.transactions Inner Join sales.date 
On sales.transactions.order_date = sales.date.date;
-- joins the table so we can see the date and year of every transactions

Select sales.transactions.*, sales.date.* 
From sales.transactions Inner Join sales.date 
On sales.transactions.order_date = sales.date.date
Where year = 2020;
-- shows all transactions made in 2020

Select count(*)
From sales.transactions Inner Join sales.date 
On sales.transactions.order_date = sales.date.date
Where year = 2020;
-- 21550 total transactions made in 2020

Select sum(sales_amount)
From sales.transactions Inner Join sales.date 
On sales.transactions.order_date = sales.date.date
Where year = 2020;
-- total revenue in 2020 in Indian Rupee
-- Note: the data was only collected up to the first half of 2020
-- Note: no need to worry about the odd "USD" values since they were in 2017

Select sum(sales_amount)
From sales.transactions Inner Join sales.date 
On sales.transactions.order_date = sales.date.date
Where year = 2019;
-- total revenue for the entire year of 2019 in Indian Rupee

Select sum(sales_amount)
From sales.transactions Inner Join sales.date 
On sales.transactions.order_date = sales.date.date
Where year = 2019 And market_code = 'Mark001';
-- total revenue in a specific location (Chennai) in 2019
