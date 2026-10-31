# UK Railway Data Analysis

## Project Overview

This project analyses UK railway ticket sales and operational performance using **MySQL and Tableau**.

The objective is to understand ticket sales patterns, identify peak travel periods, evaluate operational performance, and provide data-driven business recommendations to improve railway operations and commercial performance.

## Tools Used

- **MySQL Workbench:** Data exploration, cleaning and validation
- **Tableau:** Data visualisation and dashboard development
- **CSV:** Data storage and transfer
- **GitHub:** Project documentation and portfolio presentation

## Business Questions

1. What are the most popular railway routes?
2. What are the peak travel times?
3. How does revenue vary by ticket type and class?
4. What is the on-time performance?
5. What are the main factors contributing to disruptions?

## Data Cleaning and Validation

The SQL data preparation process included:

- Checking for duplicate records using `ROW_NUMBER()` and `GROUP BY`
- Checking for missing values using `IS NULL`
- Inspecting categorical values for inconsistencies using `DISTINCT`
- Standardising selected delay-reason categories using `UPDATE`
- Removing leading and trailing spaces using `TRIM()`
- Checking date formats using `STR_TO_DATE()`
- Converting date and time columns to appropriate SQL data types using `ALTER TABLE`
- Reviewing the prepared dataset before importing it into Tableau

The SQL script is available in the [`sql` folder](sql/).

## Dashboard 1: Railway Revenue & Ticket Sales

![Railway Revenue Dashboard](dashboards/Railway_Revenue_Dashboard.png)

### Key Findings

- **Total recorded ticket sales value:** £741,921
- **Average ticket price:** £23.44
- Advance tickets generated the highest recorded sales value across ticket types.
- Standard Class contributed more sales value than First Class.
- Anytime tickets had the highest average ticket price at £39.20, while Advance tickets had the lowest at £17.61.

### Business Recommendations

- Investigate Advance ticket demand and opportunities to optimise pricing.
- Analyse ticket sales volumes alongside average prices to identify revenue opportunities.
- Evaluate First Class demand and explore strategies to improve commercial performance.

## Dashboard 2: Railway Operational Performance

![Railway Operational Dashboard](dashboards/Railway_Operational_Dashboard.png)

### Key Findings

- **On-time performance:** 86.8% of recorded ticket transactions were associated with on-time journeys.
- **Delayed and cancelled transactions:** 4,172
- Technical issues accounted for approximately 40.2% of recorded delayed and cancelled transactions.
- Weather conditions were the second-largest recorded disruption category.
- Peak departure hours were approximately **06:00 and 18:00**, with 3,112 and 3,113 recorded transactions respectively.

### Business Recommendations

- Investigate recurring technical issues and review preventive maintenance priorities.
- Review operational capacity and resource allocation during morning and evening peak periods.
- Strengthen contingency planning to minimise weather-related disruptions.

## Tableau Dashboards

This project includes two Tableau dashboards:

1. **Railway Revenue & Ticket Sales** — Analyses ticket sales value, pricing patterns and ticket classes.
2. **Railway Operational Performance** — Examines punctuality, peak travel periods and contributing factors to disruptions.

Dashboard screenshots are available in the [`dashboards` folder](dashboards/).

The Tableau packaged workbook (`.twbx`) is available in the [`tableau` folder](tableau/), allowing users with compatible Tableau software to explore the analysis.

## Project Structure

```text
UK-Railway-Data-Analysis/
│
├── data/
│   ├── railway_raw.csv
│   └── railway_cleaned.csv
│
├── sql/
│   └── railway_data_cleaning_and_validation.sql
│
├── dashboards/
│   ├── Railway_Revenue_Dashboard.png
│   └── Railway_Operational_Dashboard.png
│
├── tableau/
│   └── UK_Railway_Analysis.twbx
│
└── README.md
```

## Conclusion

This project demonstrates the application of SQL and Tableau in a Business Intelligence workflow, from data exploration and preparation to dashboard development and business recommendations.

The findings highlight opportunities to improve railway ticket sales performance, investigate operational disruptions and support data-driven decision-making.

## Data Source

**Dataset:** UK Railway Ticketing Data

**Source:** [Insert original dataset provider and URL]

## Notes

- Sales value represents recorded ticket prices and should not be interpreted as net revenue after refunds unless refund adjustments have been applied.
- Operational percentages are calculated using ticket transactions rather than distinct train services.
- Data quality checks were performed before visualisation. Records were only modified where standardisation or data type conversion was required.
