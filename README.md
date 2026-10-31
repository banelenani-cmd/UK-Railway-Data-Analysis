# UK Railway Data Analysis

## Project Overview

This project analyses UK railway ticket sales and operational performance using MySQL and Tableau.

The objective is to understand ticket sales patterns, identify peak travel periods, evaluate operational performance and provide data-driven business recommendations.

## Tools Used

- **MySQL Workbench:** Data exploration, cleaning and validation
- **Tableau:** Data visualisation and dashboard development
- **CSV:** Data storage and transfer

## Business Questions

1. What are the most popular railway routes?
2. What are the peak travel times?
3. How does revenue vary by ticket type and class?
4. What is the on-time performance?
5. What are the main factors contributing to disruptions?

## Data Cleaning and Validation

The SQL preparation process included:

- Checking for duplicate records using `ROW_NUMBER()` and `GROUP BY`
- Checking for missing values
- Inspecting categorical values for inconsistencies
- Standardising selected delay-reason categories
- Removing leading and trailing spaces using `TRIM()`
- Checking date formats and converting date/time columns to appropriate SQL data types
- Reviewing the prepared dataset before visualisation

The SQL script is available in the `sql` folder.

## Dashboard 1: Railway Revenue & Ticket Sales

![Railway Revenue Dashboard](dashboards/Railway_Revenue_Dashboard.png)

### Key Findings

- Total recorded ticket sales value: **£741,921**
- Average ticket price: **£23.44**
- Advance tickets generated the highest recorded sales value.
- Standard Class contributed more sales value than First Class.
- Anytime tickets had the highest average ticket price.

### Business Recommendations

- Investigate Advance ticket demand and pricing opportunities.
- Analyse sales volumes alongside average ticket prices.
- Evaluate First Class demand and commercial performance.

## Dashboard 2: Railway Operational Performance

![Railway Operational Dashboard](dashboards/Railway_Operational_Dashboard.png)

### Key Findings

- **86.8%** of recorded ticket transactions were associated with on-time journeys.
- **4,172** ticket transactions were associated with delayed or cancelled journeys.
- Technical issues were the largest recorded disruption category.
- Peak departure hours were approximately **06:00 and 18:00**.

### Business Recommendations

- Investigate recurring technical issues and preventive maintenance priorities.
- Review capacity and resource allocation during peak travel periods.
- Strengthen contingency planning for weather-related disruptions.

## Conclusion

This project demonstrates the use of SQL and Tableau to prepare, analyse and visualise railway ticketing data.

The findings highlight opportunities to improve commercial performance and investigate operational reliability.

## Interactive Tableau Dashboards

[View the dashboards on Tableau Public](PASTE_YOUR_TABLEAU_PUBLIC_URL_HERE)

## Data Source

Add the original dataset provider and source URL here.

## Notes

Sales value represents recorded ticket prices and should not be interpreted as net revenue after refunds unless refund adjustments have been applied.

Operational percentages are based on ticket transactions rather than distinct train services.
- Checking date formats and converting date/time columns to appropriate SQL data types
- Reviewing the prepared dataset before visualisation

The SQL script is available in the `sql` folder.

## Dashboard 1: Railway Revenue & Ticket Sales

![Railway Revenue Dashboard](dashboards/Railway_Revenue_Dashboard.png)

### Key Findings

- Total recorded ticket sales value: **£741,921**
- Average ticket price: **£23.44**
- Advance tickets generated the highest recorded sales value.
- Standard Class contributed more sales value than First Class.
- Anytime tickets had the highest average ticket price.

### Business Recommendations

- Investigate Advance ticket demand and pricing opportunities.
- Analyse sales volumes alongside average ticket prices.
- Evaluate First Class demand and commercial performance.

## Dashboard 2: Railway Operational Performance

![Railway Operational Dashboard](dashboards/Railway_Operational_Dashboard.png)

### Key Findings

- **86.8%** of recorded ticket transactions were associated with on-time journeys.
- **4,172** ticket transactions were associated with delayed or cancelled journeys.
- Technical issues were the largest recorded disruption category.
- Peak departure hours were approximately **06:00 and 18:00**.

### Business Recommendations

- Investigate recurring technical issues and preventive maintenance priorities.
- Review capacity and resource allocation during peak travel periods.
- Strengthen contingency planning for weather-related disruptions.

## Conclusion

This project demonstrates the use of SQL and Tableau to prepare, analyse and visualise railway ticketing data.

The findings highlight opportunities to improve commercial performance and investigate operational reliability.

## Interactive Tableau Dashboards

[View the dashboards on Tableau Public](PASTE_YOUR_TABLEAU_PUBLIC_URL_HERE)

## Data Source

Add the original dataset provider and source URL here.

## Notes

Sales value represents recorded ticket prices and should not be interpreted as net revenue after refunds unless refund adjustments have been applied.

Operational percentages are based on ticket transactions rather than distinct train services.
