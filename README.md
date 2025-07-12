# DSA-Capstone-Project-Case-Study-2-Kultra-Mega-Stores-Inventory.
DSA Capstone data analysis project report for Kultra Mega Stores
## Kultra Mega Stores Inventory Analysis (2009–2012)
### Project Overview
This project was completed as part of a capstone requirement for the **DSA Data Analysis Class**. Kultra Mega Stores (KMS) is a Nigerian-based office supplies and furniture retailer headquartered in Lagos. As a **Business Intelligence Analyst** supporting the Abuja division, I was tasked with analyzing order and return data between 2009 and 2012 to uncover actionable business insights.
### 🎯 Objectives
The core business questions were grouped into two scenarios:
#### Case Scenario I
1. Which product category had the highest sales? 
2. What are the Top 3 and Bottom 3 regions in terms of sales? 
3. What were the total sales of appliances in Ontario? 
4. Advise the management of KMS on what to do to increase the revenue from the bottom 10 customers 
5. KMS incurred the most shipping cost using which shipping method?
#### Case Scenario II
6. Who are the most valuable customers, and what products or services do they typically purchase? 
7. Which small business customer had the highest sales? 
8. Which Corporate Customer placed the most number of orders in 2009 – 2012? 
9. Which consumer customer was the most profitable one? 
10. Which customer returned items, and what segment do they belong to? 
11. If the delivery truck is the most economical but the slowest shipping method and Express Air is the fastest but the most expensive one, do you think the company appropriately spent shipping costs based on the Order Priority? Explain your answer.
 
### Tools Used

- **SQL Server** – for all data querying and analysis
- **Excel** – for initial file review.
- **GitHub** – for version control and reporting.

 ## Data Analysis
 
### Case Scenario I

*1. Which product category had the highest sales?*
```
select Product_Category, sum(sales) as Total_Sales
from [KMS Sql Case Study]
group by Product_Category
order by Total_Sales desc
``` 
**Technology** generated the highest total sales.
Although Kultra Mega Stores (KMS) is positioned as a specialist in **Office Supplies** and **Furniture**, the analysis reveals that the **Technology category had the highest total sales** between 2009 and 2012.

**Interpretation & Business Implications:**

- **Hidden Revenue Stream**  
  Technology products are driving significant revenue and may be under-promoted. This presents an opportunity to expand offerings or upsell technology products.

- **Marketing Repositioning Opportunity**  
  KMS may need to slightly adjust its brand messaging to reflect its actual sales strengths. Messaging such as "Complete Office Solutions – Furniture, Supplies & Tech" may resonate more with what customers are buying.

- **Inventory Strategy Adjustment**  
  Current procurement may be skewed toward office supplies and furniture. A shift toward stocking high-demand tech items could improve availability and boost profit margins.


*2. What are the Top 3 and Bottom 3 regions in terms of sales?*
 ```
select Region, sum(sales) as Total_Sales
from [KMS Sql Case Study]
group by Region
order by Total_Sales desc
```
 
The analysis of total sales across Canadian regions revealed the following:

##### Top 3 Regions by Sales:
- **West**
- **Ontario**
- **Prairie**

These regions collectively contribute the highest revenue to KMS, indicating strong market presence and customer engagement.

#####  Bottom 3 Regions by Sales:
- **Yukon**
- **Northwest Territories**
- **Nunavut**

These territories generated the least revenue during the 2009–2012 period, showing limited penetration or purchasing activity.

#####  Interpretation & Business Implications:

- **Strongholds Identified**  
  The top regions should remain strategic focus areas for retention, upselling, and pilot programs for new products.

- **Market Development Opportunity**  
  The bottom 3 regions represent **underserved or untapped markets**. Limited logistics, awareness, or infrastructure may be restricting demand.


*3. What were the total sales of appliances in Ontario?*
```
select sum(sales) as Total_Sales
from [KMS Sql Case Study]
where Product_Sub_Category = 'appliances' and Region = 'Ontario'
```

The analysis of product-category sales by province revealed that **₦202,346.84** worth of **Appliances** were sold in **Ontario** between 2009 and 2012.

###  Interpretation & Business Implications:

- **Strong Category Performance in Key Region**  
  Ontario, being one of KMS’s top revenue-generating regions, also shows significant interest in appliance products — a category not explicitly mentioned in KMS's specialization.

