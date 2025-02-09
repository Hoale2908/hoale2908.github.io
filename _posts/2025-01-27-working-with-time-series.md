---
layout: post_layout
title: "Working with Time Series"
date: 2025-01-27
tags: [python, data preprocessing, kaggle competition, time series,]
categories: [Reflection]
images:
  - assets/img/boston-public-library.jpg
---
*Boston Public Library, Christmas 2024.*

Forecast Sticker Sales is a playground competition hosted by Kaggle. The dataset was divided into *train* and *test* sets with 230,130 and 98,550 entries, respectively, featuring sales of the 5 different Kaggle stickers at three store chains over 6 countries from 2010 to 2019.

This blogpost is my reflection on working with time series data and particularly on how to use data visualization and preprocessing techniques to prepare data for modeling. Full notebook [here](https://www.kaggle.com/code/hoale2908/forecasting-sticker-sales-eda-preprocessing).

### Working with Time Series

This is the first time I process a dataset with time series. I started with learning about the necessary libraries and methods, common approaches for data cleaning and data transformation. [Introduction to Time Series Forecasting with Python](https://www.google.com/books/edition/Introduction_to_Time_Series_Forecasting/-AiqDwAAQBAJ?hl=en) by Jason Brownleee was extremely helpful in providing these foundations. 

- *datetime* is such a powerful library to convert string to date and/or time; create new data by decomposing/composing date into quarter, month, week, week of year, day of week, etc; compute moving average; and so on.
- There is usually trends or seasonality in time series, so we can't simply drop missing values or impute them with mean or median.
- Imputation of time series data needs to take into account the direction in which existing data is used.

### Looking for external data

Sales cannot go up or down by itself or just with time passing by; there must be a reason behind it. That means we cannot based solely on *date* to forecast. Another potential driver could be location. Different locations means different economies, customer tastes, etc. which may correlated with a country's GDP or CPI. As such, I tried to find this information to improve the model. 

After searching through popular public sources for GDP and CPI without any luck, I finally found another dataset on Kaggle that has GDP and CPI of all 6 countries. But it was not very helpful; some products, and/or stores, and/or countries showed correlation with either one of the two indices, but it was not consistent. 

Fortunately, another Kaggler finally found another dataset with GDP with which the sticker sales show strong correlation. I didn't updated my notebook with this information due to time constraint.

### Creating pipeline and function

Throughout my project, I realized that I would have to perform some tasks at least twice: once for the train set, and once for the test set. Each of these tasks may contain multiple lengthy lines of code. Therefore, I createed functions for these repetitive tasks. 

___

This competition was concluded on Jan 31, 2025. I stood at 2025/2723 on the public leaderboard with 0.33670 MAPE. Although it was not a fantastic result, it marked the second competition that I actively participated on Kaggle and helped me learn how to work with time series. 

Cheers to courage and new knowledge! 🍻