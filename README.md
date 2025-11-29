# Zepto_Inventory_Analysis
This project focuses on analyzing grocery product availability, pricing, and stock status for Zepto — a quick-commerce delivery platform. The dataset was imported into MySQL, and insights were generated using SQL queries to understand inventory conditions, discount effects, and product demand.


# Description
The dataset contains product-related details such as category, price, discount, stock level, and quantity sold. It helps evaluate stock performance and identify potential restocking or pricing strategy improvements.


# Dataset Columns
Column                           Description

 Category               :  Category of the product (Fruits, Vegetables, Snacks, etc.)
Name	                  :  Product name
Mrp                     :  Maximum Retail Price
DiscountPercent         :	 Discount percentage applied
AvailableQuantity	      :  Current stock available
DiscountedSellingPrice  :	 Final price customer pays
WeightInGms    	        :  Product weight
OutOfStock	            :  Indicates if item is out of stock (Yes/No or 1/0)
Quantity    	          :  Units sold


# 🎯 Project Objectives

1.Analyze product availability and stock shortages.

2.Identify top-selling and low-selling products.

3.Understand discount impact on product sales.

4.Generate insights for inventory planning and revenue opportunities.

# 🛠 Tools & Technologies
Tool                     	Purpose
MySQL / SQL	        :    Data querying & analysis
MySQL Workbench     : 	Database management
CSV Dataset	        :   Source dataset imported into SQL

# Insights:-

1.Found top 10 best-value products based on discount percentage.
2.Identified high-MRP products that are currently out of stock.
3.Estimated potential revenue for each product category.
4.Ranked top 5 categories offering highest average discounts.
5.Calculated price per gram to identify value-for-money products.
6.Grouped products based on weight into Low, Medium, and Bulk categories.
