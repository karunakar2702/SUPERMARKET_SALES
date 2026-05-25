create database supermarket;
use supermarket;
select * from supermarket_sales;

select round(sum(total),2) from supermarket_sales;

-- 1. which branch drives more revenue --
-- sum()
select branch,round(sum(total),2) as TOTAL_REVENUE
from supermarket_sales
group by branch
order by TOTAL_revenue desc; 
-- avg()
select branch,round(avg(total),2) as AVG_REVENUE
from supermarket_sales
group by branch
order by AVG_revenue desc; 

-- findings
-- BRANCH A generates 42% revenue 

-- 2.normal vs member revenue --
-- SUM()
select customer_type,round(sum(total),2) as TOTAL_Revenue
from supermarket_sales
group by customer_type;
-- AVG()
select customer_type,ROUND(AVG(total),3) as AVG_Revenue
from supermarket_sales
group by customer_type;

-- findings 
-- NORMAL type customers spend more than MEMBER type customers

-- 3.male vs female revenue
-- SUM()
select gender, round(sum(total),2) as Revenue
from supermarket_sales
group by gender
order by revenue desc;
-- AVG()
select gender, round(AVG(total),3) as AVG_Revenue
from supermarket_sales
group by gender
order by AVG_revenue desc;

-- findings
-- FEMALE CUSTOMERS AVERAGE revenue is more than MALE CUSTOMERS AVERAGE revenue


-- 4.products with highest revenue --
select product_line,ROUND(sum(total),2) as Revenue
from supermarket_sales
group by product_line
order by revenue desc
;
-- average revenue of all products --
select product_line,round(avg(total),2) as AVG_revenue
from supermarket_sales
group by product_line
order by AVG_revenue desc
;
-- findings
-- approxiametely 40% of total revenue comes from FASHION ACCESSORIES & HOME AND LIFESTYLE products

-- 5.products with highest average tax rate
select product_line,round(avg(tax_5_),1) as tax 
from supermarket_sales
group by product_line
order by tax desc
;

-- 6.which payment type is used more
select payment,count(payment) as count
from supermarket_sales
group by payment
order by count desc;

select payment,count(payment) as count ,
rank() over(order by count(payment) desc) as ranking
from supermarket_sales
group by payment;

-- people prioritise credit card and Ewallet more often for shopping

-- 7.highest gross income of all products--
select product_line,round(sum(gross_income),3) as GROSS_INCOME
from supermarket_sales
group by product_line
order by GROSS_INCOME DESC;



-- 8.HIGHEST AVG GROSS INCOME
select product_line,round(AVG(gross_income),3) as AVG_GROSS_INCOME
from supermarket_sales
group by product_line
order by AVG_GROSS_INCOME DESC;

-- 9.MALE and FEMALE vs PRODUCTS
select gender,product_line,round(sum(total),2) as revenue
from supermarket_sales 
group by gender,product_line 
order by product_line,revenue desc;
 -- MALE customers spend more on 'ELECTRONIC ACCESSORIES' AND 'HOME & LIFESTYLE'
 -- whereas FEMALE customers spend more on 'FASHION ACCESSORIES','FOOD & BEVERAGES','HEALTH & BEAUTY' AND 'SPORTS & TRAVEL'

