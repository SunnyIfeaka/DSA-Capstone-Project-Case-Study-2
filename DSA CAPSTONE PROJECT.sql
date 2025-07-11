create database DSA_CAPSTONE_PROJECT_db

select * from [KMS Sql Case Study]

select * from Order_Status

---------------Case Scenario I---------------------------


---- (1) - Which product category had the highest sales?
select Product_Category, sum(sales) as Total_Sales
from [KMS Sql Case Study]
group by Product_Category
order by Total_Sales desc


---- (2) - What are the Top 3 and Bottom 3 regions in terms of sales?
select Region, sum(sales) as Total_Sales
from [KMS Sql Case Study]
group by Region
order by Total_Sales desc


---- (3) - What were the total sales of appliances in Ontario?
select sum(sales) as Total_Sales
from [KMS Sql Case Study]
where Product_Sub_Category = 'appliances' and Region = 'Ontario' 


---- (4) - Advise the management of KMS on what to do to increase the revenue from the bottom 10 customers 
select Customer_Name, sum(sales) as Total_Sales
from [KMS Sql Case Study]
group by Customer_Name
order by Total_Sales desc


---- (5) - KMS incurred the most shipping cost using which shipping method?
select Ship_Mode, sum(Shipping_Cost) as Total_Shipping_Cost
from [KMS Sql Case Study]
group by Ship_Mode
order by Total_Shipping_Cost desc




--------------Case Scenario II--------------------


---- (6) - Who are the most valuable customers, and what products or services do they typically purchase?
select Customer_Name, sum(Sales) as Total_Sales
from [KMS Sql Case Study]
group by Customer_Name
order by Total_Sales desc

select Product_Category, count(*) as Purchase_Count
from [KMS Sql Case Study]
where Customer_Name in (
    select top 10 Customer_Name
    from [KMS Sql Case Study]
    group by Customer_Name
    order by sum(Sales) desc
    )
group by Product_Category
order by Purchase_Count desc


---- (7) - Which small business customer had the highest sales?
select Customer_Name, sum(Sales) as Total_Sales
from [KMS Sql Case Study]
where Customer_Segment = 'Small Business'
group by Customer_Name
order by Total_Sales desc


---- (8) - Which Corporate Customer placed the most number of orders in 2009 – 2012?
select Customer_Name, count(distinct Order_ID) as Total_Orders
from [KMS Sql Case Study]
where Customer_Segment = 'corporate'
group by Customer_Name
order by Total_Orders desc


---- (9) - Which consumer customer was the most profitable one?
select Customer_Name, sum(Profit) as Total_Profit
from [KMS Sql Case Study]
where Customer_Segment = 'consumer'
group by Customer_Name
order by Total_Profit desc


---- (10) - Which customer returned items, and what segment do they belong to?
select distinct [KMS Sql Case Study].Customer_Name, 
				[KMS Sql Case Study].Customer_Segment
from [KMS Sql Case Study]
JOIN  Order_Status 
on [KMS Sql Case Study].Order_ID = Order_Status.Order_ID
where Order_Status.Status = 'Returned'


---- (11) - If the delivery truck is the most economical but the slowest shipping method and Express Air is the fastest but the most expensive one, do you think the company appropriately spent shipping costs based on the Order Priority? Explain your answer 
select Order_Priority, Ship_Mode, count(*) as Orders, sum(Shipping_Cost) as Total_Shipping_Cost
from [KMS Sql Case Study]
group by Order_Priority, Ship_Mode
order by Order_Priority, Ship_Mode