- **Cross-Selling Opportunity**  
  Since Ontario is a high-performing region and Appliances have strong sales there, KMS can explore bundling **Appliances with Furniture or Office Supplies** to boost overall revenue per transaction.


*4. Advise the management of KMS on what to do to increase the revenue from the bottom 10 customers*
```
select Customer_Name, sum(sales) as Total_Sales
from [KMS Sql Case Study]
group by Customer_Name
order by Total_Sales desc
```

 An analysis of the bottom 10 customers by total sales revealed:
- Very **low order frequency**
- In some cases, **negative or minimal profit**
- A spread across various segments (Consumer, Small Business, etc.)
- Limited purchase of high-margin categories like Technology or Furniture

###  Interpretation & Business Implications:

- These customers are **currently inactive or disengaged**, but represent a potential revenue stream if reactivated properly.
- Low transaction volumes suggest that KMS may not be top-of-mind or competitively priced for their needs.
- Some may only buy low-ticket items or one-off purchases, leading to poor lifetime value.


*KMS incurred the most shipping cost using which shipping method?*
```
select Ship_Mode, sum(Shipping_Cost) as Total_Shipping_Cost
from [KMS Sql Case Study]
group by Ship_Mode
order by Total_Shipping_Cost desc
```


Analyzing the total shipping cost by shipping method revealed that:
- **Delivery Truck** accounted for the **highest total shipping cost** (₦51,971.94),
- Followed by **Regular Air** and **Express Air**

### Interpretation & Business Implications:

- **Delivery Truck**, while likely used for bulk or long-distance shipments, is the **most expensive overall**, even though it's considered economical on a per-unit basis.
- This suggests it may be overused or inefficiently routed in certain scenarios.
- It’s possible that large-volume or lower-priority orders are defaulting to this method, inflating total logistics spend.


### Case Scenario II

*6. Who are the most valuable customers, and what products or services do they typically purchase?*
```
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
```

Analysis of total sales by customer between 2009 and 2012 revealed the top 10 highest revenue-generating customers:

#### Top 5 by Total Sales:
- **Emily Phan**
- **Deborah Brumfield**
- **Roy Skaria**
- **Sylvia Foulston**
- **Grant Carroll**

They accounted for a significant portion of total revenue during the period.

#### Products They Typically Purchase:
- **Office Supplies** – the most popular category among high-value customers
- **Furniture** – a consistent choice across all top customers
- **Technology** – occasionally purchased alongside other categories

**###  Interpretation & Business Implications:**

- These customers are **multi-category buyers**, indicating a higher trust level in KMS's product range.
- They likely represent **repeat clients** or **bulk-ordering entities** (e.g., offices, resellers).
- Their loyalty suggests that **consistent service and availability** influence retention.


*7. Which small business customer had the highest sales?*
```
select Customer_Name, sum(Sales) as Total_Sales
from [KMS Sql Case Study]
where Customer_Segment = 'Small Business'
group by Customer_Name
order by Total_Sales desc
```


The analysis identified **Dennis Kane** as the top customer in the **Small Business** segment between 2009 and 2012, with a total spend of **₦75,967.59**.

### 💡 Interpretation & Business Implications:

- **Dennis Kane’s spending level is relatively close to corporate customers**, indicating strong business needs and consistent ordering behavior.
- His purchasing activity shows Small Business customers can be **just as profitable as Corporate clients** if nurtured effectively.
- High spending may indicate trust in product quality, service, or delivery reliability.


*8. Which Corporate Customer placed the most number of orders in 2009 – 2012?*
```
select Customer_Name, count(distinct Order_ID) as Total_Orders
from [KMS Sql Case Study]
where Customer_Segment = 'corporate'
group by Customer_Name
order by Total_Orders desc
```


After filtering for Corporate segment customers, **Adam Hart** and **Roy Skaria** were identified as the customers with the **highest number of unique orders** — consistently placing **18 separate orders** between 2009 and 2012.

###  Interpretation & Business Implications:

- Their frequent purchases suggest a **strong ongoing business relationship** and a high level of operational dependency on KMS.
- Although total spend may not be the highest, the consistent ordering behavior is ideal for **predictable revenue flow**.



