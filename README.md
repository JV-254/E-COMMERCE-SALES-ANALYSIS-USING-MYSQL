# E-COMMERCE-SALES-ANALYSIS-USING-MYSQL
# Project Overview
This project focuses on analyzing an e-commerce sales dataset using MySQL to uncover valuable business insights related to sales performance, customer behavior, product trends, profitability, and operational efficiency.

The objective of this project is to demonstrate practical SQL skills by solving real-world business problems using data analytics techniques. The project covers everything from database design and data cleaning to advanced SQL analysis and business intelligence reporting.
# Project Objectives
The main goals of this project are to:

- Analyze sales performance across different dimensions
- Identify high-performing products and customers
- Evaluate profitability across regions and categories
- Understand customer purchasing behavior
- Detect operational inefficiencies in shipping and logistics
- Apply advanced SQL concepts to solve business problems
- Build a professional data analytics portfolio project
# Database Schema
Orders Table
| Column Name | Description                      |
| ----------- | -------------------------------- |
| Row ID      | Unique row identifier            |
| Order_ID    | Unique order identifier          |
| Order_Date  | Date the order was placed        |
| Ship_Date   | Date the order was shipped       |
| Ship Mode   | Method of transport used         | 
| Customer_ID | Unique customer identifier       |
| Customer Name| Clients name                    |
| Segment     | The body involved                |
| Country     | The country involved             |
| City        | City where goods are being sold  |
| State       | State of city                    |
| Region      | Region of the country            |
| Product_ID  | Unique product identifier        |
| Category    | Category of the goods            |
| Sub-Category| Sub-category of the goods        |
| Product Name | Name of goods                   |
| Sales       | Revenue generated from the order |
| Quantity    | Quantity sold                    |
| Profit      | Profit earned                    |

# Project Workflow
1. Database Creation
   - Create mySQL database
   - Import cleaned dataset into mySQL
2. Data Cleaning
   - Handling null values
   - Removing duplicates
   - Formatting date columns
   - Standardizing text values
   - Validating numeric fields
3. Exploratory Data Analysis (EDA)
   Explored the dataset using SQL queries to understand:

- Sales distribution
- Customer behavior
- Product performance
- Regional performance
- Profitability trends

  # Business Problems & Analysis
 ## 1. Sales Analysis
### Problem Statement

The company wants to understand its overall sales performance across different periods, regions, and product categories in order to identify growth opportunities and improve revenue generation.

### Key Business Questions
- What is the total sales revenue generated?
- What is the total profit earned?
- What is the average order value?
- What is the total quantity sold?
- How many total orders were placed?
- What is the profit margin percentage?
- What are the monthly sales trends?
- Which month generated the highest sales?
- Which month recorded the lowest sales?
- What are the yearly sales trends?
- What are the quarterly sales trends?
- Which days of the week have the highest sales?
- Which season generates the highest revenue?
- Which country generates the most sales?
- Which city contributes the highest revenue?
- Which region has the highest profit?
- Which regions are underperforming?
- What are the sales trends by region over time?
- Shipping & Operations Analysis
- What is the average shipping time?
- Which shipping mode is used most frequently?
- Which shipping mode generates the highest profit?
- Are delayed shipments affecting profitability?
- Which regions experience the longest shipping delays?
## 2. Product Analysis
### Problem Statement

The company wants to identify high-performing and low-performing products to optimize inventory, improve profitability, and understand customer purchasing patterns.

### Key Business Questions
- Which products generate the highest sales?
- Which products generate the highest profit?
- Which products generate losses?
- Which product category performs best?
- Which sub-category generates the highest revenue?
- Which product has the highest quantity sold?
- Which products have low sales but high profit?
- Which products have high sales but low profit?
- Which category contributes the most revenue?
- Which category contributes the least revenue?
- Which category has the highest profit margin?
- Which sub-category is most frequently purchased?
- What are the sales trends by category?
- Which categories are growing over time?
- Which products are most in demand?
- Which products should be promoted more?
- Which products may need to be discontinued?
- Which products experience seasonal demand?
- Which products are commonly purchased together?
- Which products have the highest return on sales?
## 3. Customer Analysis
### Problem Statement

The company wants to better understand customer purchasing behavior, identify valuable customers, and improve customer retention strategies.

### Key Business Questions
- How many unique customers are there?
- Who are the top customers by revenue?
- Who are the top customers by profit contribution?
- Which customers place the most orders?
- What is the average spending per customer?
- Which customer segment generates the highest sales?
- Which customer segment is most profitable?
- Which customer segment purchases most frequently?
- Which segment has the highest average order value?
- Which customer segment is growing fastest?
- Which customers are inactive?
- Which customers generate repeated purchases?
- Which customers contribute the least revenue?
- Which cities have the highest number of customers?
- Which regions have the most loyal customers?
- Which locations generate the highest customer lifetime value?
- Which regions have low customer engagement?
## 4. Profitability Analysis
### Problem Statement

The business wants to improve profitability by identifying profitable products, customers, and regions while reducing losses and operational inefficiencies.

### Key Business Questions
- Which products generate the highest profit margins?
- Which categories generate losses?
- Which customers are most profitable?
- Which regions have the highest profitability?
- What is the relationship between discounts and profit?
- Are higher discounts reducing profitability?
- Which products remain profitable despite discounts?
- Which shipping modes are most cost-effective?
- Which months have the highest profitability?
- Which product categories should receive more investment?

# Tools & Technologies
- MySQL
- MySQL Workbench
- SQL
- Excel 
- Power BI 
- Git & GitHub

# Dataset
This is the dataset i used: https://www.kaggle.com/datasets/georgenjau/sales-analysis-dataset

# Project SnapShot
<img width="396" height="368" alt="image" src="https://github.com/user-attachments/assets/5ed88dde-ed45-4d94-ae45-96f80fc36b48" />

<img width="646" height="378" alt="image" src="https://github.com/user-attachments/assets/ccd17b0c-1329-4064-a554-d80d0b580f76" />


# Project Delivarables
This project includes:

MySQL Database Schema
Data Cleaning Queries
Exploratory Data Analysis Queries
Business Insight Queries
Advanced SQL Queries
GitHub Documentation

# Expected Insights
By completing this project, the analysis helps to:

- Identify high-performing products and customers
- Understand seasonal sales trends
- Evaluate profitability across categories and regions
- Improve operational efficiency
- Detect underperforming products and regions
- Analyze customer retention and purchasing behavior
- Demonstrate strong SQL analytical skills

 # Future Improvements
 Potential future enhancements for this project include:

- Building interactive dashboards in Power BI
- Automating reporting workflows
- Creating stored procedures for reusable analytics
- Implementing predictive sales forecasting
- Adding customer segmentation models
- Performing market basket analysis

  # Conclusion
  This project demonstrates how SQL can be used to transform raw business data into actionable insights. Through data analysis, business intelligence techniques, and advanced SQL querying, the project provides valuable insights into sales performance, customer behavior, product profitability, and operational efficiency.

The project also serves as a strong portfolio piece for showcasing practical SQL and data analytics skills in real-world business scenarios.

# Author
George- Data Analytics & SQL Portfolio Project
