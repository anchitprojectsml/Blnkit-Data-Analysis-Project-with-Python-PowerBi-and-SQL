# End to End Blnkit-Data-Analysis-Project-with-Python-PowerBi-and-SQL
This project focuses on analyzing Blinkit (online grocery delivery) data to uncover key business insights related to sales, customer behavior, and product performance. The goal is to simulate a real-world data analyst workflow by performing end-to-end analysis using multiple tools.


# 🛒 Blinkit Sales Analysis: End-to-End Retail Analytics Project

An end-to-end data analytics project focused on analyzing Blinkit's sales, customer behavior, item performance, and outlet-level trends using Python, SQL, and Power BI.

## 📌 Project Overview

This project analyzes Blinkit sales data to uncover key business insights related to revenue, product demand, customer preferences, outlet performance, and sales patterns. The project follows a complete analytics workflow from data cleaning and SQL-based exploration to dashboard creation and business recommendations.

## 🎯 Business Objectives

The main objectives of this project are:

- Analyze overall sales performance across items, categories, and outlets
- Identify top-performing and underperforming products
- Study customer preferences using item ratings and purchase patterns
- Compare outlet performance by size, type, and location
- Generate business insights that can help improve revenue and operational efficiency

## 🗂️ Dataset

The dataset contains Blinkit retail transaction and outlet-level attributes such as:

- Item identifier
- Item type / category
- Fat content
- Outlet identifier
- Outlet size
- Outlet location type
- Outlet establishment year
- Sales
- Rating
- Visibility

## 🛠️ Tech Stack

- **Python**: Pandas, NumPy, Matplotlib, Seaborn
- **SQL**: PostgreSQL / MySQL
- **BI Tool**: Power BI
- **Environment**: Jupyter Notebook

## ⚙️ End-to-End Workflow

### 1. Data Collection
- Imported raw Blinkit sales data
- Reviewed dataset structure, column types, and business meaning of variables

### 2. Data Cleaning & Preprocessing
- Handled missing or inconsistent values
- Standardized column names and formats
- Checked duplicates and invalid entries
- Converted categorical and numeric fields into analysis-ready format
- Created derived metrics where needed

### 3. Exploratory Data Analysis (Python)
Performed analysis on:
- Total sales and average sales
- Product category performance
- Outlet-wise sales contribution
- Item visibility and rating patterns
- Fat content and item-type trends

### 4. SQL Analysis
Used SQL queries for:
- Aggregation and grouping
- Top/bottom item and outlet ranking
- Category-wise revenue contribution
- Outlet location comparisons
- Trend and performance breakdowns

### 5. Dashboard Development (Power BI)
Built an interactive Power BI dashboard to visualize:
- Total Sales
- Average Sales
- Number of Items
- Average Rating
- Sales by Item Type
- Sales by Outlet Size
- Sales by Outlet Location
- Fat Content Analysis
- Outlet Establishment Trends

### 6. Insight Generation
Combined Python analysis, SQL outputs, and dashboard visuals to derive business insights and recommendations for stakeholders.

## 📊 Key Analysis Areas

- Sales performance by item category
- Outlet-wise and location-wise analysis
- Fat content and customer preference trends
- Product visibility and rating analysis
- High-performing vs underperforming items
- Store format and outlet size comparison

## 📈 Key Insights

- Certain item categories contribute significantly more to total sales than others
- Outlet performance varies based on location tier, size, and establishment year
- Customer ratings help identify well-performing and weak product segments
- Product visibility may influence purchasing behavior, but not always positively
- Some outlet formats generate stronger sales despite carrying similar product categories

## 💼 Business Recommendations

- Increase focus on high-performing product categories and profitable outlets
- Reassess inventory strategy for underperforming categories
- Use customer rating patterns to improve low-rated products
- Optimize product placement and visibility for better conversion
- Target outlet-specific strategies based on location and size performance

## 📊 Dashboard Features

The Power BI dashboard includes:

- KPI cards for Total Sales, Average Sales, Number of Items, and Average Rating
- Sales by Item Type
- Sales by Outlet Size and Outlet Type
- Outlet Establishment Trend
- Fat Content Analysis
- Outlet Location Analysis
- Interactive filters and slicers for better exploration


## 📁 Project Structure

```bash
Blinkit-Sales-Analysis/
│
├── data/
│   └── blinkit_sales.csv
├── python_analysis/
│   └── blinkit_analysis.ipynb
├── sql_queries/
│   └── blinkit_analysis.sql
├── powerbi_dashboard/
│   └── blinkit_dashboard.pbix
├── screenshots/
│   ├── dashboard-overview.png
│   ├── sales-by-item-type.png
│   └── outlet-analysis.png
└── README.md
```

## ▶️ How to Run

### Python Analysis
```bash
pip install pandas numpy matplotlib seaborn
jupyter notebook
```

Open the notebook from the `python_analysis/` folder and run the analysis step by step.

### SQL Analysis
- Import the cleaned dataset into your SQL database
- Run the queries from `sql_queries/blinkit_analysis.sql`

### Power BI
- Open the `.pbix` file from the `powerbi_dashboard/` folder
- Refresh the dataset connection if needed

## 📌 Results

This project demonstrates how retail sales data can be transformed into actionable business insights using an end-to-end analytics workflow. It combines data cleaning, SQL querying, exploratory analysis, interactive dashboarding, and business storytelling.

## 🚀 Future Improvements

- Add customer segmentation using clustering
- Build sales forecasting for outlet-level demand
- Create a Streamlit dashboard version
- Automate the pipeline using scheduled refresh


## 👤 Author

Anchit Shirvastava 

Aspiring Data Scientist  
