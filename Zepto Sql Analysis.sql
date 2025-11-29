Create database Zepto_SQL_Project;
use  Zepto_SQL_Project;
set sql_safe_updates=0;

create table zepto(
sku_id int auto_increment primary key,
Category varchar(120),
name varchar(200) not null,
mrp numeric(8,2),
discountPercent numeric(5,2),
availableQuantity  int,
discountedSellingPrice numeric(8,2),
weightInGms int,
outOfStock boolean,
quantity int
);

select* from zepto;

---------------------------------------data exploration-------------------------------

------count of rows------------
select count(*) from zepto;

------------sample data-------

select* from zepto
limit 10;

---------null values-----------------------

select * from zepto
where name is null
or
Category is null
or
mrp is null
or
discountPercent is null
or
discountedSellingPrice is null
or
weightInGms is null
or
availableQuantity is null
or
outOfStock is null
or
quantity is null;


-----------different product categories---------------

select distinct category
from zepto
order by category;


-------product names present multiple times------

select name, count(sku_id) as "Number_of_SKUs"
from zepto
group by name
having count(sku_id) > 1
order by count(sku_id) desc;


---------------products in stock vs out of stock------

select outOfStock,count(sku_id)
from zepto
group by outOfStock;

----------------------Data Cleaning-----------------

------products with price = 0----------------

select * from zepto
where mrp = 0 OR discountedSellingPrice = 0;

delete from zepto
where mrp = 0;


-----convert paise to rupees----

update zepto
set mrp = mrp / 100.0,
discountedSellingPrice = discountedSellingPrice / 100.0;

SELECT mrp, discountedSellingPrice FROM zepto;


select* from zepto;

------------------------------------------Data Analysis---------------------------


----- Q1. Find the top 10 best-value products based on the discount percentage.----

select distinct name, mrp, discountPercent
from zepto
order by discountPercent desc
limit 10;

-------Q2.What are the Products with High MRP but Out of Stock----------

select distinct name,mrp
from zepto
where outOfStock = 1 and mrp > 300
order by mrp desc;


-----Q3.Calculate Estimated Revenue for each category------
select Category,
sum(discountedSellingPrice * availableQuantity) as total_revenue
from zepto
group by Category
order by total_revenue;

-------- Q4. Find all products where MRP is greater than ₹500 and discount is less than 10%.-------

select distinct name, mrp, discountPercent
from zepto
where mrp > 500 and discountPercent < 10
order by mrp desc, discountPercent desc;


----- Q5. Find the price per gram for products above 100g and sort by best value.-----

select distinct name, weightInGms, discountedSellingPrice,
round(discountedSellingPrice/weightInGms,2) as  price_per_gram
from zepto
where weightInGms >= 100
order by price_per_gram;


------ Q6. Identify the top 5 categories offering the highest average discount percentage.----

select Category,
round(avg(discountPercent),2) as avg_discount
from zepto
group by Category
order by avg_discount desc
limit 5;


------Q7.Group the products into categories like Low, Medium, Bulk.--------

select distinct name, weightInGms,
case
when weightInGms < 1000 then 'Low'
	when weightInGms < 5000 then 'Medium'
	else 'Bulk'
	end as weight_category
from zepto;



------------Q8.What is the Total Inventory Weight Per Category-------------- 


select Category,
sum(weightInGms * availableQuantity) as total_weight
from zepto
group by Category
order by total_weight;




--------------Insights------------

1.Found top 10 best-value products based on discount percentage.
2.Identified high-MRP products that are currently out of stock.
3.Estimated potential revenue for each product category.
4.Ranked top 5 categories offering highest average discounts.
5.Calculated price per gram to identify value-for-money products.
6.Grouped products based on weight into Low, Medium, and Bulk categories.



