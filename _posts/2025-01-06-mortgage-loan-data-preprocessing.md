---
layout: post_layout
title: "Mortgage Loans - Data Preprocessing"
date: 2025-01-06
tags: [python, data analysis, time series,]
categories: [Featured]
images:
  - assets/img/mortgage-loans.jpg
---

Data wrangling is often the unsung hero in any data analysis project. In this project, I took a messy, raw mortgage loans dataset and transformed it into a clean, structured, and insightful resource for further analysis. Let me walk you through the steps I took and the challenges I overcame along the way.

<br>

## Understanding the Raw Data

The journey began with an in-depth exploration of the raw dataset. The dataset contained several issues:

- Inconsistent formats: Numerical and ratio values were not standardized; some percentages are in decimal (e.g. 1.5 for 1.5% instead of 0.015).
- Missing and incomplete data: Many records had missing entries, which could lead to biased analyses if not properly addressed.
- Redundant information: Some columns contained irrelevant data.
- Outliers: Some loans are extremely large given small asset value, or people below 18 years old with more than 18 years of working experience.

By closely examining the dataset, I was able to identify these issues early on, setting the stage for a robust data wrangling process.

<br>

### Step 1: Data Cleaning

**Handling Duplicates and Missing Values**

One of the first tasks was to address duplicates and missing values. 

<img src="https://raw.githubusercontent.com/Hoale2908/Mortgage_Loans_Data_Preprocessing/refs/heads/main/missing%20values.png" class="post-image">

<br>



I employed strategies such as:

- Imputation: Where logical, I imputed missing values using statistical measures (e.g., mean or median) from the surrounding data.  
<img src="https://raw.githubusercontent.com/Hoale2908/Mortgage_Loans_Data_Preprocessing/refs/heads/main/fill%20missing%20values.png" class="post-image">

<br>
- Removal: In cases where imputation was not feasible or would compromise data integrity, I removed the problematic records.

<img src="https://raw.githubusercontent.com/Hoale2908/Mortgage_Loans_Data_Preprocessing/refs/heads/main/clean%20loan%20amount.png" class="post-image">

<br>

- Exclusion: Below is an example where some categorical features are removed if more than 97% of data are in one group, adding none to little meaning to the prediction model.

<img src="https://raw.githubusercontent.com/Hoale2908/Mortgage_Loans_Data_Preprocessing/refs/heads/main/remove%20redundant%20columns.png" class="post-image">

**Visualizing the Transformation**

Visualizations played a key role in understanding the impact of the data wrangling process. Here are two charts generated directly from the notebook that highlight the transformation:

*<center>Before Data Wrangling</center>*

<img src="https://raw.githubusercontent.com/Hoale2908/Mortgage_Loans_Data_Preprocessing/refs/heads/main/pv%20before.png" class="post-image">

<br>

*<center>After Data Wrangling</center>*

<img src="https://raw.githubusercontent.com/Hoale2908/Mortgage_Loans_Data_Preprocessing/refs/heads/main/pv%20after.png" class="post-image">

<br>

In the “before” chart, you can see the raw state of the dataset. Notice the blue dashed line emphasizing the outliers in Property value. These visual comparisons clearly showcase the improvement in data quality, making it a perfect foundation for deeper analysis.

<br>

### Step 2: Data Transformation

Once the dataset was clean, I focused on transforming the data into a format that could be easily analyzed.

**Re-calculate Features**

Some of the features were products of others and therefore need to be updated accordingly after adjustments in the original features. For example:
- Loan-to-Value Ratio: Once Loan amount and Property value are cleaned, the ratio LTV should also be updated. 
- Debt-to-Income Ratio: This ratio is based on the loan amount and income, so it must be updated as well. Furthermore, the initial number formatting was inconsistent (i.e. 1.5 and 0.015 for 1.5%); recalculation helps avoid this problem. 

**Standardization and One-Hot Encoding**

To prepare for modeling, I transformed features with high skewness and encoded categorical features. This step will help reduce model bias.

<img src="https://raw.githubusercontent.com/Hoale2908/Mortgage_Loans_Data_Preprocessing/refs/heads/main/feature%20engineering.png" class="post-image">

<br>

## Conclusion

This project demonstrates that effective data wrangling is more than just a preliminary step—it’s a transformative process that can turn a messy dataset into a reliable and insightful resource. By meticulously cleaning, transforming, and enriching the mortgage loans dataset, I ensured that subsequent analyses would be both meaningful and accurate.

Feel free to explore the notebook and see the detailed code and transformations in action. Happy data wrangling!

To view the notebook, [click here](https://github.com/Hoale2908/Mortgage_Loans_Data_Preprocessing/blob/main/code.ipynb).