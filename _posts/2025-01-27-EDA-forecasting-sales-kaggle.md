---
layout: post
title: "Forecasting Sticker Sales: EDA & Preprocessing with Time Series"
date: 2025-01-27
tags: [python, data analysis, kaggle, time series,]
images:
  - assets/img/kaggle-forecasting-sticker-sales.png
---

Forecast Sticker Sales is a playground competition hosted by Kaggle. The dataset was divided into `train` and `test` sets with 230130 and 98550 entries, respectively, for the sales of the 5 types of Kaggle stickers at three stores in each of the 6 countries.

In this notebook, I explore how to use exploratory data analysis and preprocessing techniques to prepare data for modeling. Model developmet and valuation is discussed in another post. Below is the Kaggle notebook embedded for a detailed walkthrough:

<div class="responsive-iframe">
  <iframe 
    src="https://nbviewer.org/github/Hoale2908/kaggle_forecasting_sticker_sales/blob/main/forecasting-sticker-sales-eda-preprocessing.ipynb"
    frameborder="0" 
    allowfullscreen>
  </iframe>
</div>

<style>
  .responsive-iframe {
    width: 100%;
    height: 0;
    padding-bottom: 56.25%; /* 16:9 Aspect Ratio */
    position: relative;
  }
  .responsive-iframe iframe {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
  }
</style>

### Working with Time Series

This is the first time I process a dataset with time series so indeeds I had to find a book to learn about the necessary libraries and methods, common approaches for data cleaning and data transformation. [This book]() was extremely helpful in providing me with these foundations. 

- **datetime** is such a powerful library to convert string to date and/or time; create new data by decomposing/composing date into quarter, month, week, week of year, day of week, etc; compute moving average; and so on.
- There is usually trends or seasonality in time series, so we can't simply drop missing values or impute them with mean or median.
- Imputation of time series data need to take into account the direction in which existing data is used.

### Finding external data

Sales cannot increase or decrease by themselves or by time passing by; there must be a reason behind it. That means we can't based only on `date` to forecast. Potential reasons could be location and time. Location in this context is the difference in economics, or demand in each country which may correlated with a country's GDP or CPI. As such, I tried to find this information to improve the model. 

After searching through popular public sources for GPD and CPI, I could find it from another dataset on Kaggle but it was not very helpful. Some products, and/or stores, and/or countries show correlation with either one of the two indices, but it is not consistent. Fortunately, another Kaggler finally found another dataset with GDP of which the sticker sales show strong correlation with. I haven't updated my notebook with this information though.

### Creating pipeline and function

Throughout my project, I realized that I would have to performed the same tasks at least twice: once for the train set, and once for the test set. It therefore makes sense to create functions for these repetitive tasks. 